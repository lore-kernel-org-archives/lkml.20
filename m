Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.205.69.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515096;
	b=EXXKF0vHT80RgALNKVgNoFLUehilJUea8ZB5CbjIx240OpRo77DAVA1sGsdp+5TPYFrg
	 L2/a4F1KjZeJ+ntuKCub/17fz34nF5S3vpLBM3CI38B+dKJmD49clbherrJh3f3caFnuX
	 G7jBn74vclNMCIxaJGMsTzX25tjFYDj2Qdc0/LBXD4mNMTIGUbnYZFaP4NGYTmUjLzoej
	 4eJjmczFihRBgx/e98ptFwnoq2myelDKH+cWWHL01c4bBiOTbCW+AydUQnFnMcSvDqL39
	 NTkFpNgOzrpSwLgBs6plpTZj+2ivIejTgqGsGdGHRvlbnqyoBpzpPA5QqYcI1HVONWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515096;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Feedback-ID;
	bh=PtSio2YcRjUGo/PTlEArxH4x2rEk7BbnuEJRInP3kq8=;
	b=sB07SILc8T4aCEqcVM/VIzY5kFxETYgitRg1dIISnYGrSC5myqWJroUq/QvbKa/yLY8S
	 +bfBhJClwN8QUAN+468fdI+sFU9q0hOcE6ZhfnZILVv/OmJopP7ETzY6lq7jNQIsZTtrY
	 Nxu0wcV1mCJvtqa1NZe1S4IMJLV131PKFxsMnWwabYJ89AbmjlwvYYtccu6X/Ta3AkZi3
	 vauVZT0W2qTFtPAoFJhhT9eNclCT/dUpVmDhnXaJhV6cUeXhTgdJIpwa0S04rPq/Ddsj2
	 MOtEHCp4PQCjETShv1O/QwbFEFLdIkmkJrCYgy2Vj/pF7+FoW0tDjwftWn11Xrd0J1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuta.io;
	spf=pass smtp.mailfrom=tuta.io;
	dkim=pass header.d=tuta.io header.i=@tuta.io header.a=rsa-sha256 header.s=s1 header.b=t7oWQcTR;
	arc=none smtp.remote-ip=185.205.69.213
Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ED1606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6ED1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuta.io header.i=@tuta.io header.a=rsa-sha256 header.s=s1 header.b=t7oWQcTR
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 4D0A21A390EA4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1794515094;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=PtSio2YcRjUGo/PTlEArxH4x2rEk7BbnuEJRInP3kq8=;
	b=t7oWQcTRLFV8EfH0Z9oCKiMWx7TBp3nr3wLRNSNbljvlUHZjaLPmREOyIRGbKrZ0
	mVeBkE4uxgOVvD2WMaQf7sLbf0XyMhzc0vnfUvK1YmVqLHhDE1pFVB69pOoMze23bbQ
	/MhnNui/4xCqFeM9YdCzsn2vX5SFL/cB/JpQu8M364hinugmww/43G0N+n8JAhK+roV
	auXKF+rjcUjVQBtgTBIndD+GW2BQoKx0YJh33iN3/JxhHPe5V3uYzW3DM8cDcL4LvIT
	j9nk7fwTVQdSssnunLg9m/cuoVTHkRwp8dt6y+NqDDhQmhZr6rx6nCFbfykiQCxF+zx
	Tn4NnBm0bA==
Date: Thu, 12 Nov 2026 21:24:54 +0100 (CET)
From: servpol@tuta.io
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linux Pm <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <P6GQkBA--F-9@tuta.io>
In-Reply-To: <avEHPVdx0NlX4dhy@venus>
References: <20261021-gl-e750-mcu-v2-0-9bd7e7c2e0e1@tuta.io> <20261021-gl-e750-mcu-v2-2-9bd7e7c2e0e1@tuta.io> <avEHPVdx0NlX4dhy@venus>
Subject: Re: [PATCH v2 2/2] power: supply: Add GL.iNet GL-E750 MCU battery
 driver
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Feedback-ID: 01bb77f0f6a34f22cd96c09b0ff79382356995353b38b124f21de10af076a9961e02969e72277f7fb26516500e6c215bfc:TurnOnPrivacy!:tutamail

On Mon, Nov 09, 2026 at 12:35:58AM +0100, Sebastian Reichel wrote:
> The Sashiko analysis looks correct:
>
> https://sashiko.dev/#/patchset/20261005-gl-e750-mcu-v1-0-499d2e31f786%40t=
uta.io

Hi Sebastian,

thanks for looking at it. That link is the review of v1, and both
findings there are addressed in this v2 (see "Changes in v2" in the
cover letter):

- a new message (they all start with '{') now ends the previous one,
=C2=A0 so an event that follows a status reply without a line ending is no
=C2=A0 longer appended to it and lost;
- the poll work no longer clears the receive buffer, neither before the
=C2=A0 request nor on the reply timeout; it only consumes a pending status
=C2=A0 reply, so a partially received event stays in the buffer.

Sashiko's review of v2 reports no regressions:
https://sashiko.dev/#/patchset/20261021-gl-e750-mcu-v2-0-9bd7e7c2e0e1%40tut=
a.io

If you meant something else in that analysis, please let me know and
I'll address it in v3.

Thanks,
Serv
