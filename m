Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A4A3DDB01
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788946057; cv=none; b=V/ljVDHniM9Gsf37qtzji2DaxMEEpq/bmkA3dUXgmOXflOpmwSB36+s9Y6sDrIMegDft/3VjvLZ28sDtrluKkHQ8TSWcf2tge6/kUxHhockM4QDM6/6AlGGb2ZUhNLq5f/u6aTJAvoAWsOvVB020n6xE+9xTA5SskDHX5jfe6wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788946057; c=relaxed/simple;
	bh=XNWBIph23mlpOAwkrFz2gQLEt8XxytxPsdwjkMDBWDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WOaEceG6L2fKMV+ujb35t++YJ/2yZ9eSPx1HZbJMj95QiD4/ic5NM0Qb5K43mjwSd3wFo20BZSoACY0nBdrRAl3PaWNxzrI80ehy+CdhJN64k64p9tuJtFQd4IDncgi/vYizupNGAiArAAlFoSA6ZL7xPYAzrNXe7cBNdzjEDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLCQggOf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLCQggOf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482ea739de2so3861141f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788946050; x=1789550850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIc+krKzuLe553b8U04qr19znUhU0RNHQaKuS2T3NkA=;
        b=PLCQggOfmgyok7dQwxkG1j49UZthq2o8Ic6mSzEu3xonOQSv9xc6y5vpnNnjru49JV
         Y+Lex9sAbEMLxTCdlAgDXDwCifkeF1ix7wIDpnKdPva2XLvXd3kxq5kMwDIrwm7Laq65
         DM4QcEY9hQa7Hnl+spthW1Ubj3LzQ0Pdkc5fF9ZY0533GFsHBWbwTGdF7nI7Xz+u6G1I
         DKNrVvYVikG5yighTN2Usli8wU+iQtZK/cdWWcc0AtnzbkOA0EENpZjByy/zFYLZdowo
         reqLdi0/8qqLxxP/9DHzaHVsxneAV5xQshiQkSoboNVhaqJ+tzaGlxneDvVhA/TF5Aw3
         xFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788946050; x=1789550850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oIc+krKzuLe553b8U04qr19znUhU0RNHQaKuS2T3NkA=;
        b=C0fI7N7MUEuWMNgEsej5MmgCdOO+TRAjnhHT4FcCSMrgZZAwq1/yW055kZoBzNuwWm
         F5WzAfKc5mfmoLpfiRiXAOad0UXRy0ePg+cq/d9rP8mO1v36mrjswFkAOTD+jMYhLqHt
         /LTz8C+VpMgOwQdvuLQ+Cc8O0vFJsXWymLEqdkt4Uh2J7a68QA1Vb/YYMuLLgvDq05qn
         Bbd5guaOpQ7iHJlnC26JJdd5287HADv0DL/XBNYZ3j47xXfy2bEz/i+rXXZZAMItVyy4
         PY+d0tzhEwIBn1ZMkjEuEBuNHwQEP7FaQd/IAq9iM59z/EAk53PndHMWqIdaz8lfveMw
         MIrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh3HQpPYxseIhbZKbEj2D53XyypLp4s2GtmJLZseH2H09khyKo5RLvnWjMAumN/ti4gZPEn1e69fB6vmA=@vger.kernel.org
X-Gm-Message-State: AFuF++m7oSqdPK8WbkERio/eBL2xDKcYJUfzNL+7/6hPKPI7PHe5o73e
	D293fC8HE+kaXAWpmXcRTJ/U9Vs+dOv47aO6thUKU68ABfDIXPCDF84j
X-Gm-Gg: AYBFou3SwNpWCkd2oZjZqC/aEGBLTffacApRko5TjoqMf5fvGS3y8COzd4XMyXeuI2u
	WaF5Ui27Kuq4JNvSp+CMN7IRXo72bo+mnSdInpUf6la/nnB4UkzhCDzmmNWrxJOesM0lhcdBsCA
	kHvUeSh+DkkmtNiwEK6P3i7Hqm+vSzoGqJ/bvKOqdvYKkg6nOMh17x9scmQktlBcA7wdso+vGth
	YkgWxdm8Yq9/681OLtJnK4mz6HgRYy+V/fPKc1wL4OMaRM/h3z6jZNaxM9E/nUIUevU2LsiD27q
	YLXY56Kn6e83u1Ig5SHBei2J7njBoiQr7TCMVUhsAwDeM49FDel63UBvzAa8pSuJI4ZwxjA14Gu
	bC0N4SfEY9YJfvL2adYexOzbnGs2csjXpjWiOI3IaWudCz1rck6xrXgORgSU1ah309zVGNpW2FE
	WhwI2qfl9cGu+ybBng7POp0+IEgm2hH9pEwgCbqA2Z9YFzliCI1y6Q8N08mcS4gy9Gqoz6BxNF7
	+VSWQc9QOTgRgPa0IDv4LwDyt8Z56nJ4Ua2
X-Received: by 2002:a05:6000:18a9:b0:485:9211:6560 with SMTP id ffacd0b85a97d-485921165d7mr29788013f8f.25.1788946050163;
        Wed, 09 Sep 2026 02:27:30 -0700 (PDT)
Received: from kali ([169.224.126.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c074asm41558442f8f.23.2026.09.09.02.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:27:29 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net 2/3] vxlan: vnifilter: account VNI node and per-CPU stats to memcg
Date: Wed,  9 Sep 2026 12:26:44 +0300
Message-ID: <20260909092645.3105263-3-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909092645.3105263-1-alishmery18@gmail.com>
References: <20260907141001.GA708129@shredder>
 <20260909092645.3105263-1-alishmery18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vxlan_vni_alloc() allocates a struct vxlan_vni_node and a per-CPU stats
block for every VNI, both with plain GFP_KERNEL. Neither carries
__GFP_ACCOUNT, so the memory is not charged to the cgroup of the process
that asked for it.

With the range of a single request now capped, one message can no longer
exhaust memory on its own. This is no longer the primary defence, but it
still matters: nothing limits how many capped requests a task may issue,
so an unprivileged user in a user+network namespace can still accumulate
an arbitrary number of VNIs, 4096 at a time, and none of it is charged
to them.

Per VNI the add path allocates 128 bytes of slab, an exact fit in
kmalloc-128 and measured at exactly 1.000 objects per VNI, plus 64 bytes
per possible CPU for the stats block. The per-CPU term is the one that
grows: 256 bytes per VNI on a 2-CPU host, but 4.2 KB per VNI on a
64-CPU one.

Charging both allocations confines the damage to the caller's cgroup.
The kill becomes CONSTRAINT_MEMCG with oom_memcg set to that cgroup,
memory.stat attributes both the slab and the percpu bytes to it, and the
host survives what previously took it down.

One limitation is worth stating plainly: try_charge() reclaims and then
invokes the memcg OOM killer rather than returning -ENOMEM, so the
request does not fail gracefully, the caller is killed. Accounting
confines the blast radius, it does not turn this into a clean error.

For a caller not under a memcg limit there is no change. With no limit
set, the same workload installs the same number of VNIs to within 0.4%,
fails at the same point, and a bounded add of 1,000,000 VNIs costs an
identical 128 bytes of slab and 64 bytes per CPU. The objects simply
move from kmalloc-128 to kmalloc-cg-128.

Conditions to recreate the bug:
- CONFIG_VXLAN, CONFIG_MEMCG.
- Unprivileged user in a fresh user+network namespace (unshare -Urn),
  or root with CAP_NET_ADMIN.
- Create a vnifilter-enabled vxlan device and add VNIs in a loop
  (e.g. ip link add vx0 type vxlan external vnifilter dstport 4789,
  then repeated bridge vni add ... commands) while watching a
  memcg-limited cgroup: system slab and percpu grow far faster than
  memory.current, pinning kernel memory outside memcg charging.

Fixes: f9c4bb0b245c ("vxlan: vni filtering support on collect metadata device")
Assisted-by: LLM
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
 drivers/net/vxlan/vxlan_vnifilter.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index f18ce0e1e741..3d6718ec3f55 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -703,10 +703,11 @@ static struct vxlan_vni_node *vxlan_vni_alloc(struct vxlan_dev *vxlan,
 {
 	struct vxlan_vni_node *vninode;
 
-	vninode = kzalloc_obj(*vninode);
+	vninode = kzalloc_obj(*vninode, GFP_KERNEL_ACCOUNT);
 	if (!vninode)
 		return NULL;
-	vninode->stats = netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu);
+	vninode->stats = __netdev_alloc_pcpu_stats(struct vxlan_vni_stats_pcpu,
+						   GFP_KERNEL_ACCOUNT);
 	if (!vninode->stats) {
 		kfree(vninode);
 		return NULL;
-- 
2.53.0

