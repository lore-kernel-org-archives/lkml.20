Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA44AF696
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441948; cv=none; b=o4WTqJ+HEDVgxU5wvPral6EMYYCzw2iVkOuyjGW0bcTeguF4G6/0apQMPH166hGf7lix5CQ6s5yvnUZxc8YbfSj834WbSwXD9snRBPMggdxunwDmjCY6gfVz4lZL5IHj9+H+MBK5v68LEp4Bbm1fNrEnjP2/oRTOE9PKIKgL4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441948; c=relaxed/simple;
	bh=fI1v58DiUDTvYzcFsqOyVQnztgwmpPxTGP5ugtuKTVY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jVNo3Ph61831otgGYplgzM6tVeS1Bear2puOuhf+yfrELgvC9QkieYoX32FTrrKqBuH5UkzMX/ojPpkOdJGNqLe0ff+Czx5qvhgd2jr0UJz1RWe6JMCYU76irBvYg9go0tGe01Zz/sgbNauFDLDqtKR8L9Xh0mlRXU4ctE+bzLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUUjhwI6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUUjhwI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1721F00ACA;
	Thu,  3 Sep 2026 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788441929;
	bh=1azHr/pFB85CwC7zH3lRMPgTlUgrQQX8vJrLWV7gSGU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=dUUjhwI69MxpDSYlJpss7lPfBk0XFt6HDW6gGPJ3Rl6JwOkMcIl0KbloDafyGXhzB
	 g1QOH3lOTNq3ko26PEQJQGrzRwMPJyiA74o4H2FdRH/EUxRQsgdZaDBwtxB6fvzM7i
	 XhvXaEDvmyHmexL4ARJ6SoOs8JypxM0WBNk4365YzknIicHf0gPBEf4wOTr6+VfUvw
	 2fKrGRO80Raye4L3zeH4LoTQ/NtKD3hfafScInNRgOt0DBLlz9wgKrzsH+O8T6NADB
	 MqZ3Nnu8uP2MVca5d+2L0Y3dcSL1QyAL/257cOZ8gT8gasYWIpb782M3LgL7n4w0l5
	 m7YAmuvKI+5Zw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id A95751980054;
	Thu,  3 Sep 2026 09:25:27 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 03 Sep 2026 09:25:27 -0400
X-ME-Sender: <xms:RHWZavYfB9IcqusGjjKg9YIjxTlGMDDVrZvksuer_zpwFsHeyaTzMQ>
    <xme:RHWZapNzFnoX2Q_vFyeWpTgHR63mSfzpYfEI8YU1p1B9UyyqCtKPM3A_2ClDO_hGf
    l15SZ62eBgDJHQ5GzSqmVtvmhiNm3uToZuJfS4eUM-it5ZAXI3MEmNE>
X-ME-Proxy-Cause: dmFkZTEBFahIaOgOchPvaJwkXi7OrDv/Fnn0kYaKRFOEQRaWDfkT+vLtdbOL8paoS8OOHH
    K5JclVIP75Um7tw21sHpu+ivQkbbHsI9NinbZp2VtxElur3ErbPWsd6GhM5viQMbvfjg+A
    0XA5KuxNYyJUpb3RQMWjV9dfEbe7zol+JOpzrfHexm/Zy8IMysnQ3g8NCXY3aBUMyTlH8Q
    2hHgvvWDRqoe1QAV1OHtiEtJreU+h+Ei6lPFEuruNeGyrouHtVol380KIeytBS08KTdbcG
    eTRvwCZXSYmlUrz/ZhWxvNyCaPPXouWq5siTiP7ZtiK9NrhcKLq+g7VGX9CXhLRQAZgdrN
    SksStJUoSUqOHF01TnOJeBjyug63zIvag1oGTCTXpZNrIu+sDDXZhKpj/XMg6QrHLfqcNk
    1dzRN0rwUXSm4CQXQ8xbwhs6hbwM2Y5OZ61HUEaP8ZZqbE++tDYWO0U/ws3fN4vf9L/0IG
    DGM502U78C15At/aU9FhO5tDI7eQW+2hAJjkZWxty2R6i/ODgDtgee0PsW8SnNTcm1QHzg
    hurkRkTMCkNKqNC3n0hsHopDmQI5V7LDIFVxRWYvQ1KMrdvmRS/NsVFFL3RkYnzFXKYlAd
    0cIV1/ixTMoY05S07kcAgmRv81f+iTKXId23IsEE53rjXVTmjxECGtRCd7MA
X-ME-Proxy: <xmx:R3WZanwLas00yLMNlYOuic2WR4zFwZzmBuwtPUx2G-dtfVTJJ9bCYg>
    <xmx:R3WZap8kbv0kRlsByFuEDBcQwUm-SQy43hkfLRp6CceCgdmauGLPDQ>
    <xmx:R3WZan8kII6MPPoPwX_T-ZQT1cRBfC528oFpLUqi9lbpvMmk5RqqBQ>
    <xmx:R3WZasc_tsgnbDREW1sS2PsNW3bpJqfMruw51VLAwCTvKgCAngPrkg>
    <xmx:R3WZajsR-dqZDeJSqnSl5cvXn04GCZ9y20d62gSDhBDPvnzwNO3qvdBg>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AC653F8007A; Thu,  3 Sep 2026 09:25:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 03 Sep 2026 15:25:04 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>
Cc: "Sven Peter" <sven@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>, "Janne Grunau" <j@jannau.net>,
 "Neal Gompa" <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, asahi@lists.linux.dev
Message-Id: <eb75b82a-8910-4198-b89a-5c8b487c0fd5@app.fastmail.com>
In-Reply-To: <aplk2hHRB7Yw9FWW@willie-the-truck>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
 <apldL6Ml91GW-tE9@J2N7QTR9R3.cambridge.arm.com>
 <aplk2hHRB7Yw9FWW@willie-the-truck>
Subject: Re: [PATCH RFC 0/6] PSCI-via-EFI to support firmware and kernel sharing EL2
 for Apple Silicon
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 3 Sep 2026, at 14:15, Will Deacon wrote:
> On Thu, Sep 03, 2026 at 12:42:39PM +0100, Mark Rutland wrote:
>> On Thu, Sep 03, 2026 at 01:34:56PM +0200, Ard Biesheuvel wrote:
>> > On Wed, 8 Jul 2026, at 09:15, Sven Peter wrote:
>> > > This series adds a custom EFI table that points to a PSCI entry point
>> > > (plus some other stuff that has to be available before EFI runtime
>> > > services are set up) and adds support for this new conduit to the psci
>> > > code. We can't directly use the normal EFI runtime path because that one
>> > > takes a sleeping lock and we need to be able to call into PSCI from
>> > > atomic context during e.g. cpu bringup or during idle.
>> > > It also adds support for specifying the specific MAIR attributes for EFI
>> > > runtime mappings as defined in the latest UEFI spec since Apple Silicon
>> > > is rather allergic to using Device-nGnRnE vs. Device-nGnRE for its MMIO.
>> 
>> > >       dt-bindings: arm: psci: Add EFI conduit
>> > >       arm64/efi: Add and parse custom PSCI EFI configuration table
>> > >       efi: Add EFI_MEMORY_ISA_{MASK,VALID}
>> > >       arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE
>> > >       firmware/psci: Add EFI runtime conduit
>> > >       arm64: dts: apple: t8103: Add PSCI and CPU idle states
>> > >
>> > 
>> > I've picked up patches #3 and #4, which are useful in their own right.
>> > 
>> > I'm not sure if the arm64 maintainers will want to consider this, but
>> > I think it's a reasonable compromise, as it puts the abstraction in
>> > the right place.
>> 
>> Sorry for the late reply; I've been away almost all of August and I'm
>> slowly catching up on things.
>> 
>> As with last time this was proposed (in abstract), I am not happy about
>> bodging an EFI conduit into PSCI, given that the manner in which state
>> is managed is completely different from SMCCC.
>> 
>> If we need a mechanism for doing hotplug and/or idle without HVC/SMC,
>> that's one thing we can consider. I don't think we should pretend that
>> it is PSCI.
>
> What do you have in mind for an alternative mechanism? I understand your
> objection to this proposal, but at least it keeps the interface fairly
> high-level and avoids opening the flood gates for a bunch of SoC-specific
> idle routines. Are you thinking of extensions to the PSCI spec or
> something else?
>

I can't speak for Mark, of course, but I could imagine EFI being used as a
conduit to provide a callable set of interfaces (with a rigorously defined
set of constraints such as the ones in this patch, i.e., reentrancy, no FP
or SIMD, not relying on ISA features that the OS needs to know about and
enable, etc).

There is prior art here in ACPI PRM, which does something similar, and this
also relies on EFI runtime services.

You'd still need to implement the CPU ops and a cpuidle driver afaict (no
expert here), but at least those would be coded against an interface that
the kernel itself specified, and can be made as generic as we choose to.

Not saying this is all great, but it might be a worthwhile compromise to
consider.



