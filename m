Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.236
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794322286;
	b=BEJQ+6ZHtRXjxs+OXBpzvay+FGRqcmQZ0hG7RfLq4uuXdR1W6UFLGLu3CRXN6VnBqYX1
	 loYfMfCEGFs0M1lzDoL/1TrT7fUHIZ+BeewIE8rP1btEJGeQa0aI8k8ezw6UteZcYWCoV
	 Dkz5AYifOn6uGuHZwvI5EC3+AkVW7SG1fvY08uNUW3RHdfPO/YxvV0UCxt0lp0yA/HSKq
	 x+GFZqg2ZBnNoaXJlv2phqMTsCRQE9uh8m7cw0hxb2G3Rdp3uLV7NaH8jpGzceQt7UG2u
	 Dxj3h6lxaqWAPCTBXz6xDkkJuvs5GHPA+tJLtivoy3nM0axfhYzUcF8ex/h9R55R32g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794322286;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Message-ID:In-Reply-To:
	 References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Correlation-ID;
	bh=Z2QrvPckdTqXqF6b/Y1BwCWMJS5W366ELwtDeHCqB1w=;
	b=cwtA451UGXOJPelebtHlgNmWOBOruNyQisSRXld7aVrsAsrTzskp7eSftoxc3mbSI09r
	 qFPTFRrhdvsUMuUTv+gSAeVGSefrCm3F/nW/9LOLhDKwEVqfa75VL9JE2SrpAX/q6T1LN
	 kq2s5mZew+d+2LLEUuFXa+Ax08VlaLpaYup/Yt9RptcAQgHO0vR5XfP05skFrj6jC+ELd
	 cxu1M2SucXJVlMAPMSjjgRRgOehy1q3QWAMbTZuF+kjXlgtld+Thay2tDcc2y3t7Mi8JN
	 UcVYJznTFEYhWbL1kNrSCjJS7Q6vGz1Qt4zChfVQN0Qq5BYE5v9Y6UysUTqPbQRGqdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GGgr+l6Z;
	arc=none smtp.remote-ip=95.215.58.236
Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDA5606A333
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDA5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GGgr+l6Z
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Z2QrvPckdTqXqF6b/Y1BwCWMJS5W366ELwtDeHCqB1w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794322276; v=1; x=1794927076;
 b=GGgr+l6ZErWOktyZEDOq5o5KKIK9zJkoRpK/VQFQwJcFHmE9WDxd2uwdt1UlHF22Fa015JUo
 j4DVwZQEhKT9dk7WKxtfae4i9tpFdHy+NPwlaY9LoZKftUkARkFTV8ZXh0ZmOxfcQZVkZZXl/T2
 vE/0YduPof98VboLSjyIhpTA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bfcc651048cbffce;
	Tue, 10 Nov 2026 14:51:16 +0000
X-Mizu-Trace-ID: bfcc651048cbffce
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 15:51:02 +0100
From: Denis Benato <denis.benato@linux.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Chipang Kao <prozac2734@gmail.com>, W_Armin@gmx.de, chipang_kao@asus.com,
	corentin.chary@gmail.com, hansg@kernel.org,
	linux-kernel@vger.kernel.org, luke@ljones.dev,
	platform-driver-x86@vger.kernel.org, scardracs@disroot.org
Message-ID: <e91e759b-d9ff-403c-a968-6fd19ca8707d@linux.dev>
In-Reply-To: <179432207917.2180.5316107179972885113.b4-ty@b4>
References: <20261110065630.270276-1-chipang_kao@asus.com> <179432207917.2180.5316107179972885113.b4-ty@b4>
Subject: Re: [PATCH v6] platform/asus: Move ASUS platform drivers out of
 drivers/platform/x86
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
X-Correlation-ID: <e91e759b-d9ff-403c-a968-6fd19ca8707d@linux.dev>

10 nov 2026 15:48:16 Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>:

> On Tue, 10 Nov 2026 14:56:28 +0800, Chipang Kao wrote:
>
>> ASUS WMI and related platform drivers currently reside under
>> drivers/platform/x86/. However, with the emergence of ARM64 devices
>> utilizing ACPI WMI interfaces, maintaining these drivers exclusively
>> under x86 creates unnecessary architectural restrictions and Kconfig
>> duplications.
>>
>> To allow non-x86 architectures (such as ARM64) to select and build
>> the applicable ASUS platform drivers:
>> 1. Relocate all ASUS platform drivers and headers from
>> =C2=A0=C2=A0 drivers/platform/x86/ to drivers/platform/asus/.
>> 2. Create dedicated Kconfig and Makefile under drivers/platform/asus/.
>> 3. Update drivers/platform/x86/Kconfig to remove duplicated entries.
>>
>> [...]
>
> Thank you for your contribution, it has been applied to my local
> review-ilpo-next branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> local branch there, which might take a while.
>
> FYI [if applicable to your patch], as per Linus' policy change, also
> fixes are mostly routed through for-next unless the fix is for a
> commit introduced in the most recent cycle or is clearly a regression
> fix.
>

Hi Ilpo,

v5 was resent without my reviewed-by, can you please add it back? Thank you=
.


> The list of commits applied:
> [1/1] platform/asus: Move ASUS platform drivers out of drivers/platform/x=
86
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: 6e3b727ff3115a4f870bdcfafc3f6827c2=
d36676
>
> --
> i.

