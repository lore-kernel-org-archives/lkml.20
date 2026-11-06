Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793934171;
	b=3nkeN5d6YwyVSi9/9xnS805445dol5JI0f46HzrHNQ+aEV84f+NC1DWhVcgr0xXFvyke
	 ODBoyGdvnuNYmUp0ARmQMLgOa5vQq1dtw/ZpqnxbDWiYQK7hKKopl6DphcHbzsr9mbNfR
	 ELEnFHYhhW1DWhUkmzFaaJ/xYCeyByAMbT/2rSpEPq2WH4yN3/YzC/NoauusTu1aLcM9H
	 q2KbuohyUQV8aNS7y82knrDpF0qEaOP+btGdYCxUjTfticijMWXP+gLG5BqGapTFCinBV
	 xKIe/svFReR2JX8i+1yVURMraTMtr3WNClSK9kC8nDtvQlUtyJLZc/Q76goFfgkT0MA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
	b=fk6zQDNL0rZDE5JfvVIQ4eqf9e17u8Emd3LQORwparL68AYDmHlKe0n9vY3DTfRIPbgy
	 s5i3qorhD68TaT+ANeG8cFCy3l4xAOx4CBoMbDNgU22ukoZ3Bjt69kFVLPv1h1hBGUsLh
	 vqrre3mkJM8Aoay2D+lxwV2jydOA1/G27aEtnueMpzC7T91ilC8AvU6NqfYxujUZeCoxk
	 ehK9SS8RTvLXkye49iVLPl+hqjo1tCp1i1xyInNjKD8+suuiGCpk2BKOVquqnU8vHWO+l
	 WM5AY6ds+wN8DeeGP8SPyOZSDe4gBZEHUCggu/DHFzbWr1W2LiQYZRYyY28rihn7slw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lO4GhCfR;
	arc=fail smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158D5606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:02:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 158D5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lO4GhCfR
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc147d86bebso159678a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793934170; cv=none;
        d=google.com; s=arc-20260327;
        b=gsqA1JtLnV3EjFooq3pY+DHIYFYwCmGI9IgriRhEpfUkwlGLx4EPlGIS0OpJYNyhIn
         ChUIH+KbF7TEiHPe6CsJRIGZjZQeC5LAKJyXLaRPTAKQvBtnC0yuObseSyR81VraF5jR
         IEKpRNQEXRXW9DGeMm3+6uBDxWUUpGw9QMDgcMJWBwzXgtq5CIRkqsG6Ud/sKIuBJoDs
         GmiiJzVWctgNeGTcI58yYBEJTcmOc/2uI1tHN8381n6lr7M9OcKlgU6jEnvVGGqrYlj7
         mkSS4otukUpaVp4PfCHK3S41raQHMKcBcSP+TtLHIR2C6mlRk4WGCIWs4El4Kuesj44W
         yEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        fh=Xw08IVW80Pza6UN6EehYtEZvU8y6o7S3N98k7PIsZqo=;
        b=D5NlTKcOJpwehomNX46X1dku319wDhiKWj7TCtuvHIkUxJRX05S4ZL1fcMp76IUKQp
         Tts7Y2qnTYzfMmWB5rUOj0FzCnXxPeI2oQzF/fAWtCP6+Gs/XCfwnfSEbgWbp+Dqfsz1
         HazGI7GtDAzvnAHPmi4cHiN+oXdHDE41HtPSiwmyzEvEbdftxewIjVL4f8Kir/xQtt7/
         ywJqbBxV4w7+rY8yyQrFPO7Yc0l5HL9ikPYM4uLwah2L2Ij5tkc9PVPd9dfVDqE+yInh
         Gbd1XMmTs0U8zvvJgE7Rywi+CBP33jELW/xTN2Eywd0JzvabVWhpU2r2Sldy9YPn7irZ
         j7Ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934170; x=1794538970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        b=lO4GhCfR/7BK9sJP+wnZzwv01sqFDJ6ywRWr7v1/5p4v1OpkpGnGEIex4w8uwuMax3
         DHlkliHKM3d49/uXXoUbrqUS6d91d3TcHYqG2ONXJxa4RXf5Gbfe+xe1svYX163eGr+Q
         gbIZB4PFTxOpM/8P0CDcnd6a4jClhYWysCAazejQOhg7CzbFEBAGN55ehTBvQuBxMYSQ
         FSr/2oNXSDtscr9W/iWqwgzH4LYPKacxvAirGvLfjWvlwea7VM1lzSBzZTLpi5HOiEU1
         zAasQsH0Ww9ieQDqgsy37/iIg2mF7kO5ZrYy77V3r6SMVeFKiAPJtGipHtzoIlXvnvIA
         9pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934170; x=1794538970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKlkPLsxQMeV+oJVtMekbD2xgsQAsa6FTULIvqAEmaw=;
        b=bAG7ZzXI5uyD0xFNiOKKY7/tKIM65YE/cuiWCY7I3hmYuZEGCCIuKk99ua8UB6oWoO
         CuDKkZrjoVZloieUFAW038meoOLVxIlXIGlzRb3NCoaBtx/GZKwae6yQExcdjQziXqqH
         imgnkrdwQhEbTFDZ5/aKNc63fUccJvQmbf792Pn2jkNLlJq6SGlNGba5TgT+nkaZKTeO
         tQkQskP4aASdRjNpZRZaxWzDetWzoewWtb+6Ua3GuGH8Dp6xfBTsmt4U4ReEMeLG9wIA
         27Rx2WlVKnQWas1Qe9HQzibEOMxITngbU2+V5uOKwAL1bqRpuXmqEaLf8elg/yPXaCtN
         05Hw==
X-Forwarded-Encrypted: i=1; AL+hErGnb6ztrKw1KnPeU6Vt9oXVk853dLK2eYxJQkm3syT5EYmggC5RCDska6U4+y6KMGzeYTYlUO56BsGDLP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xSp84gm6oOLTVlS3OLw13PpvnpmK7JXy++L9We+UBbeE7FNDn
	LvBwO8DjTINdJlWLIlyT8yh4fkWjHT8h3azFU0n6e1Qo0RAAWTYu+Tlrtvso7A3cltXR65Fmu5P
	0+RxsB984CnYroUvyneXHFeb2hdWKcUM=
X-Gm-Gg: AYBFou2kBjFwD8c9U3W7USEVocX/nS3YlAnOqKJ+meEKBNnU5DzoHbf/NHZhojtVpaY
	Z+HRQMB2gEERXJNznbBC/F04fzI8JbzcKZsgZn+P4TgFY1R0lmZF01mTHmAyY6/IVwBQwLU73VB
	pb1VJ/CsZlsKXRpmb47tCWB6ohZ6MdAzOmvSYmPJEW0WSIB+NFdSGvGk6p3cxsLtreBmhW05IYA
	VRRqx5bS2x+f/IJ/4pZJImngt6JKjGZcqmvLJiO08xsiCW+it1Z2peZOlyycJ2tJkn97snHSQUq
	choPC0kpOcd7dG2eBPCypr7mND8SaOUEDx5TOVeP9MYw6GZ94DNjARXl32QrBNXu1NTfojvHLwX
	gcX5WYbGv/y7LObj+PFrvmQLq9RvR8OiU2mt+
X-Received: by 2002:a17:90a:d88e:b0:3a4:b509:88bd with SMTP id
 98e67ed59e1d1-3b0db608eb2mr752950a91.2.1793934170297; Thu, 05 Nov 2026
 19:02:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102195228.4084438-1-Frank.Li@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 6 Nov 2026 11:02:22 +0800
X-Gm-Features: AclHuK-7yWfD5nIIYc699a1XBrVl3zaaX5gaE-98V3Kig8gZod2anKcZN_IDxRY
Message-ID: <CAA+D8APkR05hUMm+KrRhZ+dkEzppNCqD9C3jSGiG42bFziE80Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_asrc_m2m: use dma_chan directly for dma_async_issue_pending()
To: Frank.Li@oss.nxp.com
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linux-sound@vger.kernel.org>, 
	"open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev, vkoul@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 3:52=E2=80=AFAM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Use pair->dma_chan[] directly instead of pair->desc[]->chan when calling
> dma_async_issue_pending(), which is more straightforward and avoids
> dereferencing the descriptor to get the channel.
>
> Prepare to make struct dma_async_tx_descriptor private.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index c6970a7e88f3f..796a78124765f 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -257,12 +257,12 @@ static int asrc_m2m_device_run(struct fsl_asrc_pair=
 *pair, struct snd_compr_task
>
>         /* Submit DMA request */
>         dmaengine_submit(pair->desc[IN]);
> -       dma_async_issue_pending(pair->desc[IN]->chan);
> +       dma_async_issue_pending(pair->dma_chan[IN]);
>         if (out_dma_len > 0) {
>                 if (asrc->start_before_dma && asrc->m2m_output_ready)
>                         asrc->m2m_output_ready(pair);
>                 dmaengine_submit(pair->desc[OUT]);
> -               dma_async_issue_pending(pair->desc[OUT]->chan);
> +               dma_async_issue_pending(pair->dma_chan[OUT]);
>         }
>
>         if (!asrc->start_before_dma)
> --
> 2.43.0
>
