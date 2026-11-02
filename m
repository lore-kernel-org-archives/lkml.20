Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649822;
	b=Vo58medG9u4KMEGPl50WbmB31r++DzvEKNQXo8J9yEWL1H4mtZqSK8050YnHGquSDq3A
	 YGfs6c4Q27iCSm/VnXXJnUown5rfw/HqmL85bANVsHw3EM1is3clUW1rQsphSfBW/jXEI
	 89GzUqjfF3WkaZLdQy9IR5g5dYL24EiSsDhVv/bzxNNWQfor6TeYjcohm/k7tog4ZqYoy
	 CE6ZzT1ndyiYePUpWpIH3Q/iCdvy/HTaB6RjxYFRtY3ZmKI4gVCNORluc1UDKHeWqxlHl
	 BUNSLCtDlBpE2qlC/NFflP4Kw6gW6Nu9vCae3qF5+T6MZpw6yRWFh+FK99ETBE8471Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sJefuJOTT+32ADCOSJyFHXhfGqO6ALajK8RP+bOVKgs=;
	b=y2Xl0iXJGiJL8Y2N1SanB96MovitYAZo0UEHBp+68PtJ2rmEUXq1sWwFzlbOSNDK4DW9
	 i58KeH8A2WRN2pvGlHwsCNfzskEXFwVbkFL21o6VZYGnR7EzTv5eEpdoxR2gG3lxw8Qcz
	 Cqff5GJzFWPxWG5cdzdrwuu9+YkOTRnQn8xjLzvtoa42WnoS+WXrP8WvbX1YhMRYTJJnm
	 hggaetRBX7XRBHvDnG5TxZPRoSVScvcQHsvh8UtmlJ5wdDsAoUydmB5VpN4j7DvZ6Eqvn
	 WfuoXug+CIduN+g7T+4dJRKtIs2t7Z7pawAzFSPem5HOpBC5meDwU+WENwGW9le8Mjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AhdweSlQ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569CD606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 569CD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AhdweSlQ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3527484f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649821; x=1794254621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJefuJOTT+32ADCOSJyFHXhfGqO6ALajK8RP+bOVKgs=;
        b=AhdweSlQOnH/Y+sDrNV2/SSWEuIhvTxCEdRh4xZ17i/CyVLecFZmmiro+UbGpCgkJh
         OpCU7cpZjbc5ZgR5TNXBk3OSvOHIdW0UOwS6CMJw4fo8/VUB5hOLFZ98f7QM2Miq/32w
         Ztlz+C5TMHSBmr3dPkRz2vms9wcqJ5t02UWkENHI7YT4qbZgcn7dXJlicwuFhDSENNrW
         jNHj3lFlaJ/OkHqZJRdoddZuNnrNi3PWLgr0D0qsMArjHUyevwStpAy3DG44lSt18VsA
         pSeqa5zGy8438lwThe+mbHuDX7dNFYO/W5VqG01b6tMYTObIxnNccygZ+pATQekQUKDK
         qNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649821; x=1794254621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJefuJOTT+32ADCOSJyFHXhfGqO6ALajK8RP+bOVKgs=;
        b=bS9oerWZT3OPk502w2GY64IZgylY8t8OrKQViIE4NB/OGDsVp1LDK6iJWRuXtyv6Q2
         wlPUaW5zSF/jeOAkGqjPvH5uBk71zuZacsLBBau69aVxdzQwraYpgt3fDYPP0KrZptk1
         sUyn6WTMbUJU2b0ETlRTmggz3R4UlH3Y16y7y6a7JRyEYyluFZ7+kkz7e/rk+IueXbi+
         Y40BS+T9Y/wsHJj9NF3zQWDS8jHH8ZaJD8GC/ceguTMVEVLVvh2aVaqaMVp1HiJwmO6o
         Ex5gkSNUiacYQv3EmjuX3G+hFgbsPWACKw+KT37x0IZfKNJ4FTLAjSMUGNaARYN1LKgL
         BLHg==
X-Forwarded-Encrypted: i=1; AKwUvBzb2pUnoeGtb+5B4ZwCgy/+Vu0iggNR9jPz3MQYT4/MkEaAW12NS4bu/sfq0rS84bkn5fPRDSl6SulYWq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CBzg+TiF68XBe2jzRYmAqUFDw3fRIr+KtNnoW1npOCW/6OjSi
	tQnCmpKAAig5v0nJtk1Ta09g0Cfhim+s0CXrFXBh+nxEBIa/hLdbQlb+
X-Gm-Gg: AYBFou0OTrAK0bR3DiiF1R6NmgSubBC1xctkorKOXE6XNbCHfLIJX8lvB7DskgCY8sk
	jyuFX1rIeHMov01doyjSijBfIOXjqve9urQtBCL7R7wmKdwM/d+1bv4YDPhiD+/ggtcb9N68pe+
	+KWwHEPd3m3TMiQ1Ct2eKEkOQ96jguSVaUxfzZny7jABaMt6zKHbkiF2o4utWh2uMR5oDLrqx8K
	J9UfeHGLGdMZ1wNyAFwLLXpuicE2hvHVU8LdzCHGIJs/7aNmmmiJdS48shNPAIep9+zRYK2ODS6
	T5vby6/ieDAP7IKk6LE9VpOoYer4wq4XAV39vmBFAFlc3GagiyuDcNBZ+EfRpSaGMYPzX4U6mKn
	zjMX5QFOeBgJGaVfTawvv5Ny3uE1FMM0ahDoeNukljZrh1FKEFjqHnzU+sOdNsGqccWiYMpUcfR
	b77yVV4l8qHCiS5FAkK/9RDF9CMvjklIJDhewiiaRmUYS1jF5bSedqUeodt8R7/JHeEB4xbxVwX
	XdfPxSeg/rpPyoJJNj52+mhxIuQv3V5rnlyStMs6oOIv7+Y5WbvTxPCWhAWuNkz69IXIvWY3Q5o
	1g/FgwqTXdbzHZmK20d7iDCXE4HfrSlCP+cRAjWInTL1U905D2ZtHw9WMiiS/UiCOyW9T//ecFB
	JoYIxVxvEn7wwJjzAeTzOpal0fyaKM22cc72MhH4TSHGMcYwAqBTjJDaHqQURuLmd8dDi/yBT60
	vlwz8ovnQQfxU=
X-Received: by 2002:a5d:5f56:0:b0:48e:60ed:b017 with SMTP id ffacd0b85a97d-48e6e302ab0mr23631665f8f.20.1793649820578;
        Mon, 02 Nov 2026 12:03:40 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (158-199.dsl.iskon.hr. [89.164.158.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm21191574f8f.47.2026.11.02.12.03.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 12:03:40 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v2 2/2] wifi: ath12k: skip unknown direct buffer ring module IDs
Date: Mon,  2 Nov 2026 21:02:35 +0100
Message-ID: <20261102200235.48973-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102200235.48973-1-gsustek@gmail.com>
References: <20261102200235.48973-1-gsustek@gmail.com>
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

QCN9274 firmware WLAN.WBE.1.6-01243 advertises direct buffer rings for
module IDs 2 (CV upload) and 3 (Wi-Fi radar), one entry per radio.
ath12k_wmi_dma_ring_caps() treats any ID at or above
WMI_DIRECT_BUF_MAX as fatal:

  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

It frees the capabilities stored so far and aborts the parse of the
rest of the service ready ext event. Initialisation continues only
because the service ready ext2 event completes it.

An unknown ID is not an error. The firmware uses a direct buffer ring
only after the host configures it with WMI_PDEV_DMA_RING_CFG_REQ_CMDID,
and the host does that only for a feature it implements. Skip unknown
module IDs with a debug message instead.

Store the accepted entries contiguously and set num_db_cap to the
number actually stored. ath12k_wmi_alloc_dbring_caps() zero-fills the
array, so a skipped entry left in place would read as a spectral ring
with zero sizes. No code reads db_caps today, but a future spectral
user would.

This follows Nazar Mokrynskyi's earlier version, with the separate
count of stored entries that Jeff Johnson suggested in its review.

Link: https://lore.kernel.org/linux-wireless/20260505172415.566328-3-nazar@mokrynskyi.com/
Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v2: commit message reworded (firmware behaviour, credits); code
    comment corrected.

 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..c5ff5b4d9141 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4988,8 +4988,8 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 	struct ath12k_wmi_dma_ring_caps_parse *dma_caps_parse = data;
 	struct ath12k_wmi_dma_ring_caps_params *dma_caps;
 	struct ath12k_dbring_cap *dir_buff_caps;
+	u32 i, n = 0, module_id;
 	int ret;
-	u32 i;
 
 	dma_caps_parse->n_dma_ring_caps = 0;
 	dma_caps = (struct ath12k_wmi_dma_ring_caps_params *)ptr;
@@ -5015,26 +5015,39 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 
 	dir_buff_caps = ab->db_caps;
 	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
-		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
-			ath12k_warn(ab, "Invalid module id %d\n",
-				    le32_to_cpu(dma_caps[i].module_id));
-			ret = -EINVAL;
-			goto free_dir_buff;
+		module_id = le32_to_cpu(dma_caps[i].module_id);
+
+		/* Firmware may advertise rings for modules this driver
+		 * does not implement. It uses a ring only after the host
+		 * configures it, so skipping the entry is safe.
+		 */
+		if (module_id >= WMI_DIRECT_BUF_MAX) {
+			ath12k_dbg(ab, ATH12K_DBG_WMI,
+				   "skipping dma ring caps of unknown module id %u\n",
+				   module_id);
+			continue;
 		}
 
-		dir_buff_caps[i].id = le32_to_cpu(dma_caps[i].module_id);
-		dir_buff_caps[i].pdev_id =
+		dir_buff_caps[n].id = module_id;
+		dir_buff_caps[n].pdev_id =
 			DP_HW2SW_MACID(le32_to_cpu(dma_caps[i].pdev_id));
-		dir_buff_caps[i].min_elem = le32_to_cpu(dma_caps[i].min_elem);
-		dir_buff_caps[i].min_buf_sz = le32_to_cpu(dma_caps[i].min_buf_sz);
-		dir_buff_caps[i].min_buf_align = le32_to_cpu(dma_caps[i].min_buf_align);
+		dir_buff_caps[n].min_elem = le32_to_cpu(dma_caps[i].min_elem);
+		dir_buff_caps[n].min_buf_sz = le32_to_cpu(dma_caps[i].min_buf_sz);
+		dir_buff_caps[n].min_buf_align = le32_to_cpu(dma_caps[i].min_buf_align);
+		n++;
 	}
 
-	return 0;
+	if (!n) {
+		ath12k_wmi_free_dbring_caps(ab);
+		return 0;
+	}
 
-free_dir_buff:
-	ath12k_wmi_free_dbring_caps(ab);
-	return ret;
+	/* count only the entries stored, so no zeroed entry looks like
+	 * a spectral ring
+	 */
+	ab->num_db_cap = n;
+
+	return 0;
 }
 
 static void
-- 
2.56.0

