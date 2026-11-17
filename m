Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906050;
	b=jTph//F8hZ6AfTZlHg5+9xMOI5wmdtiHekLpaZID3ZO9OZH0HE9ex4+asocmUMKTCoxN
	 tk5j89ZB0M9WEdadF1wNZgZQyoTj8a7aB66NLqnemjw8kjoNQO09HMrSr7aPOTg93z1j/
	 HFzUxfVt5+wD8E6o+zqCfTgJ4rSpbVyaBqilDej/2FNI9HuzAA911MuAlFmlm5j/uHVse
	 ondHHi8ldXp7fZHoIszcISmcl9hhS7DlwZ2LIrs/GIccpME0qec+REcY3HC7onz4or0op
	 YJjIyDQUxzD4Ysb6xcHP5iMJyNoNebqmq5H+aDOOCU2nRFTdc96Xfinn/8zZHNXFS3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906050;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PTksCsvnNJzaK9oH9UsAvGmX+pigjQPtrC1u4TCLViY=;
	b=PqR+6jKQ9F98AI4SB5KCF3FcCFbZtHZi/MCqePRXhb8rQMgDEMNf96mDBH1kmJsrJ5RF
	 ooUUkhp+Wi7vw42qLKe/AtqQAYmblLGGXaZ4ShzoJ4vwf8obly0MaKUmnLiJ8OVT1lYLE
	 cwFVJAbPxCEbroPigQmgUEI3WGIbdtwyilCnN8udOHz2tW7VUEbXwWJBMcNmTk1EKnpyY
	 fUxuaoMWCzv+liIOfHpvEamep1pfq9eeBNGrd7ADNYhLYhL019UKoyDF7fSkPcC6n7L1M
	 lehmDyqmZMC/lSqiouW920O0LnAuNMRBb36WO/y9iA5ykIPF+9ISbsMe6HcqS+XfJrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZlBzA0Oy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F304606A339;
	Tue, 17 Nov 2026 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZlBzA0Oy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EF81F000C4;
	Tue, 17 Nov 2026 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794906049;
	bh=PTksCsvnNJzaK9oH9UsAvGmX+pigjQPtrC1u4TCLViY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZlBzA0Oy4uu97TU/307QKVXMpZwZbqG7Lb1+v0EYaat4XqC4C3DQ2dP1DiiuQ1l2t
	 HXwz0FRsTA2hHCOs7s3reH9v6JoWfhSYLp7u49zDm4BgIr0CxMaMHDzup8BOqwXWqE
	 njWOaeFUduMcfls8OMtpRpWRHU+T1nZsPLdxiH6k=
Date: Tue, 17 Nov 2026 10:00:44 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
	David Hildenbrand <david@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <2026111728-crust-oops-51d8@gregkh>
References: <20261116200515.352387-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116200515.352387-1-sashal@kernel.org>

On Mon, Nov 16, 2026 at 03:05:15PM -0500, Sasha Levin wrote:
> "Describe your changes" already asks for the user-visible impact of a
> change, but changelogs for fixes still tend to say what the code does,
> why that's wrong and what the patch changes, and stop there. Whoever
> has to decide if the fix needs backporting is left to work out what
> the bug does to a running system.
> 
> Say what that means for a bug fix, in two parts. For users who aren't
> looking for the bug: what a normal workload is likely to run into, and
> separately the worst case and what it takes to get there. For someone
> triggering it on purpose: whether an unprivileged user could do it and
> what that would take, since a race that no real workload loses can
> still be won by a program written to win it. Give the paragraph a
> label so people can be pointed at it.
> 
> Coding assistants are told to commit a fix with a message that
> describes the problem and the solution. Add the user-visible impact to
> that list and point them at the section.
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> Reviewed-by: Willy Tarreau <w@1wt.eu>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
