Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E49524AE3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865335; cv=none; b=Uc5gyFLNSduzha9VZ9Gly843mx06quE/mAgodsmHvWWhYR5P0/iI/BPEXKp3EnXQAwOKFI2PBnLgcqmFsmk1qTXIqzmI1171aMnBNL7LcRb/BMxKlgZDMizgPhRldUP5JlR7C69R/kBrWqKJOScAq8H6zCWL8Rrwl486jKEJ+1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865335; c=relaxed/simple;
	bh=JNIxa+Q0uCVgKetLJLxRgWMaDSMh9rMFW0vqnWvekdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xv72k/EtyjoB2irf2wyeAphpUPSNTizcHihb3b0678L1yA+AKamDCf0YOAv6m/xsI2Oj0RaMNkAizNyx1Y4fhZFNNFdae4breXVssy6Q6PWHLqj68HN54CIfLE/bGDpRqN7aa8fojcjatuaoO1S/M3fKPrES7S9C1yL2jrOQo1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyRT5Lp7; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyRT5Lp7"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52ff0b7c98aso42951591cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 04:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788865332; x=1789470132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dgpGZXxyzJEKTUi5CrmtVo7cbMHzzenxTIN8C/YkDs=;
        b=nyRT5Lp71tUbri3kPZUBttNkfF1upezuCZBEIRb7oiTXZb3E7d8fQ1Cliozn1SMca8
         s4n66f0fTFQQi88RTVSpnlQ9DCmwmoRQwS9rmh+8eZYFxNrNGmY3K2CrAobDw0vrpnHv
         KqsP6AP6MQaLJHqsP2VvyjKp9ljJbcSabz2T97icfhXdMI7MToeecChHhlGKnG4bTtVO
         4dL8C+c9uWMO0GqLIOmp/7lZ4IL1ojH7V72FOTvoAKq6yEo+Q0jyWcJPeGibhQShnO3a
         En4lW5FBIMCCgHswcqwjJYtsmmHe4/fVvN6/OXOaj5xeNSEDxC8RYe0fPCLL3uD0j1cM
         0s8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865332; x=1789470132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dgpGZXxyzJEKTUi5CrmtVo7cbMHzzenxTIN8C/YkDs=;
        b=TgRcClM9bpmPBJkjWcNeFQ0sjZx79fWialdUD1InR7pB2erwFd1SIN3GrjuIGggMBl
         Pfg76xpppu/bNHywppF6Lqr+QYlCipxQVR417S2nXpwztuA7j29mJkcUI//ZKNdatbif
         +frQt3C0YXAWt+3g4zdg7p21xlap4qVHRtGvTsWVTvfxsYP3WXLaFPiWuG30hiy2I4qE
         luqklkVWjnXbbAyDX0f5FP7q4OICxEWHLBaND4x3EPFl51EzNaQD7ajmu4gDbFROQxrh
         PoHewu/j0V0LsfHC+eDrpQdwIIHNZ21VPkOibM+rUWosHMC6VEsrPuLSnbOseR4fNP79
         EnEg==
X-Forwarded-Encrypted: i=1; AKwUvBy2jZQUloubRDpkK/5G+Fr8iMX5DBVYoIem83SNm/eIpvQwPTT1sQ5UvfGzi7CzpbPlfY3q3ybJtIu6Mf0=@vger.kernel.org
X-Gm-Message-State: AFuF++mfjSu2YlpKv1kvTRHvHMbGpe903GybBiVSVJag2uTwZXkPjomL
	3do42d3ibsEtWD9QGrTMJCWCcofUqcXe4NK3Ie7lyLdud4MrtfLfrT1MA5gHsQ==
X-Gm-Gg: AYBFou0ENQr/q7ezYDbIBHaNCnPaVzv5CvDvcG8Sks/Y7JFlgfESiUiR3RxKa9mDyD5
	Qsjuk8nDIR46WX7UQKnlZmhOCG18qUv0m6aV2GIz0SYCmR/vYQgCIJr0ABxhBbb86ll1m+40D/X
	UDKsCWdOAkl4KEi4hflJNfS1RIdYcFUSkw6w5BTb93yGUV9YevuHA97+traYtlGeZRZUuCF9HC8
	mZfnouq9lT0GqpovYmZQKB3cZergwKtlcyicG4t5yo3VQeYOMZYI5j6DBBF2s+8D8VlIqT64uon
	KF6qt359UpfLIvwZhsNsO2kCjS7r5jQ8APng5w5g0teVtgJ2ELSdAIUf3o3QeRSQceAUyJgxsoE
	InH3/XHwlr6x7uSF2Ea9Ta/n1oiOEkKSPVz+Izv7+dGOVWwP0ipBN2Wxz4iiqi1EeO7qYo2kZ1y
	TmsZj8qHvfYfla8X5KL6olZ5TIK3wbL2HrKglH414KdLNxUnpEfmNmbx8qKs1X0RJFaVZ/qQ==
X-Received: by 2002:a05:6a20:2586:b0:3d1:8876:fb1e with SMTP id adf61e73a8af0-3da3976ed13mr37575699637.0.1788865272958;
        Tue, 08 Sep 2026 04:01:12 -0700 (PDT)
Received: from hnkz-ubuntu-server ([2404:7a80:860:3300:f22f:74ff:feda:3295])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455485c25sm5207152a12.26.2026.09.08.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 04:01:12 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>
Subject: [PATCH] ALSA: us122l: Prevent write upgrades for read mappings
Date: Tue,  8 Sep 2026 20:00:53 +0900
Message-ID: <20260908110053.2950767-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hwdep mmap callback rejects read-buffer mappings that are initially
writable, but leaves VM_MAYWRITE set on mappings created with PROT_READ.
A process that can open the hwdep node O_RDWR can later use mprotect() to
make the mapping writable.

The read allocation begins with struct usb_stream. Its read_size member is
used by the fault handler to decide which pages belong to the read buffer.
The read VMA intentionally remains expandable because pcm_usb_stream uses
mremap() after reading that size. Changing read_size first can therefore
map and access pages beyond the allocation. The same member is also
consumed by usb_stream_free(), where changing it can make
free_pages_exact() release pages outside the allocation.

Clear VM_MAYWRITE for read-buffer mappings after rejecting an initially
writable VMA. This keeps the separate output-buffer mapping writable while
preventing later permission upgrades.

Fixes: 030a07e44129 ("ALSA: Add USB US122L driver")
Cc: stable@vger.kernel.org
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 sound/usb/usx2y/us122l.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
index f00b53346abd..a5db0d044ef9 100644
--- a/sound/usb/usx2y/us122l.c
+++ b/sound/usb/usx2y/us122l.c
@@ -180,8 +180,11 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
 	guard(mutex)(&us122l->mutex);
 	s = us122l->sk.s;
 	read = offset < s->read_size;
-	if (read && area->vm_flags & VM_WRITE)
-		return -EPERM;
+	if (read) {
+		if (area->vm_flags & VM_WRITE)
+			return -EPERM;
+		vm_flags_clear(area, VM_MAYWRITE);
+	}
 	/* if userspace tries to mmap beyond end of our buffer, fail */
 	if (size > PAGE_ALIGN(read ? s->read_size : s->write_size)) {
 		dev_warn(hw->card->dev, "%s: size %lu > %u\n", __func__,
