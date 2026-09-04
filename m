Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C8737F73A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537910; cv=pass; b=OR5zBx1A9HVy+QI612G+tRbvCER0Iq/+S36k4vTEBLJeOd5O78b/PN/lewoAHw3Lzzuc2zTBDJdaGI60rPa3PZW/ioWx6K+A/cHU6eQQSDL2DSpEwx5zVEStFHe/7Gh5X3NJGVq5TGslK3i4Em7lXjkN5+AJ+g79a4bFZjh+oSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537910; c=relaxed/simple;
	bh=3vcqoHjxbkKU29odZ/MlbhZ2L7DAS/GwMPMBrrZSUiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktHLzVUBhosBscQFLrmSZGYeS7LMHXuJ0dvRaE0hO7B+XVq5jtnjzii1tSoXnedLo5X8q1wyiCYtAC2O/TvW61cQDg0eBzf845Nx43gYXWF11RpwsyJsa9+enJLxZtRkwzgY+IjBidPGYRfAdiRDJx4tcrJBAV9a9FkSjq4h6wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=P29snMCS; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="P29snMCS"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53016020b2fso20294141cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:05:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788537907; cv=none;
        d=google.com; s=arc-20260327;
        b=rr+BcEPYg0TcuzXaE1mmib/VUGRQC/wA1LRc1IE326nPTref+tN0HAaJzyQxsklNyY
         1vpx1dd5vb+5wetjmk61GKDe07BXbAsWEVlhHVJdx8ecAFYD+S4OC6nBOapnrHJhvFha
         MwQLKLO1jxV5SHnmJ4VjkkM12D36lUraGpYvPquB+VrU93P//4nowpfQwURdUJ5lxfMh
         KR22XWmwtBbn1/vBG66zKyOUYFZLfMyY51lJ26KFtamUFKKQssbGTX26nwTpjsKnBuT1
         hU6rFSkeVDgUT68oOvL+t2QDpNpV6XwEsPpitfTi4s5tZAS9+sn1wz57841LRZFBCS94
         PnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vcqoHjxbkKU29odZ/MlbhZ2L7DAS/GwMPMBrrZSUiY=;
        fh=8n8WiK0uKTlDVqZ+njHPfn78qPdMhEIjaRdqyC6LBzo=;
        b=AcHoh1bndDELTTqwV7ELNOqpG1lLbmF+FhAHmao1bDsIA3x7QYpall2EMxQhNdzxp3
         +RQ8/0eVBRMc2S7+e8kpPrj0srguHpxgJaK5XxCjgUJWrYghxVfHQECmj8FXYK5vathB
         hqUTt1i9O9scIQGQeeu9OEAKXP3RoOBjmAHkew3ap7Ls4sgKXWe4oFdk0veJfKgXPB7y
         4L4Gqe07eSbAB4ELRVPHPvJ0HMwQD78vPLMSl00x1xJCE1b9JIoabMPS2Md0F5NWxUu1
         xuVHntUCji9tJIlGqxGrzkBBgNGxh4c25mImp3AFX2Ng0mJgQ3QuJE6P+TMbk+5hdsNE
         9VVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788537907; x=1789142707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vcqoHjxbkKU29odZ/MlbhZ2L7DAS/GwMPMBrrZSUiY=;
        b=P29snMCSrUdr3HJskT2x2XmkZ9HLgqYvGZtKiXOB9rJvg7h75Ruw3qBvUZ5+HK8Rk5
         mkdDItpms8HIQSyeO6jjjr10V3iLNiWVetjqlGmtmErzGOBNDhZnI9mSvuSYuEQE5C9i
         vyj59sXjbC7qQ9yrks8S3Tk1cqWIF6sp+Wu/qCfLbPQUhoKWNaTlRV4A5utuW7N4o2du
         zldIqAPk54BbpkGz0MdNP1CaMpOfJ6p9d46rl6hkSUVndk0J+V778nan67zczeMHOi9X
         ameQwu8zno35R5Bwbhb3j9/yMMqXCqTrzqHFSpQ6TA48xKvCc4tPejJ6MaBQ0IeuEviy
         Mn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537907; x=1789142707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vcqoHjxbkKU29odZ/MlbhZ2L7DAS/GwMPMBrrZSUiY=;
        b=QEQe3c5GfWRz4Shg9qpVgnGKr2p7/fV+X7Mbm/StLVsoveGYSaX/3JmDj0xIAHgo3+
         Qq1JuDwL1iYX7qhhNfiAuH2eqrn6r5rpiXgBb05oxe/mFFxzFi1AOCc8koEzWLIPDXbb
         npVoozwHdghP4NlGh8qemwZr5XKdAjh7M/gg4HycHxOA1dpVBM2BjYt19gk757UdxRU9
         6UHtNXzXAnYMNSysc9qHzquqkqYF8zqOWjAz2zNTirRv1sEGxkwsOpx2Us5utgiyb1LZ
         vOd3e4eLQyn9VZdJoD59s5m51N3dUCiIzUJlIDOUZjhWhjcOoATEMRh4YuB6IK9UsryC
         UAJg==
X-Forwarded-Encrypted: i=1; AKwUvBzJ7BMOfKfCkZYjk+N954iGKS0cXXy0tJu3lKzup7LA9bwhASwFOd8iMo44T5FSkpQE2QNTPSG25/xcgHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kvgyAxaj01ejM662LNK8CW/RmpRt/X9IMxxFswtyLwxKJUyRkJ
	LfiC/1zc9l05kuaxbxE62yTIe3kmBYr4KPYGCHVJ4gPI32rzeuXbv8n8sNpTMjOkkeln5fmH1r2
	/6HAICHzTeVu+Q/JOcO2fWGrAJt+8oyM5MhQMxtVoEw==
X-Gm-Gg: AYBFou2vypy3BdaDKjrGa8ysn1tZS1L2JqtxZi2ARaWPfFVFm1RV4kTeQtq5YgCMPVR
	vYGrEf8dTKY5jk2LBl5N+V+YDezy96sn79SAiuDYSQMJWYBRAKkFBnRinXOyMeOeKhsPCd0+beK
	40LF48VGIvfR8Ty3RJ94AHwFSk+LmHKwEi3Ok9GeZ6rMo/IznIGF/WvQOZ7X6jrKfgZtKCMTI7T
	BHfu6s6kTFabx3QvI6FI/BODIKDmVzR2iidFx18qODFnxgezPTVdKw+m3+CFHPN0Q6rygRorlP4
	hCNiCfBfTW7uBSwXaglx1dyXkMh+eXFTqWo3FlA5ThF3
X-Received: by 2002:a05:622a:4c14:b0:530:3855:e8cf with SMTP id
 d75a77b69052e-53054674fccmr81819351cf.1.1788537907041; Fri, 04 Sep 2026
 09:05:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com> <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
 <20260830222558.GB1842415-mkhalfella@purestorage.com> <4f2d2b60-56f9-4ae3-b38f-bba9754011df@grimberg.me>
 <20260830225939.GC1842415-mkhalfella@purestorage.com>
In-Reply-To: <20260830225939.GC1842415-mkhalfella@purestorage.com>
From: "Surabhi Gogte (she/her)" <sgogte@purestorage.com>
Date: Fri, 4 Sep 2026 09:04:30 -0700
X-Gm-Features: AcwNN1Ww7ukPMIsSf3t5NTJ9ZuKHOtbeoPChRBk62ipDmvtM36xAVG2ICigmM2A
Message-ID: <CAMof9cW8JFu3XG+BZc-ejG-fvsodQ9ygYbV_ttgvX=Kc_JjXJA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and startup
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Sagi Grimberg <sagi@grimberg.me>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	randyj@purestorage.com, adailey@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2026 at 3:59=E2=80=AFPM Mohamed Khalfella
<mkhalfella@purestorage.com> wrote:
>
> On Mon 2026-08-31 01:44:32 +0300, Sagi Grimberg wrote:
> >
> >
> > On 31/08/2026 1:25, Mohamed Khalfella wrote:
> > > On Mon 2026-08-31 01:00:52 +0300, Sagi Grimberg wrote:
> > >>
> > >> On 25/08/2026 1:56, Surabhi Gogte wrote:
> > >>> - ret =3D sock_create_kern(current->nsproxy->net_ns,
> > >>> + ret =3D sock_create_kern(&init_net,
> > >> I don't think we can just change this...
> > > Why we can not change it? Today the error recovery code running in
> > > worker thread will be using init_net anyway, no?
> > See commit: 1be52169c3488ef98582ed553ab35cefa3978817
>
> Thanks for the pointer. I was not aware of that. What about error
> recovery case? I _think_ it will be using init_net, no?
>

From what I gathered, reconnect and error recovery run on kworkers,
so those paths were already resolving to init_net even before this change.
If we pin the caller's netns to the ctrl, we can keep netns consistent
throughout,
if that is desired.

> Also, Will the change to sock_create_kern(&init_net) break the fix in
> commit 1be52169c348 ("nvme-tcp: fix selinux denied when calling
> sock_sendmsg")?
