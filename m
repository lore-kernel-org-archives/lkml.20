Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173035;
	b=AzrPbRIZN2W84ysvhXkor+zRKZOSHhplXnLtC7OZX3X4KXdndfpgvmWRHk/ymc9tnHxm
	 njhQjwpLA7pTav5AZ3qjicIYV1oPSux8PmRGuGIoyuByK0BbQ5Fn3iD9+rKNo40T5C39d
	 XWar9PFUPy6TeEYcNyy2oakNeR/AFfL06YSc8fFwn+nAJBZo762/UTA0o0iRzEUQFxyWi
	 RQgAYCyWOiTMuRNraQKL5KOS/rNpBJYY/KAh1UBZAJEoUwdqWrEQgV6w6WAubv+LqSt4B
	 IZiLeXmeUWPp5FFwPCEtqPcECrsiAH1L7YyOuOSJ8smR+2JqJbqyYFQYEavOcsAUCUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=0dO5iSkJD5cA7k3NwfI5mURiH/0OkxrsK506UFd+u1o=;
	b=z67SJbhApyBQNedtPNpEmchpwziZ5ruhzOtpOxnyg/Ck6UbL8CzWqANkgup1AEYvKkcY
	 hzxAnKl58xh97FilgE9shanWT2Wft7sztl8i1IOslBj06AEMHKSCMgXZKrGYqw9HvZ7wD
	 bKTX7DKyx9EYvRkIeh5wqBjqeHce8GoC6MDZKv2peah18VBi+bx7okmSzLLlotJoj/gNn
	 HGe3+Azo8YxLTjgx9SFrtMqyxBZXqRUpkt+SwlMzA/3UPjB2GaMBivOKQSSxksJ/sAUhl
	 P5dijWeSZ8TyGR3Z9WUBO+57vSgSqn1JDgdBZpmoMGGylqosILL8ETGLOi3u+pGuYtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc5X6L62;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0396606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0396606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc5X6L62
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6fe4372c5f3so168702eaf.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173034; x=1794777834; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0dO5iSkJD5cA7k3NwfI5mURiH/0OkxrsK506UFd+u1o=;
        b=xc5X6L62W5hPwVVzyv0d5KnkePewIvl1sBI+PzGXtxgxc9t7jN5vrM0dvbC3evxemQ
         CoK5GWxEJAVFMZvvi8Vy3v3QBH9y9nruTtVdxdd/H+UW3Ra4YYaMzrCVqROtDXLNksmw
         pH6mnela8bjRiwmBZecc1lt1OtYJU+MYBHh3kxUeM6rZ/D4wwqMyqVRInGgOR1ylZ7GX
         ywOLdMiakstke4Noqu3dTu0I6xhvf8wYk5rZkodBpv9NCLNUmuP++FqObrBuk0bkJQ4m
         wvvx7E6kqmqOPk557J0lvNW/50w1SfY8P2sv3jLEctyUJEYOWS9uFdnksi0ZXjFnwfMv
         bOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173034; x=1794777834;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0dO5iSkJD5cA7k3NwfI5mURiH/0OkxrsK506UFd+u1o=;
        b=fVvYHuZV42otGDOJZwCHOisRx8exU9PghTpjFXQIQc3TMOqIoUQWkKeU7o5iH43LBB
         MpqriIXG/usjRG5wDhQSdLwgMojZcxYOXyJBFQLnCAWFDMnH4aOqpL7Rb3UfhIfgBcp0
         nBw+RsKI+n+2HmoCHt/W+p9xFEJNeDxgKzyg33908z78TL/ReymL03bYxvYM2YMHP71d
         P/H2itVXhaXEYKycjqzyBwE76I7zgy9FVLo5jnP3LDQ1+oXTuhoaFsmmljrZYc8wSqkX
         TI6QXC7P1vY1ACKjkHH/BYdRXyZnGIw6mdhe3agBq5stAzqjT/yz7ERLhQGhO2OXKImP
         XdoQ==
X-Forwarded-Encrypted: i=1; AL+hErGdgKMkkol2Yqv0Yh6dTSUCNJcSbj/Lb/9XFRx8vID13B4zIKL4rXN8GppFbQAJcDDjEpm9YVElFnsFb9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rtsxt3+gnZfwklOhUBHI74hIZkwPS43DVildsqFn7fst4gaLK
	1x2c/NkSUPAEt2i6LSqNqNY26dPbM4R5imNUQ8tTZbM0Q7QmnEmmWHlS
X-Gm-Gg: AYBFou1PqwL0xfsKBBObwstMMVnUaG91n++AyofdlO2geSdncsd2KbKjodT5DdLJOu9
	4hrY4+XcJrfPQ/XhbySjwVeJ+yvXSKOZN/WAy8kkzre0jE1rrF/C5aDVLRFUg2uqZuE0ROJnASC
	tciiisTrFoR1BW5Ms+sbFOiPm6B8qf7SMziBJ6Hi7UsQCOYE8CMDyv9KgIp1bOedLrOtyH/RoZr
	2SH+s4552+UBkf/HVcF3wiAnmzNmrARZ/hxQ7fhQgLfglCntFqAJcMFANZ2a5mGX2MwTiE34HpL
	IYs4WBUaQOQOOsjGXvUrj30k00R9S8CypzPw7f5VyyTLbCQkQiYtUQ6hoTw5Ekn1aLjj36aDlp6
	NSSgLvLDagoVM8YXRCYaH/WY2CGnwODPyQYtp9Rm8QViTWSl2n5Qzd0nmavdHzHpcZv9RMuAC4H
	XOxTTiEeG/d+OysrcYnJQin71ETmlEStdAyuKwGQd49TmMaQmj/EjvMumw34tNUVR0OZ0t91M6r
	feFMCqCraxYPxoBBibmYqFzMU1AW/mId9V0CJa42PxGSMyZMM6cMHdsg9zpfnRlSsiXft2g+ngv
	1afV3TiGrtJPVNhYV+tYBvQAw4lU4YVqo6iTuH7qK+KjCB63AQFuyULnxFKFpEzIMhNJ+te6KHV
	NYhT+Clkt7c8kHFbZd1V9rzROPTsQ+MvoiJh57wUDqWieiPWwjalNNbhbvnHsApCCP3Qomp2g/5
	0rVINTqTdg8eGFV+8VToDwCfMr2NFgpJj2u/IxqmhkvIBPysBv3Ks=
X-Received: by 2002:a05:6820:1395:b0:6c7:af50:b2f2 with SMTP id 006d021491bc7-7170f2ebe0emr1088943eaf.45.1794173033669;
        Sun, 08 Nov 2026 13:23:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1908138eaf.12.2026.11.08.13.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:23:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/2] mtd: rawnand: serialize OTP and BBT recovery
 operations
Date: Sun, 08 Nov 2026 14:23:21 -0700
Message-Id: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQ6CMBBEf4X07AZKDDb+ivGwbRdYlYW0FUkI/
 26rxzeZebOrSIEpqmu1q0ArR54lgz5Vyo0oAwH7zKpt2k7rxkB824kTBPwIiod5oYApj+A1uyf
 LAKsGjY01PV1M588qm5ZAPW+/l9v9z1nzIJeKujQsRgIbUNxYoin5uuhroS2p4/gCxoLZoKcAA
 AA=
X-Change-ID: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Use the existing chip/controller serialization for the Macronix OTP
transaction and for marker writes after a BBT erase or write failure.
Both paths issue NAND commands outside the ordinary MTD read/write
wrappers, so they must acquire the same locks and wait for suspended
chips themselves.

The first patch makes the existing helpers available within the raw
NAND core and uses them for Macronix OTP. The second uses them for BBT
recovery.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
James Hilliard (2):
      mtd: rawnand: macronix: serialize OTP access with NAND operations
      mtd: rawnand: serialize bad-block marker writes during BBT recovery

 drivers/mtd/nand/raw/internals.h     | 2 ++
 drivers/mtd/nand/raw/nand_base.c     | 4 ++--
 drivers/mtd/nand/raw/nand_bbt.c      | 2 ++
 drivers/mtd/nand/raw/nand_macronix.c | 2 ++
 4 files changed, 8 insertions(+), 2 deletions(-)
---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-rawnand-operation-locking-v1-1a0b8fe786d4

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

