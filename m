Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794474593;
	b=QGqxMeEa7oszcROab4UN+IOgHfLYnhwe5MwZNxio2TJAG6UxcrezanazapSzqud9QCyV
	 n8Jvd0gBtOTeW0mVyC4KWw1H3w5VVYz0P2wEp9wKxPhcHw7zPsPhANRvsp9p71AKxEAEw
	 IVFZoXFRvg2p0DBd+8y4gyK92XAJQVpXeXc0zEYLfyHtbtdNUxLKthRQaSA+JBYZPPtIR
	 1KWLAjmgRC0C8Zo0cpAGXi+S6plcz8y5k453ydGZ64KV0boHNpREO+moBapWDwqOAynYn
	 CJ1g5aDwpiJGCnh3PqNTdX0ltQqruvw+4OFLd5sRlyEfy0Cg+AMAvYVWoQJG5QmY4+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=41TLMfuT+52fzNjjd3TBUzig4DGCNHOs3ZzjuOR8gQQ=;
	b=c+6nRLNtLMcV2OTWC3lQPK+Q/c4R4ilD3X0lAoWJ8kbjTmbL1SWcfQoAP82XHtArubbL
	 pkAbgkD8AIQjQ9EgHx20k5VhzaaTov1CLlcb9vr3bz+GKXW2y4MfQp0rfzSQ8OIiSz9K0
	 d8yU13oNDaag7F/6ReZBgC3dQXSDDX31Iq9CiB8stouAC/rz+YRdzrY7PENe5GHqvdju2
	 u/mPqmTKWZN9Emv2sR7Easn5q+/HR4J+rcGhzH6fkd5D3cUoaWw96kzelI/8Z3/DMgJ3Z
	 UXIfkhpv35PiJsckAaEV4BTJ6GGoJX7e2sZgPXdV059TectH/XdNieHGwkEPbytMoTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8dHr9sK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EDE606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20EDE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8dHr9sK
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so2166673a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794474592; cv=none;
        d=google.com; s=arc-20260327;
        b=MFW9N0diYhuOFXSjz/lYHDuTzblhPxeHqK+ksp1qmNIBKIDwDwT6AFKUyb+5krhB58
         nxR5mcBQodEioPgVKZ5iQ5diQNoeRZkiC6F2afGv5wV/Fn7V+ePrt+QwJe6t3shUhrpn
         dSL0hKWfPeKzlxlQpmWdGjGVUT8w4Ev92vQiaHLDzqNgjPS68uyIxY5CtPXiLSsG76Ee
         R/cCihsPdX0HBBdeX/03/80HZYr6K+P/ZU2C21m9sWvL7glw8+a+N+9ophRGjwzeGOwv
         IgWrEVhgGCep1GUi+UdkaooyuVrzvH1asgn42U6wxcZ2GJA2EftOq9f786wtaQq/FL8O
         SC/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=41TLMfuT+52fzNjjd3TBUzig4DGCNHOs3ZzjuOR8gQQ=;
        fh=BvyXrqViNWoEtESrXHLcIJbzR0bVh+4xNTWKh6C75jc=;
        b=AouRwlDFXYvGok8eQdrKRCItkipiKb4WAYYczaW5H1COH5ESStfpnXbc+OtxLZ3GA0
         bh9JV0pbQHf5UjTQkl9woHeBa3NwtXSImdlhsiogRFHb/fVzMIZ91vDGP5gGYhFIWPj9
         ZLVSjfNUMj2ZUJbqPTPcgynufRcevJLYdu28I5laESE6n1y1j/YTKJSRTHTlrxp8pcrq
         W1NiWSKxrMsNEdhZDmc60oiMScTLCyQV4uGIe4W5YAzaqBkKNfwU/cHImi8qX+mIqqDX
         DWBON4TGONctTLNGQFSW4yYpNbDTw+sJ4213GSkjHVEoZAQhRi8ssKSeJQlaTG7joyn2
         7vZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794474592; x=1795079392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41TLMfuT+52fzNjjd3TBUzig4DGCNHOs3ZzjuOR8gQQ=;
        b=g8dHr9sKrlebIhhpX9YJSJ9NG/s6oyEKCdlGE+CG4AkHmK3torPADx9tJZiu8b5NEy
         dN+gw0HiM4Umd3Ihvxwh+NgwcNlKRNbUYNGBaQE1636ERzzsL4c1+xlxwITvQquSrbou
         2ZCgvHZPl1Y7egA011uf4MrOdz4xwHeVZ+VJ2c92QrOq8US206cq8aB2pgnTADjZ8vfo
         4jbe5/Tbu0PIPzOjggmhkjpeaRPI4tQ0gVgjUlhUDAzqyyObN+fuTFk6azxTl51/moWP
         zd2L/gbWd+xenUecb1MeD0VJ1li2SWW/y2UQL0AlJe9qV5M4jPyqnNFsOikeUqD1lObD
         Unaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794474592; x=1795079392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41TLMfuT+52fzNjjd3TBUzig4DGCNHOs3ZzjuOR8gQQ=;
        b=RFPhfHc3ZEhjY3WznO6qwTmkgK2phPUYsg12w52ZnXMb2XgTGU+IeILVh5hHe0Z8g6
         uSfxiPtibd65VsVY7fw90znZgKh0sK8+syUBDMAdWUOs45/YNOWakEX9DDg1kyEpw3Lk
         jpXg6QTXxsotFcmcRlSykyyh1uGQY1xjTjdw7W5L4DUTYoa3EkpePlujTXDGoBjOlF+E
         zLVMus2u04hX5KRWkmonI5oWaQ14lHTgd1BRFqKb51uqLb40Z1wuSSKqcCECfwKHMBFL
         ykZJIDWKYZtQpi7CWd8M20atI1ILKEGxFdwP6il5BNtVs0vAJSmqLK3800dx9iLFyaer
         JEqA==
X-Forwarded-Encrypted: i=1; AL+hErFP7SPfoUigVZtNcF5kOOJg6fTE7shHBvWwf6zs0siQUSQodNB6VFzPBBKB23gh1ee3GTIR9EkxWhvUH6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zLEwiPA6FfDaasLXJQm3PgopGpntn91wss9vOhsCuMoeITteS
	4oHViRyWGNOVkRXf9rCAhI5ZKQ9ZBXK+yuahwTyGyM/M6ykVPzcLKMVNJEWlnhOM5VafSsQafAo
	ZbZZBnXiMANDJKa00BROmXsgGIBZUvR8=
X-Gm-Gg: AYBFou0WXCjyMpva/VzkE27/e+mEY5ifU7mj7ptYvpqGLD9kz9gpbpXQjYSRvYUtkJE
	JoIuM/EzIsS/5Jw6JnHFgnDjUtHDilPmipMlqx+fj+e3Pq2sc55ucBL+BE9sQpEzDOAty4OTGW+
	lNFe0D6hqVfHbFbs0Jg5Uq8FHkDgAEi6538j60WIWu4MWf1Y5Fb5PVULj58RohJ77K6cpoV5iDz
	NLMWCzknInDhhrpvPpsgArtqM+EWJmhtzvEemVEEso39mrlE1pC0kRfDPHJIpYrj12mlalLiEg5
	P4h3+Ypa/rj83NSTDQoNqIGpXCx+NkyMUXad/3WlcZDxRHcHjnRbUu5KtCivUZQQ8V29BK1rLr2
	npxgPrHrJkkPe6RwfnraS3N0QFVKmVJF+xG10
X-Received: by 2002:a17:90b:55c3:b0:39e:4c80:f67b with SMTP id
 98e67ed59e1d1-3b182eec04dmr4462684a91.26.1794474592451; Thu, 12 Nov 2026
 01:09:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110120743.6301-1-stefan.ghetu@nxp.com> <20261110120743.6301-6-stefan.ghetu@nxp.com>
In-Reply-To: <20261110120743.6301-6-stefan.ghetu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Nov 2026 17:09:35 +0800
X-Gm-Features: AclHuK-lbSv9CDph6_v29dZj64AdLc5AtI3F8vZxXUgTDki9rgE2Boxczom6dhQ
Message-ID: <CAA+D8AM6JnJL+6LkOEqbgtsMU0iQP6OYam4AWAxDBjuOV3VGrQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] ASoC: fsl_asrc_m2m: allow only one task at a time per
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, daniel.baluta@nxp.com, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:08=E2=80=AFPM Stefan Ghetu <stefan.ghetu@nxp.com>=
 wrote:
>
> All tasks of a stream share one pair and one set of DMA channels, and
> get_caps() advertises a single fragment, but the compress core allows
> up to 64 tasks. A second task requests the pair again and overwrites the
> DMA channels. Freeing both tasks then releases the same channels twice
> and leaves a stale asrc->pair[] entry after close.
>
> Return -EBUSY from task_create() while a task exists, and clear the DMA
> channel pointers once they are released.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_asrc_m2m.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
> index cadfebb12e7c..2e91073f14f9 100644
> --- a/sound/soc/fsl/fsl_asrc_m2m.c
> +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> @@ -471,6 +471,10 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_=
compr_stream *stream,
>         struct dma_chan *tmp_chan;
>         int ret;
>
> +       /* All tasks share the pair and DMA channels: one task at a time =
*/
> +       if (pair->dma_chan[IN])
> +               return -EBUSY;
> +
>         exp_info_in.ops =3D &fsl_asrc_m2m_dma_buf_ops;
>         exp_info_in.size =3D ASRC_M2M_BUFFER_SIZE;
>         exp_info_in.flags =3D O_RDWR;
> @@ -527,6 +531,7 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_c=
ompr_stream *stream,
>
>  err_dma_channel_out:
>         dma_release_channel(pair->dma_chan[IN]);
> +       pair->dma_chan[IN] =3D NULL;
>  err_dma_channel_in:
>         if (asrc->m2m_unprepare)
>                 asrc->m2m_unprepare(pair);
> @@ -571,6 +576,8 @@ static int fsl_asrc_m2m_comp_task_free(struct snd_com=
pr_stream *stream,
>                 dma_release_channel(pair->dma_chan[IN]);
>         if (pair->dma_chan[OUT])
>                 dma_release_channel(pair->dma_chan[OUT]);
> +       pair->dma_chan[IN] =3D NULL;
> +       pair->dma_chan[OUT] =3D NULL;
>
>         return 0;
>  }
> --
> 2.53.0
>
