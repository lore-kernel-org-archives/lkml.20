Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228395;
	b=kVyLWwWAMWA9QwDH+8r3tcUiJIzhXvAzLif7P+Bowt8JoKp9PCEgLylymZ3VyKVVoKz2
	 BAopaC/uVPPK5FOMa/JHAioG07gU/2jIiigurC5FVFTY2h/vfQVMs+Sj8UexJOajtJHTY
	 UnJ24qgfh38fXipC4e4+OjUdKmhxT7QkxPddR0nE2SgMJIxLY2+nTqFizznFiabmmAv3O
	 U7G+hxhuFy6G0ug6r3oxqrn/eWWvoRzaeZMrym/Oa/Xrz3ZDJZV2eSsGhr3UW0CSAEZU0
	 W4MPmeN+V1/y49YVdxTsxlie0YzywSCMvs9Er9Av2c12xooTH9wDF7Iqdj5PMerD4AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
	b=pFkWAz4dvHS4w27g2TBMzx3yszwkWJVEsUyinmfeRKSlV89PBnV4mvbUn+KZTvRrKnzm
	 E80HWq2beRPtzX2hlaHaNWTuWXjBGbZgtg6fQJZ8V+FW9McV/bt0uGcKzWMOOXuLoftDL
	 DHkIWl99BukfC6iKYHSrSIVj/Zsba1TRxEw81xxiIvgkyeJCjKYR+N+9Iwd67aBeYSxMB
	 0DN24CDIMc/59i5xlfu4+swWev8VJfbXgGxE2xJZrJojxC/uefRh8szqhXwfsLKRIaKNg
	 Lx6YgRHpeP1igG/w/Gyjnyfv7E4ZxbLMCOPezZpGx5+nNhN/0OYwFh+/i9ppTvUJ2DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RomvDkRx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyCacWf6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0BB606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF0BB606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RomvDkRx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jyCacWf6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9CEUi43331843
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 12:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y2DrjEQhS2plkSy9Rd6l6RNy
	JAVrhDy3SRTeWurwWbA=; b=RomvDkRx5seqh3RBtVKxeSElUiTNUWGZRFrSS3EK
	YoOV3nhMHX6VByKAcP3tIYHQanrVkWHqOd6VvTuZIC9ypoApv5IuoZaYDOrOiM5a
	MVcF4O8d26Jx5um7DR5RzHKpdkbZzm8vSB/ocSUajzALuUxmKTtTTxbivPKwFBb/
	R/W5R1YAOMNNbENJuWBmNCums9L4H3IwLTJr7f2VMfWaUv4rHMCIQhTWcbLKgYhS
	FOQ6GJDPv7ZWj7Kv+Cb9JA5hbo6wdwS5aehNeQE2VBg7SVqDDFtoi+Lm23/ojvgG
	Kz+rzV6gMGdDr35CaFXafAPShlWb/I+0oGT9uLoUmVsh5Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rr3nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:46:33 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98304865f02so726658241.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228393; x=1794833193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
        b=jyCacWf6sPhjmyJzdPBLDaxJZ/q2Ae4rKzLj4KSmyzJKNP9H5ASsmF3VcFONHFb5bx
         EkSBc+4tJ+8zjqCIe8aNeNWRTtVU3yuC0CFOb0kVnmRwbEVtZ7iOTY3Jec2VzLlcAm+H
         UxmkQPqoeMWB5/WhDTWWSECqoe/MzXZp1LdTab+ceaVcnTsMlWSstIpg/ZjK/WPbiLn0
         uag51yU5WKaF7K4pADG7fFOo7i7BeNbiN1J6f4MvDx9WdgKDdQUf/gpNGk9BBsPKLLhW
         VFqEjmLFJjasBLv3ADz4veA3lxueroTrHeRHQwoA4vJhvF6o/i+fGr8dAKIhLN3wYR5p
         midA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228393; x=1794833193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2DrjEQhS2plkSy9Rd6l6RNyJAVrhDy3SRTeWurwWbA=;
        b=KQv4jf+MpvboT08/K7mCtBD2VGYwbntrSB4bSDdE4+VoWg8R3UcH6E9QI4hHgzMvV3
         qaQXShlnyXkLas3j0CDXzfOvpZ9mI93MLYdvBQMlBABUJJlR3KHsxKc6VXqafUjd3fAt
         T7vfYDbdE4EC2v/hDe6gBt0Ifa/izWgGq9btljMylTBftbyqzmVyowMDaCBMgU26zpMA
         dC16i65/vQEHw3IUK66FaIOsRbE+dd8boPpMRBreKi79iT9PkDLcoh9q5agoi6XFUw7S
         FETGVF1/uHLvNEHBQdkw07BsE+Cbvn1bHKXwemKK0pQyKZnN5IQfC6necr3TycCVnnX0
         vorw==
X-Forwarded-Encrypted: i=1; AL+hErHTJ2lGvKAdPR2ZnerjRYHTVUjRhWhkoEZCfcI98j3Iu8hv7iVa7EcNLf7mEffS8feOzlkBG0ixLWlMhCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jb0TMgu66ftOY3k1Rjo3iCKFPHrZL4CMXQ15Cy56tq8MFtDy1
	4HCo/gUhl8A2oeshguMRM+1S9j7UYWiwvs6A92l0rQ0ZDGyEIqByS9CLXPdqOPIZDQlPc/swMo6
	bKN6RAPA6Fe3rocztXCNseVFVVpq3LPkNJspjtZUoseUI81VhhZMNpBCUTPuz6YspQ/8=
X-Gm-Gg: AYBFou0yqvC3ZtRUzM0hCp752K4yG8c72aWd7ctqWe7cZ32+3nd8COwn/q02Uty8HvV
	98qqIG4XpdcL/tgAbgXGRLn2yiEUbtjeJXteecLzjGlZ2pKkC8uCxsutaVppT9robaq0InJaflo
	Qfhh14Fig4R0bIS6570w0Mxtcd6g06rYZmrp7wyan+JK2QhXrswD0IfBVVUGJ3M+D0z9e2Ho/BB
	kmv33tjvvuyzaFCzHCa0Sq9/k+59ZgFZkew+XSDinL4Pk6MEGruCIMsbi3ohs58nwEuOjLifMRE
	tR3NxgAsnp1g9jI4ePVWQrjK4fPw1CvBQttbLnwXbbPeCp8bMkVOJG/HebzHngDrKA7pfzUPiOo
	5A2e/OKjoVe0KUehoIwWXKdXc4P5j7lqKxwCtdz0poiO3ZsesAma7PVMRXAKYnrg=
X-Received: by 2002:a05:6102:83d9:b0:7d2:8dd0:2ed with SMTP id ada2fe7eead31-7d2daf1bf52mr1009714137.10.1794228392901;
        Mon, 09 Nov 2026 04:46:32 -0800 (PST)
X-Received: by 2002:a05:6102:83d9:b0:7d2:8dd0:2ed with SMTP id ada2fe7eead31-7d2daf1bf52mr1009708137.10.1794228392284;
        Mon, 09 Nov 2026 04:46:32 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597e0097dsm9855429f8f.57.2026.11.09.04.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:46:31 -0800 (PST)
Date: Mon, 9 Nov 2026 14:46:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] arm64: dts: qcom: sdm845-samsung-starqltechn:
 Update panel compatible
Message-ID: <lr67aes7lfunacwf64sorfvuqgqshsmsg72kwebwq7ol5rt7q3@b6vmojxbaobs>
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
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
In-Reply-To: <20261108-crosshatch-panel-v3-8-87dd4ec4f7cc@ixit.cz>
X-Proofpoint-GUID: GM0IG23BqJj5n-RDeRg3Gsa0Ku1_wWS7
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1c0a9 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=aFgLPouUvLL-lAFSJXcA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX6dQwmLmikPEK
 XHEvNavPnxwxsdWaSyAWn9cJzYHOjJBpRXbuxrHjy6eXRuSLvnn817HR4cP4a8wh0v2flzWNNhw
 RUP83fQ+DjB0qJzy8bDM016WH3WLv5+COvEWGKHHCo1Fa3sr6W8kqMLBc0bU6voUxZEpx29otTc
 NK06gvkYhNMZMd78TR7hm5jqWMvPl56yQUnIJDJ5Jx3Qt3CZBA0m8YO8Nll8W6V+8g+eezpJ7gv
 fmxiqr8rV6E6S34hSODM1qDPfELg8ZAZjACATD1Dbeubob+3Jw9ASAgjWxgEg+0952rPMMt0bho
 EdkwXvCnN+8b0LyaTfi6UCtqylMp4OgYuBLKHkOr62m/7mAJxPpLMy/G0iu6WyGxVktRcR4zDNB
 fvgly5rrUQhP9boCTsNR3Zx9e8RzfV2gFRxG75I3k1tXINsEJgppezuCE+q5rAjne1pEHvYBH4N
 fmD/gKPT3aQjhc5lMTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX/4UyIc4Q6H3Y
 QtecEUxwU5uxtbfeTxG6AOG9rnT1UgjFxuyazdiraw8ofgHkYlAAXkqGs1x04oaGTMZa5JtRiiD
 +vmuIrnzdonrkLsPNRzYceHdEz1Xr9M=
X-Proofpoint-ORIG-GUID: GM0IG23BqJj5n-RDeRg3Gsa0Ku1_wWS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

On 26-11-08 12:32:29, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMB577PX01), which we have no way to detect.
> 
> New compatible allows without breaking ABI fixing the inverted reset.
> 
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
