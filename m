Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D093A785A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235387; cv=pass; b=b1ngwbKcAtJBmVc5xkG53Su3EDIhBjQduBvy9UdhTar/qjrjPEmwVHiYRNMrvWauZYsXszR9N3e7wIQidyYqRQoTX1iH48WVLs9lyz4k1BgMJiD54moDQjgZ0FPTvqx/DkZOGXZ3d/EJDD2VC+gpfOuYswlhBK/8oLslT/iV1pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235387; c=relaxed/simple;
	bh=g9aTtVcv9LERy+r/7+jsTWKc9sGUdMvdKz9/1Cv/8/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MANx1vevVwZSb5PVa1/3iHCz6bCGoNw6z+bNvLjcu+Fn+gDzDapDsahY2MxinW+azaafIuP6T2HtHq7zCMR5MUBYD5YTjQSh8d1m1Ag6v8ULmWYj8Yx9PkZjl0IWbPOo0IbpE2eiILKpsGMkwETTUc7bsYoz6ovmamCyZGQYr70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dh0+L9bW; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dh0+L9bW"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f74e4f3d3fso1164616b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791235384; cv=none;
        d=google.com; s=arc-20260327;
        b=fda0Z+52RWyuYCNf1iwBaV/IT9J/Th6ICKjNGDlqkkjCdiDHsxD6C/ndxtTHuHhqaU
         4HSaJ7AP5Dww5Sn3JG/GeGIQMQvlLO/SEUpQPkj3wa4nKjFn63whKMOkmiO8DuPkhZVM
         q8Nx4gk8Fo2oPIJYoimt14PlEUTPrp70XaM2nTq6oxNs2gb4SZPgzB1byt8qF3NPi+tN
         Y6meBwQIlQGLGRMxssjtJ4fYUIIEM72Rfn0TN5+JICzClICW9EEvK0IxG3cnwU0ElSRC
         DjLbfUdHO8RTkFpyDBOQ72ma3dwkrWdL138Pmp9s6mU//UpHOGy/hcTS2SXRlzqWKQgL
         wZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g9aTtVcv9LERy+r/7+jsTWKc9sGUdMvdKz9/1Cv/8/4=;
        fh=DGV2wENRFk5T0ViKkNxKTLAFqB6ibMKbmOZ6zh2oh3M=;
        b=ANGXGxHV6jmKiaDnH8ffR5dnAho0qMv1LEZMuL3BJKevvVYc2D0ZLWP7lTbwhrSfxR
         VGLW7PEhjs4VGWaXz7Jh+2PdzQF8vttKSdoQpttjXx8lkOtsRBUd5w8YQFVGVDfXtfoh
         SwB4shK/5xthUcVFNION8qykpwrE5wqNusIQLepX9LunNwj0NkZ4WU9+wmKr4ek7lYb/
         4Pe0mxiE3vJZO+YDen9wPp6qEnXq0UnZ3U6uvVh4RijtkrJp0MXIkbIQEg7rayqHI6dD
         KbaJ8aEI33NX4UkIRcCaBbhbaYLwc0iSW+Os9BJzHIJDANyEEw3dXRSA47AJzzaDQu73
         NWQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791235384; x=1791840184; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g9aTtVcv9LERy+r/7+jsTWKc9sGUdMvdKz9/1Cv/8/4=;
        b=Dh0+L9bWXRV9f+RK/dQIJVo+kLv6w4nCPBRXWYCOY+23L105Kp6XQ11EmTaABaj3qp
         F0qIISSu9AtfZx9ZDbTfi2fnCuxfWaQ2wWu0HsAgQYEO5F5ZOp7ZkvgcrIRDKpoFswUU
         /QC46o91UO5414gMYXDmnBKf6pMc2DgYlR0CC1tlI8b4KLm1YcrPMqoADaA1lhrsn88p
         5Vle/6Rmbg+GGC8k+IgzgRKManPuDSt6aIPo/wIzHOKhRi4qGkimDwuCivYd6aShjXi0
         i41+iWb72+mGo7itgMhcK2m4gV+2UNefK067Eh1zLba2DkiKtcCGfE1DAyPfdiV0E8TM
         /ufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791235384; x=1791840184;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g9aTtVcv9LERy+r/7+jsTWKc9sGUdMvdKz9/1Cv/8/4=;
        b=UDjJdLJZP+otSplUNj6953Dy4LKeu33uSxK1gavDxbr6a8qc6CTn/zQ7Hzi5jT+sV2
         F2rauTTp7Tfv7/+s+VovaA5TD86jmwRiLe/PXuyhhlRoTsSX5gzNiVznf/21UuN0kUwB
         5hn2Rsas1eLh8ZD79M+5L+w+bgCVNDEdHTuBWbitTeTo0cynTQL0f5Q3EjyA7TtBBXhi
         2vaMDaY/U4VoPNNwmPwYSLznJZ0T5NMoo37ZV18ALNNdy8dCjvCLzMey+7cH1v38K0pb
         4Q3oFWW39s1MyTMdv+DIY1v0BKi4nv+MUE5BmsZXWXd05tGlnwhNk38NAuhinPIomlqz
         +T/w==
X-Forwarded-Encrypted: i=1; AKwUvBwsDJCgohaoLepxm308WrzztOz5QLc9H1ggPnWBVtoFnMBFNaLWiGK+6kTod6V/yPCmVPluNpI2xxMn6kY=@vger.kernel.org
X-Gm-Message-State: AFuF++lvleSyNAPCi8tJo2bpTdxFlw3H2TUleHDi5h/C4Hqs9Zi1tdHR
	kCZBwfG0JV0htLzkR5gYdKDiNAvfLMcjoRnhj5nSy8jOesykMW+KiBwB+vIegNP2PcwjR4SmP6b
	hWrOzwKCQbIqyDgfK8jkOheFdJw7kGFCdmveQJQ9M
X-Gm-Gg: AYBFou0R9gLnwrs08lkLY6FkXyfcr++Fg/Cdmxhj7Hvgxu+P0KaqYNYok9T0nsLP+Xy
	avzY2I0h7QCj2nhzNfpCdxOns32anrv/4gloX8LG2ba9AFt0U4wF22LyXwVBISlV62u3Ree/XVh
	JfRR6fCejOuklxOTCdYeXtZeSXAf9kXBT+3GH1avoXVSHWNGHq8/XnwmpwwfLFR9iMtbfc1qRyL
	o5L/aR6qZxrBBzwpR4TQ/mQGPUZ1/sFLhA3l2NHe1SoJPVXIa8Lv9Dr/HG45R9C2xVDKV52M41E
	sXa1phFJahSkRHAZ+84QOiUBSBh+j555QNcxpRixqvWmjWTmYXa2oEa2eVk6FkvQkYNGAnjkYXd
	7J00AhiCdfQqnvw==
X-Received: by 2002:a05:6808:1806:b0:4cb:f21c:a79f with SMTP id
 5614622812f47-4f52a7804b3mr11596483b6e.39.1791235383765; Mon, 05 Oct 2026
 14:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005210403.3206872-1-kaifengw@google.com> <179123459939.1402591.14198806382912674675@kernel.org>
In-Reply-To: <179123459939.1402591.14198806382912674675@kernel.org>
From: Kaifeng Wang <kaifengw@google.com>
Date: Mon, 5 Oct 2026 14:22:51 -0700
X-Gm-Features: AclHuK8G4eay36SpLs-mkYBL_75mcDtYJSdl5WMYJ59dH9FYPErcubMQf24dLjo
Message-ID: <CAKkY-qMu1hmRTGKAz77AqeQ5=bD4D3AmmNH+V-Y3FduiEdUJ=A@mail.gmail.com>
Subject: Re: [PATCH net] net: devmem: check uid and netns in net_devmem_get_binding()
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, almasrymina@google.com, edumazet@google.com, 
	pabeni@redhat.com, willemb@google.com, davem@davemloft.net, kuba@kernel.org, 
	horms@kernel.org, sdf@fomichev.me, bobbyeshleman@meta.com, 
	kaiyuanz@google.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This issue was found by the Sashiko code review bot on the netdev
mailing list (Message-ID:
<179007458060.2160803.1077952399417880240@kernel.org>)
We verified it locally with a test that creates a TX dmabuf binding
via NETDEV_CMD_BIND_TX and sends packets from a socket owned by a
different UID or in a different network namespace. Without this patch,
the cross-UID and cross-netns sends succeed using the victim's dmabuf
binding ID; with this patch, net_devmem_get_binding() rejects them
with -EINVAL as expected.
