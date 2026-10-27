Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078800;
	b=x5KahdArVNKMp09gTHFklsnKw9CA4xibrVp9OhSXY2/81yCtYvSZEnK3LR8NSSgFxvr+
	 5fM7M6V+kdA6erolSrPzEgXulBNzDlqgeaOnOjzxOqZhSCvlMklMnptF/yePqDikgxgRM
	 k56BD9IDyMU6Zrqcs4GIOAc8c+/rJH5yz1hihbGoFmhOJ3E2hlqp43gBnLNWS99LIXExz
	 /VnWLHF+FoAH2uAzVgh6MhdCGM5Q+s81pMiKC2NrrHYV2f06sFFVGi52bkpbUVrlhIPJU
	 sujo3gL/MBIfhg++HeWOH4LFDd5h+ZAaIX1YLsLjzxb//aem/eiIQZsLCgss6k94+hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=0x6mTxkP4nBs1deJf2I2SUu12QHLK1lhJg3onPx8YVk=;
	b=s0FJz/TXAxq/H7ojS2SWmAT8VB+JOEV1ZtD32C2aHcaXO/apeINKI00qiGSGxRqre5tD
	 9is1v6MMQ6CtNoIua4166lDyU++G7ev0iXBSNMRPl4Whbt+5tVPPgllmJRm2KgNFHz6+s
	 KHpdgCJVbQW/kGH32Dmdbu50x1kV/g2OfYDg3tEG0eMT0HkvDYXg/k27pIJ2XFbBcuzvL
	 bGaX/gV2p4IVvz4LGFck78eRzSgnvJkBR/kGsM5Uwk6VZsU4jlP2AgpnTST1948qJGjX/
	 gkDb7VkJHlpDQ3S1U7MHqY/w366b7Z23mSYYJDxUZls69jUX4J6GhQ918HoUYHQrs+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Ghwts+3/";
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA00606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADA00606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ghwts+3/
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e7e742a2c7so4313725ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793078799; x=1793683599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x6mTxkP4nBs1deJf2I2SUu12QHLK1lhJg3onPx8YVk=;
        b=Ghwts+3/hrGnnAzwWpysKTB0hd2asbwn/FondnpQC/sUw0xIjOVjhFF0wm2h4+l9gp
         sPRtbxsmY/EyoJkhZl1vLxdsnp0D8G0TMs2AFYXw5ecowDoGCO5LphDoFPKGwGrNq103
         pFBFIoKYQgOQy7lbkYEPy3zS+4TzoeMU9Y1KKn/yro9QDnvolQV2aJQ6W5gexYqglT2o
         58tX26UzbtduhhMjUBofOx/nRAOsSCtFyMhOk/m47o1Ddgb9e7JgJuck3DDpNs+311iD
         uITJl0bAiZRyUun61ZziSK9euut3tVMF52n2IITtzTEV5lIHjff16P2x13v775iQxx3p
         OcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078799; x=1793683599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0x6mTxkP4nBs1deJf2I2SUu12QHLK1lhJg3onPx8YVk=;
        b=qADGx30pnVbDiEfORDa6/d4LxmFy8sDXgA5av5+iugNBIjEQgXnoA40lobrRDwbndA
         Dehx3ohFScfph46nFui5Jiem2bSjf5wQDwKi2YyDKZg4MSqWzaS/ONFjAO/sbh0F8mpH
         hVyHutrrtYC/k1//2ARjKe+GQc9AnSzRm8tNAlY5ySAfeSCrq6JxRPegYISkd2eUBR/j
         HowzkrX62QpSXt3mxKV2U+zoWd8bB+M2eXzj4h8sMhetfNpOyijSFDMriNOAkCnwLo+C
         K19bU33NoVzQH0+JbHwDvgGDP5X6lhrlye6iEvT1qDOylrd+QsLoyc/HbCbDuWzhJijt
         VIpw==
X-Forwarded-Encrypted: i=1; AKwUvBz9RpTdET8tI013+HcOX9PXZktcELF4HKCV+DErZWUqpYg/oPFPVRoz/OQKOJkuqV3OtuvdJ8XpsvB31k4=@vger.kernel.org
X-Gm-Message-State: AFq9FYImCPQ47Ze4C2KxVGnY/Z01QTKuAfuHWiC180ILBWRLfF/gbKI0
	MyVU7xATs0cNwKDnRiqXk8jcGJ/n6JxDkbmdypR3sNmc2YTZvN0PMZ4t
X-Gm-Gg: AYBFou0NpZPn7oRHvyOuZKzu1M6bdIHqW/x+OkDuoLS0S4ORkizbwRaGGCDnM8+IbtU
	CZAhTtEwQfzce82xANHhBuodUprg50ZJyVGNRpP6OVI9xbRoUi7w18b5cy7JlqeHcEDuaLmMz8B
	d2Bt2ZDBQjuBqqlrcmYjBBAq3E7ilHqoRpKxPAjESQhczPkqzJ27O+sC1VuC2d0Ufa0KaW+PiqI
	urSfL7rIyfdK1ApN2h+jwOD+GC1cAEdTrIufS6AmIngtVCUFU9BFrtNq/2nYLsm/KpB8pXfjYiI
	s7/8dQB/diJbdBSW2CTEbMdG8AlVCwjiY4Vcno24Xkk4VN7ncSVlx9rayrKh2IGSeT24pZC2ZE7
	K4ansNqOVfc43HW4OY6q8n25wV8PmnKGN8sv5rW7Gl9U/vdjrZfAXQyB4X+2fVhnFvgfDyqhXY3
	CD9UXKuk0rZEtr3lhRgUm0a8zbl4R0SyYZifU2KA1Jh9WetO16OVeuHs75QZPc22qlCKmveqZ2L
	RXtpl12IcT0eym4d6nktp5cs0PSUfCKPCh2unfXcIqk9ROyW5BOQwjFBbGJAR8IgTn9VV+Yjf3G
	yyTQPipEFpV1ntilBwM=
X-Received: by 2002:a17:902:e946:b0:2ea:dee6:d672 with SMTP id d9443c01a7336-2eae3ed93b0mr9549575ad.19.1793078799174;
        Mon, 26 Oct 2026 22:26:39 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9757bsm3307715ad.58.2026.10.26.22.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:26:38 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	alistair@alistair23.me,
	rust-for-linux@vger.kernel.org,
	jic23@kernel.org
Cc: ojeda@kernel.org,
	aliceryhl@google.com,
	a.hindborg@kernel.org,
	alistair23@gmail.com,
	wilfred.mallawa@wdc.com,
	bjorn3_gh@protonmail.com,
	gregkh@linuxfoundation.org,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	gary@garyguo.net,
	tmgross@umich.edu,
	alex.gaynor@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v5 07/23] rust: add bindings for hash.h
Date: Tue, 27 Oct 2026 15:25:20 +1000
Message-ID: <20261027052536.1722081-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027052536.1722081-1-alistair.francis@wdc.com>
References: <20261027052536.1722081-1-alistair.francis@wdc.com>
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

From: Alistair Francis <alistair.francis@wdc.com>

Make the functions crypto_shash_descsize(), crypto_shash_digestsize()
and crypto_free_shash() available to Rust.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/hash.c             | 22 ++++++++++++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 24 insertions(+)
 create mode 100644 rust/helpers/hash.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 3791af0aadc73..4992bc3194e7e 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -28,6 +28,7 @@
  */
 #include <linux/hrtimer_types.h>
 
+#include <crypto/hash.h>
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
diff --git a/rust/helpers/hash.c b/rust/helpers/hash.c
new file mode 100644
index 0000000000000..0d88752084673
--- /dev/null
+++ b/rust/helpers/hash.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <crypto/hash.h>
+
+#ifdef CONFIG_CRYPTO
+
+__rust_helper unsigned int rust_helper_crypto_shash_descsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_descsize(tfm);
+}
+
+__rust_helper unsigned int rust_helper_crypto_shash_digestsize(struct crypto_shash *tfm)
+{
+	return crypto_shash_digestsize(tfm);
+}
+
+__rust_helper void rust_helper_crypto_free_shash(struct crypto_shash *tfm)
+{
+	crypto_free_shash(tfm);
+}
+
+#endif /* CONFIG_CRYPTO */
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index d62c7be1ca7bd..0dcdad905f0ef 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -67,6 +67,7 @@
 #include "fs.c"
 #include "fwctl.c"
 #include "gpu.c"
+#include "hash.c"
 #include "interrupt.c"
 #include "io.c"
 #include "irq.c"
-- 
2.56.0

