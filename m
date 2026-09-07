Received: from mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE008483833
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780599; cv=none; b=mZEqk93hc8DSihMYm53RlLSC+OGu52ZMUsuvyH+2Xydod3bwlB8ifm7eDAZPEhCw8Ibhu5gKe/P+HE3Vif5hvI4GsBeLSDu8OnG4bDDzbOFY3/iiytLCzoOR7NCSlVrwr9AqSPUgtTtmHWqSS7eScjof5Uzb+P1TSUton12weQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780599; c=relaxed/simple;
	bh=6g7Sp3XgfzuQIIWtVmmh2ggTd+fvJQViOEJ1mFJ2k4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NgpdQ1xxVRksAYmIvdgj9XdjKHM2lEfX76Q/knxocto2nrG5qpaS12j4LUmfYH5c1YnnMtpjZo0LCxnDkSrwFJzL+5HpcBYrH9L2carTmfPVkMwzQIxt0QtFCOIhxCicGVdK2lpdqyABDtAbZ22F+iWD4qven8cy6PRYdV30GY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=szLUb5gj; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="szLUb5gj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6g7Sp3XgfzuQIIWtVmmh2ggTd+fvJQViOEJ1mFJ2k4U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780595; v=1; x=1789385395;
 b=szLUb5gjG0Ttu49xlUytt/3LHQPzFYQ6p3PExwJNJNgMULgwJyhlEOxZysrrcBk+YwNiuPLa
 csIC/HpUGvA4dAlqiLutHWqaA4zcp+k1wMV6MzwRTiCsK4GPxzL/ghGEflWILjJF4Opu9kjAIba
 xpIky0huN3L1nphYhW002j+c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 04e3b4fe8b7f3d22;
	Mon, 07 Sep 2026 11:29:45 +0000
X-Mizu-Trace-ID: 04e3b4fe8b7f3d22
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 0/2] of/irq: msi-parent handling in of_msi_xlate()
Date: Mon,  7 Sep 2026 12:29:42 +0100
Message-Id: <20260907112944.313618-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

Changes since v1 [1]:
  - Added patch 2: end the walk at the first node that declares an
    msi-parent, with the reference handling moved into of_msi_xlate().
    (Lorenzo)
  - Patch 1 is unchanged.

Patch 1 is the v1 fix: of_check_msi_parent() hands back a node reference
even when the caller passed one in as a filter, which of_msi_xlate()
documents as receiving none. Patch 2 is what Lorenzo asked for [2]: a
node declaring an msi-parent names the MSI controller for what sits
below it, so the walk ends there rather than carrying on to an
ancestor's msi-map.

Patch 2 removes the line patch 1 adds, along with the rest of the
reference handling. They stay separate because patch 1 is a small fix
for a leak that has been there since v6.18, and patch 2 changes
behaviour: folding them would hide the fix inside the change.

Based on Linux 7.3-rc1 (cee9395acd804).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260904073424.3855365-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/apqnaNmeuUjfC8Ng@red-moon/

Fuad Tabba (2):
  of/irq: Fix device node refcount leak in of_check_msi_parent()
  of/irq: Stop the MSI walk at the first msi-parent

 drivers/of/irq.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

-- 
2.39.5

