Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320792;
	b=fUDaBqZ+UImGryUgzsnMWMxU8GL8HRE+5zxcX1QV9CXBGTz3UkMhcb2SCTlGozGWnolr
	 p6gvMGxw5zFPDcHHXVDp2lhncB5+9LhvPr2p3rHgzLg7MT2frOKaySxQV4MpF0w/1FacH
	 RnabFSzaUiZaa6DI3fRoullxMw2K9zRy+AMsvcwPtRqCbY8QvjxX8O+r/IBWEZIW+dob0
	 fTTw0ELOrnsMvB3wYwLA9HlGTiprdutfuXYUHWY9siY7TSTQK59pK4uhFYuzURb17UvY3
	 twvo+iUPX16pCBvDyFHhNnrCcRzoZbGMV5LqkHDC2PaTX00DoVkMCoivVEg3dF8essg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320792;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=+7DIOcoH5dAvUhkQSgrpSt4PNodkbmMLUkusW9NVg3c=;
	b=SjwPCFp8UFnf4+nawjuCFjqNVLX2cEyF3hkydM1c2EnGNBXYwzMvmtsSSoii3vxtDbR0
	 Wgnw5L3+K+qM6J9hgVXgDzSu/Mrb+QeaGYJ2qzFEwc0PYO05QAA5jZA+XJZ9HFsXyxYyO
	 eT9LR+U7GqM1MMfxWprteyXGyLToa5J9nmHGXFKVWc+qCcMVzmqyqmcqmJ7uK6/1tx3y5
	 b0H3iYi37vReIKxjI9CO4xu2iho4MqZkAHe9Mg2PFNzE4xJ+69EJqaDw0fCyH1tkTNycQ
	 3QiXqNVeACFRtpcVVkOa6zlpjcpBZQEj5ilX3uC5Vk8kLkcHztE7apSZifN/7iFmJXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=HwAYEFCq;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E054260727C7;
	Tue, 10 Nov 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=HwAYEFCq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+7DIOcoH5dAvUhkQSgrpSt4PNodkbmMLUkusW9NVg3c=;
	t=1794320791; x=1795530391; b=HwAYEFCqMPC4uOG5UFdGGIuStarPpeQYM1GRlwgCZ8gpF+N
	S/fHC6iQSWBRvddQnJ67Hc5uXYayuheQx3iyQhQFJfdV6beSIfcVWq2J2x8ueRLnElA1ErOThwI8r
	KCKrTg4vb5uLAuTMFaRIElBYBC1p4v3zerr/bXQvy8N59llKp7P54xNLHbyB9wpBl2bJzhZAY5cIJ
	Ko9LesWBx2FPzb08qwQ870xpzg1Z8F8elGx/WQBpK3srvaLKAUIsRDCQyw6JBHeVOa98cdsY4P6ws
	XDTC78LyslNwbn+ycXYiTIToySY1d4l3YLkH3ZWQgVat+ZwFkPDTDHT09Qyrc78g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQmns-00000001oer-2K4R;
	Tue, 10 Nov 2026 15:26:28 +0100
Message-ID: <24917e113f203e6f6606dc5adefeefc4ebc27d9c.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 01/21] wifi: nl80211: define Seamless
 Mobility Domain (SMD) device capability
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 15:26:27 +0100
In-Reply-To: <7638714d73cda9a2538952f577be1a236ddee55f.camel@sipsolutions.net>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
		 <20261106-smd-v4-1-62e39487f51a@oss.qualcomm.com>
	 <7638714d73cda9a2538952f577be1a236ddee55f.camel@sipsolutions.net>
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

On Tue, 2026-11-10 at 15:15 +0100, Johannes Berg wrote:
> > + * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD support. =
Used with
> > + *	multiple commands to indicate appropriate SMD support (refer DOC).
>=20
> This (with the wiphy flag) is the wrong way to do this, we have extended
> flags that don't need the double enum value and pass through to
> userspace directly.
>=20
> But also, this does absolutely _nothing_, the only thing you do with it
> is pass a completely ignored NL80211_ATTR_SMD_SUPPORT to START_AP ...
> it's not even passed to the driver.

Actually it is, just ignored. I don't really see why we'd care at this
point though.

johannes
