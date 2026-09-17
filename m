Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2264CDA30
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643873; cv=none; b=iXwtf3+7QAWLfa0LOqcAWM6Gt9O1IjraNggXXLkNQUMBe9z/r3oXV2vXvqwFPgLXYg51etXFx6WbpkwQm7/x4Mc05Otd7kvWyn2A8uxYpgRp8NnvpKU8kK5I94e5Ld7YDGfz342YXRDjMGppfbjr7igK0y6eK6N9GizqgkY4f2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643873; c=relaxed/simple;
	bh=e+SgX7TDIRhcsTj4pD28guuOTVKaUDrvWw12xj2L1tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Up6DxEXCzukScvVnoqJxzj9WUv5oSmSq+vDlS+fvkuyeMM9PpuWUz9Rcwr5pKJ1xDDIX89LIcwsqkmTGUy+I8wBYegUzfvPW5jmB4aSNNchBhZ6OptUA+QTBAjQk+chtuG0rQxw937UCHxbKzhimiG1xgRmhgd35vT0kkXIKzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyjCEKDA; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyjCEKDA"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso486528b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789643866; x=1790248666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY+8sCF4Fq1xjFXp+/Az8sHnxNFnoZQn1XqKaCwae3A=;
        b=WyjCEKDAqjOMhpHhwgQMuDozdRik+0sSG/Wf6DuaT/EiW/bQYctJWptJ9o45tnxepK
         aKqJKMSgrz6tV1rn3/+OQLK1vobUgcuTKcsGKqz05z2wuzSLd0te6qDlO2q+WKSExg6V
         Z2CHX61cUZ2es9DE7Qz4kCqNeX0opdVwFeV0H1zK/A6BtVTtqwMXFTJRAs1Zip6VyhDY
         tJshHA4Npfvw2Lql3kdmcdteEbcQ2+cC4alDM5JOaf2HRKKjpta/0SD093OWvxOrnFsw
         qyrMt1OT73eVdimuaxxzcw5DAq0Ob8/jdWC/SNBXg6D8CFge7wWBRI6xLq1tqaUlPGYE
         3aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643866; x=1790248666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mY+8sCF4Fq1xjFXp+/Az8sHnxNFnoZQn1XqKaCwae3A=;
        b=VjxwmWDblsE1iyHM09AJDjKDgHE/N1QSocOz4K4zDA544S+pTstKe+hoETdOMqcMnE
         7TSyh6/r+n1MdUZbJq9NlSZ9P63IEKpsxF7wFvEijcb3AUCcbzL9Cx1LJz1C1FeE7hA2
         3pUey/Lj75rpoSVft6dn/CvG5ywserhaR6HahnhjNL/ax4kcUfEO4jmImdRZqi0daUZe
         lIZRNWJJgAHtmNgc7dAahCSQfV+SlAyAna86JlTr+HIaxxSurhoIOxBSnVeKTWvyR/nh
         BJxENV7TQdwrYh++CkFePZ3vwvOG2Ok8FxCxZrzepYkXYog7QFS9m3dSgG2DEX+KH9fH
         H9jA==
X-Forwarded-Encrypted: i=1; AKwUvBwITVc0lU1zBKhUS80y0ikGgA5gYndkEQ+VNRnN1StW3jVUR6xdh8Ak4dKjQbk+Duef0wTz4tBQCPVs47E=@vger.kernel.org
X-Gm-Message-State: AFuF++nApaY5vYDwuCSzRcApMpDP4XOSgb2KUeT6+eBW+N0pyV0bRaux
	Sez4ToGmP1VjkcDQcrK91q2ON+a9toce5H5eHd+L9402i5n7raQ2doTm
X-Gm-Gg: AYBFou3NwYY2r6C3Y/lHNopW6QNl+bWZEI65zE0rl5LsoDCj4mIQw0EDziSw40Z0D0H
	v0y3rIYGBJ3vx8eVqaYZ82Fx+Ecz2/421k+GhrpZ9O1LYkN6kdsfI+0iey13LOm0PjfWmf8ZCOy
	M4SbTAxhlhBap2+oJFsTXsKiteELHRGZSJo5RhiIwIYx8+/kiiff+Yy0jWLUg1bEIr/QM8PV/Pc
	jVtsDbLsUKKrOjRWJ4JXStACXaUtD0ucokz5MHOJNWH4dP44Yirg8/lm7OCVNr6bt0SSRmBaHLK
	PjgU8ESatGTVQXlgm2yHDT1WhKpR5mXTRty0MtIH6v5p+QB7DkNust7Lt9+CKrgRWlJnkDSoer+
	XL8ySvx0dqiRyGBm9pJvRlqQw5HkSdErVFxyg8alWsza/MCYfLMlIT+oJMG+xoZ3CzgRec/L1cH
	BzK1w2hsObONJxAVSRWi3mczDi5YRLy8n+O1H84HPfNwWifUzsn5U3Hl9AvA2jFVFQLO9pY2qWj
	nAKqrBZcjnW+Jr0BX9+wGodO4YkrBT4duyfs0dRKV8vzFow17ZRN/aXfg2FR8PLpzRDbGpVQsp4
	wrwAqE/tU3EyD/Q1fIo+QTlVMtg0gu1HpRiccwSmDdkHa+Cif9zRWGEN7oIvhSA=
X-Received: by 2002:a05:6a00:6088:b0:857:73e2:9106 with SMTP id d2e1a72fcca58-87239aa08b2mr14343741b3a.22.1789643866442;
        Thu, 17 Sep 2026 04:17:46 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87200c581fcsm2692441b3a.12.2026.09.17.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:17:46 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: dm-devel@lists.linux.dev
Cc: bmarzins@redhat.com,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	linux-kernel@vger.kernel.org,
	Matthias Goergens <matthias.goergens@gmail.com>
Subject: [PATCH v2] dm-delay: advertise flush support when a flush delay is configured
Date: Thu, 17 Sep 2026 19:17:42 +0800
Message-ID: <20260917111742.1328396-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814045813.3148127-1-matthias.goergens@gmail.com>
References: <20260814045813.3148127-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dm-delay has a flush delay class: the 9-argument table form takes
<flush_device> <flush_offset> <flush_delay>, delay_map() routes
REQ_PREFLUSH bios to it, num_flush_bios is 1, and
Documentation/admin-guide/device-mapper/delay.rst documents it. But
the target never sets ti->flush_supported, so the dm device only
supports flushes when an underlying device stacks BLK_FEAT_WRITE_CACHE
into its limits. Over a write-through device (write_cache "write
through") it does not: submit_bio_noacct() strips REQ_PREFLUSH and
REQ_FUA before any bio reaches the target, and a configured flush
delay measures nothing.

Set ti->flush_supported when dc->flush.delay is non-zero. A configured
flush delay then always sees its flushes. Without one, dm-delay keeps
stacking flush support from the underlying device like the other
targets, so an undelayed dm-delay behaves like linear for flushes.
As for any table with flush support, the dm queue then also
advertises FUA; delay_map() keeps routing REQ_FUA writes to the
write class, and only REQ_PREFLUSH goes to the flush class.

Verified in a VM with dm-delay over a write-through virtio-scsi disk,
using a 9-argument table with write delay 0 and a flush delay of 200
or 800 ms. Without this change the dm queue reports write_cache "write
through", fua 0, and five 4 KiB dd oflag=dsync writes to the dm device
complete in 0-1 ms. With it the queue reports "write back", fua 1, and
the same writes take 204-210 ms and 812-880 ms. Zero-delay tables over
the write-through disk and over a write-back disk behave the same with
and without the change and keep the underlying queue's settings.

Suggested-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Changes since v1:
- Set flush_supported only when dc->flush.delay is non-zero, so an
  undelayed dm-delay behaves like linear for flushes (Ben).
- Commit message describes only the write-through case; otherwise dm
  stacks flush support from the underlying device (Ben).
- Dropped the claim that FUA writes reach the wire: tracing the
  underlying disk shows a plain data write and a REQ_PREFLUSH bio.
- Re-measured with write delay 0 so the timing isolates the flush class.

 drivers/md/dm-delay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-delay.c b/drivers/md/dm-delay.c
index 4864671c2222f..96bb430215a32 100644
--- a/drivers/md/dm-delay.c
+++ b/drivers/md/dm-delay.c
@@ -301,6 +301,7 @@ static int delay_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 
 	ti->num_flush_bios = 1;
+	ti->flush_supported = dc->flush.delay != 0;
 	ti->num_discard_bios = 1;
 	ti->accounts_remapped_io = true;
 	ti->per_io_data_size = sizeof(struct dm_delay_info);
@@ -451,7 +452,7 @@ static int delay_iterate_devices(struct dm_target *ti,
 
 static struct target_type delay_target = {
 	.name	     = "delay",
-	.version     = {1, 5, 0},
+	.version     = {1, 5, 1},
 	.features    = DM_TARGET_PASSES_INTEGRITY | DM_TARGET_ZONED_HM,
 	.module      = THIS_MODULE,
 	.ctr	     = delay_ctr,
-- 
2.55.0

