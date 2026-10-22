Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792661840;
	b=U9UHBi6TgGMB9MoPo5tHwlJzrXQpk5qC8w5MEFdZObZHUpLUGb8IfGbPW97fHeq3W/Gk
	 uH743i07TA3Pzpb7Y8lw8lvnrgcxIK0Si7lJDE/WIZmAhPQTc/D3QpXbctjJ+lv5RLYN/
	 GIa3FZJLEc7TJWaO4WISe/XRuz3z/tHcUSJqQzvLXW5SH3nTz1nuf+kYZ+lsFbsADweJr
	 /8sG0M9BbsFskRXVVnt9d7hqsgxriB5nxDGIcprPj44S/I624q3JA+DFN7k9Mhgk2+x3i
	 +Rr89mlXxCB9VDIxyhzl4qA+UFrjwJ2XMycQj0WcxEQd6/EQPrJ/Q6zSaAQcS5Ys4NQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
	b=XB5s7YzLR+dINIVofnhG6Al3RunPsCjlzhW4+kHiP/x8tYK2h5sECOAQueRs+eMboyA0
	 Lw/Zu09AGFqN3cH2lPUeh37z96J6ep56xj3duLepaAjvER1pZ53mQhJbNVVZal67i8lLb
	 eL3/S79onJoxTx5k+3t4ZhNBWPV9w7CKKmXhYlrZYcKysBOzFXAMqpsgy8N0D23uchOf8
	 AaGJMsJSXo3nFgG00RIHP9du/SNVQrvcs7KDwXqiMSs98msbKOZ85uT0e2efr2tFjcIbF
	 RrDhG2aAh0xvTPs10LSq6B4Jh8h7WNJPXeAVnfnSW4GLD14mH2XCmraLOSkAPenAvyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gW4KRLHx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9916E606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9916E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gW4KRLHx
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso649683a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:37:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792661839; cv=none;
        d=google.com; s=arc-20260327;
        b=sEDeGteJD+xVU0/mIEB+xHgqBmu1MEMd6URz55zxn+pShv17upsG6G3qXYJniCDeQ4
         gPCQw3LmzJ5sma3xD0CCRpqyheeBs5OC8D+ZeD61a23PzfVnRNTdOEXIbMgUZmpsfCoE
         OlDq1N9RYX6ZUTFWBdPxELfjos18aQxMwwB7uFj7IJ/RTFaDeOrJGUzpB/9SFBDVV9Q+
         HCAZMQUy3/Y08C8L3R/uJNVcKsbQxOcQ/VqmSQjIAy+hIbyftVS4JCJLvCU5oFZ1yasN
         kTfBgmbeINHTOF+hvIM5B9P3+CY6t4APpVHym8vF2ux/jwlnLnPv8iZOCTe4SMza7/62
         D4bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        fh=1p7pkL4gduC46hd6PJAuyjl+6i6TC9S6Whn7tt6npwM=;
        b=JgPkN6ZCQIyJHV1u9XvbmyqXAXKwQj8BXPe+wCYGcXZVbp7TCJ1rAR+UNh2suqxWcp
         mlHCHT7kS2ok4AdqLwbvgMYF20eSZdBWtzwgkO0Bq6BxG6bvrs4oRT0LmCcbnJ8wfOPA
         iVt/rSxblwZAkL0klOufhJpAqw5OsXUEYby/xG2nKOzZ69muXFOEhhecKbo9KCbHTjX4
         iao4jMR0PnwuFGpYIg1qXDGB2ykf1KkMF0Jv5gxAycPk5XPAFRU8Hsz+PYdcwRHYgM6/
         5mqOVW6W4Nbi2iP13zTcsqGa9UcdGhe76UcYpHfOR5Ztl1fg7WEUnRLYthEgrv3NZKrl
         rGxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792661839; x=1793266639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        b=gW4KRLHxSd0hAE2fY7aEtXVz8/epLuRHp6lkbrmui1+jgxEfO3BNAKb6kRtPl4BkKl
         tFShreuZKMeb0lb73hhq6uRh0VyRJE2jnyCdYqmOo//F1HyI0/izpeyFR/0D1vBZ/xmy
         OoS9sNKIRZgL88XHGJLv+o7KwV1u3rw3iJqAXQarPcs2qBwF2R0QCbwzz0xSP2oxMAUQ
         WKoF39kKI/llHIxuygGhZkIQdLV4Hmccick5aCTAoHp4cXtavNRmaYA+vlgaMK6RwpBy
         Hkod9SOyr/muqZJcEw/zf7fQLurwEvGi7g2/axmorq3x7NUEVs1WAnoaPxwB4kjsF1zf
         5J7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661839; x=1793266639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFFS1+/t5gGgfabS/98lFLo3mEoArCKzDgJBr3YYbG0=;
        b=gNf10Jy9Pc0NBHeluhWDwSxIC/D7f04FxHiNk5KG3wLsWc3v1R9Z+IN0jAX0CYU8va
         a0f2GLkUzhW82Y86TrLmw0XOVUdbiVdYc0lb2Fbro0XQ+52Xv0PDykgu0tQEICmR8eTy
         XkOBv9SnAkhp6BTfOR9ISZV7v4QRqKamBFv0ysr9h35Yn6SkOd95optzBdqlhk6X2QYH
         ag29V1TJm9iysDlE6pelKQc+rl2nrwIdi+Ghykm4NeP3CKeoiirTrF2+G1YP2xUhRe1p
         gK24pg3QKZJiIGtV2nHkXTK2xjj+iGNajgj4dBvqfjvNan8NhZHwab7vnaLtR69pmOdq
         A8hA==
X-Forwarded-Encrypted: i=1; AKwUvBwmXRcRaInq+3lNA85glL68cypy4Iy0LD3uBOcMs+4kxgEFwxdUG/2ZGWIcx1bGylTMTF+4K12tS15Nc34=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbVTIwEavO921USRhjAlnRy622PCuUy+McepA4lKgfWiWZCbZU
	7ez674a0yu0wCmDLEsT+WfIRmNu1FOwknaoqh/X0XsD2d9dQjUHwgC+8UEMPYHccCnfwaC/V9NO
	F3D90RqQJ0/z4T/tBs+1ITF9kLDSIAyA=
X-Gm-Gg: AYBFou0gEmcw2hq9XZFwIa6ZjEOzlxDwNf8fYPkolqLK4tXM2r0au0DlRmTksLgC+HT
	sgKajxgpITcwJPhwR5HJjOt9uOW1MNu0jpmMTkPB3fj5Iy0kb4qbJnrWYYqweeK7GM2qxV33hEJ
	LMgduJtQ8F1/lGqwHTEXFwUx5I7FYIHL3fMF1SSxfb71a23xvM5VtJu2n88B8hG7QXlg5GmQE96
	V0lyuzL2jtwKVLVbkesKayDnFhcksBG9Ar6W1cMSgVW24VH2xFAv5/YM6VSm1jO1n9S8ZVPkyCK
	/GM0FzYDa36EqNjnDsRD6WWkpmGkvx9QSzr+3mT+3gr1U0yzigc2kbBq44v5DNf4WhLpWjbMJ+c
	EhzDVV0CXOszdiyJwC5khZVDj9MUye9XRqBzbDg==
X-Received: by 2002:a05:6a20:c6cd:b0:3e1:3178:8d63 with SMTP id
 adf61e73a8af0-3e287e025e1mr3241635637.44.1792661838857; Thu, 22 Oct 2026
 02:37:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
In-Reply-To: <20261019-b4-imx-pcm-rpmsg-concurrent-v1-1-c1fb8c33f4db@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 22 Oct 2026 17:36:58 +0800
X-Gm-Features: AclHuK8v2lajakrSJ87vVRxpdMWjcEs90TbK_GuOR8gXyo3LH7ug2o5_RGKU8uI
Message-ID: <CAA+D8AMOW3oUoX7xJpuD=T4QJn0iDPfZqQuT1=1otZ1Dqh6otQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Flush pending work in hw_free
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Chancel Liu <chancel.liu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 2:58=E2=80=AFPM Chancel Liu <chancel.liu@oss.nxp.co=
m> wrote:
>
> From: Chancel Liu <chancel.liu@nxp.com>
>
> imx_rpmsg_terminate_all() queues the TERMINATE message to the workqueue
> and returns, while the DAI hw_free() synchronously gates the audio
> clock. The two can then run concurrently, and this concurrent access to
> the shared audio clock path can cause a stop failure or even hang the
> system.
>
> Flush the workqueue in a new component hw_free(), which runs before the
> DAI hw_free(), so TERMINATE is fully handled before the clock is gated.
> CLOSE stays the last message.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.=
c
> index 85b7c929a28a..6a0174d6c78d 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -178,6 +178,16 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_co=
mponent *component,
>         return 0;
>  }
>
> +static int imx_rpmsg_pcm_hw_free(struct snd_soc_component *component,
> +                                struct snd_pcm_substream *substream)
> +{
> +       struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
> +
> +       flush_workqueue(info->rpmsg_wq);
> +
> +       return 0;
> +}
> +
>  static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component =
*component,
>                                                struct snd_pcm_substream *=
substream)
>  {
> @@ -285,9 +295,6 @@ static int imx_rpmsg_pcm_close(struct snd_soc_compone=
nt *component,
>         struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
>         struct rpmsg_msg *msg;
>
> -       /* Flush work in workqueue to make TX_CLOSE is the last message *=
/
> -       flush_workqueue(info->rpmsg_wq);
> -
>         if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
>                 msg =3D &info->msg[TX_CLOSE];
>                 msg->s_msg.header.cmd =3D TX_CLOSE;
> @@ -624,6 +631,7 @@ static const struct snd_soc_component_driver imx_rpms=
g_soc_component =3D {
>         .open           =3D imx_rpmsg_pcm_open,
>         .close          =3D imx_rpmsg_pcm_close,
>         .hw_params      =3D imx_rpmsg_pcm_hw_params,
> +       .hw_free        =3D imx_rpmsg_pcm_hw_free,
>         .trigger        =3D imx_rpmsg_pcm_trigger,
>         .pointer        =3D imx_rpmsg_pcm_pointer,
>         .ack            =3D imx_rpmsg_pcm_ack,
>
> ---
> base-commit: 8d00cfd77ffa64477129969eec8249c8cdadc9c2
> change-id: 20261019-b4-imx-pcm-rpmsg-concurrent-1522959ba768
>
> Best regards,
> --
> Chancel Liu <chancel.liu@nxp.com>
>
