Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006834BD350
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.234
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348410; cv=pass; b=TYXEKFsbCQpKReDSfCRvxRjmxI5xwnTuLF5r9ZVfKqhFHFBBOJlx7zqgksTYoImpbxzYj4Atl86Qu56LgQ5Wy8NfWff6ymyMfYPhrzb+HmmWGvYq8GFXA1jW+3q5Y5+M6MzJ6SZy+zKY/rqdmjFzu1JCA1PYSsXgniMRxZLKphw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348410; c=relaxed/simple;
	bh=G7PD1SsyWtfXJXkRv2FlPB9lAjfDo8cMbMk/Mdw9V7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfHcudJlX4Iu9OfEFKCLhlBJHacElIvm8ZPOX+1rHCth1TgWD/0bLETeDiA/kC6mXxZyHuWC11uUb55fDiGccSpWKbpU0vRWMIqk4cFXuJ2XljIo7Xov5wSh7n6QHc/52ZunIw5lJG5BqYov7gk2As/cuJ2A+MFR5lOSL9aTTRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=VU+craBP; arc=pass smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="VU+craBP"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-5329fc7e0bcso11364361cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790348391; cv=none;
        d=google.com; s=arc-20260327;
        b=lpfgxyd7UsSKKz5Hzi1x+v0SeRbOhunq0Mm1Nt6XZEDbD5O14i+Onfspp4C3lBzjWx
         QJhsSEpMUoPZUMpg5+AtgKiE5uu3PYex2iSqT8Bnt9VKj6Hj1SupqCyohTjCYo9VMi5Y
         DCjI5e60T5mSNRWtQMx+7aYXi0D3Dvh0gFLPOMjZg6yel44a73GlNcabJbgFP/RovJOo
         dIqArlBnu4uFOERYtO+b4J4u/xXVeoxmLY23QqFiWoSSGA8wwGri9jzcQhQdAtqLHqLp
         TelYp0J9VUie+DqYHUustxb9f4DMYa4biDcj4KBlKv1pbpMeJ0JzKbsaO9u50jMg1gGY
         SvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oNCxj1Tkne1Dd9zOhmWp2sMzjpmd3KFTSPzHbdHwTl8=;
        fh=zKMVkXpXANFgw3HGJSHut3DkBYt8W6lu9IAATL2MBbI=;
        b=XUsaLfVe8Qi7rkymsS5DzlFS1OoYLTUMv6jl2VgoABqZC2VbvPqKTSxNu6HxkDrY4X
         Qu06kW2mb98T/QLr5PK7L/D/ZDFXcrL41yas8g5in8mtYCDD9Z3pa4uxuwcRpVC5wZ4L
         RjMGhtM8eBWePXpA5V63UmI2e5/DtfI0vZFEmOQqxAadP1Wu2VH3pfEG7LjgwKZ169ol
         6ltB6GIvMK8JX23lxcOEAyi6lHO2bBAuA7y1rBWAFGy6WFwkk5An1SFBJ1m7schnZILW
         W6vZ22Qp0PNrPoRd/ipmh2IvsAI2BaZBwvERgT2Ocv9EAqblZm0hq5CvfBoe62yLKC4C
         T5kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1790348391; x=1790953191; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNCxj1Tkne1Dd9zOhmWp2sMzjpmd3KFTSPzHbdHwTl8=;
        b=VU+craBP5sTfmgsks6GqGyE/aSlKFV/uYtDlbeOzYSOfhZM0LCRTW9xsMii7u5DKPP
         ee+c9I/OHN3XyjUODNRuDCK0Kc+tq2ddcB9We9B5h0V6rfU7Ena6Hzd3gZ9r2rPCXGqY
         gWDr2/Ff5lGSfoHuHqx1lh1188vB1iCslgZSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348391; x=1790953191;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oNCxj1Tkne1Dd9zOhmWp2sMzjpmd3KFTSPzHbdHwTl8=;
        b=WxobQcSL9m2LlHXaH1vFzaMgi8cJqPKHTNwBHXHxUtR4mTKFWeco1c/TXwiB+bqdSw
         yOPhdZ8DxD3QAbITs5AkPF2tJxwCr29LNipt0+GgSdCp2zIjhh8YXg6O7kgcq36QOwZg
         S8q0u9iJhLyw8osfMgJwO+8NfwhQP1jnJP0/1v2U5L8e4huFiejZyY2ILgTkyMayD836
         rQdkCNweHTSRXfSR0cKf3Ww8ITaQAuapg+EZXaytgT3gCK6v1hncPZFTCEbP120Luy8h
         d2/cwDY0op4mEq6pNWRvdbfHrAU0CRu3r4be7DLEHmprdkWLjyFjq1AzYdmsn8C/Pyzb
         dR5g==
X-Forwarded-Encrypted: i=1; AKwUvByYQYIdZDcLeZ9HA3TIDylXuyVmaxPJ5sz8tncE6aWXHTXamM4UFYLCJGEfWEMipKelk7+/Icib09kY8dw=@vger.kernel.org
X-Gm-Message-State: AFuF++lV+qROPijrsWEt2s5gkv3zbojE/s33vnGByjAXkNTwXVd5jUGN
	v4TF+tNtyIt5pgJvwz4ooQWoE+aShmrBMNItFJAHIBzpiDHkcGnlEgF6AdPuMmyBXGK8viAAoWU
	XIY8pj1m4LXw6qXV3WfIESUlQ3jQiJcOAuZTNr/nNUQ==
X-Gm-Gg: AYBFou0PRYAbE/ONa+r9bVfE88SwQL+/ShY4gllMcUGqTij22BGXMCmZH2wwHpA1nYk
	rzI0XB+Vo8SXNeB5MPadC+QyRYFbxFMmeG94O0PwadgAqbLebq4EK45PxyJyVOj1UsOlgGn2Vt6
	o4Q2heQSo+Meg7pfC292UyRrUkgj2DAzqwEyumApd26qrGmRycz5XUgTIbcQD41Nqnfj9oYxgMl
	A601UtXlK0twIBcreor5OcL8iNOvte5ubiV4DXTguNICP3KBZB+qWIZEB5rWmNs2Hks5AKrIQVQ
	/BuEuEnonaf11PLoz8NcVgTfDCedxEJ24mBpzIimubz37Lt/Ky1/o/GTaVSfYcC5t0QOoXiFRd/
	uCfcKUm7vCQ==
X-Received: by 2002:a05:622a:508:b0:530:2cc6:c8ad with SMTP id
 d75a77b69052e-5330b5ad6e9mr51539751cf.19.1790348391358; Fri, 25 Sep 2026
 07:59:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910235110.3922068-1-xmei5@asu.edu>
In-Reply-To: <20260910235110.3922068-1-xmei5@asu.edu>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 25 Sep 2026 16:59:40 +0200
X-Gm-Features: AclHuK8PxhLjayeNK4Ioc2AfP1egLwmVYg_0ZofucCJ6SB6GJuae3F4l1SVQLt0
Message-ID: <CAJfpegsxW3gf6Dj+zVKTTHx8bsASXiMboZ6UWd5WWtBMqd8WZQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] fuse: don't BUG when the copy buffer is exhausted
To: Xiang Mei <xmei5@asu.edu>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Baokun Li <libaokun@linux.alibaba.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 01:51, Xiang Mei <xmei5@asu.edu> wrote:
>
> fuse_copy_fill() hits BUG_ON(!err) once the iterator backing the copy
> runs out of pages.  Over io-uring the amount copied is not bounded by the
> payload buffer the server registered, so an unprivileged user can drain
> the iterator and panic the host - mount a FUSE filesystem with small
> payload buffers, then setxattr() a larger value:

Applied series, thanks.

Miklos
