Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365283;
	b=NoTYsbgtoSAI6mLEJ1b3sYdEQ92X02zAGmnj9Duc6AF6MZ5MYdF38jLkVa8q1g/tRgf0
	 96f/tM4AfQHWHMM+A7GigufAx+vDmx88Jzi9MKEAYpg38ufiyFTgcF5V6dVOm3ynY2wlM
	 cWpJJFru6iIL4MI/R/ojKjjxvG39aXJhyk6HSOvLwzKTephFHcsBkkhBuw0hjFt4qbOOO
	 DAWB7Js/D6DZrzy5LNsw1o//6iicTVh2AEhNfhVtQ+2gGTytT8sCwwmzwAquLdyaPs8u1
	 Zj7ZBFgTIDHOua/Z1jailQmWhR8tkUwXnz6WRLpaKmIHFBX6SWVbrjoRRaYgkpgwKqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=;
	b=Fx5hg2UrvInMmk2QD+pjfZHJ/AfrLB0pE/nRVZENtj/a1gaA+YRCmkW6qvprgB4aGiaS
	 vXBep3Y8pc7WVXr084oohJpgW9luqtt+GOkVf5NWTeqS6B5M5QNp8itwe9dIKMsVG4ctP
	 B7Vfg2aJ7xI4dWKfjfHJB6Ka/JnWX6UQ2NUgig22QAT6425alLcbueRryk95rEbjiCaPq
	 Q+NpnqTUAIZdU/V1IRoYFQc+Q7QVqtlPN6Bt0I4liLw7fMHPNhEwZ+0JJ7DqLvecEqJ4+
	 qMNsbfH5KEsYYO5hYIOX5pgYbujRKTLkq0WQQJNZsFy1v5TynjYsAWU6ec0KvlbJZuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CzPoybpK;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36C2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A36C2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CzPoybpK
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso18686915e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794365281; x=1794970081; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=;
        b=CzPoybpKzKt8cx3ZkmD6WjMp5be0568OQsLnW8sqGhZxRa07MHaqv+2UE8a2ARmtSW
         hcG7SaNbTDWpqdm0MsDGPrGAWvPvrCIn/jMzw6sjkt/phxJNyZpxKfWOqZVtejHys7lo
         RZKReJqr4zRap3IynG8QVlOoF2Q3TTvzM2Rtb8TDoY/KSmCAYdgbuBP7Ba8KomvxUsfD
         BQiKkEprv9tKqOGAuv00u5Ey+g9/3O2mvg3e5gH20xOBZU13jB+eT3b/aFobjQ7Qqi2V
         7j0KsMheWKHWtF2PJTu4t8WN6mn5b0NHWotLebphhwU1viPiqBbVTY8vBSQIlzfpEzQQ
         6Sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365281; x=1794970081;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=;
        b=rzLmWaT8Xe0l03ax0+MUFLekADA1jF6kEnZnlAoJu+HSeAvUqe8knJ760ddgvNMllt
         wFDnnYO8FT4j+QKgf2QthVSFFvp/ONXbcKbxCyNF+jTiabzdUv+bdFgTP5Y/GEpIVczE
         V2iF6VNO6/3I0tVvOMMQlJ2mfiyJ/8fDkbJr2AbfDPkc5EfFnOTR7v1aSZ7usSY3X8GH
         dWU9GSaX7qy0Fu2k+f/Z6e2i8ZW0TbTxjdcsy9UuTokKYeXp3uhgZnfwjSsklkJ6CocG
         yidIj0osI4Ma/4cJPc5gR81C8/JtxY9EwdSSY7V09KqL5uuB8PAy4tuVlf/pG4YJKfQ9
         z4NQ==
X-Forwarded-Encrypted: i=1; AL+hErF5vIaIrsfHODBtfhaZ6D9clRKlqFSHJh6iv8tzqzOp1GgJ12Q/CEDtH+bvbvwzAFua9ThiioNnVYPvB7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z80jQfLkyh3Bc2rQCN74S6c3naa4xOE5tiX671Polpbh7PlRoNw
	m88/5rFGZoVEeNarbjvRNlp2S2zkCfMiWoeh16IaVS1bvcO9gXXfI2m781inSmAjdMQ=
X-Gm-Gg: AYBFou1jsVYkEOK78Jpm26lZQ1tty1TIKP1J0IipxBa1hI3B69mn9ERC7CtP1Ru8UEg
	ZqolknliQuRUQH6Xw5O+J8Yez8qdmNqHL2zbGYmGV2RDx6xmcxlKIfNlhEGUQoTBYuktoKpKDJo
	PSq1GoXqssp91S5Qwbe5aLBVUQlsmCE38+Rbdv7HpfVykQFzjeUD4KLUgpBdOJgWyGGmA+e3Dtd
	N/O/Y12i22EI2BkJmyRu/I5/DNRdJhVmOnxYdWAzHsMMMRNojtRIIqs4ZqYDPeVEzauXOjwc/Sl
	llAJQGjWbtkmYd/E6HGy3pcpF27EkqVs/PRv1WKnhl5gpIa+kl/nJCLOqbzEce+jw0opuGt9QU7
	ahrKgqsOc1r/Nf0HkliKSbXeC3ZxXk1z+8fuEbvJMTFLh6OwFYBry6oofEBphrok9viQahHuPWT
	BhPfLfGOVQx1w8TenaX+tjVVmP3VqrPK0c5cR7y8uVRQGO95kESVe3iUo6yAUTnwMiDNUjwAgFk
	owGaYOwtRrNWpUeYbhAE3R4tLUvn9Mzd4g/BCXblTYGqr6KLt917Fv04NIAmOLZYkGsqlcKnELa
	uL95PeHxtdJOruq5y2cx2JY9UMzjkRwrWPM37N2mSbrXIsHjXvWyesiBxFkM2qUqOjL8nlM1A6Y
	/dnCpx0KyOY8pow==
X-Received: by 2002:a05:600c:1389:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ba09388518mr13400485e9.24.1794365280959;
        Tue, 10 Nov 2026 18:48:00 -0800 (PST)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe64bcsm99261205e9.8.2026.11.10.18.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:48:00 -0800 (PST)
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
Date: Wed, 11 Nov 2026 02:47:59 +0000
Message-Id: <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
Cc: "Thomas Turner" <tturner@lineageos.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Juan Yescas" <jyescas@google.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org> <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org>
In-Reply-To: <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org>


On Thu Oct 1, 2026 at 2:27 PM BST, Tudor Ambarus wrote:
>
> On 9/30/26 2:54 PM, Alexey Klimov wrote:
>> Hi Tudor,
>>=20
>> On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
>>> Hi, Alexey,
>>> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>>>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmwar=
e
>>>> protocol provides interface for all client drivers to actually use
>>>> features exposed by the APM co-processor.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/bo=
ot/dts/exynos/exynos850.dtsi
>>>> index 8a4771899a8e..91c6cee8f483 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -11,6 +11,7 @@
>>>>   */
>>>> =20
>>>>  #include <dt-bindings/clock/exynos850.h>
>>>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>>> =20
>>>> @@ -170,6 +171,18 @@ timer: timer {
>>>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>>>  	};
>>>> =20
>>>> +	firmware {
>>>> +		acpm_ipc: power-management {
>>>> +			compatible =3D "samsung,exynos850-acpm-ipc";
>>>> +			mboxes =3D <&ap2apm_mailbox>;
>>>> +			shmem =3D <&apm_sram>;
>>>> +			clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>>>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>>>
>>> Why do you describe these clocks?
>>=20
>>>> +			clock-names =3D "cpucl0", "cpucl1";
>>=20
>> To link these clocks with ACPM clocks from this list:
>> (file drivers/clk/samsung/clk-acpm.c)
>>=20
>> static const struct acpm_clk_variant exynos850_acpm_clks[] =3D {
>> 	ACPM_CLK("mif"),
>> 	ACPM_CLK("int"),
>> 	ACPM_CLK("cpucl0"),
>> 	ACPM_CLK("cpucl1"),
>> 	ACPM_CLK("g3d"),
>> 	ACPM_CLK("aud"),
>> 	ACPM_CLK("cam"),
>> 	ACPM_CLK("disp"),
>> 	ACPM_CLK("cp"),
>> };
>>=20
>> Eventually to have some sensible/working ->recalc_rate() for ACPM
>> cpucl{0,1} clocks.
>>=20
>> Which is needed, for instance, for cpufreq_dt because it registers with:
>>=20
>> static struct cpufreq_driver dt_cpufreq_driver =3D {
>>         .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>>                  CPUFREQ_IS_COOLING_DEV,
>>=20
>> Don't know if it answers the question (if I understood it correctly)?
>>=20
>
> Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
> parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
> ->recalc_rate(). Could you please clarify a few things in the commit
> message (and below):

Thanks for the good questions. You hit the exact pain points we have been
debugging on hardware with cpufreq-dt and Panfrost devfreq.

> 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
>    APM hardware, they are the PLLs that ACPM reconfigures behind the
>    scenes. Meanwhile, acpm_clk_register() sets num_parents =3D 1 and
>    pdata.fw_name =3D name for all 9 clocks in exynos850_acpm_clks[].
>    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
>    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
>    orphaned in CCF with rate =3D 0?

Correct. Is it a problem now since there are no "clients" or consumers or
users of these clocks?

Or do you suggest to link them all to parents clocks to have a sensible
rate?

> 2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
>    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
>    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
>    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
>    __clk_recalc_rates() only reads the cached core->parent->rate without
>    calling ->recalc_rate() on the parent itself. Won't parent_rate remain
>    stuck at the initial boot frequency?

This was already asked and seems there are no answers. The problem with
stale rate is present.
https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@linaro=
.org/

Any suggestions? It does seem to be a real problem since we discussed this
again off the list and cpufreq may stuck because of this.

We can cache the ACPM clock set_rate if the call succeeded for instance
(option 2 in the URL above).
I have such patch somewhere locally and Thomas also cooked a version
with caching. Will it be an acceptable approach?

The other thing is that we may need an initial rate set if reading of
a rate happens before first ACPM set rate call.
Is it fine to return parent's clock rate in such case? For this approach
we actually need linking to parent clocks.
Or should we hardcode some boot values in the driver for instance?
We can also potentially hardcode PLL clocks to get one-time boot
(initial values) for ACPM clocks and avoid using parent's clocks
toplogy.


> 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
>    cpucl1_cmu_info still set `.manual_plls =3D true`.
>    Does that conflict with ACPM firmware managing the CPU PLLs?

I don't know yet what to do with that. I didn't encounter any problems
yet because of this. Is it related to early initialisation only?
I thought that exynos CMU driver doesn't touch PLL clocks after init.

Thanks,
Alexey


