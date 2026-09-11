Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9613932E8;
	Fri, 11 Sep 2026 12:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128396; cv=none; b=S5m2UqevMjlPKO0sCu3D+EuUkA3Geuc8dXgJXf8r9ue5OmwNdNuvwqS7tOn1gPSGtsxBZblT1vPnYnyvjcsCEB1MwppA8kiU/NIlpa6WRruISrFkIkvAQLxa7bTTCTKjvVTFtlsDDX70oJC8Yrob0G2AibnsfJJKvzfkWWxNoGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128396; c=relaxed/simple;
	bh=pl40F5KZsid3eh77lrrlQzYUInc3vPDIgdn8seMKjwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D34eKajrouE/y6b9otOx+kXYCa5QGQmpXUZhadr51yTTyM9nCgRRuo0X1X3eO5ksbb22eTrSnJFosht/lMhoRvIhP2D5/X0PJD8TxnCrv2jepFQBF7UPxYiPn84+pwTUM9mdl400mT+7vvGMY3D+yBmY3pupyaCpsP03pyBTedA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JK3aYoZu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JK3aYoZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47771F000FF;
	Fri, 11 Sep 2026 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789128393;
	bh=BPdnP6pEeUyLXjp6RhhRdrpB+FPtI3K/Pq+5j5JOQ3k=;
	h=From:To:Cc:Subject:Date;
	b=JK3aYoZudH+nMyoEvFHZHYg29/STQqmnoiadqyNE5HFgeJJ8n7H3Z56BawnZ/0yYz
	 vHI+UrtNu/icQSdfFs0UIMaxCr44P8KyGG1KulgTf2YU6oxR4E8xBjAoRsn9Zl576w
	 +1wP2/b6AatH4cioqHa87g/NZ9rQgs7lF9XddAvBtp1g4ejkXbslcJiJPfp8t/xej/
	 E7ICFyOW5mrPRk/U3RxmB+3m3giAFSwLySWaTz/AjAAA76+TEpeq4P5ohhSljUtRY2
	 04p7SwxDK0ZRrCHpVvtPMwbmarJ4mo5BHAzZSxr8a0HdB6duuz3DdB1yxxA2wvjkOh
	 q9rJWjoZvqOiw==
From: Dinh Nguyen <dinguyen@kernel.org>
To: bp@alien8.de,
	tony.luck@intel.com
Cc: dinguyen@kernel.org,
	linux-edac@vger.kernel.org,
	rounakdas2025@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCHv5 0/4] EDAC/altera: Address sashiko reviews part 1(v5)
Date: Fri, 11 Sep 2026 07:06:23 -0500
Message-ID: <20260911120627.2634225-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi EDAC maintainers,

This is version 5 of the patch series that addresses some of the sashiko
reviews for the Altera EDAC driver.

Here's what changed:

v5: Fix a missing } in patch 3/4

v4: Rebased the series to edac-urgent branch because of patch
9868f5c077df ("EDAC/altera: Use parent device for devres in 
altr_portb_setup()") will cause conflicts.

v3: simplified commit message based on Borislav's comments

v2: reworked to only includ true sashiko hits

Thanks,
Dinh

Dinh Nguyen (4):
  EDAC/altera: Do not allow driver unbinding
  EDAC/altera: Drop __init from ECC setup paths for re-probe safety
  EDAC/altera: Fix code leak on dci allocation failure
  EDAC/altera: Fix use-after-free in error paths

 drivers/edac/altera_edac.c | 60 ++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

-- 
2.42.0.411.g813d9a9188

