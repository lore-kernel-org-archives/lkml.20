Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090773;
	b=yfKj2jLv9ljt3/6pyUvRuwsZ59/uze6XVPoUAlo9z/knrBwCdN52GNmU3WZICDv78I4Z
	 kn40ZsiFpkkoQFpvibNxDw1LDpMpi2DOSJj7hTaaKu1OGxTgpZRp5q9a92Qqn7PLgzNfB
	 ExALJCbHsL37H7/VBMu89dIkf+0xlk0K72O4tTu23emKaIpqj10Fu6/ZBO3KS6kFHDzoX
	 WrfERfo6madGTN5bdXCvBjgHbydeLJmSel/Bq0qGgYZWb1DjWDIMGskFczOymOoTMdc1D
	 aQBwsb87D42tNK8HXfs20TrH+dMZ73NN+4h5xUlQ8n+e5kEbtaNH0pm+DyBc4vjXxPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090773;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=CSDnY2+EpC0A6qfUh4OJfRDawLSOsU0FBryWMPhro+0=;
	b=AzqptW0V/mSsFar24Rg/pOf80n2worwEPkOtBSqrsDllGqYzODhfbyY+8S56k3YL6v3p
	 jmDpGQKZAg8MyVa1c4HczJB6VmHqDdfh4ykZdSv8iVSW2M8GIkORzhMWsknWzAL5MWx8o
	 TJSReewpr7D6NsN5vfSiSyEoXeqwkGwKNWtK15fxskFX2UtXMLgaf4ZIfUG4XVaqICff5
	 ij58GeLqOR89MAiibXD+Ei/urFjIDvheE3xiteWNF3wjfytRg+sXDv2qgLmEzxyOTuujR
	 Eyizi2ajOOHf6xluHpbRfXLaq96bbkMpPR72b+kXVZDQowSsyWKcm0hgIWvek0rbOEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="DYY7/zi9";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8EA606A31B;
	Tue, 27 Oct 2026 08:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8EA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DYY7/zi9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 84341C79AAE;
	Tue, 27 Oct 2026 08:47:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08AEA603BD;
	Tue, 27 Oct 2026 08:46:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8809E10329093;
	Tue, 27 Oct 2026 09:45:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793090761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CSDnY2+EpC0A6qfUh4OJfRDawLSOsU0FBryWMPhro+0=;
	b=DYY7/zi9FjTqvNbno8coXmmIEmIhesBXCpG8qUPru3z5pRo5hRi1dUaJLen1HcpjdpMA1M
	w8RKg8cdIdliJ/mhfVVwnmFj1wOqlnv2ImO+kQu1d/xi2nTnK9D51yIAEC0EDekKIOJsj8
	FfSRtaMME+9eD+7Q0HpILdBuaPVOAQtPYd6Y5pTefrZHUzowe31/GDgVYck8FT18Olwu88
	3hsR2BqT4AAwlzDfQRdlmggqn0beyfB3QeeUlH6jXprZEKGrxre79Qy6vqPgugAWIrbV20
	G4hbikkfPlJYcDGCiJEuLs+F5W5iMwZmzRdIIslJI/wzm17/a04N0NV/h96cNw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>,  Stephen Boyd <sboyd@kernel.org>,
  Abel Vesa <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Frank Li
 <Frank.Li@nxp.com>,  Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@gehealthcare.com>,
  =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] clk: Use v2 rate calculation on i.MX8MP
In-Reply-To: <1j8q3kkd8t.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Mon, 26 Oct 2026 10:44:18 +0100")
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
	<atjIIHkoNwBVDO5b@redhat.com>
	<1jtsmch5id.fsf@starbuckisacylon.baylibre.com>
	<87h5icnzs9.fsf@bootlin.com>
	<1j8q3kkd8t.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 27 Oct 2026 09:45:55 +0100
Message-ID: <87cxsvh6po.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Jerome,

>>> For rate negotiation, my suggestion would be to reuse what the
>>> framework already has: clock ranges, and re-running .determine_rate()
>>> on the children being dragged along, with the common ancestor's rate
>>> pinned. When that rate does not suit a sibling's range, other ancestor
>>> rates can be tried within the constraints, rather than giving up.
>>>
>>> clk_set_rate() is a best effort function. It tries to get as close to
>>> the request as possible, honoring the ranges of every clock along the
>>> path, and it is up to the consumer to decide whether the result is
>>> good enough. That decision is lost if the framework recomputes the
>>> rates of a sibling branch on its own. Ranges could help it decide:
>>> either "I'm fine with the new rate", or -EBUSY.
>>
>> I see an upside with this approach: we could keep one single rate
>> negotiation logic. But it still requires modifications to be done on a
>> per user basis to be enabled (but that is needed from your perspective).
>>
>> While I fully understand all the concerns expressed above, there has
>> been one minor point that arose while working on your series: it's
>> very hard to determine the tolerance beyond which the clock rate shall
>> be refused. Expect bikeshedding on a per driver basis.
>
> This is my point exactly. Each consumer is going to need to do its own
> thing and it is why I would prefer if the decision was not a core or
> a provider thing.
>
> A decision must be made somewhere. I don't really see where else it
> could be made than with the consumer. It is the only one which has
> any idea what it is trying acheive.

I agree, the consumer must make that choice. But I just wanted to warn
against the risk of endless discussions about what this tolerance should
be in each and every user. Myself, I didn't know what tolerance would be
fine for my own case. 1% seems ok, it leaves enough room for the CCF to
find a working set of dividers without risking a breaking choice, but
maybe some day someone will come with a panel that cannot be supported
with this limit, and maybe 1.5 or 2% would have been okay for
them. Since that's a very empirical limit, expect some back and forth on
those. "Back and forth" also means "more load on clk maintainers".

> If the range is about HW capability (from the clock side I mean),
> a range can be set from the provider. Some already do that and I
> think it is fine for that purpose. In the experiment I've provided,
> I did not enable the propagation logic in that case, on purpose.
> It could constrain the clock tree for clock that are actually
> unused. It still participate in the decision logic if a consumer
> enable it however.
>
>>
>>> What I'm suggesting is to treat any clock with a range as one that
>>> needs updating. Its consumer cared enough to tell us what it can and
>>> cannot cope with. That removes the need for a specific flag, and puts
>>> the rate policy in the consumer, which is where I'd prefer use case
>>> choices to live, rather than in the provider or the core. It would
>>> also fix clocks being dragged out of their range during an update.
>>> Presumably, a clock without a range does not care enough to give us a
>>> decider, so the framework has no basis to act on its behalf and keeps
>>> today's behavior. I think this behavior will keep on being good enough
>>> for the vast majority clocks out there and it is a lot lighter
>>> on the math side (which is already quite severe as it is)
>>
>> Well, yeah, I see we share conclusions :-)
>>
>>> I've been checking whether the idea is remotely feasible. It involves
>>> multiple planning stages and multiple tops. It is still very rough,
>>> but there is the beginning of something:
>>>
>>> https://github.com/jbrun3t/linux/commits/clk/clk-rate-range-update/
>>>
>>> Miquel, if you fancy trying it, please let me know whether it works
>>> for you. All you should need is to set a range on the clocks you care
>>> about.
>>
>> I managed to pull most of the clock patches in your branch and apply
>> them to my 7.2 branch (with a couple of tweaks). I then made the changes
>> to request a tolerance as you hinted (available below) in the two
>> relevant drivers: it worked as expected!
>>
>> While doing so, I realized the whole operation (set rate, set rate
>> range, get rate and verify) needs to be repeated almost identically in
>> every user of the "tolerance composition" logic, which probably
>> indicates that a core helper would be relevant instead. I had in mind
>> something like ~clk_set_rate_and_tolerance() which would do the
>> equivalent of my fsl_ldb_link_rate_set() and lcdif_pixel_rate_set()
>> helpers.
>
> Indeed, I suppose an helper could be introduced for that if we don't
> already have one. It does not even depend on the experiment presented
> here. As long as there is a user for it, it would be fine IMO.
>
> Maybe something that takes a rate and a ratio, like the duty cycle API
> ?

Definitely.

>>> Sorry for this rather long explanation.
>>>
>>> Brian, your series is what got this discussion going, I know a lot of
>>> efforts have gone into it already. I'd be glad to work on this together.
>>
>> In case that is relevant, here is below the code snippet which I used to
>> get my panels working after removing the assigned rates from the DTS on
>> i.MX8MP.

I'll let you two discuss about the direction you prefer taking. From my
point of view there are good and bad sides on both, but they also both
work in my case.

Let me know once settled and I will post an adapted patch series on top
of it to adopt the selected solution in the LDB and LCDIF cases (+ the
core helper discussed above, if relevant).

Thanks,
Miqu=C3=A8l
