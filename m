Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF083BED38
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516048; cv=none; b=JeMT57k6brmKtHgD+xdx9rQrbACO64CdqQe7GawSbTq2Y4ZEQ9KM7ofyBTZg1ib8+T1anZhVZebWWjfWaRd9VJRKOU1yJNUe8+Tt3YMp0hIHzezpzQ8YqBXyh+geys7OZLXd1xTMKBQJQNgOuq1OPd+IkdUU35b5mFhETLV7q60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516048; c=relaxed/simple;
	bh=BSCMszIs1v1lUaezhNKG9JEUl95EoF3HTP+vL3koyoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NR72vU2UF8tAmldgWoqRDHe4mRDrjE23A+Xk2Ri7dKvHA8nzk/RvN5MUMrDiNOL5X33NIGHV8U/XoLA07TRs4cXZIDxUV+bhRNcgrNKiQFOrT7eyCS8zmJHvuBZgLSIbxUngTtrrNxjMQuvGO8etAGjL1BIhwv6xiBP+6bWFncU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TdMyxYuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MYoATRCg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdMyxYuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MYoATRCg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mqOE2292500
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 10:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=; b=TdMyxYuRIOrksRiP
	knS29FFj8adntQ2yTpJ57ECIJL8bpWaG4kiZjaiAOEp8lzoFuXP7fRWUJlUWfHLK
	xDzSvF71BwZrSzXufP//3VtGFDR/5tCNOmjd8eIevT6OIScwpeuNPIpJungXRLfI
	h5Bhp5NbXZXXZkYyBbPG2eMmNesBDp+5NvNdpGyV685hj060ia8FMtWXfoInWTTR
	5Jl17HRlpb0ik8bPFI8tdMXIKd23Qso8nsiyzMEztcaWPkdDmqOwVhv727dgIOvG
	YCIu7h/OT+hsCi501EUOIxusJXUQKX63Vtn+gtKEmI9N6o1nUlqFPaSnMFLmwbDe
	QxIuWA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp3149-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 10:00:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9006b9c3fb6so1479246d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788516045; x=1789120845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=;
        b=MYoATRCgIDQWt4lLkchfJsEgNEfPG3jT2XKW87rN+5p4V+kFzZT/R8tsltUGFbZzVH
         XOwx4zspLoxRa6Qt+3R4cWWToLdi5HQ6KrmgrcmWXtG4RM3l0ooqwwjrFtW503sC87aL
         iFGHyXJyYl4YBEkYim8OQEc8fI+1H+lgHbk6S1QH3wjn8GjR2FzZqtv2SK2mGgzfwqab
         3Rk4YOioDNq6K+Dq4UqnFX6LNdB3Mp/4c4KHLpXJpizZ2HCyHsEDbY1bIsuaRNTzfVfi
         AOFYDI3sMNjVIKAQrHUgcYcJlRdBGAlhCOCp4iyG0du0mRdhBDqAvrQkSs4+l8YA0mnl
         ig5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516045; x=1789120845;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3FWI1L6+F5ZhuT/Hl74vejQ6B+V+pxKRVgYL0yxlBDk=;
        b=jTnYuVkwRJqWZ53VuSJFf2fv3Dryb2NeAs+rNV+h8R0fHPcBd/36N9E1rXb5tGn14I
         C/S+zZnOaT7qVHe870pSUNTKI0lC5tkzBy9P9SXrZlWL0qCKuZGL5pTw/piLXJ7Zs+0N
         PgQH2p4XVWOM7oy4UE9CnjNu1JvkzG9Gz0fHZIQu8GLO7Q7+GAhaEHCouawaE8wByjFb
         YYAW+pGsxfI7KGVHX9iNMYhWeM8zdWu0D21SLDZKd0lKef/kh5ngz4CumiPk41eC/mHH
         Zv5x67DIO8l99ZRy+XgIac876tiZyW8VXAUzUCysmLdUoPhCODXi3ccitRDWA9w4noSU
         eKug==
X-Forwarded-Encrypted: i=1; AKwUvBxW4LoweYSyMEMEkMoX2pZfJxY3DPU+zSZ/Tw61lZbI9LWnuH+8OnZUfJCmdlEmlAIZ/mzXNZBNMVmcyDo=@vger.kernel.org
X-Gm-Message-State: AFuF++nyBGbjaF6XJ3QmllVmcirYNhpxoh/RTLq+bAyEfsJco+ll/u3i
	zENmhPLaiS6IQDj5mkE6Apc1+QBoVSSiuxRW53kqkEtGjteQH8pa5GwCSn7ZBASaR7CmxeJLCi4
	/UuS2A/Re5rIUpb8rN2FSg+xa8PIjl3p2RVjdce87frPQx0BPmdL1ZPVKFFRXadziuBQ=
X-Gm-Gg: AYBFou2+YbOTChwsclE4G2yoztCFt7nzoCtIL/p10GNdwhimjU5xGHzvZt9kXz5vBgq
	1dab0ma+PK9y1e1lVCwiUyjKWladdwCPAMH+PoLIWicL2vTGtYMsy2pWQ0jWwt8qKStnHjSgYE+
	PArwbrucHuBfnpuVoX7H65FdrSGyR+OddwS11c1lFmqoKHRg8ztP6Lb+/fQqOeugcB2U0dgz4zf
	nbrA8TCSpfEMCwu4q2FwW+HcOCPVKITALYCAAEIT6cn4cJ3QcVBOmVsjX2sWzjVHMZjgO8BFGXo
	VWMm5c6Iq2106/2bHVea/7izwmMrmhed+iwc90CurY7tqJWnenyxERuSDkX/j79TZN7Xg5Fdp74
	T5Gqh3nnk+qGXTtNCAMEmbA==
X-Received: by 2002:a05:620a:2803:b0:92e:6485:f640 with SMTP id af79cd13be357-939806bf77amr309601585a.4.1788516044928;
        Fri, 04 Sep 2026 03:00:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2803:b0:92e:6485:f640 with SMTP id af79cd13be357-939806bf77amr309594885a.4.1788516044198;
        Fri, 04 Sep 2026 03:00:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036469sm87942566b.1.2026.09.04.03.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 03:00:43 -0700 (PDT)
Message-ID: <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 12:00:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OEtNzevtfIkiUfv6N1sFL_ulKwfL7WKA
X-Proofpoint-GUID: OEtNzevtfIkiUfv6N1sFL_ulKwfL7WKA
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9a96cd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NRDhda5j7NX4QdZI1lEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX+cFNPnoYJ5UY
 ot4oqa3UZNiOMEkCiGcXlXFQKim+U+NHBaxmMxxmquIeoXbjWwyRo+EVJnr+q6bVMP46IYARo6+
 8+yl6OWMuA2ayTuNTecqYVy0bkgZ4Nvp5oBBIgsGdPXce0kA5r73arNmNvit5KAU6Y5IwR34y3E
 GSrJoQx1yVDVdqsU4pjMrM23H54NPu2Jx/Rwp4zhdmrFRNenwAzHCMTPUbWDs8YMaR4M0du4iMn
 WqB/xElNyO/PySstC7YkvsSn7ZgCRDeZKnxS7Smtdvhzv69UcZ2uni3kJWn99j6C8ETPBFTDuoB
 U2gUd6EUoL6obollPwqOqTrx1DoNjHg5BT0eYvfMzPNd+5B9yyV179K+PeWnXi3iNVDQBJRmrNx
 l8j3/8VNEr1jKlChENeddA2NWoJXgJ4ElgMw4suCncpSXlAFnP7voxngvardk9XsDxOLvnY/aZj
 fw+7hqfL2qa5kEhKvMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfXyt3kQndEKyvM
 r28YPvCvVTPUGWsokQBsgLwainjLdnEqAx9bUnUBx6G1qkqk9OC4k8a72+Idr0f4WkNM5yuzhHT
 Z+gJMvByW0fD71v0thBGUrcVZr5cuXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040089

On 9/4/26 10:16 AM, Shawn Guo wrote:
> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> initial device tree for the Nord Ride Embedded board.
> 
> Tested on next-20260903
> 
> Dependencies:
> - NMXC define: commit e484a765f543 ("dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index")
>   from git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git dt
> - Base DTS: https://lore.kernel.org/all/20260903140617.441111-1-shengchao.guo@oss.qualcomm.com/
> - PMAU0102 MFD: https://lore.kernel.org/all/20260830034719.140213-1-shengchao.guo@oss.qualcomm.com/
> - PMAU0102 thermal: https://lore.kernel.org/all/20260830101025.191697-1-shengchao.guo@oss.qualcomm.com/
> - PMM8654AU RTC: https://lore.kernel.org/all/20260904074541.590485-1-shengchao.guo@oss.qualcomm.com/
> 
> Changes for v2:
> - Align PMIC comments in nord-ride-embedded.dts with nord-rrd.dts
> - Drop unneeded regulator-always-on and regulator-boot-on from RPMh
>   regulators

It still remains on something like 40% of the defined regulators
without any nearby comment justifying that - are all of these
intentional and necessary?

Konrad
