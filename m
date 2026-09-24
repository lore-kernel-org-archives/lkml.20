Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14954356747
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224507; cv=pass; b=RcyMmsppi8h9XcjjoHxwIX5+ucZw0aamkE6p0YBPp18EHt9OmZlqmKXC6cow7qUspj/u2XUmsIJccdGVT5JQNbKY3VPlBNhnw4siBO8v3/FHcI1IMyGQRbuu+PunrolESW1eU1XNwPjJBrfELLduD61BbDeWgz1AuY6lXaHsn04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224507; c=relaxed/simple;
	bh=th4Y241gR8fKqXdszPTrMDgI2QzkfuYH1UjS4q/XE0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFDVcRJWgxTUx7hB2iYKPRWYp9mlB4lBAFBgXwPdiEQX6Ox8elwg+3kN9cl9ajTKO/6BQKNpOHgUvuxKuF+D5RSDmFPSpK+1QhpICV7k89KemfNTZNvbol3ZWlvT7ZRJamPDiC96iF7g4jcoKKfdOl+pSaobD9tKT9MOfzCpVVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yn0yF/PV; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yn0yF/PV"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a36887bso981639b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790224505; cv=none;
        d=google.com; s=arc-20260327;
        b=cjwOtFCh4TlDAQb340eWtpJiMWYbZLdfV23/8qICuMozEMfJqH1rQXAS1UBWfRclhc
         LfpvZn39k2KKszTpt/oU4Owu3P59f8F2V56qg52eDelnFNmBTMa/W1QvRgpcaZVkkEiv
         XD+C2sXzubS6F5JCQBNmWnU3VR4momNNWW+e8cU8oo8N+nDBEpJLv+PeXwG+VmdFKzP0
         UY2wG+i1pBonYI66zMl1u+IjyOj+gF8JOsQTpvYj8Wq3C4Fka1MAY31ACdfhR3ciYcbh
         MOeuaF/jsxvY1Qydzp+TDETAxhQ3krqpnqnyctNRpz7Bw0t3R4pb8NooEeGGl6x2Ori/
         BAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HgPIQmEvwYaItDda9jIvvcgV4nx3Zf69aHXsVWLINFs=;
        fh=0uxEOejlh1FS38bgNbs+M9vpHfgAgFvn11bAgKap6U4=;
        b=eTm+zO1I8HQAuea7fAC43MWkBZa9BS+aY/LDRbEO+0Y2Lz4Wk9+hef1zrJ0YmXjiAy
         LguJvfwtiWt1nTjQljwA1wCTRX6nUK852KAk2GU6y895SgFHNkC6XdOdK54v65TqDcFG
         3rR/qfVcwweLLOfG+yEq7U0kftD83nQ5uvJKxzjrJs3oNJ1uFHoGnl8A8C8t0YbXcHq4
         Kph16o+wyJAdRoF8AIjYCSKvsjM/7kHtHazlG/6OLwE8UXT3r3gH2tbSKPRVygKPSBA2
         gxqTTlPN1/q/vUYtL0iQ/b4WUbPeqgs2LsVnQSKhM3ga5Lninprpm83UJyb6PJgbKheK
         5w2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224505; x=1790829305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HgPIQmEvwYaItDda9jIvvcgV4nx3Zf69aHXsVWLINFs=;
        b=Yn0yF/PV+g1RlFbDOnz3BVwuIlFOiZkSVx9KP8g9JJeaiPf/TB7+EAkKOzB80b0Iy4
         ZWASIaRpVAjMSxa+V80uzprm9U65TszsVkBeT8OgaGR7QthwnFstQHNT2W0AbkhyKp3+
         yit4S/I77KtNKm9MVfYwkL0vJ5lLO6dTffb3N5Q2jEX6lldmUZ/6SEe82WdSzCPyxoc1
         A+/T7jTV3gL3zpvS799EPh34D2EgigO5yP9P9iUdOnykei9r+IvIw6Kq2UE0dDFE2DMZ
         qeUdj6ms6Gez9aF6jCdHxQfj1O6IKHUpPeML4ge7l49SRhtEb2VIigkauQB6FqexXzIH
         x3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224505; x=1790829305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgPIQmEvwYaItDda9jIvvcgV4nx3Zf69aHXsVWLINFs=;
        b=VCJElsPJVAqnin59HGvOmOMCyIxnYE2IGF6Dcj/EpGgCVn/0SRK0GJYIHC2AZx7Bi0
         G7qawO74mpmWDpcktJLtVfwOvxxPQK5jx+aM0yqGT2sARMQOAhxa0lD0l1ENM7ErEsab
         R7QeXur84titMjP7y84DoLiMFYuqLl79MlAhOrjJeSSJHoPjaHEGV0kZDZYTR1d+n1nv
         MHh6f0uYSSO3cBIdcPqh1E+7Ogj7FmiDv9ywmAuAeRPVHu7pCfy6gMr/iTQqpRnl1nuc
         BAYjAuDd6q/06n+RMV+Cdho2fQ0Hj+jC9e2siYIVu1QEtr5YUks6qqr3hvV/F2/WFJBP
         99dg==
X-Forwarded-Encrypted: i=1; AKwUvBzE+7FAG/9+TOZl5ld6XpfoaW5UzVuw0xd+aWgJJSwG6fAkGefbBwAH972PKKvsrLI+bZtBGPE7SYPzaos=@vger.kernel.org
X-Gm-Message-State: AFuF++mqDgUAAE80EXju+IT36Dv4/OK15CDFVm+u+yrRZ89hw9f11BYj
	gB7j9uuLOxK9HI5nr+odF0E5mjW1KZazJXM3Shz50JgI5o7KiIEqRtut/W14jfEfrfxH/6wPuIi
	i6LFyLFJf53KSxsfI30KLC+I58LD60rU=
X-Gm-Gg: AYBFou3wVp2WWdY5VC4oeyudUXh76/3Clvkb0EfMdI3kgr/K4WHxlcfLBVDIqMsKQli
	xj9EkphrULGJUiEOLm+fY+ZttzI1T0icX2iH6pY+LHWq4dcprTWSxcnBr3DKjXNajes8LFJl0Xs
	zH1IncERyqgW1uggfD4XXtPhstGS51eZ7iyc5e/OOJoMAtG8pWcfr+8phEz27oiOs8xEdpSzQWh
	1rMhx9f8JmnRpwa9nR3grBJmAxYM/uqIxUH4gdPREoDdVfZ7+k/lDyjP/pHqbCaVsSLiZ1gFP0G
	suAFTNvUyF8QikoYTyoaRCgkFgWtcYSurC2zTPRwCFfJPlu1BJA3ALJRnetYOzHESc3CixmI6S4
	wgHNF+CxQBS8=
X-Received: by 2002:a05:6808:1992:b0:4b2:98a3:a567 with SMTP id
 5614622812f47-4d72be39068mr1776744b6e.4.1790224504958; Wed, 23 Sep 2026
 21:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923152653.40953-1-yupeng0921@gmail.com> <arP0TmdK3FnNfbwH@localhost.localdomain>
In-Reply-To: <arP0TmdK3FnNfbwH@localhost.localdomain>
From: peng yu <yupeng0921@gmail.com>
Date: Wed, 23 Sep 2026 21:34:48 -0700
X-Gm-Features: AclHuK942CAMjDTV2Zi3exg6L6EKi3Q-gOuQhHvB5LNabYOBYKDQn8SWx2V9lpQ
Message-ID: <CAG3TDc0bQJATmJR5dF5j9RoDp1ti-tbAiUkLRGq4zX2CYD3unQ@mail.gmail.com>
Subject: Re: [PATCH v3] nvmet: add cgroup_path to charge namespace I/O to a cgroup
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Josef Bacik <josef@toxicpanda.com>, 
	Jens Axboe <axboe@kernel.dk>, Maurizio Lombardi <mlombard@arkamax.eu>, cgroups@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 8:53=E2=80=AFAM Michal Koutn=C3=BD <mkoutny@suse.co=
m> wrote:
>
> On Wed, Sep 23, 2026 at 08:26:53AM -0700, Peng Yu <yupeng0921@gmail.com> =
wrote:
> > Scenario:
> > * Create multiple nvmet subsystems/namespaces.
> > * The namespaces are backed by different LVM logical volumes.
> > * Some of the logical volumes share the same physical volumes.
>
> Why are LVMs mentioned? (The test scenario doesn't seem to use those.
> And the example is backed by RAM, so where would be any IO to control at
> all? Note: I'm only giving this part of my attention span.)

The LVMs are close to my real use case, so I mentioned them to explain why
I need this feature.
When I write the testing code, I try to demonstrate the usage in a
simpler way, so
I use RAM devices.
Sorry for the inconsistency.


> > * The subsystems are exported to different users.
> > * We should provide each user a specific iops/bps quota, thus a noisy
> >   neighbor won't impact the performance of other logical volumes.
>
> Why cannot you place users into respective cgroups and configure
> appropriate per-device limits?

I export the devices to nvme target. Per my understanding, the IOs are
controlled by kernel threads. The users are remote users, so I can't find
a way to put them in a local cgroup.

> Thanks for providing more context about the scenario so that I can
> understand what's the goal and obstacle.
>
> Michal
