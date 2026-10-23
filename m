Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792716276;
	b=BjbR9YSWjMVe3Yb/ytu3prV8wdjj56RjhcGVtgbeY+YZKtxeTtEN3EBkKLbREMHTJP+w
	 MbowOvid/YVx/gAwPJ7OarwnZ8w1qFXxKCd1aWcBsMWrhirELgChCo0JrhwGJoLG95t0e
	 x/Cws7J+kpLd0Uw2YiBJ2s26QbnPTYS0wtMEGQ5tsgis4OCn9h2wqI2SKZYFx8puyZD/c
	 BnN7RxbLlvOzhzvR1//TizS/4RQZ/8uePPMPdZv4rKz3P/haBN5nLOupxylOQGsCTzWGf
	 l178hQhRXtENWRTe0clOzf/E2WsXVHBxwKJt1/BJcMwOtnOr1xK/WVcerycF9Av4PQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792716276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=stbvk/Q4rllrKutChcAZtWpRBpIsSD5UqUSphO6Dz80=;
	b=0OtZjhwxEVBcsckCs/OElTS7QfDAwEDjMo3RD43AZcNEP/b7ombpY1wRBuA2yXsEOgJw
	 ecWItPGCP3OQK2cbgxwLyyrikDT4ezrPJcbaypEhzmTXpuk3ysmjpoXkQ0NH0npWlThmf
	 I1un3eqUol8DEA7wvIQuIHDQNaP2NyeYYBC29Mvz7yAYcmlusKwjYcYYnUPY22HpcAbqi
	 Fh0wwd0kyfPhq5Gjg9G8bMtBhHUigO9yxhh2eLjmM86ncGa33SDieqtVfja8plveMXip9
	 +Q2uYGIM4MB367dvG7pa1xLa2dVYnwTKFmTp1kIx9q61uGt65pvjr1G9m4qgTsVX12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="T/9tDxDO";
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B351606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B351606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=T/9tDxDO
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9906870a9baso242091241.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792716275; x=1793321075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stbvk/Q4rllrKutChcAZtWpRBpIsSD5UqUSphO6Dz80=;
        b=T/9tDxDOQD72Iun2lmGBi7dfIQ51B0WiegbeIMkKvs+V5aWBhE3aSiaQu32zpVbhPd
         0O1Yn/Ak62G3YqN/UMoju6qxIr4cR9yL4efzftrPqpvA5dm4vMCoc566dV5YmARTSsfq
         blL8NkSZhAGHcod7QtUmgZnfCWSOmLh2RD5t+BTSpa01Rr//lKBpIrUtsk7LsA6QSyWr
         Kl0mSiZ2Q58KF/i/DYM7yHn5w2SUitoWTc8J4Qa0Mbhhx2vQn6AZb9MPHcMpoBbfB4La
         Rea+gzBgCookYtMZB5krhUZN7SdrO+4BiSUQxNUVVlcDrZyNQ4K+pnj8ijHpYpdSB+VI
         tApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716275; x=1793321075;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stbvk/Q4rllrKutChcAZtWpRBpIsSD5UqUSphO6Dz80=;
        b=ZMKBftmo7xtY/Onh51ZsfmoBzenM0kRDxDM43av2Gbb3V7GPLAMO0E2nguLcXyxlMY
         J8AUaHYdLpUgcls4wZPoh7wtoaXFSGBl18V0ON+2zAsQuEeu4cJEuYF8jmAWo0gJvBNj
         rEL8mTG4iPIqKu0fOxGNvxonYM9S5+ZJcC/w7EfLbhnocOB/8gH72okYxUAZnUynz7a4
         pDM6DV8yRqBh3jz3/fry5aCZIacupOqIh3gMWwMArSr7voOEj51kpnMxBMVhi6VmKJY5
         SFymo03i4Vv3e/MpcS98SSabJdX5yND/Da9Vuzgs6N6uP71dLN/HfVrwRUZIH9B5nQx0
         oM0w==
X-Forwarded-Encrypted: i=1; AKwUvBxN9vrpvwilgaWXxAY43BDg4+Omi6WlduzEfJ3ipX2/Mk0DEpNbM0U4qkm54e5kECKh5z8ecFjld5U+X40=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYk1kQ5VwgtB9AQIgUft9gbLV1UWi2Uj0ODAGOdNheKjaSAvwm
	Q27Kl/2Stdxanho/RT8SiQQ+bXguxkg9GZcfwIX8Q+ZeN3xdXRF1kIo=
X-Gm-Gg: AYBFou0qptI9Ff4mNm7KYh+AgggqCFqppxwMAwYs2UK7+JftFzyjalbs4NQ63iszeTf
	CBBsLzQ7KvreIfgpAkO5uz8oVSZHGZxXPOFAibh48YotC82TaFAWlO7hejOqjquUrP47R/zdzzw
	LXeSwLBmojvtQYTk1vY2pq3Nu7l74LrYKM1jgfjCOHx9SnXBpjy8hgTJWqCUoGuKpyS6c2/VZvL
	9/Hj+0Tkcp1//Upx5Qo0V+lodmWnlj6OXEB8DX4Zz+lk3igff3gDhsEB2Lrrv6C6FVQag/76nh2
	aY4KsDAnhOCOqken/Il0h3eutkt8z2hWKvOBYcSceII/kh2fsCxgj9x9LvPkDS5TTJoruLknJ7Z
	YFsYCLL6Bj8g6kuP1gxdX/QVfuKayN5EqT+CG2feLdH7mhUKo96R4pfBoVebmkTBDucj/oLJ7U3
	Yy14Qx5UDFysMqsfMpQVtWsrfVepz64HzOW0KG8uEszvxVWukF1bwk+jXSRQ9u4Rh5V69h5LIQ8
	e/fn/35s2a7RXZWYutqs5xAHWppfIB4QselgMsIckbmFb0tC0faPTeWtIjQfI3tDQ+HNXFCWqSj
	rg==
X-Received: by 2002:a05:6102:1625:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7ccc33488damr458301137.23.1792716275233;
        Thu, 22 Oct 2026 17:44:35 -0700 (PDT)
Received: from tatoh-arch.tailfce07a.ts.net ([66.60.20.59])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99101765cdcsm1038487241.7.2026.10.22.17.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 17:44:34 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Mart=C3=ADn=20Arano?= <arano.ignacio@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ignacio=20Mart=C3=ADn=20Arano?= <arano.ignacio@gmail.com>
Subject: [PATCH] HID: apple: Add "F108Pro Dongle" to the list of non-apple keyboards
Date: Thu, 22 Oct 2026 21:44:19 -0300
Message-ID: <20261023004419.53935-1-arano.ignacio@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The 2.4 GHz dongle of the AULA F108 Pro keyboard reports itself as
"Apple, Inc. Aluminium Keyboard (ANSI)" (05ac:024f), so hid-apple binds
to it and, with the default fnmode, maps F1-F12 to their media
functions. The keyboard has no Fn key visible to the host (Fn is
handled in firmware), so the function keys become unreachable.

Add its product string to the list of non-Apple keyboards so that
fnmode=3 resolves to fkeysfirst, like it already does for the SONiX
keyboards sharing the same VID/PID.

Signed-off-by: Ignacio Martín Arano <arano.ignacio@gmail.com>
---
 drivers/hid/hid-apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 5b32fb8c7..82118d654 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -357,6 +357,7 @@ static const struct apple_key_translation swapped_fn_leftctrl_keys[] = {
 };
 
 static const struct apple_non_apple_keyboard non_apple_keyboards[] = {
+	{ "F108Pro Dongle" },		/* AULA F108 Pro 2.4G dongle */
 	{ "SONiX KN85 Keyboard" },
 	{ "SONiX USB DEVICE" },
 	{ "SONiX AK870 PRO" },
-- 
2.56.0

