Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320156;
	b=PC6DsxI9C6COmY6JUXvI75070K4ouKpYP7vM73VroVQgyRzM1fN9n/CnZLmuSYT8yeIt
	 unJW3olH80v0xKB4F7p2eAH3SNZ9S72pECYi9MhXM9UoaaTXVeg0TabStvF9RPJG1UBki
	 BtlPzKEkpXHeH/cpXcb/kczrSz0Nl8mrur6iod+W1Bh4+plwl0FpDhkgz+eqnBKSB011p
	 YMGYUtcJVC+/RF9+FaWuoM+MsX0Ym6kNc7kJbbd5rX/PwijIZ32jN1/pipt1010euwkUH
	 Rx3XsJD5Marb5SkyNPrQUlUWJUo7xefrOS6MXWSA0MkKQA/F5/Ii5Kpcov/NEYkN7jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320156;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=RGT/f972uWQfwtH4gHJ4s0Su7/Fsxs8zhYnu69Jm8ag=;
	b=IrkOoTh2AdJS3OGJBoyAJ2Lv2bC2+Lsf3O0z30uCJEGubRZ8ovhYS5k8r9pHzRYqRDUb
	 tkomU85ytP+/T2I3aPxA8CyznC3bo1I/Y6k07VzEZmivX+DhtBzmZnhzMYtE0vQ4zlLXw
	 AKI7egCbnlAHKB4oNVT0cF6H80OTS/WbWSQ4Pjl8uZRZtthMRxsDaceXJefhKwL3zAGGL
	 Rz4dOzthJ+vuMLX7BeokNtLSooZN/ljGuH82DgfhZeKCLxB4eGqbVm3nZCBIlAiWiF4Au
	 odWcgRsXStqcTZcNnBk88I7dGRYHfuUMrLYuC4UKeySlJVvrv5kNQcT3uUbDwanLvhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=oAGE66uw;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43FD606A331;
	Tue, 10 Nov 2026 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=oAGE66uw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=RGT/f972uWQfwtH4gHJ4s0Su7/Fsxs8zhYnu69Jm8ag=;
	t=1794320155; x=1795529755; b=oAGE66uw8lQI/kwKkPw8s5Z7L6vVUFGI7hpNgSgy9LgWa0b
	2vARawxl1ZY6V2D9g4ELDwYvWq5DYuN5bBVDYZHNMTnaDLKxP4G4/JhULYh4yJVE5hsm0F0V64q++
	osq29zyDjI5NZbD+DX9d0glVBqRPnFw7pupxUM1s8iHwt20hScU0e+FEvY1rzrwyHy55no7IZvoG0
	o6HsPJWc0aUGvfIH8icA67R4IKV772i3kWfN6As6RxKMCWogYTJUfV7K5TE2Lvp2wtS+t4wBdhxTK
	0P2Yhk9/9fisVgexhP/z9QraRdmo7TaINQt7ru+QKlDNvzdPVJ0hw/04U/8nZ/Vw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQmdX-00000001nO6-0DCp;
	Tue, 10 Nov 2026 15:15:47 +0100
Message-ID: <7638714d73cda9a2538952f577be1a236ddee55f.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 01/21] wifi: nl80211: define Seamless
 Mobility Domain (SMD) device capability
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 15:15:46 +0100
In-Reply-To: <20261106-smd-v4-1-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-1-62e39487f51a@oss.qualcomm.com>
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


> + * @NL80211_ATTR_SMD_SUPPORT: Flag attribute to indicate SMD support. Us=
ed with
> + *	multiple commands to indicate appropriate SMD support (refer DOC).

This (with the wiphy flag) is the wrong way to do this, we have extended
flags that don't need the double enum value and pass through to
userspace directly.

But also, this does absolutely _nothing_, the only thing you do with it
is pass a completely ignored NL80211_ATTR_SMD_SUPPORT to START_AP ...
it's not even passed to the driver.

I suspect there might be a case for having WIPHY_FLAG_SUPPORTS_SMD and
gating the CMD() on it or so, like I did for the client side?

+                       if (rdev->wiphy.flags & WIPHY_FLAG_SMD_TRANSITION_C=
LIENT)
+                               CMD(execute_st, EXECUTE_SMD_TRANSITION);

but this seems rather confusingly pared down from what you had before.

johannes

PS: I'll probably not get through the entire patchset today since I have
to go soon, so best wait until tomorrow or so.
