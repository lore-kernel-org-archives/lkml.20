Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895497;
	b=5cqk9oAIwTy4jNSMcdHJmz/CLJXz/xGp2i9L6BkjfiUoxEhmJoIgfUY/PWPxQmzXYtyi
	 1basBD+yLXdUhC73VDVRYnqxR2sdoS5JrY3uRpmQtsW0Y2eyKFS0VNuk7hGV7n2dRvDCL
	 cYT42K8l1BDndOcKaqBROiPNSXbplCfnOKD/71RlVx6DGEseK5NmGYhHT1tSEMOT/Qu6K
	 DSauP+GjGeEbED3zzIW7apW0CKGuKH/o+jLLGk6MxO3c1Qif0LPfAaDhj+mLsZ8AJgMzY
	 Xdj/T3cxJV+ghTgd7/KpFpMmBiO/GoNnLgpSYh0H19xVrtyJlZzZB0cEvwgqZWJjb1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=;
	b=fsoN2Fzb2I2fqgRcVup4PzUM5h5FBPU7JmrM5Tf3IZFJ8Nmg1Hf0rXjwAfZXL/VC2p7a
	 U/GUeSw7a8TUqYzTS3JC6Fgi9qdmNHrNpuKUkOrCnH2ByQ3u/jzv+oEJ1IFrID4fiyi4q
	 GgK6Lf8flbewLYMGxr1eDI/YE9WNayb9hKP9uyxfiWEm5wMg+yoEK6MVYjFkZ5vY8Xabn
	 Izl9IMK6bXLdSs5xLjHyc7erXjhBHAoCL7V0dsmaeEHhI78zGuzMGwDOE7QAiPaINF+UA
	 ozPrC0yIrKjEiybHjx0+xLj2aN65HC3AD4tzBnc/+vvOy1sHwflYXy+ChPdGisuhScg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvPLrBkL;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A925606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A925606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BvPLrBkL
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb684859cbso189913a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895495; x=1794500295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=;
        b=BvPLrBkL/Qhhv4f3JFLHayiM4KGCrL+8HFaGmq4W2XNreWXj3jFmZAVvrKlmXY9fGO
         Pi/DRKSI7vCmfcjmfjGsRGdEmXTA4P18H548qydxdBEdWD/wPhvV8BWpnwNk3xJ+/hYJ
         NsrVYZnLyUQyEAAlOE1xcLVRDq5DbdY2PcrK9E8fKwU+aWA+7jPYsEO9r/HxkAhCxjGN
         k7CNCm6eUFJigFTdIW/U1JthddFWme5EYyL8E9rjyrXhv7jpzf525B5MavnDQpYbBk0x
         oTvIlDOrQE+3hVt7+zgBNX9AHR0bc/T3TNIAgdtvNsKzR7gVbkC6Bs7FAYzuW6R6UG1W
         NVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895495; x=1794500295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ikLnWdGJaSoPH/U14jM7TYXHq4I/0yZY+vfKoep/y3s=;
        b=hT1sCbELAhy4dGT+1aWkJQ2+JdW0STmJdC0cAy7z4wP9sQuWEkqI3UfCwAPeLd60KY
         VD1ibWGZRphnN9Sk+n1BDoORPvmmyoPKGG+/9Ztnvn3JvK8JTwfNe82k1ZTc5iSXmChp
         0VEZrKIuwzVfaChAxjMB6tyqUXULp8TNH6a6ZqE28WtmIAKYFf9Ca7bi5CTfD8NxVgeD
         EJrYYwmThpy0PW1cTBapdGOTp5A8NFM/F/csPy7ZbJxPMQwC4cxtooMMXOU8nXSrWj18
         2MU7c7MT424yu54Ci7oDsmI5EDl7L1SI9hGuf7fqrxkuU2yMyZ6XSre/qpZaiSzpqBpZ
         goSA==
X-Forwarded-Encrypted: i=1; AKwUvBziHcbFBn++L6Lqsi2YcFZmN0N1dMSQynU0sf1U44MXvKzBhR+eYJUa0Dmtjq3mlfWGlxOvjqf0l6QAHcE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZYu/dqZJX0iVRdPmcFcP4H60e2E3PsXoXC/w3HT5i7d6JllSO
	StkgUx9ZpdK6juzBu7B/2MCgpcH7GtfoMYm/kgUxX5y3bgvgxPfBz14R
X-Gm-Gg: AYBFou1z9R4Vs6XVgob97t0QipGjiCQ5fo/nV5wLhgfY2D9OSs2rwFV0D4EuRHazbnG
	7W69bXZBMMjh2z4d/m/nTWfvVuCNKU9hBiNb/7KPPbrieOwfeT1bqIVNJML2OJNrDi5WWZfFiDo
	i3wg3MmigsAFtAQDdLMDRsQP/P1wid7VcUgWLl89+vQQznOfF/6sfvxlXbBPMFJ9o5ylojJl/xm
	5rl8MtQkHXEeEK7I3+fP+MBF4NbkRo3MyJTYIceH2N9cLDmVGWuDEc6O0aAYaqrY2DhD6ikz6IF
	wAiGHb43B9JVb8cbOtHUedukJ/L8+oLuPyMNtff7tioY6Vlc5Pj8K0x474eg662zvEtxq6tEdDE
	iyRoX6u6fvXiQKihBah2UUUTiQVLUV3ax7/EbCIQYRCbMongv/+RNzrJ1/6I/E3shcBADd99zKu
	0n+2xWx06FwjnFbLL9nRQCP9qSUvZ4J8XUsLtjm2kvTCg7FcyFWNreMWVP3LNKVsBE4cnnxvvAa
	IwCtJv7hoGwIFeoZNY+6WRMIhukcqwbHH1Tkdr91l8T8NXRQI0uHJJbZ9SIqNeG0KWbJasVRAza
	+t4dieB8zWFPDQ5bhenjq5xVN+Ph+2RLUonDgCUNfEoGYTSxVSx2v4GgOd54OQDuen3QTU0Ob8B
	jDj80f1+woo2c45S4KTwxlhO2Rs6ooOKsxXlhpvUrb6r5
X-Received: by 2002:a17:90b:1d45:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3ae897eb4c7mr16890646a91.58.1793895495413;
        Thu, 05 Nov 2026 08:18:15 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:18:14 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 8/8] MAINTAINERS: Add entry for goldfish timer driver
Date: Thu,  5 Nov 2026 16:17:02 +0000
Message-ID: <20261105161702.3515900-9-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
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

There is currently no MAINTAINERS entry for the goldfish timer driver.
Add one and list myself as maintainer, as I already maintain the same
driver in U-Boot [1].

Link: https://source.denx.de/u-boot/u-boot/-/commit/909f717eaf29 [1]
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..13688df0e060 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2078,6 +2078,12 @@ M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	drivers/rtc/rtc-goldfish.c
 
+ANDROID GOLDFISH TIMER DRIVER
+M:	Kuan-Wei Chiu <visitorckw@gmail.com>
+S:	Maintained
+F:	drivers/clocksource/timer-goldfish.c
+F:	include/clocksource/timer-goldfish.h
+
 ANLOGIC DR1V90 CRU DRIVER
 M:	Junhui Liu <junhui.liu@pigmoral.tech>
 S:	Maintained
-- 
2.56.0.398.g882cbad275-goog

