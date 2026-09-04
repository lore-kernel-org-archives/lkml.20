Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD003D5C12
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509130; cv=none; b=JxMl9jrso6Agi+84TJ7qEWimOkTIsvDl36q+5ylcTc6GRpBbCnGyz5wphhSzuvwpCIo7TYvaZRvgKaLyLmvvxDVfvTFQ/40zboOQG43PW392RO4imQQMd9B/ASCNQjbN8LfT86MAcibIORfttdkivTruBQ0dCfEm2t3AqbnklMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509130; c=relaxed/simple;
	bh=jdiffeHYmFA8DNcP3BNSRC5Yis/Ko2nHBNrnJOxv9Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mGiqkXqncx2bmxhIVsWXbhChhuETGxg9toAr0xKlcSxdcbY8craoEU9PuKeORbLTxGqX0cedmDT8I2jB+a6iwufPAR2vM2FH0i0rXBOugok2gYA173M7FwKU1HyHfHB6+AST2IWK1vlIyqoajUhPf4ditP1oGJeuM6ZBAF3vE5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQsx8/Qi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQsx8/Qi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b965570d7so8008335e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788509127; x=1789113927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aE97C67i/6HILbYP0ZPZ0KdmA5bZduDkmUAlNiBx1QA=;
        b=QQsx8/Qi8XXN5pTV+Jux39lQbM7JXsfxaEY9vf8I4+K4WuyPyy0tpQKj3tqwVMFwhu
         rg9RjKJ/nXkrLQs3jFDm5BVMC7V0v/deoRONLbk1nWb2iYhyF1yxAU05wp19F0THJ0Bc
         Jo+GHA54A5hH3tmFYyR6IakuAkGOivdqhf2tU0H+vIZHzvcX20rxT45UCTDbreh3ptQe
         ujCs07aJJGizIu0W4Vn7igtSeqoFVTp6t6mJVpJi0O5fQU799NBbX9zGyfmKO3i0rcOC
         zS8CUVRdc9SiDJViQE1qMfzg6ie8DvwJH8phklxucMGQScfhlyqyJ+yInN5uwkf4BZIm
         RhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788509127; x=1789113927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aE97C67i/6HILbYP0ZPZ0KdmA5bZduDkmUAlNiBx1QA=;
        b=kffma2Fav+5bB8/iPaI3dGYGlN5AVzAVLH7tAe3ddksQCU838oopSRzfxBrxWKPotl
         L6C6YIVM1SVChO4NAtscThcHv8o8Pa5bA2RCklrCPaz5uo3QMJsjFrdsmMec4t2usuNE
         iA9vizvgRV4s7gzvv9ABG63BC3DXub4bJOyOJg7ovYiYiJAx1ckuOM43r3ockTJOO/mA
         mOMzlPJVQc021c7+4zngphD1MMXlFvRwZX6PxYIr+U+0CFUuUGUMlR1fYz+RdmWSFa1y
         71y6p+sqS7DrD55A4n+7nJObOZI5P7hg3KMEqYsDTUnwmLKh4Y+gSQcacdgJ76hpmNID
         bJBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLAV+S+5eeLlFyvBitA4IXtxPNX03NlPkN387XWDouHks7ClXOu8K2en+qtHHPaPl5x+dPbciubpm2ydo=@vger.kernel.org
X-Gm-Message-State: AFuF++mdk9TZRvt79z51D3lz2Vox2K4iDxtauO45OiSwOqwgz/E/DWJx
	wdTC+PM4i+RVedI7xwSfjyW/6S/pz5fzU3QwctzvsbbW4XyxKCBDYaI=
X-Gm-Gg: AYBFou39Aj8+cIDI7MkG9XL1Cxbjq9xKjIVO4gzmXgaS5yOR+pYLejS1emggLd0QMK9
	5H5hy2heje1PfpVAJiAtafbH4wBxMQcyQtt/iGFuGr4H/J3G0e/eLhnrncev4VaPl0LcpTEdFFD
	IkbfhNvgjKXRqmLm4HhoHvgYk08aIzDH7NMSdCc5Nvvhfu/Zb4+Xn7JUBY0XttNsK7EK5zfMQnl
	fPImq0iTei7tk/HyQls7ok2OWGRD+qic9Wq3FO5ppiARXRB69zWVzBJg2WG/JMHdtakQtUe2Him
	vHg9/IguqzYX6ZOD/Ln8H8aMcd9ITnlhP3PWp3EEjpf6ggUc5bOVQjOP5oZYpybgIpE9AILC5xs
	We0isLTLG3v+hlcU5S7NGZW1TG0YEmqMD9bRzJRlopiSI5RdwlT9DtY/5ymtiHGIYPJKZ6gNn9T
	wsC9J6dFuTg3LMvmA3a9pUPdTl0ETz0w==
X-Received: by 2002:a05:600c:46cf:b0:49c:fc6e:8cad with SMTP id 5b1f17b1804b1-49cfdb3a26amr7325095e9.17.1788509127332;
        Fri, 04 Sep 2026 01:05:27 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cc7sm53517855e9.4.2026.09.04.01.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:05:25 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: core: fix device cleanup on allocation failure
Date: Fri,  4 Sep 2026 08:05:24 +0000
Message-ID: <20260904080524.3872926-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

hid_allocate_device() calls hid_destroy_device() in its error path when
hid_bpf_device_init() fails.  hid_destroy_device() in turn calls
hid_bpf_destroy_device() which invokes synchronize_srcu() and
cleanup_srcu_struct() on the SRCU structure.  However, at this point
init_srcu_struct() has not been called (or has failed), so the SRCU
internal pointers are all zeroed from kzalloc.  Dereferencing them
causes a general protection fault:

  general protection fault in check_init_srcu_struct
  KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
  Call Trace:
   synchronize_srcu+0x1c/0x2b0
   hid_bpf_destroy_device+0x64/0x90
   hid_destroy_device+0x29/0x240
   hid_allocate_device+0x420/0x4e0
   uhid_dev_create2+0x161/0x890

Fix this by replacing hid_destroy_device() with put_device() in the
error path.  At this point in hid_allocate_device(), the device has
been initialized (device_initialize) but not yet added (device_add),
so put_device() is the correct cleanup call.  It triggers the release
callback which frees the hid_device without attempting to clean up
resources that were never set up.

Found by syzkaller on Ubuntu 6.14.11 KASAN.

Fixes: 6cd735f0e57a ("HID: bpf: protect HID-BPF prog_list access by a SRCU")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/hid/hid-core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a3ff0514f9cdf..d8df23f67f1fd 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -3115,7 +3115,12 @@ struct hid_device *hid_allocate_device(void)
 	return hdev;
 
 out_err:
-	hid_destroy_device(hdev);
+	/*
+	 * hid_destroy_device() cannot be used here because
+	 * hid_bpf_device_init() failed and the SRCU struct was never
+	 * initialized.  Release the device directly.
+	 */
+	put_device(&hdev->dev);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(hid_allocate_device);
-- 
2.47.3

