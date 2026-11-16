Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864844;
	b=chgjxfSnrPEQHxZjtGzJMB4YfbwmL403n4bYNRx0QDymd3b8mqNtS0IPZ7k4YqwxzIKS
	 8gDcMHAvALWadbW32wjv+PNYO9RNkYBFQEG/v0Wwuz/j1IqivPMtxZwxdQT0oIwqWvyPW
	 e9/SrCGJy8i7Cj//d10Rr+QRIbCxnupGfubwMuT8faEsCdxG+Ntoec60ezAamLdUVjKE+
	 8yePnbFnsuy6O3LB5xRRdxCQvomjwtlinQHPPrFVLPuPgJc4NWNc+1uOMQcjb9w07Lmbj
	 w9kGzkd/9roHWUHSBt29WoHMLP1hXA/rHNxBY49HmbAM8Gpzjjo3pOn2F0D9E1Od3KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2TeVFCjy4RlKepx+4eIyD8C2zGMENsVMz5Y2Ejee59s=;
	b=YRvsN+6Uc3lEonpUe2mq1vkeqyz2xi8ZmU8VxFfGATQEGJT4rxdo9KE+psUTuXSsCFJ/
	 +pzfTzej77veKgxwTFkdko6JwHzYRJ0cksQofVF60gJ1sUws0EzbJHRLyz7fCcNHCons3
	 kItt7btXYXdTQZLP6TPd6Jb/ffdALeuY5CR4g42S4+nSMlLfAy/KSPonFM/AcilKB93ja
	 3Hzp9LCdMH2TyoawRJEZjLxHbAM0UrSIFdtKZlOePqivnaSixScek8ZihziZlR76hXvBp
	 kN4jBxLyNakf+e9GwQ92KnzLmE6u3Ta9TtWLfQHQq5oegqV/17ByMhUUPLqOmOu4C5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vd94US3e;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C83606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C83606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vd94US3e
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so24762095e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864842; x=1795469642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TeVFCjy4RlKepx+4eIyD8C2zGMENsVMz5Y2Ejee59s=;
        b=Vd94US3eq2f0xYP8rsmlw5Z3+E/j5dR6MU4kJz0845+IsLtahfobz5goL6hF/p3YF7
         UaF/yS3oaR0pJN0wmtNUTMi3P7AXxF1mwRskj9ixl3UynljULKYPp6GyjraAWMdqzB1Q
         S3lxd2IwrkNFGd/OnFCnFLSRO+ylE5lorpb7vbzrpackxLHz8R6SguBQFTeapGuYI9CN
         uv+3ANmT1LoWyIvDHLa1jtDmTJcWlIkl0eA9IQkWhABWPcTm+Clyj1TRZl892WpKn6WU
         w9+cwgvqCUEJ2rLtlAeiWBTTX3kUn6bQdV19m7FaqoUpeFkERqC0upzlB3elcZpX8e9V
         bMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864842; x=1795469642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2TeVFCjy4RlKepx+4eIyD8C2zGMENsVMz5Y2Ejee59s=;
        b=nCMT0KZnblpIjlw3hUCXVi40XfNsJE+J/yBb1i6dsp1KQfGu9RiVtyoJ7URYuDFiH1
         PJZgrNyzVukg71wZOFhKUM/WwwHfzsViZ2CgJWGZzrsR7PLEdrrX5BLCSz/jBETfcL3F
         0OLYUadzfimLjsS4cKOyK6ycc20iEjOi6LzuuCpgxLLNXTJfyI2Nbs7nkkrdnbrmL6f+
         o0fWrLM2weZGUOq4fIJy8M7sjL8T6DS5pFDZQJujOLhv1lAhPrYQ0rhiIguJkLQBlTq5
         IHS57YkGNXwJB92a2jvkH1l6fIQu6Z7K2e/tSGCA55vsSHMXKc56xdBP2nd+0xvHtbiz
         jbjQ==
X-Gm-Message-State: APuU4Z9sBLmObnlUof/teP4rQGnqTzIZhf5EqXnpqI0qcK1z1ILoNNHO
	U3JqrYadX29fBfzCh17weXk4i6/FYCz3pY21e519ZqEGKjmV5gRth4wH
X-Gm-Gg: AYBFou3BA+FZ9W1yAeuaZ0AepZd9bTS62C14vp1LPtT9RCFANMWtA2TtLY1xEoNiMTC
	2plXD8JBnw+4xtMS5MrmVXUviROqY/MCUtmEy7SDZ759Kp9Z4rSZtU5LZPeCdpdY0GLsBwqJ75t
	++QJyf18+nip7RQlD6W+oaqIX3DYyTPe54JJDTDsaWaGgd2Z/LqhwAwZpCkzrVsbD3GdHSKwCK8
	vSXbv4kgjhEV3ZZgqftRDJUsvsCvmQ+2jznH/i7LRsZylqXOaiuIhmGFotumQCxQDEPEB/oNbcw
	eBj4pYIl4ytIUCvoTNswD7f/mBAFAAQdjUvDK2+XgcCLLL5yGMlDV1YEAnIYY2USHDAloZvxMam
	oS2UQPOWTMCmmQcTTssXztnK3lwfI5bvRTAdcjDzPO3E/PY03xakgeM79dpdAiTzbuYAEK7cP/P
	EtQH0r+cGI4riiv7Mr+H7KaeTbgvLJAdTMy/1GSIqjQlSlulYkuK+Z1cZvropmyL91ap3toHyx6
	gMWjeTZYDDceXaq2HQOCfJ+pXRMbHYO6NtO8XYgCUWNlvdRdQs0/WtyIsPBqjTnniMe7PTBF9eI
	0gzBQoKxhmD9qZNw3Kkt7gCB
X-Received: by 2002:a05:600c:4e8a:b0:4bb:6f77:1e35 with SMTP id 5b1f17b1804b1-4bb6f771fe4mr103029385e9.21.1794864841835;
        Mon, 16 Nov 2026 13:34:01 -0800 (PST)
Received: from infinity ([2001:b07:5d26:7a6a:365a:60ff:fe0d:cfc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm28831315e9.3.2026.11.16.13.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:34:01 -0800 (PST)
From: koraynilay <koray.fra@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	koraynilay <koray.fra@gmail.com>
Subject: [PATCH v2] ntfs3: fix negative timestamps corrupting stat output
Date: Mon, 16 Nov 2026 22:33:45 +0100
Message-ID: <20261116213345.858408-1-koray.fra@gmail.com>
X-Mailer: git-send-email 2.56.0
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

When reading a timestamp before epoch with sub-second precision, ntfs3
converts it from on-disk NT format to Unix format without normalizing
it, leading to the nanoseconds field being used as a negative number.
This leads to a garbled stat command output and violates a struct
timespec64 invariant, as documented in the set_normalized_timespec64()
kernel-doc:
[...]
 * Note: The tv_nsec part is always in the range of 0 <= tv_nsec < NSEC_PER_SEC.
 * For negative values only the tv_sec field is negative !
 */

Reproducer, with /dev/loop0 formatted as NTFS and mounted at /mnt:

  mount -t ntfs3 /dev/loop0 /mnt
  touch -d "1969-07-20 20:17:40.123456789" /mnt/test.txt
  stat -c %y /mnt/test.txt
  # remount to evict caches
  umount /mnt
  mount -t ntfs3 /dev/loop0 /mnt
  stat -c %y /mnt/test.txt

which prints (stat output is garbled because of negative value):

  1969-07-20 20:17:40.123456700 +0000 (from cache)
  1969-07-20 20:17:41.()*+,--00 +0000 (from disk, after remount)

Fix this by using set_normalized_timespec64() in nt2kernel().

Fixes: 518013860432 ("fs/ntfs3: Support timestamps prior to epoch")
Cc: stable@vger.kernel.org
Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
Signed-off-by: koraynilay <koray.fra@gmail.com>
---
v2 changes:
- fix uninitialized warning and resulting bug, because I had forgotten
  to test building it and didn't read with enough attention :(

Small bug found by sashiko[1] while implementing ptime[2].

Thanks.

[1]: https://sashiko.dev/#/message/20261115180343.576773-4-koray.fra%40gmail.com
[2]: https://lore.kernel.org/all/20261115180343.576773-1-koray.fra@gmail.com/T/#u
 fs/ntfs3/ntfs_fs.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index f400cf94d05b..9c77a90566ba 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -1083,8 +1083,9 @@ static inline void nt2kernel(const __le64 tm, struct timespec64 *ts)
 	/* use signed 64 bit to support timestamps prior to epoch. xfstest 258. */
 	s64 t = le64_to_cpu(tm) - _100ns2seconds * SecondsToStartOf1970;
 
-	ts->tv_sec = div_s64_rem(t, _100ns2seconds, &t32);
-	ts->tv_nsec = t32 * 100;
+	s64 sec = div_s64_rem(t, _100ns2seconds, &t32);
+	s64 nsec = t32 * 100;
+	set_normalized_timespec64(ts, sec, nsec);
 }
 
 static inline struct ntfs_sb_info *ntfs_sb(struct super_block *sb)

base-commit: 0c895b1f6ab37a7c72a437818f307ef6e629051c
-- 
2.56.0

