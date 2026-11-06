Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964486;
	b=1E0sQ2BpFHWV8BwVKmB9nxOMECFlwtfmXxGjaui7P7Uakuf5TDwd+9WlrYzGp6jzjNIi
	 9Rg+S7uPiYxyxzENe2GK1Zxy4oyBU+NCocRojsu526ODT/Kv0dePgLRSmxbl5M+X9liRZ
	 A/+Hr9te+RufBOw8nZmKyKUry6qbamMa6vn2I+CFmZ2y3bv5IvDeTe6JRmBejd6qX8V3B
	 Gd+8syHya0F+CUacT5lm9WKgLTL909xaIg6IS0LQsmgoVdAFhf2ia+OOEGOg4PX657IuE
	 w0w7rfVEquapV6DeWnyrysAh46z3ywTgRcVtv6Mlp78xDx/EAOLB2SVqwQdMNXf5KWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r0oGiXSXqPWt2ut4NcPnn3BOhuEor59O/W/UHXN5XZI=;
	b=Ef4acYuTY0i0rgeOSIcJ+lER9xjEy1/lVNvYY9sWYtl5xqTDC/HCL8IkbYJbsQLXE/l1
	 Kl0LVe2qOQALvw9hqP6tltZcY98AHm64ABNp+JsNae75ZO63BoTg8nzMLwYx9/LpTNUKr
	 1Pldf8PFqnaJezRmEF0znuoyzqkmGMt4Lx1ZJk+Fel5DvWj6doaGQgzztojkRs5iWnxds
	 YzSmZxTSK1NDn3P10oDJRbdYNwApCoxXPQ8cv0fUT/lL5LfBLyD5KuLIMJPG7FtO4D7rP
	 VIPZCxcOS1ni/SikguHu/j0jom57M/M4ZaeQx8im/ZDDyIfPh8ImUnF6kakwOhjqNWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYrmpEaU;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06977606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06977606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYrmpEaU
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso19138eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964485; x=1794569285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r0oGiXSXqPWt2ut4NcPnn3BOhuEor59O/W/UHXN5XZI=;
        b=yYrmpEaUTpqnUwnwHY2dg/7LWr5quEGHTcAHtu+t0+dKBO2ED3lkqX2Ji5fGVogG2H
         02utr/jvturPRR4egvfNpGfo+0wHmSxRbihnbQsE6CWlvs3m+MqRJEEL891fqFjDsEjP
         rs9H/PG+8DCmcrE6rS6G1DdmzlNsFnD81vt4A+zAXeGL6JklYk4BewC4h7u+RaBArwvL
         wc8Timc7qPxRzZ9v35ZRW6aulnwMuf9XyC0nsG4KtSTPs+dT/zScMH5iADKMEMZYceL9
         ee6jB/ZX62j/NErthqK5j2Ni8WBpWq363LNWSJmZTeaWwf74v4Ow1x1JuiVTBAqgNWn8
         8Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964485; x=1794569285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r0oGiXSXqPWt2ut4NcPnn3BOhuEor59O/W/UHXN5XZI=;
        b=sXqjnP+2XimMNhKWMkyaEJUc++NKLC5q4hqLNjybO9G/ZZTSGub0qtYefGEGZr9W3i
         5fW0IAYWQyWQ0D2VvkFXM1ILK5BdlKOFqaTno/a3MVXB7yLhTD5ExucI0MgarRjrEmBV
         CQ+7+ePGIjabX2uY8d9TMrPMIPoxfuPRQQfs5xr/1kxC08L7DcQfDyk4z0waA6zmzCRV
         lLtDcoXLTa6/54PCBf3i9+ZulN5Io63xNzubkK+P6n7QgNwtVZYMmoBpKG8nqYfEBt7H
         IHsr3wMCi2a3150CzCiocNlsldgV4UzX6qNqdXgj3rNMjqp5A+BGgZvjJI+ASW4smUFS
         Gqqw==
X-Forwarded-Encrypted: i=1; AL+hErHmdQWJHjDJ5T/w65+NpQUG3Lnttx9FDkJnsRuIEAT6wucuV3QvpidpTVkXDYoySyqhYnCaXKh7TgWOlrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P+xrbZjQ/F8GYDFz238WYVUcLeMu6KMokes4Eu1LPD2og385u
	fzTA2f7wVhh6sF3i0xhWFYFzYIsirZPz1qPQxGCnEAJFVnkfl8T2XHFH
X-Gm-Gg: AYBFou2W6vypdnWWChrtQbtUBBXTP/STwUtrlJseUkG9pFM97Q6SmS/3IgIwpYQ5B1b
	w2l1bEXlDNixCHknOJc/EYAdiRRgMPf25Q4oEmS3Q9x894wBG8RqNLOV6v2tfXxtA5nwNS+NuzX
	ikaAPwmZE8Bm+xX8Bw1fhfpE+Y/5RjXr6chmoarNFX9JEb29cciQMBci453RBE5lVeWfUwwonHD
	dcBFr9yxMV2XPoIIzO1Ph0T9H6Horqyw7g6AOJN6dd9yq2ja/+hCOrGED09QCKokA4JPwuCDRB1
	XCXPf1FmkxcB7MtgGNpC1wcUYu2enkiSmevnX30NBlSZGadYgoX7mHie0p3SgARG5k3UIbjZ1sM
	AjJ9FWuuddTmIC4oj+h+2POBYBv/X+b/7Uy5RWM0Y+DIGGCYNPjqfqcmxl5ogLG+k6SOpfpYfgE
	D+I7L9BPoeOgV7tA+U3vCjC9ezLNPyAsm6B7+7M9QXwTpvOuAuuBiDcUZ/5csNIRwajqck80eRc
	2u3m07qZfzfuK3aEcdPRDQK4gKvSZRkyuYfD6BjHLN6B6Uv744jcMz39bilKLqhFEo+5oResSix
	OZi5mqV8tvxTouFs8e9rGPDMPJ3AsKTf5J4D/wZZTs4ZUhqI6qAMfQauSV2oh+Q+MA==
X-Received: by 2002:a05:7301:4d08:b0:36c:a154:db1d with SMTP id 5a478bee46e88-36f722eabcbmr2881866eec.4.1793964484814;
        Fri, 06 Nov 2026 03:28:04 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa4b8aacsm6029179eec.23.2026.11.06.03.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:28:04 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ntfs: check the file name against the key length of an index entry
Date: Fri,  6 Nov 2026 16:57:52 +0530
Message-ID: <20261106112752.2552832-1-wahidzk0091@gmail.com>
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

ntfs_index_entry_inconsistent() checks that the file name of a
$FILE_NAME key fits in the index entry. It does not check that the name
fits in the key, which is what key_length describes. Code that works on
the key alone relies on that.

ntfs_readdir() copies key_length bytes of the key of the next entry to
resume the enumeration, and later uses the copy to search the index. If
file_name_length is larger than the key holds, the name comparison reads
past the copy:

  BUG: KASAN: slab-out-of-bounds in ntfs_file_compare_values+0x2d1/0x4b0
  Read of size 2 at addr ffff88800a4ef2ce by task init/1
   ntfs_file_compare_values
   ntfs_collate
   ntfs_ie_lookup
   ntfs_index_lookup
   ntfs_readdir
   iterate_dir
  Allocated by task 1:
   kmemdup_noprof
   ntfs_readdir
  The buggy address is located 0 bytes to the right of
  allocated 78-byte region

Two bytes of an image from mkntfs are enough: in an entry whose name has
six characters (key_length 78), change file_name_length from 6 to 7, so
the key claims 80 bytes. The entry itself is 96 bytes, so the existing
check lets it pass. The next readdir of the directory reads the extra
bytes.

Check the name against key_length, and check that the key is large
enough to hold file_name_length in the first place.

Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
This is independent of the three-patch series I sent earlier today:
https://lore.kernel.org/all/20261106091420.2461683-1-wahidzk0091@gmail.com/

It touches the lines just above the "return -EIO" that
"[PATCH v5 19/31] ntfs: report index validation and block I/O errors"
changes to -EFSCORRUPTED, so one of the two needs a one-line rebase. I am
happy to do it on whichever lands first.

 fs/ntfs/index.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/index.c b/fs/ntfs/index.c
index 322cb371d..1abca298a 100644
--- a/fs/ntfs/index.c
+++ b/fs/ntfs/index.c
@@ -43,9 +43,11 @@ static int ntfs_index_entry_inconsistent(const struct ntfs_volume *vol,
 
 	} else {
 		if (collation_rule == COLLATION_FILE_NAME) {
-			if ((offsetof(struct index_entry, key.file_name.file_name) +
-			     ie->key.file_name.file_name_length	* sizeof(__le16)) >
-					le16_to_cpu(ie->length)) {
+			if (le16_to_cpu(ie->key_length) <
+			    offsetof(struct file_name_attr, file_name) ||
+			    (offsetof(struct file_name_attr, file_name) +
+			     ie->key.file_name.file_name_length * sizeof(__le16)) >
+					le16_to_cpu(ie->key_length)) {
 				ntfs_error(vol->sb,
 					"File name overflow from index entry in inode %lld\n",
 					(long long)inum);
-- 
2.53.0

