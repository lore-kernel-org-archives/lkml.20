Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC94F649A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800375; cv=none; b=IW6MEmEm66erIrYwagqwd6cGT/SCndLguQjk7d9Q17yKxGOkMyhsa8aYp4dio73uWv26t3oillfPJJK2O6tfKfCyxnfnMwZBDsXuA2s7XAurBkCDzwGTH5Sr9xb40U8y2R801tkrFSEasXjhJohpFZH5BgntLoiTMwvijeKgLUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800375; c=relaxed/simple;
	bh=+lKahDHlU/h4cbQNkjk5pAh2dazWgNUL9ynWEWxv+n4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I54MYXl58yPqiXoci4xTbDbhc+byogs/Cq/XJmBsgPtEmf/6gXhZ2C0pDlNZQ7b8Zl3I3M9s6kUkCxbNIQMADolOJSQuOT3vU2PnS6awq/CT6KrQyMnoWS8Zhty6HYXGFc0+bJyr63utfz6aMjoQTc/swA/XjkXnTJegA3Oivyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=BD9gd1c+; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="BD9gd1c+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=FgHcm6sgDXUVe2bUExPb5JcKcGNE+x6ewfocQ82ZgOY=; b=BD9gd1c+yCk45YOKurA6Z2VWn0
	KLtV4rwhFOVXcUqE9phbaDb/U2XhRBYV0v4jsimgpVk9JSTHVe2xBsJRYlhgook8QIgqiHjj7Gi5J
	HURtbngcf6LMa4wysTXvcfncf+AvwHpkj/oDgXznCqWUtnbG+L8S7FTQMq1z0uTWyaWZCCpvW1r1g
	MKlpBK7xRKJDZxeEloQJhtUj/zg4ysiWfCzH9CL8Wy8wHs65TrJO456psl899KWc87I9MJtGo+I9V
	HbSIKvFa1QctWcBdxPaai/9zP3NmzI9Kv0QSyoQrAiIyM4Pol2j/hYMDmFC4YxI9q+jrVPNNg0wsA
	XLaP6Grg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x3cgs-001eew-1n;
	Mon, 07 Sep 2026 16:59:30 +0000
Date: Mon, 7 Sep 2026 09:59:26 -0700
From: Breno Leitao <leitao@debian.org>
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, a.hindborg@kernel.org
Subject: [GIT PULL] configfs: Fixes for 7.3
Message-ID: <ap7pHxLx9DDF8Rxd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Debian-User: leitao

Linus,

Please consider pulling these configfs fixes for 7.3-rc3.

These are configfs fixes for two racing issues that were detected by
syszbot and finally addressed.

Thanks,
--breno

PS: This is my first pull request, please let me know if I am not
following any rule.

----------------------------------------------------------------
The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/leitao/linux.git tags/configfs-7.3-rc3

for you to fetch changes up to f06c2d26d1999d37e93299db0ecead04ca7d0b9f:

  configfs: unhash the dentry before dropping the item in rmdir (2026-09-07 09:15:05 -0700)

Tag SHA: d396bc8e8fb0f7b6517e733816450896c1894813
HEAD SHA: f06c2d26d1999d37e93299db0ecead04ca7d0b9f

----------------------------------------------------------------
configfs: Fixes for v7.3-rc2

- A symlink racing with rmdir of its target could reach a freed
  ->ci_dentry. The reference get_target() takes pins the config_item,
  not its dentry; the dentry is pinned by DCACHE_PERSISTENT, which
  configfs_remove_dir() drops while the item is still alive. Take the
  target's configfs_dirent under ->d_lock instead of chasing
  ->ci_dentry.

- configfs_rmdir() left the dentry hashed across the final put of the
  item, and configfs_get_config_item() treats a hashed dentry as proof
  of a live item. A concurrent symlink could therefore resurrect a
  dying item and hit a use-after-free. Unhash in configfs_remove_dir(),
  while the item is still guaranteed to be there.

Both issues were found by syzbot.

----------------------------------------------------------------
Vasileios Almpanis (2):
      configfs: pin the symlink target's dirent instead of chasing ->ci_dentry
      configfs: unhash the dentry before dropping the item in rmdir

 fs/configfs/dir.c     |  9 +++++++++
 fs/configfs/symlink.c | 24 ++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)
