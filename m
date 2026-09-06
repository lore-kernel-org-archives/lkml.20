Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70E35CB6E;
	Sun,  6 Sep 2026 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788687513; cv=none; b=PUA3eeUXfmECk9ckZ4v/yWF73WzmD7zJJ2iTb/uGoFjec+9OoCKwMpZ8vnZEsaCJ/Tww4ttNseXx09+4fX1hQyMLKiefE01kKMzMMfkj9a9i18Hiaes1q9Ptzo6YfL390/vPQdKt1JLWyaWJceUusdeex2IPoIlJxLP9c8EGqWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788687513; c=relaxed/simple;
	bh=GuCw/pjJoi5WUWUOQOlsk7qXi9NSbraV7IHpDIwT/oY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h8GmhXwsJxFFejJk//kfgYvzo59yyrERfYeS92ilJ3oXp1KwtSeAA++vXYFBbY+Avg/jB3dCx7lCBWkc1DN08GMg1vTVoRr3HhvoJxlIJTGpFwXWlrnatH41npBtkNaWf258GbqGqmNvQVWnzYrsvV2WlU72yypohHyQmeDdums=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J2YN2keU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J2YN2keU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108FA1F00A3A;
	Sun,  6 Sep 2026 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788687511;
	bh=kCvmHyEEmDorRmWKZ/3auxd+4A8Kxjp09oXX3sfi474=;
	h=Date:From:To:Cc:Subject;
	b=J2YN2keUkGeMAg2Uy73ujEt/mUZf5dpov0xxaGKqdVqn8xpLg9WFIjhpn1A8kEG01
	 f5Zl2cZUZxrfqr6R/P36nDKhhvfd0OriwCrPQQMCAzblb95Mxy0Kqr6gUBaTppdXBp
	 Gm1WmwFtrX5ltU9gBi/ywAeIz1xRcYCbqhGfVURU=
Date: Sun, 6 Sep 2026 11:36:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Staging driver fixes for 7.3-rc1
Message-ID: <ap00LoKqBVR5QmvM@kroah.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-7.3-rc2

for you to fetch changes up to cc7cd2a9228175c975f62ad56ed7c767701cb4fa:

  staging: sm750fb: fix mono image source stride mismatch in lynxfb_ops_imageblit() (2026-09-01 15:51:53 +0200)

----------------------------------------------------------------
Staging driver fixes for 7.3-rc2

Here are some small staging driver fixes to resolve some reported bugs
that have been found, and tested, in a few staging drivers in 7.3-rc1.
Included in here are:
  - OOB read problem fixes in the rtl8723bs driver
  - fbtft driver fix
  - sm750fb driver fix

All of these have been in linux-next this week with no reported
problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Hui Su (1):
      staging: fbtft: make dirty_lock IRQ-safe

Muhammad Bilal (4):
      staging: rtl8723bs: fix OOB read / stack overflow in rtw_get_wps_attr()
      staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
      staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
      staging: sm750fb: fix mono image source stride mismatch in lynxfb_ops_imageblit()

 drivers/staging/fbtft/fbtft-core.c             | 9 +++++----
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 7 +++++++
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 3 +++
 drivers/staging/sm750fb/sm750.c                | 2 +-
 drivers/staging/sm750fb/sm750.h                | 2 +-
 drivers/staging/sm750fb/sm750_accel.c          | 6 ++----
 drivers/staging/sm750fb/sm750_accel.h          | 4 +---
 7 files changed, 20 insertions(+), 13 deletions(-)
