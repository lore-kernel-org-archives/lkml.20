Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B824BEE42
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163543; cv=none; b=elyi+Q7jvd9vZiEiv5q2+0nt/+Njg7W6r9IYUjHaz5GDOfGnFjeA/uKNZo4g8rm1DdM0/KSQn7jKcQ6aAv62GjUSk71B0JO1LKMhbFCwtIaOZ6Zdsgvg+BThRLxJqvfpo/lmGObvGvCDMNEjB8ELiJ6E4efzn8OPnfppocMw14Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163543; c=relaxed/simple;
	bh=8fizyRXRwZWA30/x0S5/rc5j+e9AYRKrUbag3/LipDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fyReVv6SJMk6WWR0X5HzOSgFBJenXLfTTN86r6ox8T81tdft1KiQ9uk4/iXZHx/MryiKg9QqvR/r9d7UnAMH+IkiRHpQ5nJ4FGCILJT3oF8Eg2/yrok8NlHzBxAgLQqgsq2dttgaRU5nB0RdYLyZDpOXxKt1+Je/2K9W1P6IsBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJZMqffW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJZMqffW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13701805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789163539; x=1789768339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPdkLtNhMgfXo64yGcGD4Px98Z89kU0OqiOuJ6Ovxxk=;
        b=pJZMqffWPY4jqWhBvkEBwCkiKj/osrGIorH+a0KYmvm6iLC6BQIGknS7iEKvJxHkWD
         d+6cQ6J5jsnW/vLJWfwM3Y+5eg/oZiPMcF4DIe2VfHl8fT+EReEpnOW1MXRrWgZOWvPX
         debaPPZpXc5SZjGUblsLjwXtR9fTlCRVvZjazMs1DbP2OlDyoFdyvRQMlJmuizbNfCwI
         9K/+mShGwWR1tiKT6jeX9EqpO+PTzU0HKg6AClyBHNsLtXynJ+qRKVPYiEMaa/Gd+ilx
         5zw1zDuUcc8fmZHcE0kNEnq4ISaAV0MFLLxxhZHZDehbaKfEj9mBSqehSvaiHFCrfXy4
         qqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163539; x=1789768339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPdkLtNhMgfXo64yGcGD4Px98Z89kU0OqiOuJ6Ovxxk=;
        b=RSD7t6Gwe3Dd1DHFmy+DmSBn5txXHtbHRbDs9odHz92e9TWsSAMf4w0wuUJ74UbE7u
         5io0v5GquZjj7kfXeZYOMrVqHbQEC1FyZXcy/DzkA/fUeB+h1iBkgPPODlvw6YrTrWU6
         atkYgL1PNTIbLYq0gODgn3vrgl/Ok7Fj6pkTHiI77rGSzfXU04ZH1qHRuuSSPZTpuPjd
         I1pmJ+rjWSQ2GOXB4/PJ7R7B+3IhC1u7CkOLtjye/WhhPQ5sLGfnm8iZnX6Vtjqekif0
         ob3GS7bkPKa+yRRatIchQdxzlCzznQ90mLA8KX5fQQfErldw+IdINF5ChDmbEEk8Xstc
         wH0w==
X-Forwarded-Encrypted: i=1; AKwUvBzHOkif7/CcW8XtLVom+xVx4U52uhG54lRQKe77zTqKVpQgH/h+eKvH/U/2Bil4uI/56BmKUC+n9tMveSE=@vger.kernel.org
X-Gm-Message-State: AFuF++mOeaU16gFXEIh7Ay3f1g0VB8drSxRnm0YlfHfj9VxpEniRKKcA
	9XIbtwmiLXD99pxpRSF/rxdzn+DfawnTFPKbXnGonYYZF+L3u0ClUc047bhY5qpZBVs=
X-Gm-Gg: AYBFou2QhR38vUPZCZ84uTj7M+jv9b8UmzpbUGWWuImjZwZw1WfOU5cDzmD/Z/BXtBo
	FrTpr3hO61OPvWQ0Le4cGqV9xU/R2YJoZqgXr0Ad3vUDas6N3oYaAO/vBf0aOVEFdFGnJuInAyY
	ewx8c1ZPd+q3gO4QN7h4qu02oMifGQd9VoyCMPIJAKpCpDmNVLUF8NilBi5dxmpxIbdfDuyTjbP
	3DrALQ0I+Hz1/kyaFXq89oHTPKF4mcc6XJ+VO7O+2FqzTOoW+dMKgBK++MMcUg30D2XZe++8vX1
	ixUX4Er/uDCjVXg/cWnYwC3Poc2UK5NnQuAoZm743oMAfJx0mK10xGrOZCriV6iBgbvTuM994g0
	9hebgsSQnxgAgkcuP64AMnS59lfpu8Jn2Cb7N3OLcSRYQWVhJGmD6LVQ3HD/3BDGDV6NQxVoRyj
	t1p58keRmFBJZwdesWNFrqC9ZBpK76cEaafW4Fc9R9R0hLalbb32znAcBGjWOJgf99niLyrldv3
	dG5TEMqfx+VKu7LcCBtfkQ+
X-Received: by 2002:a05:600c:3b1f:b0:49c:fc89:59cb with SMTP id 5b1f17b1804b1-49e61983468mr75782205e9.5.1789163539317;
        Fri, 11 Sep 2026 14:52:19 -0700 (PDT)
Received: from kali ([169.224.126.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bc5fsm177081345e9.3.2026.09.11.14.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:52:18 -0700 (PDT)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	roopa@nvidia.com,
	bestswngs@gmail.com,
	xmei5@asu.edu,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net v2 1/2] vxlan: report whether vxlan_fdb_update() created the remote
Date: Sat, 12 Sep 2026 00:52:02 +0300
Message-ID: <20260911215203.3054653-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is plumbing only and changes no behaviour on its own.

The rollback added in the next patch has to tell an FDB entry that the
failing request created from one that was already there, and today it
cannot: vxlan_fdb_update() returns 0 in both cases.
vxlan_fdb_append() does return 1 when it links a new remote, but
vxlan_fdb_update_existing() folds that into its local notify flag and
returns 0 regardless, and vxlan_fdb_update_create() returns 0 as well.

Add an optional bool *created out-parameter and set it in both paths.
All six existing callers pass NULL, so nothing observable changes.

Every statement added here is either a signature or argument change or
is guarded by the new flag. tools/testing/selftests/net/
test_vxlan_vnifiltering.sh gives 27 passed and 0 failed with this patch
alone, identical to the base it applies to.

Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
 drivers/net/vxlan/vxlan_core.c      | 29 +++++++++++++++++++----------
 drivers/net/vxlan/vxlan_private.h   |  3 ++-
 drivers/net/vxlan/vxlan_vnifilter.c |  2 +-
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index be95af64a1f5..0652dc471dca 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -974,7 +974,7 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 				     __be16 port, __be32 vni,
 				     __u32 ifindex, __u16 ndm_flags,
 				     struct vxlan_fdb *f, u32 nhid,
-				     bool swdev_notify,
+				     bool swdev_notify, bool *created,
 				     struct netlink_ext_ack *extack)
 {
 	__u16 fdb_flags = (ndm_flags & ~NTF_USE);
@@ -1042,6 +1042,8 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 
 		if (rc < 0)
 			return rc;
+		if (rc && created)
+			*created = true;
 		notify |= rc;
 	}
 
@@ -1078,7 +1080,7 @@ static int vxlan_fdb_update_create(struct vxlan_dev *vxlan,
 				   __u16 state, __u16 flags,
 				   __be16 port, __be32 src_vni, __be32 vni,
 				   __u32 ifindex, __u16 ndm_flags, u32 nhid,
-				   bool swdev_notify,
+				   bool swdev_notify, bool *created,
 				   struct netlink_ext_ack *extack)
 {
 	__u16 fdb_flags = (ndm_flags & ~NTF_USE);
@@ -1101,6 +1103,9 @@ static int vxlan_fdb_update_create(struct vxlan_dev *vxlan,
 	if (rc)
 		goto err_notify;
 
+	if (created)
+		*created = true;
+
 	return 0;
 
 err_notify:
@@ -1114,7 +1119,7 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 		     __u16 state, __u16 flags,
 		     __be16 port, __be32 src_vni, __be32 vni,
 		     __u32 ifindex, __u16 ndm_flags, u32 nhid,
-		     bool swdev_notify,
+		     bool swdev_notify, bool *created,
 		     struct netlink_ext_ack *extack)
 {
 	struct vxlan_fdb *f;
@@ -1129,7 +1134,8 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 
 		return vxlan_fdb_update_existing(vxlan, ip, state, flags, port,
 						 vni, ifindex, ndm_flags, f,
-						 nhid, swdev_notify, extack);
+						 nhid, swdev_notify, created,
+						 extack);
 	} else {
 		if (!(flags & NLM_F_CREATE))
 			return -ENOENT;
@@ -1137,7 +1143,7 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 		return vxlan_fdb_update_create(vxlan, mac, ip, state, flags,
 					       port, src_vni, vni, ifindex,
 					       ndm_flags, nhid, swdev_notify,
-					       extack);
+					       created, extack);
 	}
 }
 
@@ -1275,7 +1281,7 @@ static int vxlan_fdb_add(struct ndmsg *ndm, struct nlattr *tb[],
 	err = vxlan_fdb_update(vxlan, addr, &ip, ndm->ndm_state, flags,
 			       port, src_vni, vni, ifindex,
 			       ndm->ndm_flags | NTF_VXLAN_ADDED_BY_USER,
-			       nhid, true, extack);
+			       nhid, true, NULL, extack);
 	spin_unlock_bh(&vxlan->hash_lock);
 
 	if (!err)
@@ -1491,7 +1497,8 @@ static enum skb_drop_reason vxlan_snoop(struct net_device *dev,
 					 vxlan->cfg.dst_port,
 					 vni,
 					 vxlan->default_dst.remote_vni,
-					 ifindex, NTF_SELF, 0, true, NULL);
+					 ifindex, NTF_SELF, 0, true, NULL,
+					 NULL);
 		spin_unlock(&vxlan->hash_lock);
 	}
 
@@ -4034,7 +4041,8 @@ static int vxlan_dev_create(struct net *net, struct net_device *dev,
 				       dst->remote_vni,
 				       dst->remote_vni,
 				       dst->remote_ifindex,
-				       NTF_SELF, 0, true, extack);
+				       NTF_SELF, 0, true, NULL,
+				       extack);
 		spin_unlock_bh(&vxlan->hash_lock);
 		if (err)
 			goto unlink;
@@ -4485,7 +4493,8 @@ static int vxlan_changelink(struct net_device *dev, struct nlattr *tb[],
 					       vxlan->cfg.dst_port,
 					       conf.vni, conf.vni,
 					       conf.remote_ifindex,
-					       NTF_SELF, 0, true, extack);
+					       NTF_SELF, 0, true, NULL,
+					       extack);
 			if (err) {
 				spin_unlock_bh(&vxlan->hash_lock);
 				netdev_adjacent_change_abort(dst->remote_dev,
@@ -4806,7 +4815,7 @@ vxlan_fdb_external_learn_add(struct net_device *dev,
 			       fdb_info->remote_vni,
 			       fdb_info->remote_ifindex,
 			       NTF_USE | NTF_SELF | NTF_EXT_LEARNED,
-			       0, false, extack);
+			       0, false, NULL, extack);
 	spin_unlock_bh(&vxlan->hash_lock);
 
 	return err;
diff --git a/drivers/net/vxlan/vxlan_private.h b/drivers/net/vxlan/vxlan_private.h
index b1eec2216360..e52755923c31 100644
--- a/drivers/net/vxlan/vxlan_private.h
+++ b/drivers/net/vxlan/vxlan_private.h
@@ -193,7 +193,8 @@ int vxlan_fdb_update(struct vxlan_dev *vxlan,
 		     __u16 state, __u16 flags,
 		     __be16 port, __be32 src_vni, __be32 vni,
 		     __u32 ifindex, __u16 ndm_flags, u32 nhid,
-		     bool swdev_notify, struct netlink_ext_ack *extack);
+		     bool swdev_notify, bool *created,
+		     struct netlink_ext_ack *extack);
 void vxlan_xmit_one(struct sk_buff *skb, struct net_device *dev,
 		    __be32 default_vni, struct vxlan_rdst *rdst, bool did_rsc);
 int vxlan_vni_in_use(struct net *src_net, struct vxlan_dev *vxlan,
diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index dd94085e0886..7e8abc55ef53 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -488,7 +488,7 @@ static int vxlan_update_default_fdb_entry(struct vxlan_dev *vxlan, __be32 vni,
 				       vni,
 				       vni,
 				       dst->remote_ifindex,
-				       NTF_SELF, 0, true, extack);
+				       NTF_SELF, 0, true, NULL, extack);
 		if (err) {
 			spin_unlock_bh(&vxlan->hash_lock);
 			return err;
-- 
2.53.0

