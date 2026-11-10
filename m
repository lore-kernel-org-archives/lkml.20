Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794335225;
	b=mn1NYAixmOEjLRUeeARmIC/3NhEb0p4JTCM0zogNVDhpyzHIXOC8pFkgDMVb673ahe1C
	 lLqP4SQPDxyBmSC3d+F2e1PlYBHmfGL3RKXc8DhuOhx5OGO6alkV5/Yr+GdXpyHdHwaGA
	 7XdMyrk4YIRdxCTZ3pySQFGmdsh9nH8dbLMdsKRwcK4igk88X7omOMHBh4WLKaMMyfOJH
	 H4VfJGa0hsHehn9gzia5REJN8WT+nUtkaUs9jGF6UmBPkw6SwGckR2H3cvKurnNP29K5G
	 nXq7EZIMbA0qHIU4tR/0oj0TRNdTYYf8VoCryUdtRaZNfgHJgT3cuohG9mrOyV4jOtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794335225;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=GoAN3+qzvo+Bejtr3FfLoPgsfzWhreNSXEiT/opq+f0=;
	b=U9BwHG0xibYrE57YCJIx59321q+Hclycw2q9CJ7voFZUSH8zELNusk3GpZ4bIFqrLzt0
	 k+j3zTk3g0rcywVvfwVvcBJa/sgXh25LK507FoCxSqnFlA7OxUd89+QIVdIv3CVQpyEx3
	 eQjU3gAjRBSFnLONUyTdYD+OOCQ9vLmtk05cxsMeB3p5Pa2b00UdJpVarexrQfbuQ6tvJ
	 6KGFF2oZSNE8D3x57s2NU5nSHnqB0F53H6Sri2PwwTxNTyQuokqpj2a5CgfDwt/ZcH5Dp
	 RpoFlfU1tUlYpPujKkKAbHxbUOw6M/bp558S12+ZaXfdDdeifLf6D2i/9Cfqo2C0Dow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=P4fAER60;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A387606A320;
	Tue, 10 Nov 2026 18:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=P4fAER60
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=GoAN3+qzvo+Bejtr3FfLoPgsfzWhreNSXEiT/opq+f0=;
	t=1794335224; x=1795544824; b=P4fAER60Ad2AE/GZ2XKMlFfsKD7IgtldIACoCcrICHemGn8
	eVEMY7w34QLefhdQ0HwHEctK7PQorUMjIxqf7JSATrCRBAV/OmCKxNi9MzIP1n1f3+E7S0bwt6so9
	7WVU/F9k8IwItTIoGludBf2kUk1rgQXETjH+ObdCrBkNA7lJdyN3pHGdN2zOmy58tV7DBVqrIsr7k
	nfdP9bNVZaS9nTx3JANq+tpqJSxArZ/C/rkfYwxG6t6ohA8HnIYlPmildXr4kHvL5o9hYX9yH/VDG
	8J6HBJ4NnA9LqYc1+f9SmAV6WU13+fLJkzCLe7krHzoW/FoCl410SrHRuub3u+6g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQqYf-000000028ms-0V4m;
	Tue, 10 Nov 2026 19:27:01 +0100
Message-ID: <3fba8cce0b09251c7d88788b531ffbe12a79307c.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 03/21] wifi: nl80211: add SMD BSS
 Transition sub-state STA flags
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 19:27:00 +0100
In-Reply-To: <20261106-smd-v4-3-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-3-62e39487f51a@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
> IEEE P802.11bn/D2.0, Aug 2026, subclause 11.3.1, defines three new MLD
> state sub-states (4a, 4b, 4c) that apply when a non-AP MLD and its
> associated SMD-ME are in state 4 and an SMD BSS Transition is
> in progress.
>=20
> Add the corresponding nl80211 STA flags to track the state changes:
>  - NL80211_STA_FLAG_SMD_PREP_TARGET - State 4a: non-AP MLD is prepared
>    with target AP MLD
>  - NL80211_STA_FLAG_SMD_EXEC_CURRENT - State 4b: ST execution active on
>    current AP MLD
>=20
I think the current/target nomenclature here is strange - this API
pertains only to a single AP MLD, so it's never involved with the
target?

What you need to know is 4a on the target, and 4b/4c on the current AP
MLD. But the nomenclature doesn't really translate to that since we only
look at one of them, only know implicitly which whether a given
interface is the current or target?

>  - NL80211_STA_FLAG_SMD_DL_DRAIN - State 4c: DL draining period


I'd also get rid of the "SMD" part here - it's less about the SMD but
about SMD Transition (i.e. ST), so I think I'd rather call this
ST_PREPARED, ST_EXECUTING and ST_DL_DRAIN.

I'm also not sure why you need to distinguish between the latter two at
all, hostapd is going to send the ST execution response and immediately
transition to DL drain (4c) or back to 4 anyway?

johannes
