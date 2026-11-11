Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408276;
	b=o+IVIkdZDNLxoCtqO073vmcNTsvpJzK375q5MndNlkAlhzgBcDy5NOZS+1R7fpxvrlZF
	 JUGQKeLcygw6oBuZLy94Ulk37cqIJcbVbKVKEqqE0aUk3EDu0v0o6A0IKec0JIIc+Xj54
	 uuiLkeyNaIvMIV/VfD3SBUMfbvsXNISrxw0MTcDAfIYU6OB4jT4oV6CDhlrTCILzFXeMu
	 wKGJloWe81hHbq41EsAjKdYqLspitX/GgAoFHV/tWJ7KGpLQ00n/TIK93PMgR/acqJJpZ
	 Ngy1kIms+VaWr2b3+TlPNqrGtJ1S5wbpJJhNQP3zng0KovMrviexCVKw4NN90QoZV8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
	b=VHQWQljgs/Nj0Gty5YALkry7CNPKpF4+gMcEfF4wxqNWBaLcI4y+Zqz3TNloqHhWOCJC
	 M9S9FRi+54dBs+4QQ5yX66nY+9wLs0nnHSE0+LBQ10p30wgUpBac3luSpfoyy+mRVeQXt
	 NDTbYGipGez9L8ZQpEKhCiH7MWo4yt5RAnEGh6gij+JfjoTXu5567kVRDtJtFP/GDfv19
	 d0gOiqwCa0HStSTu0tYn/nB4qi5FOzFNiH/3wNxIu+wOCArjSjB5GNm2zUCc34WtZWq8W
	 Vcs5warplh692kI2UCYBHMMONPpTsXqlNUvGQnAgC4iYthoAdoC1hw0jS+mXpDhJMrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxcv0kJs;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535D3606A888
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535D3606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lxcv0kJs
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so19783415e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408275; x=1795013075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
        b=lxcv0kJsZ98NSPjbORZDxEUJ3JH/hNaN0PzRtl1xrSfNWEJrPEKijUUDQY7ltCAScu
         mZv7r77zJ546S+1GlMEsngJNEUXQXf4GXRiw5Dst2XaLAF3uvfJarsL23Qsn77D/IIUW
         jWhwnJrudNp2c9xFcPdXUBsvePpyAUze/rjtOfs8ilbcGgV622BP4EwRqYfJX+OJeBF8
         i0z5MUCdW2cMxbrO+I6MJwmQ3mqN8BceFsGRSbKVYwNDLrUEdkrlrA8bBIibIAxliOG/
         kXJ9ZmLUtEMF9nfKmNXa0WrjruvpgF/gcrlKur9NyZ6URVGYDY8n3zCH32sksdN2n3di
         Emuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408275; x=1795013075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ihkB9FM28RtXDynQhG6sYSquSmbZ93rrnlR0/YF37d0=;
        b=OvDD6ssdopJo3/oukewILvASXeQKR9zVOI6I3+s/2MXjxm+2W2jP+JehohhgdY0lhS
         RAwAcBel6Cpvgou9+kaCdkt1o90fIuG8MB/MkVAE8EsMxqIqH+1Q7CtVq40SYgo2nyuz
         2ZwlXY4BAOHpTJpurWxAC8MkrI3pveDBojXWCN5AB0YRs0PzShoOQhhreBKxzZVyErk7
         YKAcjX9NwIaeFN8GT/SRj157iKDM8utKuH1WwbxMbEcl4WsFH5ID2hZxTsQeUcxudU0K
         0Q8WzNcefylMNvuMzxEEHTYLc7bn79cTPNB48LFs/hX0KDGFmUZ64gYFFgslHcToFOGe
         Odww==
X-Forwarded-Encrypted: i=1; AL+hErEVF9rUQjg6knBL91dZXFd1pUGMRH4SEknLapf1YnGIPAu6JB3rFaXLUaZFXxnXWviUny8Z3msVodf7dSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gDbAtjuvK1/MTEakkWs0nx4FtL/Sr9o00Z0dKFz4GSBWJVoGH
	xOKbBhEHGSyvxtSFy4UDFDOEpOBDVus9Pv73DujSpTB/gydyoYbPSUPk
X-Gm-Gg: AYBFou3oPOF0uLCBdAkmStkWnajzqEJr0Db0R8DQAfyJx+Qelhzsv6m8dSpxM6fixdI
	JynQq1BHcM/J2+dIZ42PtYNuq6GMNktRRXceyHV34I4T9C0ZjPcmSqobXg1FyUxkU7GzW8gLY79
	eeZow+hF2pQ2aeH2Mk6/7F7HL8A0/tJFPmVhozXCp8pIH3fi32uLKK8KDlokLw4mCPvqHD1t/V0
	yvUy469so3IXQRdd5z5SkNvj/8K+evSFkYwTDxrDHToFWfcTqmspMfulQmDSYMpLIpCmYAgPFgE
	Ndyvd3rBZfu7n07JOncZM3mba8fKJMOmDuI+JpRFx0d7edBBpu6HmM0s0pk9RUmO02BXYZdZ7j5
	fwGFD95XvdG9hTmRXx1WCxKleo2Nbje0b3YKHMK/OcQGWKSC/9wrs/DYmQWr1GSDZGieFlWOK2o
	zQnQxPwoECqlRSgv+2NsizZs73I53X+iwS+7zoXNI6YpelErnAKwiBeXFmbcPWYpFh/wbFQsz6K
	KNugm8MQ6IBSdmwGwmf00aQWygqPsxJi1nvUxbfpZO/64rfNPH2b2OP95ZoWtf8ov3l4etATKAW
	YRb0Y6k+MlsOpVxxo1Dg+CH/tOhyZZTjOtM=
X-Received: by 2002:a05:600c:19d0:b0:4a1:ddaa:571e with SMTP id 5b1f17b1804b1-4ba093aa687mr48679885e9.15.1794408274601;
        Wed, 11 Nov 2026 06:44:34 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:32 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 2/5] ARM: dts: zte: zx279128s: add the WLAN DMA interrupt
Date: Wed, 11 Nov 2026 15:44:23 +0100
Message-Id: <20261111144426.1321237-3-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
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

The switch's second DMA engine, the ring pair the vendor firmware uses
for offloaded WLAN flows, has its own interrupt line, GIC SPI 38.  Add
it to the ethernet node as the optional "wlan" interrupt.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/boot/dts/zte/zx279128s.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zte/zx279128s.dtsi b/arch/arm/boot/dts/zte/zx279128s.dtsi
index 8896a8b06725..9ddc5ee02687 100644
--- a/arch/arm/boot/dts/zte/zx279128s.dtsi
+++ b/arch/arm/boot/dts/zte/zx279128s.dtsi
@@ -201,7 +201,9 @@ pcie1: pcie@f100000 {
 		gmac: ethernet@92000000 {
 			compatible = "zte,zx279128s-gmac";
 			reg = <0x92000000 0x400000>;
-			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tm", "wlan";
 			status = "disabled";
 
 			ethernet-ports {
-- 
2.30.2

