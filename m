Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DC12DB7B8
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789222590; cv=none; b=IGISOyBLz9F5r44+yLN3CkK+9vRZcXCKLpqHVAaqhid7/+nGSozV2+W1qsFOvWoPg8yBC+NODJPzLPf0zLPdozk0QGHMAl5/YFsa5O37TGgIxHYLizu0XGzDzVGt0eFzNeUXjRzku9QnVrxjEemoVwpcanr56IZ4QE3YTYr0+vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789222590; c=relaxed/simple;
	bh=gWTv9m159o9tqPhsbO31jxi6b8U5wx9tbWutAlj+Ycc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=YUzgW5h4MyALzlcOomMG3Z7x1A+28gjR8ugEZmzDf4lzhaGXP1QQ41yYn0pND1nNDO/cjV3/v6sxqzbxB2X/sy+D4aHe54TDSXN74NxgjKns8lLa02EYNv9ofx6M+9RYHje9PnSxMJe+0GUseBtZpV/t+HknCUuhdHBa1+NAMt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=Pf/FMT+s; arc=none smtp.client-ip=91.218.175.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="Pf/FMT+s"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gWTv9m159o9tqPhsbO31jxi6b8U5wx9tbWutAlj+Ycc=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789222584; v=1; x=1789827384;
 b=Pf/FMT+szYm1C4slkIL1AF2TsUmqIYizkP1pOg5AzF9KLVjHmE53rDd5eygW2NYJLrvEyKpD
 S3afT/SP68ZH3YxA1LdSwrKLFEoVt5L4rTVTEtEt4TDTf5t6g1KuC9SxxhjdusU4HuIn87MGWxs
 pK7W/gzv8yFWrmLE2+m8kBqcNsJzTw7x0oR9xO1QEZAxA5WMsPYhumtrKtG38eNnEcsOGbWCn9Z
 NFszoRXJnx5n7aFkj+7NRDldtr2GxSCe1zBFFPLak1YbmlsiGz6ifWHr88tlb8JOEhnWfQybrUh
 ZgKR5VJKFwJhlDTxmNXarAdveD8147OvllSxL/VvDqLbQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 771c737939bb75a4;
	Sat, 12 Sep 2026 14:16:24 +0000
X-Mizu-Trace-ID: 771c737939bb75a4
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 16:16:22 +0200
Message-Id: <DLDEGZ68QQ19.1MJEB7QOK4G7T@cknow-tech.com>
Cc: "Ricardo Pardini" <ricardo@pardini.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix i2c6 clock-frequency on
 NanoPC-T6
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260911152911.2088363-1-diederik@cknow-tech.com>
 <2071782.usQuhbGJ8B@phil>
In-Reply-To: <2071782.usQuhbGJ8B@phil>

On Sat Sep 12, 2026 at 2:41 PM CEST, Heiko Stuebner wrote:
> Am Freitag, 11. September 2026, 17:28:33 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Diederik de Haas:
>> The i2c6 bus needs to run at 200kHz, because at the default frequency of
>> 100kHz it may fail to find the RTC resulting in warnings/errors like
>>=20
>>   rtc-hym8563 6-0051: no valid clock/calendar values available
>>   rtc-hym8563 6-0051: hctosys: unable to read the hardware clock
>>=20
>> But only sometimes. This should not happen when there is a battery backi=
ng
>> the RTC, yet it does ... sometimes.
>
> I'm confused, shouldn't a slower clock always work?
> Like I understand how a clock that is too fast can cause issues due
> to hardware limitations, but running the bus slower somehow shouldn't
> cause issues?

Impeccable timing ... as I was just about to retract this patch.

In all my testing I regularly got those error/warning on 100kHz and not
once with 200kHz ... until just now.
My reasoning was that it was too slow to respond making the system/driver
think it wasn't there and thus causing those error/warning.

In the downstream kernel it is set to 200kHz and in my testing the downstre=
am
image (with that kernel), I have not once seen those error/warning.
So I figured that the 100kHz was the problem.

But that's all null and void as I now did get the error/warning with 200kHz=
.

So please ignore/drop this and sorry for the noise.

Diederik
