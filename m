Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAED53D9DD7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525562; cv=pass; b=FRQvzF4A+6xiI37W4Uz7Bi4odOPwAloAwWVKNdZwbrZ1zKMCdJF9a4UQLu3kXKPWEXuovqWqVitq0fyfyTtb9cwlaq6Ce5MfvlgEks6WEAAo+OLnWvrujHlyJZrI6O6FQYwQ6HMZjLhqk63alvuxmPSe/ImE0gQU7SQug96+/kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525562; c=relaxed/simple;
	bh=VUcBB0vOW6MkjtjLDRFaCy6FaOEhAXU/YjiYrkHQqRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/4dmyFOb1rzl2iNaRf5iPfpQOqMOedx0/+sK04IPtmHk6KRqo9ObAVdPrfZWur91OjEYP374Q9e9uEozyLYZbkNrnuWLhDdH16ts0zdAePxPf/NYtOKNwU8wO8Ueeb9HXpwTw4BTy8Q4pVoX5oVos7wlZMDbRgWmPsa9A3pBkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0XJ4tXG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bs6ICLq1; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0XJ4tXG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bs6ICLq1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684AIIjP2755991
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=; b=K0XJ4tXGEidqOsXZ
	b032oR5V1rqvQce0EcA9gAHTKUvpdP1vfUI2NvqJy9w/gP6XHjbadQgX9dOh+sH2
	U0udof4CD8CAWQvCHepl4wCV5X3ApQBfEkUitnWsclRsnOxoVB+V5GMzJ++6e2Re
	3mQUMOjyswcZbavDWSMq4x329nxo9nfG2K4bI5NTW7pUROmGarJHDQX5Yx6XXn7A
	hGQSNZhHyd7cmP+Qf4qbuxe1qskxzB/YsHswpsfOspQ1rDXbM/FcVJ62NSaVpeAJ
	azWw3CIV/wasFEdMSeRe759zAFUe/X8vfVoeVM2jXo/U5ZMfaNS//ACUzGzVRc9P
	rLTDZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfk92253b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:39:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f52ccd459so15087071cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525559; cv=none;
        d=google.com; s=arc-20260327;
        b=r18jDZJD7kA95XqK1H9SUckZ4BqHGBiYNq65uB1x7QyF1Apz+vST+MFM6L+GqppIiy
         5BpW96cQha50jutpcr94jrrLNZvTDFfD0k1h8bsXdVptfUUbquNBo/TMjqU2d2/g/w9C
         g2qoTUbZIlkUyl2wHgmbjMjF8589+4LG5TcbYOgsT9pBAtlYmv3JZs1XLiwiRkycB5B5
         FupZ5uHy7Ezuj5oZQlbhMlCXizO5Pymhck9VbX5wqF1VDV1avqtKnJeyHWt5Hd7WYPId
         p9UudCL3LN4OQvAeoPttkallPiMH2E1M5X/myBBIlNdcym3w8q0Xy0qmBC/b7dzYsWMC
         //nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        fh=ZfjQbcg8GpgULDAjcCiEmX1xnBeUNctK6C3PPdOTh1g=;
        b=U/VcJyZY7Q6BFBZ0UN1ChGlRBcpbhNXYRKc+uk1NsKWR0bZQgWwB0/weuVTyclzwz3
         S7yqfUhzePvKpAlRdSzNWGe9gFgUsBse3lC44oTBr5LKvtgOvYTSiLAR2obR0EtbRw2U
         eph4TIALb1uiE85+YlPhdqinqX7muOCrQrvgnpRyAjpayTbRy6duoP1A/LMS/pbtwVj1
         X4ZZDowONVqzp+v4df9og3IHd1sICEMs8e6457dmy2kB+wpcsoTCNivZLY0RQx30z5UB
         uRmG7cJZppx+1ORB0mqzG/KlZZeiD+CMe0jmd5iLVroyE64f4QOqpN+OKt2pOiI2xEOj
         NHDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788525559; x=1789130359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=bs6ICLq1Rcpo6h+NJ2NAsIwXSG8ONm3ZBYr4slddu1Dj0FY7PzwsFcqVE2iNOtiu5Y
         nofWPOHx3vrWyr9cRT9lEh5CvPCbxV10P9AccSVmu8DUIOD32F2iHYxrrGB6SOodrhbl
         tUji8woJ0E+7WI2yWxeGSuVwEt75H/NoQAkweFbosavuNvk2nqtETGni8+/ORWTQLr9u
         fBDkIiWgUaiFOINw2U6xvfttuSJcxaq64oK111DpDa/GkZeJpiaRuCXFomuDFsB/jiEM
         1EszKH+jPwJjFXjbzrOw5uOYKqGTRC38BRtLGjCArL2e+E8Ny9SmHZzF/61y6/Icsu9E
         5jOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525559; x=1789130359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G64/bNzWu0MVWc4hGb1QXCkMcnWhjiEk88kN6xUqbpE=;
        b=fQ99yTwtn4p8Azees14HK+fFa6RswM+75xzJwtPWLVCaHQfnhQTuhXPG0VXguKllXM
         hN3nTZsiNiKeInuRhpucFuidAFQKFjdlqG46s6UY5mJ006VpN56QK/8qSYnaM5iM513P
         8SX0y0XgXoxrRdlVLAdjG9mcFXQRb6t8lGRAOM2aSYDxqez50v8agFHPX1A5K3U/un5V
         yaAGq0pjtxV0Egglg5PAnmvEgvC4oyEjBkwU9jjnZcnCeazy9191v/e9ffjRwiu6lPFZ
         8d1SM+URYj2v11Y9iHYpqkI2kAXEWTQ5jgbAuTY9GRPZxjdTunAMYCDEPAZS0SOQazIq
         ayQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZDw7fXm/vNVNkgTJ/kjYWFEsJyAZNDrr7HZqu3lXyTAPfxaYTV7/C69PXZYRCM/a8K6LVM08tBDAQfqg=@vger.kernel.org
X-Gm-Message-State: AFuF++n4pD42Xc1JvzoInaMyJO/ij+C5VfaT3OAYi9qImYpZ2MuRueFN
	UCVZEuir2JcL5uoyCujV8gTOXHcDtfmyrxFPBiC8WbPSCXFzPhfCzjWalxPzVGEmd0456NoWmVp
	VENGzHgz3CmzM3/guGiw6hCCzzoudgwDfw8hFK+y9SyA3u8nOAEpQVvrFLchqz/rj3WNEC9Kmxx
	YS9WM8xnc7xm/vdMaYA3gbiLqthQsZx+9DCejkg0LUTQ==
X-Gm-Gg: AYBFou0UASFo4UXHMcdC61GF+1MckZtHaUqYV4iGO/+VATo3J7UkyrGo4PGDizzV9Fg
	dS5PnGIfUaLBw48x1jeULhpK7K4rguw7nV5+tdm3cvHKGvfvQqf+neI3h38xOSUZT0+LwHPINQW
	ynM1SHkmT7S0EpnkbZxFAWzS4TuTyauYIXFRO9xCG11zyPFTGjP5jfbLYt4/0WbfaEK2Jodqk1O
	VdhvxJqlZXDR+ar+IX47Pxrhdjz23IbH2H7VuusRMNjuY+j3p9yxrJ0jO279ES4UnF5LVvh9fsS
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-530549fd6c2mr61916001cf.36.1788525558629;
        Fri, 04 Sep 2026 05:39:18 -0700 (PDT)
X-Received: by 2002:a05:622a:286:b0:51c:1fd1:e755 with SMTP id
 d75a77b69052e-530549fd6c2mr61915361cf.36.1788525558050; Fri, 04 Sep 2026
 05:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-0-01ef1eced075@linaro.org>
 <20260903-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v14-1-01ef1eced075@linaro.org>
 <2aXo5I_5YqQ6uikqbIOWs7L__EwJV2oTs24Jqa-YRqGIU2FOT1O4bixGBbTzbaiBuENyW0XkWbqAJJQnxgSnWQ==@protonmail.internalid>
 <CAFEp6-2nWfjF18R9pw0xFt92GcPORKKa+ix8czQ=m512TYuP8Q@mail.gmail.com> <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
In-Reply-To: <51b3dd1a-5595-4538-b792-a679b6813a6f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 14:39:04 +0200
X-Gm-Features: AcwNN1Xi0ZnbHcNu1xFGVtcHdZiZF7hrQekcNJq1YSDgANQhTlSn5NmxIbSBScw
Message-ID: <CAFEp6-2_XTMnxqcoNFwu=BfWki2U7U=iuQL8n6QcR-CZSMsX-Q@mail.gmail.com>
Subject: Re: [PATCH v14 1/4] phy: core: Fix use-after-free in phy_get paths
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfX8M+m3zv/cUGf
 8UQpUSc99EZzz4gsko2ZioMs1zXXhIjUtQL/RmNYRHyf6LQ3PsWHnusy3wAyHG6XDv8NWX5IqQP
 LPknT+n+QL302opa1Oy0Tj+3jjJ8kuEahsW4ywD+zI/ajkRBL4uCeDoBdAwIMKz+q3l9XI3DPWc
 0kG/3YatuXuMNjZA/x7f0KDbkFtk+7+kETJELbXKXW3sIp9Qic9rKsfcRF6Fi983QXyhYVxmaS7
 G0hh3aG3oTvcA1mi6o52t10BTT3ZpXWB5UsSNsV5UcHCPd5IgJvu14fLk96ltF9R+yRXvNJIjHY
 axvSblzOnGEWhfmHHmQ2ZlPGn6/irS2cnQMachh3b2H+SXq512JefYa2b5uwsi7/wnkRNVtmAON
 nNXR3S+t06uQvQAzEQxsCUXWEptfqAPJzdrQuSlLpKAeP7+cN8+dNfBXuyfJVlYoEE04bhTqbZ5
 CYryo0H2mq/HNTiUoKw==
X-Authority-Analysis: v=2.4 cv=Oc2oyBTY c=1 sm=1 tr=0 ts=6a9abbf7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=4B6qI-Qak-9ifnyKK3wA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LzuIdqzHgPnCujVgfS2bF8Tkp6bYLXuZ
X-Proofpoint-GUID: LzuIdqzHgPnCujVgfS2bF8Tkp6bYLXuZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDExNCBTYWx0ZWRfXz0bAWqZt463O
 7ce01BWk4V/iZQ/N4Ac9NtdmqVU2pKO2VKn3kSsUAXDzRYaQeQn/S5SQQTv/Dwr2US5Y2v6cfWl
 v7zPj4UCQPkCj3nFRFrRmYXoB/1UVb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040114

On Fri, Sep 4, 2026 at 11:41=E2=80=AFAM Bryan O'Donoghue <bod@kernel.org> w=
rote:
>
> On 04/09/2026 08:45, Loic Poulain wrote:
> >> -       mutex_lock(&phy_provider_mutex);
> > Then, now we're moving the responsibility to the callers, maybe we shou=
ld have:
> >      lockdep_assert_held(&phy_provider_mutex)
>
> An LLM suggested the same thing to me but, I thought the resulting patch
> "looked messy".
>
> Do you want it added, its only three additional callsites.

It's only a minor suggestion, but if you end up submitting a new
version, it might be worth including.

I would also probably use a scoped/guarded locking pattern for the
mutex, as it tends to simplify the error paths. That said, it's mostly
a matter of personal preference, and some maintainers prefer explicit
lock/unlock pairs for clarity.

Regards,
Loic
