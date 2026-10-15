Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49947528452;
	Thu, 15 Oct 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072658; cv=none; b=ey6OTSAas1sjUyq27CwGO5slPjrWcFyYvhzP4gki35z380o9GeWcliR4L2Au4WVRWfnw4iMPvXBJUTumkNa6EOOgdLR8QpPUMW6GtdC8/Yau1ChA0nBP7ih8taC8GP59fMDVeyHVtAYhxEcCtdAEKok6FlEDzQuk5w271Jx+Jis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072658; c=relaxed/simple;
	bh=tR+B+P4H5laV3j7zzZU07VqSUEtfICzqGov3sJhZoEU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Spqa/OfZ+1Ns2fj/lsrJlegpvKoQakaJWXTnsi94LRDpg2keQTn78O1zC0uQSkKk73Y4CXanjYhEEaPrPpZO0R9a6XzcuBKyMnEx8AIbP6g1/RrnC1DKJXayST7hLbZ6S20f7GazJERRTN9BRV6rKLp/xyqJ+MUoCS4h1thao9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fb+ScPOv; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fb+ScPOv"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6A7E74091F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792072656; bh=AKSKxWPs7gQhreA/cSauuNkxef50fLag1JXhVoL4XXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fb+ScPOvonBUlpQ4VypD14R29RRIU8up9w9NubtFF/dZHNr14VzeH+4PPLcFwrtHd
	 2pEzAsVYtqojH8ceBvXU7pseR/aFl3w0YHv5VbwhdUjUx/ZHD44kEND9EkZegRIEMb
	 RvqsUHNYu18pGWMI0zosFR/+8cIBBuLKzHbh2okB3GGojoj0CgK5fWyxHPd/U1zReV
	 du6PDL5T0HoVtWGh8ffzGF3ldizED52PvmPMP8WrJPqSC90Msgghk7i084FYi9K1QS
	 dSmmgEWunFpPAEP8QbtHQZFbBxDt4/hxqU2AG9E0soppky5XxDqTIsnW4XHOHdDu0V
	 yInvmB0mxVYTA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6A7E74091F;
	Thu, 15 Oct 2026 13:57:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Sasha Levin
 <sashal@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org,
 ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rdunlap@infradead.org,
 skhan@linuxfoundation.org, tytso@mit.edu, workflows@vger.kernel.org
Subject: Re: [PATCH 0/2] agents: add portable agent skills and Fixes
 attribution
In-Reply-To: <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
References: <cover.1791499378.git.sashal@kernel.org>
 <20261014174838.114990-1-ojeda@kernel.org> <as_Cr4FhzyAh-kC4@laps>
 <CANiq72m6okeCHuR8BCGENTw=wJhfXXZbXZtJq8xtoeVfvfo3TQ@mail.gmail.com>
 <atDYWe9L0tv90Xjk@laps>
 <CANiq72mgS15ZKwd-u1t1xvAaNf3ivpXdUMmVDfmGRyq1OewLvw@mail.gmail.com>
Date: Thu, 15 Oct 2026 07:57:35 -0600
Message-ID: <87jynjrrqo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Oct 15, 2026 at 3:42=E2=80=AFPM Sasha Levin <sashal@kernel.org> w=
rote:
>>
>> Sorry, what I meant to say is that the spec seems to require markdown as=
 it's
>> preferred format. We can experiment with other options, but then the ris=
k is
>> that we'll break some tools.
>
> Ah, got it, thanks! Yeah, at the very least the `SKILL.md` main file
> should most likely be all Markdown inside (and of course the
> filename).
>
> Now, if we go with `agents/` instead of `Documentation/`, then I would
> personally prefer Markdown for the other files in the same folder like
> the `guide.rst`, but that is just my bias, and it has a small
> disadvantage: if we happen to move things between `Doc/` and
> `agents/`, then it is a bit painful to reformat.

For all that we hear about how smart these tools are, are they really
incapable of dealing with two only slightly different markup formats?  I
would really hate to bring in a separate format for this stuff...

jon
