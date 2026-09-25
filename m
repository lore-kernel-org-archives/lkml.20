Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E9B47CA6E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330007; cv=none; b=elNsJdihPytY09ErfWLVxrh9iaWI9GO4f5piMgo9yz7YsLOVp9rCCKrs8I/UnI6NcC40BdEYt9ReGw8wRLpcnE7YtmIPTaQhCDDIivNBaoXZ5pgVinEChFOdhJl0jeN8KIDOt55zjN2NtVnWQjHRP6i6uug05xY4wCpGm4fm3Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330007; c=relaxed/simple;
	bh=6GRmHPLR3TCBKfBWB4SA0tOdNi5yoK35GggbLziGW1k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cyb5l4zXcLf9nSHMaki++3Yrpq9BL8+2+CnpyBvCA+Yf7ON8LjBmlXMdiGV4T23xlGVEaUMxfbKNftwbuah30Z739pYNR6RDIdm0g9ahAeGK5+1yh+nDKGm1Q6A6zhrzskYVJ/k5arxvM/A6tYm+oFesfqT4xRW/7rE8tdLb1po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A17fV1CN; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A17fV1CN"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc7901f7971so83027a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790330003; x=1790934803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGO9gkMm/hjzd0yK8CgZnet7IwsFNqJtn1zmuKbVxic=;
        b=A17fV1CNmzpX8DYQKR5KtWko7KWDsPPZcJU4zFxVkAQYBNz1vvUjfD4vSL7GrA/5/m
         HDXY6JCeMEp8y+k/KTFxj6J4vTvI/Mom7Bcl46NdwfuLNvFTMFwmNj51bGImrkNPZX2J
         yqtVxMtUtpfnkLpmi/KsO4GZv8V5MlmKgBFK2MfHqRACiJAtbEs2ElFjjxejbEl2xCxy
         /p7I1bhaKeBz7UvWxWWGZPO3DgNepS3AcoTMHVxcTBxEMB6+ILqUk1E4Qv0sEUd86y2y
         xL+8ucnmNiVwHQbO272R4Ett0IY0vBBWAyfVlHBigqfzxYFDPr9OLJs9rxkM6r+OckRZ
         mJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330003; x=1790934803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGO9gkMm/hjzd0yK8CgZnet7IwsFNqJtn1zmuKbVxic=;
        b=sMftDUtCDYqXsZ9RtttrWvsefaFrmQ1UaBgKnwfhtgnUCaX0IPYzN1qpiZNA8WcXwV
         VdNHDs6DuUtnRE8wdwSRU+YqKnkNwRkwXV8I249x7OnDdYfE2pz06hHW85MN6rqs4X8p
         Xh8jc8lhYaT1k4FdsSoYXk17K04qjw5aYpBy1DLP5A6R2MKt3cMrOxIChb/pmbFlih3M
         joa2yiJuU1PXE4QsgnBXtQvj7hoF1WpDbdmiZzOeIh5oQoWpwu5fvDFF8HdA61fERMqK
         /Qg4IBOZak1qrS/71lQXVtAD+H2+SuiEXzonc1z2stIbTBophDK8URwJkYP/QPo0XgVA
         QRiA==
X-Forwarded-Encrypted: i=1; AKwUvBwq665dYNyCMSPlbHLQPVlfkEYrflwRMvtfs1JgJs61vztvTgKmJpwvotL81LHpdeK95j0XzspC5RJiG/M=@vger.kernel.org
X-Gm-Message-State: AFuF++kIEmyxM6/8AGy+m/v7M6MKAmckUtCdCCzFkWVUvrvmW0DDukdr
	1rhaQRAsCqf9eW3aRzq982HnoZSZ8KvuZiUyyBTnn0d4telxwIOr4+F1
X-Gm-Gg: AYBFou1XTl4mXuOjNLbB3CDexsKST9ai7RobaJm0K3n3mrbT9S+uYmgcXcyHOjzHdTu
	kbxlQO7qYljpVA2bAJcm9c4VSvtfrD8siV4liVaB1oZeFLZ4Lq12M/iabfM/lr6LFF4sXjVPlot
	w3ltnBD+olmp8w+Oa2DBp1ni9sU86b8qEkNVVoqYfkwl5aNnIyhEg4U1lcGKNDC9BgJfKaiX9+A
	g49H1/Fn5NFQo4p9vm6vWgHe4PNfDLAortFtoYsVZQ9tGNYSDT78/UUwEttagfY2Rm42i79yHRQ
	jFvRbESxZai8LWhFWx0e0fNwU2pqtOhxsZTXGRA0P6hHrHJVvxZm4qPid3l5UmbvnaCtknW3ocJ
	3i+awBmfAmvAZ4Ckxmcorzs9sfvOj7aDIvHgKRp/3/VUC6xzoUe/TXXwREoW7ip102JQcLTrCrc
	PK50DIFzlWD8/ZDvnsX4F7s8lTO5WCfVhg4YKDLFfSaZwXeSbPfYixvv4KMn/jXVflHNrTtnPyb
	KLunBPh1YAB
X-Received: by 2002:a05:6a20:3d20:b0:3db:3d0b:31fd with SMTP id adf61e73a8af0-3de0e703d8dmr5190620637.1.1790330003117;
        Fri, 25 Sep 2026 02:53:23 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm924154a12.32.2026.09.25.02.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:53:22 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KEYS: trusted: Reject short TPM2 public areas
Date: Fri, 25 Sep 2026 18:53:08 +0900
Message-ID: <20260925095308.3248297-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tpm2_load_cmd() reads TPMA_OBJECT with get_unaligned_be32(pub + 4), but
does not require public_len to cover that field.

A new-format blob with public_len zero makes the read begin at the end of
the B + 4-byte decoded allocation, causing a four-byte heap out-of-bounds
read before the TPM command is transmitted. This is reachable from an
unprivileged add_key() call when TPM trusted keys and a TPM2 device are
available.

This affects v5.13-rc1 and later kernels built with CONFIG_TRUSTED_KEYS=y
and CONFIG_TRUSTED_KEYS_TPM=y when a TPM2 device is present. A KASAN run
as UID 1000 with no effective capabilities reported:

BUG: KASAN: slab-out-of-bounds in tpm2_unseal_trusted
Read of size 4 at addr ffff888106273b48 by task exploit/160
CPU: 1 UID: 1000 PID: 160 Comm: exploit
The buggy address belongs to the object at ffff888106273b40
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes to the right of
 allocated 8-byte region [ffff888106273b40, ffff888106273b48)

TPMT_PUBLIC starts with the two-byte type, two-byte nameAlg and four-byte
objectAttributes fields. Require public_len to cover all eight bytes before
reading the attributes.

The exact input produced the KASAN read in 3/3 fresh boots. The fixed build
rejected it with -E2BIG and no KASAN report in 3/3 boots; valid new- and
old-format trusted-key loads continued to succeed.

Fixes: e5fb5d2c5a03 ("security: keys: trusted: Make sealed key properly interoperable")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
Tested with QEMU tpm-tis and swtpm: vulnerable 3/3 KASAN reports,
fixed 3/3 clean -E2BIG rejections, with public_len 7/8 and new/old-format
controls passing. Stable 5.15+ requires 114f00d738f1 first; both patches
apply cleanly in that order.

The source reproducer and full logs are available privately on request.

 security/keys/trusted-keys/trusted_tpm2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index c2a69bcf381d7..b3109e0a924f5 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -418,6 +418,8 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
 	public_len = get_unaligned_be16(blob + 2 + private_len);
 	if (private_len + 2 + public_len + 2 > blob_len)
 		return -E2BIG;
+	if (public_len < 8)
+		return -E2BIG;
 
 	pub = blob + 2 + private_len + 2;
 	/* key attributes are always at offset 4 */

base-commit: 27d14d3b15d5691bcbf0683883a2ea12469edbea
