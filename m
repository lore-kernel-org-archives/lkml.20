Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631211;
	b=CMsEQjgPmymvfCeylJivy4hWS0ijl2kAjLF3b5iLVtDo2k3MXZ8Q5ZgVHA6f94ZE85v+
	 rob0PW1I2A3sjcQaPtoRyRIBLmT7K8PQRe/G35TfepwLZIuh40qkHxxkBM8C37Zayke5A
	 AQ67ElrfV834exIbnwu+HkPdatr5/DqEZ/ytzm/LKxMzrodTmi2XrXWa4mKLzom1WZdlM
	 /GrwV1NhzgNyGvNvlu927nFaJv7nOW6yMQj3FBDth51k79fzCoQ+DY/Ewr50wTEWBmmm5
	 9t6/vwGDJDZwxkhea1fxNZYtm8ugpu7xBj5SykJTJdsEzs2tPLF183Pf80j8RTeTI9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+jf6C5QZHCYFZk+bTrNhuIvnn0Dge3f+1lrrKUvhbkk=;
	b=JkulKBpzmQogvHa+kj+TQMc8gFtNUVGDLNioUBcd9ZwWVeAlGvxtOqozl/QlkAlHtUGZ
	 axcmPyRIdQik6IKdVC2Da0pcf6mvWkHudBTHfNhb3KtuoFoTzuBzckIDtJyRZjkQ2O2Ss
	 DcaTwUXILhKMDrVKEhOsdcm6NCsQo8Oi5hvLMrP8xt7Q0bvmAeXN4TzX0WYaE56Taf11u
	 UTlci3Qg1mpdVgJ0BZQOdts/VA/D+agSElwxWTNTIOnPcW3rq+RDtyNLGI/oEl8C36PP/
	 5JRooRh+vUiZUCTqppcJOBWVM7Pja/1qz1W3IN1RMd08e6JxDT9h+jhU4f6VthLxkmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cqp2vNeO;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E21F6079AA8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E21F6079AA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cqp2vNeO
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4be28b82so3265753f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631210; x=1794236010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+jf6C5QZHCYFZk+bTrNhuIvnn0Dge3f+1lrrKUvhbkk=;
        b=cqp2vNeO537wqvJFSqiY6Sn3SUAqWFM/R2ybe3lru3UPCQHvtQnd0kPTRlJ6GWxPgJ
         X+SgAWMfNMCnFW4HZcMBk/DvOfLTWA36NMZ2FeSlEAdb7WvC4uQLRBd/P2JvVlArVsfK
         TK2F8V4GASuZAeBQ3aH6wne61of77lQ4jFwy9u9nkq2pKWco2Jw8A9o0Z+D6Nsjthgf6
         RPsIAqnaCjLgvar76RvBI2ZhHAb+tqUkcTPR6N5BvnB7xIIfHT3q440/ruSwN0SFKC9G
         JIOHrnqHm8x2lRJr6kGgldDj9K+MIdk27HpMUUsix3Z1rIhNFeC6FGpy5Cl+0OHBJiQP
         Nodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631210; x=1794236010;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+jf6C5QZHCYFZk+bTrNhuIvnn0Dge3f+1lrrKUvhbkk=;
        b=BBXjdT4yIVJ7o09by/FnEC8bI8LspVKn4l/x+6zGcdyswomLhZ+QgGHYQozLlflhZY
         p/oxuw3dQ1rXy72ClvgurEzplINP5eRRjt3vl7vGbHGiGEMBwqQP5XtfX1S+HKmR81an
         oDrM4UUVj8JCmxQLAa3Q2y2npCgh3UTAup7Ekwkiexw02OclvTLEYKd6gTt3G7sclKWp
         jFBTHGB+q9yuJL20qYUPxjRClWEZRMvCAjBhWYjj6lRKlaX0Y2RZF+CUjGxLnb1Y2WsT
         /ecKyKAMb/y0IiXWJMTbKwmyZb+jxDR3RtWjpRt0oDhY6r5ZAO3PCe3pE8k7bDVq1zAT
         a1MA==
X-Forwarded-Encrypted: i=1; AKwUvByUk2sp2KodXtkTU6w/S4PYjmPa8dQkKVer/E9HYh7Eio3P80LrvaQTTQUFPj0FCP/M/OtElIVNgOfRaWc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIGtd8WSkjUPCyCwgR2lVcFo3+mq8fTyhEScSrRGYeOyt8dAI3q
	ogB4q7ikMtigi4HABRoz07xPOv7USYL3Gz3hY5mwrka2t7EWLSZbRpWo
X-Gm-Gg: AYBFou2k8Zl1e7tJmUD4WslNzZvNapm3i9fuHdCyPnnPhUHJDvyn4vJMrAZk7mY5VRV
	qI0jK1s8e7tk2+kR+dcMhoSfvB/VLk4d7kW6wvvJeoVnf9Sr8wNtLTmCXFcqIwj7TMVgEA+Rs3j
	KRmashkYzGLa+EBoj6WAvZ+mXUzy48JQiQp1diIcSHbQDCFIvA1QLAmj+bcKEz7PcjJT5+q8Q9P
	a+DMEnIRv35oc4r5M55PnYrunV9lI3sm1cxWH6IR4NWoQk50m6xXiFh9Kc5QW9T64ZdQzcG4G06
	v8T69g2BtHDVdYMnml80/2xu9RhuhlBhlJ1sA00oOS6LIST/1iZBVjK0AjssCAAPz4qZyhWNGBN
	dhVejJdN8lmFU/MXU5pN68Ge+i/97GuEPh9rx9IR7cqO6IZK/jGn+0qiGHI+w0nqgJZxtMBJ7vM
	aWZuyjvXFaS60mMG1R91i7jR00L67e2AV2qcMigOLJmMV5l7jvHLuR79xcKS15/6nxI4F2CI13u
	fAqMgR+IcPQcVQHDqQ0Wm3ikm8YvDssRC6L5o7DKYxmHD+WdYuA2hXFlaq8tTKT9TBiURvtuUdn
	YpbzLLq5I3qJos3HWY4HpzllQ5U6ZCWaDjOsBMrEdo2s
X-Received: by 2002:a05:600c:3b18:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4ac1932b542mr244898535e9.35.1793631209531;
        Mon, 02 Nov 2026 06:53:29 -0800 (PST)
Received: from localhost.localdomain ([2800:810:84a:dc6d:d32b:1515:b2a9:c74e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm366474025e9.9.2026.11.02.06.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:53:29 -0800 (PST)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: use put_indx_node() in indx_find_sort()
Date: Mon,  2 Nov 2026 11:53:22 -0300
Message-ID: <20261102145322.169626-1-ivanrwcm25@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

indx_find_sort() frees struct indx_node without nb_put(): bare kfree()
on two error paths, and kfree(index)+kfree(node) on pop. Buffer heads
taken by indx_read() therefore leak. Use put_indx_node(), as
indx_find_raw() already does.

194491be54e1 freed n->index on pop only; bh refs and the error paths
were left. Jiasheng Jiang sent the complete put_indx_node() change
earlier (v2) but it was not merged.

QEMU: 300 distinct system.ntfs_security inserts; unpatched pop path
holds nbufs=1 across teardown, patched does not.

Link: https://lore.kernel.org/all/20260118185736.41529-1-jiashengjiangcool@gmail.com/
Fixes: 82cae269cfa9 ("fs/ntfs3: Add initialization of super block")
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 fs/ntfs3/index.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b36760448..00dc87818dfb 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1297,7 +1297,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		    sizeof(struct NTFS_DE) + sizeof(u64)) {
 			if (n) {
 				fnd_pop(fnd);
-				kfree(n);
+				put_indx_node(n);
 			}
 			return -EINVAL;
 		}
@@ -1310,7 +1310,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		/* Try next level. */
 		e = hdr_first_de(&n->index->ihdr);
 		if (!e) {
-			kfree(n);
+			put_indx_node(n);
 			return -EINVAL;
 		}
 
@@ -1330,8 +1330,7 @@ int indx_find_sort(struct ntfs_index *indx, struct ntfs_inode *ni,
 		/* Pop one level. */
 		if (n) {
 			fnd_pop(fnd);
-			kfree(n->index);
-			kfree(n);
+			put_indx_node(n);
 		}
 
 		level = fnd->level;
-- 
2.43.0

