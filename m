Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.132
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793119003;
	b=I04sss3y94HM6FN4LPaHGpIlUHrQ37hNp766NYIkECSUk/Toe/YFYQggTFA96QW56qFt
	 NrmqIRoW1wPC2dOMxViW4FQYnGzgGVT0wi9W6/Kfh+Nai0VHp3GmWR7ekZDBiF+GEaIm/
	 /s16/lINhknbb4Z9/4gCYifa90DZZRmcCk9SWQvupA0sJEr0Xcl5HmKvdUL4JIFf+RQIy
	 n4UmEoDo04KZai9+i7WezY+mLxC2yoHiLvowyuJtmUOTy2onx3mV6yYNb8M3Op4CE8/7z
	 jkrZAKIvUQ0iTphIYAtJVM40Qjk9OSlrJaiIqnMz2yRUiJWYEVqI0fHf6Qd541W8SyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Xi54PCNZJa5IyWG41EmJ46Hym1XE97Ph/llnyZDu774=;
	b=gRStgoN0h5+mipK+YqvW6UKnjO2/QA8s8kC3yHkAZDIQ2IVGQRhzrcdyEqGg0PS8tPOZ
	 Gr5sbLtrMWttiLA7dJb4gB+CedqcRYcyI35h7sVV4Kq9OBfOSsuoPKe3M93xt37j+TGP6
	 fSUt4d6PopdFoPeLnvKCG0PwtIe09vUVFfEfZj2LX7y4RazLbzEvnOMbBU7pBvFLQvg7M
	 a6IwS5Nrc9UWk3Ch1aiNrMIBoNrDAaRGtMq4dMMwVCaEL65Yxq3lowRWhi4Hcz6ONz9O0
	 4+CizsnN8qWkHXecJ1+xMMqaTf+l7+e/W+X6RC3LXMf5da9ABxMyxGbNV+7UgBIuiTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aYNNuOSN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.132
Received: from mail-oo2-f4.google.com (mail-oo2-f4.google.com [74.125.231.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB43606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB43606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aYNNuOSN
Received: by mail-oo2-f4.google.com with SMTP id 46e09a7af769-8458611046fso20771a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793119001; cv=none;
        d=google.com; s=arc-20260327;
        b=c0Ab8WxGpgblG1XgO4WtWfU+jskZwTF4fk9spP3u4S861Ro8idXjWZLZ+KVDwHuAvv
         8hXRIG6yfkZbq93y0B4Lh51SfOmYuTAWWcvagdGXLxSSohImGpv3z0PasZ70mYiPKyvF
         rvKnzhXM3QIQSF+8uwLedsEjWh7dkDZ9NRoLxi3Yw1o/x30VoQfoYD9Prbj7XGkM0Uan
         UdChqZbwApZVxwMErGNKEuI7JcjZ2PpgvQBPqZg7zex++N3VsLxfo6qsl1JxNsTFfGpE
         axd2tmXpJ4CY2v0vSl5km/EK3Tfpk6Gc5A7rdLYJfog2Sx8ftqbETqlcilxikb+W5eUI
         /krA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xi54PCNZJa5IyWG41EmJ46Hym1XE97Ph/llnyZDu774=;
        fh=OR3deDYZBm3QlambLNmR0UgaI76QGcPV+xITk/Cmo2s=;
        b=nIzvXcicWCVPtf9/VIhsih1NFWrfes6lxzTwDQHsclrW0YOxZark0jOMmBTnLrhDsD
         0XuiL5nrV4wfR6DjVyRI6n0WOVzuIojW32VFZu5LwHMmkq2yTgkhfM1JcjkSd8vR+ekD
         jADx69jg/6Obh9TJ7/WBhbk984XGeIiPSi6NhiI3W4VlOWfD7EBpnP+YyGD/cD/Xh66A
         mQRvG12r09MpKLMtEpZ2o4PAREjklb7GyPEz65KkXH+1OqW1nOx///4cbu1SBsG/gXeX
         Po7GrPHKy0cR38fWhrJBbbDp8/wl8FATQ79PCn5TR0f4pSphcuwR8UYHO5r3vFVYXhUb
         U2aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119001; x=1793723801; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xi54PCNZJa5IyWG41EmJ46Hym1XE97Ph/llnyZDu774=;
        b=aYNNuOSNam8qMoFAgJ+Jczz3/NNuRJ4vDkebynxz/nX9V6RmmDAPjxR6gI4whM2jrD
         cOW3lh1D2tQv0xv94iI80LiTZ0PCmRtUXxxq5ZtnGYVPOTVHp7bbIRKAjPlBxY/3DAAu
         54QfqdFit1qfWa8rVwJHYzyqBb8GZTEviPxJW2qW+5YU7e/K3B2MnH/iG6l/g2EO+eHp
         uOdcZZ3NFJOhrPINp9HRF3ZtYv/Rc3+P2q+gxgRFZDva5MernMj/O4YLsRox/nLVl0Lf
         nSlhQFPIJzu+O+r+BhdpkDPUoObtkGFD1Lg/bJNeuNUfnGUvvqHNJdJdNTGAN94eD019
         K+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119001; x=1793723801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xi54PCNZJa5IyWG41EmJ46Hym1XE97Ph/llnyZDu774=;
        b=zbmtjLOjgSjCch6hRn0ylju5XUjKMhKO2CO1PaY2zFpr31DL9nLShdoZdVWUVZPJZW
         /iiEWIN+0pDiIS6sfmlJg1dbxJMhYapabPvw6hF5eXlrLfjS+2NFW5jP004pw48NdY4A
         sq3M/cnxUGHnBK8L3Wgox2BhVprkRN9vq0Sck0W4C6kSnzFuBW3RjuWevRiWijgLGGoD
         KKPIwgEvghZlaGL7qN2qKunFofUO+dCZw39Gk+zzGuxtQxWRe41Zo6VRfzmjfaiKBTEh
         qV9K1dQeDMQZpD46Mo6J3uzNMfCyWKBYmGlcTbneoPsEXmiel/8wf89LsPPowFd0Tm4H
         IWAg==
X-Forwarded-Encrypted: i=1; AKwUvBzIOVeEUCNxh6nPqAX7M1cvP4oqH8xN9UhRzln4aRu+JSn/pQkawoBNGuSOqzjzN+O6IK+yGa7VXK9XV5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv0gd9o/Id784iuX33S0J7sOmoogcGQVmJUyG4EQNe/Z1zz3uX
	eHDmKgn2OyaOpA9lXdyZ3A99ulgGr6KqRWSciu/4U104WSitorgijdQwQ4/tO0lFpw1x+8xcigk
	W8kC0VecKBWNB+HytmA5+N67hDyyVMjw=
X-Gm-Gg: AYBFou0mO/LyaTeZwl4v/fGAETN66ArmX7bWcDvkbfGlYpZ0HnFggtZst2HYcB+DFH3
	esGa1JA77VrKq1rH7TCb7CQ/rtzBjj8aiiKR0B+GxQiRRDzKRnjWL4NxA5oOJjNSRjmYiVE6gfK
	F4jCZNuIxmIVIBw0Zbks4L4v8P99g+bdHJ0T36SQB8laM6Z6N7CKRVa3X0R14Ta4TbE4V08+21U
	gcobxUfjt1uCBQvi7Fgns63wUPMRuVmNlMjGzzgvQ/ts2QfczznjP1fSC7GfQRAxd8vGQ3HXgOV
	7H9GHsWbnEVmlxk7KOapV441B+gwU9CNtcFo/CsQwNzHXCageRUdQA/GrRQRo+iRSGaDdtJcr3v
	1L75mcO4lTddr510lvmVp7Qc7XeW6oBuNSA2NxZ4lzrHL9gf0dN8aqXvXuEtokKhtpp/VJHA=
X-Received: by 2002:a05:6808:199a:b0:4d5:291b:b852 with SMTP id
 5614622812f47-55c0038ffa8mr7489693b6e.56.1793119001512; Tue, 27 Oct 2026
 09:36:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027054304.35543-1-dennylin0707@gmail.com>
 <2026102711-venture-amicably-24c7@gregkh> <CAGEkeHePGOKXsHg-bqkJH4Dpn=OSxTQx8z5vbjW18uSWHqrpWA@mail.gmail.com>
 <2026102704-exploring-tipping-354d@gregkh>
In-Reply-To: <2026102704-exploring-tipping-354d@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 27 Oct 2026 09:36:30 -0700
X-Gm-Features: AclHuK9LqtqZ5hKmadWWIqpv_URGMX5Z-jKFc00OC_GD2fupaWPqQMV78DPUxyA
Message-ID: <CAGEkeHdk-zxOcN4-gYJS-NOLn5+THtx4b0opSQ4PRUgrRtTkOA@mail.gmail.com>
Subject: Re: [PATCH] tty: discard flip-buffer input for TCSAFLUSH
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What is going to break with this change?

I missed that a throttled VT paste can hold the buffer lock and
block TCSAFLUSH.

> Why change this at all at this point in time?

I noticed the mismatch with the documented TCSAFLUSH behavior while
reviewing the code and thought it was a small fix.

> What needs this fix?

I don't have an application failure to point to.

> And how was this found and tested?

Found while reviewing set_termios(). The test completes an 8192-byte
master write to a raw PTY, waits for 4095 unread bytes on the slave,
then calls TCSAFLUSH there. It leaves 4097 bytes before the patch and
none afterwards. That PTY test didn't cover this VT interaction.

Thanks,
Hungyu
