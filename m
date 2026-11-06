Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972952;
	b=Y29jNcmfn2DvS2zMxiX1FyV/kRN/5nx49gpyiZs6vDneAtNn6AiFOUBkPxnvRiDvapgU
	 S8oVKeb2knVJe8DKQbjv41ss0kJQsmKkcPxuuPFa17MgVIS8tB3TDhPJqzeZMF8NgTr0u
	 Jx6q/tnXKcQcrovPIc7wYvz68uRzqiHQolinZ+96IoGOm+mvdFmojzTY+7ySsZ7qHuTF0
	 l2YQifQOJDEwWtJuq5NoGLOR/BdaUg+AX8an5NvSYWsKrS4Cs7j993gKtg/0HBwppv8S4
	 Ph+BWkvr/bNUSSBWG96/42wQFvi0XAMY3bwGZa1Vy928w3lzx9XTxdSEWDlL+SNobaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=goEwqDn2eYKToeRxOVfZCjIr5NYHVGNIUeiTdWCM6aE=;
	b=T0Za8VpOmnzc8KPervyMPdEk/GGGUj9dhrF8g2nyRLaoBS6kjMIMe0ep/7RI/vrL0UTh
	 ScTmaxeDnnnPkgO3ggU9O8SxtFCPe40utjaEClzWdF4BDtlSOnxXlMeaVVQkq6vnFupUr
	 N3Ju+qCbpRpqYFHqHgKpR6QPOu6oFLDS1SaDQ6BP1p9eXMgc5SoSdBkHOi5Vs7dvnAET6
	 cLmWynkzkbzNDiUdZwqknoIye0nAIPanoNi9N/4YMRO3F5weYKt+vAcNuSwjfM0j4Ga8A
	 VJaARiA/MxCZpnqDTTVYPhJb4U2H2gAS+u6etNMJ5QA60JZQr2GXBdPUxePygp+fSbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4usKOQy;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3FB606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3FB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u4usKOQy
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so250103b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793972951; x=1794577751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=goEwqDn2eYKToeRxOVfZCjIr5NYHVGNIUeiTdWCM6aE=;
        b=u4usKOQyo7y7sS8gJ0W9+TeF0+TN9wBJcfhPuH8r9v8O2beV55nNWMNOlm+gILVkQV
         DbaogKM0QgECLtjX9Zwq5QiQJfIgoO61eMFLY1Z52RQ/mYAL1y1yXw66rBfGolCgPF5Z
         D6IwpFzY/CLLmGzkmxeSEdKt5iNqVN/8yVoqclcjgD78AyVE2BG3JHcAdC/FX6R9Alus
         93tKujieJ4P9LRMYYAfsBOIYlMTmxQkZHJrGCSEIQlr3Rj+8jUNdxHOXi7i8LJdVLDHr
         FIEqpgqcPE5T9DCpEuSdhZNvk+54+Ai0gIbkeBZvi84blCn9bMQMnPQYn0Q67OO6zJvC
         B92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972951; x=1794577751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goEwqDn2eYKToeRxOVfZCjIr5NYHVGNIUeiTdWCM6aE=;
        b=BqVEQvUFiM1i7sUFXgEa39Tko9fvcxckizpfHXMIwmX97/h5/UnXLGOQ5EXfPhPc8J
         eGs1PcfkqZNzavxAgm5gWvzbcZwNvpmQ3E5MtScH4X6DXZhRWGdX6x+xWeTGvBogHk2N
         LgVnWWFrjMT7mdZRqNT1x4E91ITJbFJ825QydCdpP1HT1N7SZk89c1Q+3ZqL5s+MnO/1
         WhPZHzcqXyoFuXOehm3dnJrGTG+60d1NX+xm4pz2GXXw09ZXBwMMZ3bgmcl/OQOr6+Rd
         YyjaZIHAdCrNect+W9YEf+ManJ/sTjE1BT+QK48HxoSKOKOLrSNHERGbd/ADoHI/lTjC
         SjvA==
X-Forwarded-Encrypted: i=1; AKwUvByTm6QoqVihxcL8ACEDrNDGX86qW90HFEo7IyHLnb649yJrjudTM8r18bUk0GJS0Y2yU/8kl5YEIjNCpyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9535CmOhsx4WWLLUduHjvSihE2E0AJA92vcQN+qItLOII3PYDr
	Lr7va14+whZo9lEt9rx2ruv/IGI9lVYW6voi1zLhMCvA34VS2AHa+uus
X-Gm-Gg: AYBFou2BdEPswjxTdUe7bjOvorUsACDc8lpVlOzNqsqpH9OI13puvRi7nfadYoUboOG
	LSpTQ8bd1eexRQfTGPJMYhFdI6vuemmkqv7XL4AuqCM5Rpud8Pg8YXvNKMsLqzb2hiV/lnYrJU8
	2siZZINZdbK29xHx/OexeICgjqWpy0aZYq54mJ2CUs/j1PNi1qBC6hHae4NNhb1nH9nRdEJ8V+I
	2/cv2w/M0r1FLIy0pqGh8MayWgA88jUYneOog9ehnt0l3+UZrLYlBQOpCywn1GUn8GlbQMu3oDQ
	PVBI5siO6E3HWzuJ//TcOKdB7ikPqD9RMBPGib0u13hnjegLVaMXtGQyBkE0X7vNoqi0TeLxLx6
	0JuZjRXJ4cO33W4p66dyhoUuoTD6djNUPTywQrHz5HTIIEQu8XiDhMwdel8EshCIGC40IoJ/1ps
	yIx32MTBaur3aDQbUK4cUz5QLReGZsCY2lOjczjHF9gXy6BjbRc+Ju7Ku5yde4vRoIyHfaHH30I
	h9rp4Lbj7FsPqvupvLQwL3jUJMqjzEJnM7tZdJyOkMFcRV6fVhMbJjamsmjEBzAZdnpwp+1Ackx
	GSwPSgNh6QLWlx9SPAW+f77S0KQs1tYEFJ/xXjpVChDbHw==
X-Received: by 2002:a05:6a00:3ccf:b0:898:efb4:ec4 with SMTP id d2e1a72fcca58-8b37c826278mr2349025b3a.55.1793972951123;
        Fri, 06 Nov 2026 05:49:11 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b35a0c4431sm603114b3a.42.2026.11.06.05.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:49:10 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: don't write a compressed frame after a short copy
Date: Fri,  6 Nov 2026 21:49:05 +0800
Message-ID: <20261106134906.3139994-1-zhanxusheng1024@gmail.com>
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

ntfs_compress_write() skips ni_read_frame() when the write covers the
whole frame, or runs from the start of the frame to past i_size. If
the copy from user space then comes up short, the rest of the frame
is whatever the folios held; ni_write_frame() compresses it to disk
and the folios are marked uptodate.

The copy can come up short after fault_in_iov_iter_readable() has
succeeded if the source buffer is unmapped in between. On a volume
with 4K clusters, writing 64K at offset 0 of a compressed file while
another thread unmaps and remaps the last page of the buffer replaces
the last 4096 bytes of the frame with zeros. The write returns
-EFAULT.

Don't write the frame in that case; fail with -EFAULT as if nothing
had been copied.

Fixes: 4342306f0f0d ("fs/ntfs3: Add file operations and implementation")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in QEMU on v7.4-rc1 with KASAN, page cache dropped before each
write:

  before: 3 of 755 writes left zeros at bytes 61440-65535
  after:  0 of 821 writes changed the file on failure

 fs/ntfs3/file.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index 1624f9b014e0..b1b925f95b8d 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1099,7 +1099,8 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 
 	/* Copy user data [pos : pos + count). */
 	while (count) {
-		size_t copied, bytes;
+		size_t copied, bytes, want;
+		bool full_frame = false;
 
 		off = pos & (frame_size - 1);
 		bytes = frame_size - off;
@@ -1135,10 +1136,13 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 					}
 					goto out;
 				}
+			} else {
+				full_frame = true;
 			}
 		}
 
 		WARN_ON(!bytes);
+		want = bytes;
 		copied = 0;
 		ip = off >> PAGE_SHIFT;
 		off = offset_in_page(pos);
@@ -1165,6 +1169,23 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 			}
 		}
 
+		/*
+		 * A fully overwritten frame was not read in, so after a short
+		 * copy the rest of it holds whatever the folios contained.
+		 * Don't write that out.
+		 */
+		if (full_frame && copied < want) {
+			iov_iter_revert(from, copied);
+			for (ip = 0; ip < pages_per_frame; ip++) {
+				folio = page_folio(pages[ip]);
+				folio_clear_uptodate(folio);
+				folio_unlock(folio);
+				folio_put(folio);
+			}
+			err = -EFAULT;
+			goto out;
+		}
+
 		ni_lock(ni);
 		err = ni_write_frame(ni, pages, pages_per_frame);
 		ni_unlock(ni);

base-commit: f66469d9905b39d2c260a15d7d6db450f4db67c1
-- 
2.43.0

