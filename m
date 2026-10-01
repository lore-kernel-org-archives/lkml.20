Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADF217648;
	Thu,  1 Oct 2026 21:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890355; cv=none; b=mdhRWqQZ82Ad3tQ4nmIoEyCb9U6j/0wDlPlNius0rFWg3VY9TGghmZ7rluqSPXvJF4JcTpdL0YTvvGH2SaQs7c50yEWWYe1Thwy9DLDPw3RkfhrhhnrVVp15+tdwmVMjXuqceEhHp911TRrRKxf3l/57b9l80ZLzozPMGo5ckw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890355; c=relaxed/simple;
	bh=I1W1x3MrjQlnmNumrGjwU/XyjM08fHkIZJXMgzAoY94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ujCsoK4A0JruESGyxFkJw7Y2ujQlF4Ea/+a7L+lBfdi7kdyUng9m3+trCx7h5zzGz4ymyAQkFDX+Rp7NC9NVwDuL8EZzPffWKemwdGYCqkOj/B7Vf4RwMDLXVpHrrGtpVFZ3FsyPXvFZuuB+rWQ7eWpQq3ySS08Sc1S3Bb+xsV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vHgQ19hn; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vHgQ19hn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=MHM2juU7N796n9dDPdLpSkCHtSGJwnLr/rKOTOI+TCs=; b=vHgQ19hnIArKkvfcSGQ/Jd2Pah
	iTBhla9bIdzNEtNQNNOLf4lKSH/VAxVVkoaKr01V1WOplPMdOzQtVYbSs7E4RLVnmb+LgpE5OVeOI
	iQ4onqRg2tmu+GHk2R8qY+KbO1uT0N8+8w3pic34YsnbrBexAkU3sZr68GYfpDNdvc6lW0GuJRDxO
	P5vHKOAHJ/xYr4q+wQ+B9sDa4JAmVjiNvwbfvLtnRzxqxeBiy/wFrPqeBl6buCnzXIDsvWg5sZAfz
	xVIb9pKfkFV9CMuWUhlbGH7I4uSnLZamoeUS569y0KU31vUvLHSI3rZoCx91bFxjniWCbHWvEUthZ
	h30kwpAw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCOOE-0000000AH44-1unT;
	Thu, 01 Oct 2026 21:32:30 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Maurizio Lombardi <mlombard@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Keith Busch <kbusch@kernel.org>
Subject: [PATCH] docs: kernel-parameters: alphabetize NVME entry
Date: Thu,  1 Oct 2026 14:32:29 -0700
Message-ID: <20261001213229.2399120-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The list of kernel build options (or the legends or keys for them)
should be kept in alphabetical order. Put the NVME entry in its place.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Maurizio Lombardi <mlombard@redhat.com>
Cc: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>

 Documentation/admin-guide/kernel-parameters.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260930.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20260930/Documentation/admin-guide/kernel-parameters.txt
@@ -44,6 +44,7 @@
 	NET	Appropriate network support is enabled.
 	NFS	Appropriate NFS support is enabled.
 	NUMA	NUMA support is enabled.
+	NVME	NVMe support is enabled
 	OF	Devicetree is enabled.
 	PARISC	The PA-RISC architecture is enabled.
 	PCI	PCI bus support is enabled.
@@ -74,7 +75,6 @@
 	TPM	TPM drivers are enabled.
 	UMS	USB Mass Storage support is enabled.
 	USB	USB support is enabled.
-	NVME	NVMe support is enabled
 	USBHID	USB Human Interface Device support is enabled.
 	V4L	Video For Linux support is enabled.
 	VGA	The VGA console has been enabled.
