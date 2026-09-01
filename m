Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0373438A0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788305922; cv=none; b=SCMRdzdUBUN8GAhcfEjuELvwVeqbxQjaIjvPz291B+qF2Q18+r0LSXId5HdsGUv6M/U+lkR19pFrYal8ASe7yhpZCchdNYzpe0loYn4Mug94z6MPQoaLoeLU699LUYWiyyHLt9zluuHSZcg2jM/ZpfkK7MPCr+6ZgogGpcQDkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788305922; c=relaxed/simple;
	bh=cGvE5vL7ZOo0oM5hRftmWcAR6gasWX104/vhHVUE1J8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L/y8q5TYYMy6qtfL4/GNDHOp2gdQunbPvAXsGHD94LTk/Ibt2CkXjdDMHyWwU2E5gE4GXTdG+eBWi9fOVQFlXVXRhm+KjrhpOiaYv5siGb+aKWcfqIlQbNLoQ9uJzbykE9KY2vDVsFz3aCZozoqkAZixQFQjuecrE8gASrMK0Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMnTlg4C; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMnTlg4C"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5218927884fso6073161cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788305920; x=1788910720; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0zXX73cnLrFK6+woSudd179mzXIH5/+9TezRmmSs5A=;
        b=fMnTlg4CbD9MNGLJMEDJnnJhqDWowyiTSwts85z7+sb4xiaOX8/8hCOBlmI/d/CmC6
         Q1MUfg+JFyZEW4SnkDCUQSuc0G3lhyM0TBTe0SfBubWw3vrRmoKOIblgvulLJdF/ISZt
         nCJp20rQrPscLWntMyWG/po5wT6sVGANHrvRQDkGzTy/ai/doUClLH+bOe8RU9Gy/l34
         Yi+9PEfPQN1XGIyfspfM9dmPgEC7kNPokOzsSD8ZZfw5YwAuNwYFOCIXhe3LWAFoZUWe
         nsZ5qK3bvVvEyLTwds+rMQwPwfkwtbiSrqyHoNPHECxc70TOvnTw5ASh6xQObmChI8KK
         WXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788305920; x=1788910720;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0zXX73cnLrFK6+woSudd179mzXIH5/+9TezRmmSs5A=;
        b=oVQIoQvwIn+wdhbP6hJf7KiOMEegfqkUv31UBX/0eXy7uBIZjVWW0kEiffg35rXi5z
         V/QCIJ5M9C4y0VKO8sk06nn/xjfHc0ayQQbcYOK1q7OF+gLfD2erVPXn7f9R3Lbg67er
         vV+sxrL0uSqvug7uBJAxsau5khbGUeNOH90cjuTRHqdZcjCVMZ1wlTCE3OLhniSpCSc6
         9LXoaFFlYVmx2GyGAPdv5irqDsWbk5ADX38P88HTkj7jKGqyWimD4khh2img5UFWFqhv
         tsafWCQU5lhKpCKRPgNlgG5vx9Igkg6nYknABrhVhGAynkGm8YNnJawZCba37UFCmzgd
         vRBA==
X-Forwarded-Encrypted: i=1; AHgh+RpxLeitdUlLP5z9b7T8IkhO9XJ6wP2SevhAXmvgsILesvx/n2B9S0pXb07GlvmWEQazwYPNPa2nd2PJ1qU=@vger.kernel.org
X-Gm-Message-State: AFuF++m3vQNozMt27ht41c83a252SiCwaZOMw95xG16ioKyUH+lbt7Z8
	2but1u8f5qONqUpAzSuJRp8X8G+aD40LKzJTs3KqKmrNxZ0uoDSvJni6
X-Gm-Gg: AR+sD10Zc0lqjIj9/gHPlsu0m4D+wyyvxomFGDjjfJ7VUKHnhq9EcaLY3t/U6VAYNYs
	Sjh6N+6x9MCORUtNHRjfxnRHw4ZG38f89tcqDAsPreodcS5icwQYCERdG29JYZ0+6cv7PZkDM+E
	wBufzcrYp7IYkP7NV2eN56QXYqBdpCJ0lsIX9n/+6OoSk+b5hlioBvOxxPuvM9lwacxN8wy1Bav
	k8G/6clJHO6qd+e75OVziq4uHbQ/UEvh6lklMN1Iaj1zS89gtopWNhrlBr04ols4WtJXx21tW3o
	yxecYl4fpvV171uFP6PbNVLNQ+lxPcOhJkc/wEskht99dtq7cKUUlZTqdGOHEaKiteQ8pyOXyX+
	apU1vfel6d2fGDWfgDaCJBu/u98/e1k8HtmNZvvqDUz15MyQhnWdRWfhmJIBTWXJH1eRIHtrYbK
	SDU7HzDenrmKRZSy2/ZWXfPYtBu49Q1n/OZD+9hPTS7RyKDMMD3qW23mXBTijRD4e9eyU=
X-Received: by 2002:a05:622a:22aa:b0:52e:4831:cdc4 with SMTP id d75a77b69052e-53036b93345mr8598201cf.7.1788305919934;
        Tue, 01 Sep 2026 16:38:39 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5303323faddsm7251121cf.25.2026.09.01.16.38.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 16:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 19:38:38 -0400
Message-Id: <DL4DJHDX94CE.2NZOCOIS69901@gmail.com>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Shuah
 Khan" <shuah@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v1 1/2] netdevsim: add TLS device offload
 emulation
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Jiayuan Chen" <jiayuan.chen@linux.dev>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260901154914.11637-1-jiayuan.chen@linux.dev>
 <20260901154914.11637-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260901154914.11637-2-jiayuan.chen@linux.dev>

On Tue Sep 1, 2026 at 11:48 AM EDT, Jiayuan Chen wrote:
> @@ -1068,6 +1070,7 @@ static int nsim_init_netdevsim(struct netdevsim *ns=
)
> =20
>  	nsim_macsec_init(ns);
>  	nsim_ipsec_init(ns);
> +	nsim_tls_init(ns);
> =20
>  	err =3D register_netdevice(ns->netdev);
>  	if (err)
> @@ -1095,6 +1098,7 @@ static int nsim_init_netdevsim(struct netdevsim *ns=
)
>  	RCU_INIT_POINTER(ns->peer, NULL);
>  	unregister_netdevice(ns->netdev);
>  err_ipsec_teardown:
> +	nsim_tls_teardown(ns);

nit: label name drifts a bit with this inserted here.

>  	nsim_ipsec_teardown(ns);
>  	nsim_macsec_teardown(ns);
>  	nsim_bpf_uninit(ns);
