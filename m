Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDA53ECFE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078661; cv=none; b=mzmkzsdAScgiB/oraCAWcYL7iY97/JkM3MyrmVloju2ilR5Ieafijg8RABoyon01IPuxNzzv+pg17LER/2gk4RZHfcAy/1gwvQWN+CnG3m/KnJU4GmIQ0NPToOjlCh6/JmcHl6NwO/lPCegeHttFdvFqpXj+vLMHNIGFj5OTsdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078661; c=relaxed/simple;
	bh=QCsvfQrSkWjLowRc3y9Ttb88/geE361R+uvwZVVvJYI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFterJu1KyOuCf395t3M9DAw42usTFcqT07LMslLdgfBaduu0oz45hBR7R90g5sWZpbDMek9UgXbYR6Wot9a+xxTt1EFsdkqaUeeLHbb/YOMCr4HhognUsGJm5BlT3jnfmY5QEqsgQEKL3QwhRIGsCtVtgvXt1UkcIMKYvyVX7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQ9Ekith; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQ9Ekith"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6baf77afso1872635e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790078658; x=1790683458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=++m38Aaq2XMveWLm1TyY2Eu7VcfzPn1RmXlweEV+1QE=;
        b=sQ9EkithlsxOQ1DJX6CSV9NKzA+NmY4GuO/b3ZNvWh9Rj6ebgx6VzOAKwUNhkJFAgZ
         tPggGBNnrM+sTqerHgKzu24ghFBlwLDZNTjX1U9ZgpWF9nU7TE/tDEHKk2L5UT5eNa2X
         /Eeemw+buc71BiEMLKy1YS/MsEhwiTIuBGbUx14lR1AzN6hjkAbaolXWvKomgNwVDe8i
         PP7JzhxthC+j3ZjaNvKyYqT8KpZQ3bQaKVYH+9uou/p8Neneu49aQhbabYkl91a/CKrt
         eHw8y8mmQFmGg66QUsxlF5c5ZftSCy7z2AEaESu/JaxEgvFEonMi2Js5foxWQHLmVmqT
         Oqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078658; x=1790683458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=++m38Aaq2XMveWLm1TyY2Eu7VcfzPn1RmXlweEV+1QE=;
        b=fRwaTcQDQ2nfkUGvBgSlMaO51+hkBCFvNzX2VnAEWXQCjbt2Dku5XnaoMofHbHiojV
         +m7Vo89axQqFlie75ZR8Sh1ufmUDhTFUagEuWzZUPFqRLx25WEIwh2SeP371PV4vw6mw
         Sxf5/Rex1tgbJX9LnAV2SWZX76dTfmETQSFI7uRFX0CSosvoetOfjB//f00o5eTcWjnD
         /Tki+Rfz2+WQdGrp2TeHIlnufMGrhzq3Jq6lpYAg0Jb+SrXVf6Ayip0Lq7eJoMqFEOhx
         INn7jMJFIdixsIC0Kqe1haN2g4OnbdbCrtrXXPphOOVTVuRnURMThOBJ+btgORbeUzTJ
         UVjA==
X-Forwarded-Encrypted: i=1; AKwUvBx5XKjikgBXmai5plevkynqq5YKICwWebFggKfNvw3M9ZFO9Ouq+5K5qHMPdhl4cuuxxppqtEZKzcHuj+s=@vger.kernel.org
X-Gm-Message-State: AFuF++kuLjAwp+ek684CFe06vU4nLoUnxngWovN5Gl7qhbKxdfBdB67z
	KVlUOuXqzJfy969vRqcEFedpJd//CbI0925B8dmimwztwvTrL3lQje0f
X-Gm-Gg: AYBFou0isJ7C5fj2iv1mc/pq9NbMTXH9K6d/E/uFRb4ECK22nzIyYbNwjyNKsu65pG/
	IgHVjM/Vp10IEilJe4qTzxcuPJUCBJk1B41p48zZG9LVxafE8mctWsQ7NvsPHlfLZW6z68+ZO/3
	KALpXhyh0npulKVPnFnyZMjakEvJLedrzRlAWfb6cmnJ43+vDvwwcPkX7mgnK6cm7wRQKVNKogQ
	M8cgpCK/invD20UU3eOFdrotVmZnljz7U75yP3mvD9X4gtK2giNIpZi5sG2XHgsXgnn8JWGS4DO
	bOeETiBJWqIyGPaW765MrRGz2qkmU9DxxOyn7mQUPDETQNOm0GYykkc3gJEYOIt/V/3+0c1IpUD
	unQjMlnHECqf+h2C453Xyh6KDLqnpc7ZrOaeU5rqj87sw49Gd0mrcvP2GfKP7JoX+wpL+k2zNMT
	4ayEIn9hkulDe5p+W0VmTgKT+5DeEaczB5Z+E6pvdvpl4373+McexvdmqDAQglOAsJR7tU85u3L
	2VrXw4ceBT/eFKnljU=
X-Received: by 2002:a05:600c:1c13:b0:49e:7186:f36e with SMTP id 5b1f17b1804b1-49fc7dc1e75mr220807915e9.1.1790078657621;
        Tue, 22 Sep 2026 05:04:17 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdab0c240sm32469425e9.4.2026.09.22.05.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:04:17 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Milan Broz <gmazyland@gmail.com>
Subject: [PATCH v2 1/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
Date: Tue, 22 Sep 2026 15:03:30 +0300
Message-Id: <20260922120330.127262-2-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922120330.127262-1-itai.handler@gmail.com>
References: <20260922120330.127262-1-itai.handler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "sector_size:<bytes>" option is capped at 4096 bytes, the smallest
PAGE_SIZE of any supported architecture.  A kernel with a larger
PAGE_SIZE can use a larger encryption unit, which turns several crypto
requests per page into a single one.

That only pays off when a request carries a large fixed cost, which is
the case for drivers that offload to hardware over DMA: setting the
transfer up dominates, so doing it once per 64 KiB instead of sixteen
times is worth a lot.  On an arm64 64K-page system driving the in-tree
qce driver, dm-crypt throughput rose from 13-27 MB/s to about 580 MB/s
when the encryption sector size was raised from 4096 to 65536.  A CPU
cipher has no such fixed cost and gains little: 9-16% measured with
xts-aes-ce on NVMe.

Raise the cap to min(PAGE_SIZE, BLK_MAX_BLOCK_SIZE).  dm-verity already
bounds its data block size the same way, rejecting "num > PAGE_SIZE" in
verity_ctr(), so this is the bound dm targets already use rather than a
new kind of limit.

PAGE_SIZE is the ceiling of the current conversion path: a sector is
passed to the crypto API as a single scatterlist entry, bio_iter_iovec()
never returns more than PAGE_SIZE bytes, and crypt_alloc_buffer() may
fall back to order-0 pages for the write bounce buffer.

BLK_MAX_BLOCK_SIZE is the block layer's own cap on the logical block
size that crypt_io_hints() announces.  It does not lower the limit
today - it is 64K only when transparent hugepages are enabled, and no
architecture that can enable them has a PAGE_SIZE above 64K, while
without them it is PAGE_SIZE - so the effective bound is PAGE_SIZE.  It
is in the expression so that this target cannot announce a block size
blk_validate_limits() would reject should that ever change.

Widen sector_size to unsigned int so that it can hold 65536.  That also
makes the option reject values that %hu silently truncated: an argument
of 69632 currently wraps to 4096 and is accepted as a 4096-byte sector.

Apart from that, every table accepted before is still accepted.  The
larger sizes are opt-in - the default stays 512 bytes - and nothing
changes at all where PAGE_SIZE is 4096.  A mapping above 4096 bytes can
only be activated where PAGE_SIZE allows, so it is not suitable for
portable on-disk formats such as LUKS.  Bump the target version so that
userspace can detect the new limit.

Assisted-by: LLM
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
 .../admin-guide/device-mapper/dm-crypt.rst    |  8 ++++-
 drivers/md/dm-crypt.c                         | 30 +++++++++++++++----
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
index 4467f6d..250da7e 100644
--- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
+++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
@@ -153,9 +153,15 @@ integrity_key_size:<bytes>
 
 sector_size:<bytes>
     Use <bytes> as the encryption unit instead of 512 bytes sectors.
-    This option can be in range 512 - 4096 bytes and must be power of two.
+    This option can be in range 512 - PAGE_SIZE bytes, with an upper bound
+    of 65536, and must be power of two.
     Virtual device will announce this size as a minimal IO and logical sector.
 
+    An encryption unit larger than 4096 bytes can only be used on a system
+    whose PAGE_SIZE is at least that large, so such a mapping is not
+    portable across architectures and is unsuitable for portable on-disk
+    formats such as LUKS.
+
 iv_large_sectors
    IV generators will use sector number counted in <sector_size> units
    instead of default 512 bytes sectors.
diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 9e170de..0f087c5 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -182,7 +182,7 @@ struct crypt_config {
 	} iv_gen_private;
 	u64 iv_offset;
 	unsigned int iv_size;
-	unsigned short sector_size;
+	unsigned int sector_size;
 	unsigned char sector_shift;
 
 	union {
@@ -241,6 +241,24 @@ struct crypt_config {
 #define MAX_TAG_SIZE	480
 #define POOL_ENTRY_SIZE	512
 
+/*
+ * Largest encryption sector size that can be requested with the
+ * "sector_size:<bytes>" option.
+ *
+ * A sector is handed to the crypto API as a single scatterlist entry, so it
+ * has to be covered by one bio_vec.  bio_iter_iovec() never returns more than
+ * PAGE_SIZE bytes, and crypt_alloc_buffer() may fall back to order-0 pages
+ * for the write bounce buffer, so PAGE_SIZE is the ceiling.
+ *
+ * crypt_io_hints() announces the sector size as the logical block size, which
+ * the block layer caps at BLK_MAX_BLOCK_SIZE.  That cap is never below
+ * PAGE_SIZE in any configuration today, so it does not lower the limit; take
+ * the minimum anyway so that this target cannot announce a block size
+ * blk_validate_limits() would reject.
+ */
+#define DM_CRYPT_MAX_SECTOR_SIZE	min_t(unsigned int, PAGE_SIZE, \
+					      BLK_MAX_BLOCK_SIZE)
+
 static DEFINE_SPINLOCK(dm_crypt_clients_lock);
 static unsigned int dm_crypt_clients_n;
 static volatile unsigned long dm_crypt_pages_per_client;
@@ -3134,9 +3152,9 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
 			}
 			cc->key_mac_size = val;
 			set_bit(CRYPT_KEY_MAC_SIZE_SET, &cc->cipher_flags);
-		} else if (sscanf(opt_string, "sector_size:%hu%c", &cc->sector_size, &dummy) == 1) {
+		} else if (sscanf(opt_string, "sector_size:%u%c", &cc->sector_size, &dummy) == 1) {
 			if (cc->sector_size < (1 << SECTOR_SHIFT) ||
-			    cc->sector_size > 4096 ||
+			    cc->sector_size > DM_CRYPT_MAX_SECTOR_SIZE ||
 			    (cc->sector_size & (cc->sector_size - 1))) {
 				ti->error = "Invalid feature value for sector_size";
 				return -EINVAL;
@@ -3556,7 +3574,7 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
 			if (cc->used_tag_size)
 				DMEMIT(" integrity:%u:%s", cc->used_tag_size, cc->cipher_auth);
 			if (cc->sector_size != (1 << SECTOR_SHIFT))
-				DMEMIT(" sector_size:%d", cc->sector_size);
+				DMEMIT(" sector_size:%u", cc->sector_size);
 			if (test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags))
 				DMEMIT(" iv_large_sectors");
 			if (test_bit(CRYPT_KEY_MAC_SIZE_SET, &cc->cipher_flags))
@@ -3582,7 +3600,7 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
 			DMEMIT(",integrity_tag_size=%u,cipher_auth=%s",
 			       cc->used_tag_size, cc->cipher_auth);
 		if (cc->sector_size != (1 << SECTOR_SHIFT))
-			DMEMIT(",sector_size=%d", cc->sector_size);
+			DMEMIT(",sector_size=%u", cc->sector_size);
 		if (cc->cipher_string)
 			DMEMIT(",cipher_string=%s", cc->cipher_string);
 
@@ -3700,7 +3718,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
 
 static struct target_type crypt_target = {
 	.name   = "crypt",
-	.version = {1, 29, 0},
+	.version = {1, 30, 0},
 	.module = THIS_MODULE,
 	.ctr    = crypt_ctr,
 	.dtr    = crypt_dtr,
-- 
2.34.1

