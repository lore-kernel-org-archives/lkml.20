Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794674832;
	b=UJ7tbgPdbdn2daqSyK7M2bvoJJRcidIZsQ/gYlDce3aAej+b/6D+6qHe0ttmjs8/oLhW
	 /biUoF6t8dHLUWgV4WXAMPzBr4dczsLSnRMzw8f9QHAWaeFnkQTqPeEagFNH2/TpOaNt+
	 5v9KCO38EwqtKFT2eohqi4gtpHPJI0d81fpfreMJjk+yNZjr+MP8LiK3VEg19OD16Le5y
	 O4orvVdczsRebMoxqpZ0Z02x3LMV06wRNzm/dzYVU8oW4NK0KfMkMqANhTm/INGSH/lUS
	 5vGYg8/tp6g0Lo23JFFS1++GR3thqPuT+hep61Lxr2hx6yjtP/BLzJN/yQ9EwMLl2jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=LZpf/adSy9ocw600/0V3SwHUEucAcfipA+77w71wXy8=;
	b=Hfb0uhP4EVUxNoaT+AVE/bY1kAvD5V4tdUWMmtKgPXGYX6Ob5ufixSGtptb2t/1VJqeC
	 aZn9HYZvQ0CcWrSqRz+F1ESUmfXHU5zG96qZtv3E9zyY+oCOcb2+keZsq45QVKy/c9eol
	 uikl1X9HkYcxKdYQ4KB765QZE5SrYBIhh2YPBqG37UhV5VqF2s4UDj9YaXou6vKsJW4t9
	 Xc3PfXV0RvJyHt10lcHrGCWxofeaGe7ZMyhUsJ5iMvU6W+DLzNudKo1wy8Q/X6fejTNv5
	 tROfiuDnh8AwKW4oU3B28llr2K5pOccYCxkQipHjvsfNDukvyWO9OFUrsf7a9bjg0Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=LL8G6jJw;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E37606A33B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E37606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=LL8G6jJw
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jRg5V300hz8XrrX;
	Sun, 15 Nov 2026 00:47:10 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794674830;
	bh=9sHLtCdxrf347MxSpppWO9QY//hLaaMU4oq/GvKgpMk=;
	h=Date:From:To:Cc:Subject;
	b=LL8G6jJwlh1wVfxwOfVZYifI5M7QhkZkO2rQGwiwnN3j+IinmNFXyTjMbpStmfr1e
	 0HJDNIn4CZ4BWpvcIMunyYjBLW0HF+2BDmKyDTy1AOYdgI2jsyuU6nT27nS9lYnqAU
	 wX0rqs0gLbp9uu8abFyBBpeAjOk5oFhfipBmk4iATt7EZWctMXsHWsRk8CoT8h/2DW
	 Zr0GxCm/z7f+kuKrnzX7b+0I1dslR7LaIB4W6HKAogb6tQ/7PwCkNUbGsXqrNhq/VV
	 0vfGLZkiQuJtRM8EPsb917/UPZmlLhBjkBN60JRLUi4y2TxrkoRv5i1UQeeTibJf84
	 04n5r8zVtYlUw==
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6AEGkw4D089601;
	Sun, 15 Nov 2026 00:46:58 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Sun, 15 Nov 2026 00:47:02 +0800 (CST)
X-Zmail-TransId: 2afa6af89086dfe-30dce
X-Mailer: Zmail v1.0
Message-ID: <20261115004702358r2RJLihSrqbK4dr026bcI@zte.com.cn>
Date: Sun, 15 Nov 2026 00:47:02 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <catalin.marinas@arm.com>, <akpm@linux-foundation.org>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBtbS9rbWVtbGVhazogZml4IHNjYW4gcGVyaW9kIHRydW5jYXRpb24gb24gMzItYml0IHBsYXRmb3Jtcw==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AEGkw4D089601
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 15 Nov 2026 00:47:10 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF8908E.001/4jRg5V300hz8XrrX

From: Shao Mingyin <shao.mingyin@zte.com.cn>

mm/kmemleak: fix scan period truncation on 32-bit platforms

kmemleak_write() converts the scan period from seconds to milliseconds
before clamping it to UINT_MAX. On 32-bit kernels, unsigned secs and
MSEC_PER_SEC (1000L) are multiplied in a 32-bit unsigned type. The result
wraps before the clamp can detect overflow.

For example, scan=4294968 produces 704 milliseconds instead of the
UINT_MAX millisecond limit. Perform the multiplication and keep the
intermediate result in unsigned long long, preserving the existing
64-bit behavior and the later msecs_to_jiffies() clamping.

Commit 54dd200c5a25 ("mm/kmemleak: fix possible wrong memory scanning
period") added this clamp, but it cannot work after a 32-bit multiply
has already overflowed.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Build-tested mm/kmemleak.o with W=1 on x86_64 and i386. A freestanding
i386 program checked six inputs, including scan=4294968: the old
arithmetic yields 704 ms and the new arithmetic clamps to UINT_MAX.
This is an arithmetic test, not a kmemleak scanner runtime measurement.


 mm/kmemleak.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 1bca27787df6256d89b54fc3381ca5abb49ac7a6..87274591257f6655655ba5bdd0381f3a38c9404e 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -2455,13 +2455,13 @@ static ssize_t kmemleak_write(struct file *file, const char __user *user_buf,
 		stop_scan_thread();
 	else if (strncmp(buf, "scan=", 5) == 0) {
 		unsigned secs;
-		unsigned long msecs;
+		unsigned long long msecs;
 
 		ret = kstrtouint(buf + 5, 0, &secs);
 		if (ret < 0)
 			goto out;
 
-		msecs = secs * MSEC_PER_SEC;
+		msecs = (unsigned long long)secs * MSEC_PER_SEC;
 		if (msecs > UINT_MAX)
 			msecs = UINT_MAX;
 

base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
-- 
2.43.0
