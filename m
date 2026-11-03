Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680700;
	b=CSa9dpk+OVFcMUkkYU7uLtxEsXgVwf83ljRk1rj1lC0L81VR6oRUKmzLoKB/c0GTB9Dj
	 NOCU8GJhsEkZCxbHG7Sm+ig89cpswcfV7g0n3k2kCAB1tbwzAsoQutPZUCFmzYcazSJiw
	 XVQFUkpd7NIbEx5kigCpgW99Sw869KOWgQ8LMBWqjSvbcvFuwyJKYMvJCx8NYUvrh6WB4
	 jXjtof6V6pPBITvwtbyXdObeM2yrQTo4XRJ3CbV2sC0p9UsrBUXCL7PoxluBjkCdQ5/N5
	 66AQp1J+Q6d9zD3+O40vFFOYp8wm+XJZeiFiFrgOveVfq5NMUQt58QFevRW/LqTeu/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
	b=htE7asiZF//PUwGEq8paJ5kxyrJkO3pii4RlGWc9NlgEYaIwsdBAcyAN+9qMqWFDQgqn
	 RL26AZ0eMlWMBF3pOTR/vPvCZ8BnqL+NdBJ6qMgiNAoF+z5+Z4vBNBlzTq9Z/29rilZfR
	 Drgv5iGfNxcbht8oafa+OLE9HVBFvrmJG3DLZEdEpnlLTukSsy9onQShbJ++MEwn7Ycj4
	 0Dd2NLuALc/9Y7nOLsbPJVFCVE9fLWrMwUBSJj1HHlvifqG4fIUNnPDxqGVF/rbiPvVk3
	 XkX1OQenTtgzx9CKGfTi+mh65UxuJwgKEnMXTTZU9rkoYVW6StoMcpxebqwmue5PRAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XElVPPXI;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B04606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B04606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=XElVPPXI
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so123471a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680699; x=1794285499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=XElVPPXIpP6fosW6+7K3jVrmtXYfBRPTpzAlgEI6/7G5HJ+9KEJPQ3UoWAaex8SJ47
         n5pY1ZRXvWc8XMYoR0maYVkdsXoSj0uwAHnNUnJyH3KKaMRiAFJdNbx6yD/d+aqssFad
         NSUa4WrlOGyXMenr619P4qq1AQplaGBT6NfEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680699; x=1794285499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOgLDWMrbGue3Y3ijnkKX9LYoTRtoFaZwaUPNmihNOI=;
        b=OkffaU6f6Ja05O5qh954A4QZYlkGOkRIL9d9LHlKIMviHKRv/deVhytnyCepzE96Os
         yoAu+lVvW3SQk/IWMrzwEtUxq3l/gCKkaYBbhYmWzqNGPPxKxp9/OzCH4z8H3sn0eAF7
         G3OFBk8JhHx6okGLhjARYbuSfuU03bghkFGdofa38oKJ8VOKuRBjfMdWfZkpacU1sYJR
         Q5ggSlUYxFBTiF0tO6yBasWQGfCjfAcyH1Fr8npaF6V6mAv2VS/bajJKe9NjYqYTw6he
         OOp4Lajxxp7wkPclY8hCpeEilJHljRvpALFMCUxAXtTfOWJ5cMJQdG6FqG7PhxL4VDiv
         t8vw==
X-Forwarded-Encrypted: i=1; AKwUvBzS9pW+gm8EaaBl+UxwtMcDga4BKRRBSLM7T7k0Tk91blHAo0prtykzcjwbxgFQOC86HS5vbWr34NZJJmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VYHqw2AYZw+HLaxwnSTYUB1KiN0qRzg9kRQ0cy71WkOWDwqtQ
	2eRttRFQJop/4MiUbawFuM/Nqu16kKh8dMXIMNVeNSTRxFGnSOADPtyeOG8OBR63PQ==
X-Gm-Gg: AYBFou2okaZaIWSP9+lf8eNrs3l6BeslcAgz/9GE0lZFBVzMVWNq/vgLbbCphfuHrCd
	pvAhpPSpBn6J1qHDj+tZrnVZBfJCg1PhW/0Eh7diH5GBtMcjOs8QDbZeo8CUIbIcnVhjUfkvVWM
	TGkPcU4Yj/4J4rD9/lQ/rw2f+pKjXC7KHikBr8dERY3RFPp42cNJu8b9N9i7McxgdofuD+BVU7W
	0gM/AKNIkUCosng9DQTo/xklbvu4ve8Qc/dLIBfamOxD+7++owYqEPYd8Ia+Cj4uVxDAjcxfEx5
	gI0ymdtWvWXMzBlj4UcVvpBxVJMtjXErpn78Zdl+CPMeESy8Un+qN329ZNNZeJ3M6Wet3broLz4
	Bp4ZKML4/qQwHSaonQ5sg9M8RF6R1PjSzv/0OkLEOl3rnYrusFtautFCfeu7/5ASlw2N8ZbB5Zd
	MFoA2jj0XmMKRlxAKapcfDBaXJTMM0ubi3acionYNRzZxD7evoXmW6G5OguLw5Ui/r2zTynUaFA
	N8dY/TagoMTtOmPx0/sMKJupZCsHiRL/eds2QwHFMfWx0AmZqoPD4AYnSF2LHTLqiNqJ2ZLja4Y
	P2SpX68Sp8HQvupk5UbHDxMegQaaAr5qStwsSQPq6KA2fCvaX6LFmNo/XzNtNrb0Dmvqys++boQ
	2hL61Xy46eulCK9TaoqO5AYWHtUOqd1b3cw==
X-Received: by 2002:a17:90b:280c:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3ae8972a6d2mr6631601a91.18.1793680698982;
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 8/8] arm64: dts: mediatek: mt8192-asurada-spherion: Add Synaptics trackpad's supply
Date: Tue,  3 Nov 2026 12:37:32 +0800
Message-ID: <20261103043734.2179858-9-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
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

The Synaptics trackpad, like the Elan trackpad option, is fed from the
system 3.3V power rail. Add it to the trackpad device node.

Also add the correct post-power-on delay, even though in practice it is
not required. The Synaptics trackpad requires 100ms after power-on (or
deasserting the reset, whichever comes later) to fully initialize. The
power is always on and the reset pin is not routed out, so the
implementation could try skipping the delay.

Cc: <stable+noautosel@kernel.org> # Without driver changes only lengthens probe time
Fixes: 925ebc0cd55c ("arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I think this shouldn't be backported, as backporting it without the
driver enhancements just delays the trackpad probing with no real
gains.
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index 68caf4c58cfe..8adbfc307fca 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -94,6 +94,8 @@ trackpad@2c {
 		hid-descr-addr = <0x20>;
 		interrupts-extended = <&pio 15 IRQ_TYPE_LEVEL_LOW>;
 		wakeup-source;
+		vdd-supply = <&pp3300_u>;
+		post-power-on-delay-ms = <100>;
 		status = "fail-needs-probe";
 	};
 };
-- 
2.56.0.385.gac671c819a-goog

