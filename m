Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCE9221546;
	Sat,  3 Oct 2026 21:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063312; cv=none; b=cfbUe4TKzKP5iT9dVC7LaHEM2NXYh6OiUwTmppjhujnf2AejvEmbbEq8a+lQhcFpxTQ3IgCk+t/jP/3qYOJKvMpJF9zZq2OOdvZIkjmpyCt6WB8XZiglHEGPWPMOtH4NjYkM5CuKty4ME0vbA4ryf8ZJnJge/f9AN+V0dn78B8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063312; c=relaxed/simple;
	bh=2nZAkXm4iywnQhlYEfW/z148VdkKaLHVlQFcdJKsGJw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hzRrhddxKJ4SDfNV6iXiDROuCp1WECToLcSRK/05oQCzQRDNfNhK14eStogYu35zE3BqHqQFj14SxHPjZ0f4SO/fdvggSxf8C9dYkP/wLpA0Og6q5WFs7oQ5ZPhX1X+3p5PPJS/RuYTST737tCCnPstgorhgl+XJX0ZrO9XR2Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y6GWTiYz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y6GWTiYz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=1K4Bb8TbAcWVToXI4RbrgbOR5huL24YK/BbhnHns2K0=; b=Y6GWTiYz9EQjCmy4o5haJ1IoWz
	jOVdoaSwoI4H7lzRdHizquuOJHkEfo1kR6U/FoJK6/x+js+T3I0yU4Al26PQkvVg0jmygsY8QfyXz
	IDsHLk6i+2hxInSqjtc7Hg6Y67Yc3RBPm4f1D8tF6mBICdRuI0CQE/iDQYmwMtHXYzesV+AguB0Z2
	T2m4ILHdLabgT4nq21FqiMsUbun0LlTQgtinZGsYf2NJRwCVKd4nIcWD9OWgAzCGxkOjVP9r89HRc
	Np56s/QcmSm51YPhG6rSxlv1KFhk847t0IUnFFkwq3KImqf2PEi3HJAhG9UKmWToMmSbIJpLrmESB
	Y5J4pRrQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD7Ns-0000000E5FZ-3sMR;
	Sat, 03 Oct 2026 21:35:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH] docs: kernel-parameters: don't mix cmdline options & build options
Date: Sat,  3 Oct 2026 14:35:08 -0700
Message-ID: <20261003213508.96424-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some kernel command line descriptions mix, mingle, or conflate an
optional part of the command line with the build options that are
applicable to those command line options.

Specifically, a few command line options that use "KMG" to specify
a memory size mix that string with build options like "X86,EARLY".
These should be separate fields although they are both enclosed in
square brackets, so separate the conflated fields.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: x86@kernel.org

 Documentation/admin-guide/kernel-parameters.txt |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20260930.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20260930/Documentation/admin-guide/kernel-parameters.txt
@@ -4080,8 +4080,8 @@ Kernel parameters
 			like Grub2, otherwise '$' and the following number
 			will be eaten.
 
-	memmap=nn[KMG]!ss[KMG,EARLY]
-			[KNL,X86] Mark specific memory as protected.
+	memmap=nn[KMG]!ss[KMG]
+			[KNL,X86,EARLY] Mark specific memory as protected.
 			Region of memory to be used, from ss to ss+nn.
 			The memory region may be marked as e820 type 12 (0xc)
 			and is NVDIMM or ADR memory.
@@ -4371,11 +4371,11 @@ Kernel parameters
 			Enable printing debug information related to MTRR
 			registers at boot time.
 
-	mtrr_chunk_size=nn[KMG,X86,EARLY]
+	mtrr_chunk_size=nn[KMG]		[X86,EARLY]
 			used for mtrr cleanup. It is largest continuous chunk
 			that could hold holes aka. UC entries.
 
-	mtrr_gran_size=nn[KMG,X86,EARLY]
+	mtrr_gran_size=nn[KMG]		[X86,EARLY]
 			Used for mtrr cleanup. It is granularity of mtrr block.
 			Default is 1.
 			Large value could prevent small alignment from
