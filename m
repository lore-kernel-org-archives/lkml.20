Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD0439A04D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048756; cv=none; b=jL6NfAxKr1Xsv/cCOcdAlBkaEH3twnyuq2HiU6+LmUVOBQUTz74R3B/sSLqzYxcuT40rlMpq8Tes9l+bQ82c+ruyLJzJyuieXCOjxpbmt3T1dX6ou9449Y3eeziIWqGwimYbisBtRrESP7qdPzAFebR3B02stPZXrAU7RQKFVXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048756; c=relaxed/simple;
	bh=uUa7yVE6L6W8/Qsuvt4JHh1YYSX3OJ1uuCI6A621OM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnbAwgs1d2v4nrtDiwXdkOe1B2N2cjkUjRqKFJeGh1u7bYAW4r2P9N3XqHIi/JgwkD+7BOnSvfgzVei+bIB9X4jZk/Hyz6cqPe6KDuYXjXLqK0axYq/laLViBGBTkjqCCdwAkSfXqzksWWfnqmhRiDsyAkk0DoDbHTNtlzvOpvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QsdJqJ+u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QsdJqJ+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFDD51F000FF;
	Thu, 10 Sep 2026 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048754;
	bh=iR0PCrp192hH4/w+4pv9HqjuW6QL6FbfR+8xwQbpO2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QsdJqJ+u6EUWM7hHocpAKtK0CPa/Swt8defTTbizTppFQ2a0V8MvAOimCjElZ6Zz8
	 EphQKnOEBsHGwy+QAgycQU0GPGApO2XNgwARVKK4PMCK0GqAirw8Vw2bMPpBF0hXfX
	 o1X3X2E6wUE6O+dpAwZ8kGC2KPNyYbt+DTiuwplA+ZHDoZ3bCjD4Tv51+vlb9eRh+N
	 AcdJ6ESqIGpK1NME/ExEVhTbP9kCAJl0XE4m0HhQdUlhThS6ejrAeJ2IzSYJX5ALDr
	 bjbScDWH7NCjb5JiQix+6F5d6WgPYq7W9k84nh5nubjZEirjn9YmyoTg9aM35jT0Uh
	 6bg23O90REIhw==
Date: Thu, 10 Sep 2026 15:59:11 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Cc: Hyunwoo Kim" <imv4bel@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [patch V2 4/8] posix-timers: Move POSIX timer group exit related
 code out of do_exit()
Message-ID: <aqK3r_tJlPrCSFSm@localhost.localdomain>
References: <20260905181551.738186850@kernel.org>
 <20260905185839.816745170@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905185839.816745170@kernel.org>

Le Sat, Sep 05, 2026 at 08:59:15PM +0200, Thomas Gleixner a écrit :
> Move the POSIX timer group exit handling into the posix timer code and
> provide a proper stub when POSIX timers are disabled in Kconfig.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

-- 
Frederic Weisbecker
SUSE Labs
