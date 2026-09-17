Received: from s1.sapience.com (s1.sapience.com [72.84.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE5455610
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=72.84.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789673901; cv=fail; b=l/VuCFiTOb0ypNw5PMxGMbTKhEJkOqlEDyi09wlbIPe2mq6te7W2CU/k2IXB+E3wxc2QVIVCyq4LAalgKiZu8C88DAROSvGZLbZVb+Fplv6i2Zf048MLsnfdx7Ylq4fTCbqByJ/GanT+OFxthW0wOKD6ty09yAxx7zZRCOAZXPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789673901; c=relaxed/simple;
	bh=cl2WIshzA6kM89fZecztqWVN9fwT7P6HQOSByUv7Buk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OZhpCKNmpIEq6yLFhNtUyeIgzKnLnPUGWimVBbjSuSO3d0CQ0/fvNzcebFHt6X7PcUNDxobdw159sYjs+Oj18uyOPi51s7OvS+BPt8D7x06Puvh+F6xJSB9a3e1WxFn+o+jN0CQR/ErLFMhXTrnqNSyqfijwZjNf6gltH6HquZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com; spf=pass smtp.mailfrom=sapience.com; dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b=BOulEepU; dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b=YbtcWXVQ; arc=fail smtp.client-ip=72.84.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sapience.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sapience.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=sapience.com header.i=@sapience.com header.b="BOulEepU";
	dkim=pass (2048-bit key) header.d=sapience.com header.i=@sapience.com header.b="YbtcWXVQ"
Authentication-Results: dkim-srvy7; dkim=pass (Good ed25519-sha256 
   signature) header.d=sapience.com header.i=@sapience.com 
   header.a=ed25519-sha256; dkim=pass (Good 2048 bit rsa-sha256 signature) 
   header.d=sapience.com header.i=@sapience.com header.a=rsa-sha256
Received: from smtp.sapience.com (srv8.prv.sapience.com [10.164.28.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by s1.sapience.com (Postfix) with ESMTPS id 24227480AB2;
	Thu, 17 Sep 2026 15:32:17 -0400 (EDT)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-ed25519-220413; t=1789673537;
 h=message-id : date : mime-version : subject : to : references : from
 : in-reply-to : content-type : from;
 bh=cl2WIshzA6kM89fZecztqWVN9fwT7P6HQOSByUv7Buk=;
 b=BOulEepUyjQpXrlu0jog7i/UZnIlGrPj1ICBfxq7uMneQc7muE77/TyHvycpqt7+nmsDN
 lkZF0kUjibmQJUEAA==
ARC-Seal: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412; t=1789673537;
	cv=none; b=Cxc8LKzK7R5X3aLpUuZUFLYLgHbu+TM3+8m/VmVE/YgCR8Uvmstwviblz8AQhKw+jDOC4vwmUZZ8w6tVC5Mt+vVX/DppwAvidi/GVymkEDonmkp9BPq7kv4hnr3E775gRSY37IztxapRVIWnvPl8thWR2QcC/YdpfMmGuPOCH0O53q48wbHIhnPxfCyuZ8ZM8ZpMNyZodGWdd3iZ6L5qA6zd51FSqeheaJCrYWStBoSP0EcN/aP/AjDG8qT8bjQrFkKuWQGsadhghAA2vw0iply9S6lclmXAZkX453nTuuvutolI9XWbTtf6/b1LHPjLERsVEPLeNOUWTZJCYHURMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sapience.com; s=arc6-rsa-220412;
	t=1789673537; c=relaxed/simple;
	bh=cl2WIshzA6kM89fZecztqWVN9fwT7P6HQOSByUv7Buk=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type; b=UguJOTebkHyWcpdPqItU2IhleC2E9JPRPmTf0HuMEJvRsAIVGNx4BNJJ7EoKM0ohT6+Una8UuGDmtfknHW/LNSEFACChDk4Snv4UdEQuvtKoK6o9YowJbmpqdtA3vl+XAqfWapARna3DUCtDLB8Ub+TJl3v2ZUsK+oAs3Qikh3H5p2VRoExoYkOtf1hVtY8GRZwJpZYn1OQkeG0a6DO2/HK5dJZ9NxLkGmW33ORQ5sznMiPg6Npl9Vir3lWEom+Pc2rEsIWGKFYDHMVNSRFvYktKkRGpbXU8rjI0kt+grnB59rVxLEFP8OjQlF27EdHnPrD3lMrIHfucIswFQtKqaQ==
ARC-Authentication-Results: i=1; arc-srv8.sapience.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapience.com;
 i=@sapience.com; q=dns/txt; s=dk-rsa-220413; t=1789673537;
 h=message-id : date : mime-version : subject : to : references : from
 : in-reply-to : content-type : from;
 bh=cl2WIshzA6kM89fZecztqWVN9fwT7P6HQOSByUv7Buk=;
 b=YbtcWXVQJQHrC9zUE4LZPkyWNofDXWYKWbqzXrqQwx8rn27+YqsJgu3gB+dSkb9O3Hk9e
 kJ14n7yhC4uLJk/mQgdgsUVN9/cvWPvRUedrUcFRRv2nejdlhVJ5UMoAeuCWz8QaSSM0iu8
 PZk6kCjqSCzlPO8ZY3IfBtjfxIypzw4lPih3oTwBUL91muWqso/nac3qyfRUPWo6rR1Fmok
 BrhGlzdED0F38nGzVwQDUIgCDo3hxsuI8mYGHXlBnsL1HhnxQwBVM0zx39HVnlwAZQloofU
 owFO10s7qmkP18qqzTO4Tw8OuJiQRn1u4Zn9HxFmMQ80wqLany8Nx4KWkZEg==
Received: by smtp.sapience.com (Postfix) id E53BF28003B;
	Thu, 17 Sep 2026 15:32:16 -0400 (EDT)
Message-ID: <f94d77c3-26f3-4407-ba88-5ebe64fc4e63@sapience.com>
Date: Thu, 17 Sep 2026 15:32:16 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: False-positive missing-firmware warnings for devices not present
 on the machine
To: alan.hovgaard@gmail.com, linux-firmware@kernel.org,
 linux-kernel@vger.kernel.org
References: <CAJEbJRCH_YwTt68oPEmqz_-CGAgCJ5-dGocALr7k4zjyUUnY=Q@mail.gmail.com>
Content-Language: en-US
From: Genes Lists <lists@sapience.com>
In-Reply-To: <CAJEbJRCH_YwTt68oPEmqz_-CGAgCJ5-dGocALr7k4zjyUUnY=Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EQENSjCiolTuIZfSV6USFfIP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EQENSjCiolTuIZfSV6USFfIP
Content-Type: multipart/mixed; boundary="------------gGtpIMrqP04EBz0WYOfQR7bu";
 protected-headers="v1"; hp="clear"
Message-ID: <f94d77c3-26f3-4407-ba88-5ebe64fc4e63@sapience.com>
Date: Thu, 17 Sep 2026 15:32:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: False-positive missing-firmware warnings for devices not present
 on the machine
To: alan.hovgaard@gmail.com, linux-firmware@kernel.org,
 linux-kernel@vger.kernel.org
References: <CAJEbJRCH_YwTt68oPEmqz_-CGAgCJ5-dGocALr7k4zjyUUnY=Q@mail.gmail.com>
Content-Language: en-US
From: Genes Lists <lists@sapience.com>
In-Reply-To: <CAJEbJRCH_YwTt68oPEmqz_-CGAgCJ5-dGocALr7k4zjyUUnY=Q@mail.gmail.com>

--------------gGtpIMrqP04EBz0WYOfQR7bu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8xNy8yNiAxMjoyOSBQTSwgYWxhbi5ob3ZnYWFyZEBnbWFpbC5jb20gd3JvdGU6DQo+
IFdBUk5JTkc6IFBvc3NpYmx5IG1pc3NpbmcgZmlybXdhcmUgZm9yIG1vZHVsZToNCg0KSSdt
IHByZXR0eSBzdXJlIHRoaXMgY29tZXMgZnJvbSBBcmNoIG1raW5pdGNwaW8gdG9vbCB3aGVu
IGl0IGJ1aWxkcyBhbiANCmluaXRyZCwgbm90IGZyb20gdGhlIGtlcm5lbC4NCg0KSXQgZG9l
cyBub3QgaGFwcGVuIHdoZW4gZHJhY3V0IGlzIHVzZWQgdG8gZ2VuZXJhdGUgdGhlIGluaXRy
ZC4NCg0KLS0gDQpHZW5lDQo=

--------------gGtpIMrqP04EBz0WYOfQR7bu--

--------------EQENSjCiolTuIZfSV6USFfIP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRByXNdQO2KDRJ2iXo5BdB0L6Ze2wUCaqxAQAUDAAAAAAAKCRA5BdB0L6Ze2xRs
AQCIRocn2m+4NF0RCx9AEXcSIOhRr9yd5zMYL58IW2+4vwEAojjMAdZnzc0lgJnqS7DZMrHthKyN
2PlJcuaTjHzj+QQ=
=HNEM
-----END PGP SIGNATURE-----

--------------EQENSjCiolTuIZfSV6USFfIP--
