Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648681;
	b=QT2mSuXxJv3PkykM2ew3JGfYlQgEZ5FVj+LdXXnxSAyIA4qkYvByD7qzanf6d4uWK+TG
	 Mr9qtJgZNV1CqkFN68pmx5l/2SnqEmDyn/+Bf4Z+UZ8+W5kb9D1ptX82aLkxtstQ1h2b3
	 Ff154sDyFMQqmFXlZtPNFYuSPYTQiWm730P76arC91Di+2O8h5bddTJdrJeCfNZ5HSrPx
	 TjUxSjyftr2tML1YVN1HPmDCv+GNbKcGjDCXucOK6FZpxo9noNtPO1YaGrD1HW2tjQMwD
	 W6YynnGvq5m/HBKt7oIyvqDAalVEP9niDfScu32wUkh7UMsH9xrFtxREi/nzp2B8OaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=;
	b=OUGjL6yPgZUrWIXQh3aaeDWzYqhtTzSfnnhaXldXwNajW9/rMYLzouJwhmWiztBQwTjE
	 YJleFnGHx8xC3lBhTc4y5l6w46ZHqm686I1dXCJiEiPAFQlpXDf7o25Y82WubhJNcViCG
	 T7LBhCQtYfT3rfZ0Oui8m5OEC2UwfkjA2yYu6G2oWbIBTX4mTXQCcGczDuH5XkR8pNbHF
	 mkGjcMUzTR3z2qFULirf1BuC+jnaQQdryO0DuCuqMvwmAqpohr2I4hu58HF1LZkdCjX2/
	 XR2Ds8iAOcjd9UjhPRsWyFzis4QtyyFBH98k8kTqdZSq+2RzIlzQFOqPN7Q57+LzeKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v2zabGsB;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1BD606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=v2zabGsB
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2926435f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793648680; x=1794253480; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=;
        b=v2zabGsBMccgcYnOKyyoJfrpcS6FC2kf1CeYjOep7ud5b84amOVeXc4O9Bn7QHljxM
         kleSVMzmTjk8J7500JVzYCCNljyqjHHUgpYpYmKtuYqxR+860A49+oGL6efFuH9uJKH1
         o9WuQnPigNB98hrxPxhmFhmrpcNTrCxsVh1HPM0+aBBM7CmTzECx01VZlas2N3sB+xpw
         zevN2gyXBQ+fCAZi91gsLVJTORdB0l3CzBB2NdQQ+kiJy6PW+JWVNwpb7SMh0QACuPNL
         7Wc16yRYdIpVtUDoiOkiPrknjvJYA8VEUTpxyooGhTNXENUS3pjVefS32oOjaz8C0bfv
         g86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648680; x=1794253480;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Weu5Zca/hPX7MdlI7TVErZ4xT18FxVN+YlEWkEZPcA8=;
        b=AwA/HJosXb4/eOI1+bpptbPhlfLIKfFsSgMP3OfbXxntWN6o4hk6CE8YO3x6M5jqPk
         aegS5B1V8yaPaR6U4EyKqWCRxFYJTioE1uAfpUupsHehW6JvUHihRwNf0l/C7RYdhDem
         f7x1me1/YOiJZPVyX04xQCxKImYUKmml8/V159KTKjyL/9gA4OCD2aDUUqHKQiPxyOU3
         oNCR14RhXGEPJ0u18ouo1aZMeQJ0Mra8J3qcAuiA+dK4CIizZVTLj1OF51Snfdci05GN
         n3L7dxyTa7o+m5JKDhLnwMZsEkdMSDK3tZQsYUVJKm9daNHwq2Oxc6qs4te9ZQ1CGChD
         Nc5w==
X-Forwarded-Encrypted: i=1; AKwUvBwbRME3gNBRu43BTFOXFk0myOlpc95+lreMFetsvMwhtOIsIaP8AmWECTv7OWAp6tCPpumxb24Vo76SrOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xMT2wOzEsdfrw8o+CihvvQUrn3nDBHr4k/toyBSEKKYQvvVtU
	a7l70ju+F0QyGyfaNLbdTX1DvMFWQbWgaMHgvlI4ZAnDtpAjIjO91szfWSREtFaKSnI=
X-Gm-Gg: AYBFou32LxkjIIpGx6GT3FgNubh/SHLD56Cg4JuGyt4rduKBIMM/awuNCQrQrNThtXv
	tYHFssA4ddaO8phn4rrBP7KWMXlTjixy/Qj+zS6rCZBpywX7pjfkpyIFBOPreNNdjIxylDPS2Ct
	2kLkAVD3AWZbLm4J3Sm6RKCnzcQdtFnxTk/O0DonwqwLTs5OEqrFOxbCwxBMy778s6DIE4Wm0nZ
	UHGN3Iw7mkD7Vka5h9PFQKJDEX3aU2c9N2iumlZaZeH6YJ924dD9dSi5ZjGLYrSbM9rWgEYzgQB
	WD+8J4CTfDDYSgi+k87EhHmWBXQLQ6f+/v4snZFpVhYPIm52f2z1xXxKbC4OJpgQzlVexRfzNsP
	uyX3MNXtqxis1zt6Oub+gmaKhLJE0mHSIo8MsiKdMqpH0a5FG8J9dnR/G4daDU8P3OArT0VPy71
	AWC6V97RwSk2v4MzzL5+uS2hlqDHRS2oHKYaFXJYwmjYtAtE4x4KvDPgfS8cPQ8eSFiYWnDaHij
	aVkZj2eoHVpzR4jE09q2lUOhpvAQFMEntCDEFCVx/jTTG0aZVLT6+CWHT6fgwqHnnzGtVaKqAbd
	rtcp8M5JNwlVDi0YVJ5L9TAsKD3RIgqzqj9kLbmdvDKYW0V8yEu66IH9wYS55iVrKRw4Pegg7wJ
	4WaUvWx1t37nAAQeSkf3BCCrysXI+2zunIcpsBFj7VA==
X-Received: by 2002:a05:6000:2611:b0:48e:4e00:b72f with SMTP id ffacd0b85a97d-48e6e50c8ecmr23807080f8f.32.1793648679554;
        Mon, 02 Nov 2026 11:44:39 -0800 (PST)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80333sm23147608f8f.32.2026.11.02.11.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 11:44:39 -0800 (PST)
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
Date: Mon, 02 Nov 2026 20:44:38 +0100
Message-Id: <DMKZE3GQVDLB.18QYA9ULAH75I@linaro.org>
Cc: "Aaro Koskinen" <aaro.koskinen@iki.fi>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Christopher Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Russell
 King" <linux@armlinux.org.uk>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 5/9] ARM: dts: omap: dm816x: Correct speed for
 sysclk5
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-dts-v2-0-4544429251e2@linaro.org>
 <20261028-patch-ektor5-dm8168-dts-v2-5-4544429251e2@linaro.org>
 <20261101222942.1a78c6fb@kemnade.info>
In-Reply-To: <20261101222942.1a78c6fb@kemnade.info>

Hi Andreas,

On Sun Nov 1, 2026 at 10:29 PM CET, Andreas Kemnade wrote:
> On Wed, 28 Oct 2026 17:06:06 +0100
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
>
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>=20
>> The default code for setting up the clocks results in sysclk5 running at
>> 1.6GHz whereas it is expected to run at half that ie 813MHz. Force the
>> divider to be /2 to achieve the 813MHz speed.
>>=20
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi b/arch/arm/boo=
t/dts/ti/omap/dm816x-clocks.dtsi
>> index 76ebc6c3c3e5..cb990773b098 100644
>> --- a/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi
>> @@ -144,7 +144,7 @@ sysclk5_ck: sysclk5_ck@310 {
>>  		#clock-cells =3D <0>;
>>  		compatible =3D "ti,divider-clock";
>>  		clocks =3D <&sysclk4_ck>;
>> -		ti,max-div =3D <1>;
>> +		ti,dividers =3D <2>;
>
> so this changes register value  0 is intepreted as divider 1
> to divider 2. Sounds strange. It just changes the interpretation of the
> register values, not the setting. Maybe checkout the register value from
> user space with tools like devmem. The original interpretation was right.
> So this change does not make any sense. I think sysclk5 still runs at
> 1.6Ghz, but it is displayed as 813Mhz.
>
> I would expect some assigned-clocks / assigned-clock-rates pair somewhere
> in this patch instead.
>

We tested on EVM with devmem and this patch correctly sets bit 0 to 1
(which is /2 in the manual).

However, should ti,max-div in this case be <2> (and all the other clocks
that supports two dividers)?=20

I tested to set `ti,max-div =3D <2>;` and it seems to correctly set the /2
divider as well, but without specifying any assigned-clock{s,-rates}, so
I'm missing the rationale of how the divider is selected.

I'll drop this patch from the series for now, I think it needs more
investigation to figure out why it behaves like this.

Thanks,
Ettore
