Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D7399357
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853819; cv=none; b=h773HajUZ2HgRDPyIxXCCIeG8JxAkBG0YOrohJNzNjqjnx1aWKukfm3orXYYQQn/RyXCazMrMPo4ZjplKyvIMeEKMLC/dhiWm7oYnWmNLqXKBlhadGpFqYAhsmRFPzKOe1nEVkHDzkdap/RUQHur50Bo1bnhLFhaJ71hGnDFI/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853819; c=relaxed/simple;
	bh=rPxYorXBxLH9SA6QOD4AD2GTVgN1Qb+tHQJ/Ssh0zpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsLwITI4Txh5ULQV9kxUkqdcd2w7NvPPwPPLo92L1EBmihl/UkeIWsRP2ULSflXF0GwzeRJvBBbQ3CB+SZ7LRkdZ/fFl/WtfNIbsfk9Q/EfGdRIdTtylR+aRfLdMmB2Q9K4MxXrPbSWB/+P1XsVEe4+6QdTDYATuRg8kudaHcuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn7AmyoY; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn7AmyoY"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so1432618a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853813; x=1790458613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhDHWk4MaCAHrcJuEVbfs5Xm9nSbhtim6CiheN3v+sg=;
        b=Yn7AmyoYIn+9PiMcVHGwuRp00h6iS6BoNFcmoiHtUHy6Id43ghSF7aXKUqwxTiyNfe
         XG+snR6jKULcnrC+CVnaALvNoxqE7D7rCCNCsS9KdIU6Ww8TdnW2AqJp3QP4+Kxlw7tI
         DMcwNKSWgFwY2JnELlG/9nUW1/BWMN+dPrEQgZiQeQVjDg9wOrxdmotc2tkXbFTCzx0k
         zBu4QjC47Qc811+GPZO0tE3ytkx3TMHxEWV2Csb5RW80YPCkrVk9i8tK+RygGxAWGKX/
         UyYYbEMclTqf2Jui8Cjq8Bq3uiaAsb5V0cgTIul/2IhRoOXx5b7Cs0govNH5iXU9kw0q
         cJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853813; x=1790458613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhDHWk4MaCAHrcJuEVbfs5Xm9nSbhtim6CiheN3v+sg=;
        b=lWim5y3PK7uso0E2cXGW1Kov8Zd0y1pqJe8BiVdHW391OPD24GRlDIOHPF8cSm35Xe
         TBRRNh6GuiR6p8ygj9smDexiEXkfUF3/IlDVyUetwe6T4f/jhPkcS9Se8/e7/7hWpF93
         ciVBhXTMGAcvcT2lXc7uIdfVy3s8KHsUO4OWUdKA90PL6X2NOR8wvL8gORMfpNwgr6dJ
         /7iwYzwS9ZSe14t8/oernGvSOA9zDFKjhe9Y7LnNbIx7pDQiQAKo/T6hiwLA0L6P3Rta
         jHmMk1f59R9sCRvlssxBFXSe1DlI/ptnY2dDE1RLnS0tZWEzFq8XEDD8C7WbmvfaKN9b
         iQEw==
X-Gm-Message-State: AFuF++mHmUKLL8DQClyyUa7bUp+l1FK1Ipo3UBJJhfe/CaDs1dEtb0Bm
	55TH6nd/ZoQt0jMJ+UYPwC+HMsWMaGCyxZVKwFQsD+rCLa+KFgzN41iz
X-Gm-Gg: AYBFou38he6Nh0XcxaI1VhzvyUf7AMDoS4W68ITXKmMSJ9RCRDglStDdrlryJ/T7iTh
	0J920qRDz1AicWpLht5NGgd48WdH0fDBzqdJKfvb0cLfCtjjQ+pzG6JEDzxXkUJ+if0OTPsTvKD
	hwNrs3xw2FxIxvtHajUTdWczugGUDpO7RKEfitvl7XqbenflYWfCRABzaw1OZu377T92HvNEh9t
	hn4CJ4sZS/l8U3FPjcQFM2CGixXXOyzq9gvE1r2B2Ao8q0KemvvDGdXD+aqYaCPBp3dXHxor62q
	kEveBjINnKK/pqJs9gMixavxGZVkq0A7mZezuof61SHlypWmUn91x0kqJZ6phVgbgtOGOZipddW
	5frBXiIuPYcb2JeFZHZQDuL6qGWLVQwuiQxwUVEDGLliq3qhl/gHUnKr9YeGoRk8DfHrqWT64jV
	wy0GUy5EjoSEGcQF0iwpcn08Bg/AS1PrMU8CdnY9cTZGMUkyMIDowCA7cEtDri5X++VpenQAFds
	HaOhNNJ14kcjM2mUyYGJJ7PW24G7b0F+V98sWnjlFQipaNfWPhGjQeYnjGwQ1fsL4bY714/zGLj
	Fcmx33aaeA==
X-Received: by 2002:a17:90b:4b86:b0:39e:21a7:5dfe with SMTP id 98e67ed59e1d1-39e54c5a1ecmr16978243a91.3.1789853813145;
        Sat, 19 Sep 2026 14:36:53 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb372b7sm6231723a91.15.2026.09.19.14.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:52 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] binder: roll back frozen state and enqueue freeze work on BINDER_FREEZE error
Date: Sat, 19 Sep 2026 21:36:52 +0000
Message-ID: <20260919213652.3317208-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two state rollback bugs when `BINDER_FREEZE` fails with `-EAGAIN`:

1. In `binder_ioctl_freeze()`, `target_proc->is_frozen = true` is set
   before waiting for pending transactions to drain. If
   `wait_event_interruptible_timeout()` times out with `-EAGAIN`,
   `binder_ioctl_freeze()` resets `target_proc->is_frozen = false` but
   omits calling `binder_add_freeze_work(target_proc, false)`, leaving
   any `BINDER_WORK_FROZEN_INFO` state queued during the freeze window
   un-cleared.
2. In `binder_ioctl()` (`BINDER_FREEZE`), a single PID can own multiple
   `binder_proc` instances (`target_procs[]`). If
   `binder_ioctl_freeze()` succeeds on `target_procs[0]` (`is_frozen =
   true`) and then fails with `-EAGAIN` on `target_procs[1]`, the loop
   exits and returns `-EAGAIN` to userspace while leaving
   `target_procs[0]` permanently frozen. Unfreeze any previously frozen
   `target_procs[0..i-1]` when `binder_ioctl_freeze()` fails.

Fixes: 432ff1e91694 ("binder: BINDER_FREEZE ioctl")
Fixes: d579b04a52a1 ("binder: frozen notification")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 drivers/android/binder.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8f2ef1bd539f..1c7218e599a1 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5732,6 +5756,7 @@ static int binder_ioctl_freeze(struct binder_freeze_info *info,
 		binder_inner_proc_lock(target_proc);
 		target_proc->is_frozen = false;
 		binder_inner_proc_unlock(target_proc);
+		binder_add_freeze_work(target_proc, false);
 	} else {
 		binder_add_freeze_work(target_proc, true);
 	}
@@ -5939,9 +5964,19 @@ static long binder_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		mutex_unlock(&binder_procs_lock);
 
 		for (i = 0; i < target_procs_count; i++) {
-			if (ret >= 0)
+			if (ret >= 0) {
 				ret = binder_ioctl_freeze(&info,
 							  target_procs[i]);
+				if (ret < 0 && info.enable) {
+					struct binder_freeze_info unfreeze = info;
+					int j;
+
+					unfreeze.enable = 0;
+					for (j = 0; j < i; j++)
+						binder_ioctl_freeze(&unfreeze,
+								    target_procs[j]);
+				}
+			}
 
 			binder_proc_dec_tmpref(target_procs[i]);
 		}
