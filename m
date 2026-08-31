Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B03C38F62A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 20:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208741; cv=none; b=TQSPLv7nINC9+8uK4+z+8xukgDeFN1Wl4psQqD50/KX5jfKrogIEeCH9ePd5a2y7AmzqhbGjzQcgcXSapFNzPLKP4h6gasPpN5vJ4EiktNjAbxGmYGTKzsTaW/OtRGVf46VB5Vt/O2RDqIgzUnVw329V9nYbUzkLA/9Zc/ANMHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208741; c=relaxed/simple;
	bh=Dg817f+LaIglasNVMvIRFHB4R81xqLgW7exoi9YUe30=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=q/LqZ8aJHVp/WvP/Pxi48DvRWwZRzZxln2ULMQdm8miV0VCnaL1x6XUbovfyZ7fSQUEM/iB3v66oqwCAMZxZfK+RyYqrsXjuKJufonlaN1JpPau3ri8w194tjUyxlSZBYsgKRn3VNQSNcszu1OpYqW1up6i0nY86yla963ObrFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBEIs4jX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBEIs4jX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4EA1F000E9;
	Mon, 31 Aug 2026 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208739;
	bh=TmS+OE03I4r2lXVvBv4ojG4eh4BUXVdq+iGbvyJvd4w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=OBEIs4jXGyPRmhgSvZXUpwLphKNK59dz8npAWHdxuQmi5FcAm7lw2mlZsquqrBd0k
	 U2z14koH9PSdszH1mUS6CMyTw8/lrBEz76Vai25upsez1YttGmCtq0qAQc926lNpeF
	 nCEI31hQC1c2PbisbOxQ4XTRbijkAFBMs1n2zhfAr1zyzQyTc0p8ITarAT5h9Q003L
	 J6YHDSHwiZipaZMShMoBLAGwdOZiyZRaS7WOzZPK75SEtLDuAyL6NFwI/sNPSCY2YJ
	 tz0I434/gzYNam8++/up71PmcyNvw1R0Lj5exht+LKI+b+0L9G+1tK5alhbQ2m1dwx
	 KqY0xGV1njatw==
Date: Mon, 31 Aug 2026 10:38:59 -1000
Message-ID: <c1cc10c0e098625bff11ef939ee86220@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: leitao@debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tools/workqueue/wq_dump.py: Support backward
 compatibility for wq->attrs rename
In-Reply-To: <20260831181554.117795-2-atomlin@atomlin.com>
References: <20260831181554.117795-1-atomlin@atomlin.com>
 <20260831181554.117795-2-atomlin@atomlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Applied to wq/for-7.3-fixes.

Thanks.

-- 
tejun
