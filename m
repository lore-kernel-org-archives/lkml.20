Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BD93E3170;
	Thu, 15 Oct 2026 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078496; cv=none; b=LhoO9KEJAEk0R57jj6ama0AfOMa7oa9yJbnv1Cq7bRWU05TvmZJnMeKdEKQWRAmusXvBAIpkRw+jBL1WOgVhhQ6pqeIn2g1ek/2fXu9WDMfN+50rnys+VVDyPG0+O7af4CM6MIaHaKlIktzsd9OlVJaPLR15xJ1U35iJxsDx+Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078496; c=relaxed/simple;
	bh=xCoWm76K7Je/Bde4Db+58+P61QXkeYtjOfp6416uJn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt0GJKB1KicwgjfK2tVCqmH5/3knOwQK96mzGUXFkgtn+Ux/6+Ppixd+lEJx9dr2AnISRcVUgl8t4PfuQsKARuZ6ODB6z4feZrBOlBJtMpWHJfXp2YaNuBpXrWgpBxTPKxtyWo1OfOZJ14vXBaBZ1lJdczIY0PMLY+6aCriMM3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtbYuSbu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtbYuSbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F191F000C4;
	Thu, 15 Oct 2026 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792078484;
	bh=sChR5Hau90j+23n1F1vs+V5WMT8DmxEKb5dTXeNjTlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BtbYuSbuiR7+Jkich3+6fT7q1jZ0MgEKeWx3xhOy8v4G7rdo3Px9TKtdEcteJEBKN
	 EZ46R5F6fNu13bkp/ocIlLgGqzd6jxXy09wLDlcHXc5/+N3GVviVadmNGBQ1PjNbo8
	 pzBOYOU3t2/+MWaMniu23HloIo/VQjz+eVID5uVcyJRP1JWgBpTyDiZJRN+y6BWrBN
	 gCabmyNzWknmGIUNwQ7V5v8+R6vLE83cYt2ZTtyjyyGx0Zkt6cbiEHQi7uzCThgRB+
	 QXMeadqn26PPz0pIehwZOlGWhE3QIK60szCiSxVsso4gJWYha0E/x+2o4e6vPF5YvS
	 ioO9UHDUUgxGg==
Date: Thu, 15 Oct 2026 08:34:44 -0700
From: Kees Cook <kees@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Theodore Tso <tytso@mit.edu>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Jonathan Corbet <corbet@lwn.net>, Sasha Levin <sashal@kernel.org>,
	workflows@vger.kernel.org, ksummit@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	"Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 0/5] agents: add skills for Fixes tags, stable tags,
 similar bugs, and commit messages
Message-ID: <202610150832.58E80C02A@keescook>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <87zewiy1sd.fsf@trenco.lwn.net>
 <202610122047.A9E381A@keescook>
 <CAMuHMdXR+U+pgyN+B=trSuPJuS5Kn1-kN=VMFPRSvSUiiwbqDg@mail.gmail.com>
 <202610142149.C3CC39B22@keescook>
 <atDWaGJegsI3_Q8K@mit.edu>
 <f7734347-efe7-46c2-96d7-0d9d6ec19e67@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7734347-efe7-46c2-96d7-0d9d6ec19e67@leemhuis.info>

On Thu, Oct 15, 2026 at 04:35:27PM +0200, Thorsten Leemhuis wrote:
> Can't we prevent all of that somehow -- maybe while also improving the
> docs for humans? Is one of those frontier models maybe now or soon
> capable of generating and maintaining dedicated skill files for less
> capable LLMs from documentation written for humans? Or at least pointing
> out inconsistencies when someone updates one side but not the other?

Every release, we ask, "Treat all of Documentation/ as the correct
instructions, and examine all of agents/ to find inconsistencies,
redundancies, or conflicts with Documentation/, and correct the agents/
docs. Then do a pass to distil instructions in agents/ down to only what
is strictly needed for agents to operate."  and commit the results?

-- 
Kees Cook
