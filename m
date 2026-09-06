Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBB5282F24
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 01:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788657722; cv=none; b=Iu6HzA2U1E56N/pzLZ1rmaikG6jmLeTNX2XfT+M9wSN248VFRvSb0AsaD8AQi+ppHWP81S75oUEgecBPHX2Ck7KhkmjCliUFesBmTLppF5bTgvkDRWGCbs5fQ9Ha/ItPSmRDV/XPDQdUlFipm1Mfb6vLoApPUNJirhRgqsROdCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788657722; c=relaxed/simple;
	bh=wXUUH6yhCmrXS80kRcznMxtHCPlTBgUNOrJTCuhSECw=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U9ApyzRZMXd72Jvbdr+1MN9xhLCgmtyJLtjqpBm5zTmzHmlqgZUPzQ/I4F4Knft57OvihqKhIddmBO9ZaEWa0FI9h34xGH0LcwMGgCuGcrajrBCP79CCvv08KPTS464dKv2CuYKS2Hfxwwv96pgxcNCn8HfI/jSNCjDNDmpIuL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ipbacX5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ipbacX5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B961F00A3A;
	Sun,  6 Sep 2026 01:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788657721;
	bh=wqSaCSIy9+krlqghXFY0aRu+yxVZT4XDFRqLihL2kCk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ipbacX5DqUyO/TnC9k6/fRxIPejZlohDZRNopLHkA8GDCTBE1vweh7vlEAXTihOc/
	 xBV63ig0gJoWHCw9bmNR4MifRYsUBx+5RyA77lrU915KSaz/cjOWBEN36Rht+U5p/l
	 p8Qo1YGqnM5KJ5c3RMPtS/9xoUULjQB841+vtekA=
Date: Sat, 5 Sep 2026 18:22:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Cryolitia PukNgae
 <cryolitia@uniontech.com>
Subject: Re: [PATCH v6 0/4] checkpatch: userspace improvements
Message-Id: <20260905182200.f5bc96a5336d47e05bba0b49@linux-foundation.org>
In-Reply-To: <20260904110230.1219037-1-pvorel@suse.cz>
References: <20260904110230.1219037-1-pvorel@suse.cz>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  4 Sep 2026 13:02:26 +0200 Petr Vorel <pvorel@suse.cz> wrote:

> Few improvements for user space code + --userspace option for projects
> which vendored checkpatch.pl.
> 
> There could be probably more checks which are kernel space only.

Thanks.  Let me put this into mm.git's mm-nonmm-unstable branch (and
hence into linux-next) for testing and additional review.

> Follow-up: 99b70ece33d8 ("checkpatch: suppress strscpy warnings for userspace tools")

Sorry, I'm not a fan of inventing new tags.  This isn't a documented
tag and nobody has ever used it before.  I altered these to

: This is a follow-up to 99b70ece33d8 ("checkpatch: suppress strscpy
: warnings for userspace tools").


