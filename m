Received: from out30-75.freemail.mail.aliyun.com (out30-75.freemail.mail.aliyun.com [115.124.30.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E9425785D;
	Tue, 29 Sep 2026 03:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790653818; cv=none; b=qV6AzgzfWu9F5DU5f9hENxFx0DgsLXvNnZ6XpOaoPBzwiv1+aBi9QDj4dfhYc+A9IQttBpx2HKWmsf/pgqNXl0sC5TWCqBBhl36ZEnVnvDb79/jF1OXDxWLBsmXT3HieeL+1Yb8maQXc+lDuEyt08AeCsQXFqh57zGtyDyNAkgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790653818; c=relaxed/simple;
	bh=d9rAtasUH0RoaDHGsWyQcvo/plcTrp2g4PerNIc67ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZXUbdnTkCsshhRWx9/vTHq5Nl7+ctB7xnS2mml5qTbRfUl1iQLCrfVvWr0J8BIQUVrcq2Tze5Zx2/lJSTcLxUd/20urE2MY2SWNnyLc2HDFop6+AQBo2RQgtmxxv7JOJbiSJA+dFBbikj/dbiloLqQpwV68/M17RMu7LbiEUrM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aliyun.com; spf=pass smtp.mailfrom=aliyun.com; dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b=ewbshE6+; arc=none smtp.client-ip=115.124.30.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aliyun.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliyun.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b="ewbshE6+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aliyun.com; s=s1024;
	t=1790653813; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=qxLbnCMjOsISk4dkJ+9u2CP2IpXgRDtHatTLjBExLk0=;
	b=ewbshE6+Zkhga3pnO1bqR8Jee+A1MAyaQIZ4mLexfiOXl7b4JnazZV0zPvrFWJOqqo+AE5AZ2ql1ksfnQns+yH8h6P01HpE2lGvhwObXEQeueM56MvkKWCVSI0jidmfjK8VYyK0G9qVOz6ksUWHExlhCewtmYuhQ5m9gEuB+W6Y=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1186648|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00757088-0.000741671-0.991687;FP=16780791132089850986|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=wdhh6@aliyun.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---0XBrsXwJ_1790653808;
Received: from localhost.localdomain(mailfrom:wdhh6@aliyun.com fp:SMTPD_---0XBrsXwJ_1790653808 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 29 Sep 2026 11:50:10 +0800
From: Chaohai Chen <wdhh6@aliyun.com>
To: richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-um@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Chaohai Chen <wdhh6@aliyun.com>
Subject: [PATCH] docs: Fix outdated URL in user_mode_linux_howto_v2.rst
Date: Tue, 29 Sep 2026 11:50:06 +0800
Message-ID: <20260929035006.2201371-1-wdhh6@aliyun.com>
X-Mailer: git-send-email 2.43.7
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using an outdated website results in an error:
  E: Failed getting release file http://deb.debian.org/debian/dists/buster/Release

It works successfully using https://archive.debian.org/debian-archive/debian .

Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
---
 Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
index 9224bea5ee9f..c4d5d08e2bab 100644
--- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
+++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
@@ -123,7 +123,7 @@ jfs, etc will work too.
 
 Create a minimal OS installation on the mounted filesystem::
 
-   # debootstrap buster /mnt http://deb.debian.org/debian
+   # debootstrap buster /mnt https://archive.debian.org/debian-archive/debian
 
 debootstrap does not set up the root password, fstab, hostname or
 anything related to networking. It is up to the user to do that.
-- 
2.43.7

