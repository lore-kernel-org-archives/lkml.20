Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F647FB03
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392375; cv=none; b=ddFx0ozPkq1DOzZxTtDdsLDWImaOMebu0f5eRYZTewvK2PQydK0oF3foi/sF0+uwTJwm2DNCKTT5y+YLkjlDLX75rPHercLNNDyTihEyubou0d5Aa4X08gWaNOv4eOJob/bPKolcbqvKZ8hk6wv9Zu9vt+jV/u1KRBkHEeqWxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392375; c=relaxed/simple;
	bh=ZIc5wdBzF7Eo3TwtmXp7N5ocviEXanEWtYba1s8mAqA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KW5Jk4D81l27QzA0u+EYz/RTIolWJO3mtx9cgKEJgxbWS1Y9UGR8afdTBOyxeVBmdIZK0ABhlcFN1XsdjI2ChbXgsFYFD9m2mZPSZbHPLNWj+r+UouYIQwEA/wtN1+iU1hdfvxBKmwjcKN4ZwxDFV4JkAz2SoYk8m0vwWNB+VIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=zWPyn5VV; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=u1wLz4gp; arc=none smtp.client-ip=46.30.211.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="zWPyn5VV";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="u1wLz4gp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792392367; x=1792997167;
	d=konsulko.se; s=rsa2;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=ZIc5wdBzF7Eo3TwtmXp7N5ocviEXanEWtYba1s8mAqA=;
	b=zWPyn5VVjxNThWaLK3VxKa7MX87RgJsHeauOB2NOJH4XAfhq9lv3QPM5Bm2nAinxdLmxBmFJUHcAw
	 vtk38mk9Bfx9a1RR1WDTSxWYewtbh4MmDUn5BUKq5vTg0vIId9boD9lnWW/1XFueXGKR/Mp2GB6qch
	 hdPJDdtSrvwaDd8MOzUsgebYw3zkqCRWdxKYZDtTnqiQM7CfO+TL5RZzcPGDKgpjcGTMeRXFl/rBMv
	 pvcLUa4PZQlKWuc/xq/RrnyUNwlztSQjfSgdvjY27cb7r3JmysniqrET/TluBU6rSHH4IDFugYpKyp
	 vIw+b37B0VtFGktR5E7YhL1+mPHFFlg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792392367; x=1792997167;
	d=konsulko.se; s=ed2;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=ZIc5wdBzF7Eo3TwtmXp7N5ocviEXanEWtYba1s8mAqA=;
	b=u1wLz4gpXoUAuJpMAj+IXFrZCLOqwGRpq8AgLAk8C0dgc/x3tuGTB7PUcQTTs92W7dTnVy8FSTPOh
	 emqdoNdDQ==
X-HalOne-ID: c17ea4dc-cb88-11f1-8312-1db1c303b0c0
Received: from smtpclient.apple (h-158-174-93-34.na.cust.bahnhof.se [158.174.93.34])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id c17ea4dc-cb88-11f1-8312-1db1c303b0c0;
	Mon, 19 Oct 2026 06:46:06 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array after
 concurrent resizes
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <atTv1tg9q9n92kZv@thinkstation>
Date: Mon, 19 Oct 2026 08:45:55 +0200
Cc: akpm@linux-foundation.org,
 cl@gentwo.org,
 hao.li@linux.dev,
 hch@lst.de,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 nickolai@csail.mit.edu,
 rientjes@google.com,
 roman.gushchin@linux.dev,
 vbabka@kernel.org,
 vitaly.vul@partner.samsung.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F846CE95-6D2A-4D53-9C09-5C8630E2C8A7@konsulko.se>
References: <atTh-yyVIPQ-zNWJ@thinkstation>
 <20261018160315.1465504-1-vitaly.wool@konsulko.se>
 <atTv1tg9q9n92kZv@thinkstation>
To: Harry Yoo <harry@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Oct 18, 2026, at 6:15=E2=80=AFPM, Harry Yoo <harry@kernel.org> =
wrote:
>=20
> On Sun, Oct 18, 2026 at 06:03:15PM +0200, Vitaly Wool wrote:
>>>> How about we take my patch [1] instead since
>>>> it isn't prone to this bug and is a nice optimization to the =
existing
>>>> mempool_resize() at the same time?
>>>=20
>>> It is not a good idea to squeeze a bug fix and an optimization
>>> into one patch.
>>=20
>> Generally speaking, yes. But that patch had been submitted before the =
fix
>> popped up, so there was no sqeezing per se.
>=20
> I mean the patch you've submitted does two things (wihch is not good).
>=20
> It should be split into two patches that 1) fixes the bug and 2)
> optimizes it.

I don=E2=80=99t think this is a fair statement. I would say that the =
patch I=E2=80=99ve submitted improves mempool_resize() to be rid of =
unnecessary reallocations and data copying, and that (improved) =
implementation is *not* prone to the race found in the previous version =
of this function.
=20
~Vitaly=
