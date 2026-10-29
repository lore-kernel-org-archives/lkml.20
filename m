Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236174;
	b=yS7HrZQ3TziH2Y2YWP3FHljbtoo9HKUsccv4dvMLf5javMbxK5uN00srFjYq+hdirKJF
	 Tw8fWnTgKuthfLXXJgAEOf37Qe1mdkvbYps3LiLCCciFPd3U5ehCtaoO5B5mOu/kvZzwm
	 Kp744e60PwpyWamoS74Zk4UeJVmwXM/oGO7FtKOndSSuK89dpDeTUI/Fawy6FaSICoEiC
	 HZYU7PSG7F9aa1Z4wiKr0jjQoEClU7UBCesgMbPsqQ/fMJqmiYT1DfHn3DtNwdewdDZZ2
	 tuuTXwL6sEXSYHqdK1qHzv7QP0BDMFoL/n+1q3NmPnSrPdXeJiuXd47fXz+gkFDaPgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gFCERTgb72WMlkM+VHwKAwEohFgnnSyuqaJzdLu0lwQ=;
	b=UWDq2g+s4gpv9a/uzS2fgsNa2+wNHwxc5wvEhuO/iuVppklXoZWzGGB2O+6aPJOoKQUY
	 7b42fcraE3KMoWcRSFtW/trvXpp7sM8X6QRsXFbwHMqT1LRzBNklLmKrgz9qpc/8ab1vE
	 DrO6LYo/oy57BNxYNubvH63vBgPMP/XzsMQ/4xj4GtdYBxn147fshP//r7mtaEPeAzJNC
	 n2vDHnoL6eg9Q0lLkP8nrgxX6uK5txpwHAxWrsGZEOlMjhdG4XLxPKD4eqoYGpoOezoH+
	 tk15oK32prMoUxkXFXPlpCIkuGDG354HQMlupq6sXPoFB69p05E+liBAywFcd8iv51Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kft7WEya;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359CB60A2603
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 359CB60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kft7WEya
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-930c0f9c1b1so158870585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793236173; x=1793840973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFCERTgb72WMlkM+VHwKAwEohFgnnSyuqaJzdLu0lwQ=;
        b=kft7WEyal6Mtxw+py+3vE2ga2X7efSjbN82dpR6rYuxiWISRg7jlrDj4zu2Km2aJkm
         wUhXSepEUX5xOhs1zLoqx0hQFYT62gKMKeGxiDTNrIBXF42uFk6F/SY4da6vtMNMg+VX
         zsnlx0oGDAmO0sgGAP+1KdvbrjNsWsemGGs16hg4WYGR7L/w/dlaclKV93GPTmUtFWEZ
         +hqe6GiIAOvxAYCdpule9LELf0KNPqh7KTp+L8mxUOi409x+4S5Fg+6FW8iGIdEo+JB/
         gIjBgIAEWI8lOpJHyOEWRp6uA7HIfiFeQED21Rl9Mo29P2C1IOvrSt8OROkNlJxc9YT+
         b91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793236173; x=1793840973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFCERTgb72WMlkM+VHwKAwEohFgnnSyuqaJzdLu0lwQ=;
        b=Lar2Xe7yQLU4XoNLQQ17gFpmVc6DcTnPDPYO74XjTOf58q7vE/2ddhY206LyErFJyh
         JX4J4I5h+PwfzBA8xs3Z0dBdqMTxfJDIjT3oxV5TQZgXv2xT/3+nsFIyNjRlZZ9ru7DG
         AN+PxbiXu+3a/6tXwgPeK+i/aVmiXC7VmnggFYFgZImzxqVLDCjzQZ8IE6DcGC4d67/7
         +Tw15jUbRjDwUqNvRzyK2di1U9M89PzPCeIpxN2179BIFtxj1iQVYekJ1MoUD7NoQjXV
         q7EkrseaunGaO/xRrAZ2KibwHQDt8UAF7wK5a5Qm5TyQUPwNKvF+srBIe0GoGJ243DkV
         6fMw==
X-Forwarded-Encrypted: i=1; AKwUvBw5jZJjDltzhcsjVfH3goZ2jvpt5zGkmf8gsKP/SaVjUP1Es79eaoEFSGIguetn8db4/+5ba1Nf504HqJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJFSSPEMy3aE4T0DS+Bx42QUjaI1qQqGs7LMMnBDCRFUXAAVwyk
	I0Wit+iBujDHHJBDXl1PuJf44tWIXLYfZwpi7QZDmNYrh8dlF1imh8xfDijGKGjy830=
X-Gm-Gg: AYBFou2Az9awP58mdDW/xn5UlstiyRqAf9UJRks25eW8mWMQB1K3uEcaAsUv8J3Xyuz
	/34+RGh3t5/V6Lm99HVsz/UIdKQeE9Pi+jH+PFEMp8Tr1oV6n0Ho7GFwEY0lVbHBS0QivZukMpr
	gm0cWnDFnS2OQv85DVJrxhx6Rhn55u+MmATDF3bLULEb6AW+B8mo1HYEOGCu0xlEIHfzypqP75J
	OZ182H4QybUNd+MPV8sFIQd09zY9hqhoDNjJWdvdgZJYYbyJjpKSiZlMPEEo+a6VwSJnHIvWE9C
	aC5lEiO5xbbrfI4JQc4xf0rsa0GcuGh/9fbOpi5vj4kMjOAQoOjfcPu9yA9I6ek1mpxPMfdR3x/
	M2Hha05ZwUtDoiymprkQT2OpdFVnDJBqU7MkUexI0l3/dRPaUwg+COBIdqM6os0x4FiKeuDC5WU
	7BZzRqSxBoACP06Gm5bsGQLVuRtXBed4loECTIvUBjPKxg8FTifCq7+JB+2nO4yungIUnMTm/4w
	6hQ0HSgeKt1OJLzG0/GxebAOSc6TqBAklcSjAQJyBP1vMg3ptG8Kq1OX67yCtFTB0/eQwqG1mro
	VcAwnBnLSJB2e1lFSCrKN/N4WRRrM/bBJxrtTx3xDEkTyQ==
X-Received: by 2002:a05:620a:4008:b0:93c:6534:d04d with SMTP id af79cd13be357-94408c94a0dmr645547085a.35.1793236173151;
        Wed, 28 Oct 2026 18:09:33 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0669a0fsm1395885185a.8.2026.10.28.18.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 18:09:32 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 29 Oct 2026 01:09:16 +0000
Subject: [PATCH v2 02/10] ovl: make the root inode appear hashed
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-b4-ovl-containerized-sync-v2-2-4e9f08e4a052@toxicpanda.com>
References: <20261029-b4-ovl-containerized-sync-v2-0-4e9f08e4a052@toxicpanda.com>
In-Reply-To: <20261029-b4-ovl-containerized-sync-v2-0-4e9f08e4a052@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793236165; l=1088;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cstaBtDiRM3QOK1D9GwdkdQtwlI5aVSq+4eziFPxk50=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJHbrHkdY+awlgNdib/Omm+yfXK352B7NAqbwS7F/Xv1OBqEJSniNq3g9BuokhMUHW0pb/B+ByL
 ghELlNiv/twk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

__mark_inode_dirty() does not put an unhashed inode on a dirty list, and
the root inode of an overlay is never hashed.  Use inode_fake_hash() on it,
so that the following patches can track it like any other overlay inode.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/overlayfs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index ce3e30235ae9..f0ca1539022d 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -1366,6 +1366,11 @@ static struct dentry *ovl_get_root(struct super_block *sb,
 	ovl_dentry_set_flag(OVL_E_CONNECTED, root);
 	ovl_set_upperdata(d_inode(root));
 	ovl_inode_init(d_inode(root), &oip, ino, fsid);
+	/*
+	 * Nobody looks the root up by its hash, but __mark_inode_dirty() only
+	 * puts hashed inodes on a dirty list.
+	 */
+	inode_fake_hash(d_inode(root));
 	WARN_ON(!!IS_CASEFOLDED(d_inode(root)) != ofs->casefold);
 	ovl_dentry_init_flags(root, upperdentry, oe, DCACHE_OP_WEAK_REVALIDATE);
 	/* root keeps a reference of upperdentry */

-- 
2.55.0

