Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487305;
	b=IsDNBSGjzokQfAN40OVb+AFlIZSkZQ3+XIpGRF/hBBhinrUvRocqtLtWMKjNAIRjmVzl
	 JUrHnPuOhjNH9YePIsVZNcsdhzxslt8Su72j3i7TO2hi0u7cXvSncRNDZFZDNh/ltjMWJ
	 wVsrGEAbrNZ8PDH+uug+6RbL4Pe5br63pxJSaS9m7MyxLqttpdZsKBfABHwcsn6GtSmK2
	 XEn6gzfEEYMpuQCzLfH+EtH1Cw78tO/K0HasVQg9WluMTyzO3339L2cUI3/bvDkg1goAu
	 4cJ48tbgb9++PMoJKzm/RUKi8li87VZTKF3VsgvO3jsQpsPPVTSr5By0FNVHTPexPGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487305;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ue66AYZqnnN5Po4mP1VXfKgtTf/rt3AX0hFV+/ABXdY=;
	b=F7Gec6GX926H6vufp4HKocGKD07U/YEj1nK2VCZKGwTL3o7fuqFPEpQqwbEbI8o8TIRL
	 Qb1Mq02KQYZZvJkXiv82nPeZCU5r/AkJ9piMRoDg5Su2MB71w81ni/nG8Rx5FBHXBemOC
	 QNk8N9ee3/WHJg5flxliCcdX7pHREH2iXavG293SSKQMywoWOXkmpeSNJ8swRoytdpukS
	 rrKj/3m3VZo4oeRYirTyHm7izic0DRxZrgjJaydaGMAIsdcV5XpqjnA7+NqkfZjCSrAjf
	 hS9Di2kS0beczoSr2CZcAmOM/pM6pKD//2967GY9E99wiDibz1B73hjxnp78kCsP6YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="m/vwQVGS";
	arc=none smtp.remote-ip=109.224.244.18
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5A3606A31E;
	Tue, 20 Oct 2026 09:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=m/vwQVGS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792487303; x=1792746503;
	bh=Ue66AYZqnnN5Po4mP1VXfKgtTf/rt3AX0hFV+/ABXdY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=m/vwQVGSTqkK20WARLHrqOK0a+OdFV2iRSncT3FNlMK7jTNC9uzfdsQIiEat4HsP/
	 DS3OvBGIoo/bt05r8aljXvjeGrnXPPPqSw4U71NaaBPRqvcV1ywXv5grCNKNLVGxpk
	 yGc1KyK72gAyIITFptYtzO5lZA3CrKb7ysCrd+Edo+pbViZdXFLuTDolLi5pnUJ9FO
	 qGXySObSNCqOxBYrODWwmT7eMxr8mkQJAcisA2C0sKAe6bohnzFLY5Y4Dh7vOGgJVr
	 ldZbjnq8DJALh2UO49GYZltltjD0nJ8lkpsktqbaoo20IRaQ317SSIIC+3PyJi6FWs
	 aWjXyB7bPwdFw==
Date: Tue, 20 Oct 2026 09:08:17 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: i2c: Add ST VD55G0 camera sensor
Message-ID: <20261020090810.78033-1-lsa.uz@pm.me>
In-Reply-To: <20261020-cute-peccary-of-attack-2376af@quoll>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-2-lsa.uz@pm.me> <20261020-cute-peccary-of-attack-2376af@quoll>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 35e71ddeebff9e99cd821125714fbc2d7e2cf39f
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

Hi Krzysztof,

On 20/10/2026 10:27, Krzysztof Kozlowski wrote:
>> The properties follow st,vd55g1.yaml nearly line for line. If a
>> compatible in that file is preferred, with an if/then for the
>> link-frequency minimum, I can fold it in there.
>
> https://lore.kernel.org/all/20260902204549.657228-3-pm@petermarshall.ca/

Thank you. I read it as: no new file, the compatible goes into
st,vd55g1.yaml. So in v2, 1/4 becomes one patch to st,vd55g1.yaml that:

- adds st,vd55g0 to the compatible enum;
- moves allOf below required, together with an if/then that sets the
  375 MHz link-frequency minimum for st,vd55g0, as in Peter's patches
  squashed per your review of his v2;
- says in the description that the VD55G0 array is 644x604 and that
  its I2C address comes from its NVM rather than being fixed at 0x10.

If you meant something else, please say so.

Sergey

