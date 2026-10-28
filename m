Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227646;
	b=0SEOxa3+qheZjpT8qUI0yBkbXa2OdskUYyaTWnHtYgO1mK1xBuvhWv2IB4fa9J9XrK0/
	 34fB+XeK/nk6pBTnTA47qCD0Q93AbH1Td4dsUUGhpQZ17nzh2u+AWRYUf0pPTU0ki1yM/
	 7I8ClTaQP+Lf9yLwqfMq3N/8p6+RxqieX5FSqifetMaFY+1kHUAWXqouVGgaHVwVTEl7q
	 2fQD0mE0xT3nkmG0/CHq/zYzBI1x/pjQSpWq+Ypl2lE3OujpCVV/AsdkAdeA8anmfomvM
	 6nQOwraYVXRCTMGdP4i6V0na4ReJCAPQm3slZHNeI8RyGrhwLPXNIGuhby0IZk7nirg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227646;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=SRTNlA0BEiAJa4iAEMNb1dZOYLiyNZgrHhAip0OfU38=;
	b=qi7nDu16drrnvwM59RZTbE4HCNsTPRvUKpqD0964vdy3BeFOvyQJ1zs7lBI6O61H/4tV
	 gL7PwxK2GAk37JmhcPUJBXf1rxJDyebhRsFqZYjAQZ3nqKOQn+7S0PswX2DY7xlKzvToV
	 HpJCwdmpV8VKklZ2YsSXCSc/U9MClvH9EJ4DuME30LeHu5uh0b+wbpshuvYEExIsc3dUQ
	 cS5n275tB5pkQpxCmGoQMbquRREFw6Kjd99NWtskXwifIkovOuXFf0WdaRhlNhzbUJIc0
	 DajUCHUF8RNOvVv4K8ZMUeZBdqPM94c2c30yb8wZeuvlKHAcJ6TxIZbayCrQit//fBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oJN/7udJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DE4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oJN/7udJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D851F01825;
	Wed, 28 Oct 2026 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793227645;
	bh=SRTNlA0BEiAJa4iAEMNb1dZOYLiyNZgrHhAip0OfU38=;
	h=Date:To:Cc:From:Subject;
	b=oJN/7udJszDQm7TNWVUEVUEXW+CsnkqIt0XekuWejZS0yYLiZ4YERFIxCIaHVpg2C
	 lr564hiMFswqMb/uZdxgz6+USMLGQOpoXVDo1IshfHmuddHxN+DMi81DrnfmMcFhLz
	 xgcxFs3Z6iBMGQ5D/e10W9fytZqs/8WXbh/9rfNP2+EUsZYd4mK8vu62N0g/SBAOWQ
	 z59DqMJRYDsfi4Ee2IfablnytogNC5aofSFelq0cwGvhexCam3Aq+Cy1OWo0ZcOn+0
	 xfqb5guuStuVzHuCGDlC1+iEOUcPPoNtUMvREbkE372NkQDuMzuvDYeXJFYt+Gopbg
	 H5LdG2qRU80yQ==
Message-ID: <2e01b8bf-c327-4b26-8f22-8ceff0f53277@kernel.org>
Date: Wed, 28 Oct 2026 23:47:22 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Heiner Kallweit <hkall@kernel.org>
Subject: [PATCH RESUBMIT] extcon: remove unused support for mutually exclusive
 cables
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

1fe189bfb0fa ("extcon: palmas: Remove the mutually_exclusive array")
removed the last user of the mutually exclusive cable support in 2015.
As no user has shown up in the last 11 yrs, let's drop support for
mutually exclusive cables.

Note: Removing the sysfs attributes is fine as they (incl. directory
"mutually_exclusive") were created only if a user declared
mutually exclusive cables. Means this doesn't break any userspace
application.

This patch is a prerequisite for changing type of device_type::groups
to const struct attribute_group *const *.

Signed-off-by: Heiner Kallweit <hkall@kernel.org>
---
This is a rebased resubmit from March this year, as there was no
feedback at that time.
---
 Documentation/ABI/testing/sysfs-class-extcon |  25 -----
 drivers/extcon/extcon.c                      | 102 -------------------
 drivers/extcon/extcon.h                      |  14 ---
 3 files changed, 141 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-extcon b/Documentation/ABI/testing/sysfs-class-extcon
index f8e705375b2..782505efa0e 100644
--- a/Documentation/ABI/testing/sysfs-class-extcon
+++ b/Documentation/ABI/testing/sysfs-class-extcon
@@ -15,10 +15,6 @@ Description:
 		may have both HDMI and Charger attached, or analog audio,
 		video, and USB cables attached simultaneously.
 
-		If there are cables mutually exclusive with each other,
-		such binary relations may be expressed with extcon_dev's
-		mutually_exclusive array.
-
 What:		/sys/class/extcon/.../name
 Date:		February 2012
 Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
@@ -57,8 +53,6 @@ Description:
 		    # echo 0xHEX > state
 
 		This updates the whole state of the extcon device.
-		Inputs of all the methods are required to meet the
-		mutually_exclusive conditions if they exist.
 
 		It is recommended to use this "global" state interface if
 		you need to set the value atomically. The later state
@@ -80,22 +74,3 @@ Description:
 		state of cable "X" (integer between 0 and 31) of an extcon
 		device. The state value is either 0 (detached) or 1
 		(attached).
-
-What:		/sys/class/extcon/.../mutually_exclusive/...
-Date:		December 2011
-Contact:	MyungJoo Ham <myungjoo.ham@samsung.com>
-Description:
-		Shows the relations of mutually exclusiveness. For example,
-		if the mutually_exclusive array of extcon device is
-		{0x3, 0x5, 0xC, 0x0}, then the output is::
-
-		    # ls mutually_exclusive/
-		    0x3
-		    0x5
-		    0xc
-		    #
-
-		Note that mutually_exclusive is a sub-directory of the extcon
-		device and the file names under the mutually_exclusive
-		directory show the mutually-exclusive sets, not the contents
-		of the files.
diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
index 98d85cc114a..a0bcea0c44e 100644
--- a/drivers/extcon/extcon.c
+++ b/drivers/extcon/extcon.c
@@ -243,26 +243,6 @@ static DEFINE_IDA(extcon_dev_ids);
 static LIST_HEAD(extcon_dev_list);
 static DEFINE_MUTEX(extcon_dev_list_lock);
 
-static int check_mutually_exclusive(struct extcon_dev *edev, u32 new_state)
-{
-	int i;
-
-	if (!edev->mutually_exclusive)
-		return 0;
-
-	for (i = 0; edev->mutually_exclusive[i]; i++) {
-		int weight;
-		u32 correspondants = new_state & edev->mutually_exclusive[i];
-
-		/* calculate the total number of bits set */
-		weight = hweight32(correspondants);
-		if (weight > 1)
-			return i + 1;
-	}
-
-	return 0;
-}
-
 static int find_cable_index_by_id(struct extcon_dev *edev, const unsigned int id)
 {
 	int i;
@@ -558,12 +538,6 @@ int extcon_set_state(struct extcon_dev *edev, unsigned int id, bool state)
 	if (!is_extcon_changed(edev, index, state))
 		goto out;
 
-	if (check_mutually_exclusive(edev,
-		(edev->state & ~BIT(index)) | (state & BIT(index)))) {
-		ret = -EPERM;
-		goto out;
-	}
-
 	/*
 	 * Initialize the value of extcon property before setting
 	 * the detached state for an external connector.
@@ -1037,7 +1011,6 @@ static void extcon_dev_release(struct device *dev)
 {
 }
 
-static const char *muex_name = "mutually_exclusive";
 static void dummy_sysfs_dev_release(struct device *dev)
 {
 }
@@ -1138,59 +1111,6 @@ static int extcon_alloc_cables(struct extcon_dev *edev)
 	return 0;
 }
 
-/**
- * extcon_alloc_muex() - alloc the mutual exclusive for extcon device
- * @edev:	extcon device
- *
- * Returns 0 if success or error number if fail.
- */
-static int extcon_alloc_muex(struct extcon_dev *edev)
-{
-	char *name;
-	int index;
-
-	if (!edev)
-		return -EINVAL;
-
-	if (!(edev->max_supported && edev->mutually_exclusive))
-		return 0;
-
-	/* Count the size of mutually_exclusive array */
-	for (index = 0; edev->mutually_exclusive[index]; index++)
-		;
-
-	edev->attrs_muex = kzalloc_objs(*edev->attrs_muex, index + 1);
-	if (!edev->attrs_muex)
-		return -ENOMEM;
-
-	edev->d_attrs_muex = kzalloc_objs(*edev->d_attrs_muex, index);
-	if (!edev->d_attrs_muex) {
-		kfree(edev->attrs_muex);
-		return -ENOMEM;
-	}
-
-	for (index = 0; edev->mutually_exclusive[index]; index++) {
-		name = kasprintf(GFP_KERNEL, "0x%x",
-				 edev->mutually_exclusive[index]);
-		if (!name) {
-			for (index--; index >= 0; index--)
-				kfree(edev->d_attrs_muex[index].attr.name);
-
-			kfree(edev->d_attrs_muex);
-			kfree(edev->attrs_muex);
-			return -ENOMEM;
-		}
-		sysfs_attr_init(&edev->d_attrs_muex[index].attr);
-		edev->d_attrs_muex[index].attr.name = name;
-		edev->d_attrs_muex[index].attr.mode = 0000;
-		edev->attrs_muex[index] = &edev->d_attrs_muex[index].attr;
-	}
-	edev->attr_g_muex.name = muex_name;
-	edev->attr_g_muex.attrs = edev->attrs_muex;
-
-	return 0;
-}
-
 /**
  * extcon_alloc_groups() - alloc the groups for extcon device
  * @edev:	extcon device
@@ -1218,9 +1138,6 @@ static int extcon_alloc_groups(struct extcon_dev *edev)
 	for (index = 0; index < edev->max_supported; index++)
 		edev->extcon_dev_type.groups[index] = &edev->cables[index].attr_g;
 
-	if (edev->mutually_exclusive)
-		edev->extcon_dev_type.groups[index] = &edev->attr_g_muex;
-
 	edev->dev.type = &edev->extcon_dev_type;
 
 	return 0;
@@ -1280,10 +1197,6 @@ int extcon_dev_register(struct extcon_dev *edev)
 	if (ret < 0)
 		goto err_alloc_cables;
 
-	ret = extcon_alloc_muex(edev);
-	if (ret < 0)
-		goto err_alloc_muex;
-
 	ret = extcon_alloc_groups(edev);
 	if (ret < 0)
 		goto err_alloc_groups;
@@ -1325,13 +1238,6 @@ int extcon_dev_register(struct extcon_dev *edev)
 	if (edev->max_supported)
 		kfree(edev->extcon_dev_type.groups);
 err_alloc_groups:
-	if (edev->max_supported && edev->mutually_exclusive) {
-		for (index = 0; edev->mutually_exclusive[index]; index++)
-			kfree(edev->d_attrs_muex[index].attr.name);
-		kfree(edev->d_attrs_muex);
-		kfree(edev->attrs_muex);
-	}
-err_alloc_muex:
 	for (index = 0; index < edev->max_supported; index++)
 		kfree(edev->cables[index].attr_g.name);
 	if (edev->max_supported)
@@ -1370,14 +1276,6 @@ void extcon_dev_unregister(struct extcon_dev *edev)
 
 	ida_free(&extcon_dev_ids, edev->id);
 
-	if (edev->mutually_exclusive && edev->max_supported) {
-		for (index = 0; edev->mutually_exclusive[index];
-				index++)
-			kfree(edev->d_attrs_muex[index].attr.name);
-		kfree(edev->d_attrs_muex);
-		kfree(edev->attrs_muex);
-	}
-
 	for (index = 0; index < edev->max_supported; index++)
 		kfree(edev->cables[index].attr_g.name);
 
diff --git a/drivers/extcon/extcon.h b/drivers/extcon/extcon.h
index 94618268778..ac87b70830b 100644
--- a/drivers/extcon/extcon.h
+++ b/drivers/extcon/extcon.h
@@ -11,14 +11,6 @@
  * @supported_cable:	Array of supported cable names ending with EXTCON_NONE.
  *			If supported_cable is NULL, cable name related APIs
  *			are disabled.
- * @mutually_exclusive:	Array of mutually exclusive set of cables that cannot
- *			be attached simultaneously. The array should be
- *			ending with 0 or be NULL (no mutually exclusive cables).
- *			For example, if it is {0x7, 0x30, 0}, then,
- *			{0, 1}, {0, 1, 2}, {0, 2}, {1, 2}, or {4, 5} cannot
- *			be attached simulataneously. {0x7, 0} is equivalent to
- *			{0x3, 0x6, 0x5, 0}. If it is {0xFFFFFFFF, 0}, there
- *			can be no simultaneous connections.
  * @dev:		Device of this extcon.
  * @id:			Unique device ID of this extcon.
  * @state:		Attach/detach state of this extcon. Do not provide at
@@ -43,7 +35,6 @@ struct extcon_dev {
 	/* Optional user initializing data */
 	const char *name;
 	const unsigned int *supported_cable;
-	const u32 *mutually_exclusive;
 
 	/* Internal data. Please do not set. */
 	struct device dev;
@@ -58,11 +49,6 @@ struct extcon_dev {
 	/* /sys/class/extcon/.../cable.n/... */
 	struct device_type extcon_dev_type;
 	struct extcon_cable *cables;
-
-	/* /sys/class/extcon/.../mutually_exclusive/... */
-	struct attribute_group attr_g_muex;
-	struct attribute **attrs_muex;
-	struct device_attribute *d_attrs_muex;
 };
 
 #endif /* __LINUX_EXTCON_INTERNAL_H__ */
-- 
2.56.0


