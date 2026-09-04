Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DED44AB81
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520817; cv=none; b=Zkm6jGvju+lN/QNA6+I3Ry1HaXhZ8nerbCSFUJlKi92Atrvf/We3tmvqt3s5j76O9M9CLYXb/rkeLZXZ5svUecE62pqWhoSSvJaUCQ1ZIEQjEeJ/2BMZlxTpaGU55CAJ8qgZtsRT8FM5SMutDjy46gpL7EIYJamYCrvrHNdNVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520817; c=relaxed/simple;
	bh=CF0YCed2WtdqEGRqOM9y1KcRf8RpN7O6C2r0lIoiiMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dD9ZgIRceujwKTzl8W6ZpaT2oFNJzSf9mKbG821IwSVsv4iYnNNuwgKiwRKZ2BCjEqq672AX5gzaSzs6EGZxz9MoAENOujhd+SrTX0fQgQSueV8C/YL29+TnuZcDX0LxdyZo9RRv5PLlxzhBBTtMi14saRIiLwQrXIu/WCpEMAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcFWjEWW; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcFWjEWW"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e6b5737bb2so1084176a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520814; x=1789125614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JeAXB5jcaMUwlkcazxMxNc2XuQ65/XFpmGAtCnFbJ/Q=;
        b=QcFWjEWWDMPYbUncK+culUVNnMhrbVb+ENLGAAEcN8+Di9teJZYCJcTXbdkODRqf7G
         x77sbkrR19vl6szy+g2LaE3OqUR2VOpUcinX9q6WoTfZ6bUsu0RoCwASVLyPmOpSEyuo
         bnO3nlL7SIRC9/hWfJYpyjW8GTs13PpDloaIrksLRnL2EQ4oWEJN9exu9ircfhC5PFCI
         PwVCVTZ0O8QV8Qy3Sn8V5iQPUJT+4dIHRyqdLpjz+PnvKAvJorEkg+TelWXRZv21SuyD
         LTA6C/uGoaAnOZ7DqqISV9pVb5aJ9RfWWIL72EQfGzqyAy/kxkFw0mACa1EB7f3gBDL9
         qgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520814; x=1789125614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JeAXB5jcaMUwlkcazxMxNc2XuQ65/XFpmGAtCnFbJ/Q=;
        b=PeL3iwcgmBzn7G5ObS36buEsACXjC7nnRqq/R08NqkHZiZL7lB3VQ29Tr5e9s1Vwth
         XVzn5qcZORj2tvb/MOVN7vavcZgTrrgyRG+fWiBdw8/x/dL5VQF6yf/wt7KQCR2DpLmu
         fe0osc6KayLH9lYN5uttqjVWdTPFtuy1xx4hCwv0o/AOHcFrlUyOmh1iDQMuKHiBa9ee
         h6qmLpEbrnafGz37Fc74SCFn44mxkbnr3Hf6qCaDzcTCV75rRLacxY9UNrufHZfsTk3W
         WquWXYf6/jzSaNi6Wl2t3MUZpBiEUHZMdhpEzCu/yadj7dRrWNIn1Wfq8jI/8eLQ+zZz
         m7wQ==
X-Gm-Message-State: AFuF++nmsRkyEoedLjXhojoUeCM/lDxA2f+JST+7Jb9wAgoJTawLJIDF
	5K/T+9pR8ORc3GBUZOka2ObRIqilrDtsqB8RaPYKdSNFcFc5YIQVHA5pI5BrA5st8SU=
X-Gm-Gg: AYBFou3zrkCMG1vfxVGe+UJUkBk03PnWo/7lxG668cxbh8y2923MI9ZBGmZntBOU9+/
	lTO3vHtImX9LrSYPqk15NQfmXfTSd7mfERlMKepb0ADBEBER6iMdRmPMhQnwRF9E1QXEBenuXYl
	RTTsMKHiCEOkS121FsJoAyuP6NWOx9f/LeilLGMhQs1+RUSvRxVKnMeJgW0KgNG86R7TI6phyBv
	/oLZCqTy/4hwc2lalStjJsZba6GdEzQPlogGSGobDNz4sC6bF+wJlEIXbUF3fG98kaL/llURv61
	5bSqmZY9SwWgPVc5WJaU4sxF9ME4VrN2HwbGfycn0n8AvAFBmKOlJ9pB2iBXz/5BkV/pR+kmOd2
	3WCyQ+IHn7x13olgq7HaHVaOzKdaLh0WkRd7l1wRX5QBkqMqIWrR7XOngLRunW1OjY1budhy+d0
	M4hcY3c+yMGfP+e1D9z/dwEX6LiOxJAclW/zEZZtMNIUIEGaUSKjtxb81AdbLn93FmJMbBHLkR6
	8YkcpeCuaDekKA=
X-Received: by 2002:a05:6820:190f:b0:6b1:8a16:a3f1 with SMTP id 006d021491bc7-6b6fd3d772emr3600103eaf.27.1788520813778;
        Fri, 04 Sep 2026 04:20:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa36b37sm5900541eec.14.2026.09.04.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:20:13 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH] firmware: efi: fix typo "existance" in comment
Date: Fri,  4 Sep 2026 16:50:08 +0530
Message-ID: <20260904112009.33620-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "existance" to "existence", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/efi/efi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 0327a39d31fa..846179b23160 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -8,7 +8,7 @@
  *
  * This code registers /sys/firmware/efi{,/efivars} when EFI is supported,
  * allowing the efivarfs to be mounted or the efivars module to be loaded.
- * The existance of /sys/firmware/efi may also be used by userspace to
+ * The existence of /sys/firmware/efi may also be used by userspace to
  * determine that the system supports EFI.
  */
 
-- 
2.48.1

