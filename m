Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CB1531C8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789171743; cv=none; b=ipWin4utmjuSztl4cVNE7iVG5YsXiHxNXuArLoFBz5CzLYKyLDoYCH6xAFHBeHp2VyY99FJtbTS/lhOY/TW3ks/Y2rP7hO1MD6q+AC2YDB46IFNclSol11e69sdU8yhqFbrUJIC4ghzeIpV/pqVChySZ330/1wO4jUc+rO2FxeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789171743; c=relaxed/simple;
	bh=ygMKCEBw17w2TvFNF0QvzIbk38ofcVwwZgG68di1PHA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTNXojRRebsr6Gzcos1K+Rhium/UfdyT6QBeNG71KJ3qfOHP9T4L46wgETypaKpoH/SLMeXC8zD9Hr+xJ4+XC75pqP/kn9dHS/dBbQmuceDRE+R4RzWCkxPadbVeFSjY8gXSdmX0D5fm5kOftfm1sSMclVZW9dycDfhbYiHYmbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=YjI0ZWIB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="YjI0ZWIB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398e9698a70so1657991a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789171741; x=1789776541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jg78uCdmO9sMjETRRr5TwWNFlS1xhamjhV2nUNuwjo=;
        b=YjI0ZWIB/nGMOm0UYOsz2fholhMeS08SmeOm964A3eryKyRbn4LreZzE9jKdS6DJKB
         tIJNRVZrPbxR89kUs/uWbWIdrsuhl3xn+PrWlGL+6vuzZCP1J+FsPqczOtrQy+V7hXzm
         e6/HgSVGD35LN8vnwvAWQsedFerHVmyXcQNfzN78diSInYBVBNmfqHMyOXVUqTMareM6
         PanPVU0nL/KVnf6VrVlsv2g0d9hXVIqOZEGRMucwswD9ZROAjaYqxTIZDxuEt108KC+K
         OSzSNnzKQm81lnhRaPwenW9S9BlvL0ibn5WdcKNHWqYpngn//l60mxpBaJ3DoJOie6HB
         psuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789171741; x=1789776541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jg78uCdmO9sMjETRRr5TwWNFlS1xhamjhV2nUNuwjo=;
        b=R/075sxdvu6YPOL2NPZXkarVPDU3/R5qhrttHkwaXayvrK1xpyvWauFCsWG+wUaBJ2
         b/We96Bp4RRDc8f2iz70XtrB5hZGIq3mwyG4rhRi0Rgk43Lbse0fDAf3UMrPARoGVrdP
         w3uj4+Kg5ZXE3SI9rabo9ybk9zSaw1XJ91Xf9Zrq+o71kRpLBKanc5wc+7emnnqtkVJ4
         yRpY2On3Wt/Ys9VnAs0gGIZmN2FORDhs5Rr0d01uYono6vk3+tMvSeybHZSN1zXgA3l9
         J4OSv/hxesLUlT724YpoaAYL+cW52sJ49HvFGG4ndpv7Cs+u4beuhKA6pPVLjG94hJEv
         1pWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1WHBuX819yeTs2RT0Y0zwlsO7xgpPaX47rYA/PAtj1Nkp3cS4EVv4w+8gt/0h5cPR/9NLPBDZ0C6JT+w=@vger.kernel.org
X-Gm-Message-State: AFuF++l9rnEgDiWKLN3BXrgI7wBsCqw64MHtrHaodXWP4JbgyVoyBVs0
	9vi55hKxRagTyazKVC94zmrw+n8E+QKOY+Xr0YC6ItIwOcysk3XdrEYLOQQTHTKu8A==
X-Gm-Gg: AYBFou2daWyqmrPh4pPHrlh7Nj3JmIpjRuoKJRWZJW1UhpLnt7F+xy0m4nNWqHMh3SP
	NQMwYgooNrj979PY21D03s/GHIThm34ChxG5RoxeAYZUTGUaKltlo6p98JEhmSpbUdl+bws9JPN
	uYCpHwE4L5a232DNiSLHRHLI+x+rMEarq/qFhlnaKLjBAg9uiyNDQ7dDNWT/0Srl0DWBu1T35SM
	28fMZWfH90nlAGx/H8dhr+awFgWm2hhgZziRS+AInCiCTV1SqTzWlrSivO0CbSTJObCCEqXlAzO
	wilWsBHdk2HrWHWmEbucae/Gq+6tnG8/rxd/MFhDidLMTVM1MFLvBqJFoAcaA1cwDoAoo7cv3T4
	TmQhBY3I/fW7tVvQ3umvCGIlZdeBmFexchBLuChHDUyOfgZe528DQgSTkSkWAuhNJxQfH9Ozt1W
	dR2gh5F/EWWoJtfK7+pe6AaEWb7ZxKnAqe1bxUJJEeHGRj7kB5O38crkzUGhuYrowzdtn31fV6R
	Qj3LQbl9VR3iq6yWoQyVyoDzoGWYUWVUg==
X-Received: by 2002:a17:90b:2689:b0:398:9bd1:3211 with SMTP id 98e67ed59e1d1-39d9c21eb06mr10344323a91.18.1789171741006;
        Fri, 11 Sep 2026 17:09:01 -0700 (PDT)
Received: from gio.scai.dhcp.asu.edu (209-147-138-31.nat.asu.edu. [209.147.138.31])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm9199756eec.6.2026.09.11.17.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 17:09:00 -0700 (PDT)
From: Giorgi Kobakhia <gkobakhi@asu.edu>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>
Cc: linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xmei5@asu.edu,
	Giorgi Kobakhia <gkobakhi@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH ksmbd-for-next] ksmbd: fix overflow in dacloffset bounds check in build_sec_desc()
Date: Fri, 11 Sep 2026 17:08:17 -0700
Message-ID: <20260912000817.763001-1-gkobakhi@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the large dacl_offset is provided, dacl_offset + sizeof(struct
smb_acl) overflows on 32-bit builds and the check is passed,
Which makes le16_to_cpu(ppdacl_ptr->size) read out-of-bounds. This
only happens for dacl_offset in range [0xFFFFFFF8, 0xFFFFFFFF]. So
the oob read is max 8 bytes preceding the allocated ppntsd.

    unsigned int dacl_offset = le32_to_cpu(ppntsd->dacloffset);
    int ppdacl_size, ntacl_size = ppntsd_size - dacl_offset;

    if (!dacl_offset ||
	(dacl_offset + sizeof(struct smb_acl) > ppntsd_size))
	    goto out;

Commit beff0bc9d69b ("ksmbd: fix overflow in dacloffset bounds check")
fixes similar checks in other functions. But leaves this one out,
because it is only valid for 32-bit builds.

Reproduced on 32-bit ARM with KASAN, by a client sending SMB2
SET_INFO(SEC) with dacloffset=0xfffffff8, then QUERY_INFO(SEC) on the
same file:

 BUG: KASAN: slab-out-of-bounds in build_sec_desc (fs/smb/server/smbacl.c:1105)
 Read of size 2 at addr c2a273fa by task kworker/1:1/35
 CPU: 1 UID: 0 PID: 35 Comm: kworker/1:1 Not tainted 7.3.0-rc2+ #5
 Workqueue: ksmbd-io handle_ksmbd_work
 Call trace:
  kasan_check_range from build_sec_desc (fs/smb/server/smbacl.c:1105)
  build_sec_desc from smb2_query_info (fs/smb/server/smb2pdu.c:7676)
  smb2_query_info from handle_ksmbd_work (fs/smb/server/server.c:160)
  handle_ksmbd_work from process_one_work (kernel/workqueue.c:3401)
  process_one_work from worker_thread (kernel/workqueue.c:3473)
  worker_thread from kthread (kernel/kthread.c:436)

Add overflow check.

Fixes: 8f0541186e9a ("ksmbd: fix heap-based overflow in set_ntacl_dacl()")
Cc: stable@vger.kernel.org
Assisted-by: LLM claude
Tested-by: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Giorgi Kobakhia <gkobakhi@asu.edu>
---
 fs/smb/server/smbacl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/smbacl.c b/fs/smb/server/smbacl.c
index 7c60520f3b63..e75247915c87 100644
--- a/fs/smb/server/smbacl.c
+++ b/fs/smb/server/smbacl.c
@@ -1097,9 +1097,12 @@ int build_sec_desc(struct mnt_idmap *idmap,
 			struct smb_acl *ppdacl_ptr;
 			unsigned int dacl_offset = le32_to_cpu(ppntsd->dacloffset);
 			int ppdacl_size, ntacl_size = ppntsd_size - dacl_offset;
+			size_t dacl_struct_end;
 
 			if (!dacl_offset ||
-			    (dacl_offset + sizeof(struct smb_acl) > ppntsd_size))
+			    check_add_overflow(dacl_offset, sizeof(struct smb_acl),
+					       &dacl_struct_end) ||
+			    dacl_struct_end > (size_t)ppntsd_size)
 				goto out;
 
 			ppdacl_ptr = (struct smb_acl *)((char *)ppntsd + dacl_offset);
-- 
2.43.0

