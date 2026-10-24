Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792856542;
	b=cWa+8VpHL9cU0QYYZ7h6bbVyREwzy8+sFIXJOiSfxjQ0a6iG6Ty14SQVyXL0VlxSA3hw
	 pVGVxrJUmOamdhi09akWq2AtfM5muAw4XgI4+TQnptUnd+cSP5KHJbmdMKxwmx3RyB6PK
	 wNO0YUqiS8Bj0p9iX9F+RwvyR1RChXOhwafkBk8Ul8ABktS85H3sw7iCeZzcIEbdQV3Mb
	 hDc9SdllNmkxXo145xJoE3eTMEFxkA/20Nby1Vw2yfCI6E48381l7zalzr6FQ1Y5s62hs
	 7En6/gypeOIYq19MnD4gjgx7IAUm42VuvbXhwIK9Ysa7fOd0qi4Hj6E5O84aNP/7BZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792856542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tD2feZvStARhEioc5t9JjRKN0PpC4uBKpPB9fxOPNPo=;
	b=VH6tnwMan7c/xVnJ8yJmxu/RhYNuV9DNM7+x1zMKOmCLQV5IDBufDQexMkDPV6IhV82R
	 OiBCt0tjzYFy0h99Ad0cbk9GHOaSDxF4xcSKGUGfpSLfrdWgaC4g0VonqN8EkL6QmHsQR
	 QRHDHfh9Zj8U6smEc3RxfZ5oUn2uSxLWt7NUtLek5Z8CA/nbIHeDVR3sGUQZTH212OeXl
	 07M31/Gj7wLrfmn6MGsREfqpp+fOBLdieoOYmn3jwbe/8YT5SyvuPVnkrgDTwgqm/QbRL
	 WuAIO8PFWigF8A0XGeYs3XykoDD/1fbxnRclzSEn3QPNO/67+pMDYAkxy6+gy7/BhGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZtbZRwUP;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D928606A325
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D928606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZtbZRwUP
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2107212c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 08:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856541; x=1793461341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tD2feZvStARhEioc5t9JjRKN0PpC4uBKpPB9fxOPNPo=;
        b=ZtbZRwUPjVQiSvYWWtMu6dPTKilxoct/OWvipe27Jqf5G28IPqMi55WvuE+zmC1HFZ
         OL/Ws1vcN1cxGJpO+Encb1YRO3M6m7ZNiBAmayVlAcdZyFeDyQhifsfVwo9SDu6hSTPA
         TKIvnz8sRyd3ncvbREayOVyHYdssYPLAxON08pyahSkqyBOXzvbiavGi+fqdHUUdfod6
         HK/1coQjD6/w6rz3XnPKbUW/ynFejEsN1OyZb91Df29ZCCPys5qab05Vv/Ob8HkX2P68
         DHTLWYxdTt00EZ0Jh2N2krvQiRUSSrlNTmJwC0ujKCA3WmoSchFLq8pAwvMrKyQYRCSM
         SCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856541; x=1793461341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tD2feZvStARhEioc5t9JjRKN0PpC4uBKpPB9fxOPNPo=;
        b=KPdNTEvcNks3s9ybwhNSZLu5pFVDWPU8jhd2dXjNv2LsM7R+4mC0aUI8vOj68eJGS1
         6jeU7IrgfDwZyyfURDkUolOEdsR1JEfD+VWFtqZaqhDRqACRwKInE1fzuvwY1GgA3fc3
         SujFNGluA7Lmk/3DtgOhlIQHljD3K1/7nIob1LKQdHnnkAc+9AFn0oGjcvkSj2ug9hon
         TGiLH0BZrtCrCHFqKaD/5k0aK7txttssbgZ+O5gLwevBJ2J6uUmNbxqWi4uddF0gvYdp
         qP5dmVXMTR0YNJWMNOPtIxRJiPpQXWJakfGm73TdIvzWgpwFRcxgpsvimOXidiXi2SE1
         67Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwfN61ilVxb/AnkQZBrNqctSKpdga3xBafXeJOo8MPWH9PegDz1QJuOpJtk0ZVopGwkWi1g08ePc+Rc+As=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxpIyFPB48R3wUPzhI+5kYRLhGUQCxANm2eC9SJqMSGgA9i0CP
	VPYcVlE/kJizHHWdagE+mrzS8Fz70J53/z5SNj5ImRqTxpV+OMJuq6tN
X-Gm-Gg: AYBFou3AmGFWQAmoJt4l9xmKK3WJiyNa3+RciK5JGwKw3TlIy+AsYy2/WDxajOMk4tZ
	lVt6lY580Q4IWcfS/wbZqgRWqikWxp3gGkDkAlAb9P/D/P4ZRJBS3mDoSK4PDsy0GtPFUmrJqFt
	t8clnzD5rk7lyBUTbmb7i75s3w/3vq3tv+TZU9oDbffJiLXBGv3Aj8EZpvLpI+HSnlg9Ts7gpGj
	9CCwXywCqNkytixRvBb9f8y+5+wir/BFOOGCljsoAcjy8165JcwsUmbJEud2L50IW6U3Swzdaqz
	5e3ttUA6NjEneE+unscS56Edtw+FE9PYMo7Yz3YeFHwt0/RFxkMptq+gSRimxHccnhETYuXWJEg
	4uY57hL9hWECHQoSlIkkNpwmHBigJRsRU5ulAPl/FnIx8RkZ6Pk1jyET+zkwvZCqkUugpNiYnMx
	Wj4iY26TCGCcS5eksUVEaHDM8EyEoFFEPNDGciMsDzJ3/rTMlKel2NDYJ+VLS240bGYjGSljbo+
	PaGH0q7rNMgwjSdB++GEyxCX2nEUaG0dyApC9pXZh9URF3qNhrp3OE+pA==
X-Received: by 2002:a05:7022:5f06:b0:151:2e62:fe8a with SMTP id a92af1059eb24-199379c8064mr3258864c88.40.1792856540859;
        Sat, 24 Oct 2026 08:42:20 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:20 -0700 (PDT)
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
Subject: [RFC net-next 3/3] net: airoha: npu: use coherent memory for mailbox messages
Date: Sun, 25 Oct 2026 01:41:50 +1000
Message-ID: <20261024154150.45733-4-gilroyscott1970@gmail.com>
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

From: Daniel Pawlik <pawlik.dan@gmail.com>

airoha_npu_send_msg() maps the caller's kzalloc() buffer with
DMA_BIDIRECTIONAL. These buffers are small and not cacheline aligned,
so on arm64 the mapping bounces through swiotlb. On a 2 GiB EN7581
board the default swiotlb pool sits above 0xc0000000 (0xff6cf000 on
W1700K), outside the 0x80000000-0xbfffffff window the NPU can address;
higher addresses alias the lower 1 GiB. On W1700K + MT7996 this makes
WLAN_FUNC_GET_WAIT_NPU_VERSION read back 0.0 and mt76 does not bind
NPU offload.

Allocate one coherent buffer per NPU core at probe and reuse it under
the per-core mailbox lock. With the previous patch it comes from the
NPU DMA pool, inside the window. airoha_npu_send_msg() is also called
from PPE foe_commit under spin_lock_bh(), which rules out a per-message
GFP_ATOMIC coherent allocation.

Add __airoha_npu_send_msg() with an optional reply buffer so GET
callers copy only the trailing response payload; airoha_npu_send_msg()
keeps copying the whole buffer back, like the bidirectional mapping.

The original version of this patch was written with Cursor (composer-2);
it was rebased onto net-next and its commit message rewritten with
Claude (Anthropic).

Link: https://lore.kernel.org/r/20260809152813.585797-1-pawlik.dan@gmail.com
Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c  | 65 +++++++++++++++++------
 include/linux/soc/airoha/airoha_offload.h |  3 ++
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 069fd60680..3d1aa63dd5 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -24,6 +24,12 @@
 #define NPU_EN7581_FIRMWARE_RV32_MAX_SIZE	0x200000
 #define NPU_EN7581_FIRMWARE_DATA_MAX_SIZE	0x10000
 #define NPU_DUMP_SIZE				512
+/*
+ * Mailbox DMA payload size. Covers sizeof(struct ppe_mbox_data) (28) and
+ * WLAN TLV messages (header + payload); largest in-tree WLAN payload today
+ * is 16 bytes (INODE_TXRX_REG_ADDR). Keep headroom for future commands.
+ */
+#define AIROHA_NPU_MBOX_SIZE			256
 
 #define REG_NPU_LOCAL_SRAM		0x0
 
@@ -161,23 +167,32 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };
 
-static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
-			       void *p, int size)
+static int __airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+				 const void *data, int len, void *reply,
+				 u16 reply_len)
 {
-	u16 core = 0; /* FIXME */
-	u32 val, offset = core << 4;
-	dma_addr_t dma_addr;
+	struct airoha_npu_core *core = &npu->cores[0]; /* FIXME: core */
+	u32 val, offset = 0;
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(npu->dev, dma_addr);
-	if (ret)
-		return ret;
+	if (len > AIROHA_NPU_MBOX_SIZE)
+		return -EINVAL;
+
+	if (reply && reply_len > len)
+		return -EINVAL;
+
+	/*
+	 * The NPU only reaches DRAM at 0x80000000-0xbfffffff; a streaming
+	 * mapping of the caller buffer may bounce through swiotlb outside
+	 * that window. Use the probe-time coherent buffer, which comes from
+	 * the NPU DMA pool when one is declared.
+	 */
+	spin_lock_bh(&core->lock);
 
-	spin_lock_bh(&npu->cores[core].lock);
+	memcpy(core->buf, data, len);
 
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, dma_addr);
-	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, size);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(0) + offset, core->addr);
+	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(1) + offset, len);
 	regmap_read(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, &val);
 	regmap_write(npu->regmap, REG_CR_MBQ0_CTRL(2) + offset, val + 1);
 	val = FIELD_PREP(MBOX_MSG_FUNC_ID, func_id) | MBOX_MSG_WAIT_RSP;
@@ -190,13 +205,21 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 	if (!ret && FIELD_GET(MBOX_MSG_STATUS, val) != NPU_MBOX_SUCCESS)
 		ret = -EINVAL;
 
-	spin_unlock_bh(&npu->cores[core].lock);
+	/* Copy the trailing reply_len bytes of the response. */
+	if (!ret && reply)
+		memcpy(reply, core->buf + len - reply_len, reply_len);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	spin_unlock_bh(&core->lock);
 
 	return ret;
 }
 
+static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
+			       void *data, int len)
+{
+	return __airoha_npu_send_msg(npu, func_id, data, len, data, len);
+}
+
 static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
 				    const char *fw_name, int fw_max_size)
 {
@@ -500,9 +523,8 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	wlan_data->func_type = NPU_OP_GET;
 	wlan_data->func_id = func_id;
 
-	err = airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len);
-	if (!err)
-		memcpy(data, wlan_data->d, data_len);
+	err = __airoha_npu_send_msg(npu, NPU_FUNC_WIFI, wlan_data, len,
+				    data, data_len);
 	kfree(wlan_data);
 
 	return err;
@@ -794,6 +816,15 @@ static int airoha_npu_probe(struct platform_device *pdev)
 			return err;
 	}
 
+	for (i = 0; i < ARRAY_SIZE(npu->cores); i++) {
+		struct airoha_npu_core *core = &npu->cores[i];
+
+		core->buf = dmam_alloc_coherent(dev, AIROHA_NPU_MBOX_SIZE,
+						&core->addr, GFP_KERNEL);
+		if (!core->buf)
+			return -ENOMEM;
+	}
+
 	err = airoha_npu_run_firmware(dev, base, &res);
 	if (err)
 		return err;
diff --git a/include/linux/soc/airoha/airoha_offload.h b/include/linux/soc/airoha/airoha_offload.h
index 7589fccfee..16a988ad74 100644
--- a/include/linux/soc/airoha/airoha_offload.h
+++ b/include/linux/soc/airoha/airoha_offload.h
@@ -173,6 +173,9 @@ struct airoha_npu {
 		/* protect concurrent npu memory accesses */
 		spinlock_t lock;
 		struct work_struct wdt_work;
+		/* Coherent bounce buffer for mailbox cmd/rsp */
+		void *buf;
+		dma_addr_t addr;
 	} cores[NPU_NUM_CORES];
 
 	int irqs[NPU_NUM_IRQ];
-- 
2.53.0

