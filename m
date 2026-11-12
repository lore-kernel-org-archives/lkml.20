Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794452456;
	b=H9vXnlvqOY/dDJDd1roy03wajY8hXN6tezLaM5DwOnwjmVGAmt6FaW8TKrZ/JwByS5eU
	 7pzcN/Ofuv1dOL+ZRlgaYqlPc4We+1tYN0/gIsNS7daIh3ra3bLYwJb3mkFGlTpBcz3sw
	 O59AoYuxZVCVozcaYN3HenR/JUtANCFI/vXbWU31owBcgYfUv2ofStrZccVx+nsh3C2Uq
	 JmeAx7hvv01OOA9rT/o+neiyLaPrdskUutkckUbHZbMycRZdVYYDFkIXVR5ZY19bGYCPv
	 xq1am2FQ3SP7+qq24maAOhLRnd4PhfZ80JVBRz5njYF1YWAIpeeaj+KVeiJXSxqFPdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0ker/e6EtIU4OfORlKixSoRdHPkrYE+Fp5n7xeEspxk=;
	b=MBCC2jAt6iFyge6fxnjA5RKAUUXyR3MOW36rp7ub1gqNFWZrUAg9kUdxX4DxvogR+d2K
	 oHyj1kqv2UJRAyH5KJ2XCvBRzC6SP2DrakyWN2noJ6/LpVujH7nJG6MquA4/curLO7HIi
	 qyCTzPUFn+5W+BcnPhkcnlX+ExpL9k5Vr9WIlzvtOacPDyUEBEPm20NVjHx+AgGocvZP5
	 k75LNIwD/zCRSDye5CXypMq2H/Twler2KhH2zsIn5dSNRCwuW73mGSR07CURugINKnjOD
	 jsK7Jrgdpxv7ZmXUvNZi4NPFLF88R5QQPVYpVygDuBKhNa65AE3TC6lOGByViLpWZpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FTTco9lA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5+nTpdZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEAD606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EEAD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FTTco9lA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L5+nTpdZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZOZa4092378
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ker/e6EtIU4OfORlKixSoRdHPkrYE+Fp5n7xeEspxk=; b=FTTco9lAaClg0qy7
	paSGkH1RUK1r3PkEpXNRMMzJeVviZF/6qNKW2F2qfKB3yacXPk72rJW4gouDYDyh
	zo3yATC+E4zrHCfngpeztPAlrGCQaB+l+kuvO+YbpH9u+AbMohSQ9KAZq6SyPVzy
	KaEssSZKwFtvvPaSs9nWknAZ6lL2ZGjeYNWIhQKrvCiGwoNltoZuwub3jsx3cVeQ
	PUIsgh8ug3j7giWLMWbErIaBqCa8EPqDy7uZOgiuIRHwrbyDxy1Py2WhJQr7k/5y
	+qKlylc0NyL6AruGDg5Xkq7aNT3Okx55QTV7JD6wuPdmdJEiVetlRvEWGD1IlVjm
	7brqFQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8gwfu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:00:55 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679f81d5d7bso6686056d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:00:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794452454; cv=none;
        d=google.com; s=arc-20260327;
        b=fKmaz4/OhGRhZM60Jfu7e6i5mS5T8V0bSKNdYMCIRb+YL94imEeEWfMEtYHlL8/XaF
         o+Jon65TMGlrzOn8RbnpD5R8AtRp7YRD85rd2TO8OA8SbCyjZBGpHLuHMPcw9fRHKqH7
         ZLEsISD1GFgcAwPQ4SytQhmblfeBGOyYxoUy1tZ67cOxIyHdsmsq0JJAv08ucBaW7J0t
         MOwRTq9fisulzNb6WxzATewPHXCGkp5Zovxc+RakNlORdVJVcz//OfQuT3tDgUdm6kb5
         ca1FJRaqHaxanXbI1DmKRzxQ0gM8mV/ZFcrDTxM5nl6RNL3C2yLnW8WpMKRpsa/788DF
         OWqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ker/e6EtIU4OfORlKixSoRdHPkrYE+Fp5n7xeEspxk=;
        fh=kIRO4uA59G55Rxn4hombYqO/47Oh2/kguU5Eze4vN/8=;
        b=Nx3pwvWmcW0CciexA+ykgDdNbtkVufTxPinQnIDfzanYEqSwqjGE80Erc3IdjylutP
         +wCz5J2q+y1TNXTJwUUD6lNJpuEa+Nool6j595HXMtF18RzP3iWVTkvfgYI94IGR2d+Z
         T0HFePlHI9YmVkPIvkjK0Fn377ODit/8z2FywzoWxMlfTTAe143vXZ62gjw6uz7A+Eg+
         y3NxRsc/BIwBjik+dyMSO/IbkCAmfRdxOeeFdrDiDPR8Im+0JB1420r+RRcPojfIcA80
         dOUH6Lhy5zaOY3KsfzLr6SopOElSCNRi/iswkmjcAI0AbkKPO56iNoHZgm4LtvnBYoKI
         K2Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794452454; x=1795057254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ker/e6EtIU4OfORlKixSoRdHPkrYE+Fp5n7xeEspxk=;
        b=L5+nTpdZUtV13iR13f3WGMjWXpxh1XMcHTcanhn8zUlges3A2XoQ7frC0IGKh3YNGC
         UP4ToBZ575+b4SXgmJv/W8ujg5QZMKQZCN4ODHey2/3P+Er9U8M4J2gnoKLBbjLb/zcz
         oq0Jsw8APTD4Xt/kIdVsXKh5EOYdPhWQL/x4trlYzqKKztYLRtMDhAxMPa36iVK8oHIE
         9+IsysVixaFR3TLBxPxQZwzKXuC+BXvbnDtI7oTjMqaXyhVCNyy67ta2ihw0BVcPm8Iu
         g1aHVcnPIt6Ja2WQPMfHFGATfw9kaIuviCGUsM1DoXJ33vhEAgW02crjHynzMLPkseDc
         INkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794452454; x=1795057254;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ker/e6EtIU4OfORlKixSoRdHPkrYE+Fp5n7xeEspxk=;
        b=gsObQoJKXT5g3xoBDnU5psH3CjX7ETYvCHQGISYSVYzWTD9FsjcokqSF7gaooUwAqo
         RZ8xZDfI0k9zZSFnb16c6/c/1vzNEdvnMabroAL48Zc8K8xTzL2IGwpUMPCnUbm8DJ7K
         3NDMbeV6osVDxzcqCXUdi6m6gtMkMn6F51y5GootFwQLwlsS4ouVbGhNHn9WErexzQ+w
         GPmIfbmxL9zV4VHbf4dHgJdMPvnwPqUEvGG7DPia0HTuyR/uF+5vSHkutHY7pL5BxkYH
         tz3P16LpS5bDFa2h5PzKnXqYgIP5m/oJaMyoiAOlp9v5Ppi7BgcJnKA3HukJ/vw8cvUr
         u6oA==
X-Forwarded-Encrypted: i=1; AL+hErFm/YJdi5hGp4vrjFB08/40Sm5wQVMPtAlcA3oo4fXHzLAWozu/ZxJbTA/VhbjDmiGC3jKG9tjd4F9cKfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QlC2BUKFjsWwRnvmaHXNVcWoY2mfOXtSdasvpIUQ+ZDAaq1Vl
	jQUL/lKKrI+6uX9Zxi+xxGTjwVywz18V3Xd1H0h6xM51KQhEJWG8xxbcG61y5dbEjiI8dCukUlL
	Uxq5NHdaOcNhpBtATbjZ39jU56x6IxFzZm8PzZa1PUmikNpTrM0FaDOdNPP5YpcjuZQZaj4qaod
	swiEmKCESCZhwo56IZDbcRCShLatc5v6834JgcmhE5dA==
X-Gm-Gg: AYBFou0on6H7CQ46pqNP1niXMnec6lE6XKtIZ5qzpYNCjv88NnyXu1M9k4cJ+z8zzyP
	9QoJdJ/FagsjK6RU5XLnFG/AhTqeqTifbi1VADGNkC9rhEK78MEOrU7M1RwyBAxUbIXmvv/VjGU
	MQhCVLdcJtu5V//CesBJaF01Fz60wUIpsUO/y5rztbXA33/ju9CB0g15hcew==
X-Received: by 2002:a05:690e:47da:20b0:67b:fd6a:bc1a with SMTP id 956f58d0204a3-67c681084a5mr1880268d50.163.1794452454365;
        Wed, 11 Nov 2026 19:00:54 -0800 (PST)
X-Received: by 2002:a05:690e:47da:20b0:67b:fd6a:bc1a with SMTP id
 956f58d0204a3-67c681084a5mr1880255d50.163.1794452453847; Wed, 11 Nov 2026
 19:00:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com>
 <20881de9-927c-41c1-ae30-829382d531be@lunn.ch>
In-Reply-To: <20881de9-927c-41c1-ae30-829382d531be@lunn.ch>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 11:00:42 +0800
X-Gm-Features: AclHuK80fTtqa5nlpttp9lfXoNbkIHr6rTn_KulU4jNliXlNEOaMYSAQUCN8MQg
Message-ID: <CAPTcHHTJGdCq4zXMhv5iuGVrgeKJgN_5MdG4Joh++biR_J15Tw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: phy: aquantia: Poll global status
 register for provision ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxMSBTYWx0ZWRfXw2K0FhTsF3ZJ
 EjBAuV1jzSk6ydnOJ95wBc9JyFPqDgqo/HShm2wejv+4taONRLrCcy5Wz+/Z8GUE4rZE2XHGw9y
 bfiBa3uFH4Sepb1/vrPpElygkVj1xqI=
X-Proofpoint-GUID: jasg-3722tWUtOpkJxVUa4VWUl_UWLbO
X-Proofpoint-ORIG-GUID: jasg-3722tWUtOpkJxVUa4VWUl_UWLbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxMSBTYWx0ZWRfX9scL0qVxTV61
 E6svay40i90QXHbRbJYVJAPpJVRnWUjq+hbJmGLqglB22V8Jev6qoxm10WGOmXczjQdyRfcLb2R
 mFDMniYhJzVybTdihLyzu+5355sL/eZmWqJQPXpEjXi+YgIrsJAqZsujqknRZure9b40OTJUWy2
 rYyh3XKYvqe8Px8Xra+igrCzeK0rxEJEh1/W0acQw5OvEn2URnMuGte3F0ATQ5zeHHV2V5FFnBY
 MFytV6jWheOavIDROumWX38/Xk/cjpKT4V9cJ5i6aMHsYuYF4Z7d41/8S9o/YvwLJeklkpOqYtU
 5gG0q24+qPYiIDffx/+kNHc+hWLsgNjcgwWfdCLMBEhbXQWXHSEZ1gDQTYKFSxvT4B/7d5wI/u4
 Rb3zRK10eA48+dwv0q+QlCw2nIJXRXBkcotJjAlwuhXhI0cwUWXKdHxn6W3/t8Ma6U7P5Mx+YBh
 qJO3jJeqCUyZ8UdSQJw==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af52be7 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=DX8JRrE0vvtK63t69ZYA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120011

On Wed, Nov 11, 2026 at 9:40=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +     else if (ret)
> > +             phydev_warn(phydev, "Firmware provisioning ID not ready; =
"
> > +                         "interface mode detection may be incorrect\n"=
);
>
> Please don't split strings. Somebody is going to grep for "Firmware
> provisioning ID not ready; interface mode detection may be incorrect"
> when they see it in their logs and not be able to find it.
>
> This is one exception we make to the 80 character rule.
Sure, make sense, will merge the log into one single line.

Regards,
Hongmei Xu
