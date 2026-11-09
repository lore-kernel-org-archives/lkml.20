Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238155;
	b=vgZOEfI71RyIr3nzOwSjrK0lFAH2IMA99uVrgZoOKdCCcdw7ijmyuyRcFeUrUO8rfU0q
	 MLUDhOKJa4KN/9PWbbaPyZdo3Ma1GUmDJQRRLXU3GvG5g95ZXop7lUNIAQla6DCxgN5Mk
	 EFGxO0ZzHg1QC09Ck5f0vBWhmpx5Xh+XQVs0jL9d0DckCnP6JdNiUHkROD2Gi9L2eqHeP
	 BDO1H/Ip+fTCrwTPHLDJk+NBBQZmLmimSkcxOsu7h8qj9fG9Zxo6ys68av4Hvfadyj9dR
	 tM0Wz22uDAbsnDs1QuN2LPwJXt/ZzMGC0USU9ByzueuGAUbKEuc7XUHFWNdUqaEpFBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uWtym8Gp7QxkU+5AEHRXNK4W470XlfYu29fZWNp2vyQ=;
	b=lg7L//Eu7zQ0oF6LEJVs2qwpIjGwXVNfkyho+CMdZIQPY1vX2xbWGig78rqhnk6NbBY3
	 sa1GgYbAFNWeVnOril4UIGtahZ5y3v1oFIvPbQDLgRYykea7SUzdvW9cUb5uJ/Bd5dxIW
	 VL3PQd3DgBbhCtcy+cLrg9Sama1h4Gd0VzHewmsYPBCTt9NrIIkfZXTlF+b/8aXAP0ttE
	 Gc4HxGV9k87r23FtaMsMBEHWzFE2Sb7K4AwEsSm5Jk7Q3wb7oDPw352YDbv9qfNdHc7fH
	 tQ0F03ZfkMPImIQy/awrn9Iomq+hqVsYV2D0A1VoERD51VRZfK+czYWvFVvt+aByVqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="T/jTkjNC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C341606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C341606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T/jTkjNC
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso582582a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:29:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238154; cv=none;
        d=google.com; s=arc-20260327;
        b=m2TAGbE3B8eztXY9YlesZtZyv80wYUrU5oo2xmF4lcXHh1/ef0j7ZpOR/5WOIjAWU1
         0VWqb0GwwGQnUk1Dm33R0wH/lsNyj4wH4+SPrHhTGppBT1QMRJoVrpdOFkjgHzMJDORS
         V++G0qgOTi4mj79xbfQ/8uTdQ+w784SLmyWGsHR18nAhn1AkhtJ21NKoDEWEHBkb1g9F
         mNmwfHNzVSfaATUN9kLGezCF4Nj1+GnKJGodFSldYHyJ/MzB+IDRPHK0S84IL3vQq6ru
         V4aVISHrEj9DAnOxasAvH27zhrAEMMWiPdPWSF0hI6yCfBZVCsQqOboRUgVp0afmiS3e
         NCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uWtym8Gp7QxkU+5AEHRXNK4W470XlfYu29fZWNp2vyQ=;
        fh=H0nZItvCUWr2y6BlPPfkNKIp2IhRMrwAuUVoIysYFHM=;
        b=VSzp+H6v+3LqWpG3ff57UOzr3/xHC62VP9PhOhk0TnKf/pMT05hnVPAfZdMub7J38L
         qpvni8Ql8vEME+N4gyalFo7JCuSv9fuySwbVrxjdp+PAgVtsrj8Uxatct8bCJZLfh/BO
         hgh7oNfun/fNmuYcP1oNomFFOOLORSEECqenSWZDe+4TKdwWHJl5mGiXAjzD25ymBFJE
         7HiIjE7uF1Zx5QGCjlCS/cMgqqFXLNqs3cFERFEiORBRoDIa5IiVBN9wpNZstHQ6c5wj
         OZk4apnN0NIoDRRBi9oedzzYT4U/eX4h8FfXwXtLmXGMj9FBP0FAdgjnzu6sWG6QMhE4
         KbBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238154; x=1794842954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWtym8Gp7QxkU+5AEHRXNK4W470XlfYu29fZWNp2vyQ=;
        b=T/jTkjNCMQ5s23Qj6eKbyXmaGTNzG4Q7lvTuWmj1LykQOQ7aGT2bJbvo43lmprx8CH
         9LLj7XrM091oIjHcCrolDIjdXto5lpU95EnJpdWE1cdVH6eJq+3PpVVJpNWO7bPPaQd2
         Ht3DGpMQR37bM/4HbaO7PMyNADf1QU27kU6hlopnWbMtvmxGqqUvzwfMH7KS6Gjte+tG
         1UKjNbfvOacaqH4JKx49QAA2va+1PX9QglAg94xuEPldzkImHmp6aEIxmEvUPOBKicnH
         qD2HSuaN+7IlDlkJhDDqCKlJ3NoMntoTPXFpptviYhnonjT/yiW/tT30djIe6jJoYWRr
         zmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238154; x=1794842954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uWtym8Gp7QxkU+5AEHRXNK4W470XlfYu29fZWNp2vyQ=;
        b=vu0rMTnrXcMYJwPKZeslZKHnoql025Njd5NniLDWjAOr9YZIrNsMhgNWb2eA97o2kf
         lxKnrOjIMBqaI3FN0ruFxAkAReF+PsZog39VcdNX3f+dWnvkKn2Yi9QYHEkvZBJDkyZn
         p3Kj2vzGizMpSpoT/1GbFza0MMS5mi+y8p97sXXsgK/A/FC07nfsHWNniGJ6JFKoklEj
         RMmift9R8fKRLOq5YclVQMo+CWvsoPhAyPSynaRK+tnZRL2CI5GR7wwCGeFfpBsMsVgP
         IWAaAtp/8Knnd+9SHP9nBWVL1CxpIx6JfI1xnPtaLjE2FxUXxWEMx0xJYWZEWHlxH0ya
         rHdQ==
X-Forwarded-Encrypted: i=1; AL+hErFea6MHZbnISU0KLvbAfqSzLM5PyjKPxpYEtxQX8fCqC2ZXVGdSQdrM7r1kokUBVCIQbAdJI621ttuNfwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HDjHnU+/Z63v2mSdoANQB993pfE110GtTB2N4C1L7s5gsrjBt
	7kEa85wIVzrc29wiixUk9pRYAxRxz64BsVTpTQhPdvQ+T3hg/TFtYYU7yixjU6k5qr8rnFjXoSP
	g9Vo1JF/ObH9dh5i1lcoRxwLUSWg5YHI=
X-Gm-Gg: AYBFou3fIJLht73FfA6mVChQTTFKMrplj2J5KQtaQZVOkSceRY/JgENCl888703fKsr
	RB/vuQ5zYHf1vR2SkyMOYL3g88g2zne0oYjXEJK82HDzpAMOf4IBTLvedHkvh88NGyFb14zTWHD
	NzQEepRNOhTIIw8GW3LtTIncRpwMOPWl3X1mgNEt6H+XkTjK7jmZRQI2P5nm5tB9eMrADmhwvrg
	vGarEqXoKxcnDgFx3VoW6Dm8qpo0txNRIISuQ+Ap+9XE17pAIUHicKZf3jy5hjFPimI5FfA8vhk
	Q3taGYllB7aFPTUFyeWi3d9sEoXPSMLBJ+BxWT9CppDdc049pzaMWEJG8j7yDCQgQrhThb6AprG
	0sbMKIgLd+k3jbDGjcnrRNglAxC+971TY7RGU
X-Received: by 2002:a17:90b:3846:b0:3a8:86b7:ad95 with SMTP id
 98e67ed59e1d1-3b12d551ea2mr4149539a91.60.1794238154064; Mon, 09 Nov 2026
 07:29:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com> <20261106213319.104745-1-afonso.figuinha@gmail.com>
In-Reply-To: <20261106213319.104745-1-afonso.figuinha@gmail.com>
From: Tin Posavec <tin.posavec04@gmail.com>
Date: Mon, 9 Nov 2026 16:29:02 +0100
X-Gm-Features: AclHuK-U8rQmDUyvnC-q6tkSSB0zdCuCY_wtvaJnryp7uBCrwIqtqh9zYwI_ohw
Message-ID: <CAOJcTPVzGOsaaPLpvShKJZ4yrk2Yws=dA4Q0X48N8UeS-24siQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] media: ov9734, ipu-bridge: Enable the camera on the
 Intel NUC M15
To: Afonso Figuinha <afonso.figuinha@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Afonso,

On Fri, Nov 06, 2026 at 09:33:19PM +0000, Afonso Figuinha wrote:
> I tested this series on a Microsoft Surface Laptop 1, which has the
> same OV9734 behind an IPU3 CIO2.

Thank you very much for testing and for the detailed report. I'm very
glad it works on your Surface Laptop 1 too.

I'm now working on v2, which addresses Sakari's comments. In patch 2,
v2 will wait 8192 external clock cycles after power-on
instead of 20 ms, and request only the reset GPIO. The changes are
small, so I expect it to keep working, but the shorter delay applies to
your Surface as well.

I no longer have the NUC M15, as I have recently moved to a different
work laptop, so I can't test v2 on hardware myself and I'll say so in
the v2 cover letter. I would be very grateful if you could test v2 when
I send it. I'll Cc you on it.

> I posted a duplicate series by mistake before I saw yours, and I have
> withdrawn it. Its patch 4 sets V4L2_SUBDEV_FL_HAS_EVENTS and uses the
> control event helpers, which fixes the SUBSCRIBE_EVENT failure. I can
> send it on top of your series, or you can fold it in, as you prefer.

Please send it as a separate patch, under your name. It doesn't depend
on this series (it applies to media next as it is), and the
SUBSCRIBE_EVENT failure is there without these patches as well.

Regards,

Tin Posavec
