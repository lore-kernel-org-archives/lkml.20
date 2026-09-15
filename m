Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0C3BED11
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476632; cv=none; b=I0Yu7mCBv79jc6q3BoH8f6OS+/GbhTjCilW1OyupgvZ9TTiRdSyhQRit5JFkg3M5o813Sl8B9l0loYyKE7htlBoL8voG6PFwjz3LTsLTd5NxxSWHYew58cBruwly1mU/TIlfv2Z15ygwOn/ABXdJAgF/kgdJ/ESgeLoj/bboHJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476632; c=relaxed/simple;
	bh=Eo7WbJ50OpvVIUjtbzxHDPcIBLddnAaq+MHvsUeuiLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMcLkLSDh3Zvvn/bfViUfghc8Z5kJgw4DedFjejG2d3fKGAuoC+nybCSJPL0jEMlG1SMSlmMqomDwuk8GCl7H9LJ1DUeGPvUbrP2opzyrKfeW4oDhJI9APLInUUnusFJLJ3BmGvB2P0aEG9o7Osz/s7OHvV7zhYXxbFmTbUOusY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCwpFf3x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DjFw+OnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCwpFf3x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DjFw+OnG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hCpI064486
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=twDB8oqFADQMDFlkJ1NnoxAf
	enWCG7E1ZKvi3p96cdI=; b=dCwpFf3xyMlimSYCVtolN85HFpjOY45clbAtjtA1
	BY6Ixp0tRqWj1lIkty8poFODQaRa49tyg8341QcuqrdguBqVrBDZx8iBanaYHgCT
	0ArTHQk4rxd+g4/IbGFwBBIwn2a1mokl0W6BrT5Kd9Krt80tubJHavoycARa3xWI
	JyB75Kqrhfw+cNF92zaH30+mQPgbnno2CaLlKiKIwevv3m0DstkabXWdMUJ2WnIM
	z8gjF3gVFMHAzLAGGqz2S2DQCgCNMclahOnkZTJDjReRDcsF685dHwsvuL+roghN
	ZmrFkbwaMsXzKj5nTIGgphdcpO9PYN+w1iq9fNCEYdfP5g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41vnky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:50:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso669991885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476628; x=1790081428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=twDB8oqFADQMDFlkJ1NnoxAfenWCG7E1ZKvi3p96cdI=;
        b=DjFw+OnGIEsCnZIMeLb9qX8BlDaWsFD3lebnWBeyAXdpgtMO/sF3VwuklNd/Vd6r4P
         u8+ZwPhvKK3EZK2dhvb61FOCu7UU0fooGhrYpBHGhifVBds2M/8yZz+N+DvFN4sPUq1Z
         DxvPxDi1b0jiYRlb7YwRbaf6Xf5atuWfxxDUb1wWvFzx7+AoHJxlb0tJKPEmMRBWlAfR
         BqOpf3+IHAyNMv2/KVkdNL+9LJQyLSa7XnNIiqPfGbLmBhRQiB1ZQyVSfQjqCrJdcw9l
         y2lsSQybKwC4zmC7aU0O86IBdq3/1ZPfEtSdQ8wC2E1V2DT9mFHfG9RSJdJQo3SchObs
         rRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476628; x=1790081428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twDB8oqFADQMDFlkJ1NnoxAfenWCG7E1ZKvi3p96cdI=;
        b=sorkFJwABs3BW86bu3G9SzD3skBaHwiwIu/0ebjNyj5LO3nHR5DM3C4T5w2sR82X8v
         MSW1xycLigpMbCUbVdFhMbFMXIKihN1rTlZpk+2BQLp5rePwJbyHCgwi82ghzO5p2X7W
         w48JaeVNaQpnEDKpHD1JqDh8OHdDpYNJAgkgnTYP9yT0Mnc4+aeQzrs/V34FmptKdiVJ
         TT2Fytd+DsGUOLVSl2599pxXKtkqyM1YYimXmJ+FvyUL6s3VzYBAREYMVLvhZuWPo3UQ
         hM2CexFjJrECLk51sTt6ylH68HS6zw+HwlJliiRmWCQlI2WbXKWh4kSjeRdu3vHOiX7z
         OGlg==
X-Forwarded-Encrypted: i=1; AKwUvBzCUB6zSv47WP+f6P5jalGhzsivOSIsokx8LK73RzJFPDQNeugXZmyYZXgNywvi9o+sfAYDRNPexjcgTDM=@vger.kernel.org
X-Gm-Message-State: AFuF++km5wUf9KPEiiDnR6qlcU7yMBDEROHWx1vJPK6v9+ac7fmPMNbw
	pI4U2VpL3ZpSHO70YKyIke5xgLmPCKLlcrllrRQWmlwGcxsik+SeO7VzdAh07kD3scCm1Rc0KcB
	LnhfkFi7hC5Iw6XlwKrtZLfAwtEmcWbgcsWS3vstq/jZx3B/bMvuZkHzTc1pqMhZXN9Y=
X-Gm-Gg: AYBFou3uy/wHt6GItPRqoViDpZ2ff7U/qF09h0Lj1ZucylBs66++QO1WoVSuZ3y74dk
	8PgzdtxJcnQnAdaDWmPwnTWFQ3PiK4aGxLa61OxxvO2DE2m9OKVw72nWQC4ja6MwhLMbyNLRios
	N8Ey2rUoS8SSHbjzoF611WmWAkXP2K3rkYIa0EpsYCfP2OWv534+VFrfGvOyL3NOSszxnHhGgzA
	7ujPdwb7qOUyW3kA9hZsLShFrQRz4jDq06wgZlImn+667yeFMiIWkiil+eB2zDWnCszqYFfGY7P
	poIPvUB1ug6fhJ8PJSjhcwUViaOyosIahHdp4WkKxlYwxca8cqjSFI5ncciEuAgx4FXvvKdpwzv
	2UbWxDQK1fAezfw4=
X-Received: by 2002:a05:620a:3915:b0:937:5ab5:53f7 with SMTP id af79cd13be357-93a29a15cecmr1153306385a.43.1789476624470;
        Tue, 15 Sep 2026 05:50:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3915:b0:937:5ab5:53f7 with SMTP id af79cd13be357-93a29a15cecmr1153299185a.43.1789476623862;
        Tue, 15 Sep 2026 05:50:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa12ab77edsm477841a12.13.2026.09.15.05.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:50:22 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:50:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
Message-ID: <a6q6zbfrz3gmio4gvf2zrbgofun7ksalg2rcnr3l5ykfrjwiqr@ezmkywxgtm3q>
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX5Lm1jmyXNMlD
 2MbyprLvoujh5suBsLgmXLZ8V57IY9/ix6JIh3BZMAjLYdI9D2hPO0wvANz3eqP0IsMTd9qqD2e
 Yn5mekjD/kTZ3Q7uTjDef6W0E2QlSzBWsJyl5ANy7YVmgDmu9hq0Kb8IjGY8ypCE7xQ7P2QxQ0p
 8cpZje2Y+j9p5p08yf5PhxBUEQJneXtXKO+NmxNn52M8qjJDbzbPFGyIOO7sPnKnX+j59n2DR0T
 pEMUuNoiGfbQU24LyOZ3VfQAeaP7Z9LSOmGzNewudCH+hdJtoD+BQ3UslBsPRQLVKjpL/fTSYAL
 As8EkPIVJmSO/nzuAemPxog0DjEJwRDEY/u5kreE4OIKVNCAAcvr1jLe9zkNNk5rA7cgwie4CXA
 exchRmBTBHgi2+v8CQWCM95sd/JlzsuzJuBZydn3CdVjhB7npD9OIbBwtzQ9YOgfQXUEZa1mow4
 qDhokfBWhqR6VTnhDNw==
X-Proofpoint-GUID: 3jAts9ADvhfrgCjLwkOUex8haDg_stDO
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa93f16 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=aJpCXM2tXIwcEqQ61nwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3jAts9ADvhfrgCjLwkOUex8haDg_stDO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfXydk9pd5ok6wI
 sZtzU9L7BvRhQB0ft3mIo0lgwYWJbrlh7HVO+YgMQUZEnOLSMY+ej8EsaxHykf7Jh6qbzZl4b50
 gJmuPtwyYRZZ6cQca9aia/0uhpTc6sc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150186

On 26-09-08 13:43:08, Navya Malempati wrote:
> Add SMEM items for four NSP subsystems stats which are present in Nord
> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
> id. Add new entries for NSP1/2/3.
> 
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
