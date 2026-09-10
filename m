Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB73B3C13EE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031659; cv=none; b=MdgvEiUbPFvHLvw9EpS590bEQCksLh340PAaTZqfmt63PSvJpFZcYcRiblAJoMXtI8qYew1TReNXQUATxNWqVEGol1mm3thN9ezl5Efh4YjLdqVoKxNvpp79DYQvvaiN4Xe5aQkDYxNV4W/xZI5B3cfUaXljXLC2hBDmEIZPL7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031659; c=relaxed/simple;
	bh=uz3+dbHiRpA4SmEev1MoA+xkH76vDdpFXNkBjQmuEXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7oU5mwk7olwjXBU7Z7Z9QOc1XeK95TRNF8TM57v/8Xd0qje4iInDOySEVkflngPZa3TRYtieSvmKpBcGFkNw6lGS+OddePVT48U4rw6Ci+OqMIXPFNHYrDpmIn6DE0QA4PP7klrPcBP4QgrsuUmUVjvR4Z3XIKnr46L4e0Oh+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dtF8thMf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8WH7hVs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dtF8thMf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8WH7hVs"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8qKpW801037
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x29jloLgP0YelbdO7EGD9HU/Hh+3V7Mt9Ty36rmYRQ0=; b=dtF8thMfsxOo25GX
	v8S5lXXxFqcDX1IckYrs6H/kb/uOc91obpg2m2ybUA0NC1zNUV5jQ8WyN0nRqDjF
	2+Kxlb/J3DjRzzeBxxA8vHR9UhTzW+YfWG6ZOR3oAHhOU8jDkA9KblWF7JfUDm3H
	ysG67AyX0iKt+JD1MtFgxMZ1FrUX/ub+ktq68Q8ZEpbXzWWXGCOE1ljAuPH3+8Uq
	aZS5xpPnAGMnXUHBstfKZ36JAXh7Mz72onjttNTk9+WDHSB4c+K9WDjaUMikgapn
	DgVwCDdt1T4nKgE42leVflmzbG5knlzyxosf5zcR+vPWlw4yOB+bqGY+YyRefdsO
	c/v8AA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrcjrbrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:14:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so97592585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031651; x=1789636451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x29jloLgP0YelbdO7EGD9HU/Hh+3V7Mt9Ty36rmYRQ0=;
        b=b8WH7hVsgPZOAv6S554hzCOJ5cKVsJ3WLT9rrZA/3hmi+nU3TH9a3mHNSwYiQtCPYI
         6E4flNtiHEwcw48NXj/Ogk9tGyw6wUI64DgUiAfUldzpnJd5+kZ6kpJQBo08dSK4+g+Q
         f7B7aFnT201IKaOrvs3xz7EIu1fGnFol9MZMP+XrBDhT8qfFLtqPVebB4baB8IclokHX
         jp9+2h84vW8lTiBegJgECU3eQSTwSsYYU1WlXNgZm57q43XWUBM+iZZHeXOqJ8ndMSMl
         KeloNZsnIs71uRnohNsM3kw+YxG6JKoTcKmEtZrheEcTVLSDUZpiSBkISHq52ptPRtVS
         tB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031651; x=1789636451;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x29jloLgP0YelbdO7EGD9HU/Hh+3V7Mt9Ty36rmYRQ0=;
        b=gXW1NbfCVUVj8VRy8iXv2OWwdS8nGFwMFiDSLmhm9ldPOyiSifmwsmczx5PW2BW2qG
         hbjbHsnT75zrwP9ltbSs2VDWkHT974ooWsab5bMJv2rno9fi9tzl7kTGcJdm7YgIWRKW
         VFzFHKefmQ+K8h9jU3KUR4j61zri4KF/haSSn8FINFYIP/WE7xUPMEGzBhAhm1cX0r5u
         wfgnrUsRDo/s1evNDU2xUOEbga3NEUp4xyuY/5IPvnKSFXKPE74NNJuRglyZEO2zdBHq
         xyuSjG1mOEdKzTR44Ssq7FAHyfTRC6XwNnSXt2o+eGAk7eVnEuYHVHe+RfEHnmsJaHjt
         IMvg==
X-Forwarded-Encrypted: i=1; AKwUvBwSHYr6fFDgxE9eoONVTU/GI4BqMKENoqoNPnwNDpIf1C+FIMjMbd+Ig1FbT8pmu3S6f70SK3vIye0x0y4=@vger.kernel.org
X-Gm-Message-State: AFuF++lm/QYqgMgf6VjMLZ749eRmFCQTqh8QqkeqG+jfBHJejDyQXR0O
	YVoojao/INoInK4+LOwFcoblcvneyQ/ts1GDkGOslc6fId34o69Lrp27mLENFb/YmHYCPFrz1Q2
	b6rtXXz8N0IXJzHyvMnLgueP3bhLB+rgLj3vypv+uqR/T2uDgEpLuaFHZJHv/d22Eh4Y=
X-Gm-Gg: AYBFou2gAdYK1/Yw4ATljIErRTkaMPj7FVsMWs/NQWBi4heq+9vn16IAuGrdjhyEuMv
	dfwdyA2lSwUE8oGFACGGLTclSIOQTOj4EW73+Bi293PQeBM29aKLMt4aB3jc9i4fAbHRYXa2+f8
	3gmTNthBxpIgosg62A03xJtOqcM8VDnF59sgcOg/OSmJuzZ8AJ0QQsCuqv4QRpb1cwPtM3rF2Bq
	DQ6K726QJ57AHNB87gQtX3N6ZLG9YnON6PeUqQwwboaJeUY9MQfnMAfH9s+gCALq7+2xRyqVfgL
	/K96wnjZitBO6cHw2UtfflJlTjt4wAxZI0tdDZ/sS/tgwiUTZaIkCb7ribrOpNqEFBDUakB2eEO
	zKU+ug6WhW+JeUo6Apt01pQ==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr3169496985a.1.1789031651415;
        Thu, 10 Sep 2026 02:14:11 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr3169493985a.1.1789031650989;
        Thu, 10 Sep 2026 02:14:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c292c14c6a8sm254863366b.47.2026.09.10.02.14.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:14:10 -0700 (PDT)
Message-ID: <3058d570-aeb9-4f73-831c-c30626296006@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 11:14:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: rpmh-rsc: Skip read requests on
 unsupported platforms
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-2-c9b7fa3cdde2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-rsc_read-v1-2-c9b7fa3cdde2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwMiBTYWx0ZWRfXyu4jQrXy8T7i
 jlbRjeHYyeB+dbBCPDIixs7NorX379CopzWgX7SfyiwVjQZL1lQmoXLsZyntpD5ThfAi+z7YdNE
 P/ER0WD3zqs+1a9z2BlVHAuEVjfT5rU=
X-Proofpoint-GUID: luNzkVTAuk0JxvieCo3SMKaMzf2f870V
X-Authority-Analysis: v=2.4 cv=aef0Dhot c=1 sm=1 tr=0 ts=6aa274e4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Md1K26T8aKPzGtA5o4IA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwMiBTYWx0ZWRfX94YnfDTgnAy6
 WM1Zwbx186l3odmyq6SXp4OSwctSheMmY3YHzuzFKQCL4zRXe1bm5GEqY+BYLlRQevwn7V8tv5k
 MC+Sy3tO/BK6JLC2vrjfhe9HjwNd+wveJc+CNWVM0jokoVU+mE8Lu/gzMiZ8N+NVdNPHPKLDWet
 fzYnMphLE0z9w1RtWGZlq8oA8A/+NzKGfbSpevANuTyfCYXISF2QUOWAjtlFL/aN8YCnna/oHu7
 8dElveUMjbPgpZAvm8ZTZ0jNejUGDcFNAb/stdxdkztXkZ13Cr/MaPD9CoXvCql22JSSle0lceE
 6UMi8qGjvgJnxMcATFYVndcQxfDoWt4SBmg9DhwwaiIfVYqMRccKlGetpkJqhyQSBXJZ9yK4OoQ
 t7c5T1mEsWKZyiMIr9wsOQTqOjKe67x0vHPBplE5E/aa4QsSva713lrRGaaNqhP5uYKWKZt9Rcn
 scUQ7fhMlcwrZ43LEZQ==
X-Proofpoint-ORIG-GUID: luNzkVTAuk0JxvieCo3SMKaMzf2f870V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100102

On 9/10/26 10:53 AM, Maulik Shah wrote:
> On some platforms AOSS do not respond to read requests. Read request in
> such cases will consume the ACTIVE TCS but forever waits for a response
> blocking the subsequent write requests.
> 
> Skip issuing read commands on sm8150 and sc8180x platforms. For such
> platforms return success to the caller with the resource level at zero
> to avoid the caller taking any action on error code.

FWIW, *some* reads (e.g. RPMH_REGULATOR_REG_ENABLE) seem to work on 8180:

https://lore.kernel.org/linux-arm-msm/14bb6196-8274-4c94-922e-4ec8e2d7f2e5@oss.qualcomm.com/

Konrad
