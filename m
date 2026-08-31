Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC183815DD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155398; cv=none; b=EoWlx6mU7xlyj8FciUN33h3q+Mzo0S8HLFufVMw8DYGenuhI8c5Yxy9LCYXGPlXXwdA3HpAQySBP/KgNy59cJZGFPtvGwuEqdN/laeyrfxtDtYQNaOn+nysdqXgf0jf4wKnJzaKNkF/viJcJEV817Q41gP4TEjJsHZ1+6L3P6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155398; c=relaxed/simple;
	bh=MUkgAux14xDdRdEbHCqY3xhMBjSgdm6CfZUlSD4YZgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5vGZNANKM4pakzIRqFfRtG+e+PNFDHFNL7+MPD84+HwGOOZ42eOQz5NhpeI6uPazKiFdl4iWCQVuvmLrpFsCpkhbJ/hOK7Y5H42E2diQ3zSCTfWrMqAwOCArYq334U2MqLx9fr4AMlfZjxSNw4wKMTb7lYPjncif9us+oYcI0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ptxu0t1A; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ptxu0t1A"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so35360915e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155395; x=1788760195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPxIjq0s+Nq97Wec2MiBtymMp8nx1ssSvVChht0+Jc0=;
        b=Ptxu0t1A2LU3JKtcJkb4/SMNhRg0IKoTQ+eVafbDteyNgUvZbZzvOEe/kLjBSHeY7C
         cRnwe0ocLWBGUq50/rtEvgCpWJzwPkKTakVOhfLkJy9BlYCc8W1QrFo/swwoALOGvMa8
         PzRQY8GtgzVzudJwQa/bem7uNAiO0PPTq1b73rA1euCKkvQS9eUqn2GxDSHqM87pmYHr
         MWdFYHLXvS3gCfTLB5mDzKoDx0y+Y6n4RAaPlhFUgg3BiMKYeElU0eRjQVrIOxCi1lf2
         pJGfmont1tWb0GD40wkqzuiZH6qU8t0YK7UxeEryBDsYkJ08GxSCr+VGFAS3+jSBNKJC
         smhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155395; x=1788760195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPxIjq0s+Nq97Wec2MiBtymMp8nx1ssSvVChht0+Jc0=;
        b=GlVNXaq+kEc9TJByvLXtUm8CLpbQ+cpQ9ziiaLizqD1KcqThhbWTijO0+ElvIykoMO
         8UBSsNLBlOou6xAQgAMnmMdBT9uZ8YQsdSgLEXrdgxF8sj1vhuR90SwIoKpDRVCc2N2y
         s4aS34at4nROnA7ub+ksJxBQRjAXLbDv/iDNLl9Otj0M3e4fRGo+2ER3GZmSdKF0I4RK
         GhrOvSV5zWTEtRFPRCz1Q6dCUL2CbQQL7V5v6iZMn+KBZBGKIlzgIX2E071pgwbKB8qx
         QjMGv1wF1dHpYEcYgmGEsDA/1abEexQL/OuI9YFDazR61AegJOHUyhR2IFUlXh8XH2KI
         ooWw==
X-Forwarded-Encrypted: i=1; AHgh+RqLhmvJKtH3JlB84NW8HkQV51hXzOkujOKsQzJKERUgnGD+MrCqSkw7CiKqy0Ggysyeq1fvWMyE+F3OXfM=@vger.kernel.org
X-Gm-Message-State: AFuF++nNNYrjzS3nwzr6jyWOOlTuqBt8q/IkOtJgAMG+bVVdbONptPZD
	+TPNW6ukinZy2XW+FTI+r1BEP6lE66IqPhKk91XYNO2AIXdOW5SJTkuISj+5veyDHE8=
X-Gm-Gg: AR+sD11ICkqQt/hUj3zpaMUnl3yb21UON2WA7LXawW5nkYyfn6teDWFy6mPu2lI2xWg
	6a+3yNfnwEduqwryH2+zcCaJagSQLgkmiVifpnb/n9IXRKsigRwO95lIj5DNuTatTODNpheoAgt
	2NjmDIvj1S+jLXxEu0wpHqt1gpr5hFqWKJAr4YFvFzY3xZpLmHLueYgcJef2ADAaUen3EDNAxZT
	56HsPnM5ofE/CivqLTaHglNWalOkyojXv028urOAVnlPitBZOq3xiuVcz/rpL5hE2Z+2sh1SpQ2
	pO6GODz3E7U1Vv5Qk8A7oHyMqBUxwoifnHZjSWwcU0jb05fmboVHcVs8FELv5iGXCWNIfKgfQr8
	aCw4HC/sEITgz4g4/t8S3rmTluveeLt2Pa3a/+YI0W6K7zBtJnWtZOtBPsHGK4KV+nvzJ110qkM
	KyjNaMhD6TXplmTeN5mIteOv3hIEL5CpAFY/4uIcZ1sIyRQZSWbz9sWn6uAxNhTQ47mFH0JsAaZ
	xLSWZ2U2g==
X-Received: by 2002:a05:600c:c172:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49cd948532emr13747205e9.5.1788155394504;
        Sun, 30 Aug 2026 22:49:54 -0700 (PDT)
Received: from DESKTOP-OL07BOP.localdomain ([87.116.179.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm258647025e9.4.2026.08.30.22.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:49:54 -0700 (PDT)
From: nenkov2004@gmail.com
To: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	Hristos Nenkov <nenkov2004@gmail.com>
Subject: [PATCH v2] rust: binder: Use lower bound for node debug lookup
Date: Mon, 31 Aug 2026 07:49:20 +0200
Message-ID: <20260831054920.42550-1-nenkov2004@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831052635.42417-1-nenkov2004@gmail.com>
References: <20260831052635.42417-1-nenkov2004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hristos Nenkov <nenkov2004@gmail.com>

The Binder node debug lookup currently walks the process node RBTree
from the beginning until it finds the first node pointer greater than
the requested pointer.

Use RBTree::cursor_lower_bound() to start the lookup at the relevant
tree position instead. When the lower-bound key is equal to the
requested pointer, inspect the next node to preserve the existing
strictly-greater-than semantics.

This changes the tree lookup from a linear scan to an O(log n) search
without changing the returned node semantics.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://github.com/Rust-for-Linux/linux/issues/1249
Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
---
 drivers/android/binder/process.rs | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
index 5372bfbd9..8e7218ee0 100644
--- a/drivers/android/binder/process.rs
+++ b/drivers/android/binder/process.rs
@@ -1208,10 +1208,14 @@ fn get_node_debug_info(&self, data: UserSlice) -> Result {
 
         {
             let inner = self.inner.lock();
-            for (node_ptr, node) in &inner.nodes {
+
+            if let Some(cursor) = inner.nodes.cursor_lower_bound(&ptr) {
+                let (node_ptr, node) = cursor.current();
+
                 if *node_ptr > ptr {
                     node.populate_debug_info(&mut out, &inner);
-                    break;
+                } else if let Some((_, node)) = cursor.peek_next() {
+                    node.populate_debug_info(&mut out, &inner);
                 }
             }
         }

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0

