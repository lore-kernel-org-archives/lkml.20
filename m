Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017027;
	b=hCGdTS1daOUyA75dMcP3M3/DT+lPh7j9V1475Uxx6nn087c+wZcBgythC1BjNyI8ZCU0
	 cNpQeVSUBLFYIzhiEyDerWcoYN/qnBYfoFaiJc9a6uUiFFcnleFDLnJBj6xDSMvCs/r0/
	 1g8fuUZVhV9E3FrIVfbvjUXv1j+9/FjBWErm9p4rr8ULFB2rAiHX34aRExuGAu40LQxX1
	 j0xy3scfs78lPnGYTv5A9KMDkp2utSYNXFU3jxfBIchbjWqcgJkdBamdFjvuXSzF2NcHz
	 JK9xYOScHXcAFetAzGteA6YhuXY0DY7dcd30LpcxY+yjuMytx/YZYCFQ5nMMdt0zRIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=id79u9HlNYPhbVKFzuHCevsdqYSFzkYsxcYG7FhdsbA=;
	b=dJyqlZqWOnfa6ONh/V+K1ULPYVrYJfhzjVO/GwBjl4h/o9ikmq1ZDAawhKJ/B9Nt6JxI
	 kyT0pL7NcpsCg/T4oWLJJYWpUTW8oEM8llwP0wYdq1Op17g/uYipNZzCxJ+wLz8Nofaj2
	 awHhcLoYI7N+n3MRQShHjH4ztt8eNapSf8Mt+HFkMjiu6AKuByOdaTwdUdy372gXg4Cde
	 LFGwviV4n1kWZn+fRySTck+F7tATy2Fs4wMcsCwio9WB7PUbVK9BO6r2mmkpzUHnU/lGV
	 CTjrAGChiZjdOEnWLUu0PVPy9xAIj03thGM6KBVT/RfKfLoj/3B3H2L+w9i8FdA6aEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtQXJKZf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A0F606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A0F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtQXJKZf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37000e7234bso1590110eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794017026; x=1794621826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=id79u9HlNYPhbVKFzuHCevsdqYSFzkYsxcYG7FhdsbA=;
        b=gtQXJKZfWUxfAEKOF3qtZb5bDcDzsoSWvBXd+6QvyouTypSgR2h5c+yHhumMWNXs8D
         eAmaSwZ8lQPfQ+ElA11lPs4XWpiBOMa2GaneS87mF1un+St2zJClBKu4ReBKAmQi+kLH
         n/Iq5F0hQMV8eTq57H3CQRPGqQt+IdoSmpoT3LCYEVRZ9Uzblh9rvw+DB+cg0DP1l++m
         2L0P0L5i1m679WE9ndbmLGEP8SNu0WTFHPV+VlQL4fg+7m17gi+SukTcJb52s5RCMFoX
         zONPFMYanv/Hql94ta+v8hsnRpjTkQM+MFQVwdXvTHJDNcqyyuL5C7w3CCE1sCQSr4n1
         ijcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794017026; x=1794621826;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=id79u9HlNYPhbVKFzuHCevsdqYSFzkYsxcYG7FhdsbA=;
        b=0KfJoM/9erRl3xED93Au6/3XRshu85IBGF3RIZWAnwBnZ1DxnYpiKa+wjw/yji0hmq
         5ABRjavvVAIYxhoICtW9ncia12RiqynqDhrPjtNVhHan7LyJleHONQJYZKYNW62RnSr1
         aTRcaygRLiSvIYQ59pdKTyTiU56eTdd0OzNcK0q2BG4DZ4dlcCX4NH87sIszIL4FMR1J
         CzCGKKZ9v6XPm9848ffEcppcvWkFblLjXWBKTVQrXKDdt9AchsEYF+RR8IVJWUXeXPGK
         bu+pafBFAPPlReHXSq+Sv7WqBEdSuF8AEw7o+l7QjMxjWd8BCVoTebDvzYxMld7yra0v
         wGLA==
X-Forwarded-Encrypted: i=1; AL+hErFLkzwT+Kyn06MtcjPPJaFuVSQtaniXd8l2uqeJ2Gcft1XrffH9PvS5nihRa1txU3WIYpK8VIOAd6mjrUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WP+8/peLT2UE6X2LksUrp/K79s+p2Mu9dXOqXZGUQG2TdcFir
	VV46MieC2aNMQik++OXezAzsNItm2V9C1UGzsW7RbhisTqSo3b+KbgO6
X-Gm-Gg: AYBFou24O26rBWu3Q5D4icKiB+kCpfC5BoXifX7v3GU/6dGWiOCopYN20tQkRSrkna9
	+QUdV2tFhpdUZfILQt/oyXOQKXhJgcJcDo00ifNHdQ3i+mhpjZHL0DfPEuYeIJyTg9Pr2KI9ys1
	34hlbyIZiwOM4cqpqo+DCi3z/mtG4Mf8xmYNMmobETZb1SA/pJnEj/MlSh4lpEtfK6lM3ldedke
	Qq2NoWdA6Q8ofPxXwS65sPLcEIfYJJ1wh0xzMckrzKkN6gj+YNZM4qqd8G6ApjUIgCOCklnBEEr
	ds6zIItIon5qB9YxZbIGcx79G39ItN06wOkPI0n5VQcW2spv/ulb//Hwkv2FgwZDdUyzmr9+sF1
	EV47Keb0qo6t2lyh3yiOVQzUSrz/jEpthngaoCswLkK7RHrm2wGsKGTOM+fWn+bu6GGN7k6JkOj
	9WOzSjcVmBGuWZ/QZBxcLxt3yiSy3O9+0UZRN/uVG+Uv7WnBEuBh6sp8sI0/x6tT4/I5Zo0Tncb
	1BG/kB35pHuxTpfDvM+su7eMarE+xqPHBLLBAxqPukoyAoj+g0imvabi1AWc8uGODh//DP2lnoA
	MXDxpJYbO6H/plllEwt6zivz5+RIoNg/Gunmtdx2hgEIYryqEANkRcHxW5ksUkUx+Vg=
X-Received: by 2002:a05:7300:c8c6:b0:36c:b138:651e with SMTP id 5a478bee46e88-36f767156a6mr6206079eec.22.1794017025945;
        Fri, 06 Nov 2026 18:03:45 -0800 (PST)
Received: from fred-server.tail1cd3ef.ts.net ([166.199.5.81])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922b205sm10524395eec.11.2026.11.06.18.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:03:45 -0800 (PST)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>
Subject: [PATCH 0/2] smb: client: fix DFS handling of non-ASCII paths with non-utf8 charset
Date: Sat,  7 Nov 2026 02:02:55 +0000
Message-ID: <20261107020257.363811-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paulo,

This series fixes two problems that show up when a DFS mount uses a
non-utf8 charset (iocharset=iso8859-1, or a kernel built with a
non-utf8 CONFIG_NLS_DEFAULT) and the DFS path has non-ASCII
characters.

Patch 1 fixes an out-of-bounds read in dfs_parse_target_referral().
path_consumed is a utf8 byte count (the DFS cache works in utf8), but
it is applied to full_path, which is in the mount charset.  When the
count exceeds strlen(full_path), the unsigned subtraction wraps and
prepath points past the terminating NUL.

Patch 2 fixes a double conversion in setup_dfs_ref().  The path is
converted to utf8, then converted again by dfs_cache_find(), so
"é" is sent to the server as c3 83 c2 a9 and the second-level
referral fails with -ENOENT.

Order matters.  Patch 2 lets these mounts get past the second-level
referral, which makes the over-read from patch 1 reachable.  Applied
in the other order, patch 2 would turn a clean -ENOENT into an
out-of-bounds read (a KASAN report on KASAN kernels).

Testing: Samba 4.23 DFS root with a link named "café", client on a
KASAN kernel, with iocharset=iso8859-1 and the raw 0xe9 byte in the
mount path.
  - On an unmodified tree the mount fails with -ENOENT.
  - With only the setup_dfs_ref() change applied: KASAN
    slab-out-of-bounds read in dfs_parse_target_referral()
    (strlen(full_path)=29, path_consumed=30).
  - With both patches: the mount succeeds, no KASAN report.
  - Regression run: iocharset=utf8 with "café" mounts as before.

Known limitation, not addressed here: when a non-ASCII link is
followed by a path component (e.g. //srv/dfs/café/sub), path_consumed
is still in utf8 bytes while full_path is in the mount charset, so the
prefix path is offset incorrectly.  I saw this as -ENOENT.  Patch 1
only prevents the out-of-bounds access.  Fixing it needs the
consumed length converted to mount-charset units, which changes the
dfs_parse_target_referral() interface, so I haven't attempted it.
Paulo, how would you like that handled?

I haven't added Fixes tags.  The strlen() - path_consumed arithmetic
was moved by commit abdb1742a312 ("cifs: get rid of mount options
string parsing") and appears to date back further, and the double
conversion in setup_dfs_ref() also predates 5433c629e8d4, which only
moved the call. I couldn't pin down where either became reachable, so
I'd appreciate it if you could add the right tags. I haven't added
stable tags either; let me know if you'd like them.

Fredric Cover (2):
  smb: client: fix out-of-bounds read in dfs_parse_target_referral()
  smb: client: fix double conversion of DFS path in setup_dfs_ref()

 fs/smb/client/dfs.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
2.53.0

