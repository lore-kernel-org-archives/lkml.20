Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CAD3B8BA4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487293; cv=none; b=D8QcKi0srwWVVOJ7113f0R9p0FVj/GYDOL7vWLnzrjzRWyp49FbJexNBb5hUOBVnZaPHceRl1H2UcfAsSL/E6w1IrMAUk6l83ks0YjjRHlJCpf8pVhC5LoeXX4Fz9lg/E9WUOf2tjx1UBtVPj+xgLo3xd/gNzMhPDBFAehWbR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487293; c=relaxed/simple;
	bh=cUEypg63L5f/VUOrvJqiiMmrxyqPv34pJ6DVfN2Adfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QgA0gaM4Iioo5sH/nPq72DUGxXgbtrpwNxt12D2Ws6+QjU8dCOxnWqvO5Th11rRPk+o22BFA3nbX0FSyYddHtOae0eaUruylNshP4WhqvE3Djbo9q0v5ceR5HoAK4Rp1REdZikw/wsJ1VZi03GhsNyoDoBMdPgtZdj+9ru/IlAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2EmRSGw; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2EmRSGw"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-531034aa31bso25253161cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789487290; x=1790092090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kylk6jQtKAQ+o3Y2HdR0DJ4+oM1lekmhtx/9tJwi1dg=;
        b=e2EmRSGwjiUqQGouSNFtGYI9a6yxxlGxn2dBuUObaQHJNoaE/lRJcCwCuI3MJQjfyM
         NDLKGKCiA2n8LE2BUrRTH/Z9MY0SkLqXcbR7lL81wjnYt33uNTp0cuCbp0wzpPo++qhq
         7I9R+4FwE5bGzkbwRSm4v+FkKaogjR2ly/SbwDI5/UX6lj2OcWzqXiprTl1daUk7Rw3E
         5uAavWw8o2OiWA50Xqr9Cr6ImRV+Rx9GwVatwgVbRM3lICj3gJ3dj93O+xKWU6+WsrJo
         5gwvvC0c6AuYiNoiggHk+MlCBVNx3yOZds6ioS2R64+2uUkS2/wvCJ/fjJwq4BGW27dZ
         y5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487290; x=1790092090;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kylk6jQtKAQ+o3Y2HdR0DJ4+oM1lekmhtx/9tJwi1dg=;
        b=CPN+gNDd3xMC9KTS/YN0cRfmzEAQCUOxqpOTYSrlp3p4pBQf17khhOAX4zeJFdc+fx
         6YN+F+Eqd5aVFIPmbwnKVcktbWT0C7qR+AnfrWb+Ydbtu8hxhIMrguEfKr7R9Kavy6oI
         lsSEwvX1PB5L7p/HCDq+FTR0HsVrIQBbt+TDE2uiQqeTuHuTwRuQ8xli6sRLQQL9h68+
         6KeGjyAS6rrnOUW47s9tKePO2yP0fhvcQthLSyiuZMC0aG/t+cn00nlIfBzJ5TLUN069
         8YWAouRyMOmCYpvKfsGKeJbb9ZrgvE16ITd7SnjiSwFUL66k3MIdoEaQmeHZSorJPU/t
         O/2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdqqB91gzOG34SOdFYelj/AwHL7VZ+8elqPcYhfe9xT803xcAngQ1vFC7+U5Hiw3/iQ9ADQqJnI/DREZk=@vger.kernel.org
X-Gm-Message-State: AFuF++kOWM18iWbdgjBPgkibaqx/dRjjX8II97qY63UdmfWEzPij3NeS
	GrsIIgT7MvraCcoV8Hfy7z34VfCfd2J3XXhHrmEdMnCALRiEpTNZME4T
X-Gm-Gg: AYBFou0DVm9gcxnlALmLIWE3Ww2GhEEh3Bmk2ak0YtOxrBX1ATjhaNYapcCJZyQzWJi
	BEAB+vBtrMNX32K6yF8UcPbUHgSMQQvI59xEcw+wqzwiri2C/E9GLkU/FedWZjkUGiart9/wOKH
	VE0KBn/q2plnzJsI/szh0zLCDW03a2wuG/FWNHfjQUTAJg1k7OeE4tUE595KijetZRYs84E9ITL
	KHlA58Y53r1ZpHiRUEWIGyzaFIl0arVuY6MiDvsKcrh72b37Hjm1xEzTgwHdYo7UR1cMimHiOMQ
	2q+hE2sW97M+dsveXTNNd/L/YJBHd4OKWEZKncePTfaqXyHxV0FCzgilCvfwZ/ZijX/tLxqFd97
	+m82jQSB4xHQXyOL3vUmh/9G5f8+RAVXCgkIJ8EuMG+oy1KwfW8esT9SL9lIIQDcyw16JZoBu8x
	NlfTmrQ551NksoGZkhrl6AmcFhhw07drshDqs5fL2auIXeSQFHplZAv9a1JEHazbzytHtpqBmxn
	TMxage6b1orcL48
X-Received: by 2002:a05:622a:190f:b0:530:e4fb:60fc with SMTP id d75a77b69052e-5310cf3a3c1mr119647581cf.15.1789487289736;
        Tue, 15 Sep 2026 08:48:09 -0700 (PDT)
Received: from laptop.amd.com (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530f6823ba5sm82610361cf.28.2026.09.15.08.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:48:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To: christian.koenig@amd.com,
	ray.huang@amd.com,
	nat@pixelcluster.dev,
	arunpravin.paneerselvam@amd.com,
	matthew.auld@intel.com,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: change TTM maintainers to Natalie and Arun
Date: Tue, 15 Sep 2026 17:48:04 +0200
Message-ID: <20260915154804.605772-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The blunt reality is that I don't have time to look into patches or bugs
any more as it would be necessary. The same counts for Ray.

Natalie has been working on the dmem cgroup patches for TTM and agreed
to take over looking more into TTM.

Arun is working in my team and already maintaining AMDs VRAM backend for
TTM and the underlying buddy allocator.

Add Thomas as reviewer as well, better to have more eyes on that
component.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b5a4e4b35cf..b6e58a138501 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9140,10 +9140,11 @@ F:	drivers/gpu/drm/drm_privacy_screen*
 F:	include/drm/drm_privacy_screen*
 
 DRM TTM SUBSYSTEM
-M:	Christian Koenig <christian.koenig@amd.com>
-M:	Huang Rui <ray.huang@amd.com>
+M:	Natalie Vock <nat@pixelcluster.dev>
+M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
 R:	Matthew Auld <matthew.auld@intel.com>
 R:	Matthew Brost <matthew.brost@intel.com>
+R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.43.0

