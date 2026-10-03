Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B723AE9B;
	Sat,  3 Oct 2026 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063312; cv=none; b=hnDZ/onwuczA2LUz+NArTJ1moAgAo2ubUE98rSm/EWhK7yHN5F7DjPH9eppVVlsWG+MxAjFEyAbdXs5puKmaDZ9tDmhZyFT0EIK+P1EfvLLAk9mKfyO3nfeo/WF80Zo77ecnE2Y7G/OL44V6/QDwezxSwLsGaE7yLDvWUZ8tzwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063312; c=relaxed/simple;
	bh=NapNk1QZ5fGn4okTgqwbXw6z6tGpWJoBWShrrqaLDR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HII4R+QmFPdh5XIGNSPyLgvxHtBIFHJPNv3o2LWkH7AxBmLr+cffM7SHicJmE47Gp+jlePI+huTHT12f0O7hg9NAm0ZSd50z/LMD0zT0Leiel8V3OebAJtydZkO64rVrMr3Ro1aK2Q23ADKymhToAU+NX5O0KQXlD7iPAxocnXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bWo5/h2B; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bWo5/h2B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Dko3HhaGSU5/rU0ME1b74b5ts31WWOq3griU0bVvQeM=; b=bWo5/h2B/eXlcufjNCfpbltF8+
	yui55u+/jNqokXHr86VsBe2PBs3P3O0M4WqXt23QfO+xBQSossudxnknRXEbQrqEYooFYFIjUFVht
	/ZJ6ePPvkx7ydtTgcyMSPtaw0REWYqf6wH+OPMDeOa1t7XfgLMnzPh9BFnfOBwzSevRzk3Emj/umy
	3Vl8JoxW1TSx4rH7lMKl7oPnDz4wSDVZ7UjaFt9zXp1JYYWEXF13aL94llosp9bq7VzIQTqGnpBD5
	pCI/Hq5Wgfj5Lz5HVJ3FMWE/4oaWiDMsBoi8F7XTiCuzZ27V/ilqrC37bWaoZ48+7qYC+sJrUs4uC
	9CiBkUVw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD7Nj-0000000E5Dy-0vvS;
	Sat, 03 Oct 2026 21:35:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	linux-mm@kvack.org
Subject: [PATCH] docs: kernel-parameters: adjust reserve_mem build option
Date: Sat,  3 Oct 2026 14:34:57 -0700
Message-ID: <20261003213457.96408-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"[RAM]" means that the command line option is applicable when
"RAM disk support is enabled." However, the reserve_mem command line
option is not related to RAM disk support, so modify its build option
relevance to "[MM]" instead.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org

 Documentation/admin-guide/kernel-parameters.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20261002.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20261002/Documentation/admin-guide/kernel-parameters.txt
@@ -6693,7 +6693,7 @@ Kernel parameters
 			them.  If <base> is less than 0x10000, the region
 			is assumed to be I/O ports; otherwise it is memory.
 
-	reserve_mem=	[RAM]
+	reserve_mem=	[MM]
 			Format: nn[KMG]:<align>:<label>
 			Reserve physical memory and label it with a name that
 			other subsystems can use to access it. This is typically
