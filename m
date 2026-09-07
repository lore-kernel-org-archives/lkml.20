Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D961C3859C3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762124; cv=none; b=GEztSYpS9NJRnrYasHqNAQ4Y9Fcm9r70XxT0bhQrnDYd2dju0lSHjo9cDjfX/RPqSQ85YXZmUcXir4235DL1DsJgfUkXZgAEPVS/zW79M/90jwci7AsZQ0vHzyiKyU+/+UoFwKsgWNOxxoVrwBMmKgj/TskFzApRt5MjHqw9GsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762124; c=relaxed/simple;
	bh=MeRW5bXEGeIEkp5gf8eUoDyMZ6P61cTaAQ2l91fGwJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kBX/pCvY6c/qpfLWaYOHlcTJqgBTYIcirpTfW5Xk2XvrNYbpZAJrbpw52hhvLyzVHbGgWl4ojci+HBJaeHRdcPPyn/YnRYBBpKAcumUhI07sylu+RUlHje/DwiVy2dLQVdqBY7CXZmXPbWQ5E6MISDrF/iaMHY6vJZvYd33IgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDJE1/hd; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDJE1/hd"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3171333a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762122; x=1789366922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgQmB11lwCyevM+5cq0InhbT0EBZhc/NlddXm3mSXGc=;
        b=tDJE1/hddIcwYHpeCVruCxw50WkQVGx1g9m2Tyq3Ee3sJAqqNqnmX28hz1A6FUOE9U
         P8QUJYCtQfOO8patGcKhMExpoubuvMOjtdK64GPkNin/65D3iZO0O7lzSjzpanZn6vr2
         kqCfCniNQ2UonG7T2piXVR9cWcxCym9Edmhsv0yaeeiAZKMXBtLndVS5390CJPF7l9b4
         z7Xul5fvTZV6x2XOtaqm29/q5jSe3KrfkJGliphMGwUaQepCp6FHxWVYBQuk184Kyodw
         FSPzi/yhWP6/mVSn/gZ+iHjwmBczsx5Dmw0z18rVIq0AxQD+qzKMRm8LOiyswBPMcWnl
         Ma8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762122; x=1789366922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgQmB11lwCyevM+5cq0InhbT0EBZhc/NlddXm3mSXGc=;
        b=MJuL/XTVrb9WrbiaKiOBuv2ESBIhr0jB1+qSFxSLT07T7pKOFMQEeP7DSzgBzVfE+e
         wcb2SO3rPIJ6Y/9doh0d7UDhED27VAEtgzAgk7+IIdVq6uids5I4pBb5YjkOPemYw+og
         yPSbQaAGsCUh+WzFG1iljw52yfNTmDAMDQfbWCpSN8R8ZjoCt1jBc2s6nTRTRX3apJbF
         b4m0N+Vs0An9XNiDyFCf/8GNVSE/I3Q3F9REz1anyUqx7d5I2kYy50hwfJw0bcjZalQA
         W6c0b87dl4Jzf8NWcF2z4gZuJN89dubn3GQfNz2VUu2igPYYu8Xw+4SqDjA77XfWPufS
         4ydw==
X-Forwarded-Encrypted: i=1; AKwUvByaLYL70UUn4jSzV7n6ZidJhVHdwUNgASd68oYLC1o7gckVTaQTqUQ+52Iec+42AsclsRAPy4qwUhdtvQU=@vger.kernel.org
X-Gm-Message-State: AFuF++mlIy2XfsCcSyd/LiSA1dviz6mC+CjT/3RamFlRTsN+2e+Y6jlg
	40m/ft/TV42nuMg8rfmhv9HHQJWEaRjP8GHOr5Z/PKvWC/gpUPl1F/pgq2PSBXrjVvA=
X-Gm-Gg: AYBFou0x73U3uClqSQxkD2kzXrpZgwjnPb6XJTZ7ky25Lvvn2TVcfCvCJKyk4Ni7cFc
	kVMzT2EVwT1efu0NsIzeFJASX8rq8BvDUIPeck8S5iloU0nYXhWWyBDnJf0NulHfy2Q5qaBgIMu
	39V1/+ShGWL61yDcjvDWVol1XvCBaxlepQ2mF4tP+6LDeFIeWeAhj4p3KpxvYUdQA5rHkNXwJKj
	P5K/47lull3qfOzzxduVI5kqaVDK0mIe5jSPwZayPJt7WIkQhCLJ5kUcq2JQlXd2GQBfvO2a0hb
	VK+q6Hv8xws6PCI7l68xjGCpv9THHWAlNfr3YNmQXt7acwYOa6CuO1eqVMQf1QaivPZEvkvszy9
	rM5Yrpw1Ts32yd0kZu1hGljS6giE+9vPiHAgVBN1Quz3V4LIGBB969S2B2mlvspeFH3YTeszMav
	GpT04mMOFY3hwhxSB3C+vatC9KBDlS1FHJe7WBLwX8SJZu/tC5ofzOsua7ev6+iEq+mBJQZFHfd
	BCnnvOagr3QBIFv66+fXMp7
X-Received: by 2002:a17:90b:580e:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39b25ee242bmr29928116a91.0.1788762122144;
        Sun, 06 Sep 2026 23:22:02 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm27532996c88.15.2026.09.06.23.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:22:01 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Alexander Aring <aahringo@redhat.com>,
	David Teigland <teigland@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dlm: fix typos in comments
Date: Mon,  7 Sep 2026 11:51:57 +0530
Message-ID: <20260907062157.8474-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/dlm/ast.c  | 2 +-
 fs/dlm/lock.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/ast.c b/fs/dlm/ast.c
index 0fe8d80ce5e8..7dd38e15bd25 100644
--- a/fs/dlm/ast.c
+++ b/fs/dlm/ast.c
@@ -81,7 +81,7 @@ bool dlm_may_skip_callback(struct dlm_lkb *lkb, uint32_t flags, int mode,
 		 * Suppress some redundant basts here, do more on removal.
 		 * Don't even add a bast if the callback just before it
 		 * is a bast for the same mode or a more restrictive mode.
-		 * (the addional > PR check is needed for PR/CW inversion)
+		 * (the additional > PR check is needed for PR/CW inversion)
 		 */
 		if (lkb->lkb_last_cb_mode != -1 &&
 		    lkb->lkb_last_cb_flags & DLM_CB_BAST) {
diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index c381e1028446..1e1dc1909733 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -92,7 +92,7 @@ static void do_purge(struct dlm_ls *ls, int nodeid, int pid);
 static void deactivate_rsb(struct kref *kref);
 
 /*
- * Lock compatibilty matrix - thanks Steve
+ * Lock compatibility matrix - thanks Steve
  * UN = Unlocked state. Not really a state, used as a flag
  * PD = Padding. Used to make the matrix a nice power of two in size
  * Other states are the same as the VMS DLM.
-- 
2.48.1

