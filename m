Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0115E42B327
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366712; cv=none; b=U7qRVRvHMFv5j/7C6Lx6rPkqUhcbImSiO8gqFbBkpakA91d4OZp0XvxyMk+TQ2IqnkMiA57Vj8YB1KJRWGeX1C9im+EGc5MrLfwkPklmcSrs4b9IYk3/T55fOqn9ZKzs1A1AtxKrYQOJRaDAlpd8iSEo2m131fPsHdjzoe60cAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366712; c=relaxed/simple;
	bh=y24S8bC/dHagFljg9z8SNdjTdolTyHPel5TqyDU5q3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UTS2zH3afQIqeFiyu187u08uYKtGvJp9ct/tBvKRyWfRm5BX9zAMPMpOxK+WzJYvqddHpJiKQ5cihgIa6GiGRc6gXsKZrZgziYb5EuDKW4qSGGtH+kxAXSLM78Adx+Opemx73kcnCs6WfNllMgeLHkvZdQsh0vqGnfbEONPkiKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0yyA131; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0yyA131"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9809D1F000E9;
	Wed,  2 Sep 2026 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788366710;
	bh=obDnEEuDpji2EQdva10dmshDZVT96ZYyip1IupRidrM=;
	h=Date:From:To:Cc:Subject;
	b=Z0yyA131CXIKiTr/FSqiG2QqCieT1K0+zGu8eIc1WYg2iq8CmHPieIfN00T8nHHX8
	 W5JRW+t4GJ9K1vi8nmcts+sDVDo7lUUrks/vc8FmaEhKbByD5ToVpTQaIDxsncKMu3
	 XD791Tx7vuW4AozIa3Qxg7tW/I3cKkL9Ru8aF+pLewF8RIoOtchxASioAztpwoyupc
	 o+/lHWD+ulb0KTsOIMVKUcgGgVJF+Xb3BZhfpIJyGKHkbNjkwUvMqPaSLw0IaWEWGx
	 ICCHKAchZRMqTYKUNnnStHtbLsYnXmQaeznfxBd4L5mwPh3/k14Fg3cjo+aUw6O2jB
	 W6XCJ3H5oEjTg==
Date: Wed, 2 Sep 2026 09:31:50 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Subject: [GIT PULL] hardening fix for v7.3-rc2
Message-ID: <202609020931.48FF902461@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this small hardening fix for v7.3-rc2.

Thanks!

-Kees

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/hardening-v7.3-rc2

for you to fetch changes up to 2625480a1bf79c62ffb09aafdf61778e682da492:

  hardening: Default randstruct off with rust for better allmodconfig support (2026-09-01 16:01:35 -0700)

----------------------------------------------------------------
hardening fix for v7.3-rc2

- Default randstruct off with rust for better allmodconfig coverage
  (Mark Brown)

----------------------------------------------------------------
Mark Brown (1):
      hardening: Default randstruct off with rust for better allmodconfig support

 security/Kconfig.hardening | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Kees Cook
