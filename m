Received: from mta0.migadu.com (out-3.mta0.migadu.com [91.218.175.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57D441A785
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228140; cv=none; b=mLx7finSpEqGTOU9qS+kbhaXLadWnwJwsEpnk8+pKBXdk8h2c5LVFm8qx+cqaASORzSi4UZvzXeKNpHEayTIBJ59uooi6uvVzScBaSaoxsN2uTFgOibupPAfRRk7jRjOJExEFnTvHV5ep/OIvz2np3WN+ACgxacgGPKrQwm2UNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228140; c=relaxed/simple;
	bh=7Xxdw0BpYVeSsVYvjnUMpQGHZK67v9pQzvF+pta/r2k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nh+DwWI2Ne8oLt9stdTzypwFry6EuJErpBA07egWVWS3x6xO7sKu45Zt3c3DFSH7xseeC4oNGsGKg2eGkpwaQfkMJVVWULKFn/Y7sGhxl0OooLRV4VTLxi0yk4lGluwAvd9Gx3+OK8SOjg31Mo4RYi3oB0I7n0nsRek9SmsqMik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=jtWBlZvu; arc=none smtp.client-ip=91.218.175.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="jtWBlZvu"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=7Xxdw0BpYVeSsVYvjnUMpQGHZK67v9pQzvF+pta/r2k=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789228135; v=1; x=1789832935;
 b=jtWBlZvuvS7+BgGr4dZSQnEoaFTAqoHZWo6YPzn/vDM9GNWzVDcTl2BhEe6g+dwbTRNTvbnd
 RZavAPp0l7kVXvovMev9f/5LS9mng2aTS0kPhhWwUalRtyugeUCWTmiFF4j/jUrVECRwMS3RhSC
 iqNtBV6xanaGzUlH1blXIkHTnkAjx1T3VtQDmMusmhQR7r7WuBx769LptoJivx1UgrCNnvuNxjj
 7wtkB8dg1nsfcYiANnors7R+d8rH34krSDFUr9xX6Rf4PL3TU0O4wO/CZcJL4IOkmmKfucXjQVy
 +wY9PVMEHd9n7XRJNqAh+xxYgPqz/uxZYOAexsulVUBdg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 835f230ca6fc7137;
	Sat, 12 Sep 2026 15:48:55 +0000
X-Mizu-Trace-ID: 835f230ca6fc7137
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 17:48:52 +0200
Message-Id: <DLDGFSSZUIKQ.19CS0SRKYOKOJ@cknow-tech.com>
Cc: "Ricardo Pardini" <ricardo@pardini.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix i2c6 clock-frequency on
 NanoPC-T6
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Heiko Stuebner"
 <heiko@sntech.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260911152911.2088363-1-diederik@cknow-tech.com>
 <2071782.usQuhbGJ8B@phil> <DLDEGZ68QQ19.1MJEB7QOK4G7T@cknow-tech.com>
In-Reply-To: <DLDEGZ68QQ19.1MJEB7QOK4G7T@cknow-tech.com>

On Sat Sep 12, 2026 at 4:16 PM CEST, Diederik de Haas wrote:
> On Sat Sep 12, 2026 at 2:41 PM CEST, Heiko Stuebner wrote:
>> Am Freitag, 11. September 2026, 17:28:33 Mitteleurop=C3=A4ische Sommerze=
it schrieb Diederik de Haas:
>>> The i2c6 bus needs to run at 200kHz, because at the default frequency o=
f
>>> 100kHz it may fail to find the RTC resulting in warnings/errors like
>>>=20
>>>   rtc-hym8563 6-0051: no valid clock/calendar values available
>>>   rtc-hym8563 6-0051: hctosys: unable to read the hardware clock
>>>=20
>>> But only sometimes. This should not happen when there is a battery back=
ing
>>> the RTC, yet it does ... sometimes.
>>
>> I'm confused, shouldn't a slower clock always work?
>> Like I understand how a clock that is too fast can cause issues due
>> to hardware limitations, but running the bus slower somehow shouldn't
>> cause issues?
>
> Impeccable timing ... as I was just about to retract this patch.
>
> So please ignore/drop this and sorry for the noise.

https://github.com/rockchip-linux/kernel/commit/815c9a084e62d700ab5487974b6=
3035e772a29a4
"remove the buf[0] & HYM8563_SEC_VL, it's unsuitable for some hym8563.
set rtc init time for first power on."

I guess I have 'some hym8563' in both my NanoPC-T6 LTS & Plus :-/
The one in my NanoPi R5S works great, so I'll just use/depend on that one.
