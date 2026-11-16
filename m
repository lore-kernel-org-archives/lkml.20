Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827640;
	b=PWkn9kwQ+Mq87SAPSjf8qdg0QjttzaF8txUThtNkXZnjc0zZe2/ur2PhUEZCq5lGcAeA
	 f48j2MBEVIRkpIb+mnpztRwHraoKyzFHfLJfOxZyIlg5zQ1uZbIv6UoVdiOQCAJho0mGm
	 ckbmJLh+ag1LLxwk1gt4QUtYm2FCkh5yCCugvHY+BfdHsuY1tlZTe5Q8zJyX6SASGqjM2
	 IhbFjGahKfYPMIlEvOjLKyBTcpGVpdCtbM/KgCbKP2DWqT0mGOCvpUuFCEAUIqUzM02A/
	 xUjwOn3txPnP319OvNGqWjM8qIBwYPqP3V1Xii89Gmsj97gF01Le71548ErjJKlOn0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827640;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=q3tXTTuzZPDwf7cWttrKZdbIQ10UDrDakG8A8akmtsc=;
	b=hyqrdd51OaUMQXG6jGXsFQyXWrM1tOm4kuCEwF/1brNuGhJGgLLzwXeO9MPSiHhmx/7s
	 VNA/8lYu+BMLkaMVCa9l+Vr2aOrjx/FkSPMvwvbueJg4zW6faYKwgmEwYwMo0lXughZvy
	 F0tlOg6232zt8/Ay9mGUNt0tYH487Vxj7T1JAn8w2modxOEeXE1IxYc3mJhudhFe0Nv4n
	 Hn9ZPnQkCUKeuDd3uo1jBYPJLtpAPNZxClHl4GsnMzH52UeOPdKNdnHo0oE5qMQOoZhOJ
	 XADdzkRSnPm/BNOSNTxsnpy1Bbh/bcRSX+L1DudTuVrQAl8lHEwBooQDw5hhqmr5ZVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b="p6tJuYr/";
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27204606A8B9;
	Mon, 16 Nov 2026 11:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=p6tJuYr/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=q3tXTTuzZPDwf7cWttrKZdbIQ10UDrDakG8A8akmtsc=;
	t=1794827639; x=1796037239; b=p6tJuYr/EAWGpL2edL7Zpun4M6i3IRsmyNLZ8LlvyDsQHsJ
	JgTBysM8cDCLFPQFC6ZLM83lBRFVHr2irBIDDG6c7L4JB2QyVdq9g9pA0M8aFu2OnmJrLUxAugMAT
	SwYi7wrwfAEopmTv34Xqw1DA0xyt8a5IssdnpNtWTjP/2ZJ5YnsN03uFsnnqgaUodqxTl1O+NRAWb
	PA0ASE/elpvrZaFkp/2Y8JeysaYCa1P5HGRChqXp7iH0ylTYgdudHgrWtRkUi6g+rNeY9cAHVUp9v
	jP9Uxu4y70+3sGxHmVRtxRuEflQ/KGuY35A/h5GYARo6sh/aCOK62rELjfd8VezA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSueq-0000000GZaZ-1ipX;
	Mon, 16 Nov 2026 12:13:56 +0100
Message-ID: <0ebac9768c0294b8ecfc8729447dee94ec0b7c84.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 09/21] wifi: nl80211/cfg80211: add
 support for SMD context programming
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 12:13:55 +0100
In-Reply-To: <2be101bb-081c-4d6b-93b6-a7cea3f183f2@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-9-62e39487f51a@oss.qualcomm.com>
	 <7e6a6640fe034af160eec0dda532259b499153ad.camel@sipsolutions.net>
	 <2be101bb-081c-4d6b-93b6-a7cea3f183f2@oss.qualcomm.com>
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

On Fri, 2026-11-13 at 23:24 +0530, Pooventhiran G wrote:
>=20
> There were similar changes done for array of values for
> NL80211_ATTR_CNTDWN_OFFS_BEACON, NL80211_ATTR_SCAN_FREQUENCIES, etc., So,=
 this
> approach was done here to make sure that each SN in the array was u16 as
> expected. If there _is_ a way to add policies for the iterator-based nest=
ing
> of such values that you could point me to, I will change accordingly.
>=20
> [1] =3D>
>=20
> struct nla_policy sn_policy[8] =3D {
> 	[0] =3D { .type =3D NLA_U16 },
> 	[1] =3D { .type =3D NLA_U16 },
> 	...
> 	[7] =3D { .type =3D NLA_U16 },
> }
>=20

Wait, I thought you _had_ a policy for this? Sorry! I also thought we
had a macro for such policies, but ... I guess not?

There's a preference for using a single attribute multiple times to get
an array, in part for this reason, but we've never done that really in
nl80211. Maybe see how that'd be?

johannes
