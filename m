Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856536;
	b=bBPoldiOKxZ3DSVsZ3oM14XCjBFxVZHlA91eMQy0CPMJC9P+UwJ6NfqOHyCrtwgV6YS2
	 MphOcjrzzyt1xZueSp1rii63O5PD+bZy/CkXDzCPO9JQyAkBFPzN7ZrR64r2AI4Bo9W0C
	 MVyAdvn9LZoqNclEVCPV0Yt1r0MwnUdrCdyvDeAKQtxIA+bjElmzUUxGEEQbqIoP3BbeN
	 GpmXKo4oNhqmtc0XzosEBbTXYBg+48M57tkuZcZvTCLll9Wmpr8QhDdkFHfT4vBkHclP5
	 xEghlDeEoCClSH5CB2slMwTU9NXZijQPZX/Knbs+JdvOl9lJ7JnuO3h5efsdM8LgF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=;
	b=j6hUjd+7ntxhnYzFI7t/aZ0JjrW74Izwon7gGWjWAwucSkfmetBZTp8R6L3zXILW3YHs
	 KK5B9ul8TN/GYjChcRhR4iNeFVjBVsRl4++PuO3irg4wNVDAynBM0fhHUOMhFb0Smgt9o
	 whhk45/AEG8CCEDDuEx5jtpPGGLK0DbVCwWXri10GbJVFOV6N+cwNSpq8GZU6AEuN5iDb
	 TO6PWXZhZypVMlh/fyDvgoGOFrRVhk7CHe6vam12Q1P/mQ+ARZzAsNCL5Xma32MgkzBhc
	 xeYFZYo98Cokld9LY2+KLrIMQwDV0N49bE/ajAvHaoYrEdahEwYqxX6DOBu0uAa0goA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p1wELQ+o;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD148606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD148606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p1wELQ+o
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3386921eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856535; x=1793461335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=;
        b=p1wELQ+orMTpRswwM/ZFz0l/PQum7SYe5fMWmghobxe8OJfJ36isFVuGAi3JSPs7Ok
         uXKGICH8ql8O9uUNuU426L5tX14TwQTKfRta7EP9cbTapnLomRgdPDaRmUWGolJ3YxQS
         hMY6LzlVH5sFHkAADPtO1ZhbQbzC4OiiUn3RSOHX+XavV5C9yCwEakRzOLXgbFDqgNHf
         YDlGTgwkg9ci8ztGSyKkHjF7pwjFbfCJKUhWv2581RJ5RuTNTq5qiJbDHT76AtAz+uqN
         7w3g0B19n3hnkrvKUtfDBdu24fZotplO1BRbGnLDVRpADxZYEi8QguCP1Y3r/2e2+r60
         7EvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856535; x=1793461335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjEeye3G0zd8caK/nKeFaZ6nAZ8lGBdWDRGnP6Iv4Rk=;
        b=XT4OnDLeOf5f3lmcbbvi0HBqfUuU5HMTbarKckEDtnKtCZRV1Vf/NQPWTWLE6brp7G
         4qmWuFEl5Rp35FPEEk7ZHUtaCHyfvlWTfpkNxSPSgqYywQyVb1x28L50oIq6AT6Lypo/
         37rWbxt3QW6xwYHFtSzUuYJoYIuBYzIqik6a9Gk81wYTcjlZuRqaors6bn9lq4XsvNjI
         0jJVo2BoX2LpLFX20fywZZviuOBojod2XmXTpPu6Ab8RCncG5EiuTghuLQcQnoQbCrPI
         ygMjLIVtlIWdM3AFlJsWrUT8j0Ve7qmymae+1FfxueI8HgiMxY6Dx9kY62cbLQeVau2E
         9esg==
X-Forwarded-Encrypted: i=1; AKwUvBwtyHhZoUwEeiX+r4tG/+icnESW+crhrLlC44UvvGIz5sYWDteDT+t5GP3j1T8AURRpgKbzzjUhLH2vDps=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvmA8I3tffgzgNV2roCRUdRhqXgzmsUW/ZFXpf8CFUuCUn5RfZ
	ofhLs6aJ32sUPSNyRcttIk7azIwXeypkCHHj8BeSGVp15Eeud8rItoDh
X-Gm-Gg: AYBFou2GZYmahUVuyFPm6ch8SLoFBXFwSzTB+7c3nSSM3kjTUQZVLNZkgRIwvaeiov5
	EAdP1N6K5XXf0dW8ooU0uHD++agqtiTxMlgRhUxwLqjYFxp07CSaOYAMmdEUiE4jODL3Qtf+UEV
	gpHr4O2d2QG3ZKT4g4WU/hVTU5JknFAUeBVHlpkdUekzZ/QMBJAz6upkorI9/EPiNlieSciJ3bO
	lnBk90zyNFNPzG3sR5vDP5WN1Cj5vaAkNPnuOIm79t2t7eUECbNf/kKxBboNzto/8JdEqrduJAP
	k/Ed7+yhFt2FdTpmL20zVsoR23EWr4pPC5A1OPhBytGP8pAOaKh5NpYLYbm2IJfzTKfjNrmjoFg
	wtryfTLR/qSjiMZbVH6htkMOyyhRFLgtOMT49NUvJToFuXhNst1s1R5zyhF/SL5/vd+EdW0NeQj
	MXo7PvTn5DTfd2QXxqelBP+JQGqls3UyN52mo9fsjReW2Wb0eJrcMtlDAozPsauSSXe5Pujkkxk
	Xe9uDY7gW0pJ/mzL0JOfouXBBmlMyHf2Wt9OzphRD9rvtw8YDiBjQjxfA==
X-Received: by 2002:a05:693c:8381:10b0:351:dbc:b663 with SMTP id 5a478bee46e88-369e863b90emr3837046eec.31.1792856534783;
        Sat, 24 Oct 2026 08:42:14 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:14 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 2/3] net: airoha: npu: attach a coherent pool in the NPU window
Date: Sun, 25 Oct 2026 01:41:49 +1000
Message-ID: <20261024154150.45733-3-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024154150.45733-1-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
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

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB. The coherent buffers allocated
on the NPU device are all shared with the NPU: since mt76 uses the NPU
device as dma_dev, these are the NPU TX/RX descriptor rings, the HW-RRO
ba_bitmap/addr_elem/msdu_pg/session buffers and the NPU TXD buffers.
On a 2 GiB board nothing keeps them below 0xc0000000; they normally
land there only because of early-boot allocation order. With low DRAM
reserved away on W1700K the SoC hangs right after mt7996 firmware load.

If the NPU node has an optional "dma" reserved-memory region, attach it
as the device coherent pool so all of these come from the window. The
next patch moves the mailbox buffers to coherent memory as well.

Unlike a restricted-dma-pool this leaves streaming mappings alone.
Packet buffers are passed through to the WiFi DMA engine: on W1700K
with 96% of TX skbs and ~20% of RX page_pool buffers above 0xc0000000,
host-path traffic and sha256 file round-trips stay intact, at the same
throughput as without a pool, whereas a restricted-dma-pool (swiotlb
bouncing) costs ~22% of host-path TX.

A device coherent pool has no fallback once full; mt76 and the mailbox
use ~10.7 MiB with MT7996, so the DT region should be 16 MiB.

This patch was written with the help of Claude (Anthropic, claude-
opus-5-5).

Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Tested-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4d3195eb00..069fd60680 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -693,6 +693,11 @@ static const struct regmap_config regmap_config = {
 	.disable_locking	= true,
 };
 
+static void airoha_npu_rmem_release(void *data)
+{
+	of_reserved_mem_device_release(data);
+}
+
 static int airoha_npu_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -776,6 +781,19 @@ static int airoha_npu_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (of_property_match_string(dev->of_node, "memory-region-names",
+				     "dma") >= 0) {
+		err = of_reserved_mem_device_init_by_name(dev, dev->of_node,
+							  "dma");
+		if (err)
+			return err;
+
+		err = devm_add_action_or_reset(dev, airoha_npu_rmem_release,
+					       dev);
+		if (err)
+			return err;
+	}
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return err;
-- 
2.53.0

