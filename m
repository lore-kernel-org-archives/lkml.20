Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32684DCB0C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792420152; cv=none; b=H+RJw8cbq6JPqa8Rb+HU7G44yNXmvFsE+y3qS5gsC4gmMLof92h0d8GizUKSeqJUMz4wVvKB9Yk7b/QB9WFVxuxZ3LZpm14qtGvJuGxnJ6RVDcaqFILEzhyuDMteLHPKGv3+9j3mOPgPKKnJzl8UEriYzA4D/chBhHfsCR6RMss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792420152; c=relaxed/simple;
	bh=/3GYM6e3KSQwOy5DHFvv/ek3eAXA4BguOnW6ebsVCBQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kYG3IfpIK3Tv8C80rakKvYqMaBlhf2Ui4U2Xy71cyeUSwFV+F79qY29dorXO2SBm+T/VYmpfJVHR1GFTDcd2wupXqOyspvqOMVBPzQUREN9+8LBLo7e+IuZgxA8mfv4IhdGFtj94r9iNabGEPJcb19IfKJ/QA7E9xoX3o+lRYy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pPFHK3Bl; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pPFHK3Bl"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 52BC840A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792420149; bh=cbQHpCyY5KQ1RW2CdSwyxcYyKJ0BYtbi3mnA/u0WO/U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pPFHK3BlK9dwd1ufFOoc7zQeylOlrADhrQd88B9Yg5/dYRafLUO5eVLxJhTQfxlls
	 wEIxKnOwYIhSyTsEVPrAOg/AnIe9mXzq/GUyOyUI93YozNc2THGjpMff5p/c5Vq+u6
	 LWDgZMCSd8udd5n2QKyW3RlK1lxX+LI3RqinAcaxiyfCQrgT1ipHGDJPNvkRerW3cH
	 jEMBsd70YcdQBBD4oYHPMUYaikb4MDtEMDzSTJv+Duue4AbSMHQ+ve86jy8ljgt/9r
	 a1aqtk8g5TPp82JxUuz0fnX5gWDFQFfcd+mDsmfxK32dPl/kMJXyUuKBh/6AT2yXie
	 HyZWlfoOvQyAA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 52BC840A48;
	Mon, 19 Oct 2026 14:29:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>, Heiko Carstens
 <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [RFC PATCH 0/7] scripts: convert remaining Perl utilities in
 scripts/
In-Reply-To: <20261019133452.4826-1-breno3011alves@gmail.com>
References: <20261019100505.3199861A74+hca@linux.ibm.com>
 <20261019133452.4826-1-breno3011alves@gmail.com>
Date: Mon, 19 Oct 2026 08:29:08 -0600
Message-ID: <87wlrd932j.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Breno Rodrigues Alves <breno3011alves@gmail.com> writes:

> Hi Heiko,
>
>> That is an odd reason - if I'm not wrong then you have zero upstream
>> commits, and now are proposing fundamental changes to tools maintained
>> and used by others? I guess this is 100% LLM work(?).
>
> You are right to suspect that I used an LLM as an aid for this series.
> As required by the kernel policy, I will include an Assisted-by: tag in
> every commit to make this fully transparent.

The tag is no longer required, but openness about how you did this work
is. 

> Regarding my lack of upstream history: that is true, I am a new
> contributor. However, I fully understand the code I am submitting. The
> LLM was used to speed up the mechanical translation, but I reviewed every
> line, checked the logic, and tested the scripts' behavior to ensure 1:1
> parity. I am aware that final responsibility for the code is mine.
>
>> So an important part of describing any change is *why* you are doing it.
>> Why are you doing all of these conversions? Some of these scripts have
>> not seen changes in decades and are likely unused; why do we want to
>> mess with them now?
>
> I would like to clarify the motivation behind the conversion, because I
> do not think I presented it convincingly in the cover letter. The goal
> is not simply to "remove Perl", but to reduce the long-term maintenance
> burden.

What is the maintenance burden of scripts that have not been touched in
decades and, perhaps, are not used at all?

To the extent that these scripts *are* maintained, they have maintainers
who understand them; that may no longer be the case after you replace
them.  Who will maintain them going forward?  You can surely understand
that there might be some reluctance to entrust that role to a new
contributor with no track record.

> The kernel already has a clear track record of migrating critical
> tooling to Python (e.g. get_maintainer and checkpatch).

Huh?  You are *trying* to convert those scripts, that certainly has not
been done.  The current maintainer of checkpatch, I believe, was not
enthusiastic about your proposed change.

> Keeping a
> residual set of Perl scripts forces maintainers and contributors to deal
> with two environments and two sets of idioms for the same class of
> tasks. Unifying that code base in Python simplifies review, testing, and
> future contributions. Even scripts that have not changed in decades are
> still part of the tooling ecosystem and may be used by developers;
> removing them from the Perl equation is a consistency gain.

People running them do not care what language they are written in.

> To reduce the risk and demonstrate my commitment, I would like to
> propose a different path: can we start with a single script? I could
> prepare a patch focused only on checkstack.pl (or another script you
> consider a priority), with a detailed justification and a test plan, so
> you can evaluate the process and quality before we consider the rest of
> the series.

You really need to justify such changes beyond "consistency"; the
existing scripts work and the ones that are in active use have at least
some sort of maintenance that you are attempting to sweep aside.

If you want examples, look at the kerneldoc conversion.  There was a
clear reason for that change (it has to integrate with Sphinx, which is
a Python application) and developers who spent several cycles working on
and evaluating the change.  We knew what the maintenance picture would
be going forward.

This work looks more like change for its own sake.

Thanks,

jon
