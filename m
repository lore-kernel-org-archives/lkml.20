Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA51C30DD2F;
	Tue,  1 Sep 2026 03:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788234175; cv=none; b=B2pjdZbLLu8QmKur7KbEk9EgjuD2HRnhrnVkCox4OjEAJxGS3OdnGT8tC9QKnrCzk4ub2dxrINR3972tr2LHKr3VERFIHA4luGIJ5yNXSIi3aOHG336JeZWSXYoTuA0aAtrkVfBmyEYiwKb7GZNVUPDueq6fWCv6kOpMKBsh+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788234175; c=relaxed/simple;
	bh=G89MGiUGN6wIcZSWb1ZsN0vVPHbQnHsePBjjqM9tn7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBSkkcDtgXIVN0OyAjyq5EZwwtAqokLltXsDMqLBkc+BYK9tbSyaL1HcvzgrUhB4qSPEdRiFrg7O9fj2PJmDCwmW7OiObCdtaxvcUQ4LZbI+laUZDaV0GPontlH81latEvViCdq0dQYSbeuU9yTIJq0Ee0nu5gMf9weYS187bjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJ8LqYiZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJ8LqYiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0261F000E9;
	Tue,  1 Sep 2026 03:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788234174;
	bh=nIdSMDhEc8u1zhHnOTeFtUdbowkBs12N1+BcyzKGtPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UJ8LqYiZ+l53lNyjZDDE2sHSarZHw3U1OOGgvMOLqQBnXAkAca8noRuu4UIJxt5yW
	 EByJYTiH7D81WnjSvpGZn4S9cGfeq2Fz6sF6YRovvJMkyQWs35cs0r8U1q/XW2AQzD
	 R+Pz7GpDj2ms4soJ+ekx1BXZCVzv6Ae9iIudb8w/0GvNUpNbftc/Km7JJrFeSWt3E/
	 AVoJunxX8dsb8Ybjr+42RmjFHIG1dbJwk9ktI1nSMCIw+r89Z4SERI7JoIOciqR7VI
	 D2KWdCHWgOKguCthHHZ0Zxc6dmx+B0TE5cqS6xQyfvlKd7DCJav12M1DpkYnD5UByh
	 htYz4i58MWyVw==
From: SJ Park <sj@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: SJ Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 2/2] MAINTAINERS: add memory related docs in core-mm/ to MM - MISC section
Date: Mon, 31 Aug 2026 20:42:46 -0700
Message-ID: <20260901034247.92019-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831-docs-memalloc-guide-v1-2-547718c274c1@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 18:13:02 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:

> Previous efforts to make sure that mm files are properly listed in
> MAINTAINERS missed
> 
> Documentation/admin-guide/mm/
> Documentation/core-api/memory-allocation.rst
> 
> Add them to "MEMORY MANAGEMENT - MISC"

Makes sense to me.

> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
