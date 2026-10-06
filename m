Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D8D1F192E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312900; cv=none; b=OwSrZPNBpypfKSVEMSywxcN6QrDw+eTYeySCY8x+SomdxOhSDOpAOWt+hCsj+YDQN0bvQ3+YacVbfYsueqsepbA0b31b9gVephZaptfm2vke5KuUy316xF84AB6TB+tcJKbKXREFaG+mu9dS4ybnwODjLdPdqU8GMjDI0ksO0oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312900; c=relaxed/simple;
	bh=3bvT2VatBc1K+HvjSMEV9tZwrAHqrBfs03wveSjQq+s=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=GaDDLOmCgvs4DGuZhC8yJoveTmvd+yviHBhzHElHV8XWNwoDwIytj8y2z+JfK1ujru5kPalGg9f/rT4bDHIKv/pDyr76bc1vwqNKvlUeSGrzW70DrVi2QukMVB8US+dpO8EwgHuFlWVKt6j5nMq5gQekZ2+lYzvp7pvmE8HrhvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=mBQQMbvl; arc=none smtp.client-ip=91.218.175.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="mBQQMbvl"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3bvT2VatBc1K+HvjSMEV9tZwrAHqrBfs03wveSjQq+s=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791312897; v=1; x=1791917697;
 b=mBQQMbvl3gSTi/r3flm6HPOfjjNv5JbZeXIGEP4LlMdVlNUijgBNm8159X9do/x4yOZB7CFh
 2nLBmKVNjvjKRxCMNEUtz8EAPWvJd/zYDl78fOes80kO9rIeDKQOsu0vIgVe3u6OCnkTpeiXlpw
 sbSPYCc1Bl211PcBfmE9vFFXOysVwack/Oj2VqEe5pHg8oJIEJu3E+Mh1TruhH9oDFvt0rre99I
 i1Y8DjJLh8PxFDUQK0BTn7J6Pp//fGrfvXgkjOPkP+psOEj/qd5S0xmXSEIslgKji0gb8PYIo4+
 DsccG4yeZn8OTag9TkU9IUv8Uz7Y00dv3vE74CV+crOrA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b3cd69ab155009df;
	Tue, 06 Oct 2026 18:54:46 +0000
X-Mizu-Trace-ID: b3cd69ab155009df
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 18:54:46 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Paul Sajna" <sajattack@postmarketos.org>
Message-ID: <8233c4f988d72cd2cc65897dcf2d9e46639ecffd@postmarketos.org>
TLS-Required: No
Subject: Re: [PATCH v2 2/7] leds: aw2013: Rename internal APIs from aw2013 to
 aw20xx
To: "Griffin Kroah-Hartman" <griffin@kroah.com>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Nikita Travkin"
 <nikitos.tr@gmail.com>, "Alexey Min" <alexeymin@minlexx.ru>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <179128353952.5667.14752630401954655843.b4-review@b4>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
 <20261005-aw2013-aw20xx-rename-v2-2-108ecbdf2775@postmarketos.org>
 <179128353952.5667.14752630401954655843.b4-review@b4>

October 6, 2026 at 3:45 AM, "Griffin Kroah-Hartman" <griffin@kroah.com ma=
ilto:griffin@kroah.com?to=3D%22Griffin%20Kroah-Hartman%22%20%3Cgriffin%40=
kroah.com%3E > wrote:

> I understand the impulse, but the preferred way to handle this situatio=
n
> is just to rename the properties unique to your new driver, otherwise
> this code wouldn't make sense to be in the aw2013.c file anymore :)
>=20
>=20Thanks,
> Griffin
>=20
>=20--
>

Thanks. This is the sort of feedback I was looking for in the RFC, but ne=
ver got directly.=20

I'll=20walk back the renames some more, and look at the fresh batch of Sa=
shiko nits before sending v3.
