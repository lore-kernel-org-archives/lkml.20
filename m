Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED01C862F;
	Fri, 25 Sep 2026 00:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790295139; cv=none; b=Rj6E5eek1BSpsOhmV/amwzQ3ifpn+Sk5vUzmbZquk2gy2C2pN5+zMt4bhXRy5bcHaOALONhEHdQ+LfB2K4UVQd3SNzTQ5VRHlYts1xqne6NtM8p0zZlTwE4GDwlvopf96eehBF4GrcWfL9JWCm6M02bfdvsUCAbq19AdowlBKaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790295139; c=relaxed/simple;
	bh=/C7YZntSGI2JOvMuOXOiHNCoxqLhaNc/Cjawn+oWjNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjJIFL3whrd+ElEphpfy2qwwBv6Ddl1vRjpeJ0k1tv24IInV6Uew5IGByMRjnplyjuzbjMTdrsFWrR47yGLg3cEEGibccZDR5eqtrK18G/NDk39qnFIZhyV79gQMU2DSLTu5e07OC+wdabNRcQgLE8blQfy8CTcKHBm5L9/CqrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imbDL2Ol; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imbDL2Ol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31BF1F000FF;
	Fri, 25 Sep 2026 00:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790295135;
	bh=PEpreCLE4xkyA8EdQY6ZA3js7OL9+p0XVpxZL1E4VKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=imbDL2OlcbNI/2mOSCqSl7FJn7Ge4Wgzo5i47RNIRU6fpi5cqM89lYypJvWuR9/Nt
	 e+csRTWq4Q4Z08FrL3EFFtkEA7QDM3I+tMUy51Bc0tcMBXA6h7STW57cMfC+m8pCR8
	 +SVzPsgbmOg3YzCk40smcErHZRKedy7fuOhRMoViwtZei1c2CKbArPdVzIF1avWt1t
	 NaKJO0AH3wPWNM1KJPDluz5rOPBJopty0I8kKzKuvmJjQdT5Hdl9JW8nM0GemV1eNP
	 vQOOlFkoIl55dGnNGr3pGpUiusA9ktDqXH2my5tnVAcd+6VCiZSaPDWZiQKf94e9jK
	 d83RsWbw2rmVg==
Date: Thu, 24 Sep 2026 17:12:15 -0700
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: add AGENTS.md as a symlink to README
Message-ID: <202609241709.8B710211@keescook>
References: <20260924134945.3095661-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924134945.3095661-1-sashal@kernel.org>

On Thu, Sep 24, 2026 at 09:49:45AM -0400, Sasha Levin wrote:
> Add a top-level AGENTS.md symlink to README, so agents load it on their
> own and follow its pointer to the AI guidelines. This keeps a single
> entry point for every reader, and avoids adding a separate copy of the
> policy that could drift from the RST.

Yeah, I think this is fine. I don't want a separate file just for
Agents: we intentionally designed the README to work for them. That
there are Agents missing it is sad, but okay. And the Agents are already
trained to deal with for-human docs, so that it adds more tokens
shouldn't matter here since it's tiny. (If it reads the contribution
docs before every patch creation that seems like a good thing?)

Acked-by: Kees Cook <kees@kernel.org>

-Kees

-- 
Kees Cook
