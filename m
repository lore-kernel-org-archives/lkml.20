Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794309271;
	b=a7pJYb0wLdaAdJeYa8Bwsf5jNcvnu2JKxpsJbsFgF7rRrmyj1n0vH0KWZ98mWa8eTzTQ
	 9pq8G+ialiDb0fyIv+uyuOP/SE3uoWCkAwAzDfC4znFz4tv7jxDLOlfvsHxmHIwKby0HL
	 +Di8ZKgP5mECa1jxfx6J/cfsZE8DsPeI52rGcmS5EnLQ0gBONvxCLJT03og7XKt9xxNwG
	 BPlkZoOf+xMj3ggQk3BBnlJD7mkTIPCxX9uqIfFifWFmpe/SwKVYhMjGSAFNUu5EADvJC
	 29AMA4doBs/8V4OHOgjEHGkwUHGmfdrXrRHlmkwaILR7oeiVQX5n9iJvJbLe6AkZn6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794309271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=;
	b=PevPEt1ZI6022c5wm9/zcEPKhcqpdDlGWxqBzi9lRtHY3AzF0sW1ZpmnWrB2LTlB++un
	 HgGLyp3c0JDb0yzl7VkyHuPgWKQx9qqlaeFrYWsQQCgEtdhqJLVQA1brQsuAjXM7wtFQf
	 WCUy7rtPhymg64wB3myWfN62Ys/OU0jvpVGcj/E/Y8eUkRg0wF1sRciW1W9vFdpRIXO+2
	 2sXITBKJ1k1BxdTX4oYoh78f8WNb7QMrp4w44Fw73E+s6mElf9Qnx4g8UuzgktF6NUAoz
	 XZ4yBztCr8AeNIzzplVXd4gaq0vWh7CG467JIxbpQICLNYsJRwqm5QP+9BYiaKXQ9Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnQ5viNa;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029B9606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 029B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnQ5viNa
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so1106397a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794309270; x=1794914070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=;
        b=cnQ5viNavJtinjD66Zek1dq5x4qv7/KFnNkmYWNlyX7UNhyA8mn8TK81Ik6mo2yu11
         ApDPAtfhCQk1UJ4xAtuRVQMA4FQyuov3uAndKeGhlHbc3jxjE3ocCJfJqBu4rsDIyfuU
         /p22qH8dByEzeD3V9QDpE34dYC9Mh41cB/Rzb0Y12zePViya3mO9/Mgc1ys7pSRMegwF
         vTOb7uhvOitYQ1iP3W9J755jcTnmuRdlv0dQXLU6KOP/+C1oqJ59SF1nmWTA3Yv70Od4
         tMs8gOdLJdDGIdyLdK4INREhRqxKKNrhAC+1ESKGlecbMDWJzfCDdNVM0tRYkUkJJzNA
         kwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794309270; x=1794914070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V2d/3KN9EFLJt2CEmLoiL7C+x9p7wCoQ76zvSrcXGHA=;
        b=basfq4z5skmupk4hIieuuM/H1OatkEZpalTPUXvobH5mAgBVZIQQ/tn+xk35HYagmB
         VmRaOAZnPR2cPqafiMiybSgSOETaKsED8icjlhvCE0Cz5HjR6Zaq4Z+vU8DO+rUDG97M
         55iQVH43Wq7RKW4LX+yuN7ljX6b+ey/Vlb4KOvd7Q6eNqKxOHDBfuHjLPFZv7I1bbJbz
         jv7RQelFs+zXVtox3v7LFJilzQ2+VKgCBW0tVtasdZUTf9MxgClI7wRlaGlbsA9Wh4ZI
         8+TGWZwhT6RYHsK8xd5SbGqnopYovN3PcSbdhswBjHf6aFZg23wUaC2Gwc1+s3YbjHPQ
         g2PQ==
X-Forwarded-Encrypted: i=1; AL+hErGsvynPHVBQsiDdfDGQPAa3/nojv1qn14gk5AQaE5g9tS3SnB21zMKfvCvZBTbx3bWd37BIjSDcbRxDm/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/c/EiVcsD77iXwJcPmvtPT9Q/G+gzq7+2wCdHoU1dD06pFPULY
	4oXosCS4aoqynNzssJzuGFyMmv8SwjUv+YF8BSKfs1OrLO7yhuFrEBDD
X-Gm-Gg: AYBFou1XiUFSKyh7p82PCllHSrSl7MZDjh8N1VCr/LDcCL4FR1/TLJ0sb8DNjZLYqgn
	se3X1k8rQBupRbkv8WBgTFo1dTe2LWNHmhZpApXrLHmIT9/PCGH/PktBY4b+5FtCAtIlqj0eqMP
	rVBNRthe9/Ggcd2NSvf3YRRNhFRjNsAHprbpOjqaPteU8F/ojPyszB0/x8oOKSKsqq6HMKZWm/x
	fMecFccz6W3VlEy4DbDbPt/D3by7a8Ug8sjxNg5ieLmR3SEeuKS0z2U4jxmP07ajnNe/pw1qOPE
	39535EJCB6EY6gHb5tiot/xsSSi0zFwStMVhStZVQpfm8GvJsKfKfOmXkC9T2NFXoD0P8f/cLjg
	kwvxsSgJ8ZSZLk/H2qERisalxEZGJHBHiaQ24/EIEEp9hQcs6mLjdmeISEqqENEGZyhecFAg1dl
	O2NqaxpCZzJdKwhmCzVvz0s/HsiyXBWwnSiZBiYiyULpCgMBVsP1emVYuRwhJnG06eoDndrz7oh
	hzvy7Ny5EBQMU/asDVbkimtcin+d08Yiv5dJaCkW6V99zQmsxT9A1fWW+9gdxSPGqGwpc0E89D9
	P1+3SzzpKjGXIZvZZCco5TiwoslDxwHaArH7rcMLr1rB9bD4ud+cU6GAx0apMtG8OYstjVK3i9E
	yJj0cy0/H4l+Z15o9fIWEfoBuZg==
X-Received: by 2002:a17:90b:1fc8:b0:3a4:ca46:840f with SMTP id 98e67ed59e1d1-3b166ca1c22mr2280914a91.8.1794309270279;
        Tue, 10 Nov 2026 03:14:30 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1678ceda0sm3556684a91.5.2026.11.10.03.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 03:14:29 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
Subject: [PATCH v1 0/2] Input: Add Nuvoton MA35D1 keypad support
Date: Tue, 10 Nov 2026 19:14:17 +0800
Message-ID: <20261110111419.89535-1-fyhsueh4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series adds support for the Nuvoton MA35D1 hardware
matrix keypad controller.

The controller supports up to eight rows and eight columns.
It provides key press and release event registers, which
the driver handles through the Linux input subsystem.

The driver uses the common clock framework and configures
the controller's scanning and debounce parameters using
fixed register settings.

The series consists of:
- A device tree binding for the MA35D1 keypad controller.
- An input driver with Kconfig and Makefile integration.

Tested on a Nuvoton MA35D1 board with a 4x1 keypad
configuration and a 1 MHz KPI clock.

Tests performed:
- Key press and release events verified using evtest.
- Input device open and close verified using evtest.

An earlier MA35D1 keypad driver was submitted by Ming-jen Chen. This series is a separate v1 submission with a revised implementation, focusing on simpler clock management and hardware event handling

Feng-Yi Hsueh (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad controller
  Input: keyboard: Add Nuvoton MA35D1 keypad driver

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  73 ++++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 405 ++++++++++++++++++
 4 files changed, 490 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.43.0

