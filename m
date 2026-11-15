Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748944;
	b=V26qloFfhf8POI4jvrE6H+7U81RZxCtZ1K462YMsiFYaX2KWDFIUCPwXmyXn/163Npd3
	 a/tMl29D44vPmPEjRmOdF7hGOuXcjNQSIB2K2quvpbzb72qSCqypwxYS9hiA6wfyNolnS
	 om8t1pTudab9AhWB00NDdYgyF8OzvVpRr72v9JmIw2TZKIpETTIobcIxUedQodVhrbOcX
	 fAp0DLWFb3TiNdon0caCFSfJpf3f6dyfPfZ9j1s1iefkrMKVzi2cZAGwGTdONgL2ueXJj
	 ffLr6Yh2haC+/UfFCps1PHxELnzpTVuQuHLl1jfup9vvbVMYZFqyRC2r69VIjzYNzYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
	b=FyaaytstJ6uXoV3ybervxgfLSAH8V57WAUK1B5MKg5n1ZVirWch+1QjmdfrSJt0gU5Ob
	 X3QyZyjTJKm9SdAs9oA3jwyA/s5Jc6vuAIqMLSNr5JnzceC0O934zladxFKjrKQPmXOax
	 M7Yb0q9qQvPj3VMayS/3ccBx128icvnspWcHCKNfqfTHreck33AjT7KAoh+vb/UaZajC2
	 rz9omABzX42fyileArYzQstb37XSgkcVBca3xFZFr8k/SZ1fSjqEY8WW6fyBC8STc1bBM
	 obqCrIbgMwycUATFZxFb6T26q78NPvmQeDLAWnIUtSItSTR6qELK1wpRxEf4AEK5qaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwsuDxur;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02F606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E02F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YwsuDxur
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4922523d1afso1204641f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748942; x=1795353742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
        b=YwsuDxur1kI1mkhlLa3A/Q4nD1dPZFsvR0Q+FIESHwBbm9ST7VjNZNMlAbHIlX/iK3
         KcJjmnOYR+t2OL4YS7DP+pUZI+gP3kj2F3iAKtVS9cOgSfT47AK+1Gbegc434VxOXZWo
         HuTYt8xy/MIoY2U5PgzKf4CFJCiYtzuIUS/M2zN6ADp8v0msyOaMfmTRvPwpFcz1W9LW
         HbbTUJW5zp7Lr3cYxENnPxuKo2wfXpktiLAxHH7yoQqMRVZZJfdRN82E0Kpgj+hN0tg9
         NwBXtiLVdQODW/aJ5hahcKv9WhekqsaLI9k6I7JinSwT/O5J6owyOcPJUp9WQ3TcaE0/
         d2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748942; x=1795353742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+XhTX2eaPWhWUwMyLtivdGIpKoHtQC9s8D9BjgPLlI=;
        b=wOWK6K7zsPpyb2gBlymWkceZqWMeBfKw0VIU1VtVYNqlC5yDAvn0FJsQfTXs2nQ7Ct
         bH2YBdYoAaraZa8DfvYg2OK6CcyAt7l5iFEWiXk4WoC9LlIvn0wy75DWnxBJmaZa6j/5
         n2ptB14eJBLC0mGl3fLzRaNDPUdYE7kjW6HWNQ3VX5vlQFSqWQmUOYFbQnh6sG5yX6nW
         vvc2B1I8UulGsjy2DerVGfkiFrkkGEPVdeDX+t7BVOD+NRgZQDkJXkk5LlYOwmsMwPgQ
         1ALI1bT7EvXFjSu6wMFrPf4XHBzS3fM11e4SYLzEH4t/JjyhO4y/wkTjfe26u27WCEGR
         i2wA==
X-Forwarded-Encrypted: i=1; AL+hErFPZjylqok1YDWGHXQJefFI3IYDVVBv6VOwU5nLDrlajunMFFNg6Ztk2Lr/9PC1VF37FLPBogxrITmYkQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Gt5Jn8s0c0B1Xo0DmUbppeY5o6d/OOM/tprvwUVXJxELEgLu
	ZncgELhopCSQUXNxs0BTCAY5uROZA42b/zOz7KZadjUGvG+sTM58wbtM
X-Gm-Gg: AYBFou1RRgb5peiqck/EiPCOtSpz3AEMlRe5GPBA7ZI4NxYH7g45wfW8ukSQglVAxu6
	VfLnZdO545Bg4LvKYNyNqFJ7x6r7fqSg8DJM9Z2Vm0UYXuam2uNdJfQGHrv2K7w9T5CAnvx22w1
	f63faBfliyy7TXf15fwyMzkMoKj0ob85HhnRXPbxVekaFHm8DSWN8UzAXLoTDzBsG+Dh9wbnAx9
	PGZeLGfcFSVEPFulHW0l+hfQ6UHr+BjgeDtrfFaDIlmAZPmh+vgz7jGH6FGF7TorvrQAvgiCMJc
	mnAgmLuOCvjFmGfMt2pmNTmv5TxeAKDGAOPfQ//5n5/r5I3XIpY+mi45CoWdPDKe07O1lMMLKel
	JNw1vGQiCrHPCSKLdVw9SQh6GWEPrmFaChWhJ714u8pAt3xPuEl2C27zYEvFBtjhtZg7A/it2sA
	c5dPePDBf2JrieusOb/Q8MD+oNtd+qD8E4eKj5GzipjhHyyBQtzqlXtwjjyCtJMfVZUafLnOpsP
	1ycHeOJloAGGHi1H4LsNsAhdINP/ZYFlpq61G0bZnCpNlECmIcX+YNFuy/vW6uP6fAP7Z7Vw9bn
	2ESGyWnSm22qAr8oFBzrdlxNXtpP2KxjOCUlCm8sdBoJ6OH8h2CAiAefArVSzTSL954uTc/rXue
	l2KzOBhZrD6FNXtUa+rhqKAVdr2Y+dR8ALKOcouijRydM2NlpWy64gMfOHUGop1MCioP5Qs1T1L
	AiMacq6OHu7535WsXBGbDvXBSaqnc+qAGGk0+k8l3c4A5ETDbrIEI9kfota+B2/1dbkl06Wh/4e
	MHP6UOck8bX1TvDiv7uW9WJ7j8oiQvAGiA=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr129069365e9.1.1794748942112;
        Sun, 15 Nov 2026 05:22:22 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: allwinner: h6: Enable GPU and CPU DVFS on more boards
Date: Sun, 15 Nov 2026 14:22:11 +0100
Message-ID: <20261115132215.289236-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Most H6 boards don't use the GPU OPP table, and the Orange Pi One Plus
and Lite2 lack CPU DVFS as well, so their GPU and CPU run at a fixed
clock rate. This series enables both.

Changes in v2:
- new patch 1: add regulator-ramp-delay to vdd-cpu and vdd-gpu on the
  Orange Pi One Plus and Lite2, like on the other AXP805-based H6 boards

Link to v1: https://lore.kernel.org/linux-sunxi/20261104184940.882833-1-jernej.skrabec@gmail.com/

Jernej Skrabec (3):
  arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
  arm64: dts: allwinner: h6: Add GPU OPP table to all boards
  arm64: dts: allwinner: h6: orangepi: Enable CPU frequency scaling

 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi  | 8 ++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-h6-tanix.dtsi     | 1 +
 4 files changed, 11 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

