Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809C2488209
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936059; cv=none; b=SH0MDBuUfzBpI6EcxEJguPk6wEMW+s83ZNmP4wBSRu1Bc293UvCkEKopMw1gkQmhdoaRUyWDYGTRb9B4Bt23hdeUmOaZ1nzXaKWJRzLTQ150xPMPHy1uO3qCQWES0y1VR7StuD0EY95MrPP0NPz9H4tSiJcdgP4Hgx3VfE3edhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936059; c=relaxed/simple;
	bh=qmqJ22Insbjm6Dsp1Q/74HB1aMHmOBjBTuZsPO4cB4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJeQBaNUIWr8ME4nU79MCvIF3SLoQoCnl+fTNneyO31cLhEKKgGNsf00I+RETWnsvZOMc1SLf7at8eZBem2WiATn/4H5wcJ8+s2ni/vVCDngBMKEHcmIbT0NMtCKvD5dctBvdAHAQMaX5vY5ubFzifAHOQA5jUD2/mMokfXWVlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mr6ENH9S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mr6ENH9S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538B91F00893;
	Fri,  2 Oct 2026 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790936058;
	bh=McCs6DMamKRuXTJSP7raTicLb5h5rSIArXo0pM8nXE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mr6ENH9SI2HUhtJltAu8lCMZMfGjE8lUoGQx6Bdmp1A8PCFMQIKZ0E7viXStaL0dk
	 81Qm6nDi9Hu4hsZkia7fpjbUoF9RDiDew9zIZ6jJPOr3f7tlkGlFHhP1PclxJuhzIr
	 ZfjS+yYicXnEZmXVmpzrXrcIkV8tIvdvW4dRcJ0975eon+go8bsh+9f1zvavTqyvAY
	 nJEFHqzi3WZsVFMdqt6ktSUEbrkMa01nbR3+p/V6ZoPyPGCrGMOFLCjbTzmnRJG/7M
	 d6mmcvnWX22tll7unQ7q4edQEfI3Jhw/TMkpYKbIiYhNDLeY53kQ5twnVxfOeunKTv
	 zyznfDgtuZwzw==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 5/9] nvmem: layouts: Support fixed-layout as the nvmem device node itself
Date: Fri,  2 Oct 2026 11:13:48 +0100
Message-ID: <20261002101352.1084447-6-srini@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002101352.1084447-1-srini@kernel.org>
References: <20261002101352.1084447-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Loic Poulain <loic.poulain@oss.qualcomm.com>

of_nvmem_layout_get_container() only looks for a child node named
"nvmem-layout" to locate the cell definitions. This does not cover
providers whose device tree node is itself the fixed-layout container,
such as an eMMC boot partition block device whose fwnode points directly
at a "fixed-layout" compatible partitions node.

When no "nvmem-layout" child is present, fall back to returning the nvmem
device node itself if it is compatible with "fixed-layout", so that its
cells are parsed by nvmem_add_cells_from_fixed_layout().

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 drivers/nvmem/layouts.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
index 07a34be9669c..409909e3244f 100644
--- a/drivers/nvmem/layouts.c
+++ b/drivers/nvmem/layouts.c
@@ -156,7 +156,18 @@ static int nvmem_layout_bus_populate(struct nvmem_device *nvmem,
 
 struct device_node *of_nvmem_layout_get_container(struct nvmem_device *nvmem)
 {
-	return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
+	struct device_node *np;
+
+	/* Search for nvmem-layout child */
+	np = of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
+	if (np)
+		return np;
+
+	/* The nvmem of_node is itself a fixed-layout node */
+	if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
+		return of_node_get(nvmem->dev.of_node);
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
 
-- 
2.53.0

