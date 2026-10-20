Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504473;
	b=HlZ5vxylP3B/LtcCQCf2X65E7cDZKWz+hN8Tf6u0R3LceufcUpc9a/RjPdHPm6GBZM1w
	 qxOEMPt3a+WCGmS/FTLOE3M91V3qNonnQP8dqyl4hbo3DfwOQ2DVQt6wYdKEGzcWWc9Bt
	 k6x5CVZPdbSGZ6YtWvpdV75+ol/UPRbQqi5CJqXxOi53F08TgRtv3kFnnICgWJ2arFLLc
	 kul65X8inbSdIT/3rXCFpt6tS0t6HweVMzQ3gBTkT3JH3ixO9lkrksL8cSjWhMt9Hmd1Y
	 VJgO8E+235F80XXiFTbnRuC6rX+7UgVLR1ax3AHu9BHP0uDkLMyiqRkntZiM8rkrs0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504473;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9NiJBWOVUY/UQOLimlz5QAPWwsmY3B5JWfVlvXL3BvE=;
	b=JlNZjRQnlQWS5MegldLEcIVTBUrCccJDA1vwP18/IMUH2KBkmfsZ0UN9+OYkKMaaE3i4
	 bNCsBbtpEdmQQlSYVUwwEEyZteOWUddO2eFonIJMhPoScos4tmC7PeQeONsRWz/eeNRiO
	 vDWizInUwRllJUSzlecYVbrzcwNbOUfDbiFrBkTEHOv8wFWWJas/rf2mQq7feU42YA/qd
	 q7PtREukFp8u0jx3ToAGQKsZXZQpAE3k6N0FKpfh+DSzXmanxt+JJ7JUS/NfF4XDWntEZ
	 kcV1w/9SIlVjOkMTio//g3CNeu2l6jEMhgzhFgB2Pv/NTzbkdgRj9DdD6tdRoZCluBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nB7h357t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D9606B651;
	Tue, 20 Oct 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nB7h357t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0542F1F000C4;
	Tue, 20 Oct 2026 13:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792504472;
	bh=9NiJBWOVUY/UQOLimlz5QAPWwsmY3B5JWfVlvXL3BvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nB7h357tTG/rkHYHKsaYIWHcDdBw3QJj1x7Gwo2qoEgclLJvV1WHBh8vRj/2v1Blg
	 dJrX6DhvN0IQu1Ic8hhqhNbsQccSwMXMP6C5bGEpidcoLB3LPG5XEWpVIUpg4yfL6i
	 3ncMSUxUMOeXhqK6LqvdNOOJ+IW4dYKR+cfUExzI28/m0XE6xzYKOuh/B9XBWhqST4
	 lqj/TcQeqj9gHIhnvH2A9iySHuoN/4seaECx8Bswq2l/TDcBaaEGJItvKeSG+ilghU
	 e27uk7FJ3+WEVDrSJHKEpmIgBIu70Xl0u7zXvN+ilBewE0Zz/lRxd0D29A9yzuPrZg
	 CND3spyhoBkVw==
From: Sasha Levin <sashal@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: workflows@vger.kernel.org,
	ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dan Carpenter <error27@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v3 2/7] docs: submitting-patches: say which commit a Fixes tag names
Date: Tue, 20 Oct 2026 09:54:29 -0400
Message-ID: <20261020135429.3340755-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <bcef59f8-33fe-4bbe-8429-307630dc6bb5@leemhuis.info>
References: <20261016152828.3765695-1-sashal@kernel.org> <20261016152828.3765695-3-sashal@kernel.org> <bcef59f8-33fe-4bbe-8429-307630dc6bb5@leemhuis.info>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 17, 2026 at 10:07:36AM +0200, Thorsten Leemhuis wrote:
>How about this instead:
>
>"""
>Name the commit that introduced the bug in the first place; hence, when
>using ``git blame`` to find it, ensure to not settle on changes that
>just moved the code. If the bug was introduced by more than one commit,
>add Fixes: tags for each. If some change according to ``git bisect``
>exposed a formerly hidden bug, add a Fixes: tag for that change, too. Do
>not add tags for commits that are only suspected.
>"""
[...]
>* After thinking about our recent discussion some more, I think the
>Fixes: tag for a change that exposed a bug should be mandatory.

Agreed. It also matches handling-regressions.rst, which already asks for
a Fixes: tag on the commit causing a regression.

I'd keep one word from v3: "separately". "Introduced by more than one
commit" also reads as a bug that only appeared once several commits came
together, where the tag belongs on the one that completed it. Tagging
all of them would send the fix to trees that have only some of them.

So v4 will have:

  Name the commit that introduced the bug. When using ``git blame`` to
  find it, do not settle on a commit that only moved the code. If a later
  commit exposed an older bug, add a Fixes: tag for that commit too. If
  the same bug was introduced separately by more than one commit, add a
  Fixes: tag for each. Do not add tags for commits that are only
  suspected. The Fixes: tags tell the stable team which trees need the
  fix: those that contain one of the tagged commits. Trees that contain
  none of them do not need it.

-- 
Thanks,
Sasha
