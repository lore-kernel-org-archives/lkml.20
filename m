Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B83A17D6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788637842; cv=none; b=Rc+Od2jtvOXlIt6PysPlvwp5TgqPLW3RQMmIxk8CXkTEKcqpVyfLP0tN/+VAI0gHu57FPFjhSIPT6Ua8NJrb+0uVXyg7Efis5/ArWbxZ4SyQvh9D6GClYhpxEP+/rS4ItkliATuV8DUtS3+nQ1gVtUtRCwwJtvpxMOwUXtP7oAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788637842; c=relaxed/simple;
	bh=mpct9Qvb1fCG53fsw0VCEssvLZoAU9HUlwuDDTMDUuc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W4ee5ynqdZonVOsCgwtjMuKydaSD/hoqwbTR7o/8S+GG8BunUdsGpUGz1niylS0S+Af6qDiyvcRjnyOXKRvGYskBksmdxYka8+7/sWea5+ER93zHeY/o0sW9VuzxCz4jNRA6DgnkUqDBoL0oSi8i0CBOX8tVUdov393zGSUcaHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=R7xG5XVq; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="R7xG5XVq"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CE170882A6;
	Sat, 05 Sep 2026 21:50:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYi0DLicLY7O; Sat,  5 Sep 2026 21:50:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1788637830; bh=mpct9Qvb1fCG53fsw0VCEssvLZoAU9HUlwuDDTMDUuc=;
	h=From:To:Subject:Date;
	b=R7xG5XVq4uRvDIyPUWFfg0XDbKLosZw7c5ZF1V7zYHLlVJoOHEh9thjY90x5Pmx02
	 QuVAhwnr0sJSAkxpXfTrx5k9x57o4UxaLMRM2QxdScVip8tI4JL3QziUO5vp/7aUXf
	 IZrljpnbe2lczqQpu8fmgmOg+IW5ToyXx4dX2MSsEek8vFJotR55XaEldBcbSAK1Cq
	 VUnL+hAqvZxwL1Aq76SL6JMfwlHVI8eLRzRWhIzwKG8yjtQJxD/Ifb690AbZReGL6A
	 cetJVqtFo1VRGHHRUOKY7oBxGNfCWeWy65/g2tkNKQMhi+rdfVE7svfdq6eKmueq8S
	 VhgeHWJoZqmOQ==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] =?UTF-8?q?mailmap:=20update=20email=20address=20for=20Ali?= =?UTF-8?q?=20Ahmet=20Memi=C5=9F?=
Date: Sat,  5 Sep 2026 22:49:39 +0300
Message-ID: <20260905195000.556185-1-aliamemis@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I'm switching to my disroot address for kernel contributions.  Map the
address my earlier patches were sent from to it, so that
get_maintainer.pl stops offering the old one as a recipient.

Also switch to the proper spelling of my name with diacritics, which is
what I use with the new address.

Signed-off-by: Ali Ahmet Memiş <aliamemis@disroot.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 0e672a60afdc..0c901625fcc3 100644
--- a/.mailmap
+++ b/.mailmap
@@ -66,6 +66,7 @@ Alex Hung <alexhung@gmail.com> <alex.hung@canonical.com>
 Alex Shi <alexs@kernel.org> <alex.shi@intel.com>
 Alex Shi <alexs@kernel.org> <alex.shi@linaro.org>
 Alex Shi <alexs@kernel.org> <alex.shi@linux.alibaba.com>
+Ali Ahmet Memiş <aliamemis@disroot.org> <ali@iusegentoo.com>
 Alice Mikityanska <alice.kernel@fastmail.im> <maxtram95@gmail.com>
 Alice Mikityanska <alice.kernel@fastmail.im> <maximmi@mellanox.com>
 Alice Mikityanska <alice.kernel@fastmail.im> <maximmi@nvidia.com>
-- 
2.55.0

