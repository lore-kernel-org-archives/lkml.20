Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581661;
	b=xwLWRjOCv6h5AblAk3Afrsn+fdnPJ+AMVJaDZDX6V0q0iCDS52i5mybk1FYfKMbYZvw2
	 Vqf/11fntRSQv0d/fj69wyYWggoOZxmooWSnxMHFbD36yv6yts5B0umIh6Nu8gc7WAYts
	 weNZZaRUE0LDxXzxpf8YrAL9yWxnSmC78YDbtb5Gp9kQJ7KBDi67d/0cG4rrwiWOlhad4
	 /lH6qttcHwuGGCqlvZm9ZfKnyHkqTivS8P4x/1oEiOTqJaZIQIzQmEZnlqAZSmiKxtckv
	 bCqzzCW74eGaXd74go47Uigu3ntJiV74TFyw11Cd8nY5lOJnt8t5sPrdM0f8P7sf5mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
	b=4qUg+eYpLWhqZ79SLlvAPcdA980rH08V1qNtQ3E6hG2j7aS2rjcQ/76J1OcPfb1CVz4s
	 oFdiU/jT8b1DvhmDA9teJSZ6D17iqQI8rLrOWJc3TatiFbt2sp17PtnPg3S58joHh8a7v
	 eoTtmCNHDojAyAHKkbnVCmb3jIgAeYyXcNCnUJrReQ+PzeFYo7hJeWi2uZaKnEDMtKXdy
	 6meuNzhIMbXW1lcN8Zi6w4RebKPIgRu/+W28YQLF5cVUTvXUBE7/BQtt782rHAvaBRnEE
	 z4HF2s50+JfS1DZajGJMajD6+nwdjjxbo+QvEa9FwAiIYPul1rT+8g6Ohe1jcW3hQtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=DtUb2MSs;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E4606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5E4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=DtUb2MSs
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d58c50743so191520166b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794581659; x=1795186459; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
        b=DtUb2MSsTrLlshbb82Qrnc7nt2mk7Di/3LVlJvL+a+hyBCjKmoyE0a3v6Lz0I7liwB
         R3K2EeLS5F7QYb0Nz5bXmUSDqnPOI1WSnzrKMViW88wuGkzfF+xl/UBdQXCablxE4Wan
         Y3ZhfYDrLnPIDnTZ7hSk62AG5/+tmmjCTrQFKjC/EOCY09k/1bY0RZnFNcq+zsKk4XZi
         eIs87xMiMyXOwCK1T7zuhkfN6s6nb5Gd7Y00aJuq+UExYKM3NuGb6dAtWan9VpQjLkPz
         jwX9oVYTvUmuB9MY+5dXaTOTRWj676J+TyeoH7V3rmUu/c1SJkaK3aSRaOy6OP/HP4CT
         HdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581659; x=1795186459;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfMyyD6XfhgAeue3zFE3sM8+ryuauYFxxOAZ8sEwYNc=;
        b=uNQ0UDIArM7ly5RkuOH9e16+WoM2n7S8YXwcWIlfXXR1Sc8WKJ5IPWAAkxMYtNCeUo
         4qbcc38cmlU2XpEx0QeYt/I77oq2mCvJB/wKtRXKtIJ/TUQadj8ttb2dg/8OMdgkjdsU
         Aj+N/AuKY4x+7kZ7eAqcx3JoMO66HtYfvCGCbJxAIY0M6isT/OZYnv5tGWXm6u6W4ZDn
         iUsHlvYQOJMPng40Tik/CeJBTh75uaiS37MleCROXK5pAzQ+LiXF/RY97UEFgQJL2XNX
         IWc+LzwITxiwnfv5bRSmAwinbXw7LhYsHtdouxtLiWNzEbUAETKtNm1+TBUx+OCc37fe
         AaVQ==
X-Forwarded-Encrypted: i=1; AL+hErHhvvcQmoZEpEHViVoCDdzXyTPRPjEXm/G2VTL5f+++3ahaTEWz/jhD9epuIJDYiffQMQdJuKBmc2Bir2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1UlQ/FB52EeVgKCQ0KNg8z1T718vNEvZoR/f01uCgRLKOvYsX
	fUXv6pq66m7YgSNV0Ba9Z7AvZEB5rBeT2A1O+Qf6r3+0A5NnUHQGT7J7qMUv6vS6ni0=
X-Gm-Gg: AYBFou1DzrU7kBecc3A0DCgK5vNYPGLVIBmIPGIgdU+LSEW7j9H9VIHMVuUrOlYNUdt
	apRXrggnDjP+Gjg08ZDXgq2vWCYJ5TNIyFqFQIJbuQ6Qbdiim42orF/ldY9Iw6pUHxc+JsAMjGR
	/4iACHlLF0WrnvS2FX5SZjP9FGxQlk7SqQm46KZ5AlcxcmDQunrSJ1UrrsRJ9Mf2zv7G98W+051
	duGda/sdJ28GPnqwKWA9tJMEuTuXhLbAHxzsQDkPhHPZOYQOPGtrBBSz/7i1Oxcy+YcJ5qrSt3B
	BX6hY17vT08jtJgNZ1ZPctFU26mJI9WSrN5ZgQrLcsbP+oI3YbrfIl7qgkP6KR7TRws05d/j0W4
	qGje6RGyMEpiW64gcgxGL7qZ5KfvRj5dM2zrBvvoHEoRGDCJ0kKNFSc6GdJPywZVkddkPkTmMjR
	+pgTdwDGzwUMHxYh77ZOE0/zO4oCLyLT4T6r+8thOfuo8+p11+bp5oNI5hP+75QG79C3nkQTXYA
	La8PQvXN1C4LhiQL2lwZMUDvIUjWki1b5jPL7op4G4NFg7YjwJtl3H5zAzVZTDzPyDRD+2Z35LN
	24gvM530Whkaow8LdUFZpX/N5DfMcpfR15IZLtsAIBMo6LnLn2LRELGpALbf33eOcKZkYE3xPFY
	=
X-Received: by 2002:a17:907:a089:b0:c46:9876:e9b1 with SMTP id a640c23a62f3a-c509664a09fmr236807866b.43.1794581658937;
        Fri, 13 Nov 2026 06:54:18 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c78asm112075866b.10.2026.11.13.06.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 06:54:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 15:54:18 +0100
Message-Id: <DMU63SK443BB.1CQ2KXXP5PNW4@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
 <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
 <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>
 <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>
In-Reply-To: <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>

Hi all,

On Fri Sep 18, 2026 at 4:43 PM CEST, Luca Weiss wrote:
> Hi Konrad,
>
> On Mon Jun 22, 2026 at 10:23 AM CEST, Luca Weiss wrote:
>> On Wed Jun 17, 2026 at 12:05 PM CEST, Konrad Dybcio wrote:
>>> On 5/22/26 4:46 PM, Luca Weiss wrote:
>>>> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
>>>> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
>>>> and power-domains for the LPASS RX/TX/WSA/VA macros.
>>>>=20
>>>> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
>>>> equivalents in its place. The qcs6490-audioreach.dtsi file can also dr=
op
>>>> deletion of power-domains properties then.
>>>>=20
>>>> This follows previous commits moving Chrome-specific configuration to
>>>> the correct file, leaving kodiak.dtsi for Elite and
>>>> qcs6490-audioreach.dtsi for AudioReach.
>>>>=20
>>>> No functional change intended. The clock-output-names property will no=
w
>>>> exist for both Chrome and AudioReach devices but this shouldn't have a=
ny
>>>> relevant effect. And WSA macro clocks weren't added to Chrome because =
I
>>>> don't believe this would've ever worked given it already referenced
>>>> q6afecc and the nodes were originally added during AudioReach bringup.
>>>
>>> I think it's better to keep them, if only to make sure that the result
>>> of dtx_diff isn't outside the expectation of a commit that claims to
>>> only reshuffle data for these platforms
>>
>> I documented this in the commit message for this purpose.
>>
>> But I'd argue not putting (likely incorrect) wsa_macro overrides there
>> is the better thing to do. Probably somebody should've taken care of the
>> Chrome platforms when adding the wsa nodes in the first place.
>
> Is that okay, or do you want me to change this? I'm still of the opinion
> that adding a very-likely-broken WSA macro to chrome is not great.
>
> Anything else to note? R-b would be nice :)

Any further comment or review? I can also resend if that's helpful.

Regards
Luca

>
> Regards
> Luca
>
>>
>>>
>>> It looks OK as-is for Elite and Audioreach platforms (for the record, I
>>> checked rb3gen2 and FP5)
>>
>> Thanks!
>>
>> Regards
>> Luca


