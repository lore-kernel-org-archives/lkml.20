Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1064E4C39;
	Tue, 13 Oct 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890071; cv=none; b=RlcfVOeUgm9WF9QZN1bh4XQH+KFRFhdnS4kS9FkzgwlklZK7sqrc/pSiB6JsVA8AgXwLOFbcu1pqdMhfsHWTRsxHYNDjm0N61c7u6KFXLd+MKP7APbNtOM+OSOEWjRfBv6Tl3YJcib6qehLEjvmbtr0FlkorovUlzBVsC04SUiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890071; c=relaxed/simple;
	bh=5IPX/CPJ9IcPjEBANPSPnFbcFBsmhiop5+3X/TWHros=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEtwyx7lo90EfR2BT77ll5usAUatnZuMwRAHcs7c1TqPKn6HAJVeoA/2qTrO0xhwJNBCA9vhbBBTVEU6qX6IHQUSd2K7muFvAqr8Lna9dHQrBYUOi6x0lLLe47s8599jphcfCGpaicCVRoPuykvQasYo1O59ILebFabjm5tpZfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5HwIwDz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5HwIwDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40A931F000FF;
	Tue, 13 Oct 2026 11:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791890070;
	bh=NW4IF0AJt3oAT3QurobbX6eIHQzVLLR8efyNyk7CT3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i5HwIwDzwLmXNgdjnTuU7ttXoOkxNSfNwxFJVBhK+Evxm0tJ07VyeqfQ6zKwk7U/B
	 8C5W4s2g0GDDQSGr2plB+stuuNQ43+UV/PYOVROJTgmPHwMfvKcGJ+c5KH5OcNHPJJ
	 +oSCEDxFKwtEDynYk/rwPF1Xa2F5Rr9GyU1SgUg3lYKAY5jvb4ZWpoImQOnmiH5SAe
	 y0djHxLANQbFNCGw8+EyVRPfed+qqqi3dnuB2rb9pB6nbYLh8SM7Vv3KimwpU/S3ux
	 ohpLmU2Wks8syrVuuAzv0EDhfBHsMp9sP41vlKL0lN0GTyXl85Uwe5Ag0xLo5ocTZt
	 ltfyu6zEowLaw==
Date: Tue, 13 Oct 2026 07:14:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Kees Cook <kees@kernel.org>
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
Message-ID: <as4Sla3Szx04f45F@laps>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <20261012213452.1863248-5-sashal@kernel.org>
 <202610122059.771B08B@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <202610122059.771B08B@keescook>

On Mon, Oct 12, 2026 at 09:02:46PM -0700, Kees Cook wrote:
>On Mon, Oct 12, 2026 at 05:34:51PM -0400, Sasha Levin wrote:
>> A bug fixed in one place often exists elsewhere, in copied code, sibling
>> drivers, or other users of the same interface, and reviewers routinely
>> ask whether that was checked. Add a read-only procedure that states the
>> defect as a rule, searches for it through shared interfaces, copied
>> code, the introducing series, Coccinelle patterns and earlier fixes,
>> and verifies each candidate before reporting it.
>
>Isn't this a basic software engineering skill? I'd expect this to be in
>any agent's existing model, but okay, there's some Linux-specific aiming
>in this skill (duplicated drivers, etc).

This actually comes from a local rig I have to teach it to use tools like
Coccinelle for these tasks instead of going on a 10 hour, 50 million token
adventure auditing our entire set of drivers in the kernel :)

>I'd still prefer that this documentation, which we don't really have
>anywhere else in the tree that I'm aware of, should be in a human area,
>with the skill referencing it instead of duplicating it.

Ack. Let me think about this.

-- 
Thanks,
Sasha
