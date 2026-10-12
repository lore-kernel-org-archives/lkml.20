Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751846AA79
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794857; cv=none; b=S4YHsYLNCQTCoceHqfbqp+Ap6eSNeAk7BfH4GtcRJ1aUlOaNtnC4qmbLmywdTTK9e0ydgSRZjW098cWVkCdOd7XPh9rVWjJVS+wACFNqe+Syu4C2QMyhjl8w1LgNd58FT7pjvPCGq0dFp+OyFj/lKwh0OO0U835W6bBlgznvZls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794857; c=relaxed/simple;
	bh=FA+379q/k3V/va3CIg2khmp7va3zPNt5em5x5XrFdug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ba1b7reEwxnpME3anbA57Fi6ku2s09pgrLyHI9rRHvVlQT+mTNKjMO0zVWi3tyx6kaZ73om9enOaNIjlzhXJTL7gSBJ0it3clcQS8Hnvw1MnnWBGFK5rvHsWtOS7W5zBRHxt35U0z5kZ63MBORko6VAzP4qawrPwxHGI1QIzL9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKcKSktC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKcKSktC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381b831d535so1821918a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791794856; x=1792399656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tRNyFB0sP29lOtILIZTpJyH9zkzaJWR0CNvGcZ1ksVM=;
        b=RKcKSktCSzEmUgnsQlkCPPb1qooWtUrCJyHG4FBcj357i1myZ/8Mgboa4B/UlP49vr
         d42J2O6OZSkbGrK7vlOBK4J1T0smFOGVatY0UNnl9E7vMKB5tgrRXe/m8FCfgL7gDGKA
         rU/yXs2su1nJJfQPLtDebUqYox3lVu3b/1nd5vNX2sePz/v6YPAn4qWrbB+AEA3o0FEC
         7aGrrnwKjSa80XezOyL7D90xv0JyewSoucw5yRRyhiCF4EBu/+ru/ZIOWJvzkI1nt15K
         Tm0WZkUgN73wjCvE+TcbGUlxOEGw6I4fdUHC3VYCybqcMu6wemz9doAxcbP5YIiRRMGR
         dSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794856; x=1792399656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tRNyFB0sP29lOtILIZTpJyH9zkzaJWR0CNvGcZ1ksVM=;
        b=uP6BDAPRPEVNMBM5r4NU8J5xqKUSLpw+4/IuBcsuaQqn8GNyxtlxykhU61gRTksvkn
         Q9+7hpdsoi/6jJmmhfNz24EFZSby9B+Z14UsxXoN5IKhlKh0olx4e67IIfAv9o5U7dtB
         dXylMdSTAU62d/gR2dXXJAbQa7w61RpPy2YyeCrcxNGGF3nJ2sLRFh7misx16vU1Je5R
         Y57+obSNo1B4Vp6O/lDBuQc9L4MGnS1xTgQu9Zhyi3A0ZSGLQSN1Ow4QijFGbUb6YnYg
         LtOX9YebAFwCrR5l0luxV/46KASONpoz66dZSniTUydygPPYOXkRejJyEO/tRJYwWcaN
         GQxw==
X-Forwarded-Encrypted: i=1; AKwUvByHU/cdd33Gap96iZrz9iWilPF4vaTrRq7o1/bHWOksfEqIU6nRsjQfMWQwv3/chVUGt38VnQeizJSHEDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIow3ygE5bCJkMsPsUFz9P282TOUx6YvPGkQsQqOpJKSgPRJ3XD
	ayObjwmc+4mqjgZNGlEuw1jgA84jwbyu1k1e3VV3C5S4bdb32kugwFQf
X-Gm-Gg: AYBFou3PJ7svWGGUVpXoyPU9N1/BTLpthIQocAb/J7gTnI/D/p6YKUdsb1KrpEvC+Nc
	I59kYlacUZcoLUIyq8rLrjGNimNljFH6rDgyf3q0dKxl4Uyszyc8Sa7AB+9DrpJLVmVo3TauHYa
	5x/RL75wahDPDfNTXkay98NkbW5xtm/hhza8vaXD1BgSj0zVQe315SnDdGRyKNIUera6I7c7fa2
	8UMa2c6JpNMHt1qO8dgxqsafAdnm6jX8WiJ+bvNsBdn4SADLVmZIgcRf0bchbPPq3WyJT17jT+/
	Hxgn0tD7+/x/TuU6mhcMVYxcjfYwZF8KK+jX1KGi3/K2wtIIEc7CUmFXb0LtHjceuIpg/P+8bsx
	liJQ5o2NsLRVifmqPGNUUzwJszx8lW8i5MWgumKIKu1B4tobdYKxRY7x6vCk90M2/hyuBiLHX8j
	DbL3hsG4BiJhbX5ufYqbW6dWFYMuNLSilvvKt7YwA5swG0PKncNnfFihEGhA9EqJ0/E3SRk6/fs
	AW6yU8=
X-Received: by 2002:a17:90b:28c4:b0:3ab:188b:c5be with SMTP id 98e67ed59e1d1-3ab3acdc5e3mr6964938a91.45.1791794855613;
        Mon, 12 Oct 2026 01:47:35 -0700 (PDT)
Received: from bintable.localdomain ([123.215.20.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm13518386a91.9.2026.10.12.01.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:47:34 -0700 (PDT)
From: Jinpyo Lee <bint4b13@gmail.com>
To: linux-nfs@vger.kernel.org
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-kernel@vger.kernel.org,
	bobtobabz@gmail.com,
	Jinpyo Lee <bint4b13@gmail.com>
Subject: [PATCH] nfsd: prevent a double put of revoked layout stateids
Date: Mon, 12 Oct 2026 17:47:22 +0900
Message-ID: <20261012084722.5168-1-bint4b13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nfsd4_free_stateid() finds an admin-revoked layout stateid with
find_stateid_locked(), which does not acquire a reference. Since the
layout case does not mark the stateid closed before dropping cl_lock,
two FREE_STATEID operations in separate session slots can both select
the same stateid and drop a reference they do not own.

With fence-work teardown in place, the second caller can also wait in
nfsd4_stop_layout_fence() until the first caller frees the stateid, then
resume through its freed fence mutex and layout lock.

Mark the layout stateid CLOSED under cl_lock and ls_lock so only one
disposal caller proceeds. Take a temporary reference before dropping
cl_lock and hold it while stopping fence work and draining the remaining
layout segments, then release that reference with the final put.

The layout stateid IDR does not own a separate reference. The initial
allocation reference is released when LAYOUTGET completes, and each
layout segment holds its own reference. Serialize segment draining with
in-flight layout operations using ls_mutex, and recheck CLOSED after
acquiring that mutex so a stale LAYOUTGET cannot add a segment after the
drain. Also make the newly allocated layout stateid the error-path put
target.

Read CLOSED under ls_lock in FREE_STATEID, and restrict
nfs40_clean_admin_revoked() to NFSv4.0 clients. Session clients dispose
of revoked stateids through FREE_STATEID and must not be processed by
the NFSv4.0 cleanup while layout disposal is in progress.

The vulnerability research and validation were conducted by members of
the Tobabz team as part of the Best of the Best 15th program.

Fixes: 86b9898920a6 ("NFSD: Handle layout stid in nfsd4_drop_revoked_stid()")
Assisted-by: LLM
Signed-off-by: Jinpyo Lee <bint4b13@gmail.com>
---
Validated on nfsd-testing d918c664efd5ec6a7309e98f567fb018bcde0e11
(2026-10-12):
- Applied cleanly and passed strict checkpatch with no errors or warnings.
- Built and booted an x86_64 kernel and modules with GCC 13.3, W=1,
  Generic KASAN, lockdep, and pNFS block and SCSI layouts enabled.
- NFSv4.2, NFSv4.0, and NFSv3 read/write, fio, and unmount tests passed.
- On a real loopback pNFS SCSI layout, administrator revocation followed
  by one FREE_STATEID removed the layout stateid and reduced the
  admin-revoked count from 2 to 1. The sequence passed twice.
- Tracing observed nfsd4_stop_layout_fence() in both revocation and
  FREE_STATEID processing, followed by nfsd_layoutstate_free.
- No KASAN, lockdep, refcount, list-corruption, or Oops report occurred;
  kernel taint remained zero.

The full xfstests suite and a forced concurrent two-slot FREE_STATEID
race were not run on this revision.

 fs/nfsd/nfs4layouts.c | 24 ++++++++++++++++++++++++
 fs/nfsd/nfs4state.c   | 37 ++++++++++++++++++++++++++++++++++++-
 fs/nfsd/pnfs.h        |  6 ++++++
 3 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4layouts.c b/fs/nfsd/nfs4layouts.c
index 898776c9d..74c39e216 100644
--- a/fs/nfsd/nfs4layouts.c
+++ b/fs/nfsd/nfs4layouts.c
@@ -312,6 +312,7 @@ nfsd4_preprocess_layout_stateid(struct svc_rqst *rqstp,
 		status = nfserr_jukebox;
 		if (!ls)
 			goto out;
+		stid = &ls->ls_stid;
 		mutex_lock(&ls->ls_mutex);
 	} else {
 		ls = container_of(stid, struct nfs4_layout_stateid, ls_stid);
@@ -324,6 +325,15 @@ nfsd4_preprocess_layout_stateid(struct svc_rqst *rqstp,
 			goto out_unlock_stid;
 	}
 
+	/* A new or looked-up stateid may have been closed before ls_mutex. */
+	spin_lock(&ls->ls_lock);
+	if (ls->ls_stid.sc_status & SC_STATUS_CLOSED) {
+		spin_unlock(&ls->ls_lock);
+		status = nfserr_bad_stateid;
+		goto out_unlock_stid;
+	}
+	spin_unlock(&ls->ls_lock);
+
 	*lsp = ls;
 	return 0;
 
@@ -594,6 +604,20 @@ nfsd4_return_all_layouts(struct nfs4_layout_stateid *ls,
 	spin_unlock(&ls->ls_lock);
 }
 
+void nfsd4_return_revoked_layout(struct nfs4_layout_stateid *ls)
+{
+	LIST_HEAD(reaplist);
+
+	/*
+	 * The caller holds a stateid reference until segment draining ends.
+	 * Wait for any LAYOUTGET that passed the CLOSED check.
+	 */
+	mutex_lock(&ls->ls_mutex);
+	nfsd4_return_all_layouts(ls, &reaplist);
+	mutex_unlock(&ls->ls_mutex);
+	nfsd4_free_layouts(&reaplist);
+}
+
 void
 nfsd4_return_all_client_layouts(struct nfs4_client *clp)
 {
diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 920967dd6..02bfbd242 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -5837,6 +5837,24 @@ nfsd4_find_existing_open(struct nfs4_file *fp, struct nfsd4_open *open)
 	return ret;
 }
 
+/* cl_lock is held; layout stateid status also requires ls_lock. */
+static bool nfsd4_stid_is_closed(struct nfs4_stid *s)
+{
+	struct nfs4_layout_stateid *ls;
+	bool closed;
+
+	lockdep_assert_held(&s->sc_client->cl_lock);
+
+	if (s->sc_type != SC_TYPE_LAYOUT)
+		return s->sc_status & SC_STATUS_CLOSED;
+
+	ls = layoutstateid(s);
+	spin_lock(&ls->ls_lock);
+	closed = s->sc_status & SC_STATUS_CLOSED;
+	spin_unlock(&ls->ls_lock);
+	return closed;
+}
+
 static void nfsd4_drop_revoked_stid(struct nfs4_stid *s)
 	__releases(&s->sc_client->cl_lock)
 {
@@ -5871,9 +5889,24 @@ static void nfsd4_drop_revoked_stid(struct nfs4_stid *s)
 		break;
 	case SC_TYPE_LAYOUT:
 		ls = layoutstateid(s);
+		spin_lock(&ls->ls_lock);
+		if (s->sc_status & SC_STATUS_CLOSED) {
+			spin_unlock(&ls->ls_lock);
+			spin_unlock(&cl->cl_lock);
+			break;
+		}
+		s->sc_status |= SC_STATUS_CLOSED;
+		spin_unlock(&ls->ls_lock);
+		/*
+		 * The IDR does not own a layout stateid reference. Keep ls
+		 * alive while draining worker and segment references below;
+		 * the final put releases this temporary reference.
+		 */
+		refcount_inc(&s->sc_count);
 		list_del_init(&ls->ls_perclnt);
 		spin_unlock(&cl->cl_lock);
 		nfsd4_stop_layout_fence(ls);
+		nfsd4_return_revoked_layout(ls);
 		nfs4_put_stid(s);
 		break;
 	default:
@@ -7899,6 +7932,8 @@ static void nfs40_clean_admin_revoked(struct nfsd_net *nn,
 		unsigned long id, tmp;
 		struct nfs4_stid *stid;
 
+		if (clp->cl_minorversion != 0)
+			continue;
 		if (atomic_read(&clp->cl_admin_revoked) == 0)
 			continue;
 		if (is_client_expired(clp))
@@ -8698,7 +8733,7 @@ nfsd4_free_stateid(struct svc_rqst *rqstp, struct nfsd4_compound_state *cstate,
 
 	spin_lock(&cl->cl_lock);
 	s = find_stateid_locked(cl, stateid);
-	if (!s || s->sc_status & SC_STATUS_CLOSED)
+	if (!s || nfsd4_stid_is_closed(s))
 		goto out_unlock;
 	if (s->sc_status & SC_STATUS_ADMIN_REVOKED) {
 		nfsd4_drop_revoked_stid(s);
diff --git a/fs/nfsd/pnfs.h b/fs/nfsd/pnfs.h
index 559df0e5b..9b0f17a4d 100644
--- a/fs/nfsd/pnfs.h
+++ b/fs/nfsd/pnfs.h
@@ -75,6 +75,7 @@ struct nfsd4_deviceid_map *nfsd4_find_devid_map(int idx);
 #ifdef CONFIG_NFSD_PNFS
 void nfsd4_setup_layout_type(struct svc_export *exp);
 void nfsd4_return_all_client_layouts(struct nfs4_client *);
+void nfsd4_return_revoked_layout(struct nfs4_layout_stateid *ls);
 void nfsd4_return_all_file_layouts(struct nfs4_client *clp,
 		struct nfs4_file *fp);
 void nfsd4_close_layout(struct nfs4_layout_stateid *ls);
@@ -93,6 +94,11 @@ static inline void nfsd4_setup_layout_type(struct svc_export *exp)
 static inline void nfsd4_return_all_client_layouts(struct nfs4_client *clp)
 {
 }
+
+static inline void nfsd4_return_revoked_layout(struct nfs4_layout_stateid *ls)
+{
+}
+
 static inline void nfsd4_return_all_file_layouts(struct nfs4_client *clp,
 		struct nfs4_file *fp)
 {

base-commit: d918c664efd5ec6a7309e98f567fb018bcde0e11
-- 
2.50.1 (Apple Git-155)
