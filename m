Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794270096;
	b=y+iG64BrzXuWnNHdlF/OlFC7k+GkfmW01ljHOgf+/Q1JMGGHdPeII95CMPyzLnRJxdKG
	 vH7//YrOrwB8GMG2aTj1c6OxmDY9okR4KYXm2bqdU/UXUFjs0EIJ74INY3WmqXyOxQaIv
	 sSFOeg1tsEaRKU9ez+8R1VsFr426qDCIiOdbvyrO9lIkVfrLpKMkxBlvRTO3llnaqA2Vl
	 v8ZUU9rZ95GtVgejJVrikZ9XxeXGSFaOALd46u5Y6OAFxzTEVwIxNnl54kWmKvR6V1nuV
	 kxmtzGqIvZo0WYeDIMQOq4eQALa0kZaT8FAg31P+QwIbi95Hn6Qg1yeDfi0961fLHDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794270096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=;
	b=vlHDby+BuR1RUMQGcbKZOJak4E72W3o9Tzd6LXXpzPqSQ5bFQtEcggFw7Tw9A0SshFre
	 7pzzXRMDvBQymOr4wyciDCJQPavSVxLUfqh7r7F0vuj/ixRPCK0c8hkWmpIpFYfOjcl3b
	 d+Z8fVBEwGSPO5hY2BiGtC+VfYmu60hdZyih0j1qDognhOqtKT8jQEHRJb1yq1GH15tj0
	 NWrQCArlhxGqnums/NM7fRY4kLfHzgJtC30ivXqE6hnXc6e9liD6bkzQUX3Y6l/FviHOn
	 Q2l1Tpy3UT0urRR/JLyNT5mLmdTMJwKd74VH/QIIYMDJOqZnu8gBECpP1VnJkQyUcxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ik9GbU/o";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F51860A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F51860A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ik9GbU/o
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10541305e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794270093; x=1794874893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=;
        b=Ik9GbU/ocJuTfNtmWcfJunKlWBGx/v7FS/ld4VaxP4HVzoLiQdH+b59l3GXys3RFwW
         BklJ4IqjizWUEFJuhYlcRY2bKaZTOKVRZ0uJwsz19z+zxfSoIB5/VFKqrF8KzMPW4YQC
         BMV2bvm/3j0kcj2SsNHxEE2DzTm/1oiINUy/yqNRjWj2OFrbIRE8qRn+RdkuJzT8fbWm
         pUj78BbdAe1b5/hIB8eRKPKWiAwxy2Z+y6sGGdvXuBVLZpToyLkRVP7mCAhTsJP3dHEG
         xSwJmIaWrxx1/XSW9U0kFF4qpPuPbrsEJdmDG6NNh+fmxwA74fZfFqMbhvLpoSOGIKLV
         kDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794270093; x=1794874893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DN0p4HjtDRTBAnIlfbTGxKJKdhItG28gAVHDNaAhgTs=;
        b=DMXxkm4EEgAhmvqtSIgDUCTpAEjcQqUklGzLLG1nolFR2Rwg/m1tDCrBJeB5iZK7Ay
         Yhq61lwwb42HlMB4ddB6NlLLdINM/XJ7JIvaPLaoUqrhxL4916W62We0PuL6VcoRocQT
         mJkC/NVb9dr8vREoBeC9Qcn6hXf8FLL0GDFjl/+rjrxBL4wz0kpX2OX8TXP//Ihe0eFr
         RSKVE9VrD+fefMc9RdpIaltInv6VkfmN4Tcg4DELzGQgNrhNi05PAR+lorPdheXB4+Od
         R8S6vmxK3PnEjyRiI469dGVhDkcsMxowYm7bQ/gPNhL+Xbn2eYn8GhW6ZfPXg896i22f
         2Amg==
X-Forwarded-Encrypted: i=1; AL+hErEi6SeYBG5advXG5K8KBYC8WTO3UoUlyX8ast3zKOUJwi/zifiQWfb4nVZlUU+bG7nP0H5OMZ1lb0N+WFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+beeHWbRTVbyLPpV04LCON+6FIXZLXesH98w/qURKyThrLE/In
	RnYFtjUzWM5ialjHYfDIBg8p2+HFUnNM0VSqqO/9VunHAy1GpU3k6VU/
X-Gm-Gg: AYBFou2qmFLT6pE3p/demKoOorOXKKGMzhafmFwPHQx23yj/E0qbjEe0bZY2lgt6Cpi
	UmZPabvho0yPC0uRyaP01hwGL8ICBy+eqmVhZVW1qQv4RQcb4LCeIlbveTf20F5HqbD3mNCx1fA
	RJwupOkIXusTuLNaoJU44MPJJwpUxzvmYARUeeBsxCSlCVHaMJ7RPg+jCcT2KXniOYjnnj0JUPI
	UtK7RaVFgrvDW9CrqcYmLQ8KXZjx+k5/y2z2clXG5udHEwAgFycVGfUMUsYw5xoZiP75DnURb98
	i4uyIzRiJiGHv4H5MBYZVuqvYp5mNVmw63UJpv61jexaoRYD1KSnEKQYk0mkGvn0AZwvEV7X2e8
	CLMBa+cGYLuaoCNNVwCagbWaL4HTPjutshuh+z4xl3aqnaHtL8D+KdeL+srHR6UP1YUuWvVT0/H
	R3EFqBdnMZjVFqecoN8VOaTqOOTUHpZnUNTZkfxtA1SUD3CjU3JJAA9R/yqT17Cdm+3+tF7YluW
	QsXB/gsb8MYtjdsN8B0jccf87lQ+7XF70NhWU/WYSuF/UKGYtGalNMeXVRbNVUtoFBk23GOB2ZJ
	oMjbQZ6VdEDKof1m0X0uZVJR5Z8KbLAM+l9AldqVESUSLWAPG7u9jZgEjp3RQmvsTpk5vWDble4
	5IvmB7HG/KQL9lOW5kK/jLeO9SLqw5yf+oK8iMWYQLK6PqXKTJBL+pIo0ataEH9wtUvSX/4uzwq
	FdGuebR4qydU/W1ID/AEVkOuE=
X-Received: by 2002:a05:600c:1d8c:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4ba02358712mr12177855e9.32.1794270093423;
        Mon, 09 Nov 2026 16:21:33 -0800 (PST)
Received: from ADM-D9YH122JTV.home.lan (141-136-138-190.dsl.iskon.hr. [141.136.138.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea9eesm40106255e9.11.2026.11.09.16.21.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 16:21:33 -0800 (PST)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Nazar Mokrynskyi <nazar@mokrynskyi.com>
Subject: [PATCH ath-next v3 2/2] wifi: ath12k: skip unknown direct buffer ring module IDs
Date: Tue, 10 Nov 2026 01:21:21 +0100
Message-ID: <20261110002121.90167-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110002121.90167-1-gsustek@gmail.com>
References: <20261110002121.90167-1-gsustek@gmail.com>
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
module IDs 2 (CV upload) and 3 (Wi-Fi radar). ath12k_wmi_dma_ring_caps()
treats any ID at or above WMI_DIRECT_BUF_MAX as fatal:

  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

It frees the capabilities stored so far and aborts the parse of the
service ready ext event; initialisation continues only because the
service ready ext2 event completes it.

An unknown ID is not an error: the firmware uses a ring only after the
host configures it, and the host does that only for a feature it
implements. Skip such entries with a warning, as for an unsupported
memory type in ath12k_qmi_alloc_target_mem_chunk(). Store the accepted
entries contiguously and set num_db_cap to the stored count, so that a
skipped entry cannot read as a zero-sized spectral ring.

Based on Nazar Mokrynskyi's version, with the separate count that Jeff
Johnson suggested in its review.

Link: https://lore.kernel.org/linux-wireless/20260505172415.566328-3-nazar@mokrynskyi.com/
Suggested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
v3: warning instead of a debug message for a skipped entry
v2: commit message and comment reworded

 drivers/net/wireless/ath/ath12k/wmi.c | 43 +++++++++++++++++----------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f41138a7c68e..9720bed21631 100644
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
+		 * configures it, so skipping the entry is safe. Warn, as
+		 * for an unsupported memory type, so the gap is visible.
+		 */
+		if (module_id >= WMI_DIRECT_BUF_MAX) {
+			ath12k_warn(ab, "dma ring caps for module id %u not supported, skipping\n",
+				    module_id);
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

