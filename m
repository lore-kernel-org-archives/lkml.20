Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F583839A9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853343; cv=none; b=ERDs+cKTU79GVV0vBC4Ki9ZN1H+3DM8a+P5bLom0NiBqZEHbTmhfuNMXoji1Hfo5uiZdBqly2/0Tb7lLlwQ+BNa0f1CO2uSTcNlQfBBdpMtYgmIHdHGQlzk9kTuTJKQ/XsgOq+vcGYGR0w+YQlu3SZmpmeWemHITJ7ZREYvTmeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853343; c=relaxed/simple;
	bh=KcQIxrjjYKOPt7VPc3GR8Ypvb9JGlM8cc1l2/4kyu9A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSCJh+mCOvLEo7rGJ2UbN+Hu1JqL6QMk0jJqwtpOoj1sVmt2SzHD+s7O7yTlrOSDlCGvOccMsj6weOui+826ikJjZBhbmjbPu5VdG/cRri8hZjLjupDeMeAIGEYdFlTGK29oONZ1NtKl7rqfqgwIZ8Y+NrVv70USQAnJPmakdgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZaOoANm; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZaOoANm"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98fso1683151a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853338; x=1790458138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGJIKW1WUZIXfYGv7StzLwvHtFQ/N+sc5vtFtFfdCwo=;
        b=eZaOoANmYxN02/Ll3CCd7mzVhr9nww8WmS0ZZ75M1wzB1ltuDQa1AFBFAmo5J6RQET
         w1EATVXGQ2ny0UWhc7BGp4WEvzWRdIDgtRF4jBjkN2+BVtyg7GF6jUESvHVq7zC/uraa
         hlMYtNFQUrFV8WFiaen0CHuFzDW5nVDmyiZ2c3QIpcazPJqKB+Squ+uCG+hJzP6DCtrB
         8AaJFOqM6CaXhUunTA4FL/pSfpITuGja+lB84TVAPDv+q97/Axlu89H9VGLzpLOQxRvk
         69GZ4H6mRCPZCuyTLiCbS96C/hZlpYMVwrzOk4kAMpFJ+oQtQW3oq/L9C+Q+WG2ag+L3
         u2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853338; x=1790458138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGJIKW1WUZIXfYGv7StzLwvHtFQ/N+sc5vtFtFfdCwo=;
        b=wigG6tJctatMh9H3hN9cqSErJWqc02CtPskk1tr9FRE2OOmv0K1k8v0JitcKQMsOHb
         kqoTXAAQZbreT10xE8ERy2KKCqakSHwJbbl8iKdxr7b4t1Ujy/2sUjpxmZ0vpBXWhQxq
         A/n85BdX7+RqxXfg+7gT0d6PIZ3fvop9V9H/0491Ff32DEsBDKm0jDka8bsJ/jWbc2Qc
         xw5vfRORTetNKAsrowv8WuwFa9FCJ1I7XaFmmirH4td4R5NwRmuUL01ED1YxFYVwZvSD
         yOFfA8TUciFqs1zv5n36CU1GDPfOhEn9y1TN0JFUTWjvNe1a4VGZspkmyW+qZNN1fC3b
         ZufQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdxuW1d0aGzyPWnCxbjeXXjttLg5mzR3wrhHk18SvlZ5/5Myl+AsaffUqQSv/fhyNPbCKjQ8TNQL/us2A=@vger.kernel.org
X-Gm-Message-State: AFuF++m6F0MhTMHYsjUrd/vgZzm2vDQ2AW/p43ln0GcpJHkALWT7XjPb
	Qp2arKmkwxTd9/afRu7M3EaPZh3YQPCxeMGc1UkUzwqwdXn2vUBktF2T
X-Gm-Gg: AYBFou3Q2390C50CZF9Y+PysmV9sEbInbEpjERS57fbip9+aL+biXO34KBo5N+k00qh
	ezDJ6KF2eDuiIxaA7UsyuTO0TVbcq6fodrXZJvUtsPWkz6b5MWjqn0RKjdc467ntHJ0Q3FFWXz4
	tNqxmJFO6hEcFqEm4tR6w5+8+lVsWcTa6ZFeCpFKvh1iir2ZvlWeo4RQG4bI4bo5YVHiopSHGdX
	ZkxP4h9Nyj3n/2Tvaam9squqrrXgIAvsT5rlBslr853gzQ4WPUnk0luaUFEDJkBpDMwzzhM3yzc
	yv9JLMeH0W8o8XMHx6/JPoJztY+7NsEUsk1c6tkmGa7PooC6KGtRYyM36YNPnUJ8sC14sfqX4+L
	r5obwDVW0aEijhitSVdsCELqR8dGEUJrlCij9oPtT3zcNtveT+LdwOsOor/npKBfGW+6PNbu4yU
	KVAETDVms7N+PIRtjs6OUU8gkT0sHnKwYfXhGABbu2n2t5F1HGywTKeGktkdMlbmU1IYcd8F8Cz
	sn7IloJfFHHWUneUQiSjSGW5Gle/jPg2+kHVVWrPRlS0UtcwNE+QF7Bhw129quTfXGrtHiVMQoG
	SHqygH+GZQ==
X-Received: by 2002:a17:90b:56c5:b0:39d:f247:bab with SMTP id 98e67ed59e1d1-39e54b66f85mr12104378a91.6.1789853337992;
        Sat, 19 Sep 2026 14:28:57 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6caefa5esm6021149a91.12.2026.09.19.14.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:57 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: jmaloy@redhat.com,
	tung.quang.nguyen@est.tech,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tipc: fix TLV out-of-bounds read in tipc_nl_compat_net_set() and depth mask
Date: Sat, 19 Sep 2026 21:28:57 +0000
Message-ID: <20260919212857.3241483-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two validation flaws in `net/tipc/netlink_compat.c`:

1. `tipc_nl_compat_net_set()` (`TIPC_CMD_SET_NETID` /
   `TIPC_CMD_SET_NODE_ADDR`) unconditionally dereferences `*(__be32
   *)TLV_DATA(msg->req)` without verifying that
   `TLV_GET_DATA_LEN(msg->req) >= sizeof(__be32)` (4 bytes), reading 4
   bytes past the end of a 0-byte TLV payload (`tlv_len == 4`).
2. In `tipc_nl_compat_name_table_dump_header()` and
   `tipc_nl_compat_name_table_dump()`, `ntq->depth` can contain the high
   flag bit `TIPC_NTQ_ALLTYPES` (`0x80000000`).
   `tipc_nl_compat_name_table_dump_header()` compares `depth > 4`
   without masking off `TIPC_NTQ_ALLTYPES` first (always clamping
   `depth` to 4 whenever `TIPC_NTQ_ALLTYPES` is set, even if the low
   depth bits are `1`), and `tipc_nl_compat_name_table_dump()` checks
   `depth > 1` and `depth > 2` with `TIPC_NTQ_ALLTYPES` still set in
   `depth`. Mask off `TIPC_NTQ_ALLTYPES` after testing it.

Fixes: d7cc75d3cb6b ("tipc: convert legacy nl node addr set to nl compat")
Fixes: 44a8ae94fd55 ("tipc: convert legacy nl name table dump to nl compat")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/tipc/netlink_compat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/tipc/netlink_compat.c b/net/tipc/netlink_compat.c
index d9a4f94ea2d4..9b2d93704e23 100644
--- a/net/tipc/netlink_compat.c
+++ b/net/tipc/netlink_compat.c
@@ -881,7 +881,7 @@ static int tipc_nl_compat_name_table_dump_header(struct tipc_nl_compat_msg *msg)
 	if (TLV_GET_DATA_LEN(msg->req) < (int)sizeof(struct tipc_name_table_query))
 		return -EINVAL;
 
-	depth = ntohl(ntq->depth);
+	depth = ntohl(ntq->depth) & ~TIPC_NTQ_ALLTYPES;
 
 	if (depth > 4)
 		depth = 4;
@@ -932,6 +932,7 @@ static int tipc_nl_compat_name_table_dump(struct tipc_nl_compat_msg *msg,
 	if (!(depth & TIPC_NTQ_ALLTYPES) &&
 	    (type != nla_get_u32(publ[TIPC_NLA_PUBL_TYPE])))
 		return 0;
+	depth &= ~TIPC_NTQ_ALLTYPES;
 	if (lowbound && (lowbound > nla_get_u32(publ[TIPC_NLA_PUBL_UPPER])))
 		return 0;
 	if (upbound && (upbound < nla_get_u32(publ[TIPC_NLA_PUBL_LOWER])))
@@ -1139,6 +1140,9 @@ static int tipc_nl_compat_net_set(struct tipc_nl_compat_cmd_doit *cmd,
 	u32 val;
 	struct nlattr *net;
 
+	if (TLV_GET_DATA_LEN(msg->req) < (int)sizeof(__be32))
+		return -EINVAL;
+
 	val = ntohl(*(__be32 *)TLV_DATA(msg->req));
 
 	net = nla_nest_start_noflag(skb, TIPC_NLA_NET);
-- 
2.55.0.1082.g2b9226bbc0-goog

