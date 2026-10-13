Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E82551C063
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908756; cv=none; b=VmOq3cS3nQX2BUSugYKooyMOGmyvqWTkJsvU5K3NA2ud99mDBhyq9SCXgYbQ7zqG+ZJLplbjFl8bk33qWNUNiP3T8h3Fd0suQLpIdDXTjg/22Ii4jNRL7TteP3b65PBHW8mnVM3yMGVM0EBpSGi+PTLo1sE4ifcxA7zXYHKnKqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908756; c=relaxed/simple;
	bh=C7VhPHhFkc+Rzq5o/LNoi/dlk2dBfWFnWV2ZssmJUBw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VgMMR61MnfXRXCLYS9JicjpPVXe038ax5PpeqLhF5CHkqQqUhQPuksX/RUiu1I6ZR5Nu5LySpCTuQuNGTpCV1ixkhgEq5hQmnZ0w04NBFXP3XZaggnulnCUETmQf/c89M7un0FA3MZpSXWXE53iokzO2K8HAlBKSn05Pc+YsFEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vYHsl12g; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vYHsl12g"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e83df1d54dso839895ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791908750; x=1792513550; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWpNLUzvXXnBTpZNjknwwhw/as8BAKF/fqR9wquhzLQ=;
        b=vYHsl12gF5Us+ZiKniKdIDbzNSt47S+tVUhs4M0O7RHKtWZ62wieP6b1fkOJ8Txd9I
         0JIw9QQfp7uP7eMTXluOzZMdQAlwPV114k/TCkzMVcFuaILoLlBNx1z1aWUZUqsWn+88
         Zn7eprsKJJyx5awuuMX94pxZ+cVBI94tu8YgV1xrR9PJUs3dS1CEDjWq1y8KRn+CQyEy
         FXqFJnMrc8CBJ2lFfq96i+gYPiw5yjt4CqaTTjKQ1jt6l+RyOEqhNhPbciFEXQU/+HqY
         DoMhek24B+RNQnORzQNJBmzxll/CUoyOP0OCFekcBImRpTwLk6MmOXR/6sE7q0jzNqPv
         DiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908750; x=1792513550;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bWpNLUzvXXnBTpZNjknwwhw/as8BAKF/fqR9wquhzLQ=;
        b=eQoL2bhJR5J4PrJOeXX3dNMMTSkMp46uf2Lu8zN2q1KdKslALoaW3GSKtajUH4+zvc
         7A/pGIzmWiQJQUV8KH4ZopRopWOakvbUbW7XZrjlJKQ4xQMaH1LVefTz8nbUXtIKSCVi
         Evk0AmOizCb9AeVg6h2Tq/MbkmhdFvvJQcEnqvBsnE01Iz73/3A1QQp9/5zgBkBB45aA
         romxMAGQqe8e/QHGZ+t3purJ5YQjxgDz35rh0NgAyTa7ylcFseFyvExz4t9QZty50cEc
         TW0x90VWuqljUbTpyaWjcmHRQLsWapzFHqRq/J4UNFbhfX4nSZNAJ+0I9XUKWD4+YHh1
         tV0g==
X-Forwarded-Encrypted: i=1; AKwUvBxpAOnD78Cc0yokRYfSvaOEtOZbQ+Tc3X+BEEM2pYr72cUbM+0hKNZ4hPj1tGB0l12391OlGfdAaxypQSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLeKpuFe0zVJh4ylcpLQTs/5/Y+FlcIXl80rzFT9+kmXe6psMn
	S/bpmfKqDjDE5k45rFT0Bq0aP8EQwd6lpirhiWqpiwiNO4P1MjXLkK2j39icyzHkf0tiJ0Lvc/m
	ZpNBYeRwP+Kr4Hg==
X-Received: from plnq15.prod.google.com ([2002:a17:902:f78f:b0:2e2:d223:8126])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2309:b0:2e5:38bf:cb43 with SMTP id d9443c01a7336-2e8427f0c01mr119406635ad.2.1791908750143;
 Tue, 13 Oct 2026 09:25:50 -0700 (PDT)
Date: Tue, 13 Oct 2026 16:25:29 +0000
In-Reply-To: <20261013162529.1928093-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013162529.1928093-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013162529.1928093-14-dmatlack@google.com>
Subject: [PATCH v10 13/13] Documentation: PCI: Add documentation for Live Update
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add documentation files for the PCI subsystem's participation in Live
Update.

These documentation files are generated from the kernel-doc comments in
the PCI Live Update source code. They describe the File-Lifecycle-Bound
(FLB) API, the device tracking API, and the specific policies applied to
preserved devices (such as bus number inheritance and bus mastering
preservation).

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 Documentation/PCI/index.rst           |  1 +
 Documentation/PCI/liveupdate.rst      | 35 +++++++++++++++++++++++++++
 Documentation/core-api/liveupdate.rst |  1 +
 MAINTAINERS                           |  1 +
 4 files changed, 38 insertions(+)
 create mode 100644 Documentation/PCI/liveupdate.rst

diff --git a/Documentation/PCI/index.rst b/Documentation/PCI/index.rst
index 5d720d2a415e..23fb737ac969 100644
--- a/Documentation/PCI/index.rst
+++ b/Documentation/PCI/index.rst
@@ -20,3 +20,4 @@ PCI Bus Subsystem
    controller/index
    boot-interrupts
    tph
+   liveupdate
diff --git a/Documentation/PCI/liveupdate.rst b/Documentation/PCI/liveupdate.rst
new file mode 100644
index 000000000000..96b1d7f5df3a
--- /dev/null
+++ b/Documentation/PCI/liveupdate.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================
+PCI Support for Live Update
+===========================
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :doc: PCI Live Update
+
+Driver API
+==========
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :export:
+
+Internal API
+============
+
+.. kernel-doc:: drivers/pci/liveupdate.c
+   :internal:
+
+Live Update ABI
+===============
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :doc: PCI File-Lifecycle Bound (FLB) Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/pci.h
+   :internal:
+
+See Also
+========
+
+ * :doc:`/core-api/liveupdate`
+ * :doc:`/core-api/kho/index`
diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index b3c689e633c1..2bce2644eba2 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -74,3 +74,4 @@ See Also
 
 - :doc:`Live Update uAPI </userspace-api/liveupdate>`
 - :doc:`/core-api/kho/index`
+- :doc:`PCI </PCI/liveupdate>`
diff --git a/MAINTAINERS b/MAINTAINERS
index 3eacaa98775c..5d1b58271989 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21055,6 +21055,7 @@ L:	kexec@lists.infradead.org
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
+F:	Documentation/PCI/liveupdate.rst
 F:	drivers/pci/liveupdate.c
 F:	drivers/pci/liveupdate.h
 F:	include/linux/kho/abi/pci.h
-- 
2.56.0.385.gd3acb90ef8-goog

