Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5DC4AAC73
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051434; cv=none; b=pxX1VU2RKzfE858AHEbtJNqyyD8NbH6xoTmaB+4MHsDMygmBjn161tlgRMEZDzqrVNMTM6VzYBdT4OL6BnDXxosczh3kUELG6NQxekaymngoo0TTyu7mTNbnzAZR8vi2i+hBuErMeOxRtmpbzGy1ojF99cEYJlxfjcqGSSj0Qmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051434; c=relaxed/simple;
	bh=XobB0GpO5sYyTZ2hFUN5pcaQvo46soO0LtUdcW2CECI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAVFfCAuA0g5QHUS7ywxfLhjFgzhBs8x9Idslyxk3FSUIeJbR02ouj8kCDyl43IZtzXJgWN/iU+OUocSySNDl7tgGa+fcWv2pv3/YU2zqlAB+/uuKlUMf8b2MeAHOtU32mwb7QYwYZZHJBed4SNc+GXegpS7YivqFZL0hhQP6pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W81Ac3HS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W81Ac3HS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ff680331aso19140355e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792051431; x=1792656231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1tCr4+FZVRH42/s/Dcv1+y2zUOpfmIVxo7wybQlZ/hQ=;
        b=W81Ac3HSuOXcQDbDcaA0Ktmt9SaYUl3EhfwMxGK+RlLjsSiuMQy3qafijhj6Zzx2lM
         DOtIb9lkVI30otNqnjvYQdg+qV9xmxCEHfjJFOYFBTlbY1K9RLRKV3LkSQN3W1Z8wLnS
         BCaz7aO0WyMuDaZuamYJoA/YKnwrmaY2wj09xX1YJRreppWA4ZLffLcS5CR5vJmOcVEh
         Ci2HTZHFtgTiK7s1bM8NuIJ1uz8LSQqHqX92moMAfOKf2RFxOrU9KzpJrUsFWYkN1L1T
         O2Y8vTnBqTOzFs99T9m4ICdZHiqRhNNZpMfJfHvM6wdYcDDTUTSHsILsXhvFt0iB0p23
         XBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051431; x=1792656231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1tCr4+FZVRH42/s/Dcv1+y2zUOpfmIVxo7wybQlZ/hQ=;
        b=e5QXa/Qh+zGOG1ebq3Ad76eOSBO/0EROOazGIpD7tBp1GYwzOfM/ve0jL+0mXB5F+N
         HZkoEwRf1QXaqhBa7xfCzcemIZaQQyKwPPw4160To28gbmN5xALA1mKMVv+SrJKmFSN5
         zubwiaCBRmeGel4FzWP2al44/6uiC8Xckk0TRrb+5lebMxtFk36eepV8llHQdQ52n4iA
         cksb3VhV+H5Vwk7NNIrus/T/ukXPvEGleNKuMv827A8hqkDl6oXk45qTwqOnhZclPO/q
         xePlBsSp5OtfxPLhuhW4t8s8IZn341WpWHeUgOZjkl9ib9obE+9vF7w+iP974yRJXifg
         dzWA==
X-Forwarded-Encrypted: i=1; AKwUvBxnnACSFYfmc50DPuwPBs32E5jhhweoYdBEFn0E6aeo621HYW1D/PBr0kybD1jUV8I53kofRMPCv6VNic8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrDm0ZH6YgS3g/jhz+UBC1JTzvezcbaaxXcNw+r1iotZDy2DY2
	wqP4sOWfqKtkP5VwiL0hOXtoXB0de6mI4VnzsLuFtNknpMTr7aqw4Cu3
X-Gm-Gg: AYBFou2f3yvWKSVXSfv1OYnGfP1X0N2w2LSxTXaE3CSGcQCTFhAAQDdBSsieKvgHCT+
	ZDBwdS3RMWY+hsBJmbTVsT38Vt82x4gzJrKfg7QCkLol0JA2KqGWGHbgUmujrHNttWp8s4hkS+U
	i7y+bWdr2tnLfPwJjFfmP7m2h/uK+LeHsYd5B8bGryf9x1k9JDnemfGsMCv478AmuqARn8YyLRC
	L7pRGL9inGRxE+b+Y+EXj2InJDmRvlEYpJ6E/gHG0rGvZgs/JG7CxBgOBX8OClbK4n1f64Qsk+B
	W6ZZZGbT4UgQc/u0z4wWCQ+QbsV7AVNCNnhPCAtlFhHdrnYG6fpcW56z9ogBZD6X1m2MMbsfpPF
	HkgIA9vl8GZRL1aWvA/fhG/VP9bMhhyR6r/O9CyMIWcFGI4XljP1WkuwZ7Rhv0lkDly3CRQqF5Z
	8fLIDan474tEAKy/kQS02Tl0rpXHY7Uvl9Pk1owvdP1bpdk3s6mGw8iXHHPuZi9dr3Wws=
X-Received: by 2002:a05:600c:4e89:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a18e4ac77amr406529725e9.30.1792051430698;
        Thu, 15 Oct 2026 01:03:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0967affsm15482509f8f.1.2026.10.15.01.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:03:49 -0700 (PDT)
Date: Thu, 15 Oct 2026 11:03:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2 2/5] agents: add a skill to determine Fixes tags
Message-ID: <atCI4q2HvqVXOag1@stanley.mountain>
References: <20261012213452.1863248-1-sashal@kernel.org>
 <20261012213452.1863248-3-sashal@kernel.org>
 <20261013003535-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013003535-mutt-send-email-mst@kernel.org>

On Tue, Oct 13, 2026 at 12:42:19AM -0400, Michael S. Tsirkin wrote:
> On Mon, Oct 12, 2026 at 05:34:49PM -0400, Sasha Levin wrote:
> > Blame and existing Fixes tags can point to code movement instead of the
> > change that introduced a bug. Add a read-only investigation procedure
> > that traces historical behavior and checks candidate commits against
> > their parents before returning a tag with supporting evidence.
> > 
> > Keep the skill entry point and procedure together under
> > agents/skills/find-fixes/. Connect the procedure to the coding-assistant
> > guidance so bug fixes get verified attribution before finalization.
> > 
> > If the origin cannot be established, return no trailer and keep the fix
> > as a draft. Applying the tag and writing the commit message remain outside
> > the skill.
> > 
> > Validated with controlled histories covering moved code, changed
> > preconditions, incorrect tags, shallow history, and reintroduction after
> > a revert, as well as a real kernel fix.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> Current documentation states:
> 
> 	A Fixes: tag indicates that the patch fixes a bug in a previous commit. It
> 	is used to make it easy to determine where an issue originated, which can help
> 	review a bug fix. This tag also assists the stable kernel team in determining
> 	which stable kernel versions should receive your fix. This is the preferred
> 	method for indicating a bug fixed by the patch. See :ref:`describe_changes` 
> 	for more details.
> 
> 
> the second part is easy to miss, so "what about an old bug in commit A
> commit B exposes"

This is pretty common for Makefile cleanups which enable COMPILE_TEST
etc.  The Fixes tag should point to the commit which introduces the
bug and not the one that exposes it.  Someone could backport the
original patch or expose the bug a different way.

> and "what if the bug both in commit A and commit B"
> are pretty common questions.
> 

This sentence is missing a verb.  I don't understand the question.

> 
> 
> 
> Worth answering, maybe, and maybe here: the implication of the "stable
> kernel team" rule is that the meaning of the tag is actually: "if you
> have commit A then you need this commit".
> 

The Fixes tag is useful for stable, but that's not the only point.  It
also means that if you don't have the commit, then you don't need the
fix.  It's also useful for training AI for example.

Someone told me that the netdev team was leaving Fixes tags off patches
that they didn't want to be backported to stable.  But when I looked at
it, it was documentation stuff that is really debatable if it deserves
a Fixes tag or not.  There are some gray areas.

regards,
dan carpenter

