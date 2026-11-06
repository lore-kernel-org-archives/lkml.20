Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793964918;
	b=h6OLTpRw11bsQLJVW4b3VHSI3KW0QfExEwzyl5nBWDaJDEDQrAmdXeZI7xT+adQfedrX
	 nr6WLnJ4Mv/lq/DzJUoC05bDoYnOUyLCLsO7lkoSpQ2ex9fkwmQd+rrkGXtNV4/V3exgG
	 wvB5/VDbFf6+x74OlYgtJrG70yLcyi6RsUIqwRSAPobYxtVs7H1jE+A5C+wmVamSoy7aj
	 h0NPYFji8OKNmd4LfgB368qDS3Z9qb6K87bMMTajJbyPMyd5LuxuVtiXPw4rYhhYU6bSs
	 62VWh7Ic5UZmGMDDMSjkIwKaoNrZoTSnu3XpoTcprpvqS330sKrt9A/klVd6JBX0Y7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=16NvhSdACMX6i/J+q88CC7Hvp0PVE6O559cAroATpPE=;
	b=oE5enPzjGoLsn/qzn3Vfc61GaZ7uh2h7sEz10eg5FJG71Crgty3XkxeW5bKIr9YlTj9z
	 46LK68mx7x/XiBXYijRmyL01XSzq1iIy4Mv/8YwZR2pt+lSccEyGF97TvWGwxFG4S70/t
	 ZImNk4b+ftGTMdXjoL3U5cBHgCs9MIHFdPtqkL28nI2Nk2WxoQrBJEHJuyhJbw0HCPVYC
	 MlFyfH/w3YzZm6Ak0imxcmY9uwvyss+WAiHX9pswmzSCtmNneV44L5hP0m/3+Xz3XiWLo
	 KEQ2fIjJRkipTEVjo0GdcFALywXV3gshuDJs14H7R8323Ht/iYiK1CN76/qQH4PZ5Mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZFKxDaR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79E5608360C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79E5608360C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bZFKxDaR
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so295690a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793964917; cv=none;
        d=google.com; s=arc-20260327;
        b=Qk1pkGMwXHn1X56/Q6Guel1tpsMpfh/0f/GcNAiouh11kkp7MBsj2LjM8n0PK39457
         /9wgOTRAkm6bEhfYOIrnpCZVhbl3K7YFDy0Wl/iISFMSP21FB35oouK7NXtvQikKd6ei
         hZ9Pj/8We5aF4BV6JwRiNqftfHIkOZyCAoADsgopLwOsinoXmKC6fTCQ5MzujLo87WGt
         M3nDtArp38hMp2+A1fwiupX0KoBzIn8Qei+1W9f+Ns4ST5oLGzvugeDnkkM/p4KNOYkw
         NuFfid5YcG8/FxbEwIDEokhSLETlAcQUOXuft9PwsyqDN3MtAzEEj2TredjEnVfuDSYo
         xpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=16NvhSdACMX6i/J+q88CC7Hvp0PVE6O559cAroATpPE=;
        fh=mOb45ZEJ3ZEfIXDIHDgOvK2UvelE8KBfgOFRwBRDC6A=;
        b=LPPJBuAuwpM9eP3Jch+8GZAvUfJbWZ7WuTfkbOaPRloREyBqYuZiuLo41s2mRMjyoz
         WTytSsjjnctwLiV8ONspbA6ud55I03KZgunuvYXB6oQwIoLil7gWljLs1+afcF6qFyyy
         xlFsyooMKu21rjibvx+Bg3DQV13OoXgw1EdPONL6/iJXot26iMKpnLab8ofOrnOoYG3B
         lDJjiy3LIf6OvkMONJtgvNeT1QLyl1s3ehuyiEsNcYeOOt7Vn6ixsWaWyZNkZ3BEy21r
         +9OxfxSVIydji5L1UEiQyA4aM7Ef3MgBt/4On9Vy4BHNgNf3P4xvTEv6Qz9lmR/r3Oi8
         K8ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964917; x=1794569717; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16NvhSdACMX6i/J+q88CC7Hvp0PVE6O559cAroATpPE=;
        b=bZFKxDaR70YihA2zMioNe/m84Pyr//3N6YZPUPbw5YTJ/1I02rITNzPmWtFftFm2kM
         9nohl2p1mkvqXo6aG+Cr8WyVpKm123CfDFDiLL+ivWoFx7FegLBSD4hZcrlPWuiJ8NdK
         H46mJvRFk2rTrlpbYK7KiqcIeobj63tQ+GCj16LSAgMK0TwnFDWHsf4o+p15G4aVnCmM
         eLkJUFk5j0IQat6E+RBZ5WHKsiwJZ2XtyIQH52SyrSmw08vX1ag31XU02jAJNLo43yCG
         mTU0KU5CwhQflHv2btnMq8tIqgG0mRK3rN+9CC1a/BN/QwKF4O9UiCJSPggw5heNOQDX
         pCWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964917; x=1794569717;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=16NvhSdACMX6i/J+q88CC7Hvp0PVE6O559cAroATpPE=;
        b=DnoiGQn+S4sOCJwkX6b80Nbzpi9qzO3EQlTCEvH2eZ7PvbUT0ah4ZmN2IgJuROXxzL
         IjS4w4sWTs5FCvWLFzjqdZUkxVB7xOSY1ur0xQ+2Dh1nEwSXOS9u7eukKFERMY6+g+rx
         HM5ioq2pp/uxIhjM1QPtkVQCiTdvDbw21KF0uRz8nCmINLJQ97/3rTr9upL75qjJBMn4
         p4jlaMr1l8nfX10f0LZjvkbIpIia/pFy8Hybc9W4oHjr9akRoAHelDoHMqrbGq86c7UQ
         2+TSjRVE+U3FENy8jvZtLED7Ga1IfjeKuHKjEehjywDXaBtBkvqbSIxHj2hn2b5LN5dv
         HOuA==
X-Forwarded-Encrypted: i=1; AL+hErFep8pRlM52wc+86m8K+B6j9dswaX/qEyZJT2GPrbrbc742EZfe66gD3ZTx6XaAdrbURtBnHj9kSXm1MjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a2PcoLL0Q+Vuwj1R+wk5oKgCUAuJBeJx6EvSvZurdoSm8aS1w
	OE29kiE+uzKNaUjHHnWjpOMeZjNmTnBG2ULLbHDS0920V0VYVLNw1D74lYeRQqEZQDrqmeUAw0H
	U0RBqEGl+QsxIlK5wy3xM+EQVIDVL0Ig=
X-Gm-Gg: AYBFou2Bgf93QI3M4GKyn9/9oVlHaOArQ9+3bhs6NHu4ML41vdSvCeiQKDzXxa6cmNw
	wkPj5uPInjScvtbm3r/xkEu/617mYgn/ko2d+zCzuah2Qs5ozFakeHXGI1lTOP7QbtTQ2lZEI2e
	sQBM06M0LH3oXBoOiy8sPW+qq/ge1IzhgM0dkr+Lx413oGvpOY4vMANqV2hXIVrHMC3vyFLrmMb
	xRbJrIcCMbyePRwYQs0SW1XI6SO8gafeiuHRKJGckUXa8JaOaRM7u/s0uMo33iflPf9ldp5kS0X
	G7DsAYE9SxPMDoQbcqxqWkIQd6XoJDsdYygW67QHGXhnaJPvx8HOtKmreBYgrPcKEZyR4CqObGU
	zgJ8f0xm2y80bgBSLN7HifDhPblcIGj1FL9IicOVElUw1FCYy5YT8vew63JxCuVfyWjqguZPn/1
	SGm+GYRenKqJ3F8979Asq3twSWstAMiItIc0Ydcy83YTYr+pmx
X-Received: by 2002:a17:90b:270e:b0:3ab:188b:c5bc with SMTP id
 98e67ed59e1d1-3b0db6d79f6mr1962737a91.14.1793964917143; Fri, 06 Nov 2026
 03:35:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105104237.38542-1-phucduc.bui@gmail.com> <CAA+D8APoQt1uSk9R+O6Xg0zUKc4TaGbB7DJX1QvyZ6wzjDwHYw@mail.gmail.com>
In-Reply-To: <CAA+D8APoQt1uSk9R+O6Xg0zUKc4TaGbB7DJX1QvyZ6wzjDwHYw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 6 Nov 2026 18:35:06 +0700
X-Gm-Features: AclHuK9vZj_WvyDhYxVjJQKavp5g7gEsFZLIBCX-BuGPepr8Uo7-FSCeNAnboFE
Message-ID: <CAABR9nG5bVowBxTXtHZC4S3wnLNwzHMu+8upjOR9Gai+M_Rh+w@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] ASoC: fsl_sai: Address several issues in the driver
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shengjiu Wang

>
> The series looks good to me.
>
> Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
>

Thanks for reviewing the series!

I'll continue looking into other parts of the FSL audio drivers,
such as ASRC, PDM, and SPDIF, next week.

Best regards,
Phuc
