Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828764;
	b=Hgn8re39r7grBnheU0GVyXir0uI8YNu1CHGivo4mVOH3wa+bTCCrNAHx1K6vAizjoR9h
	 mVRS1fEkM7MADhhul+hTvhkyZa59K4OcDIllQMrrMNVCgijGrOBZv7ugF580oyUn5wTSH
	 w9LLglq7VWc4JRBQoEJRpu/6SyzyJDC2/CmiwK3aEax3RILwGS0rdpEMOmQJ71TJ+exmv
	 Jj/8zTi3IA9zbtHm9Ye8eZ9DfxIIIJ2C5F4480ht2rGuTPZu/zTeVEbsLPQhi9Vk4V7rA
	 gAPe/o0OXxHTcJe2ptSivg/dS/FJEyrvg2qfO/uCb09hANu6qc9nxAsbeJD/CVkj9BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828764;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=Uken2bPihuMdCrwPkCgP3IGwX1lpQRkERvwjisD/E0c=;
	b=3yM7DZH69lmiek1jEuYyZDwKv3YZ5nWMMhnC4xIQ9hzVgHNH3wlepfFeCf79BHRZW8zg
	 PiBKYZmFtsaq3cT1eOBtgvj28y6xywF6veJjRJxwGDfRwb8vqcd/PjT6oBfzBLF8bNBOy
	 XDBPb8upYnnk7QOw3+pN9XewXmql3xtfOlbpuKC0hADACFh07Rax06hoBwPG/G5vepYxY
	 x13/i+8SnobPukFZhacRsjZfPxP/ZAPFNRUt/Veo17yaHm0sS53QEm+MebPHrpyo3DRNk
	 S4rtQ80nlGaq0eVQeTWR0mJQDb6QBH9FNMltTj/wcwuzAYpE1anyFxHRYT2uyP3+TDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=phT42UFz;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B544606A334;
	Mon, 16 Nov 2026 11:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=phT42UFz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Uken2bPihuMdCrwPkCgP3IGwX1lpQRkERvwjisD/E0c=;
	t=1794828763; x=1796038363; b=phT42UFzf4pBlFAh4oNJaLzUzj0Cj+5xzMoLfO0oTw+ii2T
	iH0CmA419yD+OVuC1lMHVyArwkwXvcLOT+rycrUU/iAsn+Bg/xgTIaaFL+2q7K7489l38LYc1XzgD
	iMPeE7Tnxw9eFJMR3LToKB6gTi0FX9IjEJUAq4MV6ns7xK1nUtrxDONyRbtAyvr/v5Vzv3RHYXleL
	CtGVOt2bDeSPEjq1NZBGuP1Gk5hBH21c5cn5CNBUD1aBcKOAp1whIPhmdIhWGCUHTCXvd7UlVyqde
	UuXrlnlZ8Z34WA5Ex5kMfRk7IfT7MOOX+JLvMxgG6QdVfWFFaWwgiN+Cb0pSz5Dg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSuwy-0000000Gaa3-0frj;
	Mon, 16 Nov 2026 12:32:40 +0100
Message-ID: <13d0d8d00897f425ace949084cc0644d52a0e504.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 14/21] wifi: mac80211: add driver_op
 for SMD substate changes
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 12:32:39 +0100
In-Reply-To: <a743c654-14f8-435f-9b83-bccdf2865615@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-14-62e39487f51a@oss.qualcomm.com>
	 <9016700a02b45e18e06525b338fcce52a1e341e3.camel@sipsolutions.net>
	 <a743c654-14f8-435f-9b83-bccdf2865615@oss.qualcomm.com>
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

On Sat, 2026-11-14 at 00:50 +0530, Pooventhiran G wrote:
>=20
> > > +void sta_info_reset_smd_state(struct sta_info *sta, bool notify)
> > > +{
> > > +	if (sta->smd_state =3D=3D IEEE80211_STA_SMD_NONE)
> > > +		return;
> > > +
> > > +	/* DRAIN -> NONE, EXEC -> NONE or PREP -> NONE */
> > > +	WARN_ON_ONCE(sta_info_move_smd_state(sta, IEEE80211_STA_SMD_NONE,
> > > +					     notify));
> >=20
> > How is that even useful? If we're talking about a sub-state while in
> > state 4, then surely moving out of state 4 simply invalidates that, why
> > bother?
> >=20
>=20
> True, thought I could clean up the roam states before that exact invalida=
tion
> happens. I will remove it from state 4->3 transition.
>=20
> > > +	clear_sta_flag(sta, WLAN_STA_SMD_PREP_TARGET);
> > > +	clear_sta_flag(sta, WLAN_STA_SMD_EXEC_CURRENT);
> > > +	clear_sta_flag(sta, WLAN_STA_SMD_DL_DRAIN);
> >=20
> > Understand that you need to clear the stale flags, but for the driver
> > that just seems strange?
> >=20
>=20
> So, this is also called from state 4->3 transition so clearing the stale =
flags
> seems necessary. For the drv_sta_smd_state op as well, if we don't clear =
the
> state in mac80211, there will be inconsistency between driver and mac8021=
1.

Wait, which way is it then? Anyway I'm not sure I see a lot of value in
moving the driver down when the whole state 4 is left later?

> > > +	case IEEE80211_STA_SMD_EXEC:
> > > +	case IEEE80211_STA_SMD_DRAIN:
> > > +		err =3D drv_sta_smd_state(local, sta->sdata, &sta->sta,
> > > +					IEEE80211_STA_SMD_NONE,
> > > +					IEEE80211_STA_SMD_EXEC);
> > > +		if (err)
> > > +			goto rollback;
> > > +
> > > +		if (new_ss =3D=3D IEEE80211_STA_SMD_DRAIN)
> > > +			err =3D drv_sta_smd_state(local, sta->sdata, &sta->sta,
> > > +						IEEE80211_STA_SMD_EXEC,
> > > +						IEEE80211_STA_SMD_DRAIN);
> > > +		break;
> >=20
> > you do realize "fallthrough" exists?
> >=20
>=20
> I am afraid I am not able to understand how fallthrough helps here.=C2=A0

My bad, sorry! I mixed up the order of operations.

> > > +	/* if EXEC -> DRAIN failed in the driver, notify EXEC -> NONE */
> > > +	WARN_ON_ONCE(drv_sta_smd_state(local, sta->sdata, &sta->sta,
> > > +				       IEEE80211_STA_SMD_EXEC,
> > > +				       IEEE80211_STA_SMD_NONE));
> >=20
> > I'm not a fan of sticking whole blocks of code into a WARN, but I'm als=
o
> > not sure this whole "model what should be a one-way sub-state based on
> > sta_state" was a good idea in this patch.
> >=20
> Could you please kindly clarify "model what should be a one-way sub-state
> based on sta_state"? Would you prefer if the driver was able to directly
> update the state as well?

Ah, no, I was just mostly thinking about the above discussion, and also
the whole substates.

For station _state_ I think it makes sense (mostly) to go have the
"ladder" of states (notexist <-> none <-> auth <-> assoc <-> authorized)
and clearly modelled it based on that.

But does that makes sense here? Why even go 4 -> 4b -> 4c as a substate
etc. Wouldn't it be a lot simpler to just say "this is the new substate"
deal with it? There's not a lot of "ladder" going on, the substates
don't really depend on each other as fundamentally. In fact, for 4a vs.
b/c they're not even a ladder anyway since that's completely different
use cases.

johannes
