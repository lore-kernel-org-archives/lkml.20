Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC741D108
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687835; cv=none; b=bjQMD5nxdP4SGgmx50i6tQfy7FEt7MNN+Ks7dfuvj4NWbMjbbBW9DNsJh7b/Tj1tq0f1JmHzcnXxv3zt/KFQsxAQ/LqNFnkKqHR/5H+bfRh68uD9eN89s9IDVddUs2lWp0mkIgOVAvOGujo5D8ng70QrDwjN5Q+rb7moywSr2A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687835; c=relaxed/simple;
	bh=XQJbUe8sMDqqBW5miSJ/WWQvT7MMRyRqwO1bmF9XY6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Coubu+b9kuaPOqHenLr0Myr+9cSckAu+6HqJNu7e2Oii3ZY+GNTq2+1gAuh72na2WIaeuze6euMp1Wv+PZzps3D64OI/VDVttZ87EU6ysTm1dtwQBgYIb5QinNg9i3C6OD/NXQQsVvcxlAdvGL/muDPtF7FQ8LkkW2A9sMpnKJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qtXUEYE1; arc=none smtp.client-ip=91.218.175.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qtXUEYE1"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XQJbUe8sMDqqBW5miSJ/WWQvT7MMRyRqwO1bmF9XY6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789687831; v=1; x=1790292631;
 b=qtXUEYE1VFbkTq1smiIKWHyljSeob76vpMVFf+Bdur4v5NHJwCyMyjZJcbSV9i4vJkZQ06Ak
 6hDkvHqYEKxj5aN0p6NzsvCLWq1XxH+fdCY3950S8FeJ5sE4FmrwLEfq/MO+g6l29dhS0W+EYC5
 i4Jzs+m8EVCEGiSSA+pIpSOc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 293cbf4040f81a82;
	Thu, 17 Sep 2026 23:30:27 +0000
X-Mizu-Trace-ID: 293cbf4040f81a82
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: sashiko <sashiko@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Cc: Chris Mason <mason@kernel.org>, Kees Cook <kees@kernel.org>, Jason
 Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>
Subject: sashiko & pre-existing bugs
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Thu, 17 Sep 2026 23:30:23 +0000
Message-ID: <7ia4se37qwvk.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hello,

as some of you might notice, a couple of days ago sashiko stopped to
report preexisting bugs together with not-yet-introduced new issues.
Instead, it started putting them into the database. All M: and R: in the
current MAINTAINERS file have full access to corresponding bugs.

There is a new "Bugs" button in the top right corner which is the access
to the database. You don't need to create an account, invent a password,
etc. It's all stateless.

If you're working on other tools which discover linux kernel issues
and/or can generate reproducers/fix candidates and want to collaborate,
please, reach out to me.

Thanks
