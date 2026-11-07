Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079725;
	b=xDuAroNjeZpKFJ+qR/Th1pI7ZBjrxbv1efDedGTupQFr7dknTyXUMiOKp4/O/LQ/MKps
	 TF9Qz+dDMnK4W3T05JHiWaR/xjjfssYvseOEoNoi6DHXMOHlR1Myok3CWemmkTEpWNtO8
	 4GpW2eS9AVYnPjrtqLtj8m6TNthWxHDcoVff9fWThSEEBvnwX/zZCI0vi+17hbFFl8ZTk
	 zgKIrTWYusOJ77rInAiZCOKTRkdqXQpjGagatUdLAjHIIrs38LSp2WFEHoNIKKUrtdQRN
	 oajyl3JcU0BSp9nCJAtxLV2N6FeTVThRTiw8PlEGtLAC79JFCMrEiXhhvu8b8D6tH+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w90szJpdzekfEVNOhw/amrduU9AsVHLVBfjyoWv/t+A=;
	b=CrcVPxZv0fmVoNkHUs3VY5UQGGbL2LIuAd0Ff1nSRBfZ/X8rc2U4FUo0zEmguCgFMox9
	 NbwttROnCLWgcJq4edjgm2mp+IZtYtaroEr6ZvEkiIg+bBffPcYhwQcXbzSaTdXrTQm+K
	 hXTehWDp7diN4VzPxbzL/bczDxwVY8ftRZ+A0v+bnIfIjVqpEK3X7f6L1DWqxQ+1jTJMs
	 WsXkF4QtKglk6uQkJDCShUbxdzoTP67dtaHeThoIRsXxRpOTMmklBp+7Mq1GFwJigbY79
	 Cd1b51XsKzrU4S3GPq/6tjR6jQihKLP3712FbLz4mM3/hCYak2Py3gFHo6lJfSCYVag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGr0hTsv;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FA4606A32E
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5FA4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RGr0hTsv
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso57294eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079724; x=1794684524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w90szJpdzekfEVNOhw/amrduU9AsVHLVBfjyoWv/t+A=;
        b=RGr0hTsvyDG9kcYi8oObA5cl5JlsF0oZFUgGMVMyW8SLmtQ+h3JpPrwQSS6D++cvR9
         gxcXj7JBZbHOaEGrZR85aG5xKyZH645cimD0jAa53sNhV7jREcwQqyuMSesdSatcYJGl
         AhdLbRTc7u8WhkGQVklb8nnBxcyYt4ARztUYWEikdVYbbYuZu4QMxVwYSeACdwo/mWjz
         6CxVV5iz6AzfZc7ilsiNQPhd4MkdP+5szujUtQ3OoC47FTWmgivZLyqreQN+oPFwSaZk
         tLBkd2vlNoYbwEGXAsHOfT1IOz6WgsnDfhmhdz/7EsskpmeqeEriFXHjU6PSwjiYBabF
         BKYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079724; x=1794684524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w90szJpdzekfEVNOhw/amrduU9AsVHLVBfjyoWv/t+A=;
        b=ESNPW3ZfB4UAQ0oU2s54BWuS4CTWVF/Dx0ybOioi87gCghwC4aaImEE+f5X/d98aTR
         s5rcJK2ciayQiPUlavIL1200CNfJUIrhYIkEY2F/Zv6+Okxq1IzHkZZ0jyZjYXISpmWW
         GoSm+Vzduj/PvnSWB+Fh3YsUjeTxziuFbptwd6uFp5E/cvTRChpKsGqvzdRQj26l7iSs
         A1ClHe7UZcvm9sgJDpg8Dn4hd7ChuphWIJQtGhQo/SfmOm/cXX64u32Ogn71jjWi8UJI
         9/BmaaGjXTPXYuBWpdSK0P3QKbzMsiHiW9CFXIhruqAEtE49qYIrIWkzGVaRudYO7d7M
         BZ9w==
X-Forwarded-Encrypted: i=1; AL+hErE2RNJD8k2Tl5MZpGAh7VV/4cT5LirWiu81yNs1m4f2GV1sJAYg9Qh4WMIxai1B2/ob09emrxYlB8kcBfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NWEqMR3WYz5OoS2Jgii73bdn/44IIro8axKpiO8kLLwLp6iGw
	oc+38XrKuwMlS7q8pE6Ix00X9ilv7htXxdwg2jZhyNYVFBQJ5ITub25u
X-Gm-Gg: AYBFou0odc+8QkzOEHdgx4D0/bxSpagR9wqYygp/tEVNXfW1TD8wasU8B4Y6rr5QBvO
	pJ3YFHRkDcTxae6miQKVAM7QXWeioR+ul3jzkAiKbTWmkYOqYj1/4A/KIvLRRhJSIcEi6KYSENu
	O17vOzh+7N4vCYztqzwaR9FTp2EtbDZAq3G0feeJGqyn5OQiP9Opb6EHHblxNdPFn1IQw9lqAUb
	s+vUzjOHJQ8NLmu4ikaULJQ6B+xaceKWxnYdZbSHv+651rwy7JQsiU4WnIObO3Jx/YmM3oviqId
	Pbl2Y+LsIsg1fZA+XCrodfBU3vtn4mtd96Yr2354us0UFzVhI0rp4FJsfHIAHnF5VHRdh62XbNC
	q+OoQ/Z3dMUVFX3vWNQwByAL+pjY+fJdwRrjaBjcSnyOTCpYM/TLeofc/Thl1sjbuSmJ3dtiay8
	0r3TNDuspnFLpSHI0cELYqWcbGCTDuXtBIXe8IDizPs3o4AV0z2rxvwiO8hEkrr6f/JjzNJMdZV
	6k8tzK6aUQF6xQJjDCTSeAXGlq+Naph6A2FUp9rIKOcanHb1KtG6nrbNrBQrf4hm8jZPn2eGIT7
	zHnobC2UhhEaEnvzTOauGrEpZnryah6qUSBSmTPNwGw2WNrM43DCM+suF7jTosdGgqDYWUIImuH
	np68PcIgqdaM=
X-Received: by 2002:a05:7300:f498:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-3724ff5b718mr132577eec.0.1794079723626;
        Sat, 07 Nov 2026 11:28:43 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fc92fasm23026419eec.19.2026.11.07.11.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 11:28:43 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] ntfs: open a named $DATA stream by name when making room in a record
Date: Sun,  8 Nov 2026 00:58:36 +0530
Message-ID: <20261107192836.3908453-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
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

When an attribute has to grow and the mft record is full,
ntfs_resident_attr_resize() walks the other resident attributes and
converts them to non-resident ones. For $DATA it always opens the
unnamed data inode of the base inode, even if the attribute found is a
named stream:

  tvi = ntfs_iget(sb, base_ni->mft_no);
  ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);

value_len is the length of the stream, so it does not match the
attribute that ntfs_attr_make_non_resident() looks up for the unnamed
inode, and the WARN_ON() on entry fires:

  WARNING: fs/ntfs/attrib.c:2115 at ntfs_attr_make_non_resident
   ntfs_resident_attr_resize
   ntfs_attr_expand_locked
   ntfs_expand_for_write
   ntfs_file_write_iter
   vfs_write

With debug output the values were attr_size 13 (unnamed $DATA) and
data_size 550 (named stream) for the same mft record.

It does not need a damaged volume. A file with an alternate data stream
whose record has no room left is enough. The fuzzer found it through a
single changed byte in a file name of an image from mkntfs, which made
a write grow a resident attribute in such a record.

Use ntfs_attr_iget() with the name of the attribute for a named $DATA
stream, as is already done for the other attribute types in this loop,
and keep ntfs_iget() for the unnamed one.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
v3: open a named $DATA stream with ntfs_attr_iget(), as suggested, instead
    of skipping it (v2). Same change as v1 of this patch.

 fs/ntfs/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ce7c1b524180..c92d1b06afc3 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4933,7 +4933,7 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		if (a->type == AT_DATA && !value_len)
 			continue;
 
-		if (a->type == AT_DATA)
+		if (a->type == AT_DATA && !a->name_length)
 			tvi = ntfs_iget(sb, base_ni->mft_no);
 		else
 			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type,
-- 
2.56.0

