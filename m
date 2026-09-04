Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C350424D65
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518688; cv=none; b=mj8TdpDydN226+xEzwOG5ghairFykd33ZHgBsFT6Wt1G5WJQunMONkJNDK4NzFjX8rRahigrZUrUWvMl04Im726QWXK9WKF148R0nmJMkRkhvaRhrVNYSsIRAM3vfpxDL0WMmRCxn0AOhMyz7vtBWqGsdYcWYMlyXYrfT/+Ikjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518688; c=relaxed/simple;
	bh=aCZI/bKF4IfBOjZomgaf4OVJCx79HLjieFqaXmTmwRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AMdG1VDLCldYfELyVubH5LV8praXlpta5FdNYOdGEaT3ERxF3fa+u22CoSzHSNPAjPcecTwFqlHCbKCRnfBVRoIfd2geCixHOma9v9FW0NneLm6l+M+X8XQ5TAUd9dWMAujSUExvTQu5e3YK4lMShsSTtJ4DiBHqrgL0V1iJJDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iH8lo16p; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iH8lo16p"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d5335cf904so7980985ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518686; x=1789123486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2oylo4lO8YGRmOoQjP9bx3ZB6WFdgtp12zD5Jx2P20=;
        b=iH8lo16pdfzuQdvaZ+PRN0qXDm6/l2+HG6qUuiZNud3A5Xe4MOeQC9wddZfYky37Z8
         8pj7FhGLy3fyGTe1XAbEwwRpLqVSudAFU33LZV3f5FQu35H4uDDEDfXJApqAYM9BkmK6
         XhIoUMApBx7y5aSt//NFgWyi+3enqZ5MqPmKDDHLDovKQFLg8soYXZz/Lrmo72DLsaiC
         ZYK+OJEC9ODiKiB2wsaWxFq/HEJWLsApnsm7erABP8y2OSSWOXw9EPUSvny+Wl+Mx8se
         gf5hSetHhky9nmmM4OU9ZLHIKdNbCqkxIACTgD9SW0zCWWKTl1dzpdPeTqAVYKK1aCau
         9Mxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518686; x=1789123486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2oylo4lO8YGRmOoQjP9bx3ZB6WFdgtp12zD5Jx2P20=;
        b=dUt5rjXRBDI5o7pXnmSyis7b7JrtQMxgIGOcyttqJuA/IPUULouO+N0tewbPPXAj1N
         TjDbL/qGUDlZ5f9wMROa81X1PY4dqUN803znr6wwCyokDmWwwtcVj9RlXuhi8UFfE5ev
         zAhjAFa2N3ob/eHdAQ81XV/NBVMU5MOy4tRwiP9apUcJ+sesI1O7P1kZM+hMos74mFcb
         07WkY+1jCpUZlfaL6uUPGnm7f+a7kyGfvShH5UCuQ7YNQU3XOxiGI387xPYaAryBDXQP
         mjUIRA0wbKdhrbjEQKwGRaebL0r4DtHxGaqzv/NHbovBhb61R75X6JLAo54us9QOtzoY
         br4Q==
X-Gm-Message-State: AFuF++m2EL41NVYlleGvJ1VJHN2zwu6tkzwg71ce7inaTfJEeeWQyaqd
	vgiDn2Cd4Xla6yi0XzgO7PVtViBpfxIlGHW+bzgBolxAyVXjd254TyxZ
X-Gm-Gg: AYBFou1ZoikFeAidxeoav6l8sK2msErAOEGZqxwzZviDdqpnw6AX//7yUYW4dPRo1kL
	disGZV1fOU9PXREOdGRHqHbs6vfi4rrbQNPqguvqR2ml8kxyJOdFhyulNVRKx4AVf/fy2WEzy5r
	vsKyicMhhINZ5Lgn5tsLn77ZD6pVeJEgqpycyURRoMKWyM3HF7Z5mw+OzUYhMzgJ0T1nNodi8BC
	neeU18RlJ58kPdkxSkHVG3dVLTLXhXG9C9xRnrqiwAszvStlnr9/xSPjbsxZltBDuN3CFiYUt4H
	vnKVHZVVMzF6XtUQv3XO8Mroep+XCQ6uCYJyJwoem++InP3PPEJEkCsEwqvx5KPcGjeH6LS3GeQ
	BCajdUfTQRrj9yB/rjhezSC6qJ20Qeku/K6EVImBNNFmkeXT35i3taRftxMtHQyOaZf4SyWL5tA
	50vtdUj5JUwsaPLIH73u92Pobueru0Thv5TdU7QjXbF++aE/isSen1qQ0M/9vELRqOr8JHLpihq
	WQrBkZDWBwsuhU=
X-Received: by 2002:a17:903:704:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2db128764acmr53818985ad.17.1788518686191;
        Fri, 04 Sep 2026 03:44:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm5064676eec.9.2026.09.04.03.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:44:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH] vdpa: fix typos in comments
Date: Fri,  4 Sep 2026 16:14:38 +0530
Message-ID: <20260904104440.18772-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/vdpa/alibaba/eni_vdpa.c | 2 +-
 include/uapi/linux/virtio_net.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
index fd6fdba46094..6bb5f6ef57cf 100644
--- a/drivers/vdpa/alibaba/eni_vdpa.c
+++ b/drivers/vdpa/alibaba/eni_vdpa.c
@@ -273,7 +273,7 @@ static int eni_vdpa_set_vq_state(struct vdpa_device *vdpa, u16 qid,
 	struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
 	const struct vdpa_vq_state_split *split = &state->split;
 
-	/* ENI is build upon virtio-pci specfication which not support
+	/* ENI is build upon virtio-pci specification which not support
 	 * to set state of virtqueue. But if the state is equal to the
 	 * device initial state by chance, we can let it go.
 	 */
diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 1db45b01532b..4a458ebb2567 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -316,7 +316,7 @@ struct virtio_net_ctrl_mac {
  * Control link announce acknowledgement
  *
  * The command VIRTIO_NET_CTRL_ANNOUNCE_ACK is used to indicate that
- * driver has recevied the notification; device would clear the
+ * driver has received the notification; device would clear the
  * VIRTIO_NET_S_ANNOUNCE bit in the status field after it receives
  * this command.
  */
-- 
2.48.1

