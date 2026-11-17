Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901124;
	b=3kRkW4CPmtj4lD+cQg5AAd/c2DR8tzKFzWLZT4omN0mWDAL3HS1ykL9FbwzXhQtqJGg3
	 epKmFUZwblhczB+afFBi0dBGGvsG594dm08HaIWsHviNmWUjfQ1sRRcxdsZE0YItSmCKK
	 NlEePY9br+utPAqFvL3aansYfkl9he41Ps0yICjicBV9Ur0kBFYB4fPaNafVEWFJ5Bl7n
	 3R1sxEVbcLekiUgRdDCTbX8rKMrwfk4aGeFq81lqRB9xe6ch8CxtieHVDZeF22kKQD9Ux
	 hOipL693o1Sb5ROKHQdttzr+DivFVakuhAdTWkrreXwdzyJKElwVF5tD4fevA9X3m4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=X1EFeZBdLj15mNpUXtl+gFcocPPY28d2wx+TBKBPcMw=;
	b=N/B9q7CNaSmXNpuio6RJw7/xZKY0DY2AuySssay10Ia5TA1uHU2ZEIXzaWfeqY6mURe1
	 8l34B8aJPiIlF9iz8kTDi8EIQsK54JWDJmaJ8WferjZSJUVBgBZcUPB41/PHFVNfjP9fz
	 iFmSTfofi1PW1X5BJa6A3sQHO/JThjRXAJO20pRJDlW6paD+N7bDUoey2vkauq2R/qt8W
	 MoWtG1MXBwXJ3pWUAbOksF8hmCUaWT/ACsVzAv7Vcl0DdnobExHrh2g6ps9fGOhNl/imA
	 lB7KtmmrXkV2OZxcuynKBVsVrCNKgkqnk6VYbMgiF5PT0jd5mpnQOUB/UWb3M4O6m7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b="beuriP7/";
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B539B606A881
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B539B606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=beuriP7/
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso5294774eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794901123; x=1795505923; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X1EFeZBdLj15mNpUXtl+gFcocPPY28d2wx+TBKBPcMw=;
        b=beuriP7/I8mJ5gicXCudomDAvGMJDJwTwMDx3uZWhBdM2pn1X6J7ROxeBuTe/xwYaL
         CrBKVCe4mZdEWyKMChtESwCNSxdqbsNDLRP4ly1XPAt41MFEap2KE24LON2Gn4iHYAV+
         4RgWb1iMmcsz9iNGpACz5DMGL1rDwkQAFWOgiHas27u+NVI8m+w/AdVyMpbfvRwPrOfh
         t1/QMXEDOrqyJiIbPv/nI+XUuq+qYF9tI/jB9tFbTo/Tc0T4o8TZ2atN1VPOCculLvfC
         hBtsSQcChalIAvn+BUGrlDFAqVPu0ICCp7DM/lGBVprbRYhVP/ytHK3IsbzkTc39LAa9
         lGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794901123; x=1795505923;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X1EFeZBdLj15mNpUXtl+gFcocPPY28d2wx+TBKBPcMw=;
        b=JfXIJ6ISa7cAIOyb4y5bbRDlUw7tLMF0P/3/td6FSwsOYeaRU/e9SMGAol9WZ7X210
         RHDKwZwXE0iXqR3bVR0xkxkJlrNYraNgXmhxiUI7qfsEwFZgj4beljSuDL0VsLLFG2mK
         e23A5/yPizHr+O/r2tq7N2s+w8gwyhxrpbkRPc3GQPUIAvSnozb79Pzq7xrHFgAypbze
         grQvssJpKNkxfkr21CD7QdHPkaqTQoHs708FZ47ScQi4eWIRIGn2qUzCgAFCZSYnEpaA
         mOeI2eMwttdu8IppVVhhtmnC8LuyFFyi8rgcLwMWtCDK2C6SWbnnsEHy8jGCB3s2nBZn
         bHsQ==
X-Forwarded-Encrypted: i=1; AL+hErHHJDaCIH81A6Xm9G+u75Wk5TyZxeY0f0gub3jRLwz9GFKs+h3u5tvHWcrTRqBxotYte4hApAdNXHAxFBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9De3Bz8x8d1lI6pYo5UHcBOwMiZovx1Hdmqtunw+2GkTxovuef
	vlYDY1GaJOtf3HJ6OhDTWA6HgpOUArt/tSsP1epGwuWPCmI6fPTkxYynRXj7zJxj8H0=
X-Gm-Gg: AZFdTZdx5CLBpCCaqwFlfRGV5hR6gEOnw/HJYI0MJiEIS9UZM/KA+rMv+/HevRslxQ/
	+GdMr/QdipJr/8dmV7dOWPeHiOvTHZBpvrUxkS6zt06BOP1oXRjGZZuuCnElqxTMPwm2HM0b2Wz
	WDQAaDi1x3ipq/oxUOL6G1pnA0Z3juJshIcp60VKkZCv302qkW4R3Wbqfk/mvtJVRomUNlA2Iqk
	e9p6k+LbE8HsQZYNE1NQJCbRxvjNEUgAbMb5yhC/zIpwDTSFEqWSmG6wpnV2YxBjYktIvq3+pHE
	+BU2iOENxpqHqLoe++ksR8oCKM5wD5wEj6QZefZ7jzy31VBJ57TniKXqrJzJvpWei7OWojYWQs3
	S+cIO9q+fDKYaB6KY7Cjy701aDKhXVs7pADqBiuQuRQynNAAKxfgbZ34ho5VqMspjCgauVaXWO6
	KFAQ1MMBvji3lgz1Wv08wkbrYdGJjeU1sgDWFkwziYVx2e6roEokAqiL90+F1ObfBeLUKssHHkj
	jZfuRxEOAhBE7JJw1gVHsbK4Fj0Ls4Yn8490WhYcGTTuFsFO1LE2pFUqpJu8g22KEm1hGcgZ3Br
	/tktn3s5BHRr8WtiUnRw15oXkp8ZISk6VHw5EHUIMGeENA==
X-Received: by 2002:a05:693c:8084:b0:378:1191:43ca with SMTP id 5a478bee46e88-37966e3b292mr13877536eec.18.1794901122726;
        Mon, 16 Nov 2026 23:38:42 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38116afd7f7sm5190967eec.17.2026.11.16.23.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 23:38:42 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
Subject: [PATCH 0/2] riscv: Add support for vector misaligned load/store
Date: Mon, 16 Nov 2026 23:38:36 -0800
Message-Id: <20261116-riscv-vector-misaligned-v1-0-6c4d0ca905b7@sifive.com>
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
X-B4-Tracking: v=1; b=H4sIAHwE/GoC/yXMQQ6CMBBA0auQWTtJiwjoVYiLUgYcg4XMQENCu
 DtVl2/x/w5KwqTwyHYQiqw8hQR7ycC/XBgIuUuG3OSlteaOwuojRvLLJPhhdSMPgTq8FVV17Wv
 jXdlCqmehnrffuXn+rWv7Tt13B8dxAvHaodh7AAAA
X-Change-ID: 20261109-riscv-vector-misaligned-54773f80ca6b
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Nylon Chen <nylon.chen@sifive.com>, 
 Yeting Kuo <yeting.kuo@sifive.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794901121; l=1475;
 i=nylon.chen@sifive.com; s=20260310; h=from:subject:message-id;
 bh=tmkoHjHMDPa3fXfBx0Bpn94ZmUkTCA76BxDrgEkQkxk=;
 b=SiEKMftKaKj2WXk40u2hgHdrIuZP1id9WexL6FBiWpYCzwKZ7E9P508IlsiIrGB8ZZ4YTwaay
 QYqbd9QQSghDsu1t++ht8dkkuaGOQ6a8UGxl8a31LHjf9RJ+2LrcOT+
X-Developer-Key: i=nylon.chen@sifive.com; a=ed25519;
 pk=+xtFLLbXfGd50d5UhR9oBzLTh+JLft7T60t3u7YMZPI=

This series adds emulation support for misaligned RISC-V vector
load/store instructions, which may currently fault/trap without being
handled on hardware that does not provide misaligned vector memory
access support.

Patch 1 implements the trap handler, with emulators for vector
load/store covering unit-stride, strided, indexed (ordered and
unordered), segment, whole-register, and fault-only-first forms, for
both user and kernel mode traps.

Patch 2 adds a kselftest exercising these code paths across the
various vector instruction forms and element widths.

Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
Nylon Chen (2):
      riscv: traps: Add support for vector misalignment handler
      selftests/riscv: Add vector misaligned load/store tests

 arch/riscv/include/asm/vector.h                    |   4 +
 arch/riscv/kernel/Makefile                         |   1 +
 arch/riscv/kernel/traps_misaligned.c               |  39 +-
 arch/riscv/kernel/traps_v_misaligned.c             | 902 +++++++++++++++++++++
 tools/testing/selftests/riscv/vector/Makefile      |   5 +-
 .../testing/selftests/riscv/vector/v_misaligned.c  | 169 ++++
 .../testing/selftests/riscv/vector/v_misaligned.h  | 530 ++++++++++++
 7 files changed, 1647 insertions(+), 3 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261109-riscv-vector-misaligned-54773f80ca6b

Best regards,
--  
Nylon Chen <nylon.chen@sifive.com>

