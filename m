Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB1397925
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154015; cv=none; b=QSLdIbZJTd9o/NdoOdSR8D7y/FLRAES1x372AnxdaHae89EqUF9ejVComFhCT1TfDR5Kd0girp0Y1j1uglqY43m4565eYyljxw6vUD/LkAdf02ALmqV4qe2G5k4zB24BOVM5aeWc+F+9dPLyEgRsauKEg2GZ1kyyk79t6LOvC/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154015; c=relaxed/simple;
	bh=yaCPKmrS/9NPR5VEMkALI0bq8i+JN8UC58RcBpXumdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VUsxmWxgjvpfgU26oXbZDMRKuH0qyHUzIFyzrdo3d+J11vY2ouwFw41nT53hycdbqbLvuvEw1TAeot/OGpBeSzKLpRY1QoH0DLmNM5SnE6rkR1JfrgTmljQ6NRjpxCyIEM/Dx7ncOjiVVejU8m2JdjuFfz7vNxgeFHgwtyZEq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbIz/urS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbIz/urS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b965570d7so27583805e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154012; x=1788758812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn2YXo2p6aZBKHPFyNwPPOY+eiki/TgtZlctXUmhiOU=;
        b=VbIz/urSFkAVFcyz9uskomSLrsRRa/J5sHqSu1AHMZQxmlJm/wCLw8NfrOTXs+LvvB
         LI9v1/duGn/6VIGFckGyVG3jU/86d5jzXXEySe0iPH/Q1Antzel03vlxihahohPsr3aL
         NljZiq6kNJNshqPE+h/g6zqLSmqo4UFJH4pkQQgEMDPAAanYsMT+eryR8aE+iAijaczi
         QwKU1RRuCqdcVVx5xk3y2BWCt8qU9Gh28xbF/yas4wl9FTbYxH3AcbnQjoGkPOBLf4pj
         JbPkfJd6e922ZqglQgZxXOVvVwKOhTfymhlTU2mhRNP9w4+t9P2vXFRiNfRzd5SjPEEQ
         Ew/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154012; x=1788758812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn2YXo2p6aZBKHPFyNwPPOY+eiki/TgtZlctXUmhiOU=;
        b=RgRIDFo3Yn4eDis6M9ZQSoyz6KRTJf+fYal/2h0wtJ4W+RdlkL51JU5ug0PI7I5T4C
         +cJ0x9baIUKf0cgmxPxqDaBS1cuGXR5oGxI78xVTLweztFv97pRW37BgM50lycHm15j5
         yBxrIkkYRcnCFE0A/B1V/CA62Yswsk0cAKNYB1j5kYjOpPZS3NptA+LH2b4vv2Q5RpDG
         ezU7egMGrF4SajqIjSfbp5jRqUH7zh/mLlGZVsfiwwyuo0V4RdLBi6ormy8sVBkdKYRl
         8kVNGRZ1fUS8EXw0l3yK3yNIw7buKgUQv0JsWjFGdUVusLjkV92JrtvQhsUXmVwCPAWu
         lvjA==
X-Forwarded-Encrypted: i=1; AHgh+RqSe28+oShXbrNhoQg2zEeik240wHX378k7dCLkD4a9o2H9QYHKR9hY4ygXu1f1xZGJuVlDZc9svVL4wso=@vger.kernel.org
X-Gm-Message-State: AFuF++mZl+IZxREuEG+9X36Vl1C9m8UI0x+5BKfJJUax2uErpsjStF81
	CdWxaJx4rzSAMFc8wviKFYbPsjRBadjcwNezD1eIIcGr4n7Mubr3Wfs4
X-Gm-Gg: AR+sD12AeJxr7dqxfojl0+LtU7ZfGOGs/P1O7yAXZbCSzA0rqX9bV4WhuXOEylde0fN
	lVr998F+wbileqiSMNag8GKa1SHRPxbTEHtpNcH/TEe+2ftv6f7vnmKwzvCWXSW/vl/zE81K6+u
	NMsrgzZfVDQBKQngAE+wlVlsfQZb3SPnXKZzVX2BJF9OEO6+eschVULNRPG8jBQxEHfZ7XNE7gX
	iAu+flhdp+RhnJhFYITVYeR6AYK2fjG6s1Nyv5mp+xgOqIwSpe5vuCUzvIwdpJ9kE1LsvQWPt/7
	3zkBtFM9gqHVza6Can/bQBAwh9SlMLDh37uwYmcXtxsHrpmighnarechAzG/88dmIlc8nff3vd7
	FP0O/xP8/tynf/GbdW1Xo5XesQ0h7+jruQ+b0ht2c44484tqjNiji09qrXYrmxhfswE4ZgLDWa2
	k74HEFOR6TdCBvWfllI/t67j6SXOh4jULRoOy7sQv+9Qx9bLnvx0+xJcpSIhEj91RxZ4JG4TzKv
	UsUI8tZkw==
X-Received: by 2002:a05:600c:4443:b0:499:b3f0:ff05 with SMTP id 5b1f17b1804b1-49b91c56f41mr322660655e9.13.1788154011654;
        Sun, 30 Aug 2026 22:26:51 -0700 (PDT)
Received: from DESKTOP-OL07BOP.localdomain ([87.116.179.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccae954f9sm193293185e9.13.2026.08.30.22.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 22:26:51 -0700 (PDT)
From: nenkov2004@gmail.com
To: rust-for-linux@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	ChrisX101010 <nenkov2004@gmail.com>
Subject: [PATCH] rust: binder: Use lower bound for node debug lookup
Date: Mon, 31 Aug 2026 07:26:35 +0200
Message-ID: <20260831052635.42417-1-nenkov2004@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: ChrisX101010 <nenkov2004@gmail.com>

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
Signed-off-by: ChrisX101010 <nenkov2004@gmail.com>
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

