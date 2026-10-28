Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201293;
	b=lyYy8ww7y0iOin6McH1VqhKEIeM87MAbiwAyQ/t6eljgV7lfzsrQv+Kr91XmNl56C+7o
	 kLcMKeDpJhuzsq6H/1uIsmgNO/cMvGZ/QEYgZQohNr+3d7L2CtpyHJBju1FO7qzNz74wx
	 89yYuhstMbabTRW3nM8nRRgkQMGdPhY9yNHPq9UfI+Vrt5sQomBz938eJ3VTzqfS7Ez9A
	 eGScxnr1aSFCx67Q7iRtHiZOTomB9BRPMRDbQQmMqzgjXGWBEDdjvAtrpryO+3cQQdR0Q
	 l2O1UBfyXsEuGznrNJKMMnXZvCX0PmtiAUcmgASJjuUN/taHhzMVpmXvu3sLUdCiraw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
	b=4nIT1JiQ4PJKz0fYN3suIT06Qwrz14Rf1ALwkvxE0+OimymPI6MFf46MRV2nhPHoJ5e5
	 ydSn4/HdyODFsau/RBdAKjfah6Hhd23xkDoHaJ0dRgWSXici5mFpNfmS0YeHpQKi7aEbN
	 LT9yqpjGgV6eMuaiJoTA50zruxy+muLs2ZJtLy/Y7Xrn9RdlCX7OXoUYNE3UxcLZG40uG
	 GLslngumWm8n/8UzkWwqpuIqXH1gu44qDE7LB+w9/jHdiBAUdgvVye686WGGE4ejLLo0O
	 ak+Mn4Zm6AL5zE846qp1NJhop1cI0p7CGFtXszC4flZsMqMCYG5MU+RvHeGH20XlOTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlQ5B+eE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2LUuQKR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D9606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D6D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlQ5B+eE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U2LUuQKR
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4Xf600113
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tpa+XQp0QDFpzE7hdPD++YKP
	Oso0isNfYovif6itICc=; b=mlQ5B+eEc7Dzq5a66JgUvlZj/cQNxd4cC18+XRSW
	2c5i/zV2QFyO8Xa7hIhJiaYpvp6eBsES4ePVEU8DznupN1OTdBf6CGQ9HFMVL1nt
	CQnG2t9D0nkwT+dET8JjAfy9n1e9+6/H5f7e2uG/7L7z489cZKaKRNcnwNQdI3pf
	tjLSuAYkP/S8BqIbPIwM+HN1FFr50yUfIAN0dNUaKxudRAyKooFM7nmUHwPHQx09
	jmslFQc+gSN7fUGEHNnXTE+mgAW5uP/XA2t5p7elt4nGKl+tb36KcksFMae6ddqt
	8nP20cFo0iNzRrl1A+3hApOjNIlrRiQjiuS9IQVIKMbALg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f93677-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:28:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf71bbf197so20950137.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201291; x=1793806091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
        b=U2LUuQKRJFlcHzgU2KMgH6TXXkKcGCqVHmWizh7oDkOHpXGZ0sI+mqkd2HkRhBF+LK
         m0GCfSatrQIVYFpCuKkL+Po6hKs2RtTfd1+3sibKRNEbe5WXSBqCWOFBxVb5gOck9w/j
         0LwpDw7wrnZE6R2BA8fm9MzHPl/pXpCwlbaG2OiNFwylH/rzs7/4EhHwfys65XgAYodi
         Qw5Kx/ETmMgEywOHXC6McRtfzayzpHMC4UzQE97JGxClEEeYXOwm6wgKRHt7ZvXSAYNK
         xGhRoBatds5Wo+fQvuHyBGieOTJlWS46j8y8Oj+HQgEyfqFcwJsXRuCbc0Z6L0i+33Pt
         ipsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201291; x=1793806091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpa+XQp0QDFpzE7hdPD++YKPOso0isNfYovif6itICc=;
        b=hqBZ29lVNYp0n0qD5Db4HJcQnb7/DSlqgMh7cyUl+1BVGsxchM1L5qnskZX5FsM6Oh
         sWAl36WXjGUF+tNimoyZSLJqKcjWXBInVsKAAbP3arYRH+pYW+QEfIQ+sf75arGnD0gq
         HFotvjpLvqeD3xUCScQK+EmmPyE3KVnOC/2CK7a6QMqSNnF3I09aWM+6ty9HZLn+CEJF
         eGzwe7O8sPHMhrm+qaJkWg09xPhV26nxq5J7xMR7kth0hFj7z+krp+nZTXthSHOcKbNH
         cDwD1l0apS7DPLR2SZR2pb9EDjJuXcx5cBav0XWkI2HEgOWQOssr60s7icjWfnoMN73G
         /ucw==
X-Forwarded-Encrypted: i=1; AKwUvBxygSsrNZtnREcGkYUNN+AYaaPTZf+To4KLiHyH1q1ZZDmkxjftUFlq/q64T7OORdcy0Dio5ObYRbbLc1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg/7OlT577xfl2RPd54XY+DV5wy+zsELwLY4D7DFeuAZ+R4UUH
	C32gb+uHfM/6xuiiYH0NKw/VIdVAiI4bKkqKMlSS/5A3q0A/yPbCFtwHpCEMhmVTHi+Dz/VTrPE
	UC3gDL6PHrexWMKCpf7AoJnmuQN1INqV87GqHsCZoTiRXxoDrOxfZvnnDe1jtIsTWejQ=
X-Gm-Gg: AYBFou2vVMcA7EUJmx6i4weF6h+FYnQiXZFZpTgiy8R45scsePsb9zuQn4fBJ1gmpUe
	VUQL6Twfz2IFXCz/c85TPvRrwT218y1IjCFWK6bTrEizJrGXcF685vjjp01bTxMZjc3XosTxS3C
	yI1eJDGulr+SPbli9pA1buvYISwPWXAaukQ6Hz64b0wwe+Kooxfu5LOcbTFe3Ttvs/TaE14TLz5
	FKw9eSjMaG9mKi83aAjyuT1ZnKNPhrkT49UHEnCDIg8jVTdJDC7B1ez885yGCNIHyHY8K/hr5hz
	wN9mi7OYPL388BiIFDYRfqSmFWU+WBkSjGVWBm17iPd86gg4o5xWdxZxhxhCCGkB/s8nMp38Rem
	1UYZrlCbpB/sANw9aYw/3CY4bw0tU7GnCXU0HJQKUhN9xl//UY89LUXX92muXvENq4w==
X-Received: by 2002:a05:6102:149a:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d03a59fea6mr1496678137.36.1793201290593;
        Wed, 28 Oct 2026 08:28:10 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d03a59fea6mr1496628137.36.1793201289890;
        Wed, 28 Oct 2026 08:28:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f322c46sm54505e9.2.2026.10.28.08.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:28:09 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:28:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v23 12/15] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
Message-ID: <5uovgjoe7w5z5equxekkmcnqhlmoi4ruuykea3mel63eyyxh2h@ovvzdwu3hfjz>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-kaanapali-camss-v23-12-95f250b18612@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae2148b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4HpnP7yKktpVlNN_chcA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX0tafVfu32UtH
 3nSY/lWujtQC1vaufCxvCHTBv+QZrIvn3cso39I1qS62doKpROGfrxwQR3FgdKtzAuCO0KTrb/4
 KrcV4CpvAIiiBpFLZX6oJ50w6r+ug+I=
X-Proofpoint-GUID: FcvDAcvGW3KEmpX-vSZvmZ6H8EHbChNH
X-Proofpoint-ORIG-GUID: FcvDAcvGW3KEmpX-vSZvmZ6H8EHbChNH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX65/5KXb8o6Mq
 Qv6kqSzBykPUzAIF43zStD8BSgfIH+uHWg2+A+uU9IxG3do7nMUdWgFWJdBYQ0yUDvdnVTwiWrs
 rQnQlfzoAr3gWkt72ZjkwaohMr35rVTQX/8BynjrWdo8gYnXyH+Ef8WL8GuIWK758APej1dwXe9
 CZJGTkDSG6koBtrHUijaR16LHhq0ZtBrNYU7gGGHElk4uxOC4h8hp3xlkolqXG82gchnU0DDNmE
 WdAuZZf3Ij/y+pzcbAu4CLLmlQ/vHBCfh8dMR9xCbClV1XXEkW0nP75IBMCGzeBniWN5YjwU+ui
 JP6xfbxlHbXwEgaeRZsRPJdV0/Cuub8YSBnbw6W6FvI/1ogVl7izRDl6AOSr9IPVWh3pkdaiCdU
 f4SFyT6FzIz7z9mRTb4BRGbbRl55CHwW8IANdA+b3z6P5mfQGTDYQ+xJcqvkcULAhuenVS5vOss
 WT6Np/iCYCD80QFErBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:46, Hangxiang Ma wrote:
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelines
> can be enabled by board device trees.
> 
> The camera subsystem contains:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
