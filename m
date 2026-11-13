Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595383;
	b=adPRTx6hxcunyytcvS5SfyIjbWBudxORvYrEIsiNHvgX2GyYhq7xoacAmOhMTiowfoNB
	 CKPvJfx0cBbwMU4e0ooUg4HVf30BCsw3yd0EKBSSH9aue9puGWB3RLO6XdY1FHFTtQaPs
	 r6hbhQjeTQFrZeVaVYl3K35ItIL1azGs0BYH8yXVju67Tyeom9ZMNagwRcn5X1FamJWzT
	 aWa31HnhtAp/2kvZl3eZq5bHGGZxX3jNosLsrYbTkg4zl+JF5yYkR1fi5ARqobKlPLvWg
	 DOMXzFKgF0RqxtPbC/+jSeCwS5uTShSXIFzbLpjZaVOcIWfQw8bcrBsJMppxlRkJAIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
	b=eyueGTCsnkP3s6yD54W8fSYj4CG7vj9IlCBXcBchVfZfsxXTlxAI+QAD2jzG8P40hPXR
	 J3n/3cHKaivyyK1RX4MqWyZr+Ciu80B/HYvAsDYEY28Oq57QBbSWt5AIXxS3U4hEni8iS
	 wVY5OnFKZOV0ZTvO+K/dqZSRViuB4TUrNAPymAq+69+xOHsPSJoPPk4ihuw1OFdFII+9/
	 0AyLL/oT4IpUUBfDN7iOVlYGaV/+Dc3R7HDDIFPi1CuGrrzsF16R9lA5AHydt/wsXYXWW
	 X3CnIADbVybOnC+q38aZ8vsfYDjDXIEn0gVqr3T3V6af8xJqqeS6YEduMmgpjVNm+Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot77l8kA;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970E606BDC4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:43:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5970E606BDC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ot77l8kA
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b244fb7fffso1388511c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595382; x=1795200182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
        b=Ot77l8kAzs1agEIFRF9lh1uIxqzyKXCn2BmjsOS5z8ttZwv2+CJkqw86jCtMgZj8Jx
         aUeA14jTTw0Bnz3FrgsWAYcbiW9HXmwFdXDbx0hpAzydvoXuymp7/xcq6r6tNJzaNjU4
         IjlGZumVQbUs6YQ2MhG7blszRqA28K1Rh2WiyKrf2oO2vXIsUe5ocxV7jpE5WKlobLGA
         X6Izt+RDiA5UFflTJ/9AN4mq/tHEXNoWK1Jpi0QKyWUFna/X4s6l5OePaO8wnp021Y4C
         8Yf/Hzxb18PLcvW6D9t7yCYIjVAzUaAVIgJOdYFeu53SaqY9BoZHGVlFtMJlw+C3qDkB
         n4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595382; x=1795200182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=267Ce6TPLjhjXt9nIJiYEX+xCBRfyCLiCL00Lm5mPmk=;
        b=JrFaX8EarmCGD+hAnfSvzHETYfNofNn6qJf5/kR3lZ6Z0/bXw911OcZvZtqGMQx3Jx
         NH4d75oLo2gqml1g04/w7M8gpABwH+NOgM47G3r1s/IXFGlNoOWLgRhOXhTFF1MAfQga
         S56qygKPckvgEwitOS+fih2wSqLPzybIQ1MdwH72MRMb85N4hr+q22BTfsDyClPyelv4
         lwoQ2U9OJ4iefkkZy/vTfL6vyN6NGzF8BvNJzEpkMditGIQPwtN20rsFi6iLb0klNQY3
         GHB5o6dCwTY02R/nLGpkGnotKtRLuh6HdOa+bUofEXnvCVageCxrUl9daC+BanEQ+BMi
         epeQ==
X-Forwarded-Encrypted: i=1; AL+hErHlCnsoUBCK9664Yt3HI/oP8O4Vj7Q771u8yiDFRbAfvP+yYhTj7mLxFbXUP3Kp5pRAY/XlgJn0d/rePtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YXds+3HoRs8D6RXhVWjYy3fpM+XJYvjK8SHg4okj53dABtDRR
	GOO/7bYzyv6MRPfX73+F0qj5u8vc/0mNr91ae1Mzl/st8yvdpc4Kbx8v
X-Gm-Gg: AYBFou0eq/W62AOMlYrLy7ljS7vXMRdLKPp9vnGEIp/vgVUYKfadHTYHDLHE3Q7Lmfr
	sv40iZhCTXL8eZ5OuB8K4NMd73BdbvQ+F39dCxJJ70+Lhe5gGaJ2wtGoRx1eKEUq2FO5vPRveVG
	k8U6/Rzr/SrboeHVVjh2xvRna7FnP17YZ9xS+AecjOQy/OxZNhEn0v8DG/hQ46dRDQkqtLvzmyp
	ubATCem4BmT5r29bBw0TjVGqj/rHhMVy+due6q/8VWicDuTeNf67Ec4hB7E+PGGZoGpOrLGwgNn
	IPkooLzIgfn+6a0uxaTW6BXGEi3kldbdNToazn4CbJjWHc92lN4BWJ2UTzEtVb1/1leQz0UbIUK
	3lTlVq4P0UxMh3KBNmiS55izkcbD7JE83r1/o9RNqSfBmJh1APuAEX+QrZrIFU7mWg4zugLh8xL
	grmuvR4gLXNEXVw451WM/jKHQAj9er9HkyK5DAnF6GnAVSQNb+pbiUHUjm/oUt4cAY94b0j6agv
	JCiICZz358Uoz0wMJwrCdvrO4crfJIUL1Dl6Id3JA2E00v//2v8ccn3OFIsELPHRosr0pdus28G
	SMlhNMK0
X-Received: by 2002:a05:7022:7f0f:b0:176:a225:e364 with SMTP id a92af1059eb24-1b50312eb89mr2494066c88.35.1794595382432;
        Fri, 13 Nov 2026 10:43:02 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm10526177c88.8.2026.11.13.10.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:43:00 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v5 4/4] MIPS: CI20: Enable SMP with two CPUs
Date: Fri, 13 Nov 2026 10:42:10 -0800
Message-ID: <20261113184210.470320-5-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113184210.470320-1-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
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

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes since previous posting:
- No changes to this patch; renumbered after the IPI prerequisite split.

 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
