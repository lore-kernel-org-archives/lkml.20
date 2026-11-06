Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956482;
	b=jrJXpVSUq2NDZn219gAvdmruetFJBbrthe+GUQdGCjMZSc1fXYCI4ufxsgUfuUR6wtgX
	 r4L+TewZRHUImgHTkvzXnTLAoGTgs5pUiJ0FMyzYLV9gTvH+9eK3tbu0G9BJf5wZ1oN7K
	 eFnVatOcWLb4gxJDjrbnJdy7rX2vyZd3B+/h2809hfDkLHjrqunSqtEzdckleoyZtGVpY
	 8DOeCxWqEoaf6u4x7kQ8SsGrP3I5chvfu8/68c5YREH7GuGg1Wt2XwM/PXFopd5kPXjlv
	 y7xMbQ1lmwfSyB3e7r2V3qiF7/YIYzDBI3fUFThp7p8tBUdBr3viUfqZULXwaBzRLmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
	b=xD3Dq2mTaA6HiWzGTVaD60dlhQy5sakQxEUi4+hm/emJ9R/Jmwun2yH+8rMwgLB90xXu
	 h5s/Y5yrA3u/G1kpR7QHHYYKRXPInVlYpGcZ8XrDFgXz9/eZ2A5gp1y0QWH1k9tI+I6xQ
	 OTSCrDAbOt49xArAGfftHvZbyYZnAiyRjRAReiHMy3HaglNPTbEvjPKVnM/Znj5T9zT1v
	 u8Dt3a1UEeehnHdGxwaNrDJ8SF6YtbWQWuOD4CQKQLgTO0dRjE7yY7PEefmkbKSrdFjrB
	 XTL3Iv7wx2EJQ8PghUlNI9/pjFcaZoNAcd/hEDxe9Id3Q1gJ6sEz3zh8Sosr/Mt7j+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O1vVYBAu;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF248606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF248606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O1vVYBAu
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so599557c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956481; x=1794561281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
        b=O1vVYBAuspiUR1oomZmXY7dNsJ7oNWqcp+Lup9ffYYr5jDbW7HIniF9XbY/ets3sgp
         nZbXrrhsH7lecYgvrl5HG3xX+0KIuw5/R0tN8+LjuV4HnORN458aCRch/xQx9q1umg/s
         vsIKr6YrT8nVKv8E2ITY4upXOncrt6fvVvnMtdsUojkDw/yFTejiL/prlbMXemrBoUW/
         D5ArnQZ90Zxzr/1snmTVUOefMyhxOf6Im3/XgOaXE3M2vQNlIccXrdqjpp9sEZNba6u8
         lwbDDbKhNAW2e5fPw4WKS/3hgr72Dp6tluEyk9gz0cUKOKLSas6WmYWqoJBGlxndcQ63
         Pg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956481; x=1794561281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v7NAa1AOfWrbfnp/EeNFL0KXkV/5wtZ7cjfajD4eOnk=;
        b=XBO5BOjgguUKAlZ5Mh3qy4/+Qn2UhhWHtjsGue0luyqKbjePTpxxfL++Baacbpi6vu
         LaAerpJnBzUM0nluOdh3hf7EdP+ViyMPsK2QNGBI406QTMOOmJ9JvArBQNBbV2EhEEM5
         R+Q++5HUIblE2vzzRjxMmZblxAU7g7yeHzFNcQt9Lu617xC7XGBPsw9OvWYTyc11hbrw
         dN8OvYsLONM5p5R+tjoxFO09Qg61maIoS+GYyWt3b6Dm5NxZ4awR8z182SS91VK6f3/x
         XC6cOFsHItiILgpGkRav5cDBHOtdh1IrcMqLgwq2TreBFYgEOv575Srk2QAeaE0bPj0q
         QGxg==
X-Forwarded-Encrypted: i=1; AKwUvBz7YDm9a8Wmwk8LKwQAb9SeF/lVbDH+1c/xKAbmd8KZsEudMaU6XHhT1fsY/Dy0SVZ2XU2yjku+d5jhSR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9U5v7hpXzfU9Fu5BgNlGsa/34LWje1U4H3wWtVlc8sc+gG3/xC
	ywVXUGJfLfOM6Ehy7padC1+rkoRRbgPb/8mq07lbxFgkjJh7Svrsq4dI
X-Gm-Gg: AYBFou0G96VdbAB0F+DFd251bKZaKnd1Atf2Yxkbo5y3PlgPSq54nuNV7aljZkgg+EY
	jxev4AkjmDIS23UCdHOFq6e+d7nBcbhYDESh6EsK6ish/35rsH/HDPUpHl7dTUs0yXfjnSboiC0
	VGb7N9iih0sjWzyFkRAnYUBfjRsFwrMYkXBjpqzWrlRzkIYjCk30YHeIslThRcLMwjBlYFY6duD
	IPaWLhYnmmMfr3MovVetQ4LH39TEu2JZumN82EaCbgPWhzgygZr5XOhwmYoBvFMAzKUK8whbvLM
	gV0DEe0pn+3jm+Ez0jyaFPr+RNFVrydLnvrtv5HNT9qllREWR+SUo2W217zQnJQ7bcgSlu9JHOo
	MzoPbCY6+ELl6S9einLXqnhl2+6nrZwGLZQEokIgvzURzlzu8t/KLutVxLWt0ClsrpMdJMX0all
	Swe+dC9t0MwyRWHqdPAnR0KmbVc5OMQ5odyHWyFXX4RUDzL9rX5qcryHgtx4R64WzDW5rjCfhRe
	cjIKNwq7OesZ3ebyElf2X4VwiUAV0uN6TYZ4lZ52LY98LrpQzS+3jj9y4bI0WKzKzdCr50LByuJ
	tPYn5uodO8Nb2/fPQkrAXQvylbAvhGpuO98KfJEesEPeTk6PWxDsqBz3SnfTjcrOkQ==
X-Received: by 2002:a05:7022:2097:b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b25d34277amr1679882c88.31.1793956480611;
        Fri, 06 Nov 2026 01:14:40 -0800 (PST)
Received: from anon-laptop ([103.187.196.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm4200968c88.7.2026.11.06.01.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:14:40 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] ntfs: do not read an index block outside $INDEX_ALLOCATION
Date: Fri,  6 Nov 2026 14:44:18 +0530
Message-ID: <20261106091420.2461683-2-wahidzk0091@gmail.com>
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

A directory whose $INDEX_ROOT has a child node but whose
$INDEX_ALLOCATION is missing or damaged gets an empty index inode from
ntfs_read_locked_index_inode(): size 0 and not non-resident.
ntfs_lookup_inode_by_name() still follows the child node and reads a
folio from that inode while it holds the mft record lock of the
directory.

Since the resident iomap read started to take base_ni->mrec_lock, that
read waits for a lock the caller already holds:

  INFO: task init:1 is blocked on a mutex likely owned by task init:1.
   __mutex_lock
   __ntfs_read_iomap_begin
   ntfs_read_iomap_next
   iomap_read_folio
   ntfs_read_folio
   ntfs_lookup_inode_by_name
   ntfs_lookup

The task never returns, and neither does anything else that needs the
directory's mft record.

It takes one corrupted byte on an image from mkntfs: change the first
byte of the type of the $INDEX_ALLOCATION attribute header of a
directory with index blocks from 0xa0 to 0x00. The first lookup in that
directory hangs.

Check that the index inode is non-resident and that the vcn lies inside
it before every index block read, and fail with -EIO otherwise. This
also rejects a negative vcn, which was only checked on later descents.

Fixes: d9e00c457d4a ("ntfs: serialize resident iomap reads with mrec_lock")
Cc: stable@vger.kernel.org # v7.3+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
 fs/ntfs/dir.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index fce10baa2..9fb5bb3d3 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -308,6 +308,20 @@ u64 ntfs_lookup_inode_by_name(struct ntfs_inode *dir_ni, const __le16 *uname,
 
 	ia_mapping = ia_vi->i_mapping;
 descend_into_child_node:
+	/*
+	 * The child node has to be inside $INDEX_ALLOCATION. A directory that
+	 * lacks the attribute gets an empty index inode that is not
+	 * non-resident, and reading a folio from it locks the mft record that
+	 * is already locked here.
+	 */
+	if (!NInoNonResident(NTFS_I(ia_vi)) || vcn < 0 ||
+	    (u64)vcn >= (u64)i_size_read(ia_vi) >> dir_ni->itype.index.vcn_size_bits) {
+		ntfs_error(sb,
+			"Child node vcn %lld is outside $INDEX_ALLOCATION in directory inode 0x%llx.",
+			vcn, dir_ni->mft_no);
+		err = -EIO;
+		goto err_out;
+	}
 	/*
 	 * Convert vcn to index into the index allocation attribute in units
 	 * of PAGE_SIZE and map the page cache page, reading it from
-- 
2.53.0

