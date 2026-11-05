Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883725;
	b=PIHFRtBaYxF7QPRTDnKWJlQmfb30Apd79Hs+0CVKLNGAjmHfbz2acLFu+bP1aAK9pEdf
	 z9IDx5lPK9XQO3+XbzS80u+o3AzWxPi9pifXKK5RrhhyUoR179d6m0pUnkylhlxl83zcX
	 SX0dcvsVrkfhtHzNgd7xR7FGvTq1rWPgntObPyhRE5kHrsSwbwUUIhzvG0Br1QYejYwc9
	 2Ka/F021jTM4dAFq8qHcodIProkqtVE5jwajvy3ueB3qBG2W9I6c3HbJIyeCwNp6JXYJH
	 hPdduO03jW97BMyXQsdJk0qTgQLxSOk098xmU61F7mhgX/xEM6mcNkWke9LLd6mkCuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zaZo2IN21mSc8I602pjnEtUM9ME8C1zumOrQwc4EBXg=;
	b=snayms0s82Nk/LaKc+pahfIJMqBhSNvZpj/1EA7eDL5qMMRN5vKCWL06Oj3yan4B/07V
	 xIxkeU6PcvjSVpSX/JENPYqggNOycuWozSk13/ZGOLqm+hCgcMryw2qVFuD2gXnDtmH3g
	 V7QaOoDHEd5mSbVVQBSZDxw4nWiRnDQj/2T+SZAo20BsONmPa8aYtnQwrHMvTTHr9M5Uw
	 Xokkb7495PJzFnssn8kaPkWz7xGvA1D8IoQkkwmEg+2HU7HnKQfSHNNcfqkJWNdKnQNjN
	 X7zOkE5HcHQJITG3lwtNEKUZm7V7jzYQa7JuooXqz967RgM9NJgYLRu0rfflLFsXCCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+tYImds;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65F7606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B65F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m+tYImds
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so657451c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793883724; x=1794488524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaZo2IN21mSc8I602pjnEtUM9ME8C1zumOrQwc4EBXg=;
        b=m+tYImdsezX20kVdwFNj0aEjTmSNl3p15jSLQYzYGLiYSGLmHOjVJ3QFR1/qtErwd1
         KZmx4nZTMvd2i384pcUvltSn7sMhP8OIoGbpw7SnAHeFOeCbcUuM68pF8gGjmN4psxZA
         bXfwga3YaiWayJWyA6OhZfyikHzg6XLlH1vYNEwNYSDDe8+mUDkiQTZL/UbyireZT+mj
         6k4toHQBztg21XSEEe9SeGKDIM7avmm4pHlPci7wLTUYOc54FKt+F9HepRfhjEBYIUTu
         XdqBKVBN2U+wfvAkukw/rjSy0PBRKWGPqInTvtyTIsvSfLondcHCDd/xXUNWpfHJCdEQ
         LNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883724; x=1794488524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaZo2IN21mSc8I602pjnEtUM9ME8C1zumOrQwc4EBXg=;
        b=vY1VhIPr32o5/YO8TUNx92w1qtQ97MU1Rh2LrLCStgN7lzM9PAye/3VmHL6EZkOQUZ
         4SNa2gT+lzf70GhsIXqn5Au/P7ivLJXPPQOP/fCFJz+ywpk5GQEF0x5Lpa8OtgdxcJ+s
         KNFRRplTAi8EmU48zMzE4agg+B7fAyVyedSbOynIKUEQmFGB14ufZ6F+ejMR+din6g5g
         H/wjaEMwTDvDq3DL+gV0nvth/cr1OUC6RF49HByW33Bb2Txm28+AvgTD97eol07dNxWt
         Vzlbtww+arA4Ied/W2tarIgLe+s9igcdbrU5HjajXKEofpkNscBUKVQKW68wfBvRKXTi
         UG7Q==
X-Forwarded-Encrypted: i=1; AKwUvByixt0+qVNDhK/pjgRAp3vRpJg0F4sdgx/S/8x8TNCacx/XIa8B628de6wGit1935JPp9MW8FAUf0qjDyk=@vger.kernel.org
X-Gm-Message-State: APuU4Z95V/Z4kJ3ZGGcgwOslLimtGP0l7O19/DIOfDtZL23Rjil+P6tr
	RS1F6Rj52CQxTgKrfBIlRe96URrVkmEajYeuyleS+uJOgy7n420o5OC5
X-Gm-Gg: AYBFou1BywBzXr9gTwOlfPQxj+1l8V56CvR22o/E5OKyGDletvnc5qedXg8W4XCVjDR
	bHYiGdcKPjx9lijc6Ef75aurFsCO7GSaQnpBWTNQ7FGOA7bsX/0FIiOzjGzd8joBXgO807Ihw5I
	WVNoZip6Md6OthEbRNjHRc3HgSAJu8aPsW3Md/6n1LaHREsozvpqQtWzYW+sWyP1Sj5O9UDsLz2
	Ek1UnBvRaUoqnfh56WX7vW0B9JM/0OgW8KA+hCiuDNpop87OA1PVyLm8XFqFa6ZRizsnTk4R9Ho
	MAPPASaTKspN26kRJWD9QstIaLgkM3T543TTzrKuPeJSxw2dyqBeiGMOnN2Ph4N92nDw4M1EPbW
	Yx+4G2y4QPzNEREhXJMgtzW9Cg8JklX4jNVqh8IemMEqsW6d6TVg5Hn1fijN3o/qVPInAtQv3d/
	7GETAtnb+ThdsAB4hRL1MM5Bh5TuTDSUyFUoXlIgYWqWl1lqejQgnn6cIRbk4EdhSkIoR7or0Ck
	LWq4OkQECsQNb8sY3Sn8HleT+nx+pQ+EeOd1d8/ZZWiRYz1xzUl5tknEFZYmXUMEo2ffhOkcmlU
	vTTfKpGF9nsyS41YP5uD8V1squoZegE7vQD1Z/fYAni5zw==
X-Received: by 2002:a05:701b:4512:10b0:181:73fc:e53 with SMTP id a92af1059eb24-1ac5b7e21fdmr29165905c88.29.1793883723317;
        Thu, 05 Nov 2026 05:02:03 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c6f0dcsm22945048c88.21.2026.11.05.05.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:02:02 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ntfs: don't write a compression block after a short copy
Date: Thu,  5 Nov 2026 21:01:58 +0800
Message-ID: <f385711f8772132f64462e1d6c13efadadc51bc2.1793874221.git.zhanxusheng@xiaomi.com>
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

ntfs_compress_write() does not read in the folios of a compression
block that the write covers completely. If the copy from user space
then comes up short, the rest of those folios still holds whatever
the memory held before; ntfs_write_cb() compresses that to disk and
the folios are marked uptodate.

The copy can come up short after fault_in_iov_iter_readable() has
succeeded if the source buffer is unmapped in between. On a volume
with 4K clusters, writing 64K at offset 0 of a compressed file while
another thread unmaps and remaps the last page of the buffer leaves
61440 new bytes followed by 4096 bytes of another process's freed
memory in the file. The write returns -EFAULT.

Treat a short copy into a full block like a copy that made no
progress.

Fixes: 5b676a77f3e4 ("ntfs: skip reads for full compression unit overwrites")
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested in QEMU on ntfs-next with KASAN, 4K clusters, page cache
dropped and freed memory filled with 'Z' before each write:

  before: 16 of 41 writes failed, 3 of them changed the file, each
          time bytes 61440-65535 read back as 0x5a
  after:  286 of 731 writes failed, none changed the file

The same loop on rootfs gives short writes and no corruption. I can
send the reproducer if it helps.

 fs/ntfs/compress.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 82c7c7d29073..287bd47282d9 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -1567,6 +1567,16 @@ int ntfs_compress_write(struct ntfs_inode *ni, loff_t pos, size_t count,
 			}
 		}
 
+		/*
+		 * The folios of a full compression block are not read in, so
+		 * after a short copy the rest of the block holds whatever the
+		 * folios contained.  Don't write that out.
+		 */
+		if (full_cb && copied < cb_size) {
+			iov_iter_revert(from, copied);
+			copied = 0;
+		}
+
 		if (!copied) {
 			err = -EFAULT;
 			goto release_pages;

base-commit: 564c7753647731d19170914c1c637d3b33d88d3b
-- 
2.43.0

