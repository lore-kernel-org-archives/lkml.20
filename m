Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509312;
	b=UHH+h57VAaMfQa5UDH2gm88j1+FV9tuNpWL7hhq3X1ZpL0GW+lCld1Z/Ma71RpquMEDN
	 xSTVltcAH9SMGw8n/qO4wTmqFHLBa88Nipm0uS+eyg3H27r+2R3M1bKZjML1GourkfEAr
	 Iz5X/+dry5Kql+iLbc+Yzg79IMlo5Wdu0l2V9nH0Mlqyqb9KpzNqkCCtt54NbP/LJW7vf
	 zvtbz1v3Pe07QHFyMYdnMhPzDh98A1F5J23VaJLszXcgCBn+WuQri0P0fySRmk0iXcZXs
	 8bwL6f16V0TX+awmftaHsEiz7D0Bpk2aRbhUs9y37SXMVy7+XyYaMj1mIowkrr4QFIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DID619nHoGzpMole3aPvhf29bKJwz2HOUU8J+9wx+Hw=;
	b=WfOZrc498MJH1Ls6I6CTrCqzWBAhX/roqCJN+TgBoDg8zhhfMb+9kAjCdKkp+Ysx6Ns8
	 UGqZSRDP7pFMown9oqlrlraoyG2zmb3tM935W7lqhTGUKRZJZtzYMBJaxtRtP26p0za8j
	 JNhjE5NWgIhcbYYoiAcy+AYcOjzTzF8492imo4dleHPbglDbMPNjx3yELt4tny8RVuDRw
	 JXRGy4EGmzYHZXW3fUKNZeKdNEWvdWtS8FN5QuHUFTPynGGFFnSV0Yd1egHGO+KSxSA8c
	 v5kTFKTR1+v+Wg2f3PLikckJdmY/ppxxjg+6grnl1KHby9IjNNewU8OajkyrsuQY2QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eQSNMzCo;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7323C606A338
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7323C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eQSNMzCo
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35159e0092aso405435eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509311; x=1793114111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DID619nHoGzpMole3aPvhf29bKJwz2HOUU8J+9wx+Hw=;
        b=eQSNMzCoRDtWyRdgh4yAapGijAXxU4udYjv44D/XvO3JYvSwIXOjVLMuxOSv8/NEZf
         qhhKQ4BgnbFqc00p5LeStGJFjV+gqqjaYkdJCQ92mTY1+RuD7gonatCd9+DTj5LC0nT1
         xiZF5iZwqcFbg9t+ctu0my8yHKIIGsI+VfaNjmlHyzG/8RLCpo0vD2Iwb7Vpjee8GWFc
         MHPTnZPHwjeOFcrYhzSqlZGuWUKEjit/hGDCvUJLJnlVIDOvRJjYQewaWC0ffvXQa8Sy
         pKFBrKni+a4NuggE7HLxEBluuUG0jm/SKp/8wux7ApYNvkqTluFG7fbxUncEHQWqou5b
         dR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509311; x=1793114111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DID619nHoGzpMole3aPvhf29bKJwz2HOUU8J+9wx+Hw=;
        b=fjCIt33aN7kLDro+U3YT/1mstcaDlAOtWEBWrVUlrAGuoq+ruUUcvzj2jZNsJHOE6J
         KxWhH18tDg0HVyYELv4DCB+s1NUE3Cmus8/Y6slCXC8PdSrktO0s1kR5I+5lulhxNrvu
         ckUw6MbfszyDII/aZsVtf+CCIcRnX8Hv7Yc/kOtFvQYgrXcwNjV5MNNaDRAV4gXVa2sW
         ghXOL78DST4HvoCgUuoUQZBlQda3Woh7FFlOAfd7l/e80LRGiJjiUDP5vOEffe/4yerj
         9Maj9MNqpDBAwvDFfhMnXVa+St8DZTFh9cSGAkoR5jY+7cohwY6UPVJQU2g3nPdnuXTx
         x4wA==
X-Forwarded-Encrypted: i=1; AKwUvBzRRKaT8v4qQLxp9Dj41omUkYpfDDCpX0W6ReyAUTJVd7T3BxE8RQNaGT6xK86X2r3c2dhX/qd5j/b+FFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPLOoLH/grizsgVrpGxvGaSkZxq2Q2WQYT99VPFKpi+yBoEMap
	jlQcXbOS8XddYFjlJ4E2K4lzKqa5FDouQDsIJvr1dMioZV/TuDidearJ
X-Gm-Gg: AYBFou3AkNm3feR26p5cbQ0rQZnfSyCF8Ffg0SvcQ0WexFzP8JgSLAxqcCqRT1cMFg5
	M3DhD9zKO01zICH64ajH171x6ZLnxj2qXfT6XGT4RnectQ3qrz4Be0F075MG+icH3f83Wzg8avA
	B5StLq60d0MmhqkIS03FwUqZOZo+0BiReldq4JPckEyxxVEbZtIK/fg2tvAjbFwTlSV91gY00Wz
	oi3FAFimx2/0sbQf9svoCHgsOscV5ivIn6PjjP4SvbQm/Q5eBCqcNDkWKFxGsqqu6jpw06S+LOx
	C112Wl8v6rRWHhEmy4UDxHs0BomXylxKR5NMqoepjJgAV103NjhVznd8GA35xJO2kB1+5FkMH+9
	joPB1HizeF3GnfKVI6meajd/94jioD3jwjS/4+BcLd/pib8iRj9gy3dGwel3qwialNam6klnXOl
	6sikqA+XIuhPFv/GYLELASrZ+vhHB97v6K4/Lh3fmSkk8S0YRCZogbvKXJar/FDVDn/unkmig+j
	bNdk4zCwjM=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id 5a478bee46e88-361a136a601mr22955424eec.2.1792509310992;
        Tue, 20 Oct 2026 08:15:10 -0700 (PDT)
Received: from subhobhai943.. ([2409:40e1:7:197e:d6f5:c443:63e9:fc37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm68690316eec.28.2026.10.20.08.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:15:10 -0700 (PDT)
From: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Subject: [PATCH v1] ALSA: pci: Fix spelling mistakes in comments
Date: Tue, 20 Oct 2026 20:45:02 +0530
Message-ID: <20261020151503.15855-1-sarkarsubhadip604@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Fix three spelling mistakes in comment strings across sound/pci/:
 - sound/pci/rme32.c: 'informations' -> 'information'
 - sound/pci/vx222/vx222_ops.c: 'hander' -> 'handler'
 - sound/pci/echoaudio/echoaudio.c: 'contraints' -> 'constraints'

Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
---
 sound/pci/echoaudio/echoaudio.c | 2 +-
 sound/pci/rme32.c               | 2 +-
 sound/pci/vx222/vx222_ops.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 214d68657..2ef6e097b 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -270,7 +270,7 @@ static int pcm_open(struct snd_pcm_substream *substream,
 		return -ENOMEM;
 	pipe->index = -1;		/* Not configured yet */
 
-	/* Set up hw capabilities and contraints */
+	/* Set up hw capabilities and constraints */
 	memcpy(&pipe->hw, &pcm_hardware_skel, sizeof(struct snd_pcm_hardware));
 	dev_dbg(chip->card->dev, "max_channels=%d\n", max_channels);
 	pipe->constr.list = channels_list;
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 454a30a2c..1d5390621 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -8,7 +8,7 @@
  *      Thanks to :        Anders Torger <torger@ludd.luth.se>,
  *                         Henk Hesselink <henk@anda.nl>
  *                         for writing the digi96-driver 
- *                         and RME for all informations.
+ *                         and RME for all information.
  * 
  * ****************************************************************************
  * 
diff --git a/sound/pci/vx222/vx222_ops.c b/sound/pci/vx222/vx222_ops.c
index b6459dbdb..40f3716c4 100644
--- a/sound/pci/vx222/vx222_ops.c
+++ b/sound/pci/vx222/vx222_ops.c
@@ -431,7 +431,7 @@ static int vx2_load_dsp(struct vx_core *vx, int index, const struct firmware *ds
 /*
  * vx_test_and_ack - test and acknowledge interrupt
  *
- * called from irq hander, too
+ * called from irq handler, too
  *
  * spinlock held!
  */
-- 
2.43.0

