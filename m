Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC563EEAE2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995718; cv=none; b=rL+yVC2S2cxV5puiwpz/XPeweNHPYdW8jZy+1eotSQK9vECEBtA5HjcrWylN8KcxypMqqy3gykAoexUbuvqJDw7FBdT2jYHvR8W+QS/HL9nxIP9ENq4kqGhxVJQj1+b3YoT15eF64VjRN5ZW3of5QXj35o9NPLAapVwCK/GMO4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995718; c=relaxed/simple;
	bh=cle/KNsL3A/JXnP6hdhDUKa+SLTMRALqQ17G/uY/L+A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iGYSHOEOqRGC+2PnQWxBIcB/FpP2dp9kb0qiOmd9kmRqyRXbyPlFRf9T0sHWQURKJBxnwcw72jr9NswIZhTlikRwLvGxHf/bR/8Q/czdkwaG78Pg1kzvTUNoSZv3/IlnxSyV5fhqLkX6n9giYMi0O+r2xmalGl+qwcu4iB4a0jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=L7WZpcyd; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="L7WZpcyd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791995705; x=1792254905;
	bh=Gxu8lZuPuDzgvyvIj71SV0vpVnEs77ub4cup25NkX3g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=L7WZpcydCVfEu40L4F4Xa+btDWiFUyax2x5FHXWGoUzB584oJj82ZZwPBrhDRXDPj
	 AiS1y2cFPh6rJeye/bkunS4LH76Hs5OVTHAceLY5CLugbmlVT1dWFC/zh2tRyakSYt
	 PKRQxzm1mAhWg8/l7kyfkfIvGpztliSvcPyMlJCyK0cw1ewk4P7FANQgYVwTvl9TBV
	 036uihQF8I3+w+P67dzQCbFGznolkkv5AtNkXYmgT9RKR0p2LY1fJvjh/+H/gODJ+z
	 j9sH+5Yk1aa3uDbe2frL9pqMKeIo4VSfJrYWimkd7I5FyViWn+KZdAU70sIipqhZ5e
	 k0MX9GVWjxBjw==
Date: Wed, 14 Oct 2026 16:34:59 +0000
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
From: secureblueadmin <secureblueadmin@proton.me>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/bugs: Restore RETBleed IBRS selection for spectre_v2=on
Message-ID: <0J8l2Obi7FYyLJ7dkUP57MdMPIpuaTf5wuALGc3PRy7nSXH5H1TIo9MKUnjzkeqQdnC_FqjlfeoDxhi3FEQj8ExJ_aIRz_FCM8ilvF15yps=@proton.me>
In-Reply-To: <nyzf45exh2pibvaehskdspxbjsuxggwansucijwweylmmvqg6n@tubvb5f4k7b5>
References: <20261013-x86-bugs-spectre-v2-on-retbleed-v1-1-e75a142da73e@proton.me> <nyzf45exh2pibvaehskdspxbjsuxggwansucijwweylmmvqg6n@tubvb5f4k7b5>
Feedback-ID: 93485151:user:proton
X-Pm-Message-ID: c76e36184a5a4507affa3474fe4105a89752af07
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

spectre_v2_user=3Don is more appropriate with the current buggy behavior, b=
ut it doesn't work around the bug per se because if spectre_v2=3Don, the bu=
g persists no matter what. spectre_v2_user=3Don only helps if spectre_v2=3D=
auto. So the bug remains present for all spectre_v2=3Don users.

On Tuesday, October 13th, 2026 at 11:46 PM, Pawan Gupta <pawan.kumar.gupta@=
linux.intel.com> wrote:

> On Tue, Oct 13, 2026 at 11:01:43PM +0000, RoyalOughtness via B4 Relay wro=
te:
> > From: RoyalOughtness <secureblueadmin@proton.me>
> >
> > On Intel CPUs which are affected by RETBleed and support IBRS but not
> > eIBRS, the Spectre v2 mitigation is switched from retpoline to IBRS,
> > because IBRS also mitigates RETBleed on these CPUs. Up to v6.15, the
> > default (SPECTRE_V2_CMD_AUTO) and spectre_v2=3Don (SPECTRE_V2_CMD_FORCE=
)
> > shared this selection.
> >
> > The restructuring of the spectre_v2 mitigation moved the switch to IBRS
> > into spectre_v2_update_mitigation() and made it depend on
> > SPECTRE_V2_CMD_AUTO only. With spectre_v2=3Don these CPUs now stay on
> > retpoline, and retbleed_update_mitigation() then sets the RETBleed
> > mitigation to none:
> >
> >   RETBleed: WARNING: Spectre v2 mitigation leaves CPU vulnerable to RET=
Bleed attacks, data leaks possible!
> >   /sys/devices/system/cpu/vulnerabilities/retbleed:Vulnerable
> >
> > The same system booted with spectre_v2=3Dauto reports "Mitigation: IBRS=
".
> > So requesting the mitigation to be unconditionally enabled results in
> > weaker protection than the default, which contradicts the documented
> > meaning of spectre_v2=3Don.
> >
> > Select IBRS for SPECTRE_V2_CMD_FORCE as well, as was done before the
> > restructuring.
> >
> > Fixes: 480e803dacf8 ("x86/bugs: Restructure spectre_v2 mitigation")
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-5-5
> > Signed-off-by: RoyalOughtness <secureblueadmin@proton.me>
>=20
> (Not sure if this is an acceptable sign-off)
>=20
> > ---
> > How this was found: secureblue, a distribution built on top of Fedora
> > Atomic, puts spectre_v2=3Don on the kernel command line. While auditing=
 it
>=20
> The change looks correct to me. I believe the intent with spectre_v2=3Don=
 is
> to get the forced-on IBPB for userspace? If so, spectre_v2_user=3Don woul=
d be
> more appropriate, also it works around the bug this patch fixes.
> 
