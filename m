Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DC643CE53
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901614; cv=none; b=batVqzyDD1TKejHRsOu6dqtH/21vOquaTx8tmN+hZnbQo2uL7mmLzh0BfeQbCwB8rzHdS4+Xy+eZ2mkq0Dl/odPK1uSw98qapCY3sixukzuDEOHL6rDbAmxtpUAaiLF2hb9UeECmR5fzGrSfMLz17fpPJynFmF3RwpuGgq+8xUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901614; c=relaxed/simple;
	bh=kWlpNPaGDcLsuZssnoBP7oAXtejUUmyAA684fcgF9ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPXt+0XJhUMEgIkhlzMmUVzm/ddAtQy9JlMbehRXBhxVjF24zItCQrg3IRQfIUqvSoI1eVsBLnDwRJTOjjyFZQ0a52x/acL3KJJcHtL/2X5R2mEjKQnM048+HS+A2fPcKup2nTBEFKluN/LhfrfVMz7gwXhBW7popAuCEkMOYCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id EFD88227A88; Tue, 13 Oct 2026 16:26:49 +0200 (CEST)
Date: Tue, 13 Oct 2026 16:26:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] nvmet: zns: reject a NUMD whose byte count wraps
Message-ID: <20261013142649.GD14759@lst.de>
References: <20261012141239.156408-1-parri.andrea@gmail.com> <20261012141239.156408-4-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012141239.156408-4-parri.andrea@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Mon, Oct 12, 2026 at 04:12:30PM +0200, Andrea Parri wrote:
> Zone Management Receive computes its buffer size as (numd + 1) << 2 in
> u32, in nvmet_bdev_validate_zone_mgmt_recv(),
> nvmet_bdev_zone_zmgmt_recv_work() and
> nvmet_bdev_execute_zone_mgmt_recv(). NUMD is a 32-bit dword count, so
> any NUMD from 0x3fffffff up wraps.
> 
> The data length check in nvmet_bdev_execute_zone_mgmt_recv() sees the
> same wrapped value, so such a command can pass it. A data length that
> does not match the wrapped size is already rejected by that check, with
> Data SGL Length Invalid. Every site agrees on the wrapped size, so the
> target zeroes and fills only that many bytes and nothing leaks, but it
> answers a command whose NUMD asks for 4 GiB or more.
> 
> Reject a NUMD from U32_MAX / 4 up with Invalid Field, next to the
> existing check for a NUMD smaller than the report header. Computing the
> size in size_t instead would still wrap on 32-bit kernels, where
> nvmet_check_transfer_len() and req->transfer_len are 32 bits wide.
> 
> nvmet_io_cmd_transfer_len() in core.c uses the same expression and is
> left alone here.
> 
> Tested over the loop, tcp, rdma and fc transports with a zoned
> null_blk namespace: a wrapping NUMD, sent with a data length that
> matches the wrapped size, was accepted before this patch and now fails
> with Invalid Field, while ordinary NUMD values still succeed.
> 
> Fixes: aaf2e048af27 ("nvmet: add ZBD over ZNS backend support")
> Assisted-by: LLM
> Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
> ---
>  drivers/nvme/target/zns.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
> index 78d82b6ff1214..14689ca0c38af 100644
> --- a/drivers/nvme/target/zns.c
> +++ b/drivers/nvme/target/zns.c
> @@ -150,14 +150,17 @@ void nvmet_execute_identify_ns_zns(struct nvmet_req *req)
>  static u16 nvmet_bdev_validate_zone_mgmt_recv(struct nvmet_req *req)
>  {
>  	sector_t sect = nvmet_lba_to_sect(req->ns, req->cmd->zmr.slba);
> -	u32 out_bufsize = (le32_to_cpu(req->cmd->zmr.numd) + 1) << 2;
> +	u32 numd = le32_to_cpu(req->cmd->zmr.numd);
> +	u32 out_bufsize = (numd + 1) << 2;
>  
>  	if (sect >= get_capacity(req->ns->bdev->bd_disk)) {
>  		req->error_loc = offsetof(struct nvme_zone_mgmt_recv_cmd, slba);
>  		return NVME_SC_LBA_RANGE | NVME_STATUS_DNR;
>  	}
>  
> -	if (out_bufsize < sizeof(struct nvme_zone_report)) {
> +	/* From U32_MAX / 4 up, the byte count wraps and no longer matches NUMD. */

Overly long line here.

> +	if (numd >= U32_MAX / 4 ||
> +	    out_bufsize < sizeof(struct nvme_zone_report)) {

I guess to make various sanitizers happy we probably should only
calculate out_bufsize after bounds checking numd?

Otherwise this looks good.

