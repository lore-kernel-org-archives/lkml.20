Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.245.251.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794232697;
	b=1qwUnDqb8bPqBmrDYFGVknrs4lTAkLDnOGHbwZiZDV3JOJg1EHTC0N14DygM8WwmexDK
	 ZIAkR+qM0REhVNz1y9JkTLVC+4EqD/7nb6BAWZwziW3jAwIUB1arA9ImKIx0QJNwjnw1+
	 DkgOcwEyb0jEu1RutyU2OE0ADl1pJVpdR+2pqUzNzZtaheLADvyqx3sGIefsXyjsiUUxV
	 5m07YUju4J3YtgJMExabrKX+ePmH1rU27eBzJcCA7qlsQn6pstObfEff1hSzjvoUL7e2q
	 nuTLysJePXr5z3weCQ/ReUKmlCjPxgz7O5yT8UjqYZJqolvQUhtbroaH7vglO6VYJYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794232697;
	h=DMARC-Filter:Mime-Version:DKIM-Signature:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:From:To:References:
	 In-Reply-To;
	bh=U5ti8OSYeIjt1Uuf3l/kM87zGucl8LSPS7ufqkvvcMw=;
	b=VJvd/VVek6I648Z+uXzPY4OPZywRHomJU12IC0qRNJlOFLry7aDmmXSo611cZ/XIHhNM
	 X0YLANv8ZT+4UGpSyft8oIpFyOGbUBd0UEamgxU/zehRhCZ7Fd4CbxXoZQiXTC7ikM1hj
	 +ZKQMVxNUa8P1nxh6WHBHNhV19l0Y1WsTIuTvyg5Knff8SxtXUJaBGRCu6nrQDIOzpdUz
	 ku8cxtZ2ysVkbBH+4bGPwK1El2HojyV5eUSqWu7xV2/xHBGLG2TtiG93Ek9uBl08Qjigt
	 heHzNQxzX+X7mOzm76IpUz3HMp2vkojWlOr2GXLxnNE7ddXrz3hMHjZ48KQ1TRRTYKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fhannenheim.net;
	spf=pass smtp.mailfrom=fhannenheim.net;
	dkim=pass header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=3xoju7gf;
	arc=none smtp.remote-ip=188.245.251.181
Received: from mail.fhannenheim.net (mail.fhannenheim.net [188.245.251.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA5606A322;
	Mon,  9 Nov 2026 13:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ABA5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fhannenheim.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fhannenheim.net header.i=@fhannenheim.net header.a=rsa-sha256 header.s=mail header.b=3xoju7gf
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fhannenheim.net;
	s=mail; t=1794232690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U5ti8OSYeIjt1Uuf3l/kM87zGucl8LSPS7ufqkvvcMw=;
	b=3xoju7gflLEhLR18i4AuoA4Vm1b6p+o3t8Kzz74HK6Kwknnuwr3YUoKWXu3OgO1ZnFtWjU
	t+1K7bSO47LP4bZizVmXPl1uNR5JJNwpLPyzITCFvvZP0QXxNgz40X3vGA/S8hXZr7L0/d
	j2M3fV6WnFRXMTPypk30HE3n95xGg8U=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:58:09 +0100
Message-Id: <DMQQEMNZAC9R.2QNFULU5X2PAT@fhannenheim.net>
Subject: Re: [PATCH RESEND v4 1/3] dt-bindings: arm: qcom: Document OnePlus
 8T
Cc: "Robert Oscilowski" <drgitx@gmail.com>,
 =?utf-8?q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Frieder Hannenheim" <mail@fhannenheim.net>
To: "David Heidelberg" <david@ixit.cz>, "Frieder Hannenheim"
 <mail@fhannenheim.net>, "Frieder Hannenheim" <git@fhannenheim.net>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-1-c6bbe6ded92e@fhannenheim.net>
 <70454ca2-3540-4cff-a051-758625be3278@ixit.cz>
 <040883dd-47a2-4401-9eeb-45478cbd05a0@fhannenheim.net>
 <67c44ce0-8dcf-48f1-abf3-f1dd81175a2f@ixit.cz>
In-Reply-To: <67c44ce0-8dcf-48f1-abf3-f1dd81175a2f@ixit.cz>

On Sun Nov 8, 2026 at 10:03 PM CET, David Heidelberg wrote:
> On 08/11/2026 20:58, Frieder Hannenheim wrote:
>> On 08.11.26 21:52, David Heidelberg wrote:
>>> On 05/11/2026 20:20, Frieder Hannenheim wrote:
>>>> Add compatible for OnePlus 8T
>>>>
>>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>>> ---
>>>> =C2=A0 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>> =C2=A0 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/=20
>>>> Documentation/devicetree/bindings/arm/qcom.yaml
>>>> index 50cc18a6ec5e..c21ef16e9ac8 100644
>>>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>>>> @@ -1067,6 +1067,7 @@ properties:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - e=
num:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - oneplus,kebab
>>>
>>> How about oneplus,8t? We can use the non-so-much-confusing product name=
.
>>> Looking at existing device-trees it seems customary to use the code nam=
e=20
>> of the product for phones. Examples include:
>> - xiaomi,lavender
>> - google,sargo
>> - oneplus,cheeseburger
>
> Yup, we had discussion with Krzysztof [1], that it could make more sense =
made=20
> actual production name as a codename. My guess is Android codenames are u=
sed=20
> before the product is released and the marketing name isn't known. Since =
we know=20
> marketing names, which people use to identify the phones, we can use them=
 to=20
> make more clear which device is which.
>
> David
>
> [1] https://lore.kernel.org/all/0fd3e0a5-33f7-4bc6-9146-dcaf035c3ef5@kern=
el.org/

I think in the linked discussion it made sense to use the marketing name si=
nce
there where multiple devices with the same codename. This is not the case h=
ere
so I wouldn't stray from the precedent.

Frieder
