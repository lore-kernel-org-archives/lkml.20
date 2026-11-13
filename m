Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559743;
	b=lhAoKdSR/6a7vbdw4wu4OeoqzqDDmx3x5s/joq13HFmfgD5Ec0lU1pnzYG1rqxoBo1vZ
	 bv8pQqN45Mvxdntb/OVFuvYy7+zEcnPzpCkJRhrx8HoJGNoqPQq4IDuvWkJhNHo/utbDE
	 ITVHY0mkmN5nfLqw0Jt/V8bTi/zfqi+3MhNmD6ix9WaY/l8iBG86eXNiR8Q1lSIfdrp55
	 SjzgBnmSUImU/euy7QO+lHVhuxu+yugGo9tIzHYt6fPPfiauZIoCIdF231YChp0RsC00k
	 6WtRAAI8ZAOS+Sa1488+BO5/reMLUCiGufBqh3d+8qLnBv5GtPwMIx7he+XijLgBXUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=;
	b=cO1pAinXXt/8Rx7PrAgU9gIJdOum0UOhckKlTHdZ0ChmX95CYaBKROIdA179i0+VCiVC
	 ozSDz429e+V215CTF76qrdQ/QZxoo2IJYdUr+GEBkmqpktFp19Pz8Xyhtl9QGCHR1VIL8
	 ev4PmmTPqZ1AadRgJGSwYGEyS5jabonLSD+QdVrEj2U/eClnj9SPD1lHX79gnyQG3K9yn
	 cz0FP2K9H99jXX7s4iH1XVLBtUoesgI6pf51FIXaOjSUiDos8g8GfrCo0aZhDNxYGFvrz
	 YepCiH6OCZWaZLWjh3FJNbI3mRoPXTDwfh8AJxPp2dmHyozrDgxeMJdiEq3BJ/ZvofA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXbDGLQb;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A382606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A382606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXbDGLQb
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ed1b9e8f43so4701925ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559742; x=1795164542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=;
        b=uXbDGLQbF0w26QAw6MJrM+Gn/WE9SHb8OtRQkAj9lO266801X+jv0LVPreBz6oz94a
         B92xhj2j1To789uEuSuRZKr3zzsuxMeBmH0dbBnMJnT54gk68b70J1d5rKe7c45aS80R
         Hg7JVCq2OYsF4ORvO93oQGyjExlaRb9HVQBZGLLvF94c9QBrEFXVB16EPcRyrXIxKm31
         vh50ZnIGEI+CSKCCOrTQezfbF6rb160F8KYZoNI3fcxRDUz8kQ0PqGfhBB5JkUnV3buX
         j/5Gy7hNjzBDPzunZypx2PLkuIroU/j8E+codgCOSinm05fSiidcjrrlDIOKtWVWFv2U
         gq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559742; x=1795164542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qx6anf3hBdJB8SU0X3cTGKNeyaZPKU1W0S8sS4JiQgM=;
        b=KkSgNalBf71mqTjAEbudhC0SkIux64GshN3eWBQpkWDR/RCdsipvsVFTSKy+MIew+w
         jcLlRbdxx1HrzaCuIdXp/MwpTl9WaSEaK4od/dV/o/ZtwWP5DmH1KO/tUXrO2s++OZDV
         NiaB8nM9bknS/n+9/1OOR5M5ThCuLRi3S6+UQu6sBXNl6V2+8vQzT2uE6OzTIaQwoAPO
         T+ZXqkfjXnP1/lyW56qO5VPwyMVEtemPm/VmWF4L8Y0Lna1m+8WgF2L6njEddwc4ozUN
         RKK9Pf2OzqBRV8klsE641d7Wy8lEBgYuaoKxEdWlX8fui+hAM/ASLctuqPKvUfVUL9sv
         eXQg==
X-Forwarded-Encrypted: i=1; AL+hErH+2GBWYk/vEyJMfla2nks87fw/W1ymIE8Yq6J3bz6l9nsA22ORQw2PDMHE6XJScdapHaM8no5/8RlmNoA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9psHRYiQ6NDgWlL9ZFQolJ88D41TRVxItOPdpWmHr21Fpb99Is
	Yq9wB4ffgBnBbvGd9iKcF1lKOrPDslCXYaKFwBJPwxCxd8C6KB1ywTWN
X-Gm-Gg: AYBFou00MwjEGa7BpGO4Zje8Z4qKAGNWsPSEYHUauPWuPGyB8Epqd1dhSueXvXA3ihc
	jd5KGvF+tqYSrde1JoNr+146zPWKt7qI2XGcMqnOp320zROVi17gidD7fLASB9/qLR2ZM/8PLCy
	/9BfnEz9811JXNJXiwbU4fF80J+nuLYgWF+fLAWHGVmzs3V4GtEYz8jqOloe/13hhG6btqKS2FV
	bgo4GH8q4xST61AAOO078cLt3/+WRiTQ0pOLxab0Sa5Ne0MjXAbPXX+eS/Y94DtPw3y6gbwl5DB
	+PGwcZEYg7+iQ2dP+5XI+0RahqC8OgSEXHknPhd+H+9X/iPkY7qD30aIP4dABlBM3JwUeHCETRG
	xxfjNzrpW4ejy8ZtM3ID1a4VRCcj2+7GW6g0NjQ+6ZikP7YXYLm1b99ZtSBa5yfCxPKsOrVV20E
	QR3n/eDgsDDSdWyovjg0T6E5yWItWCG07yOhxTw1KRowRS57kRA9rW9HO4vdRcfrzPag+7wB3Oz
	pp6UXnw+7XAYExbInQZJYxhoycrCQZFtOMYWC1/vVOAviGBwcjYg3yCsNImqjGjB3eetuC9tVDg
	0uYOSSjk4LRKYa9UUbOKXqtyu4Cz1dwNgSSPgmHsTxaHX8qt2gCs+/5rjjL/R3cwPnAXVQhXbq4
	yW2Ek
X-Received: by 2002:a05:6a20:a11c:b0:3e0:eae8:7525 with SMTP id adf61e73a8af0-3f7a8bd20camr1630922637.64.1794559742523;
        Fri, 13 Nov 2026 00:49:02 -0800 (PST)
Received: from fyhsueh.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bececcce76sm742540b3a.5.2026.11.13.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:49:02 -0800 (PST)
From: Feng-Yi Hsueh <fyhsueh4linux@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add Nuvoton MA35D1 keypad controller support
Date: Fri, 13 Nov 2026 16:48:50 +0800
Message-ID: <20261113084852.32727-1-fyhsueh4linux@gmail.com>
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

The Nuvoton MA35D1 SoC provides a hardware matrix keypad
controller supporting up to eight rows and eight columns.

This series adds the Device Tree binding and input driver
for key press/release events, clock management, and system
suspend/resume support.

Tested on a Nuvoton MA35D1 board with a 4x1 keypad
configuration and a 1 MHz KPI clock using evtest.

Feng-Yi Hsueh (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad controller
  Input: keyboard: Add Nuvoton MA35D1 keypad driver

---
Changes since v1:
  - dt-bindings: add optional resets and reference input.yaml.
  - dt-bindings: fix interrupt, clock, and keymap formatting.
  - input: use guard(mutex) in suspend/resume callbacks.
  - input: rename error variables from ret to error and
    explicitly return 0 on successful resume.
  - input: remove the unnecessary linux/mod_devicetable.h include.

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  75 ++++
 drivers/input/keyboard/Kconfig                |  11 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 407 ++++++++++++++++++
 4 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.43.0

