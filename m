Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01854C14E2
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061328; cv=none; b=YItHs8vpM4/O0fTBnuXYS5aR97rsemdzYlWr50PBqMRNa0jakPfpMvDqD4g4WKzYLy68a3eVs0S0DgrvVGJNIRmL6DahotlwJBN7FFM5lV0OvBi3TOkctVfP91Uy4jBspItSBAmSXvEs8LJsLtoqZMV62JwU9fBz7EuZSBwlrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061328; c=relaxed/simple;
	bh=gkVjJC6goWoZ1wVSLbVPp2ny8CQGP2kljYYcgJMcDx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtzeVp7fnBcwemYFHtKT5yb3+TupgGUADWaRDhdHPAt9IBbakA0nbCWD9itevyOEVyhVdj0CjpXDWANZy8tDA7DbHsclkyZxO5Sc2RgPAKLYjRaLtOg39qkV0PmTFTZEE7Uy/MWKUA67cy3OIks5t67BUaX+WQexrJgk53+km9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGEzkrva; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ok2VrMZ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGEzkrva";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ok2VrMZ3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTtJ2809295
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=; b=OGEzkrva/xzsPw3k
	FFF52HXYiJffBL6gde3MMJzNJtVzIncBkLqoZen3uOFl+kNL+r0zdeTgyj5Dz1Qk
	T+IK2oulH1tDGYGdm8AIvUWPISjop6R/4Wjfb2Mm3pg2F0ura7Yx8QZ1PgPcMOPw
	hebYv4ZrM2gBo2eFdZ9hf1/6/ywDmG4DPJlfc6Cw3FkRoUeJpTdJ3eCjZIQe1Zkm
	+60p0vrAmC9zU2raXcBMcJH9YBA3IczUEok7NH02V8TULNNwAtdAKil2iX6SVji9
	iwVBtx0KzwePLreL/yx4b28Zw6XjhQ2Oh4e0XMXU+bdBhY13n9Cy7RKYGW/kBUUm
	l0nREQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t5k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:48:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91782d0a163so11935076d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061325; x=1792666125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=;
        b=Ok2VrMZ3ziwiSMtFVuY8xp0s4hlha7ud13EkWTg21K8N4TGzgVjYpwsHQajUbbvWhz
         FQB8mTiDNgJXATvlsUSC5jzVW4njx525VzvFEqQV2GCysielY9TnyoaONb+T2IG6ufSV
         yBLK2iuqtHUJ7fl1tAkGvGX4Ek9/pHzvTcAgQWlS21jEXDa73xdJKQc82nRuF8RDw8iF
         4g1OtzwDyy9YJ9y5lePT4k06uK20JuneHrtoy8Q34JUtcUUDyVMqUOYZZXWQRkGK5AWi
         OW5DPXhS5M/rV5omYOiuaoUmwD8JeHOdvVKRED4abZqaKFT2tgsaYemPbBlKLaogP6uO
         GUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061325; x=1792666125;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OZMHg29644rNWbo4GaxuaRmBYNK1O49lNyql6VgKs4=;
        b=lyE0gxjoyPQLwcoB5rHvapjrGJsElqCPQe/RKrQ9PeqHeLgcjDYKRZTCJQxN/LHIRN
         WD1EN3dRi232Ix1yQHSX/7ZgND4Yw0bYz2hVhB2USX67Pnys9JZEEu5tHETwE9fPjjLy
         pIb0xeqLKCrX7ALPepB99shyX2KToCFVHL3OdX8236Z6qL/nA7owquXpSUJLxkHS76sM
         kuhJjz6/fp8Am6hLou61CLYfwjgR0XgG4f+WeYLa0k4T71TiM4P0I2PBcy70qyAOQ7Nd
         DMpOXdJLuJIvr2KxnQbPj+ZyhwhW+YCATlWSMZNA+06tEKKr26ERnDvepAmjw8ks88Mt
         qlhg==
X-Gm-Message-State: AFq9FYKZMTGjcQ5WzdmDPMFWbrwA/tG2ACcU7Skb6PgktPXN2p05V5tT
	yEkYML8qcZ4ghUzmXZJAmvko6oCHbEMv4lYcoFIuOHbFZaZedt19PS48ZS+9DzHsJ8JiqFPW7Jj
	6sgchtbFE4VEeKUq6YGOUa68Jk3yb438eLn/OJkKsOVcjYmJhfzUy02ddU9s2PUbwwac=
X-Gm-Gg: AYBFou3AlBV7owWAn7ozukq7jhOYi7qOR+suBcDVXXz5Kg931Abgx0wGO6/VBZmYN65
	W0GOgPqPLQn+mM6puKv+ACv+L4JlqfuwDqeLHTYAZSCPm01VLOBJM1v2vA+zj6B6zh8v2JrkqYT
	DZVUkcGlp8Y85ORhMkJmZXmPgmI+sli1GrAL2CiUA+wS7QdTWt9RwLES7g+6iPP3JLqrU2srBv9
	/8jsfG+UQmlJ2jAWg62alGGDXS9y9w6zKBK8GPKt276W4zExy7ZOzh2lwbFGS619/mbNvi3hB6+
	Z/mNlEAtt/dhcvUt1h0b5UL7yj6zqz4scHaWTVjJUxiFRH+RBH4vMlxUSLl+oH43iawsdZuJb5F
	bnDCZHhWnqsrZk3337BK0Hw==
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3641738885a.3.1792061324916;
        Thu, 15 Oct 2026 03:48:44 -0700 (PDT)
X-Received: by 2002:a05:620a:45a1:b0:939:9205:4d78 with SMTP id af79cd13be357-93ebd1ff38fmr3641734885a.3.1792061324391;
        Thu, 15 Oct 2026 03:48:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e710sm109029866b.20.2026.10.15.03.48.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:48:41 -0700 (PDT)
Message-ID: <da480a5f-ac8d-4dc7-8358-e22cbccfda52@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:48:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: sm6350-lena: Enable ADSP, CDSP &
 MPSS
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-3-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-3-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0af8d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=81bJPUnbi0zmkLSSE44A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX9LMavn+vcagP
 z/1CxEkDp1QPzroZIR0SyyMjDsMsskTBhwxv3IVosuxJLiHIC1ImPzAnO4y687hgbFjdIBiIcqP
 6V/f1ncQGVC6e/XdlzEbbPkyCNrPz7c0tyLMxbzPW+0PQcwvGhXUpl8tUlUPZf0592D2fwitaZH
 2QxRpMT4mGoWADHlKq3fsqZCOYVRMx2aC52bzXTjy3h5kxtD87VHOpfHPUvZ+xvQoGyBUKHeqjk
 T4KRqeDejK4MqlIwpBKdocN1AvHG+6/8bZ2yEFqz+2LQB9zGthLOAnbTlc6LkAMRKuDywP8U9w7
 rFa674QTM8pfGsH0zHFkrc3TqUem3UCVrdHkdCzRfaw/sAGK0+jAbaTOu5OXlDVgNEESNCA1+if
 avp5YyzBYdR9EJxiRcNVA0OtcuZRhCM5bajUaX5MQ+3gmvSqF5MLTrUI2w4mv/p2uO2Re2qRil0
 Dt4H+2PkGInDtiihv5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX3TNLD0JRuzMB
 +jwQ/EPYaw7c8fKO2oCC+Ft397VUHV/248Y0FHuVlDZcKVKNXlgPM2h0zembXwk+hS31eRayMny
 27tTx8PD6J2xFuTABtT8sINHDlu+Z3k=
X-Proofpoint-GUID: H02OxFll9Q68StOLqRKIyeazy8tlIrAx
X-Proofpoint-ORIG-GUID: H02OxFll9Q68StOLqRKIyeazy8tlIrAx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042

On 9/26/26 4:00 PM, erebion wrote:
> Enable the ADSP, CDSP and MPSS (Modem) nodes for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
