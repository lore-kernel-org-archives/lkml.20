Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942497;
	b=ekEF+IjMwc5/z0Ke0pXpjVExqmCy345/CNqbRr8XjdjUnTmk+krEzegVEQKwBZU7vZf+
	 pInZL6vidObWP75ZcQM2nO/F5RprKcusRJQc8WQXetC1MExXUVRueqmcJk0+ilR5tBIjq
	 8GQ8GLvGJk8smHKJBSWYAJfEnUEpiudvnxZ5q/3Oi0VfxECD4OX2eUxedvZZGhmQ/eWJL
	 RxPGFrSBjsOD2PjsOOSC4yPbDT0K0uoQP/PzKmtNkBDNoJsjnJ0SsO04NbBMs4AArXcIq
	 gEwTUXVhnevQwOV4RV04Y+/YVhTHU8OaR0CrnLrHH0QB8Z64II2EZAU1DK45++bOcPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942497;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SOjuskPi5ZrZu2taZwM+sodjQgtfCQ3CXvG3+RI9jko=;
	b=jLtcd+ujNWzyNqM8Gqr/Xq/ioK7+lL7bOt5+Y16D9CCR9vPHcVG17kj9AtjPQIQOl0sr
	 xbHJ6mcXHjylhnMMnrgaEULlGfxMUfIvdDfaY/XB1Y9lzPovjEWw1F4T1JvdalBeyx6NA
	 ulHAHuWmG7G27g1BQMo4W8MUBg0lnq7DXOYDKWNzmwzkPY/m3V+fupsxBEnw3y6PP6wer
	 D8VU2C+5JH7S8EPyr1JvudlazhqTJICDeIUkB/54MztmWVXAlURIjfFOkdqkwLsY6+YzS
	 2IBt2rjWC/OFztrhkfqjOwdc6zrXcRO1cg4lyI90u35cHCCImk6ERMhYu/NrysWhzJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=citrFcyw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qvcnh9Ek;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB2606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EABB2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=citrFcyw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qvcnh9Ek
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A640tv23419440
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SOjuskPi5ZrZu2taZwM+sodjQgtfCQ3CXvG3+RI9jko=; b=citrFcywTfTIOSzi
	nAR9btW9doITBUZbTfbjcjCapOZ0b/R+zxc56klgC/xM4Q5dV9opHwiFamleCX5D
	ltXMAFvQbX+laKaTNt8jXqfCoLMyKBpcN2/TViOOTLTMv6Auh9GZYtfVJPNjhfxj
	Atsklt9hMOT8iEsQ+Yf4jcnQfGdjyggqBu1Zk+m/p0qyBxlPttImXXxCS9fByZHI
	YE63dWjmRZKEm1Bmcv0pgZ10jWsduBujhW0O2b3/86kDdVbbvU4dS+Z6fwjzqDoM
	ap35eJm9rIuPHY4rO+ZrieAOL6I90DGKgdX+JkomE4kgZZNg9wqN2kopDDFo2X5f
	23TO5A==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1290-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:21:35 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b320a98b7eso5169707b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942495; x=1794547295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOjuskPi5ZrZu2taZwM+sodjQgtfCQ3CXvG3+RI9jko=;
        b=Qvcnh9EkhCp+l3bkkgpj1RMkz5ZrnEIW+Y7vdRi/9oDz0HHg7/BYiEN5XpjNZCCbDe
         O01D6yaglfPadD/KfMC6KcaM0niD/OAqqGxxpLGJtcSzw8gDRYt4lNqvhT2HO4oMDyh7
         ILeELRO9EyrOROnYfzozwT969xIKw7LhxqERjLQ7N8lgJuUuz+UvG+mTmZ4/Uzzd6gRu
         eCWUdtbwbFIJKq2f8VRi6wR5G8tWRApLCcVADux80Zs0SPFLCSmghC55nR1jhKpRqzWz
         SsZrj4MTfZHmSnbTu8d8l/eBe+At8r/MsRo8ZUUTOTqBFqP95PbwsoOZRu+w+QiSQyIM
         4NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942495; x=1794547295;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOjuskPi5ZrZu2taZwM+sodjQgtfCQ3CXvG3+RI9jko=;
        b=IN6fMX33IN3YrOpnwUL1rbO95i6Byl3X2NQ2ofz2gLX103Jy1yt5CQGOwglldEZ7vV
         qwb+l4J392HGSX6x3amp5/Z1unHuVso8Y8D5EkJ0CBFgJVnqUyygCNoQ0rRvnedxoHI3
         +bkN84fb6HFQ7l34kJ2l1r+JKYym0YDoLXSuMaRLxwMuSFlFw1nVoZ4fQ+nZGJjXQgyP
         ztdaxNtjYzKkexgjMnNokpTRBDvSFbTRl28e0sdl3iPtctO5o/pAu03wqKyuUAspZ/Ml
         X5ysZcr2spqkcvQhZKo832h8CkX6ZQNTAxF8DrVwAykVGFtprATsH+S7w4EnDnfkUdzA
         OaQg==
X-Forwarded-Encrypted: i=1; AL+hErHPr+638qfbY8A0S9Bp0/iGYx7XC9VV1ERSC+zpxTLhz6zpV6YAcRXymSCw8YojXGg+f7XVrWIofXfQDb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rbi9i2Dm1Gc6L7yu1PoquTguD0tUmFgDYtYSNrw8ISAtvC07g
	AQcJgTZFZNQ/iSkv4Q5gf7UsbkiFdh4lv1/hqNfB09cbWblK5NJCFrz2lxZggCp1OVVSjiaAj8k
	zsrC5xwM0ncSacxpj38lltZZjq0vso95V0N3ETYlHz8hFUBqANnRChjjThzGNYV6O7/IhkSiIwk
	w=
X-Gm-Gg: AYBFou3sqLApCMqTp+c68hC8Kdo1e/1UiV7EM3SK17gQ7pfSypXu4jjIABH65E8ghAX
	RUfZOVRK4n/OXwZehunhXvCtYpHxn84jiUPv1Tvlh2gm728xRzj3TLrvbrsi5II6UO+QeCDN09D
	XlcghCh76OHV9eneyZjrt7HGKZNccWMAJr34YWqgSaTMWuJrbNZvUuAEpg4OU1s1pFdFP9DB/1p
	3UkO4Zm7Gf6sI9mQUVtMbQ2bA1nxvG0cp1mxQcY36ZDZSLjRjXyMSL6/9HMbTU134VITNDwg/IT
	gUsvuQUMkmKMyeScFOfAD/YnjczKrOvdneU9HSQ7wNmiqrTAf2uqaldz/DQw+2qrzZ0xrrl8qJT
	uMxIqJhA5ZTnjsB2F/7d6YbpQXHXUx0mA/EGa2HVPRroG2o936eqaVAz6AyllrwnnE/zZdOeU64
	QP5ip6gYzpOPn47rSCrJW+vNY6T5WljhIj4w==
X-Received: by 2002:a05:690c:e3ea:b0:891:c494:1a99 with SMTP id 00721157ae682-8b341960138mr9032987b3.24.1793942495123;
        Thu, 05 Nov 2026 21:21:35 -0800 (PST)
X-Received: by 2002:a05:690c:e3ea:b0:891:c494:1a99 with SMTP id 00721157ae682-8b341960138mr9032907b3.24.1793942494720;
        Thu, 05 Nov 2026 21:21:34 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f770cc6sm11584617b3.9.2026.11.05.21.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:21:33 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: gpio: Parent the reset-gpio device to the GPIO controller
Date: Fri,  6 Nov 2026 00:21:31 -0500
Message-ID: <20261106052132.2737352-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com>
References: <20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QeehJZBet-Al9Ss2CHp8zdeooCl_szmo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX0aBq7jaoZF1h
 mjyEPnCOJydAOQw2Kl7P6Pjq4FzSYDnXGT3CWdNJ5/Y4c0bYV/KvcOPjkam9IVOtVjFfs3DGSBe
 sAmklKY/iNSJWdSMuQUqMMj1LCbrbTU=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed63df cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AC0Wvfx5D2MqvrS3mtQA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: QeehJZBet-Al9Ss2CHp8zdeooCl_szmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfXxQnV0BsJMwX+
 sxrcHiD0dMR0O+kMLiAAfdQWV7SWy9Nh+q/EfpED86ZdPwL2aj57LmW2aiPt/tB9TNKh0fL7LBx
 dI+yc+IT3puY+v+F7LVHNubjA7H5Gx8ya+4D6eaJ57ZqkmFjBFVJIrRE0Va/G37YTUD4YcwI67j
 cUhGGZ6WPQqn2zZ8uIslz20HuP77sUV/7Jg9klx6iXCfMOqow574WgOu+e4xrUYTIsPt6z3vDEr
 LTN/Qw4wEudcVmLFWEKvhLq9AleuY23kCnR+G/WJbui2Pc449Z+3Z216nD+wCQoBMeySUO9vksN
 WQ1lVXP09KVRIl3VHOMu2pSCbzr7fZPgLieni4eotQmynEgJxta3kaoX1lJx5OwgX0HQC6RbFuy
 bGhsE4ryAkuJ3TQ8o7DzBYfTClMHpiEsuCcl+5v/IbvgzGx+RNiqcjCAe2K7ux5MCVX9N0SLcB7
 gDvoELVGBzLrbcWGkGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060020

On Mon, 26 Oct 2026 at 14:21, Abel Vesa wrote:
> Make the controller the parent instead, which stays registered while it
> is unbound and gets a new GPIO device when it is bound again. Keep using
> the GPIO device if it has no parent.

Fixes: 46dae84a90f9 ("reset: make the provider of reset-gpios the parent of the reset device")

> +	aux_parent = parent->parent ?: parent;

On banked controllers (a gpio_chip and fwnode per bank)
gpio_shared_dev_is_reset_gpio() stops matching, since it compares the
parent's fwnode. I'll send a small fix for that on top of this.

Adding Bartosz and linux-gpio.

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Hamoa IoT EVK
