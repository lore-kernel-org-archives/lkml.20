Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979F444AB62
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770605; cv=none; b=UXZ1Ka56d6y8XP3sUBsaD2YX1XM1IaLusUSAWk8QLiku/SonPxFfeUMjVc2Ht61QYD1ci3mcCmLo/hvAmOKeTkaf/yXvSqEFId10KGGfTMbHfT2NCrOZpSCSAmLkoTj6uJz5AKZb2KQdQoL53IVmjV3qO/aWiDJfuB41f9XppuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770605; c=relaxed/simple;
	bh=wqD3L5ETpmXLY61fNf9tbmIx8tKHrD1eyJ6hs/UN+1k=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yv7f8Ilgkxc8THLJnKmEmsAxPEO4TYDO0i9q5EKhPTVu6H+mO3hsq5emNkGIN2wn9b9E1U00ynPL/hd+R4i+hoF9HA6F08NoxWY+UQ2ht5AnyF9O9lbm4Vb6zMCnAm7z9nHAufK6RBmfGwSPA357QjwDEO2vKnXzlV+Y+caBczY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQdzGMuW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQdzGMuW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 608B21F00ADE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788770604;
	bh=/cp7Z8L9xcZp/d1RqZXXokpGijRN5pnwajmH6ZGZLfk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TQdzGMuWupfOnFZ5Ejns3FrQuPmmzlZMSdcFgg0tqRKfD6iKk+vrge1LFElX8f3QL
	 AbO479hTJ3Ea89nqmgyJTzW5TbtYYqf40qb34j+Bjv1lSSTl2CocIOD6MdNN9+w2Cb
	 IFCy/rItdY1Z1RjJ1Z1Zpwhj/wRxyC2fhpczv4EB5z1Fefs7VJzm0ov0rE+/BaDg/z
	 Q7o+FUkdys1oeXUYJpwve2qBz8oLzP8xMWyWcjq82vfX3THUk0UDJdXhd/WNrAZZ86
	 G751uoppNj1J3aza2bIDLw426Y7/vxFEzbBSn/44LHpKqjs4TYu4cCYVJBM9rQFMf9
	 J20rn/UsaschA==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a2e9851ed7so31052661fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:43:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxnbiol3J+Wt8BU2Ic23b/eamcb7GZtE+l6XkQvxi7OWzgyjIg8xpiEwlO4Z5sxP/yPrBbiB8o74rERmoM=@vger.kernel.org
X-Gm-Message-State: AFuF++kOZgZCZ4uKnOF3ciDH+wUz2AmirqjIAV3JEi/OGuJw2denVr+K
	xx1FntrovCPmV6I/FWUmdM/K7ryMa+fkjcsqqa6SvXSup5hHfpWrW0DT7j06hPV/Pd0s1peoY2r
	d+bv3YC6DyTqPyV/zqz6irZ+CxzW8ir+clmXEXDalqQ==
X-Received: by 2002:a05:651c:19a9:b0:3a3:462f:329a with SMTP id
 38308e7fff4ca-3a371be7d52mr26263091fa.13.1788770603019; Mon, 07 Sep 2026
 01:43:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 01:43:21 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Sep 2026 01:43:21 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260904074541.590485-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904074541.590485-1-shengchao.guo@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 01:43:21 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mcpv9yCh4BcrwoQZ-Fw3BmbuG5UxgDA=WXFw=pyHMNK8Q@mail.gmail.com>
X-Gm-Features: AcwNN1XfLFrscctqYnZFhzB1Dbhyy6GHbjHTE23CqhUqVhfHqZNS949POzD3naE
Message-ID: <CAMRc=Mcpv9yCh4BcrwoQZ-Fw3BmbuG5UxgDA=WXFw=pyHMNK8Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: qcom-pm8xxx: Document PMM8654AU RTC
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Satya Priya <quic_c_skakit@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sep 2026 09:45:41 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Document Qualcomm PMM8654AU PMIC RTC which is compatible with PMK8350
> RTC.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> index 7497dc3ac5b2..78fa1d5ed028 100644
> --- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
> @@ -17,6 +17,9 @@ properties:
>            - qcom,pm8921-rtc
>            - qcom,pm8941-rtc
>            - qcom,pmk8350-rtc
> +      - items:
> +          - const: qcom,pmm8654au-rtc
> +          - const: qcom,pmk8350-rtc
>        - items:
>            - enum:
>                - qcom,pm8018-rtc
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
