Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825663;
	b=Z4SIyHb/rwZgp7moOK5x48uw8atLucmBBsTrWUmO02+mDBbVYMRa8AvzJnYSOWa/btWk
	 l0w8/aBy1fvR3HL8ncsVk9lLufvr42LeUPaqEfCac5eoAoth0nsscap0a4aQlpUjQv+25
	 i1MnEtZntuAJYmzbTkWb5uwqdIrtwgMiBnMQF+8BjZQFKqbGz8lA3vE3cXi6ujWWaZXpW
	 +rl2NI44fK3vGaNhW/kHu3bQ1osx9Z0XFcdtNZ0WVWgOhjpoDywLxmuo1nPYiuKGzf0JU
	 JEK2zB8fkjSypKcBnPnGj7VI8J3mu6LU1ugSm2w0HkdUKAYf+ZS++scnrABcJj5xs/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825663;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=2TCqoHL/J0SsDH6/vJSFiplWvK6vRV56F4pJ10IuqzI=;
	b=TrCYw5WIebgVtiNQSI2Lu23Dr6qaQMRRSQNzRHmHXIHJVZjrEAz8xRgAazHeRInZB1vK
	 cZqAvbeTcuSy9jckDYsAPlFYO84Ye5BJXfuOI1lE5K8uF4VBZ+ntFLeS+SEM8lPIxgd7d
	 pYSKdkjlz4alYwpVT+lvs4jIyKygVV52p+o0gq6MdaRdutzmWtvW87qz653kM3O+05zzF
	 uOisrEFihIGhElHqF4hw9q1ZIxgl+U9YJMCHpX5/3VB1t3n5cgMRk51NySUIPLrzoDSrc
	 zGe8nlvO0Y7VLNHeZ0j/mdH20dGvt9KZIJkpuWDR5OVv6Ei0lo34SnJn0qYXX+ghupQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b="M8/kr0gf";
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD76606A336;
	Mon, 16 Nov 2026 10:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=M8/kr0gf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2TCqoHL/J0SsDH6/vJSFiplWvK6vRV56F4pJ10IuqzI=;
	t=1794825662; x=1796035262; b=M8/kr0gfCjmHRYIqbtKgAajWDhMddYgCIdRMhoL2SFWSkg6
	1yfsdonDFAwxY2/RKrGFodcuhfgwQpJ3qYEUEzQaI+ciHFtLUPT+qG19a2InF2OC+FhHHplGNQGLd
	XPEiGs2sIFkPOUlLuShExU08jzrQAlXDTjNpLZ5A0VvYen73sjy+c6a2yP1N26zO/sAnLOi3bs7+P
	vXOV+qPYt6lCBKbE750CKPaJ4/svnq+ikOvhdcmQy3ejsThSoz+0lDb/9EAHPEvPSh2Mf9mle3oXr
	/SoPfbj0THCKMrL3mN5IcD/v2Yjv6CyTq2yjeBsWM+B0h0n0YHBpfYWabEqID6Ug==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSu8x-0000000GXAQ-2upT;
	Mon, 16 Nov 2026 11:40:59 +0100
Message-ID: <61c6b777341edd1343ad1959abc9e2313a05ef25.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 01/21] wifi: nl80211: define Seamless
 Mobility Domain (SMD) device capability
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 11:40:59 +0100
In-Reply-To: <05d0e51a-7189-4095-8243-fdc1c424e37b@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-1-62e39487f51a@oss.qualcomm.com>
	 <7638714d73cda9a2538952f577be1a236ddee55f.camel@sipsolutions.net>
	 <24917e113f203e6f6606dc5adefeefc4ebc27d9c.camel@sipsolutions.net>
	 <05d0e51a-7189-4095-8243-fdc1c424e37b@oss.qualcomm.com>
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

On Fri, 2026-11-13 at 20:53 +0530, Pooventhiran G wrote:
>=20
> On 11/10/2026 07:56 pm, Johannes Berg wrote:
> > On Tue, 2026-11-10 at 15:15 +0100, Johannes Berg wrote:
> > > > + * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD suppo=
rt. Used with
> > > > + *	multiple commands to indicate appropriate SMD support (refer DO=
C).
> > >=20
> > > This (with the wiphy flag) is the wrong way to do this, we have exten=
ded
> > > flags that don't need the double enum value and pass through to
> > > userspace directly.
>=20
> I changed the EXT_FEATURE flag to WIPHY_FLAG based on the comments in v2 =
and
> NL80211_ATTR_MLO_SUPPORT implementation.
>=20

Yes, but I think then you had more intricate feature advertisement and
that went away entirely?

>  I will change this back to
> EXT_FEATURE flag to indicate driver support.

Sounds good.

> NL80211_ATTR_SMD_SUPPORT passed to ieee80211_start_ap is parsed into link=
_conf
> and (will be) read by the driver in assign_vif_chanctx drv-op. ath12k
> implementation needs this indication to instantiate vifs and workflows in=
 both
> the driver and firmware.

I guess that'll be one of those "trust me FW needs it" cases, but...
why? I don't see how it has any impact on anything?

johannes
