Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738646;
	b=DPg19RjXNLCv19v0DIGppwDED9I7UJ4NN4U1NQG8+MsvKYvhQC4+uRV3GSKKcL0BJWpV
	 Kb9jj1Jnpr0Y0A3LIzz9eqCdpXF2PesGmLoHMwicpxKfZ9rn56kEfzDP9MlR82G9T1X7U
	 Ah1FNtui/XEcYRmpukY8+jI51EQq0Y/OliSzD0hFmYKv2hU0KJsqivLM1PQoTO/q4HBz7
	 kbm1OnQtTiOe13Nx8spr9JpMuXymCZtXp6PxM4T8RUNO6Z/3NHCbDxAROPIGDEuo+tY5y
	 zTGkLg2irlGSF3R1TranCtNWNbzcC8I6oUuFAJxCMUM/h3IIooC05jujcNdXboxPQyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HMTH4x6eTSleI4AiB941ha5PbgS09yPkxgROP6geXTQ=;
	b=zVseku80dOFD9XllT599AO3Wbugr6AlIGYvSihNsXKEYT21GvummkVkcdxVLFBXXxOqP
	 IpzphkhxRbMMJqyDb23bt4kyosG/OEM5IigCVHWxG3Rmz23IchDoezQwmflRzemneV7iN
	 UQQ9J7FTybkVbF3m0uIBIBoPTtA89eLAQX6RUprxsA+ziRVfnfy6v58/fIcQsCFR1yvyP
	 ItbSrGmXwq4FK1vGYW7hrS7aCd0cohaaXmNg9mlCn59pckcNZC0N5qebw67tCzvMTzbsm
	 TpIT86anII09nLgfTQKIPcBvzYQ0SDaP4LElZK9g5nYSVnUsaVM9p4sbYjxwEu0pY2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QddDeYvC;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E9606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551E9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QddDeYvC
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e7e742a2c7so3254595ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738646; x=1793343446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMTH4x6eTSleI4AiB941ha5PbgS09yPkxgROP6geXTQ=;
        b=QddDeYvC6zT+8ODACTfCmtzHASYhq8b+lj4PQYlhmebJrr+pY2oiwdFzPYNU0hGk9N
         KxxJHfT5ZxUOD3xMG38pKHQV4kV+Mjwh7gJFXIGTrAKMeIf5x4vm+cdrI5E9XO5uqJV3
         mJPRlPkRpzzAb9rcYeXSzRWYHemGlAiDQjgr4vwSBUp+gH0sZtjq6qPGbgTYhFXgAkT8
         ci2dLY6Q8qzGhI4ut8t0OGoSAuyQ9phX4ec1XcVsdKb3VJ/JismtFxIZYj3fbjM8ITJi
         llQ2UWTCpPuVJEysQMXMgi6j21rfxrUBoJTrKWyPB+ZjlYLXHv6Ji27yvlUado/aICo/
         imWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738646; x=1793343446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMTH4x6eTSleI4AiB941ha5PbgS09yPkxgROP6geXTQ=;
        b=OvhnedYdoxSvZVYfkI/oOcnugiv+k10ObK76oKJnroG2c5V7i8Lzlhj7svGlcdg4sx
         9EuPAiyd3992+j1OSJ5GBLzJfy7e8qMprAfL9oaI3WsJ6DiDJpAbcU+U5JtlhzCrrYWw
         H8za6ecFElnsBbgASfXhhgIdCsn4eobCu09L7LiWzfrbi7tw/VGJOpzmvgAVqlmWE4gn
         pmxvgYA5q+t4GoTBEsZwMTj8vPJho736pjZG5o+YGxNP7pNSL/4e8Ypm/n+QChsAM+wa
         V5Xixb59K7u9VlJedwjEg8/f3wqeOiaNTDXCAhTcRPMeKEeYzAbuskjAQ/6T3SDEGEA2
         KGlg==
X-Forwarded-Encrypted: i=1; AKwUvBxHf/AHERuXSr8UuxQlAdDjesThw0FkUVW8fx88zRbI9+Eb+QbA2gVoU4c5TI4eVu/1sL7MktToVlEDREQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKn4t2Fw9P0wTwAk75U/O022VVRKcJouNXBNP+zTS6Fox9MY/vM
	lKwolWmMCz8W407YWiR+6N1RMRUUIt2PC5tx3X9eaBClDgNVFeXy7qy4
X-Gm-Gg: AYBFou3z5nZ8nhwvrJGedUT+9mnEVXEbnwlRlXCDz+Dj1q8Y+kG80CQ0yelng5viIpd
	H7WbICC8ZJ+CQE5YQ4D7300xoghr2GiRvT+skKm1OBuv6w3hViRJFtqcBrS+x8iJVjsTeCuRGDx
	JLxrEcy+ZZt2/Naw3aB8/LBpFl8wqqR/GwL/uTJ6u09OYTPzs4hEtvwhYWoymaKL7mAFG5h/GIg
	+rNHt2giaBqawlk7+SwGVKGHSvmWIOboaaaZgzuUh/+027cqztqCzp7KsYtBRAjMuRzY6Gjx7Lb
	n14S75Pmu08nuyBbbqxVa3YU+UD+8nCOTE3NYU8XUeb31E30YEnDabEQt+vU255EAwpyQBVzsoG
	CD/hFhQ98WMkU1zPs4+1A7a9neeovDHDW3bgySinABX2gD0QOqKCYsxzcKeSjCN5wvKWtszyai8
	7u77aSVqvQovuOGtaY55enNMKFmIeTGGe0VGKUOEXe+9NdwqMMCGZCDqmY2LxgYdBIkW1wSQVkQ
	vxPR+T1md1ugY/bho5lAZelLxQahPgZL0KQmt1S6cZtWlz88QvGgQHBX8Ixg0czXMFZfyQEgcM=
X-Received: by 2002:a17:902:da81:b0:2e9:6333:fba8 with SMTP id d9443c01a7336-2ea7c2bc159mr10474315ad.16.1792738645512;
        Thu, 22 Oct 2026 23:57:25 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b3bdae8sm6527545ad.52.2026.10.22.23.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:57:25 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] iommu: Guard iommu_group_first_dev() against an empty device list
Date: Fri, 23 Oct 2026 14:57:05 +0800
Message-Id: <20261023065705.2854692-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wang Haoran <haoranwangsec@gmail.com>

iommu_group_first_dev() calls list_first_entry(&group->devices, ...) and
immediately dereferences the result with ->dev, without checking whether
the group's device list is empty. list_first_entry() does not return NULL
on an empty list: it returns container_of() applied to the list head,
i.e. a non-NULL wild pointer pointing at &group->devices itself. Since
"list" is at offset 0 in struct group_device, the ->dev read then lands
on whatever struct iommu_group fields happen to follow the list head,
yielding a garbage struct device pointer that the callers
(__iommu_group_alloc_default_domain(), iommu_group_alloc_default_domain(),
__iommu_attach_group(), __iommu_group_alloc_blocking_domain()) go on to
dereference, e.g. via dev_iommu_ops() -> dev->iommu->ops, resulting in a
page fault / kernel oops. An empty group is a legitimate end state: the
list becomes empty when the group's last device is removed under
group->mutex, and nothing in the helper itself prevents it from being
called on such a group. Note that the sibling helper
iommu_group_for_each_dev() in the same file iterates the very same list
with the empty-safe list_for_each_entry(), which suggests the missing
guard here is an oversight rather than a deliberate design. This
potential issue was found during a code audit.

Fix this by making iommu_group_first_dev() return NULL when the device
list is empty - which is the semantically correct answer for "the group
has no devices" - and by teaching all four callers to handle NULL:
__iommu_group_alloc_default_domain() and iommu_group_alloc_default_domain()
return ERR_PTR(-ENODEV), while __iommu_attach_group() and
__iommu_group_alloc_blocking_domain() return -ENODEV, consistent with the
existing error handling in each function. Behaviour on non-empty groups
is unchanged.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/iommu/iommu.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index cd1bca7ed..5f26785bb 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1386,6 +1386,8 @@ EXPORT_SYMBOL_GPL(iommu_group_mutex_assert);
 static struct device *iommu_group_first_dev(struct iommu_group *group)
 {
 	lockdep_assert_held(&group->mutex);
+	if (list_empty(&group->devices))
+		return NULL;
 	return list_first_entry(&group->devices, struct group_device, list)->dev;
 }
 
@@ -1723,6 +1725,9 @@ __iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	struct device *dev = iommu_group_first_dev(group);
 	struct iommu_domain *dom;
 
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+
 	if (group->default_domain && group->default_domain->type == req_type)
 		return group->default_domain;
 
@@ -1757,11 +1762,16 @@ __iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	const struct iommu_ops *ops = dev_iommu_ops(iommu_group_first_dev(group));
+	struct device *dev = iommu_group_first_dev(group);
+	const struct iommu_ops *ops;
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
 
+	if (!dev)
+		return ERR_PTR(-ENODEV);
+	ops = dev_iommu_ops(dev);
+
 	/*
 	 * Allow legacy drivers to specify the domain that will be the default
 	 * domain. This should always be either an IDENTITY/BLOCKED/PLATFORM
@@ -2362,6 +2372,8 @@ static int __iommu_attach_group(struct iommu_domain *domain,
 		return -EBUSY;
 
 	dev = iommu_group_first_dev(group);
+	if (!dev)
+		return -ENODEV;
 	if (!dev_has_iommu(dev) ||
 	    !domain_iommu_ops_compatible(dev_iommu_ops(dev), domain))
 		return -EINVAL;
@@ -3369,9 +3381,13 @@ void iommu_device_unuse_default_domain(struct device *dev)
 static int __iommu_group_alloc_blocking_domain(struct iommu_group *group)
 {
 	struct device *dev = iommu_group_first_dev(group);
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
+	const struct iommu_ops *ops;
 	struct iommu_domain *domain;
 
+	if (!dev)
+		return -ENODEV;
+	ops = dev_iommu_ops(dev);
+
 	if (group->blocking_domain)
 		return 0;
 
-- 
2.30.2

