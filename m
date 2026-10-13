Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCA84718C3;
	Tue, 13 Oct 2026 04:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791864168; cv=none; b=hAzm+ZWXFqW+GCRH2aFltJN14/e/ljuBpMfugcUC72lMpviEpUvyUAcBP8wgzhLghp8nS7HZXu0UBYeg4YeDeGTLPyiDJXRyhSXKW7dQQ7cTEo9S8Guy5IYtt1lkQiX5YnsuGam2pBSckxVi2e1W/Po9uWo+Aig6fixDlncs6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791864168; c=relaxed/simple;
	bh=szk4eWJT0nYrXago6v60UNaRJsbQ9hJXPs+GMxG9C5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJpTTsqWKfixR7UwCDcpq0w92OH6v+J/HEpWR1ZRwH3s6QYby3Nqa9Y5n+Og+HlwHvmKYjjGRL7MRl35vDIWa+GYfZG5pGtyu27pEqFi7PRZV2cthopIZ5BagEcNggm4wRB+uMHIMXJiqlAQ9uwCsvejl/Ck+QYuvacTeJyxY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0mTQQN3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0mTQQN3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2A81F000FF;
	Tue, 13 Oct 2026 04:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791864166;
	bh=U45kpIWGYSA+KkPSXBDC2Qx3zeCRgHPpENWcyaccVIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o0mTQQN33zfZ4iebgh1iA7/JLXLNNpb6ZlKYiINvzKDegj3YdEtU/+Kl7IJKNnUHB
	 rxlvuPuUdWUv0rXswr7mP9N6LNBTPvfuKRLmIaesTVz4KMcntDuN6VIt/96B8E0aP3
	 UJY1VWOrsLQNRmMMyCMhJ8hHSTAXZA3e4TIhBgfwoZmwBe4vUJLWUD6bIZmniqM5Fm
	 c+trZc4v/2TVmtGq4+rlHlnV5HwGHb0fEMG/EdJx2s9mvF9Z1lC6DsRtGlWAqa66zo
	 N5o5t8QqMtcwPmJ7cxGaL6pL4HPEzWsIS8OnPoKIhDZXo+w2kh6L7r0mLng3qjHKg8
	 zKtzm/ujSp/TA==
Date: Mon, 12 Oct 2026 21:02:46 -0700
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 4/5] agents: add a skill to find other instances of a
 fixed bug
Message-ID: <202610122059.771B08B@keescook>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <20261012213452.1863248-5-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012213452.1863248-5-sashal@kernel.org>

On Mon, Oct 12, 2026 at 05:34:51PM -0400, Sasha Levin wrote:
> A bug fixed in one place often exists elsewhere, in copied code, sibling
> drivers, or other users of the same interface, and reviewers routinely
> ask whether that was checked. Add a read-only procedure that states the
> defect as a rule, searches for it through shared interfaces, copied
> code, the introducing series, Coccinelle patterns and earlier fixes,
> and verifies each candidate before reporting it.

Isn't this a basic software engineering skill? I'd expect this to be in
any agent's existing model, but okay, there's some Linux-specific aiming
in this skill (duplicated drivers, etc).

I'd still prefer that this documentation, which we don't really have
anywhere else in the tree that I'm aware of, should be in a human area,
with the skill referencing it instead of duplicating it.

-- 
Kees Cook
