Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27E23A99F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488319; cv=none; b=f8ADdRpEQcOD4hQwf3LwqCR8V0+dvppZ4s+6XAhQt9vlWwg4LJzdEJDCztkwVS3F9+XVKQKYFtCvVk2vzBv/Wfc2sVkwwn54e+uXJDcS+Q4qvQuRv+YIINA13ugHDlagxiN0EY5E+igs7rDS8HWg/n9zk+0VKdU2M1b6DNuHJuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488319; c=relaxed/simple;
	bh=FRPqrWjFyY8r2z5fHKAyvqG4cIdbeM3cFW1CkaYBVZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9HzmjxQz075+Mu0GBdLB/7IFiUPVsqxKMHe7NdWA9vu08wh4/K6jb2xoXCbyGYYZ+yQpoKMMJPg/P/DM/TfY417cSzgh+fRim5t5lTRB23FbmmX+YIowTVg1L7VuHwCqDUKWyWp3cIQ/i6Xi+dmOqzIw7GdBnoOTQo0TU9LDrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkQ6Tuks; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkQ6Tuks"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so4072075e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788488316; x=1789093116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qe1Ijbt6eQH/7oB0vfj//b1olTET1JA9WRRKllb/+o4=;
        b=KkQ6TuksIvny4C1qd7NapDiDz9TXyMLfO4MU2UBDWhwfrz8RZ89vcW9llGR6IPEyzl
         qdY7y1S0/JXBKMPX9mW5mLVJlT0NsxdDqgeZPKbV/TyLYIG7fYDOAEOxpSy166hK6qsp
         QqULOx29XzvMrQMvrlwloTHzRon45yETrT7oa5ZubmQCfrDzfxPOI+SzBTnCWtGVzyW8
         QTe3QYtCajnRcasJyiWwqAl7FgqgXwj9y+4xz+n2IsEooMJnMjXCfQQMUuPZzcDaX2Id
         ovm82iQYiIQNruQkI9JpSmR6reoEYySD+NazTUXUm8qmMQA6GmS7nQ9d1v6GAfH2GyHv
         6yCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488316; x=1789093116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qe1Ijbt6eQH/7oB0vfj//b1olTET1JA9WRRKllb/+o4=;
        b=DzJCXQ6NZzEIlDHv4JFHBOVU8ZLHLx91KxT0BKPHAhfDc+s8WTXcdPRhkv9s61icZa
         a9phH6xuzCNrWpCiZiVdaWs2F3VqRVzFFL9AKX+RwR7uI7c43WWYrUoWgKJ6aV7ey7qx
         DLcFuVjJoPVn25cOJKpPR+bf7v0s+Jwl9ravpIpQV0rx9zbwiRRb4TvL1cUatBwzRGzY
         6XNT3RaM0NqPW0pUNDUFhtRy3dCMMqeN01uL7cfbmpfW2ctT14d26z00lbtf86rGCzS0
         9Q4vJ+1d+KQ12YbKFY9XRbxaxPFvnL1gStMDdE9H5cTaEwPObGG0KfqHIqWLhxVR0SuK
         QPSA==
X-Forwarded-Encrypted: i=1; AKwUvBzhl1lrr/mdVSKaNtTdrmlsFKOuTMeNh2qyk2tI4ih4IRhi7GMGjYsx3p3nLDm7+xMTjkzEzy5R5JWykTY=@vger.kernel.org
X-Gm-Message-State: AFuF++l72Et81zT4WO8T0irJsvx3pwmwL1oNnDSeEgVJVWZMB1bwOr9A
	WDa6++EGKY7dgpfoJhlRELFJClrI/R6SRg3eoJiTd555r7u4/DntifAw
X-Gm-Gg: AYBFou1h16g/vNYsbeVnJT/MbdOsAmgPEBBemlYY2xLudAExRxGsv2aiggcaGgWRQzJ
	RTM05hXbXQ06YsBEw7wAEo97TCdqSxh8h0KwNCfRc0bKLyJoUCTBG5IQd1jVvEqGxhtHyWZEGgZ
	d7ijYGKKiBvuex3VJIzUWDJ9NNthwxVy35it8lNOph0o/sDlsaFVsoUqtR5Tw9mLjfbUEw2SglC
	Q/61hSKqDepUrn8Ao1XtRlvTwEnth8rrDFP8+kiXFD6nLcXUahSAGl/Ag8VPyMJPB1+vp/LdtKE
	yMDLYz6SPPtgyj5risvdSsDAWeVNiaRIV1krZo50pJAL/z53np36nFJ51EuKFk2ZywAfS88uSYC
	HmD4M2wZlEKy3OXzo9UUqHR/bmX3Hbh6qWcDITbra6bZPTtMA+Mqr2FwuociAHpKCqeAhPf+PZa
	5qU93iQR7LoCN/1I3+tIeoO5PyYWHToMamglw2+ZxbS/Ywk/XNby7E9CPSEe9J8PCL4iLo6sXLh
	KIoFGBZJqWinA==
X-Received: by 2002:a05:600c:8519:b0:49c:d27e:8f7c with SMTP id 5b1f17b1804b1-49cf8251111mr31739795e9.12.1788488316195;
        Thu, 03 Sep 2026 19:18:36 -0700 (PDT)
Received: from kali ([169.224.126.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm114646175e9.12.2026.09.03.19.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:18:35 -0700 (PDT)
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
Subject: [PATCH net] vxlan: vnifilter: roll back VNI insertion when the group update fails
Date: Fri,  4 Sep 2026 05:17:07 +0300
Message-ID: <20260904021707.2891129-1-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_vni_add() inserts the new VNI node into the hash table, adds it to
the device list and registers it with the socket before calling
vxlan_vni_update_group(). If that call fails, none of it is undone and
the error is simply returned, so the VNI stays visible in the hash table
and in "bridge vni show" even though the request failed.

Since commit aa6ca1c5c338 ("vxlan: vnifilter: send notification on VNI
add"), vxlan_vnifilter_notify() is also called unconditionally, so
userspace receives an RTM_NEWTUNNEL notification for a VNI whose
creation returned an error.

This needs no special configuration. All VNIs on a device share the same
socket, so once sysctl_igmp_max_memberships multicast groups have been
joined, the next distinct group fails with -ENOBUFS from
ip_mc_join_group(), after the node has already been published:

  ip link add vx0 type vxlan external vnifilter dstport 4789
  ip link set vx0 up
  for i in $(seq 1 21); do
      bridge vni add vni $i group 239.1.1.$i dev vx0
  done

With the default limit of 20, VNI 21 fails with "No buffer space
available" and is nevertheless listed by "bridge vni show".
sysctl_igmp_max_memberships is tunable and per-netns; the first failing
VNI is the limit plus one. The device can be created and configured by
an unprivileged user holding CAP_NET_ADMIN in a network namespace's user
namespace.

Undo the insertion on the error path, mirroring the teardown order of
vxlan_vni_del(), and only notify on success. vxlan_vni_delete_group() is
safe to call regardless of how far vxlan_vni_update_group() got: if it
failed before installing the FDB entry, both vninode->remote_ip and the
default remote_ip are zero and it does nothing. The node has already
been published in the hash table, so it is freed with call_rcu() as
vxlan_vni_del() does, not with vxlan_vni_free().

Tested in a QEMU guest under KASAN and PROVE_LOCKING. Before the change
VNI 21 is listed after failing and a notification is emitted for it;
after the change the table is empty while the add fails with the same
errno at the same VNI, and ftrace confirms vxlan_vni_update_group() is
still reached for all 22 adds, so the failure does not move earlier. A
VNI that joins successfully is still installed and still notified.

Ido Schimmel pointed out this missing rollback while reviewing an
unrelated fix to vxlan_igmp_join() that was not followed up.

Link: https://lore.kernel.org/netdev/20260323095544.3311285-4-bestswngs@gmail.com/
Fixes: f9c4bb0b245c ("vxlan: vni filtering support on collect metadata device")
Cc: Weiming Shi <bestswngs@gmail.com>
Cc: Xiang Mei <xmei5@asu.edu>
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
 drivers/net/vxlan/vxlan_vnifilter.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index dd94085e0886..ef60a96bcf90 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -718,6 +718,8 @@ static void vxlan_vni_free(struct vxlan_vni_node *vninode)
 	kfree(vninode);
 }
 
+static void vxlan_vni_node_rcu_free(struct rcu_head *rcu);
+
 static int vxlan_vni_add(struct vxlan_dev *vxlan,
 			 struct vxlan_vni_group *vg,
 			 u32 vni, union vxlan_addr *group,
@@ -756,9 +758,21 @@ static int vxlan_vni_add(struct vxlan_dev *vxlan,
 
 	err = vxlan_vni_update_group(vxlan, vninode, group, true, &changed,
 				     extack);
+	if (err)
+		goto err_vni_del;
 
 	vxlan_vnifilter_notify(vxlan, vninode, RTM_NEWTUNNEL);
 
+	return 0;
+
+err_vni_del:
+	vxlan_vni_delete_group(vxlan, vninode);
+	rhashtable_remove_fast(&vg->vni_hash, &vninode->vnode,
+			       vxlan_vni_rht_params);
+	__vxlan_vni_del_list(vg, vninode);
+	if (vxlan->dev->flags & IFF_UP)
+		vxlan_vs_add_del_vninode(vxlan, vninode, true);
+	call_rcu(&vninode->rcu, vxlan_vni_node_rcu_free);
 	return err;
 }
 
-- 
2.53.0

