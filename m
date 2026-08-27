Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6135342122A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787852124; cv=none; b=rbFdZgKE3ptREgPp7jGnQ6IfJtRiAp3T82URFYSMfN7B289G0jc773UajdwGqZ0ioozMN23kXat9ReOpDQgEh3eNPL9D0Zx50IlUparkW7d4fkQU9wdYj/IVh+iDOfVhiFKrIbS/0g1za9usOU3wNwemHWShjKXzbjrExjI9qwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787852124; c=relaxed/simple;
	bh=w71Et5wpQCMNemYcecfDHqCh0RM4Z1TQVLm/oPzTJ/Y=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nPnQ0rvWqzN1aD87XPTz8cuIbeHTuVwlfJgCyoQNRa72O9BDcFr8zabVgXtngT+KKqt2D7nYA5w/u7G7rjlChnPj9qvXHvQ2E3YEfxqrjRiDzRSJUNWO4fzDgcNGX+fE3BWSVdb5a6cXopIFrUe2OL1uXedNq+jAoTwjHDkRqVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Frtesjwr; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Frtesjwr"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so216268a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787852121; x=1788456921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6i2GuB52vsi1dvGmgIuAll9oKdxoOK0J1vulbgdbfqA=;
        b=FrtesjwrL7rgKwjZAn/iQFQS7D3vdK+SGjoK/uhIs6mE/uHiEPmO+pgz5DY501LQdQ
         kWmAZ0UgLDMbLzu75Y0+Qz8cwpivfKtdk4nlbgNKSQvORXwy9ukzi7i3oXJ8IOhehKmN
         vqLRGYN5BZ2OfuKQhIa+uDYrSagdmu4ZKrP36ktKQwU/OCrvmVP2uA1YBDo34P8IbY2B
         EWYwNxd6W2w4fQUepKM+i7QqXNQrbfx2DRYd3PIDmoBIt4fWWmJ09m6qEWLMrZU81kM+
         tKfZtHKGKlYhcMrjA3Z4hr9KgeVzKwu6Pa+y3tbFlBgX9UMNjneJ8Wo6SnGmZD3ZnDNA
         ltzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787852121; x=1788456921;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6i2GuB52vsi1dvGmgIuAll9oKdxoOK0J1vulbgdbfqA=;
        b=JG1JH0lq+lJvBvIpSBi31LdBSJfd7waOQFLxh2o38LbbO99SJZH8cGQxR0+QRJakjp
         8oKUoMKt3HAVE53MVk35bATkh5WS7YiAlOvd2aPAO1nvqRaInJp2RGcyNNJ+cpSiWTdj
         LffuyGw6y/YgoPxUKpXBHKdpuz4YD8xyYXO9LRUWN0nSJ68WxrWd8AQle6AR31f7qKGV
         RPwZZKTr/WYECMmTb0HDlM8RkIjrvpVTsphIadxKAraeH6dJp4tEwYEVr0eagLcQqU4S
         d1EtSNZwNyT7V8sz7rLrUCn8Z3plaEtKPY2va6q6riuF40XwYn1rdn1GE8mpQS1x5it/
         id0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpxsQVuVjbIGyaCJa+iZhOgy0ZlSiKN3yuDG5fziZEczyaVohX2bEYPtI52dZq1CTr7yQn35b2XZayO5Mk=@vger.kernel.org
X-Gm-Message-State: AFuF++leHktXx5tkbDn2djucjIGNYA3z5u6Lne6SMBnc8fzwb9S03KJa
	lh0gu7EgrNG6LHFkqAS00MINhqn2Ln5gz1OsX9AQcidoq2Zs7aT/aND7VzBPoCva9vKxok7wUp0
	zIn4tnD0gYq1yEA==
X-Received: from pjbpb6.prod.google.com ([2002:a17:90b:3c06:b0:38f:659:4491])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:530c:b0:381:1c96:829b with SMTP id 98e67ed59e1d1-396d0d4c43amr1737954a91.3.1787852121369;
 Thu, 27 Aug 2026 10:35:21 -0700 (PDT)
Date: Thu, 27 Aug 2026 17:35:11 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827173511.2322549-1-dmatlack@google.com>
Subject: [PATCH] iommu: Introduce reset_mutex to avoid circular locking dependency
From: David Matlack <dmatlack@google.com>
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Joerg Roedel <joerg.roedel@amd.com>, 
	Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	David Matlack <dmatlack@google.com>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Introduce a dedicated reset_mutex inside struct iommu_group to serialize
device reset operations and domain resetting state without acquiring
group->mutex.

Commit f5b16b802174 ("PCI: Suspend iommu function prior to resetting a
device") introduced pci_dev_reset_iommu_prepare() and
pci_dev_reset_iommu_done(), which acquire group->mutex during PCI device
resets. In drivers such as VFIO, device reset handlers (e.g.
pci_try_reset_function()) are executed while holding driver locks such
as vdev->memory_lock.

This introduces a circular locking dependency that can lead to tasks
being permanently stuck in a deadlock:

[vdev->memory_lock]  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
(1. VFIO Reset)=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80>  [io=
mmu_group->mutex]
         =E2=96=B2
         =E2=94=82                                                    =E2=
=94=82
 (3. VFIO BAR Page Fault)                                    ... [*]
         =E2=94=82                                                    =E2=
=94=82
         =E2=94=82                                                    =E2=
=94=82
         =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  [mm->mmap_lock]  <=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=98

Fix this by using group->reset_mutex instead of group->mutex in
pci_dev_reset_iommu_prepare() and pci_dev_reset_iommu_done(). To ensure
other iommu_group operations stay properly synchronized with resets,
also take group->reset_mutex when checking group->recovery_cnt.

[*] The iommu_group->mutex --> mm->mmap_lock dependency was reported as
a transitive chain: iommu_group->mutex --> cpu_hotplug_lock -->
i_mutex_dir_key --> mm->mmap_lock.

Reported-by: Vipin Sharma <vipinsh@google.com>
Closes: https://lore.kernel.org/kvm/20260821193502.92431-1-vipinsh@google.c=
om/
Fixes: f5b16b802174 ("PCI: Suspend iommu function prior to resetting a devi=
ce")
Signed-off-by: David Matlack <dmatlack@google.com>
---
Cc: Alex Williamson <alex@shazbot.org>

 drivers/iommu/iommu.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..29e63697211f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -56,6 +56,7 @@ struct iommu_group {
 	struct list_head devices;
 	struct xarray pasid_array;
 	struct mutex mutex;
+	struct mutex reset_mutex;
 	void *iommu_data;
 	void (*iommu_data_release)(void *iommu_data);
 	char *name;
@@ -1080,6 +1081,7 @@ struct iommu_group *iommu_group_alloc(void)
=20
 	group->kobj.kset =3D iommu_group_kset;
 	mutex_init(&group->mutex);
+	mutex_init(&group->reset_mutex);
 	INIT_LIST_HEAD(&group->devices);
 	INIT_LIST_HEAD(&group->entry);
 	xa_init(&group->pasid_array);
@@ -2476,6 +2478,7 @@ static int __iommu_group_set_domain_internal(struct i=
ommu_group *group,
 	 * pci_dev_reset_iommu_done() attaches the device to group->domain, if
 	 * IOMMU_SET_DOMAIN_MUST_SUCCEED is not set.
 	 */
+	guard(mutex)(&group->reset_mutex);
 	if (group->recovery_cnt && !(flags & IOMMU_SET_DOMAIN_MUST_SUCCEED))
 		return -EBUSY;
=20
@@ -3652,6 +3655,7 @@ int iommu_attach_device_pasid(struct iommu_domain *do=
main,
 	 * This is a concurrent attach during device recovery. Reject it until
 	 * pci_dev_reset_iommu_done() attaches the device to group->domain.
 	 */
+	guard(mutex)(&group->reset_mutex);
 	if (group->recovery_cnt) {
 		ret =3D -EBUSY;
 		goto out_unlock;
@@ -3745,6 +3749,7 @@ int iommu_replace_device_pasid(struct iommu_domain *d=
omain,
 	 * This is a concurrent attach during device recovery. Reject it until
 	 * pci_dev_reset_iommu_done() attaches the device to group->domain.
 	 */
+	guard(mutex)(&group->reset_mutex);
 	if (group->recovery_cnt) {
 		ret =3D -EBUSY;
 		goto out_unlock;
@@ -4042,7 +4047,7 @@ int pci_dev_reset_iommu_prepare(struct pci_dev *pdev)
 	if (!pci_ats_supported(pdev) || !dev_has_iommu(&pdev->dev))
 		return 0;
=20
-	guard(mutex)(&group->mutex);
+	guard(mutex)(&group->reset_mutex);
=20
 	gdev =3D __dev_to_gdev(&pdev->dev);
 	if (WARN_ON(!gdev))
@@ -4153,7 +4158,7 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
 	if (!pci_ats_supported(pdev) || !dev_has_iommu(&pdev->dev))
 		return;
=20
-	guard(mutex)(&group->mutex);
+	guard(mutex)(&group->reset_mutex);
=20
 	gdev =3D __dev_to_gdev(&pdev->dev);
 	if (WARN_ON(!gdev))

base-commit: 37ffa24c9d07edcd414d34283e02af3f3866cf12
--=20
2.55.0.897.gb25b4bd76c-goog

