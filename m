Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793398122;
	b=QNvW2FvL9UBznhZo0QbesGER8cnol7StNNDtGjhFwvb+4pQdloBvhYTuIzLqYdke5A++
	 gQozKoQd6stM4Vqy0RfO5CnXconBcmE5dy1dloQc8+1RHqlSZtTx2WkZDj/zotzs1HfEB
	 jERDw9/CaeQCPSNn+6/TZXb/7rmm7neix7R5qBtbk3OwZuPcVWbhnYHEVqv/LSndrHt2G
	 zaD/xA9AyXjjhDPXAkPHwzVmqF43qVNBlydsCWC5D22+ZjvohOI0IFuZ9ytXU7m0nKOyC
	 WUBVyFtYi8J4aev2kQ7iTTe+RdhlltriVF4Xc8pPknfXcy+CLKot1Gh8RRyinOY1HVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793398122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pye18a12Mt0GkSw7sJj+cBOXoMwNJjFwpHtVV9nHTBQ=;
	b=MZ3yoCreipKvIItM9fpIgtljEw+ByP2I1htr9DcurDimEuOsoEdPziYZwDAV5UuHl72/
	 cciyFbTu51OmvO1syTjriZYmgb/44izl/+v1pO3EZix8JQqZ0ZWKKj4ObVw3rrYmANJXe
	 Dh022GFxaKoGOxYTe+bjlAzna9mV/CRaYCme4iq2FqMxSN9sZ7JEuJLRowZANKIS7lSQx
	 LuXEep5N/T4n9x8IEMVAqzh7W6ZqKvbX2jhXWCMhS3ieKpAvNHa0MiZQlPA3X2VagAJXr
	 ozMhAIfVRIqXpd3Rzkfy10lPnGF7/lQq2tcAzIUoqvDPdRZxTIIlI7aWKuL9s9e4Rhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnmewSsL;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55785606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55785606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnmewSsL
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so7396765e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793398121; x=1794002921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pye18a12Mt0GkSw7sJj+cBOXoMwNJjFwpHtVV9nHTBQ=;
        b=MnmewSsLup4jlaPeETsaD4WcEc8i49f0eTqi+NUjJort1TS9RcvTFCS6TnaAHWFusj
         au5Lw8wH0pI2S1at1Chtr6IOZjdv82hTevEf0vHgEiVQGN8V9MIPyemJ4sTVBqRqOBZF
         r+wQvWIzQVQ9qQ+OWwlFCEB/QhZFAjMmdB9HQPjpQY7x94EQwNFOnUsSMKCoXco0nqMW
         oFFVrAm3lLLZb86wRc8hRoMTZ/MMl6NtPX1quYSovOko/Rs1+XnY4gIwVC3PWrpJKill
         XaDWvQlhk2u6t5ywP7aZ1P3gWQo5IibMMFdsYMUv5q/zd45E++Bp6sISwlSn84O1BNsd
         +82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793398121; x=1794002921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pye18a12Mt0GkSw7sJj+cBOXoMwNJjFwpHtVV9nHTBQ=;
        b=NKrKE5LqPKKB12SUzDNUn66VpY39sAvPaAYkzNPgPvIbzdXfMuvvXisd39GHoPu+Qo
         kkr5NANPh3yXshHKjkE4+8kMuuTanb624nVsrCxfeEYd4hFPRtg/6duOP0TJrN1lvOt1
         EFXpm0rnRgChIDgCytSjeJ+Cjnij+uygJrAK0i+F9qtHHB593YlvwG2edzpTleqQP8bT
         zzeQ8zLHOj8/LFN6xwjyE9iLCH7b3MslaVmixE/haQYmuBoLhojTHMubaFD01GuGeGTR
         K6a0gOA4FO1jeMz1ZPWGgv6KJEKeFU37Q/eaZ9yZ8WtBlWiwo1xz4XwockocbdvzAYC9
         gtFA==
X-Forwarded-Encrypted: i=1; AKwUvBzUohAEKwelJ3dY16ySkclGspZTuM+Vvb3zBpg35/jQwLShyCf7eJ/74NLsu2ib0AoQ3Y0FFf9uBzSLMqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEP8mQNgkP8hgZA+5TK60v2zdPCi+aGFy9vbl1kNVm0Qwsl7Ly
	h4b2BxRPlwJBTSLbARINAnNQXuDOQoOl+NMHPTOfp/c7pPucr7gX813sJjiV0jAZ
X-Gm-Gg: AYBFou3Cxps5TOkz9oKqA23amhpZ4tM+ZZaqTb1Xpy1vIj2Zi5wua5e4lq0q1waXgEo
	lTdVEGvo2kc+h7ess4cjmCXI2lwLefoxApHdZ5YU7oylQlDx4dQ8y61o1AdF8UIScHf5lRkfJs9
	5+9q3ciNeOkGB3x2js21SKscGBdUHdo6aX9S5STeN2UibN7xQEWL3Lm2qa0lcUAdiRkNrjzrOI/
	cRiANUfpPLNNQY9un1PzpwKlOj322JVstNf1NRpxSgNivqQ8v8ck+cPAaG+qwn3XetPK/63onbV
	lGv4smhdLDtdFb/Unrcn0rOT5AycWgY6qO3RfXX8UfC67+F2iPtFaTqcZjVMfwOHEfEl83SPrF/
	MR9Q1plbNvuh7998KOXT3SumEAvcxShP7F5+jJ84dqTvXBU9DRWBMoo6bkNsyVUagXwfugSqR3+
	YSFe8hRzXFVMPVRo5o0xnSpz6uQpQaOJq4sbgULe4PBpbUc4E3RdKpObCAO1Xj746QNIptV43eJ
	iqR60/ZuHURDXQBpz5ne1eGFoa/Fx5m4o9L3sN+lrMeKnevgkRLVVhECsAMCbaIz7CG6QdTqfKI
	h2QbyXwQdehNvJqdostC61IQedzcdPCmovdC4NX4lyMeeADLP0mGm5ZXBrxMGl+aVHy5n2nWlIj
	CUD4CFfdmPsZTuvj2uP3qd9amPz6jWCVFwZo7jSCU/6rVe+CUMFgJEG07oQ==
X-Received: by 2002:a05:600c:3b1a:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4ac18c73d17mr79226395e9.28.1793398120539;
        Fri, 30 Oct 2026 15:08:40 -0700 (PDT)
Received: from u1804.home.lan (152-43.dsl.iskon.hr. [89.164.152.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm56230305e9.0.2026.10.30.15.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:08:40 -0700 (PDT)
From: Goran Sustek <gsustek@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next 2/3] wifi: ath12k: skip unknown direct buffer ring module IDs
Date: Fri, 30 Oct 2026 23:08:23 +0100
Message-ID: <20261030220824.915760-3-gsustek@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030220824.915760-1-gsustek@gmail.com>
References: <20261030220824.915760-1-gsustek@gmail.com>
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

Newer firmware may advertise direct buffer rings for modules the
driver does not know. QCN9274 firmware WLAN.WBE.1.6-01243 lists
module 2, and ath12k_wmi_dma_ring_caps() treats it as fatal:

  ath12k_wifi7_pci 0000:06:00.0: Invalid module id 2
  ath12k_wifi7_pci 0000:06:00.0: failed to parse tlv -22

It frees the capabilities stored so far and aborts the parse of the
rest of the service ready ext event. Initialisation continues only
because the service ready ext2 event completes it.

Skip unknown module IDs with a debug message instead; the driver only
sets up rings for the modules it implements. Store the accepted
entries contiguously and set num_db_cap to the number actually stored:
ath12k_wmi_alloc_dbring_caps() zero-fills the array, so a hole left at
the index of a skipped entry would read as a spectral ring with zero
sizes.

Tested as part of the series.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Signed-off-by: Goran Sustek <gsustek@gmail.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c |   43 +++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index d5160af60e00..4d4f8e9caf07 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4938,8 +4938,8 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 	struct ath12k_wmi_dma_ring_caps_parse *dma_caps_parse = data;
 	struct ath12k_wmi_dma_ring_caps_params *dma_caps;
 	struct ath12k_dbring_cap *dir_buff_caps;
+	u32 i, n = 0, module_id;
 	int ret;
-	u32 i;
 
 	dma_caps_parse->n_dma_ring_caps = 0;
 	dma_caps = (struct ath12k_wmi_dma_ring_caps_params *)ptr;
@@ -4965,26 +4965,39 @@ static int ath12k_wmi_dma_ring_caps(struct ath12k_base *ab,
 
 	dir_buff_caps = ab->db_caps;
 	for (i = 0; i < dma_caps_parse->n_dma_ring_caps; i++) {
-		if (le32_to_cpu(dma_caps[i].module_id) >= WMI_DIRECT_BUF_MAX) {
-			ath12k_warn(ab, "Invalid module id %d\n",
-				    le32_to_cpu(dma_caps[i].module_id));
-			ret = -EINVAL;
-			goto free_dir_buff;
+		module_id = le32_to_cpu(dma_caps[i].module_id);
+
+		/* Newer firmware may advertise rings for modules this driver
+		 * does not know yet. Skip them; the driver only sets up rings
+		 * for the modules it implements.
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
2.47.0
