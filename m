Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281710;
	b=hH4pbKJEVDqW4otVOpouD0m7JVigtqQ64wmiiilHx8DtIY6Yho31BEDh1bsdGrr+zZvP
	 38tdEFDzXVWXkJ6U/Agrb/OnKhmqvy84tCIh8cKQebHUBGA/4IlJMV4pgOXlESu0Dt4mU
	 8VDIyCSUvJOjW1ZttBkXa/9cc+ZPraJf1G4EwWqCEZK63uLsECuAbMg6fSc7u1mG+imB/
	 sMyjOQZ1KfBs5m0SJz/yWBBefI6XC1iYewNX2yzQJm9tyFy2unMz0HIk0PDpYI07VHvCQ
	 pwD5uBPCbcizBe0IGLoITUTSgLM03LiuBke7usc7bMHd3jhf2aTAHuE0jHUQxQ74+CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q4L/mAycK6YCXG1/sVTRANwnogR4r/JWf4K1sYDIIxU=;
	b=ulQaQAdzZtLkpFoX55araXBuj3uALukC/M0WsZQCXRCeAU5nAnu7B8Sp+oJO6PV1+d61
	 2+sqMAxDEn3Bj7wK4U0v+ury4j+ZBo7lbz/Msmff9Bq5rLxnJmCNr1qUOvVBlmLLaVxGa
	 i1F9ymLpdOmPg6s0VFdkqWmZZKBth8nflbeDGZIQYsO2ocj3tamMQOqWjDxJFHpjd9to7
	 GkWRZ0kh5mGfhtxV6a4/GH1N94ksXMxPIXFQg+UOOmT7Z4nAxmacSt8mY9VHTT5QH9hNR
	 mfPkWlqNBWKoT0zJ2z04hBMMYhdK7jwotu6Ywl9MJxbGzqXfgdlnF2/gdqg18GV6o5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rp1d00sU;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8C6606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F8C6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rp1d00sU
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070755c8cso1207205b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281710; x=1793886510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q4L/mAycK6YCXG1/sVTRANwnogR4r/JWf4K1sYDIIxU=;
        b=Rp1d00sUPN+JDGOfu5Djofok0ipF8RfEhXUERS0FFOpY71L5ldszGflh/13yTj/gaD
         Cd410ULtkajVaGh7YSBdYCTeYPOO6ghm9dJzmm0EbQ1nWB8m3cHaiqWqyCbM9ISetGKG
         zVyW/sNDfw8WoOhGDw4cPejhNCx7l3Cu/UfsmiroLzdvxS8vAu9vj1zNVCSvRE3cu6dc
         TuHkILurZJrKFdDe3DQ+kMk6t4mEAFuWX+0MK2Oz+osSfhA7BeyGvp/WwTXhn+ouPYhB
         DnE/L5HJcq1VssS6guPYZGqtyozFl40cX23kRK5oG+2QztUnWhmtVmC1IUX48RCIGC2E
         hCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281710; x=1793886510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q4L/mAycK6YCXG1/sVTRANwnogR4r/JWf4K1sYDIIxU=;
        b=dEEBWmIekRAg8ixjNz+JuodvOPucVYZiaxuM1RroXn6bCCR5WvYV8D05MMWrXVC3rT
         3bbmNePFSTxJGlQ2kQofMX4aRNgsEbxGi1OUGS/jtF6eKaRGAQhpp9X0MLpq1S0DdMV7
         8zUhyA1O+3urQ8mgy+1NC4yF1spwy/zbQEJlkf03qAwb+3YKTTJVE3ZkOPuVGsMyXb0v
         tHUGHPyXrJmPCpNRiFia4ZfygSTDEZ91PXyNmWGleoN3MJPbh5uqUKgCLiuusugfJ8M6
         l1YMjgYmns9gq4RudLGd88NerBC8XHQ0k9GRpwPbryar+6CnNEfFDYnJUEe8pc+a5nrB
         JVJg==
X-Forwarded-Encrypted: i=1; AKwUvByyMoBqhQv/a4aKY6cH4yF5uLrjgaQwAApttdPTCiALuRHhL5HwJrMXjYfh0BnRtRfdMlMsqVQI9CIVK9c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7FcUJgIOlUUK77+ECUGmvxYI3ljyiVY28FAS5+cTDDicv0krS
	0zncfKtPwb74s52QB0JKgoZAzzNrwuzmSZQ3nW6/yGLmw88SnkaJUg6D
X-Gm-Gg: AYBFou1u+j4Za9eYGGC9fuI7waPcu1hoAmTaDfvYDQ4F2SnvoTiBCWOV8BxhTeLmPG+
	Y02lAmhKH27r94O/XOMIQzGAljxiJXFIEou951FpchEbc1diGTkHtUmd8iVH2Qdr/ziyDAKuJ09
	05hEWzcjPCXkbXVploq+Cravzd0LB5szUDWDgYiWbwCn4bO01LOIU3d+58Vm3mN5c5DN5as50QM
	EVxK2ZCUK61vVgLGET6pu7llJ7RuTj8zSTAnCjX29iVUy/5WabLYWfw1HynANvoGZ1rGm/OWnp6
	DyxVrS+DshfcmCV9aUVaVDnf+hCNCkRqIvFGidNgsBbZv2Lh9ulOk/5jRJH8hsmeMets4w4mPYO
	jxAxe4aKGpUwVgwU9NAw9/L73NbqE/R8jCL8sC+vKjiskWOri8x1Ij1E0Zv5rrykEhn7i89hn8y
	F7meGDSkb/Tfsv8phiuzVbiyzRCtIdAg2yKD04X1OrtACbBoNBtCPpYR2MtI8GA1lbDFE/rS4eV
	NpsIOOC1hQvsE/KD0LxIGQeQrX1yNLOLcK/EyQGmzuVYqiTA5qan9xDfUGbMMuVmDbkbcFKYeJL
	g51sgJ3zKjg2Srl/xRSbJF5gEDdq8Riq6JyiNe0qM66zjKcW0M0sanjupg2GArFX98VOpaAXmOh
	FXsiuo3zA
X-Received: by 2002:a05:6a00:2e94:b0:869:9298:ba59 with SMTP id d2e1a72fcca58-8a6e08d482dmr4610317b3a.0.1793281709636;
        Thu, 29 Oct 2026 06:48:29 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:ab4c:c3be:c4b6:67cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5baf4sm2455023b3a.1.2026.10.29.06.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:48:29 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 3/8] wifi: rt2800: use the 3SS fallback table of RT3883 on RT3593
Date: Thu, 29 Oct 2026 21:47:44 +0800
Message-ID: <20261029134752.1299130-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029134752.1299130-1-hjf3108@gmail.com>
References: <20261029134752.1299130-1-hjf3108@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MCS 15 has worse reliability than MCS 16, since 16 and above
are 3 stream rates, and 15 is the top of the 2 stream rates.
Falling back from MCS 16 to MCS 15 does not make sense, so
make the fallback to MCS 8 like in RT3883

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index e7b6edf485099..9d88ee698b854 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -6303,7 +6303,7 @@ static int rt2800_init_registers(struct rt2x00_dev *rt2x00dev)
 	reg = rt2x00_rt(rt2x00dev, RT5592) ? 0x00000082 : 0x00000002;
 	rt2800_register_write(rt2x00dev, TXOP_HLDR_ET, reg);
 
-	if (rt2x00_rt(rt2x00dev, RT3883)) {
+	if (rt2x00_rt(rt2x00dev, RT3593) || rt2x00_rt(rt2x00dev, RT3883)) {
 		rt2800_register_write(rt2x00dev, TX_FBK_CFG_3S_0, 0x12111008);
 		rt2800_register_write(rt2x00dev, TX_FBK_CFG_3S_1, 0x16151413);
 	}
-- 
2.53.0

