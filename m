Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704B9446849
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522676; cv=none; b=NMr4vaw2iWDXFUlb2PdJPUmziXkHS1T34FrWd98rWPYuEVplWbB7Gp4XMCTTuh+QK+m2F9YDfzSTpahKndVSblQXW+UapWmAnUdLoF/y9+s5QsA6fmsnHVTQWyjyNUSU6/MQMjP+svuFCIk4ZeSz834/8gHR1F0gPDWC2+h389o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522676; c=relaxed/simple;
	bh=jTpms1YZuuw/EGVMJxJxkFdM1Q2Q6bKCmKEsPM3xqL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4vHgHZwnfxnTKtn1VxkiIaN5sPVL2psfWbdgPiUYO5DHziajoe/zHjleHLfDQHT8ZTA9S+zBxF99z1p00bbgm5wAVi/s/Rj3pHnI2Zd4ZbwXPpulIx913KgN6GtjXGc5/OX9STb4LlO4y8OkqZgsYvsIJZf0RZh2Irl6kIspUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjcVNoV+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjcVNoV+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38e041ea211so717956a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522675; x=1789127475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeC+fdJ1IuG4HBTKinIorpYHJblRORtXEeUMokNHbRw=;
        b=VjcVNoV+uHO1lYRq+H4p++/zkWDxBS5cWAk0g2bCzjf8LLDSXAKIB86kpokylov4Zo
         f5I/YyIqz2m4yjGWf2oJ/dTntmZkYxXmTUjY8ZUzTSIfg6phKFNBiIcxMD5u5vo8BzA2
         boGOCIbX2ew+PnT+SbmoXI/ncE675fWT46cRCehK+IwJV3Pi1M5zoevkN8aI9kkFHZIN
         qspoxisLa1ytJHM0PfxTbJBME4PXd6uzbtZVmHAR8QCXLq6o22LC5Pseu1F2KgPB5izt
         Ht91QPXm0Yg/C83nybJoSTtqCKyeKAyFSCqeofZaQhI1Ofsr8ImbhN15biMq3tt5sjnb
         hQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522675; x=1789127475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeC+fdJ1IuG4HBTKinIorpYHJblRORtXEeUMokNHbRw=;
        b=CISWYJ8UkArrxfHmq6HeSMT+FmqvYSZ2fH4+/b+g0ckbmJIkN2yQMZw3c/ZrgyoZjN
         rtZeILbsTITiaL3Fzi/qr3K7JemjBkaJdNMQooEKo2uOPFThO0huuQV84fwtiOCL3Q7C
         3UlqF0crgclenjP8Pi2cqknLZJhrJaKDZL9yP5UyZ+ixRq3CDM43LQCmwQuI9OYfifrs
         BAPNcuqqZ281KZekmOdhmgRvO1RQikf2+HMWwEaZoSvANDFsZvgC4tS9Kw3of3fx+p6L
         k3p+EF7psiGffkotQzY4zAH6WnlbWg7D9aht7sEVYhgKTPcUReo9T727IS5G0q9ixy0d
         XCEQ==
X-Gm-Message-State: AFuF++lLrpc4MTAvtPDnqca5nwLcy1J5rhMnnQmamh88vD0cIKeJEkjT
	ufTbWAhlUWx0WWS9Rqn0YF8T87inwHcwWykazL+fBKJrwfuvE0HODAt9
X-Gm-Gg: AYBFou2D8F7peeLyTKB3iFYey/ITIzOxHNnp3PB4YA/ax/kVJ/5esxg6QbbJ1tgwIpB
	DiFwTN72lM9ddAbzyWt0K3i6nQt5rEQE3CwSkusXvy+6jSoivtxHm38gLeZyVOTKNCLX8PxfHF6
	vl7RAt0pT//r6zUHcwEqHK5leLnUa/svwfWaQJCVkD++Yf9pW29IB/OGLiaLXRlDNxM/eQ6Bod8
	/HR5nbJBV1paOdCHTqvEDpQdrtAsuKmROJoPHvdb2qKod/oYC+lOTNe9Fz3s8C3JZs/LMz6VxA8
	IixjIXbTvpMy0Ny3cMrMsWmQ9/38/Jlnfz8ITD+xXQcEcn9/rd6i9GGDUBT0EbA5KPCZAFqUAgW
	vN7XbyVRTWoPpHq50KmxVhtpp4dd6AzwzDOyuR1eFlIFZ55mXx3gikj2259os7YT0i5QRFcnfkY
	X7pk2W+5vIu33rswX816rqkAtQ/6TqvLN2R/hVgfEX+v04sookmtWRbveVN6zzW5AhAvKzfcyYv
	gDS8yl8QbjNE6c=
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr9493372a91.4.1788522674427;
        Fri, 04 Sep 2026 04:51:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm5552932eec.11.2026.09.04.04.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:51:14 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Kirti Wankhede <kwankhede@nvidia.com>,
	Alex Williamson <alex@shazbot.org>
Cc: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH] vfio: fix typo "stucture" in comment
Date: Fri,  4 Sep 2026 17:21:08 +0530
Message-ID: <20260904115109.6170-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "stucture" to "structure", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/vfio/mdev/mdev_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index 3b4aa0632fcc..34337292a9b1 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -50,7 +50,7 @@ static int mdev_device_remove_cb(struct device *dev, void *data)
  * @types: Array of supported mdev types
  * @nr_types: Number of entries in @types
  *
- * Registers the @parent stucture as a parent for mdev types and thus mdev
+ * Registers the @parent structure as a parent for mdev types and thus mdev
  * devices.  The caller needs to hold a reference on @dev that must not be
  * released until after the call to mdev_unregister_parent().
  *
-- 
2.48.1

