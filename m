Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826479;
	b=KwBTwN5KfXAgsrUoIRNAlMmmfO4VGBvvPEOCy6xNKa1B/Rj6PZ0mmSKsMNE66I4wo7+E
	 y/rdrEZHj42s5TsOOl/CRic+wp1LRrG/hxAqSwraUNOrvF49uOFWVUhcDa03MsK4G81KW
	 KQEFzriTgQmJAm7tO7QjIZKBCBakBjJFPoqrhPxuXguKu9DU0F8qFWEq/EdqnwAAhGqpD
	 12RdSxWgNeOqDOmyIhOLqQG3MteiQrL9Rmp+ri/R7FFUqfyo+oo3WbyfUH2Wk6MfoI6vS
	 sJZjhe7slCgiRD9tX8DYe4eG5XN3yNYKyZ4+ydF5H9DckP3kdRT/ToMSAFortEI64WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826479;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=mRQtc6NYaqITp0LKCxiK+2UWlgFicVwIXQD8pfXaYzk=;
	b=fT1nsCL2EjECL07UneuH8fKweZv+DXX7RRPY0YEV6hBzG5BeHHeyGHody2s4zuKBidSX
	 zDG++FxzuS6gVXM7lODFiT9M1ajdyG6GMit6woMmSjcDDNJo2u7PJ7GHsnzd9+VWP34t6
	 fBK0MEZsvi17kEL4CA66u107UE3t60uyI9bgQ6E/0awTDjdvY8cPoh8bY69WfYJZiVtGb
	 9oc5uYnXk3vFNwWCR/yNZmXeWxKkEwE5Uz6AKjQVTYzW0LmAVI/KMJzpGy/KhL3YVg1pV
	 PdBqZt+8a4XPixuZyn/2CH+N+dtg8PPE1dqP2ePiqk1rFcUPNpZoPxx//esB/IhAUFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=xPyna9Ea;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E107606A32A;
	Mon, 16 Nov 2026 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=xPyna9Ea
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=mRQtc6NYaqITp0LKCxiK+2UWlgFicVwIXQD8pfXaYzk=;
	t=1794826478; x=1796036078; b=xPyna9Ea/BYFD2GjuBtZq/TbaVU213/dLn6WEA/Wf5XWEw2
	Xh+Sy7TlXBDFzM/C2ns3FVdjMBYg/p4KHzVjHHzsAdtLGTwGaZuMxjUitem0S0n5nJS3JTs/l0prx
	HJbI1Cyl3g/jM3UB1UR3T/L6h6IUFRP5/UB7aHcHN3U5IoXPd7FfHH7u6aAYbq14C/QKbb1jEbx0j
	bUf4IeBNhGo0OjSVrRi4Pgb73brJLZ1+jIedS5SbCtKKNFNgx3GxmXYpkkqhFuU7vHiGuPVQKrDT6
	l8GvOvl/lvPjVrg4hYXGH71JsoXaEuvPeENMBfsUdndtBwqSKh6lamkuJ7JBweZA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSuM7-0000000GY4y-1qc1;
	Mon, 16 Nov 2026 11:54:35 +0100
Message-ID: <c9ffcbff38996a38c293105d8db526673e572acc.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 04/21] wifi: cfg80211: define layouts
 for SMD BSS Transition context
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 11:54:34 +0100
In-Reply-To: <b6cda6b5-adb0-403d-a2b4-d64939a967e7@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-4-62e39487f51a@oss.qualcomm.com>
	 <39ec29d79ce96b04fdbb2830b679add118bdf19d.camel@sipsolutions.net>
	 <b6cda6b5-adb0-403d-a2b4-d64939a967e7@oss.qualcomm.com>
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

On Fri, 2026-11-13 at 23:45 +0530, Pooventhiran G wrote:
>=20
> On 11/11/2026 12:09 am, Johannes Berg wrote:
> > On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
> > > IEEE P802.11bn/D2.0
> > >=20
> >=20
> > It probably didn't change here, but there's D2.1 :)
> >=20
>=20
> From the looks of it, D2.1 doesn't seem to modify the context layout but =
Dual
> BA :)
>=20
> > > +#define IEEE80211_SMD_CTX_MAX_PN_LEN 16
> >=20
> > Huh?
> >=20
>=20
> There is no cfg80211-equivalent for IEEE80211_MAX_PN_LEN as defined in ma=
c80211.

We could move it, but I was much more questioning the *value*.

> > > + * @buffer_size: Reorder buffer size from ADDBA Request (10-bit, max=
 1023)
> >=20
> > It's probably literally in this spec this way, but I see absolutely no
> > reason to split it up like that (with ext_buffer_size) in what's
> > effectively an internal API?!
> >=20
>=20
> Buffer size was sent this way so that hostapd can directly use that to re=
port
> the DL BA Info and UL BA Info in the ST Preparation Response frame (Figur=
e
> 9-aa53 =E2=80=94 Extended BA Parameters Info field format).
>=20
> I can combine these into one single @buffer_size and let hostapd split it=
 for
> preparing the OTA frame (as it is only needed there) but would still need=
 to
> send ext_no_frag and extfrag_level as part of the context. Would it be ok=
ay?

Oh I was just thinking of why you were splitting the buffer size in
internal APIs that way - much simpler to just have a single u16 (since
we don't have C23 yet) value?

> > > +/**
> > > + * struct ieee80211_smd_ctx - IEEE 802.11bn SMD Roaming Context (ref=
er
> > > + *	IEEE P802.11bn/D2.0, Aug 2026, subclause 37.16.9)
> > > + *
> > > + * @dl_sn_valid: if downlink (DL) SN Transfer is requested or not
> > > + * @ul_sn_valid: if uplink (UL) SN Transfer is requested or not
> >=20
> > Hmm. It might make more sense to invert that like in the frames?
> >=20
>=20
> Sure, will reorder this as UL, DL.

Oh I didn't mean the _order_, I don't even know what the order was, I
meant _invert_, i.e. "no_dl_sn_transfer" or something? That's how it's
in the frames, IIRC.

> > > + * @pn_valid: if PN is transferred or not
> >=20
> > This being false is not a thing (any more)?
> >=20
>=20
> PN is still defined to be transferred in the Prep context (at least as pe=
r
> D2.0 37.16.9). Even if drivers choose to send this in the Exec context, i=
t may
> not be present in both Prep and Exec contexts? Should we make it so that =
PN is
> transferred in both?

Oh ... no strong opinion, but the documentation literally says "is
transferred or not" and ... there's no "isn't transferred" option in the
spec (any more).

>=20
> > > + * @ba_params_valid: if BlockAck parameters are transferred or not
> > > + * @mgmt_tid_valid: if management information is transferred or not.
> > > + *	@{d,u}l.mgmt_sn and @ul.mgmt_pn are still bounded by @{d,u}l_sn_v=
alid
> > > + *	and @pn_valid fields.
> > > + * @pn_len: Length of PN in bytes; varies by cipher type
> > > + *	(e.g. CCMP (6), GCMP-256 (16))
> >=20
> > ??
> >=20
>=20
> Especially while filling in the data in nl80211 to report to userspace or=
 when
> we parse the SET_SMD_CTX from userspace, this eliminates the dependency o=
n
> key_conf to derive the length from the cipher type. But is the preference=
 here
> exactly that?

No, see above, what's with 16-byte PNs, there's no such thing.

johannes
