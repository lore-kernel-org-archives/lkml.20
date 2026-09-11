Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EE744F55F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789127197; cv=none; b=YMubj4FvDc8+cXEfaOjwmfG3wylX+vmlFYYJB6/HRmsRlBJnZhsYNF3wpVMHRFZWxPUrVNx4bxcuZpTfhpKBsy1NuT9BTYJLbL0ISiDYtn2Qyr86Ja0SZEk3KDIKOxmxihKMw1v5sYHhu2NITycdJxk1xXtV8RMAXJMuTgei4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789127197; c=relaxed/simple;
	bh=DqmJQsgUpf4KBnCVC/WyqGYQ2UH9L00dFVSrd0E5b+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OD9yBDOa/1dyrVTYBnTXG5KOz3QiXM4Wr7Y9+2fhBJbHdnA//2ZfnNfGZuFWQaL/Hl0gEqPouVX6Bh8uAPu7L8X3gqXZ52GRGeVYP6N3hPuCCBZywA/yZ9rgaTKTjIMKEJxMhKEhNkTyjYLT7RaH/p/1OFPHmrOTHq3gL1JkGjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIZiFMOX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIZiFMOX"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-869ac301739so586802b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789127195; x=1789731995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0d2aRvLBFsZ2DWV9mXwS41WTqPgM5PBo/dZ4iSn2uA=;
        b=cIZiFMOX8WGsaTjkxAc+eXStHK5765l0tF2Oa8IgJo7jVUyCaPcd5IlEN7BgC8f3pa
         VpMxjeJvpIyBQXyyNBA3FPXxHaR80P6G7FVOeBn+e0D1wUcWy+x4OfqNdrtHSBne/PIB
         SnCaTlvpNeOzD/4vLe3AaBXtofYK0sA2CEujygpfkL9QfFwCScsn0g1BhV7vZoV7U6Xz
         DXp6zIdmpOsLctPdgonNCSGjJLjRdf5fExAhui60WW+SrEkuUMHnGTgrD47h1kpBOOTz
         F5Vir3iwDjJHqGESGKOinAVM85bcfhbvuQXyxNeq6S1riXoMh+RjOuD0A8frnuakF7ya
         mpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789127195; x=1789731995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0d2aRvLBFsZ2DWV9mXwS41WTqPgM5PBo/dZ4iSn2uA=;
        b=NrG7dIhSMsMoFLFNgufOug/ZjlgC+rQqem0K9MYb2IC7nqoV5yWvbpyQf4b2mgvRuq
         bTQvst754IvhsklE5y/6axo/4ljAbGU9nO9K2KykZ43orksmW/d94wD49ej4bT8Wlxq3
         6vi++3x6qFdhGiFcemwfsqDdphv4Ozywgi3e5V5YeYbv6Vy17TsgAXbisfTSKpyIFbbz
         q03bqDYXohYYo207a2g8EDVqWVRfTpjIh6JftHRAGIu2QUU84VPoGB2bh9LqOlrnd+7y
         EAfx39kOvcslFl15TOi1cGuwgerHYck2GMWtL7DQAKa06edTe+mi7D3VtO7jtYgIsz1+
         faVg==
X-Forwarded-Encrypted: i=1; AKwUvBx4EjFPJ6Apvlw0E+2EeD5wd+cQEMB2QsJu/DuaiUcelTARNYnWi8rrKGjmw1CfaAWfyU7HwbFvW1PW8yo=@vger.kernel.org
X-Gm-Message-State: AFuF++lQ/LWisfjHBU6aG/SGrGd0e+eVOgYjUBvPGApCNdiMQCLgTWWp
	a6EM30ZROFOOl0JQGnyHhRY2TumF6jiS8sFRuwsCwM5heTjYY6k+O1MXGL4zmA==
X-Gm-Gg: AYBFou0guHZuG5EuHvwRARDatU2tD4Kd5TC5v/TEkZ7Y2N+VB7hWxpwD8A804NJzLcQ
	N89DbQS+K0e86H6NIbkERXJ/+GlwxoIi+lYVHWL9iP2gKQu+9qCdS9oMsaAEmxqGv4RiUiAMGVl
	OM/kYd/jpqvpbzjwT1n8oTwL+y3g94MJtD1e1Tcq8b8g9/mFwb7ha2l1oQtwBUfgAxZim+nJLuz
	gmQVvzwOgufFyCJazIR63KnMPyWCyQn4NQmBS2kUY6i4QRqlhUh734Fep1C4+cNl+eWII2U93B0
	Nc95e86gbyOYgUt2K6Z1QxtLafITSGSBWEZwuianmzvon0AQvK9GcOS5zYlxDpA+wnVNT7iVP78
	ahvZPTA/VAXQmldjmN84j5jMzx+xv1ZiV7XQ8qV0WtdxYmBFhxjub/jFG4G5Wm/qNbSmProV9wx
	EdmuUr7ytHIL14C4WUK1w3RH1G6BqudD7KSQVikejQ6Uhm6Gu+x1iR1+Uoe5Uip5ddC6AxX0fEE
	d3OOxVOXaGS+9w22FQ=
X-Received: by 2002:a05:6a00:190f:b0:847:9267:2104 with SMTP id d2e1a72fcca58-86b2fb16751mr6046446b3a.12.1789127194737;
        Fri, 11 Sep 2026 04:46:34 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:b928:dcab:35a4:adf0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29ebc712sm971495b3a.49.2026.09.11.04.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:46:33 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Subject: Re: [PATCH] hfsplus: fix recursive tree_lock in hfsplus_file_extend()
Date: Fri, 11 Sep 2026 18:46:28 +0700
Message-ID: <20260911114628.10349-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <28f33649277ca654e66c36aea1bd4f2bfd6abbf6.camel@dubeyko.com>
References: <28f33649277ca654e66c36aea1bd4f2bfd6abbf6.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Slava,

> I assume that if we are here, then we already allocated the blocks
> for the extent. And if we simply return the error here, then we've
> lost these allocated blocks from the free space. Am I right? I
> think we need to prevent the blocks allocation, then.

You're right, that was a real bug -- hfsplus_block_allocate() already
ran by the time we reach insert_extent, so returning straight from
there leaked start..start+len from the free space permanently. Fixed
by freeing them back before returning:

--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -537,6 +537,15 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	return res;

 insert_extent:
+	/*
+	 * Getting here means the fork's eight extents are exhausted (see
+	 * hfsplus_add_extent()). The extents overflow file can't record
+	 * an overflow extent of its own, so it cannot grow any further;
+	 * give back the blocks just allocated for it above.
+	 */
+	if (inode->i_ino == HFSPLUS_EXT_CNID) {
+		if (hfsplus_block_free(sb, start, len))
+			pr_err("can't free extent: start %u, count %u\n",
+				start, len);
+		res = -ENOSPC;
+		goto out;
+	}
+
 	hfs_dbg("insert new extent\n");
 	res = hfsplus_ext_write_extent_locked(inode);

> I think your logic here that if we try to read the extent from the
> Extents Overflow file's content for the file itself, then something
> is going wrong. In this case, we need to place this check into
> hfsplus_ext_read_extent().

Agreed, moved it there -- it's the one place that actually calls
hfs_find_init() again, so this is now the single point enforcing the
invariant instead of duplicating it at each caller:

--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -216,6 +216,14 @@ static int hfsplus_ext_read_extent(struct inode *inode, u32 block)
 	    block < hip->cached_start + hip->cached_blocks)
 		return 0;

+	/*
+	 * The extents overflow file is fully described by its own fork
+	 * extents; looking up an overflow extent for it would re-enter
+	 * hfs_find_init() on the extents tree, whose tree_lock may already
+	 * be held by the caller.
+	 */
+	if (inode->i_ino == HFSPLUS_EXT_CNID)
+		return -ENOSPC;
+
 	res = hfs_find_init(HFSPLUS_SB(inode->i_sb)->ext_tree, &fd);

This retires the guard I'd put in hfsplus_file_extend()'s else branch
(same check, called from the one place that mattered) -- v3 is net
smaller than v2. hfsplus_get_block()'s existing check at extents.c:261
(-EIO, before extents_lock is even taken) stays as-is; different
errno, different purpose -- fast rejection of a read, not an
allocation failure -- not an oversight.

> But I still don't see how we will check the fork itself because it
> could be corrupted even without be completely full? And how could
> we check the forks of other b-trees?

Fair, you've asked this three times now and I keep pushing it to
"follow-up" without saying what's in it, so concretely: a
hfsplus_check_fork(sb, fork, cnid) called from hfsplus_fill_super()
for ext_file/cat_file/attr_file, rejecting a fork where, for any of
the eight extents, block_count == 0 but start_block != 0 (garbage
in a slot that should be blank -- exactly what's in the syzbot image,
slots 3 and 6), or start_block + block_count > sbi->total_blocks
(extent points outside the volume), or a non-zero extent follows a
zero one (a hole in the middle of the used range). Wired into your
severity split: first extent fails those checks -> hfs_btree_open()
returns an error, mount fails; only later extents fail -> open the
tree, mark it inconsistent, force read-only. I'll send that as a
separate patch once this one lands, since it touches mount-time
behavior for all three trees and deserves review on its own.

Both hunks above build cleanly here.

Thanks,
Thang
