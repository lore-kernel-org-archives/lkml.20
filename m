Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827522;
	b=tyfOnUTuTAUku3zx+ctX9ozaTSxL8BsFAHed8D1udt5bP2BZUMrUEMYr4VTOM2+tESG8
	 xis5fvfkICHKSso9dM+IBNpk5ShinrORh6IgFnuIUvMqUSqZWVq6gpB69oI45rjJLXEnt
	 yC+7sRIiOEeMs+Q8IBQzL7arhxv5CunEuqVxVyamW8DlsvnQazN6lmeJm3lru4lXH1nge
	 Gba47FIQvl5rn3sGi8zAWXd/VPh8tJYNidMuyX8VI6iUy8y3cUuAwGDL2V14KBSkx9Nx0
	 Qk7RWO+wBBfsbw7M6yN08+72oGIYAKhMu6MwuVzFLoFxVsf+45NXAwGXe8b7aJs8UAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
	b=Qt6ogZohXw5kTC/gzkj7+SSgsBzzwJf7ha5o+AqLjVs2iQd2FTGUdiGYzw4VXjPplRkC
	 3br91yssWyY9q3F8V0f+SPEKNkT4T1BIt7iU2OXf9LQ04fKYWYRD1k5zHfF2HXqHRw9TY
	 MNjfiYy+9nkwQ6ndIwQ0fVxx+epNBWmlPZeIRqXAjlHbinAnW7wPzoHSvxEmXmae3fhJK
	 j86QqYY+3UHUSKD9+mn7e8uu948dY0B0NNc4rgcEjIAARvd131uPGIZPC86Pi2oh32VrA
	 6oC5kaRvl0u5DxKDV80pCszywamiAf4NIiYgPsspAjpmG8bjrcv52R+A8TEnuM4IczQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPbFwlNg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jrxYe0XL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66A0606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A66A0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPbFwlNg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jrxYe0XL
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG97T8B1160971
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=; b=SPbFwlNgGAX1d2Ij
	jCPyY0ToQkVngHeWoqZbyO2qpTQVxLkBPqXCcL+ytwQaCeKyM2n49b/AWLvyyI3o
	7bTDPQ7MbAi654QDvRyLk/e22au21iYYwdlyo4bu1iDBpUDgvJn9YjDF+KX1dt2g
	k5X5VNeznb4+rjU86YsuRVsVqoXS22M1uF9bQZxDC917oKMtHSq2xtdnr91NXlrY
	zYR7E0MeN8D3UnnuC72ehIIKUugnZz6IhZN9lAdnGvHA+1GshhirfI8F8+etthVS
	UScFIepHQBCRhOxZbbyMy84KdEoMtP70bKIUvEx20ph5UBXxkFHUweHcHxyTb+7q
	B1qp+w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxx2gere-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:12:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2d7d7608dso2541960137.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827520; x=1795432320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
        b=jrxYe0XLTPeJY75Pc/jTqkkKMSS6XkD0JBsb+lyBDvga50WWaDk4dhxR0WbVW3oV3u
         JL5GqJhY/yWRWqRB1MuzfCIS8RwiP33OkQ67yMkV4AvTg//x4wk1TQnb+/9bJFuUFNn7
         Jw8anFrASNBOQNciU5um6i1D4IoHxFmRlhlO1zRi2tT/ncyHI6M3b+Xm0UB+f5K4IwqH
         z4cOsM6OA3Dp8rQH+L+zPMAEpSRwvdmEIh+txnzQOFxO2LtuO4rBXmooPVx6fDXGR58g
         +ubfn51JnK8A+wYjeK7hxdLQOvF3yjtPVPaqENXPZwZLmEiFldQz5gYEn/ApOlZtWc2b
         oIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827520; x=1795432320;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej9jdDHgLV0e8+q224FTssM5bujI8HMl3OobzJU+HSY=;
        b=A8BlSnCLwgjfc/w1YUXcaehp3wAqyqACDlQ6I98G7GtC3O8KnhXahXiH74QfgArhot
         e+lls/lPISZT9gyhZg+q4NNyWgAE/aoFOETyCDa2h3C4BWrkddcVftwSsNFeFHuEl/RF
         guelx5zZ/Vyu+bezyGcWeu3eomeO1x4ngr0DtPdWYw61MzgUD97hJYF0zA3l5NZ6pwMe
         gAYCKPPQnnWniw3ArTZbjf0KBU4HkM7zU72mSSYA63mw06Hmr56X5L3XdZAVjNcrHchc
         K0kLJjdYcwNK8OIL9riEBr02QAgQIGLISoXFElYBikEFx0y056D5cxUxFK1LpORymL3e
         BL0g==
X-Forwarded-Encrypted: i=1; AL+hErG6AYDFVkjEwV/yJaarbr5lprrARXcu7E/AT1mAJDLSbfiCEAVT6THlk1df9Exe/jx1R2/uFYqOlNvNl8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EheMSpvj0wisjqk6vHJVks9K7HpheIPJsIG86/zCOf0h3LLRa
	JxmbnDpwfpDwPvyCIxP3Px26I0KqxrZa6coYZT44svQtsksIy1n5sDkjjoE03LvfJuY5dE0vZ4W
	3hwCIopDs+gjxECh3Pk9RyAugBkFtl1piKojBhqYUg32NX8Tp3t1kTC8PEkUhDygVIdk=
X-Gm-Gg: AYBFou2NsDRzc0lWYV1cj05KwpGpovJKFtzdrauRgngrbbNWkDirIlAc9dbgFuJyvgs
	OvjwsKetBxOAlrZpxCHPTXgqTcC7Q+h9BEtUXk+fxwUUF48z0RcusFuW7naHkW32M8ew7SW2T5r
	NuqdF4jNgowE1d4kMlhVfal5d3ir2fWp218iYlGZ7bz96so/WLIsVZY3AtxsLhp8sMmjIk102OY
	R+UDafnX0HZeh+tgUkmP8Z/dDIzMQQJdtxDLgmNs7/dTZJbnfCGKNCisEW4FWjtCKhRj5XRiT5V
	aaFc7Fg2yXpO+OJWbpaDjIq4H5MWuv+tDBFW7zmutpbTMf7XsYFkJoSAqVbkAWuf6gI2uh/umvA
	S5v7JAlfRZejOF5W87ddXObGkrEnCbr5UXuEmJ4tiVsLM6X63Ujm07HgQ1XbDFV7SB4Sy0o9/mH
	CIhvIyOkXIeoQg6g==
X-Received: by 2002:a05:6102:4410:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d64d77b869mr3373682137.24.1794827519620;
        Mon, 16 Nov 2026 03:11:59 -0800 (PST)
X-Received: by 2002:a05:6102:4410:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d64d77b869mr3373677137.24.1794827519145;
        Mon, 16 Nov 2026 03:11:59 -0800 (PST)
Received: from brgl-qcom.nice.aeroport.fr ([193.57.185.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm390162175e9.4.2026.11.16.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:11:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/5] gpio: shared: replace platform lookup with dummy software nodes
Date: Mon, 16 Nov 2026 12:11:56 +0100
Message-ID: <179482751351.15583.15760848984534388271.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R7WWitRX c=1 sm=1 tr=0 ts=6afae500 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=g6/0voG6I3K7UbaExJZWvQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RChOLZm6GgJo1hU3wOUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX4seO8336WJO0
 w0r4VpDjxFuoh1RE4lFO22XyIkmKUeIXdNPB/g6CPJEJUkGpePrAzvE9T4nimsMlQvARUK44aRR
 QFHYdB5Ddel7QBFlGQeHnTVI1YqhH3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX0+TGy0gYfqw2
 U38TLDchS437Aw+ZLik6o5V7lqGorRWWfRtdnpqINwouMZ1IOnzYgPc/YWt4IyTJg1Fn3r8j3Mq
 8XJSq59D+4Gpy+FWfx7abZaYtCgS27Oytyw3IPiH/h5i8neTIFPBAMg48BhdXmUzY7Owtvb7BCa
 HuslOV5TaG+AYKxMOubnKq/sjrBqa9SLA4WUJhN5UTwfywItfnDbCIzIgQedmFNVj6vQLwBOqz1
 Q8ZHdtIwRVobJEDxZWWnb0SmPttQlxyiFFxElTrRDqi4ftOmIJ0Vmf5X0ZCGVyNAxOtnnsA8zUz
 ZSeHE7JUIiDSbzcNTW3Y0ub7YapufjvPDD0/20l4k6b1QZ/rfsu+8sQEc4SFR1qAAj23jvQl9Z8
 tKm6B+vXDlFx2ZURARNpFILo9pJvEHo2ON/PjcTzc+J3SckBnqyUyurtrXifZUijaC0QE31M4cH
 NvyoT+xgIcLX6rthCmQ==
X-Proofpoint-GUID: pILFUGAX3eErYNg5ESMJip9H9lay5Ekb
X-Proofpoint-ORIG-GUID: pILFUGAX3eErYNg5ESMJip9H9lay5Ekb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160044


On Wed, 04 Nov 2026 11:38:07 +0100, Bartosz Golaszewski wrote:
> Abel reported to me a crash on Eliza linked to fwnode GPIO lookup for
> shared GPIOs. Turns out we don't support no-device, fwnode-based lookup
> for shared GPIOs. With the NULL-pointer dereference now fixed, this is
> a rework that implements support for this use-case.
> 
> Sashiko pointed out several issues under v4. Some of them were bogus and
> I fixed the rest.
> 
> [...]

Applied, thanks!

[1/5] gpio: shared: factor out per-entry teardown helper
      https://git.kernel.org/brgl/c/c402fd2961dd013e2da56cf53d147b4943fc3bec
[2/5] gpio: shared: factor out per-entry setup helper
      https://git.kernel.org/brgl/c/cda42ff53c4b57f56f08de6af7abf280d755bd74
[3/5] gpio: shared: unwind partial failures in gpiochip_setup_shared()
      https://git.kernel.org/brgl/c/6067a8ace266c43eb9514288b76d1d07a0f31eb5
[4/5] gpio: shared: detach the proxy device from struct gpio_shared_ref
      https://git.kernel.org/brgl/c/0b80fc5d424d0926841379c1f190a8d1b2ac360b
[5/5] gpio: shared: convert to using software nodes for GPIO shared proxy lookup
      https://git.kernel.org/brgl/c/23cfadf96e14a32a398975d67ce48f1f59abc253

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
