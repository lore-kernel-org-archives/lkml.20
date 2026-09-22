Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C2549E156
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790104421; cv=none; b=cQF4qJUDROJrT341HY0MF3mPF02AvW/NqcEWLprxw4r+leiAOvoJGOwQZ2LzDMQsRbAtpbiAkNCfQieUdyreNJWqHPHq7S+vGCbhxleBhwyUOmRi4IgnPzwoPm9LW/mI8aR+ZpQ6eilmCT6ta682eTF15PcMTc+Txr3pDSmm3ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790104421; c=relaxed/simple;
	bh=PM3YWhQj26OxqlfqxABsAhf7EA9P5fAzAXziwoQMM6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8wOHaQnpOlghod4amoEfj6KIHwZsxCA9ym9GVfv3BgCL8YINxSVYj62yr5Hxwjq4PrbZpLd4zQhxL1Tr2y1DWBQyJImPtGKM4J1e41AR0/tcz/1k7BsU06gGQK0jx7fPCAeBeMgQNpssNhdj9MCsMeEg8vyf9vxQIIs2IbzIx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YtU56KyI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YtU56KyI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42BA71F00898
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790104419;
	bh=PM3YWhQj26OxqlfqxABsAhf7EA9P5fAzAXziwoQMM6s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YtU56KyIUs+z5oJoBxZVr6j3xV9VZ5m1c8xOG7x2c35Pn+q4LGUmvXP9emn44D4Rm
	 P2dAoN7anvD/e44J732zKnJmyT0kiBWbHBoEXC7vBMukwGOHWYeQYBNOB6EukgneZm
	 o6hYWiOYsarJu6O7pp5CC+9nQy/aykEpviGWre1VM553nGXe2IdbAN/BiTIRgT9z8O
	 /Ig9csMr/UjtYxA97lfZFreasI/Odhx0hU3ogStU+7pbc4XU/kFWANlDf3NZJSiARb
	 oa5mTVXvBJGaJtmcI5M8Zq5hPK+PTTADqcJSHsGNm1vcqnHuDoXS4hfIB42MGib783
	 rG+AynjKnlwWA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso168185e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByC0AVcXEg/Kkg5eBQ9H0zIrWFWbCke1EeHT91cVOvx8Uf1CcC3gN7Ls+0GBq2R1Cn0+4ID7/RFKxIWwYo=@vger.kernel.org
X-Gm-Message-State: AFuF++maIzrkm6BpsBHOzcrFmqeAKsFuJbrIKN7txPA++M61WczkE8bn
	PyUrYY97kKAFVXoAXrqYI4D4LzM6zAN9Yxk1ikag7l6SDuIV9rb0RHiuaq+89Gho8qI2S/+5Qvl
	JYCokevOEKAMwWNHQaaZohhN1e3gUQVg=
X-Received: by 2002:a05:6512:618c:b0:5b6:183c:5c8c with SMTP id
 2adb3069b0e04-5b8d89a565fmr71281e87.42.1790104417597; Tue, 22 Sep 2026
 12:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920-fix-hibernation-v1-1-f9940c2d7d7f@geekplace.eu> <87zex963x1.fsf@collabora.com>
In-Reply-To: <87zex963x1.fsf@collabora.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 22 Sep 2026 21:12:05 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g4OXgxELt98Ea8KVg+QDuG+7=9O44kHWQW_1koZWMXxg@mail.gmail.com>
X-Gm-Features: AcwNN1XAFesbYtGuG1wmKNFnZTylIzRVQgeFA-Zt8JbiqpgYhDwswKfHRBP2Pwc
Message-ID: <CAJZ5v0g4OXgxELt98Ea8KVg+QDuG+7=9O44kHWQW_1koZWMXxg@mail.gmail.com>
Subject: Re: [PATCH] PM: hibernate: Freeze kernel threads after image preallocation
To: Matthew Leach <matthew.leach@collabora.com>, flo@geekplace.eu
Cc: Pavel Machek <pavel@kernel.org>, "Mario Limonciello (AMD)" <superm1@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 11:17=E2=80=AFAM Matthew Leach
<matthew.leach@collabora.com> wrote:
>
> Hi Florian,
>
> Florian Schmaus via B4 Relay <devnull+flo.geekplace.eu@kernel.org> writes=
:
>
> > From: Florian Schmaus <flo@geekplace.eu>
>
> [...]
>
> > Fixes: 783c81098445 ("PM: hibernate: call preallocate_image() after fre=
eze prepare")
> > Signed-off-by: Florian Schmaus <flo@geekplace.eu>
> >
>
> Thanks for the fix, and sorry for the breakage. I've tested this on top
> of 7.2 and the original issue my patch addressed remains fixed. I wasn't
> able to reproduce the deadlock under high memory-pressure locally, so I
> can't confirm that side of it.
>
> Tested-by: Matthew Leach <matthew.leach@collabora.com>
> Reviewed-by: Matthew Leach <matthew.leach@collabora.com>

Applied as 7.3-rc material, thanks!
