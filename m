Received: from mail-ed2-f37.google.com (mail-ed2-f37.google.com [74.125.228.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FBF4DE72D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742607; cv=none; b=RJwHDep55FVHESTx5MF6TwRmNxdPX4wb34CZMNdBBo8DVY75eJ/L+V5ku9I+UnZJhRaf8aOh8rX25HULg+RYTtGFUUUIfDT14CEYeoIBp7/6V8cqhiOCQ9VTdLzAwvbJ8l6wb27jsOJynETs7HtMJrScYgxvztnDVdD9jLVqdlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742607; c=relaxed/simple;
	bh=Iryp186ezY+gCaEJKKJAixL+bjwtfJ0T/atOJE5WaQA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=n/v/9mOY+k3vUfzCfagRmRXWx6Ytrwq8Kp69UgVhXBiTYapJLRw8tw4DgET9GpiZ6sQfWzu6W/hWfWb6xSVg31rSODalQmML36fx52A8IT6lgys2gbE1lQsWw0P3RYCMzvpG0ZUt1zSh0FXAN5A2hvAOQ+sO8++lxYeJk7Kd1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bhpqsMSp; arc=none smtp.client-ip=74.125.228.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bhpqsMSp"
Received: by mail-ed2-f37.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9a59so1136322a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742603; x=1790347403; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iryp186ezY+gCaEJKKJAixL+bjwtfJ0T/atOJE5WaQA=;
        b=bhpqsMSppMXS57/rwie8aIPBboNhq43ehVhkULnvPa175uVXt/MpzOT9JFAr2kUNNe
         DkPCRPkKsoGVnHdYl61k5IMGAeUM72QS0zEOVKdaulXWmVqJ8l7IA65JogktZnZIFhJi
         bSzVzs3BM1lJ4W17eHfutGUJNO41Bm6NAqs+NE6AbInBEMEnKKztopefxcLk1heRFQ3M
         lDwZhHqtzdqxUQ0xnL185CVb2U7BXVtpoSAuJseN7eyjVQ8A22A1HZi0BuuVtuBplWq/
         vEEfRjsKnkdTDeFEHQRWfLLcbWgLKGnIRiuz6/fsdMgLq8FbG8+wjnPRXeg2VGZErN4u
         Xtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742603; x=1790347403;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iryp186ezY+gCaEJKKJAixL+bjwtfJ0T/atOJE5WaQA=;
        b=Bw4zCe0F4H12DqAYXJ86NUPlhBAQj4qAjhVzYTwAaxGeub5ZnbRoVc4kX4tlE7g1D0
         tjPNl35PeuBMdDZZ2TVB7cvONFv2Fa8O3IYGtF0G0HNphrBy8LeaBJWbOz/kG97H4YCi
         daNZLeE7UualpveYpTCcJxx6RXG/g/7WPwGIwnAUPOR6Fhn2dsdHlgdvoyaB1JATOiBO
         VgYzKhFUwQZwV6ECX8AMCyOn4mbt5LIRUVjDMP8MtTy/1w+7oohd43C47In1s+evXrse
         Ow51sxvbF1EZLtAfAav2kqUjOT8pzdaJP3/y+Dlpr23Dd1E19eCTj3tR1FBthxioHNhk
         IPqA==
X-Forwarded-Encrypted: i=1; AKwUvBxD5qP3Ve6eADcAWcujRpPA3R4YpT50kADBTkhVGo/StiwkyChcTjeVXJ+YPXnNLPNnYnLxsnazAwpMJtA=@vger.kernel.org
X-Gm-Message-State: AFuF++moTqObgbCe097liFtuhUrE+YGA+QD4s+8Vl7x+mSjUDd+qVNds
	GuxNRv9bwZYiZgCYbB9ZislDNeZZcWwC2Ux6JARvvH+Sc+117IqUqPLlh0pOyXZM8oM=
X-Gm-Gg: AYBFou1Zd84U18kWdxf3ODADkIBUx2cg9eg8VfMJ3ZunbN4yy7UA+PyF6cYU6smbIDi
	T4tI5UY8ZDuyizziBM3UteiffG1PqMWClzcugFJ2wjuJ/tu/+aD6rYGr5ctJsTnn+x+QjmnCCVd
	O4hBaLwmP7PpAR16b73p1v72bLJEcno3bg4EZvLLn6s6LzOuYmjDeLs1Ahh6ZarMUv7V7MemqHq
	NIvDs6glnaMcN3pDbrpwMSfiDiRBsLRQR+mfcHb/75btJZLWA6ipI2xXszem6iahce3zZgVIfOW
	QuKEs0FtQlMQC1kD3UNm2fuZQjpURA9AmgGf49i8p7vxw3Cj/+git4BwvYEtefUzB0PetR/vKjo
	6mMW6Ct7LCW3ZxlBU80YEdeGWeysgvXajPXGHqxOO7GwvWBIMnCeWttiGX7izqxabCbRAjI8745
	LSyj/v/sFYvZq4xP+gPPjbSqYYB/ZoSraxP/LG7uL0RLibU2oUj5kJxHo3OJnttLaVHFhJDSZXP
	XvHL0nyqFLj5sw++8BvgN/AVnLxx8dOOOOpNZcUoYI=
X-Received: by 2002:a05:6402:5111:b0:6a9:ab6a:640f with SMTP id 4fb4d7f45d1cf-6aa531c28c8mr1640375a12.37.1789742603374;
        Fri, 18 Sep 2026 07:43:23 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59605618sm991778a12.11.2026.09.18.07.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:43:22 +0200
Message-Id: <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
 <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
 <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>
In-Reply-To: <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>

Hi Konrad,

On Mon Jun 22, 2026 at 10:23 AM CEST, Luca Weiss wrote:
> On Wed Jun 17, 2026 at 12:05 PM CEST, Konrad Dybcio wrote:
>> On 5/22/26 4:46 PM, Luca Weiss wrote:
>>> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
>>> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
>>> and power-domains for the LPASS RX/TX/WSA/VA macros.
>>>=20
>>> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
>>> equivalents in its place. The qcs6490-audioreach.dtsi file can also dro=
p
>>> deletion of power-domains properties then.
>>>=20
>>> This follows previous commits moving Chrome-specific configuration to
>>> the correct file, leaving kodiak.dtsi for Elite and
>>> qcs6490-audioreach.dtsi for AudioReach.
>>>=20
>>> No functional change intended. The clock-output-names property will now
>>> exist for both Chrome and AudioReach devices but this shouldn't have an=
y
>>> relevant effect. And WSA macro clocks weren't added to Chrome because I
>>> don't believe this would've ever worked given it already referenced
>>> q6afecc and the nodes were originally added during AudioReach bringup.
>>
>> I think it's better to keep them, if only to make sure that the result
>> of dtx_diff isn't outside the expectation of a commit that claims to
>> only reshuffle data for these platforms
>
> I documented this in the commit message for this purpose.
>
> But I'd argue not putting (likely incorrect) wsa_macro overrides there
> is the better thing to do. Probably somebody should've taken care of the
> Chrome platforms when adding the wsa nodes in the first place.

Is that okay, or do you want me to change this? I'm still of the opinion
that adding a very-likely-broken WSA macro to chrome is not great.

Anything else to note? R-b would be nice :)

Regards
Luca

>
>>
>> It looks OK as-is for Elite and Audioreach platforms (for the record, I
>> checked rb3gen2 and FP5)
>
> Thanks!
>
> Regards
> Luca


