Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F883A5E96
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789140571; cv=none; b=NFiVD8aks4REoGchqJVCs+8cujttdeqrSbjT4RDb/NZDT1zXFJcKYI0AvUEDKSUDYQMjDl82pN6BH68yAj8k986aTmSY2rLFMY2jfyTeLwnag7Uj9ZblH4rV798HnMYlX3vDBnPYxGPZXbia8so6IU3VQeq4pDjUhsGCNXniEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789140571; c=relaxed/simple;
	bh=OAhI7gs+kphXf+PD1T34gRTLOMAJwXUxKg9WHDf3eQE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FZLwitgfjadQTRKoS9UpdJIHgx9KoLKd/OqeYfXkAN4bYDPsbs6wLA0WVtZfPKxDO20TEkg3XoYBOhglz21oRDF31hBuVuiPVALovDubEKgBWjpvyL8R491RnU/EF2HtRcnPjTtN9LJ1BlcMbSofedYQBHc8QmJJrtEvj06piEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lewxSlht; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lewxSlht"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b5e5ab03afso1022958e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789140567; x=1789745367; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OAhI7gs+kphXf+PD1T34gRTLOMAJwXUxKg9WHDf3eQE=;
        b=lewxSlhtPL1hbtTwb6TECxzuDRnrEvLjchSOKpza/hIVD+4FUVbu1j8tkyDsFWLA0h
         2N6UR4dgiStWsdB35VbHKLao5l6VKhCmUHyJRAotShSUv5gNiv2zzuXk6wJ149TE0eTD
         kX1Fs+eOVzfG857D2SPBWKLINqVWWS0MMk3posOKTULsC2pPIRrP/Vyp4L8kuqQ2vhFl
         sckw4/nhqu+bsCYpMawxZPOOMOfbexQrbi8dRlAsMeop3F1uHR/oMaMigO9FKy9WU5d6
         wTVyfr08k0tzbZFPXQYTNOp8BHdj3mxarUFjirvpxfcYPFsLzZ7+BTRr03bptmCSQvEf
         X41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140567; x=1789745367;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAhI7gs+kphXf+PD1T34gRTLOMAJwXUxKg9WHDf3eQE=;
        b=Z7HBqKhwfSYvkSDqMXwezWgXsTva5yuHRQRUGF10pXNSpAlGh55/Aw7mT8K51fkqN8
         mwE3kFqjsGQEoWN+tdJfasYufQT5DGHMgFGKq6xnUCQfioDPLcZ3jPCL6yFDRE5IfLl1
         NrLHFt5C6bY6f2DWVzJM4Tal+dk+LS6jKkuqFAuGPFVNHQhDZ7d6LKoCE04itwXfv9lA
         aQYPM33xru3DztwPCOzFHw/FuvoZxpeGLVSWauotiOborRtMSNUA9UMn3123kwbf30mk
         Zxp8oZOOVz3fvakZRyA3boOu/xZirGqGsz1a37ewY0ULtZGO3aj55rXJYTzeDjun37ef
         eleA==
X-Forwarded-Encrypted: i=1; AKwUvBy1x+7GNQ7ymRSa5t9K4W4NKbXgIeGd+/KJTrOyiAdcFFWTmb+rOz8wMwzWbKlnedQhTMQA4KKCmPEC5RQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lX5R+Bkp+OmuHe0ZAIzy1uYDz5A6GODw8jLnOjN/LVncVsHt7T
	nW/h9WYz7B1lyipsgKE7TLFlW6iEbBdGxdiEj5rz34VGdhGDsCbmQZ0r
X-Gm-Gg: AYBFou13gmH5C+CEKtkhI4s51vQ4fiYZ54+AX4rRQbSjLCUptPypTIaDK+38u9F4+H8
	19RNvX3sUmWn6g/t/WCjkiblEUF5wVI8wzht+bGw0i0/BBNV74rnkfKKwFEvPeBEWRg6HXyesIE
	v/9FEH6o3zQSy77yew+QZVLPy0qvNwGlV8KqtQlRJQ5bGCkwH962VCbRo7c89b4GdEka2f5/Iwm
	a14AuWPjYB7K86MNbRUtaEb+Wcra/kcGPrPUQMWJXROeUXPL9TkBVz0D4yZA9+kmqxySLrOBtCB
	jsrip4MXj17nzW1dHR6AR6lMqAk6WyHdcLExQ+6SXpqM8/RPIZRFdd3fIBPFOi+Ebo7KzGmF9TA
	ImMq0JLSMBeeLw5Vu+UUKz81fSnx+k4ifcecbAUc0m5ST5NEvssp9bD/Nl43p64sXRS4K0mNivi
	ZnoMPEaQu4Otcs5PAJ68RcVPTwvhPt0BhPpc2tnNTw19sYDWf1e4K1eEFgI0CroMsBrA9ZRbMNC
	8p0JzC52LwNog6wum3nGXPA3cz1AxJdRO/Zs3Bumf1s39ZSvvMrS4S0cLbzp/GxYlObdEiPfKw=
X-Received: by 2002:a05:6512:39cd:b0:5b4:9dbb:71d0 with SMTP id 2adb3069b0e04-5b8a0303b30mr898325e87.23.1789140566769;
        Fri, 11 Sep 2026 08:29:26 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:8::])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0461ee3sm690597e87.40.2026.09.11.08.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 08:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 08:29:21 -0700
Message-Id: <DLCLEB5Z7HGS.1X65OY5VVEF1U@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Yonghong Song" <yonghong.song@linux.dev>, "Song
 Liu" <song@kernel.org>, "Jiri Olsa" <jolsa@kernel.org>, "Emil Tsalapatis"
 <emil@etsalapatis.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Pu
 Lehui" <pulehui@huawei.com>
Subject: Re: [PATCH bpf v4] bpf: Fix UAF due to concurrent consumption of
 ttrace lists in alloc_bulk
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexei Starovoitov" <ast@kernel.org>, "Hou
 Tao" <houtao@huaweicloud.com>, "Leon Hwang" <leon.hwang@linux.dev>
X-Mailer: aerc
References: <20260905021139.4116529-1-pulehui@huaweicloud.com>
 <6b43a2a9-7e71-4af9-bd56-1bf0d39405d6@huaweicloud.com>
In-Reply-To: <6b43a2a9-7e71-4af9-bd56-1bf0d39405d6@huaweicloud.com>

On Thu Sep 10, 2026 at 6:17 PM PDT, Pu Lehui wrote:
> Gentle ping~
>
> Hi all, Is this commit looks proper?

Sorry. swamped. It's on my todo list.
