Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461751;
	b=1vurLbVQUm5XpkfPNnA2D27tCy2UHJva89VHI+Sye0DiKKqFb6G8ZbU5fFqIwRLiwvkA
	 hoT5R2mUYBAN0sCZVxiYgdyaaZlj+uwboI2bFfecxV383C79K6ewT1y5HIUjgisFOhAVp
	 knOd8nGC2NV9sWuUxuIg1IEl9JRK7G5WN8lctiec2A9kebvBGT0g9YycE+IW/86oFIRBF
	 Mf9aNTHgunCImd9ftUsOGak4uLZqzkuHwdcoFaznp/vPQKMuuJauUlaG2R2aE/ne3qx+q
	 LsEv5NCbvfMc5dpGAxlQyWf6e6i6aZk3b4RuB63NcXqJmINzParc8QvbRdeMNt8bgfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=W03mtvJmXv5lV46WeqhSpT3vDoaPNgnpXDsHZhEZiaUg/jkyTwG729o3z9ouTsuqY6rF
	 +PD5umxCExdDHEnC+xKNTqDMfBj77YF4nsOlxd8NAXEs/oHvk9Kvjv80kKy5d7fhGZDSn
	 erDRHkIT1hHu5tjsB3h+GVQpZHmi9pAen+RtwbKI+hi6WIHjRYmSzou61EqN+ClzBEVTF
	 VsLujTkrP7MPyGg4gSRh6YTDOI1v8Qph/RV4vHqoiso/dygaaEw+1Xm3jayI2sFDqMZG4
	 Ipz9KZQimVFblppXq2WRotlM/DqkfED1WfcgmOIstnWt7KcVWjt6vaCFRLAgQiR1zwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TI5BID5;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A0606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719A0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TI5BID5
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1438d9363fbso319084c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461751; x=1795066551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=0TI5BID5zIUzBPJbxT5G/q+VhgeuGtoeikmkndVomxQQCRE5UEu7xhdgbxcVkEwfv8
         3aj+oULsiIX6vq321kSfh+CvND1tlBQkLjOvOfuREpU/i6YKcnzXyWf+ZDD+hkxsmyWv
         fysdTYvHjQ2i2ol7hr9CQgT/TU57B1K2H1IZ9uxm3lfF2OsLoncaCxh5uC2wz2qQCo6L
         p53xzUaLGVmw5nqFE3btlf/Goh7u/OxEy5K9Vhen4Isw2j9x0SnxwRf7cEmhcnkijARx
         b5nMZo5qFErxfYeUPBo74n9YEWC+6+L6niBxqEOxUbU9yCNii5B1wysgjZ6K8QBAB+WF
         QPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461751; x=1795066551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=QFxOiIkjpckRQId3XNUamgCUqQ2m1qJdNlpyoxAdyUrPBc6TBkzNS9y987Y5MG2JkA
         vopsPQ4R8Vuk7gSjBNYiEGYvEMnjodgui6pGtQQo0H9Cou4Ub9fmPeIgyt8oDH0rkajA
         LxSDkWfwF2wz+rxNcvJ405lJmfcMb1mOVSHpKm28BjtCFxczHTg4qU29z1DUC9r4i+RZ
         RYe5+TFYM4QkwprCeKFVhgwAPSmTPIEaMiQ84LFJTtGxzUVCDXqsRj7usMshLGq0nJiX
         tes+z57qx+O/cKiBeDImE/rv/SdP07THSSEh7H83cG4SMrNN7GkXnVjosrj1UFVMPiLi
         7p5Q==
X-Forwarded-Encrypted: i=1; AL+hErECvdpLUBhTIFiT7Mrk3+o0dLjuRUW01PZx90pCmoV0LcwbXO7Bcln2ifZt95g1qJCn+GikeLb/Wc8nGWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UbDcR6RJ8OsPlGoxDLtKFprg8yeFF3CjZPrc9eUP9OzK9Wsf/
	87UNFx5lh97AbkEgoMtnmvuu27rgadLf4yu3py6EWPh/CGlF4WuaCyyY
X-Gm-Gg: AYBFou17Edl2L1IUNb06/0OlRihdaIzUIrMwsJVQBJde7FFSIvL3NSqFNwDKGkKG2AZ
	4MUCzjr6BtE0Fo3bOSGcpDpGElNa3K1EZDTyg27KT6pyODQf5D07prlt8k/SdbMvnaMjMCCl5DB
	1DGmo2yO0sZY7ubP1CCQ7PQUcfSHRC7GlRyhGZfJUd5BDxPOicHJD68E9FxpMJVCwQ19LRoqKpL
	ao4oSNgU4JATcwzDK7AeVMPM5pE2MyNTi4gad8M0w/udejMXE/aS1nXj8AT+AGuynPQszqe4XSy
	C+T4fvtlrF+wLWQQZstkdgbsOp1pzDjfW4iVEAnweFbHZ5nOdfONPFUMXlkMa/gZiLH1XGBWphl
	xlek1mSplWc3BbyvMHGtzhm43Bj9mlybaaLpI7NYwq813SfgwbrYl7/iqqo6OP3KRfr5Njf6Ngp
	P5nSbKtVZAiNOVuYB1DGFVZAKqDh5JQUGP7Uj1tbJX1Ckbyu0ZUetwMRljRuMbGwAlWViXuwIvD
	LR8Hqx2eYhNH8VmWsenb/jDeCLEsri+fRpLk5kjXJ893EHJRkIjK9qUrj8I6N70WCqc4v/peCxI
	kwITAe9bRIZmdsB+Yy9qcCWzW3XLUr8+3IvaJ8ERufNGa17btfYPiZuHkuiam6ZxKSDjufyaKbF
	LU9CJNv3oJe4MU7534Lo1J/9O0MEkPe1lrb3bNnlSXYLITNA=
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr1543438c88.0.1794461750617;
        Wed, 11 Nov 2026 21:35:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:50 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v29 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 14:34:45 +0900
Message-ID: <20261112053446.73504-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*
