Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956491;
	b=q9bVz8qcYay1SviVkRnDP9jleREqLFBn2XdkCKaYAVAlYexu1bt8UgkmiGJ+uDlR5cyw
	 ufTlzbsv+whPCUX7rgWJWsiPygit83Fvjw3EF7M7riDnCKOmK0GK1xy48ioJZ6UOWrAMj
	 SohONIFr31xc1wYMtdcYOfWrq7evaa4l128wa/IKiC402JWGq7SExgCGq8WnwcZErOpIy
	 KbfvcQ884tZnOZzZGTc4NqHjTqwE9Zdbxcr5DRSBNHbCBFtqZLBzUfijEMXgI/ly6L8bm
	 uKyMfk/ksxph/8p53/hdPJMATqXYndJ9Q5nXmrcIC/rKw0ey3Wq4P/Uy+dbvLu4TV9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cc6pG2na6zv7wFv5oObixxN/7ExlBCLIUKtBmr4Nunk=;
	b=raPTK8R2Qxipi1K735FrddHNvunurH9tU9PtZ+vZnY/JvCUwAEmihMG9hmdYyACZdwOa
	 KYTln2OZDnD8OpMvoJSPdFfJJ3U5XiE81Rg1mPHlQvW5u3eHTF84umF3T0CtRsLYc1c+D
	 yegONIiFqsBzqAtfR/ahRbAVa2Rsp3dQbxthZVVepemzzNkevBSnTLCw4EnN0CQMR3LNa
	 RK2SFaV9ULS7TIIWjxlpeDEmIX0W3ciGtJ6apkDFG/DbcQUQz5Pmv8eKbt/x9LDTk+AKx
	 qwvM79YAXiAUw2OfAGrDtR+n48gFSllc6MHarAZuT4q2h736Y7sEQt90Q7tTOeh86eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cK2Spu0+;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E1606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431E1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cK2Spu0+
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1931ff67a29so1451315c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956490; x=1794561290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc6pG2na6zv7wFv5oObixxN/7ExlBCLIUKtBmr4Nunk=;
        b=cK2Spu0+QMhHtZ1j9s0GKtYiutcTB/1jjUoYJ1YkyfWyP86UhBSo8LggtmCY7+eRdc
         uUPcVBOs+kGKBn2W0hlhYug+AyRqx3MLCWOQ8xJAjiwO2M/NFMSxe5MBP3k4PcSkmT6k
         VY8REk7K6wOs3KOrasIePXOuzwr4StLGxS3vKYyiGr0b3ig7ueHWu9Ha6kSlHbuLuOoL
         QKRKJIFV6X5PPFWFzAHtJg6br2IhsEAib/pEgFnxX0LDV5MY/zzNFzvuxh8hEBe6HIgS
         d5n9RT8+F9UKVzT4acg/C6JEd6Yfh+uA6bRb8A7gFvqIXiBSKwkxCJRy8SA3ahDbuhxo
         fMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956490; x=1794561290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cc6pG2na6zv7wFv5oObixxN/7ExlBCLIUKtBmr4Nunk=;
        b=zIACJxvYypeU0IsJNSqzE4oQr6Eaup51cgXHOkuHeNO0APRU+hTVhbvPHpdQe5fInc
         76ua+RY/8buKidLInoNj+CTtmXiwD+0gTr5xTVKylfY1r6reEppxpOuub3o8Fz9WXTdZ
         3ivVmk7tAdQKL6behCWhpakgEEqG9bcrn/PL+K6sa4/bt/2PVxbUx+daz1B46Eh053My
         a3BoIYtXjeuUgVtFpflQAjuZUsBfKLu8oQrun83e9L3jKZBmfTnIRQaOU6GnRuQ+up78
         QtdFGNYOyz7WGFrJNqTc0BvrPN5xBr/4KMA0OBxC8T3qksinELO9ePtmrpw+HYbKZRFo
         2fqw==
X-Forwarded-Encrypted: i=1; AKwUvByoRsseOapcxMeapPZpsRv85lOZMg69nevCfnNnEzQLg6uy+17ITwGQu0jrRTGRxIZCy+NWZXz/Yk6eolA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v5mM2eVfvvkr+tXnOaIGMtTEA3U1EeApWIdDelcdLcq3idfLm
	iS8wD6BNuDNgTgRhNr4ovK9CGL88U5nmSTcIDWIV7GfdJi0I3p6WTd9s
X-Gm-Gg: AYBFou2GmA353OT3PfxAoMTwoO40j+cjoh70dl5QsmIYL+6USQXZqC/oaZihw2wC1nb
	1VIr/N6DdNK6tfCNzwqrW5wSETwQ1dgcTL8kt2maa4G5mcfwDKnB+33edxvdlV1ahAIAR5n+rFH
	7REgbgyiocLtkoEwC/rMBLJ9a5UKoJ/8aw84Td4sMnxk/Mag3AfP0+nF7RA4CWMd7q8ZOKXxwDj
	r3awXJE2kmEAtVpds2Y7quKQO9NhBExaeOMeX/zpXJb5lzxRAODjwlEJAVv2YZWFsqtLjhkuTFe
	opnaP8pwfDHcaYrziaHMEWRR5DnYS74OxQ97dWvCJo9qhubn6U/3PY4n56p5NbfiUKVLBmwUppc
	T+WmpevBiUu36A/W5QZYfN5YYo7jGm5esd/X2MjoVkzLYwRkyFoWzbDAalQ6Glx3wVIehUrwRLG
	6jOdCghDSgxqhXpCe7Cxqkp8qctfZldrmzTiMPzUdsMvCeznzKsEmWCVWWnAwT7pnvmL2GRqvKf
	znne1ikhxNOcC48ilWwE71NjMm1j+OM1pn0VO6sWwgn0LWUKyCqmDDM9p7zyuS63oVG2FQgJ+Wc
	rBJHfo/5KZHS/ffwra0oLQHEjE13FmGWirmcKFe9Iyt7o2tPSe+wnGwv5Rq+rcfi7Q==
X-Received: by 2002:a05:7022:288:b0:1a6:7a2:cfc3 with SMTP id a92af1059eb24-1b25d30ada5mr2387351c88.13.1793956490207;
        Fri, 06 Nov 2026 01:14:50 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm4200968c88.7.2026.11.06.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:14:49 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/3] ntfs: open a named $DATA stream by name when making room in a record
Date: Fri,  6 Nov 2026 14:44:20 +0530
Message-ID: <20261106091420.2461683-4-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106091420.2461683-1-wahidzk0091@gmail.com>
References: <20261106091420.2461683-1-wahidzk0091@gmail.com>
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

Use the unnamed inode only for the unnamed $DATA attribute and open any
other attribute, including a named $DATA, by type and name.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index fce7144d7..0ff671e9d 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4930,7 +4930,7 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		if (a->type == AT_DATA && !value_len)
 			continue;
 
-		if (a->type == AT_DATA)
+		if (a->type == AT_DATA && !a->name_length)
 			tvi = ntfs_iget(sb, base_ni->mft_no);
 		else
 			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type,
-- 
2.53.0

