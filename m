Received: from mta1.migadu.com (out-83.mta1.migadu.com [95.215.58.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07A7549384
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873148; cv=none; b=h1JX6/prqDJdrrFQHeGxLbx0OcQkYsVbqj6IdSOU3YVzcm15H6xyk6Etd4wF0QT3xTpE1vEDIk6+ovvR4wkDmGvORbluiqPLJgCi2wzV+HWvardU4QFAQHL96hxilGSP5E5LT7xzy9eB/NWa7qok3snQM8fKkyTkBUozUK5a3XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873148; c=relaxed/simple;
	bh=BTINXEB71p3un6Zx4FRobRD/CU0PSpH4Nhb7pyFnVBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRKe9Qsn9QRrO0qROt1pVw3zsmn4+6Xn6Op2hROJCccFEuyWF84ZS4TUNw+pZnMDAzqKhPFVue88L6WKP5ZVRmk8ceNymNwrokfsky3VVOen66UjWCnAoAtBtLuiE41pU+62KGyUuN2wXHFSpp04ssV9gORu2xQCTH/HzCaGPBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OZwAwVmp; arc=none smtp.client-ip=95.215.58.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OZwAwVmp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BTINXEB71p3un6Zx4FRobRD/CU0PSpH4Nhb7pyFnVBE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788873138; v=1; x=1789477938;
 b=OZwAwVmpkC54Wepld2n7a8bN6d+ryN0ydeXzJ+zaZmsCKFvT/Q7yXcmVg+jGugdcM9ifG8r+
 DlU0pdUI6oeOBRggsVqg+F3Rzqeb+bOSx7u61UNKa5arjl8LmfsVW2RoqXQz0RCsH6HmOvWWJ0+
 N+lMnkR9wxo4c+MUTbvG7Zlo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5cef6a7009e631ce;
	Tue, 08 Sep 2026 13:12:18 +0000
X-Mizu-Trace-ID: 5cef6a7009e631ce
X-Migadu-Flow: FLOW_OUT
Message-ID: <7492fc56-fbce-4665-ad2e-25a38685e20c@linux.dev>
Date: Tue, 8 Sep 2026 15:12:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RDMA/siw: Bound fragmented header copies by the remaining
 length
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>
Cc: jgg@nvidia.com, leonro@nvidia.com, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260908085520.1746329-1-Jeremy.Jean@oss.cyber.gouv.fr>
From: Bernard Metzler <bernard.metzler@linux.dev>
In-Reply-To: <20260908085520.1746329-1-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08.09.2026 10:55, Jérémy Jean wrote:
> siw_get_hdr() can receive an extended DDP/RDMAP header across more than
> one TCP callback. The first callback may receive most of the header,
> while the next one still limits the copy to hdrlen - MIN_DDP_HDR instead
> of the number of missing bytes. This makes the destination move past the
> end of the header and overwrite the receive state, including
> fpdu_part_rcvd. A later callback can then use a negative fpdu_part_rcvd
> value as a copy offset, which creates an OOB write.
> 

Excellent finding, thank you! That must trickle down to older stable.

> Use the number of header bytes already received when calculating the
> next copy length.
> 
> Fixes: 754209850df8 ("RDMA/siw: Always consume all skbuf data in sk_data_ready() upcall.")
> Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> Assisted-by: Codex:gpt-6
> ---
>   drivers/infiniband/sw/siw/siw_qp_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/sw/siw/siw_qp_rx.c b/drivers/infiniband/sw/siw/siw_qp_rx.c
> index b566d16..e5b641c 100644
> --- a/drivers/infiniband/sw/siw/siw_qp_rx.c
> +++ b/drivers/infiniband/sw/siw/siw_qp_rx.c
> @@ -1079,7 +1079,7 @@ static int siw_get_hdr(struct siw_rx_stream *srx)
>   	if (iwarp_pktinfo[opcode].hdr_len > sizeof(struct iwarp_ctrl_tagged)) {
>   		int hdrlen = iwarp_pktinfo[opcode].hdr_len;
>   
> -		bytes = min_t(int, hdrlen - MIN_DDP_HDR, srx->skb_new);
> +		bytes = min_t(int, hdrlen - srx->fpdu_part_rcvd, srx->skb_new);
>   
>   		skb_copy_bits(skb, srx->skb_offset,
>   			      (char *)c_hdr + srx->fpdu_part_rcvd, bytes);

Acked-by: Bernard Metzler <bernard.metzler@linux.dev>
