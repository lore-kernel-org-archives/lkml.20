Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6BB355049;
	Tue, 22 Sep 2026 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085884; cv=none; b=fmrc32aj7puCSToaQKMevS5wp9FAYMx6Jzo07OMyo6TUZd2JIMtD0C6x1367f/HChLuJxD/N1Oz7e/ToqyN3XKyNMrpSk3ETMOh/ZW4j3cGIbEcrBDAozr+rPmuvetNdrTSxBqMR+kUxNcGrvDlMpDUrTu1qfLfvfvC+78EoyAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085884; c=relaxed/simple;
	bh=0xFKdXD2wDEbe2wvrix/CuFLqBR8mf2RGIhagWDB0ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSxK/8TZE5GjEEDqXfxC1/FGAbYBT4dNX8hDFh0d9Hl+LG9mhK/uu6/3JIXj5kyVQiK1GOrUO1v+R5BhnkEJfEdqrrG7y+ffaOYbzNh/QegT2HkKxvScSnOGhY6lqy5pFrmS4TIR+8ouUqJ/mly2YDS8FELX9FW2c4YK/12tApY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gz6rMhUi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gz6rMhUi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0964A1F000FF;
	Tue, 22 Sep 2026 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790085882;
	bh=4U1ZbDcnirO+55gF4TQ9ickIbASTjPQbJyLywBSoYj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gz6rMhUiFZQs/2Inq5QL9XIPQeRST9IN90jsFRPXZJ4Z3Are8QQpI3YwkXos2QaSk
	 Ua904VnAjtaM0IO2/TpnC2fXVDMvf8Rlsbz5XRWJtEm+l6gVdWmmG0DkzHj4qUgohV
	 IvvSxH+0ZS31cHl5MthOO55H/2MZCxcinriRXhCIo88km38olC5BA42ZpN5ls/Ak8N
	 jd/CCFKvWRXSCMyRb5MIgiyFpR6P1ML6IFiCvCezimKqsu43XTVYpFIxRRjryUJkcq
	 Kieb8HSEIuSoqE9kaAu63KeoVrvTBVqjUbwa1wd3LGskkSa+QffuCuUGOMMOxo5l+O
	 fJuzXGT++pmsQ==
Date: Tue, 22 Sep 2026 16:04:38 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Damien Le Moal <dlemoal@kernel.org>, Hui Peng <benquike@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the scsi-mkp tree
Message-ID: <arKK9oq5wi9mIHHZ@ryzen>
References: <arKETtHsac_ZwVc4@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKETtHsac_ZwVc4@sirena.co.uk>

Hello Mark,

On Tue, Sep 22, 2026 at 03:36:14PM +0200, Mark Brown wrote:
> From: Mark Brown <broonie@kernel.org>
> Date: Tue, 22 Sep 2026 14:07:31 +0200
> Subject: [PATCH] libata: Fix up semantic conflict in ata_scsi_set_sense()
> 
> /tmp/next/build/drivers/ata/libata-scsi.c: In function 'ata_scsi_pass_thru':
> /tmp/next/build/drivers/ata/libata-scsi.c:3575:25: error: too many arguments to function 'ata_scsi_set_sense'
>  3575 |                         ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0, 0);
>       |                         ^~~~~~~~~~~~~~~~~~
> /tmp/next/build/drivers/ata/libata-scsi.c:206:6: note: declared here
>   206 | void ata_scsi_set_sense(struct ata_device *dev, struct scsi_cmnd *cmd,
>       |      ^~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/ata/libata-scsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
> index afc2bad677bb9..e380d1b68101a 100644
> --- a/drivers/ata/libata-scsi.c
> +++ b/drivers/ata/libata-scsi.c
> @@ -3572,7 +3572,7 @@ static unsigned int ata_scsi_pass_thru(struct ata_queued_cmd *qc)
>  		unsigned int multi_count = 1 << (cdb[1] >> 5);
>  
>  		if (!dev->multi_count) {
> -			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0, 0);
> +			ata_scsi_set_sense(dev, scmd, ABORTED_COMMAND, 0);
>  			return 1;
>  		}

Your resolution looks correct.

This is the second conflict.

The previous conflict can be fixed by SCSI maintainers rebasing
15de2788c91cc407f7e6fc6a07be27b10048cbce on top of v7.3-rc2.

I think that would be nice, such that SCSI maintainers will not
need to report a conflict resolution when sending their PR
(as the conflict is against v7.3-rc2 which is already on master).



This second conflict is trivial.

I can intentionally wait until the second week of the merge window to send
the libata pull request (assuming that SCSI sends it the first week).

That way this simple conflict (the one reported by Mark in this email)
resolution will only need to be reported in the libata pull request, and
not in the SCSI pull request.


Kind regards,
Niklas
