Received: from mta0.migadu.com (out-199.mta0.migadu.com [91.218.175.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BC1409273
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776873; cv=none; b=DPZvpICC5TX2ZNnYOB3N8j+1mpoIWt6SIMVOYyGzBU0MztRBJQ03XJksaBFK279c7hqel17l0/Gp0q2mo5R7vTMbIlDxHsh5zYhMmOVowJgWUmvVkPhkSa4mEo3ZePwEzy7Phs9Hh9AQxk4kUtsIRM28qKAFzsjYP6yqOL7fqU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776873; c=relaxed/simple;
	bh=h902rDfmlKFI7HEFtHSfdriDpJHjffat8oxgIkNBmPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiYyuLjp15V/BQK5qcX+sKfmgSWkNsoH9q5mznKbewPwS1sg6GgDItTiwuB0iZCqgj3agV0mg0mfgxO8fy9fbm52318PQXAAwbmiIMH8qCV4ywHUuorkx27xBL/r7p1Du9pSdeHlWraLot+Gc5eqmvwdF26u5vCAmRm2SF49z80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=qD7NRm2T; arc=none smtp.client-ip=91.218.175.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="qD7NRm2T"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h902rDfmlKFI7HEFtHSfdriDpJHjffat8oxgIkNBmPA=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788776868; v=1; x=1789381668;
 b=qD7NRm2T2MG6b07b/85jTnr8B3Fn+p2Aajc2PvYdpdcrlinz2IpGXosupHOc9qgx0MozHdKK
 tUfaDNQLw/r5xUVRK+Gyhxp93oEOJG8kXd+hAsDbo+P4K1Zx+01WY8irEatJwdrznS7BqYYNAX2
 b4SAeJL6AEM3eDhcc2akcBXWsfdA9hMhDPsDbtOu8wjbauEyC90iKCz0eJvQAJVKFkbazOpPwQ5
 X7Hj0AbDi5gVaTROZENRZYvhdyQuHgsa/ALr5eZvoDzKgPjn5ysMu7LNAKWzBF3Nht5gaaUN8Vx
 C5PXa3OCXttSiN5W4gk6ZCOE1m/4FF7iDLgB4JLgMvHFA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4c1fba6a1308afd3;
	Mon, 07 Sep 2026 10:27:48 +0000
X-Mizu-Trace-ID: 4c1fba6a1308afd3
X-Migadu-Flow: FLOW_OUT
Date: Mon, 7 Sep 2026 18:27:43 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: arm64: Fix typo "initalised" in booting.rst
Message-ID: <ap6Rn5We1wDJ3KkK@wyuan.org>
References: <20260907091248.31415-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907091248.31415-1-hemanth.selam@gmail.com>

On Mon, Sep 07, 2026 at 02:42:48PM +0530, Hemanth Selam wrote:
> Correct the misspelling "initalised" in the arm64 booting document.
> 
> v1 changed it to "initialized", which quietly moved the file from
> British to American spelling.  Randy Dunlap pointed out that
> doc-guide/checkpatch.rst asks that both spellings be left alone, so

doc-guide/contributing.rst ?

There's no checkpatch.rst in doc-guide, I guess.

> this uses "initialised" and only fixes the missing "i".

And, future readers may not know what was in v1. Or rather, I don't
think mentioning v1 here adds much.

But I think a brief summary of your discussion with Randy in the
previous round might be useful.?

> checkpatch.pl suggested "initialized" because scripts/spelling.txt maps
> these two entries to the American form; that is addressed separately.

> Only the documentation text changes.

Nit: You seem to prefer spelling this out, but the diff is fairly
     straightforward. Do we really need to mention it explicitly?

> Assisted-by: Cursor:claude-opus-5

Of course, I don't know whether this commit message was written by it.
;-)

