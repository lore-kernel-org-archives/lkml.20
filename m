Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288045;
	b=tdUDXKWSuWqwcptcyWIIgc3TLBCI/ua/tmVmBdMz3Db0jFrKyxPzafjiwf5qCBR5Eu/b
	 T/JbCrvUBQk3XRuN/IwYCkV8ACq3gldSGDIuEKC5thU31yPELszAuVWpkyrkoUCAjQ+Zr
	 Fz5QTfRGDMr3Mt4AM+IirKtfJV1p0DKVvELNdyGmc8f3YrxB2tJKvVeC9QieZyU0zGnC/
	 jHzFQWN2lkrprBWJ+m8FVuzNACCJwq1CMzdjviLhWTyAZCEoJ7c/E+Eeh12o07DhCqGJ5
	 6cV11FgxlzSeZpauNx64omLrGp6Yti2nxzHYuTH9gYPvMGWR1/OxSXeY1/cCDB9en2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=4NTO547gTwHHuMKJAO18fdInJ9oPhMMyVlUyKNBEoeg=;
	b=Q8VEfrjgCDMT2aZ3gs+EngR8FexCZNaETbpzNrJfzYemDScqUozuq1zFeOpsFxAjHdbW
	 s0J79dH0goMIxno2quytTAn+i83BIMADuESqpGB+YK313pVN7tAlpToUvgNfSYtgpWUW3
	 CdL5uy7aNjLlbz+5Fq5cmww1o+pE9G+ArIQhr+4rrhTz3QsIzjp9B10HeBsixcPpha5Qp
	 aPOF/DbUpzIbsg8f13ndBQH5yqXzSNdPFb6bT7ThBj4czvvhSZrxx+9DAKZ7g69pnONO4
	 FW3NtEzbdNabQPjnwJc3geNw5mNsSb0dd51ejcp/1xvD0mecHjENZp0VoRACUJju5ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6g39kT1;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A66606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p6g39kT1
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-702dedeb70dso1572277eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793288043; x=1793892843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NTO547gTwHHuMKJAO18fdInJ9oPhMMyVlUyKNBEoeg=;
        b=p6g39kT138Y24gIRJ1SqOsW+pHhTeQYiK15FtY3ein/4TaMIFGT+T6mcf2yX9caLGB
         NI3thZSratt12xkAc1LQbvG9dzf/p3JrfaxBnbo96W1Gui5rzw8oKzXYPqLxd/JZ8gTn
         Mk8Dl4WhtGmCUDakIFoDtJ+M9Ad5thTPxgUI5HMJUPqfXbe2UABgaV/jixVGYP0vMi5/
         SxgOocFRD7iNk7Ow3lv7n9Q0rPKASvv+doDmeT6VbmNc7EG12ugxk6p6hAHDnCzARU4b
         JuRxtOZH6yA25oJQ+XClGZCp5cWESbwILT8solc/l3nENs1hcNB/L/0rtBS/Jtsp1BwU
         o8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288043; x=1793892843;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4NTO547gTwHHuMKJAO18fdInJ9oPhMMyVlUyKNBEoeg=;
        b=aVUbB6Jh3lQwUADMoyctLalS57CcYKrfgfx4xA2d6qFvL29WjxLfE3EMYovZlFvVUS
         xXQWKl7fC+mwmwRvWxch7vUxELkTnIjtT3paAiPQ+SkSau5XB5WtzlUSfTqOk+tu15Va
         d7OQmbeo/fWe4QD8ZZemuayt1SLdmfTWQ24gIyvq4jTLSwi7pJTyZHuyWRnHN150lP1P
         o+tbLfFvAh0z0S8yygrTbyJLVy/6cpZuoDYT/htubtlD7fR/u6v+aEnr5XlIquuldBgV
         /7++qJ5B3+Iqd7ovniyVLZu6zHJkFOPr22pnrHmqmRLB+HOgtQQy62I5OFsbZoGIguxR
         8dyg==
X-Forwarded-Encrypted: i=1; AKwUvBxmEEISH/hsIkKND9KQAbKF5+T+3p7GFiw77bptt4ZK5wLE0UYWS24if4PM4ExIMcSdoI5KTcmJbRZ24pY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ67bzgqHwFOY8PLaZAgjJoj0oEFuVP3NyrV8imfBfzZEZcanJu
	OLJ4t6rioE5CsCPCxjfNKpl1JEker7nDrKdexxmZPMXNHWYYBaItIgdCoFqZZ4Nqe5g=
X-Gm-Gg: AYBFou3sQbe73JGN4ECTjCtiX3rpK0ZbsclXgwiqs4WZ8fK+mcH/8myHrAFeI5Ec/pD
	u5u9+jcX5Q1OsIntJvjyQHm4t31w4ZTptoVigN6JWXrXmKeJgrD/RwUmqkcchhYpmJGk9oebMAx
	EMho4j5MPJsvFoFv3oLJX9E3+cBqiZFS9BT6Wj6zk2GZkJNbLX/IAvleqQS1VLrLzLAVdSvrE8r
	bobYKAs4TciCH6HUOjkC9IXsm68hhqXpZcyi1hjR64sCqItl9tHegFbhfhrzdMjm1P4fyqyKHfG
	ZnSHZVVlvsXHByx9c26H6aNzICPsE15E2sKgiD83t4C9JZGc1ydaHek8z+2j0OO8m9ZL3uxdodx
	vlycRExgkclaz90xnG69wf0oArNvAmpa+GPp8L+EvFwgaB4pBkwdGQBTXbQkgwKMgyWCwRdRgDT
	B1jTfxK+i1u//IaPUw/CyRxsU/B8C+sbdQoW33dgy2sTogOfvB6oxtyHHGh7XuWlTxZBJW20hdc
	MzXKEV9nHjbU9dBx5owQbEzIUGFue4DaB5IjsyVCRlOqbdjjLgMagSSuC7ZFlA9fysKGj4EUhcD
	oB2B8bO6cpCL8x1lBGI6+P24jCgQkYsF/MHRy7BD8Daf0tMUoKwFIJCQTyvQfjizkJQR7CMEOVM
	0j0QjosABvgDnI5jgkDJuWf6rm8Gsbbg=
X-Received: by 2002:a05:6820:3395:20b0:713:da3b:8fdc with SMTP id 006d021491bc7-713ef14200cmr2273261eaf.32.1793288043291;
        Thu, 29 Oct 2026 08:34:03 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d34008552sm77736a34.20.2026.10.29.08.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:34:02 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Anvik Loitongbam <permissiontogallop@gmail.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Olivier Langlois <olivier@trillion01.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261029144745.23792-1-permissiontogallop@gmail.com>
References: <20261029144745.23792-1-permissiontogallop@gmail.com>
Subject: Re: [PATCH v2] io_uring/napi: clean up list traversal with
 list_for_each_entry_safe()
Message-Id: <179328804229.1479009.9159833350828920392.b4-ty@b4>
Date: Thu, 29 Oct 2026 09:34:02 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 29 Oct 2026 20:17:45 +0530, Anvik Loitongbam wrote:
> Switch both loops to the standard list_for_each_entry_safe() pattern and
> remove the explanatory comment.

Applied, thanks!

[1/1] io_uring/napi: clean up list traversal with list_for_each_entry_safe()
      commit: e18504a4d378b4c9e1ee522ae7fc18cac8b1fc82

Best regards,
-- 
Jens Axboe



