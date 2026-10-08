Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEA23B9D98
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462558; cv=none; b=JxC915esJVROvTc2ixItk3uQyL4W+bQ4sfZa6ovfumTgkbUgYt3RpIG5T/j5TdjgsOmd3/6Y5exR+ko9x7L47tlfxSgCba7+5+0fPsJ9UDorUpQ57N422cbSMpBOMKHvNuxsrAw/xKD08PEeQIKy4dj9AiB7va7aGBGJcdSZ3kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462558; c=relaxed/simple;
	bh=nZHmZON2nl0d53PJo9utRHoGIaTEY0QTeLfJTrCuWak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L7spCJ4ErXVRIbFMoP8PBuc8wVECMCxqMID/KGcj3qd8Dab3lgEvBOm8OlPZlggK++sS+bNK6XzPlWczVXVAXZaZA2BvKG4PiAWo+5JYH1xeAcL0O/kknVFcyVd5OWRQSCx0JwhqPpwVgwgLKy/L0BSNf4rqdKzxDvc1zgQoJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.b=qbWzj00h; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=efault@gmx.de header.b="qbWzj00h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791462542; x=1792067342; i=efault@gmx.de;
	bh=VhgOHJ3tDGEJI8/FmJu1Cmyr/NYgC/dy7jSErME04uo=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qbWzj00hF/M70hACbGFDZ1hRol/FyRPwZXEaL7aXmwUGNCP9Yll0FaQSovhimZO7
	 GkiF3HKaD8rF8xHtbgyirhrvTGqG0Bz8uJ/WGVOwfP3Do8jOxisRFzJC1ZF3gnqBk
	 yGEBAKpDNvm82Dxbx9YqAtwpv9R5Dv4pGsc2b0ume8drpN9cw/wRA5yUzIxNFrSow
	 wn/dMQCS7qPKr7FFfoNKVKMDXsqU7fQQjZNYJBaFdI0xW+Yr/YMuQ7PUcLdigG2c+
	 RXOewP5LT+INYpDPhJLYMjRYw9kN+qLJh13YG4aolUuIjbzjSY4uTDcoQjoXPxm0t
	 0ekCoXPVZB08Mhw5nA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvL5-1x4ieR16M1-00NPx5; Thu, 08
 Oct 2026 14:29:02 +0200
Message-ID: <828fe52d7514cabf240f354268f7cfb541516f15.camel@gmx.de>
Subject: Re: [PATCH] sched/autogroup: Serialize nice rate-limit updates
From: Mike Galbraith <efault@gmx.de>
To: Hui Su <sh_def@163.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	 <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot	
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, 	linux-kernel@vger.kernel.org
Date: Thu, 08 Oct 2026 14:28:59 +0200
In-Reply-To: <20261008064440.240528-1-sh_def@163.com>
References: <20261008064440.240528-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EK9Kcpx8Bp9Tom02jmV8lThhL7xkkMfDmzOsM6riJkQYmvG/ASY
 q9qYZXQ19YxpckND9XtreAN9XiR1c9xnjuleKxWZljf4wOew0Pqn358TE8KXWHWHJZDQGqL
 CcKKjVxgJqmKNwntwC0umlZaopOL4lDMRFVMV4W9EAEFgWsYc4a0hKjr5k8dzS+7BZWlksS
 ObUvraPfy2BAYNcMvTi/Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qffJHnUl5DU=;Iwr0fLdlSzjnxdrKwJoogticiiD
 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

On Thu, 2026-10-08 at 15:44 +0900, Hui Su wrote:
>=20
> - x86_64 KVM rate-limit oracle observed two pre-fix writes within 20 ms
> =C2=A0 and no post-fix pair within a 100 ms window.

The intent was to make it slow enough to prevent users from annoying
admins.  If it doesn't do that well enough, by all means lock it up.

	-Mike
