Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C547401494
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152775; cv=none; b=tP02IefXJ9CCT61h4bh2JxCQjY75bmmUH1WPng8sR4hYvGplP6YzWAJayLgQ7gfV/6DHmxG8tNPZCP0XC8q0LW/R7WZ7q3p5Klu1N1VwxZMyuZpBlSj/mQLlInNzfznu7YaKTE7OSP9sFWKx74Zpx1Alz71MzgXw2aTLdjD3d9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152775; c=relaxed/simple;
	bh=PQEmPAiFWPEZwgVGtRKJf0kf6Ql9KRV5dFvgTEQbYS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VLNGMx91HouZe6StJAFG38KKm54b18jI4xt1Yuq67uPJbe6sJ6ocE/MdWnXHrs7cThb+hLlKm5N3dFjM1Dw7ME6WO5qFCD5bROxOiQAdhBine2oMOqysA0WycJ1Qd20c6HrsweI2Bdvhr0VbwWtZRKeBvo90nGXTSyjB0NfLJLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=fuJ7tgmz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="fuJ7tgmz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so15477605e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1789152767; x=1789757567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g8FC7tmkyJmc0qQbb0xxVfXQ3O68dwLlXulxNk7Spb0=;
        b=fuJ7tgmzL26Gecfi97dLzofARKTJ0jZpRSoh4SIPQx99trBimSuQHh6+CImzZEMpDx
         Yqe4k5wgTWZ6PMbT8zrXiUlPNs33Psk7/AMJz35qEJb1twCpzd5WgYMNdvM7pKMCp8XA
         VUZPq/e7Wk1YjSXuWGPfICojJohZ1gUkOtiN0pbfaV7kLMtMSngwUwzG18Aqv2kwfb+6
         pJ4NS0pkwx0RG5z/Fmvp+ekpCwhosjtT4uVPa+pWt6sek+/B0engq/GLYTGVbmME1pYg
         5rTirTk6WY00eds3Ha7HxTHyYBYtd5IkQXpxwfYy4bRCQvejI/lGmsfKVtGWBG+EfSMf
         RUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152767; x=1789757567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g8FC7tmkyJmc0qQbb0xxVfXQ3O68dwLlXulxNk7Spb0=;
        b=e7RqMsTsxma1r9B1kSZRuvtOsByF7jfOAFGIP2D6gLcb7/gcGrQKJZTNtqNTb67lcM
         sNgX/uGen9vCCV5YuA3A6yhLtOaKiyGzqpRp1xFNxvY9bL4LqG7BoFeXxgZdBRuArQ5Z
         A8jj7CIbPyV6hotZ20pcF3i/i48mwTSZXwsNi74Tv0oGjaSMKJqshis+VNSzH4Cbovu9
         0aY25XMwKPZ8v99aRnGRP2w3bWIpRHjeXrlPLU8v7MIzTpBf/3IdNooB9Y/9wR6U5/Ii
         MnVVJkQMiHuzwVLe8ibUYUpas+wd9z33loi9gMnKQZOLPKimLAa649iPZOVKHYJEj+l1
         7E8g==
X-Forwarded-Encrypted: i=1; AKwUvBy6F9qmtEdCqJYoQaIRyPkBb4vns9XR2RfHhl1IPKg8KDJ6UmsLStqRx1Pjsdcx7G67JgrKKxh923ooOJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mvPBirca/vP2b6R5FOjxfI6Kj3n4iTGufnRTbThWwEf6UYdSCK
	hnPGbY0goxVXZ69/85gTH/twl3p8ZmR/A81P7JGH92Ys0kPzMJxdaPcv9E+6h2b1OMU=
X-Gm-Gg: AYBFou0PzhXZcxEaGnAL2MXmy49afP7vIWl69EOj89medZ2gYp3X+KCnSH3rYJRHqNP
	0CeWEuSPAyn6dp7kSC+8tSRvTdMxMNbOc8qOEnPQUuIK7aOBZ+o+1jgS8Mx8NiASylv1Xw1s57N
	I3O3iWKLECuWXRQyWdqLS9Laz0/kK372BT0UYFYzJu8RtIDtB8QprmsMfFji7ttXM9kOzKJeN2/
	ZA8Ry9wV2AMUVuoD+j8peqzHFi44zPkZf/lgQ/YmSgUjZhurygXf20N4DPzyOJCC2PayQerPcv8
	TxVxLk4euGlnA4cHPi6prbuwjfgtisJ6K0qByrzXK1dROvbu/DipLP04KbMCbua8SUZEwy6OixL
	rSCM5l21Q/AB+r19QhG1JVgGS9P4vGaGbJkIq3DHQa2Oc//Z8oDb3yc1sUFHSi6L3awC3enQRbL
	mvMnrRjJ863J+MWSXyUjfSs9JmjsaTuzJyOIwJTZw+Ww5eBzuGupdp5FKMISjGP8hB9dkoXz1P6
	qc4rbOZ/KUn+sf3+WyXjXXV+xGrpzzhLuD+Gj1GtT28lTG3QgqvQqYPz6DaVROo7SqrLU7Mjdk=
X-Received: by 2002:a05:600c:a07:b0:49c:fc6e:8cb1 with SMTP id 5b1f17b1804b1-49e619bbcefmr66301555e9.21.1789152767378;
        Fri, 11 Sep 2026 11:52:47 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f04b700023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f04:b700:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6af095d7sm14908105e9.0.2026.09.11.11.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:52:46 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: idryomov@gmail.com,
	amarkuze@redhat.com,
	xiubo.li@clyso.com,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] ceph: acquire write lock only if snap trace has really changed
Date: Fri, 11 Sep 2026 20:52:43 +0200
Message-ID: <20260911185244.1420485-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MDS replies and cap imports acquire `snap_rwsem` for writing whenever
they contain a snap trace, even when the cached realm information is
already current.  This causes a lot of lock contention with all
processes writing to Ceph, because check_quota_exceeded() needs a read
lock on `snap_rwsem`.  This not only delays all writing processes, but
also the messenger thread, which adds a lot of latency to all MDS
requests.

This patchs adds a wrapper function for ceph_update_snap_trace() which
acquires a read lock instead of a write lock, parses the new snap
trace and calls ceph_update_snap_trace() with a write-upgraded lock
only if the snap trace has really changed.  This avoids lock
contention almost all of the time.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/ceph/caps.c       |  5 +--
 fs/ceph/mds_client.c | 11 ++----
 fs/ceph/snap.c       | 92 ++++++++++++++++++++++++++++++++++++++++++++
 fs/ceph/super.h      |  3 ++
 4 files changed, 100 insertions(+), 11 deletions(-)

diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
index bcb04c6cb92c..42c59e4c3716 100644
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@ -4578,15 +4578,12 @@ void ceph_handle_caps(struct ceph_mds_session *session,
 	case CEPH_CAP_OP_IMPORT:
 		realm = NULL;
 		if (snaptrace_len) {
-			down_write(&mdsc->snap_rwsem);
-			if (ceph_update_snap_trace(mdsc, snaptrace,
+			if (ceph_handle_snap_trace(mdsc, snaptrace,
 						   snaptrace + snaptrace_len,
 						   false, &realm)) {
-				up_write(&mdsc->snap_rwsem);
 				close_sessions = true;
 				goto done;
 			}
-			downgrade_write(&mdsc->snap_rwsem);
 		} else {
 			down_read(&mdsc->snap_rwsem);
 		}
diff --git a/fs/ceph/mds_client.c b/fs/ceph/mds_client.c
index 085ae0cfb5f7..f94926c520bf 100644
--- a/fs/ceph/mds_client.c
+++ b/fs/ceph/mds_client.c
@@ -4198,19 +4198,16 @@ static void handle_reply(struct ceph_mds_session *session, struct ceph_msg *msg)
 	/* snap trace */
 	realm = NULL;
 	if (rinfo->snapblob_len) {
-		down_write(&mdsc->snap_rwsem);
-		err = ceph_update_snap_trace(mdsc, rinfo->snapblob,
-				rinfo->snapblob + rinfo->snapblob_len,
-				le32_to_cpu(head->op) == CEPH_MDS_OP_RMSNAP,
-				&realm);
+		err = ceph_handle_snap_trace(mdsc, rinfo->snapblob,
+					     rinfo->snapblob + rinfo->snapblob_len,
+					     le32_to_cpu(head->op) == CEPH_MDS_OP_RMSNAP,
+					     &realm);
 		if (err) {
-			up_write(&mdsc->snap_rwsem);
 			close_sessions = true;
 			if (err == -EIO)
 				ceph_msg_dump(msg);
 			goto out_err;
 		}
-		downgrade_write(&mdsc->snap_rwsem);
 	} else {
 		down_read(&mdsc->snap_rwsem);
 	}
diff --git a/fs/ceph/snap.c b/fs/ceph/snap.c
index 9b79a5eaca93..89f4be790583 100644
--- a/fs/ceph/snap.c
+++ b/fs/ceph/snap.c
@@ -932,6 +932,98 @@ int ceph_update_snap_trace(struct ceph_mds_client *mdsc,
 	return err;
 }
 
+/*
+ * Return a referenced first realm only if the entire snap trace can
+ * be consumed without changing the cached topology or snapshot
+ * contexts.
+ *
+ * Caller must lock snap_rwsem for reading.
+ */
+static struct ceph_snap_realm *get_snap_trace_if_unmodified(struct ceph_mds_client *mdsc,
+							    void *p, void *e)
+{
+	struct ceph_snap_realm *first = NULL, *realm;
+	struct ceph_mds_snap_realm *ri;
+	bool empty;
+	u64 num;
+
+	lockdep_assert_held_read(&mdsc->snap_rwsem);
+
+	do {
+		ceph_decode_need(&p, e, sizeof(*ri), call_update);
+		ri = p;
+		p += sizeof(*ri);
+		num = (u64)le32_to_cpu(ri->num_snaps) +
+		      le32_to_cpu(ri->num_prior_parent_snaps);
+		if (num > (e - p) / sizeof(u64))
+			goto call_update;
+		p += num * sizeof(u64);
+
+		realm = __lookup_snap_realm(mdsc, le64_to_cpu(ri->ino));
+		if (!realm || !realm->parent ||
+		    realm->parent->ino != le64_to_cpu(ri->parent) ||
+		    le64_to_cpu(ri->seq) > realm->seq ||
+		    !realm->cached_context)
+			goto call_update;
+		if (!first)
+			first = realm;
+	} while (p < e);
+
+	/* if there are empty realms, ceph_update_snap_trace() should
+	 * be called for its deferred realm cleanup
+	 */
+	spin_lock(&mdsc->snap_empty_lock);
+	empty = list_empty(&mdsc->snap_empty);
+	spin_unlock(&mdsc->snap_empty_lock);
+	if (!empty)
+		goto call_update;
+
+	/* the ceph_update_snap_trace() call can be omitted (and the
+	 * write lock on snap_rwsem is not necessary); acquire a
+	 * reference to the return value
+	 */
+	ceph_get_snap_realm(mdsc, first);
+	return first;
+
+call_update:
+	/* ceph_update_snap_trace() must be called */
+	return NULL;
+}
+
+/*
+ * Wrapper for ceph_update_snap_trace() which acquires snap_rwsem for
+ * writing only if the new snap trace has really changed.
+ *
+ * Caller must not lock snap_rwsem.  Upon successful return,
+ * snap_rwsem is left locked for reading, but is unlocked on error.
+ */
+int ceph_handle_snap_trace(struct ceph_mds_client *mdsc,
+			   void *p, void *e, bool deletion,
+			   struct ceph_snap_realm **realm_ret)
+{
+	int err;
+
+	lockdep_assert_not_held(&mdsc->snap_rwsem);
+
+	*realm_ret = NULL;
+	down_read(&mdsc->snap_rwsem);
+	if (!deletion) {
+		*realm_ret = get_snap_trace_if_unmodified(mdsc, p, e);
+		if (*realm_ret)
+			return 0;
+	}
+	up_read(&mdsc->snap_rwsem);
+
+	/* reparse from the beginning: the topology may change while unlocked */
+	down_write(&mdsc->snap_rwsem);
+	err = ceph_update_snap_trace(mdsc, p, e, deletion, realm_ret);
+	if (err)
+		up_write(&mdsc->snap_rwsem);
+	else
+		downgrade_write(&mdsc->snap_rwsem);
+	return err;
+}
+
 
 /*
  * Send any cap_snaps that are queued for flush.  Try to carry
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index 72d4e30304dc..e5782fbfeeb5 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -1064,6 +1064,9 @@ extern void ceph_put_snap_realm(struct ceph_mds_client *mdsc,
 extern int ceph_update_snap_trace(struct ceph_mds_client *m,
 				  void *p, void *e, bool deletion,
 				  struct ceph_snap_realm **realm_ret);
+int ceph_handle_snap_trace(struct ceph_mds_client *mdsc,
+			   void *p, void *e, bool deletion,
+			   struct ceph_snap_realm **realm_ret);
 void ceph_change_snap_realm(struct inode *inode, struct ceph_snap_realm *realm);
 extern void ceph_handle_snap(struct ceph_mds_client *mdsc,
 			     struct ceph_mds_session *session,
-- 
2.47.3

