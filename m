Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866499;
	b=22AncZxbL+g32F7OUHZdR1qyuTF+nJAiB1s16+SUadlwhbo8HNQ/+OWtxEt1KxD9BRvF
	 VyJSKiQ9MsZTwkeJKPEtIkZUWQzaigXe7z8R1MBCKKDVKORhnuV7gtbP7Ys4JzLFtZYXn
	 Y287G659HfEZSSKe4QRrw2yRiZgwC28BBA2aZU3DJGfZiKeMEmix+1uGnOuKKYz7PRZdE
	 McpnsmUzJnQ7vByHqV0JzLbMH61x2AtXPoQTDqpVJ3FSTqxpcs3IL+xh6Bm4pzkTb2o3V
	 eMLysyJUgi6g3BiM3TZX051EEV9Dwctjcea3+fM6skuBVzLX5Va7OC2SZp8WExyExhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CNclkriunYbBMaVdIXTN6SL9vtukgwN4y6FMbEyV2KM=;
	b=Suc+1fE03VnSc4VCSHn8LXgEwg2hXhQk7zLY5qszIN20cfVeHEaIKvCstqq/LVPIS00h
	 3sX30275zAnTddW+Ie02TTLq+LwlPTGGalM+IzM3laPEG+SJ2TDNfz2SgWeoG/6x4heH+
	 tqKvJwkC7/gWI3qM0h5APiD6QfOBlF33p8B8fsNDrtLsI3JYm3IFZ+aVqwEa2VnOUDzEN
	 0Iayro6/hvoMsXTUyLh5VBHvLUPtnh77rbQMbbSQCkUmJSXkIYTwBDwjr84arn7dQtzxO
	 zAmspRnHk5+3buPJd9XPq44mmNDrfxxx4HUnr8dDnR/WG5lPtwVtH0mW+esM0VyJCbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j77L8QPK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1FBryIY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C1606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 983C1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j77L8QPK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R1FBryIY
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UbPI595394
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNclkriunYbBMaVdIXTN6SL9vtukgwN4y6FMbEyV2KM=; b=j77L8QPKWZBQ+jZ1
	K8Btva8ICOlPOodpHLv4RKpgwyePhZRn+zZizN9rDvlunq533kw5NK+baUNrpaTw
	XK2xXF/FJfDqIS/uHxgblKfJQyKenikPMofnghGau4ED6zfHd+w1vLAlbZPA+tpn
	KVQiLJAyrsnOZaqh5jfgjxAW8pRJ60UcAnuBnAaIeDiyynLO4/VT4aGSxQxZ2hRU
	8KGehbPJU8lnW6XuOKmsmknMr/eq2BdVUbsvCuEuFBCMy8pPw+J3TnnO5uEcIV8o
	pp+v5LicooMtD5U3luCR06m7sdbaur9psqVgs0Vdhd6OiTt45gaFSZbeqVPB3rcx
	PbkHvg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3dg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:14:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91e7c9ca738so3606246d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866497; x=1794471297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNclkriunYbBMaVdIXTN6SL9vtukgwN4y6FMbEyV2KM=;
        b=R1FBryIYs0ICPItE8MiJatJT92Zw0SuQATdhTmE0LbBphFdwCBSue1twZIev6yKyLL
         AW+uQMleTJHTo2n0DdEk1UIftx07tR5Fm73ORe4Bdob9nD+fGUfjX9QZRSZlHoURa4D6
         ZzhoeyHlKnRq8KxbFgYCsrssI4hMQyt0Ie3hzdCehyAcSDexBTReEhZxUTECXnNz4okL
         1cYZXNxxH5F5b3CFx/AMQn3coaaS5YJHjLD0K2Zl+wP900M41vJ2C9CagforW927K2ZN
         d7JTcWazVyicV/nDGdXEeVcvxGfdnuPlE0mpi5LhhSKmeNfRkdsVitkHLbKAocBrQe/m
         oqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866497; x=1794471297;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNclkriunYbBMaVdIXTN6SL9vtukgwN4y6FMbEyV2KM=;
        b=ijJqezDTabA32LKIGVenDrF8KpIELrEyUTffMx/RPEwa6CmgcyUsJv4Czn5ykrtbHN
         Ql8AsdDROlULwkJ+GfqzLvyqwtmqgl1+mZVN7f/OyaoaHLEoX293FVvNVVpdWx20nJTq
         RFT4VTe3uZObwPmMeucFMxhnESIZoK7DNe5F7/k4O33jRCalotf51JG+bXmvy0CUTjB3
         Mw8XBedKQmtIcMOvb/nUzeZ+p+gKLnwghGey50xfX0OzmuPuAtxvJ65RJnp+SQJdazWr
         StgUmNeoy3nxbuCFGMstGC5lmeTbfHo86ZLus+d5w5F/5OmDTBWSWPGxxvsqEdT8FD2w
         uqeg==
X-Forwarded-Encrypted: i=1; AKwUvBw8CJj7hvDPLEnKZ1I7vE9eyk9cj84A/m+o+XjSjoV31WigrH+DHc9SltztQ2Es1zOl5i1m1ts/djUbceI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Hu2rwazO7kr7Txy88gj3mST7RMV4lBu5ll+GL+zcpDwCG3eP3
	ZgwqI0I6zIm5peNLEfujRALJQTZAM2fXo28VXLs5tmI4wpuukQgh9IGg6jMmQyesUZJuOFQUdnR
	CbbHhEDXMMyrP2Q+vicO0TyyiDH3r4Rezh7BQDyu3BME1kW1mB6RFUgtAzrtxlvhRDpk=
X-Gm-Gg: AYBFou150kzxj8HJFtv2PDBL6+26ro/Wvpz+tYjTlxY8BzMmFywalFmGd6raIsHs2kT
	rvwdhNvX5d8GE6+hxMfQi5sjJmUcNykD1sJkejDYVVOky1k45QDg9tL0Xe/a8Rr5YR+nKgz3/ct
	flYGqQTQQuU24tEOb/egLq1KsBq3joI6LD0JREy/l/LHQ0n8AVSMCLNQj2fLpBFV73xDq4m5jv2
	DND7qIGnUMlDn7iPHbowjOznIO+ZXiOjIcKUjsVoIzIfM3dEsuQjpxR/LJ4Ah3UhvyaxaEHfVCj
	7dkKhRKZko9WUxqf7VnTjU732v+GWLS7lW/f2meMvBr3KdnBsJcRfKjB4p85zZbaM06iXbhqzKu
	t2/rI83/neCeSkRUU00JzYKYdDjcG8Cea0WtUn4m5YlachRdfInOnYY3V1TGmtfzyZCFB
X-Received: by 2002:a05:6214:5913:b0:91e:94a2:f994 with SMTP id 6a1803df08f44-91e94a312bemr42645056d6.1.1793866496613;
        Thu, 05 Nov 2026 00:14:56 -0800 (PST)
X-Received: by 2002:a05:6214:5913:b0:91e:94a2:f994 with SMTP id 6a1803df08f44-91e94a312bemr42644466d6.1.1793866495886;
        Thu, 05 Nov 2026 00:14:55 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e44650bsm149681966b.43.2026.11.05.00.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:14:54 -0800 (PST)
Message-ID: <54b22ec7-f763-4f89-a711-c6c6796550cf@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:14:52 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] backlight: qcom-wled: Check for auto-detection
 callback in wled_ovp_irq_handler()
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Kiran Gunda <quic_kgunda@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261104183935.1214630-1-lee@kernel.org>
 <20261104183935.1214630-6-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104183935.1214630-6-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec3b01 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EwSOXpY8fmkhG1aJMgAA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXw0JLXFd7ohdA
 olKjTI5AmZeb4Euba/VSFyqt87osA8Jah+hXkEOW2YzanCMjXj4rR40/oYj9UbLXv7KwHhxykle
 gCN9xTvxfl2QRMCxLiT9ii1a9Ev5Kso=
X-Proofpoint-ORIG-GUID: cyC8nhrPKO5uTUYo5pA5MnQnUUMdlf40
X-Proofpoint-GUID: cyC8nhrPKO5uTUYo5pA5MnQnUUMdlf40
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX49+DzWoOMTFm
 uulaImg4Qd4F0w+SSdDpMEfQjmgLB/+IQOOIeJDijgECZkz5DpQiAyvIwlhM/eS1zfuQgsDcMMP
 2md/kKH15nP+kyPzGH5juH6wu5J89hY/q3tIprNNID5C/5yIGUqlZ4eiQCRrv003sH1GH4dSPt3
 +X8MOtKM/XSeLzvMchvHYDDpGf+QKCSLnLP8SEId2jfr/lmWMrivpC+2G82u82ll58xVDC/Q+bT
 e1HSGnmnklvKhXBX/BYosayDrPMSqAopMqhULvy53Y179YBqWvuiZsT2RAiJLeC8BF2V6tQB4Ht
 khOFpNPl8F9IYRlrlF4fzjcNqI+TF6gNgVUMvztfJeWS2lx5Ez4JxybDuzxZEC1agiYVfkBqPvN
 NVbQoGhZ2XZzn75H5ZlK/xAgAtsLNxUgcbKqCxF7nHpSrlPr6atgvzPAGPzBUq7pubc0ZTrfVSi
 DQf4QkobML8gYz6fwqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032

On 11/4/26 7:39 PM, Lee Jones wrote:
> The wled_auto_detection_required callback is only populated for WLED4
> and WLED5 hardware, remaining NULL on WLED3 (where automatic string
> detection is not supported).
> 
> However, wled_configure_ovp_irq() still registers wled_ovp_irq_handler()
> on WLED3 when an "ovp" interrupt is present in the Device Tree.  If an
> OVP fault interrupt fires on WLED3, wled_ovp_irq_handler()
> unconditionally invokes wled->wled_auto_detection_required(), causing a
> NULL pointer dereference.
> 
> Verify that wled->wled_auto_detection_required is non-NULL before
> invoking it in wled_ovp_irq_handler().
> 
> Fixes: f16899a6a7d4 ("backlight: qcom-wled: Add callback functions")
> Closes: https://sashiko.dev/#/bug/linux-d3eba287-2af9-43fb-851f-78ab3df0f35b
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
