Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828227;
	b=s2/8tg8OCFNPx1TWyqKYBE5MzMNPEQCGhlBbL5svm1VgpZeuBbJ96a/ZZk+39eozn1Hf
	 bHyNBuey+Nenf5H5tXMzeN1M9TT8/PMbaWO16tJasO7A211OWaMzVscqdpKEIJu9oy9jv
	 Swk0vXcbWJ+kgzaJZoyyphLP0FighzR7ITpYF3dNkEYRlgOcbDa7/o6oMphCQsYJ1Zibf
	 8zfK22bhlwWBYUtwYelwWoUotR8ZJ6VEvhrnJjIG3r4lpptEX3L3Uc/P3UO92cThP0aV9
	 D6OD2uBej85be49z9rGVuf3RcdTcjokHh0uLb0utOwYM9X48T7l8F2lKmI2QEdeyWaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828227;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=u9xMo3OoBlnsByHlyBR8TZDErAWfiSbhyH/fZ1NeDa4=;
	b=fxCEI6TNvsi05LyVIgaDsJqjIGrMjOB437ojQpfbB3sTNmmgPW0SiXHi42AAyOUM1JdZ
	 9odK81DdT2R/8pOnNXI696mm3lEH5D6Wa1J+VuKD55hBw1ksqdYXEzCAahY9KGsmTJcSj
	 veFVXG7ACq+uh35WG4JiGc+AVIXWtr8vapiTQmustcC0ATWNFO8VT9Ccsz7zXBbUih6Cm
	 Pqu9UaalYHjpNXUyLy+EWe0tNVOJ3Q3IUWqBPeCHv0Mkxglk1naM7dYcM9sqoq9YIbRoR
	 cv2yGWSowuFyK2wzmuNoDeHHz2qSpmaSynh5FRlG5ScmZiC8J04r+BVOe29xbJQvkjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=D30g0+Hc;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55037606A33B;
	Mon, 16 Nov 2026 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=D30g0+Hc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=u9xMo3OoBlnsByHlyBR8TZDErAWfiSbhyH/fZ1NeDa4=;
	t=1794828227; x=1796037827; b=D30g0+Hc0f7Qoxmz3LTl9dxuLzCk35WJE4Ton/jnvUYBf21
	0gHu2MlLKVWIpw+p589tMN/k137i+SHAYgQMMnpaxEmF9bWAnkEz08ESVTL8Gn8xzZb5n2lICbAk+
	hoIFXn3Mv9C2XhWYlE1wa9Bv00rLgOagD8k4aEWkrn7AEzbeWs4sYntK9vkp9k5Av99ZjkmvSeaR+
	NrAEeG2n837uEkjrOr57kDqwzGiJEoUdJY41DdGU1SXrxUXJr1N0kMA7NC6Qb9DsSrdJYdnLiqaOx
	srsKb3U8fUEAJTWoA7Jh7BWLTd6LA8o2w98+7MYX/XkqIo+p6AJwzItoBpjOii8g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSuoK-0000000Ga6g-0KP6;
	Mon, 16 Nov 2026 12:23:44 +0100
Message-ID: <239873179ca828ef65d0dc715c5e1c5fd079c9cd.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 11/21] wifi: nl80211/cfg80211: define
 API to notify SMD Drain completion
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 12:23:43 +0100
In-Reply-To: <91d1c974-5910-4053-8f4d-6bb54ee295ec@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-11-62e39487f51a@oss.qualcomm.com>
	 <4c5dc50b40bde5cd9221d318e44645d913268666.camel@sipsolutions.net>
	 <91d1c974-5910-4053-8f4d-6bb54ee295ec@oss.qualcomm.com>
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

On Sat, 2026-11-14 at 00:08 +0530, Pooventhiran G wrote:
>=20
> On 11/11/2026 12:31 am, Johannes Berg wrote:
> > On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
> > >=20
> > > +/**
> > > + * cfg80211_notify_smd_drain_completion - notify userspace about dow=
nlink drain
> > > + *	early termination.
> > > + * @wdev: wireless device corresponding to the AP MLD
> > > + * @sta_addr: non-AP MLD address for which DL draining is being term=
inated
> > > + *
> > > + * Should be called under wiphy_lock.
> >=20
> > "Should" doesn't really work here (it's either must or not), but anyway=
,
> > why, it's completely unnecessary?!
> >=20
>=20
> wdev/dev access in nl80211_notify_smd_drain_completion is not protected a=
gain
> and it might race with a DELETE_INTERFACE. But I think instead of mandati=
ng
> wiphy_lock here, would it be okay if I changed it to use the wiphy_work_q=
ueue
> to post this event which provides safe access?

Basically same comment as on patch 10. I don't see a reason to make it
async under these circumstances, but it could obviously be atomic.

johannes
