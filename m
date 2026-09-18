Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE544EDCCC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789740424; cv=none; b=oTuqYhAXuEhLnyeRAqD0ztTQWKFMIOWwXCRCVr8Sg+4LhDW9xCYgeyu1uALJ57JSrrVjLF38Olp2xvE/lN7GuIUzwIy8S2f1Sy3osm7/VniRHNgzqYikKoS4AMVoVMfq5DlF8BcyOOnCz2S0o8JKOcHWi17XwWD2+7x9irlMH0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789740424; c=relaxed/simple;
	bh=rd7gj1zXN/3rpk3xfVsvYTIz6ugycXx27jtR2oCkAMU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h/NoscyxPFxAvvT54OWfKZ+eW7rTtbJkmWDf1RLWp027CHSwnV/DkHr73VcYOopkrZmOUFzxFuwabdxxrfFmKLK5DV3kjQKdyqb9M6CayC/88Vj5Q7/jQwqJRQ/hmw2PKmbuM6Yr96H0ji3Hv+PLq3qa6sSsqrxRp+AVekHWdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ZwhAmNZd; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ZwhAmNZd"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a6063d7dc4so967603a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789740419; x=1790345219; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+yltdctt5ruCa6iMGQXqYgwXkTVwncfcwBwCdKyoY4=;
        b=ZwhAmNZdU3JQaD52s3Oe2rKHYClHHOMX1Qsfqa6pEy5GG1PPWQDEsvSRggOnuCztPz
         Lr1ZdytPUUoJKNGttvUEHltPveZOZHLkozBDba08tQSd221XfwqkCEH7Et89yRfuKuSM
         3KAALHcLIE1tPSdUXzCRmHTdsY/F8K0k2q84DKF+UOei/D3nQdlzmZd4sF0QETVkeZy/
         nJMFu9onZviL8CCUu2jkXmveWYpGrOLcNGd7jHqUGHtas8IWltKJn9ka7FFOtSm4eqIV
         WQslVcZF4xm5ztDzHLze1n240fIHtuAAoET4yWKTE0f4Agr3b4m4VlUrbkaqTeAqzLZx
         hXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789740419; x=1790345219;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+yltdctt5ruCa6iMGQXqYgwXkTVwncfcwBwCdKyoY4=;
        b=VOrDZStukmeFcb5tTEDMvIwKshw2lxsyItS3i5Qui3y+l0szb53BfxwpUaOyXIzgzS
         Oi3aQL6+lmDVVQ0FXDsbjczTrhHo+MXZzHF0Y96npcrZh/+gaRMDGxXarQk39igf1HC7
         mKnPB4u67nSRd9dzyHnrauQP60Wa6mhZUQE8Xhet2XdtlAnjbVCT+paSt4txdbVCm8DE
         uyaDnlZdq4T/3AfLlybumpEHcpeKmTaLj6iFHvOmYFUkOT/9xzQON5BliOjB08kiRiEU
         fAGUiLJIui9x7X7/e40j/x36zKjJwxu7sGVaCiMRcOAUGIZWXrLxIrC6PpoPg8hm+mDg
         0v1g==
X-Forwarded-Encrypted: i=1; AKwUvBwO6hil2yzcFr01tTAqmekq+n1c5skbDu5VfeuSW85DDWmnxhaliNq4uimhVYDeNQNLGkpVSSgLVkBtRfY=@vger.kernel.org
X-Gm-Message-State: AFuF++kd+s+/sK+zYehAhzjqBWVfv51iQEWckelftWuusaFZUrUGtT31
	D2LyVGmT8K68KsI7yeiPVk3A5o9+qGSXWCReW9sIdEPsA5aTTJYZwqQhb2cjKPCgTWQQLgiTZtM
	gFela
X-Gm-Gg: AYBFou05pROHbii6ETmHNsxA9G3BNAuO5eA1B7UMKghRogW8qxrg1DMZF3IW6Y5ZUfu
	lAmAiSL51gvYqRVo+6Ox7cAfOT/KlyCMnoMy8q9EG3RVEXw/SUSZN6ktLmkoWFcULFq/Da8wRYP
	yhJvyn/86mLsukdvHoxGWUeH9v+MxtECXdjrr13zGvTK6G7cm7P87QE5VPR3Y0ZsOwJDg5vkG3I
	T7BGFQD1hX6mZruq6vRcu3Y/nvEkasfMeu6N8UywDcEqTj3mOSoUU07rgnCMXCLX1BJCc4IdM7K
	J6NZrKQWBwvrqiILvio21QfkMWT74/iuS32xfWGvLB1virqBtZ90vvlOLYNBMA7tXIKHW7Ojfx6
	i2hg+QWjrN/L01yNKIXE+DttRgKWPOB29KgI4GGZ1LjhqT815wlB1zTsCKsa+nrkBbaTLkhD+7k
	L+PcttfjHdn9LutV2WFySqUYn/EwJZBumL9REuUVwASLf7L51r4Godv4WgF98MRmBPn9xQlv9e2
	0uH23VyhAEBlIaBNG4mi7WBs/XZQgGDTLaGJ/zOOD4ARqPqwl90Zw==
X-Received: by 2002:a05:6402:4290:b0:6a8:6390:945f with SMTP id 4fb4d7f45d1cf-6aa5798614emr3549288a12.10.1789740419612;
        Fri, 18 Sep 2026 07:06:59 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59753cc1sm944353a12.21.2026.09.18.07.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:06:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:06:57 +0200
Message-Id: <DLII11BAGLSU.OV8H9AA3AWN2@fairphone.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
 <apmLYmMgGZVhqU8o@baldur>
In-Reply-To: <apmLYmMgGZVhqU8o@baldur>

Hi Bjorn,

On Thu Sep 3, 2026 at 5:01 PM CEST, Bjorn Andersson wrote:
> On Tue, Sep 01, 2026 at 10:58:59AM +0200, Luca Weiss wrote:
>> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
>> the parent regulators can be enabled when needed.
>>=20
>
> https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges
> starts with "Describe your problem.". Is there an actual problem observed=
?

No, this was noticed just in 'code', that other (also rpmh) devices have
the -supply properties, but not this device.

> I've been told that rpmh will have your back here, so you should not
> need to explicitly vote for these resources from Linux.

Then, this change still makes
/sys/kernel/debug/regulator/regulator_summary have a nice hierachy of
regulators and not all of them parented to regulator-dummy.

Shall I send a v2 with this justification in the commit message? Or is
it okay to pick it up as-is?

Regards
Luca

>
> Regards,
> Bjorn
>
>> The regulators s4a and s6a are a bit special. They feed back into
>> PM6350, but are not modelled as regulators (or anything else?), so they
>> also can't be added as vdd-*-supply. It would seem to be possible to add
>> them with their "Default on booting voltage" from the PM6350 Data Sheet
>> in the dts, but I'm not sure this is desired.
>>=20
>> And document what the "missing" regulators are used for.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 46 ++++++++++++++++=
+++++++
>>  1 file changed, 46 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/ar=
m64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>> index 5d20ad93b0c5..a1556d802a8b 100644
>> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
>> @@ -78,6 +78,17 @@ lcdb_dummy: regulator-lcdb-dummy {
>>  		regulator-max-microvolt =3D <5500000>;
>>  	};
>> =20
>> +	vph_pwr: regulator-vph-pwr {
>> +		compatible =3D "regulator-fixed";
>> +
>> +		regulator-name =3D "vph_pwr";
>> +		regulator-min-microvolt =3D <3700000>;
>> +		regulator-max-microvolt =3D <3700000>;
>> +
>> +		regulator-always-on;
>> +		regulator-boot-on;
>> +	};
>> +
>>  	reserved-memory {
>>  		/*
>>  		 * The rmtfs memory region in downstream is 'dynamically allocated'
>> @@ -296,6 +307,15 @@ &adsp {
>>  &apps_rsc {
>>  	regulators-0 {
>>  		compatible =3D "qcom,pm6350-rpmh-regulators";
>> +
>> +		vdd-l2-l5-l7-supply =3D <&vreg_s2a>;
>> +		vdd-l3-l6-l8-l9-l10-supply =3D <&vreg_bob>;
>> +		vdd-l11-supply =3D <&vreg_s2a>;
>> +		vdd-l12-l14-supply =3D <&vreg_s2a>;
>> +		vdd-l15-l19-l22-supply =3D <&vreg_s8e>;
>> +		vdd-s1-supply =3D <&vph_pwr>;
>> +		vdd-s2-supply =3D <&vph_pwr>;
>> +
>>  		qcom,pmic-id =3D "a";
>> =20
>>  		vreg_s1a: smps1 {
>> @@ -310,6 +330,14 @@ vreg_s2a: smps2 {
>>  			regulator-max-microvolt =3D <2048000>;
>>  		};
>> =20
>> +		/*
>> +		 * s3a (smps3) is gfx.lvl
>> +		 * s4a (smps4) is supply for vdd-l4 & vdd-l13
>> +		 * s5a (smps5) is mx.lvl
>> +		 * s6a (smps6) is supply for vdd-l16 & vdd-l18-l20-l21
>> +		 * l1a (ldo1) is lcx.lvl
>> +		 */
>> +
>>  		vreg_l2a: ldo2 {
>>  			regulator-name =3D "vreg_l2a";
>>  			regulator-min-microvolt =3D <1503000>;
>> @@ -408,6 +436,8 @@ vreg_l16a: ldo16 {
>>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>>  		};
>> =20
>> +		/* l17a (ldo17) is lmx.lvl */
>> +
>>  		vreg_l18a: ldo18 {
>>  			regulator-name =3D "vreg_l18a";
>>  			regulator-min-microvolt =3D <788000>;
>> @@ -446,8 +476,24 @@ vreg_l22a: ldo22 {
>> =20
>>  	regulators-1 {
>>  		compatible =3D "qcom,pm6150l-rpmh-regulators";
>> +
>> +		vdd-bob-supply =3D <&vph_pwr>;
>> +		vdd-l1-l8-supply =3D <&vreg_s2a>;
>> +		vdd-l2-l3-supply =3D <&vreg_s8e>;
>> +		vdd-l4-l5-l6-supply =3D <&vreg_bob>;
>> +		vdd-l7-l11-supply =3D <&vreg_bob>;
>> +		vdd-l9-l10-supply =3D <&vreg_bob>;
>> +		vdd-s8-supply =3D <&vph_pwr>;
>> +
>>  		qcom,pmic-id =3D "e";
>> =20
>> +		/*
>> +		 * s1e-s2e (smps1-smps2) is cx.lvl
>> +		 * s3e-s4e (smps3-smps4) is VDD_APC1
>> +		 * s5e (smps5) is VDD_APC0
>> +		 * s6e-s7e (smps6-smps7) is mss.lvl
>> +		 */
>> +
>>  		vreg_s8e: smps8 {
>>  			regulator-name =3D "vreg_s8e";
>>  			regulator-min-microvolt =3D <313000>;
>>=20
>> --=20
>> 2.55.0
>>=20


