Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3841A55B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345756; cv=none; b=hjEctbwaWe4ux6DyGNgik6fSFU6KbWmo43JbkYDgngNf3M33ydSpeiptFKa8Q1rGYVYUDiknrRilNhVgA3BZRCY07v3fdcwjOOqW541WWVpWweQVt+I80rraXtDVvMpRl06zQD4fmYKGIByN7ZoaCbMuT4GA05Ox0xCu3hOeDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345756; c=relaxed/simple;
	bh=fMscZ0EQ9LcA7nbULHN90ctur9xt7NjcXTGAePOgrNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQY0Jt5kmsB2x5/NZ/vOWbdCUfv5jWjWdNfpgGolK5b/zwocb2VVpleEodtSzmxxXQ9yxR03BrOWip+RP7tpD707/CKR2HBfxthau3Uh5EFgHCx38v1z3qxyTbOjjOQ3IRnuc1lOyXz3SNDBUlzJT92EjwMgCu7CRWGRvlwg1H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=Gt1JedHE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="Gt1JedHE"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c315869241fso138563566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345753; x=1792950553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tuCTSvy3W9YsRWTjeFGMCJACiAvnleVZWYIRp6x/ts=;
        b=Gt1JedHEJFQCODC4gZI0dVmCue+LoO92TOLzwYKFa/zF8kJNYsI412Q1ByAgS5upOZ
         wL0tZa7cHeD7FrCojaBlL3/qWjMiWSQkDTvQWl37di+iSawbinAy3bjdFpWxOtxX7xEA
         3Y9jdpM07RUTWIHoVvB/rnqUmxTlMWPQW/mbzkLyaa3fUDxauEWj42p0SbtJkmiXaPmj
         hByB66zQqHkvqFkqG+Kn+urcxSs6fKBoi6iqNsWswgfuz7BLbWRjUWZwnpXMvG8vLj3b
         i9P+o+KnGlv4wPCNKu4x3pOOfUqWgqpow6JKzDAEX7/CnDRewAFrVGh0bHvoOBTnCIpZ
         Co9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345753; x=1792950553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2tuCTSvy3W9YsRWTjeFGMCJACiAvnleVZWYIRp6x/ts=;
        b=1rjGwt0MKpO+6tIiaW6f4o4WcYJ6+QXBE0FYuKiRKvvbZe5eEU50UL1ggrV9H8kPbw
         emXYAkOboFDC0kEw6Pe8uPArAI8i0CWmfqQGJOSvSFqkDW4H0/zCjqxhgdoCS0g7JTDW
         m59EJBxDXSFgyB3ETjPC/M8gnrMmWeeYBC2bFq1h6J0EfmkmgNqWr0/W9lKYZ1bKadS0
         yShHhDfGQ80fHysCcvIwC/Ca4OcbGjmvNR0sWEtBdCGyc5EcqsiKPLzkbx4F/0eKfp4X
         jpgXTuTaZDckjBD0VmDWXcfZtkDp7B4dsRcgO9P14TFr9fHk1nXk2aUcNWk5pDPVfSg1
         66iA==
X-Forwarded-Encrypted: i=1; AKwUvBw223rxFEuzrtiVN+CGuUFuKKHKEYOL4hG1yuGU2F3YknSouifW8d5MsZ3L1uZs0bHNBnQmsRBpAkbAnGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKtKIHbpmUUHuACe/JfCDTsIb66xBK6MA0Pc/Xv3Mh204emt5e
	wNfJIXJMv9HBg62/ICekoWz49UyqyR6b93jrkK6BeZjX2D/MBD2T6LstW2beQcRCRQ==
X-Gm-Gg: AYBFou1kfnkm3p90+DzSIMK3ef6l9dkCoe/l0kTpAhNqnDlupvFOLMLcYmnawXxpPKE
	C/aRAvcJYYwQQBqRGON+U23VSe9E+5WK6ZZ9VBHFiXTjexyudSgYLsAKeZppPIFSNJ568PLt+Fx
	NpTl8qChhnqHI+fBkS8PoMQki8MnAVkNOe3DaF3Y46a7Acrc/Pfl0imyYjmdWXYU4R57303uyAC
	JB9bk4akNd9AhA3LBRVUjSoXtdUrRFIkm3UAbkUW1EIbjl25a0szeSkdkBnTe0JQCkdFiM6aYKy
	3Mh/sya2CbximBDPVB4zMPKz/h8MN331jESzaCq7rSC2OmpgzYJhOR7/bBW3FG0YuTmDo28LCAd
	4K7mhOXG/ccL3KWJxx8YMtRRh1ZSZ08edgf0EBfvO+F8+ylZCIv6T9Sn99/DZSmiWzOmd5iI8Wi
	jEwCBUVxBpeJRYGl6f7cohnLlVficpvrzkfqhfzsxUk5AthmtuqPP/CPTpvoiER+3wbjbw571Oj
	ooLAa1JPFF0uz0aF8VR0J0Ne8+D9rsoOTyfrLTVLJRAQEzqMv7O6y/OeO+QLsxvZud5x2JSlT7s
	Gzhy/PGhXZyPb5p/biCrJMe1KYj+Lbc375MmC0gfrrFsRddieSjbM1Zeyn3gpV8avMnf52KwAQb
	nXQwfrO1jYpshy4RzPRCGdI2kAgL9x97H61fzSuc9iJVKHXS6RZ37z0suQ83oiSLnpjHovBvxzR
	y3nYKz0vqv
X-Received: by 2002:a17:906:f5a3:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c4196f9c1b1mr371299066b.0.1792345753149;
        Sun, 18 Oct 2026 10:49:13 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:12 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 3/9] wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
Date: Sun, 18 Oct 2026 19:48:58 +0200
Message-ID: <20261018174904.1757161-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing shows ar->dp.num_tx_pending, the MSDUs the hardware has not
completed. Print it per radio in soc_dp_stats. Divided into the pending
airtime in a station's aql file, it gives the airtime AQL charges per
MSDU.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/debugfs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/debugfs.c b/drivers/net/wireless/ath/ath11k/debugfs.c
index 70922612d3fb9..ffe1f466aefb6 100644
--- a/drivers/net/wireless/ath/ath11k/debugfs.c
+++ b/drivers/net/wireless/ath/ath11k/debugfs.c
@@ -714,6 +714,16 @@ static ssize_t ath11k_debugfs_dump_soc_dp_stats(struct file *file,
 			 "\nMisc Transmit Failures: %d\n",
 			 atomic_read(&soc_stats->tx_err.misc_fail));
 
+	/* Descriptors the hardware has not completed. */
+	len += scnprintf(buf + len, size - len, "\nPending Tx MSDUs:\n");
+	for (i = 0; i < ab->num_radios; i++) {
+		struct ath11k *ar = ab->pdevs[i].ar;
+
+		if (ar)
+			len += scnprintf(buf + len, size - len, "radio%d: %d\n",
+					 i, atomic_read(&ar->dp.num_tx_pending));
+	}
+
 	len += ath11k_debugfs_dump_soc_ring_bp_stats(ab, buf + len, size - len);
 
 	if (len > size)
-- 
2.53.0

