Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7953B47C4
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160419; cv=none; b=C9D+g6MfnVnouRFUGxFMPmgosu/l9htqjOWsCGsreckj4p+BLAUluRQ9VU4/20Whdvirokwg734cCrC2MppOsfN8rCwNjnH02qkdEL3zPw9jl6O9MGuIh+J8cFWpYXd2gpGHRNR+jAcIZLq1DYapX0VTmiO++RgSVRpOWc0Rh7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160419; c=relaxed/simple;
	bh=q6I4wCeLjqNrqvwZRLZGmC63ff7DII28bBJfKKCRnYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q4Sb9nSLa+ia7HVAe2YnKTBkWvl9qaDuNT9Hu9cz4cg3H9OTvcQ8JI2rghN+K+0l8jZGqEKANGk2CEX2ygIAv/xu5DeMaz5X5LdwzryfzYzejwxcePMRICiNa5ZfsVH7HB72eHiLu+xRUSH3U3O8z7bJQ5UvENKZYE5DZIAnYTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRW2H7zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZecpI5B7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRW2H7zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZecpI5B7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52TCd2679961
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=; b=QRW2H7zdyW5a40ix
	znEwMpOjKQtWUuDkBP8YaXRyDcyURS3goBBsiQOk8W9FqV65FQ2xGMRG47rKaF4a
	HULczAVCtKpsZxQvglMjAU+LoIRN4UWSlnWyGqBofA6ooudcrUXz9SUFCK+jO6M9
	kivpOQqJyI2QXmxqNNexKzNeLUve6fPoShCEpOqy4uyxabNfFrAY1l523D2Nwx80
	j7CGmbehc7PQY7kRReRbApZDgwkR8krOlL1DjG9IxhQX1atciIOr0kIarBCzle7U
	aNpoQeW4wjQKMpk22FlZIoh5ItETNXjEyB65czVk50qxN4nlBw/bDq1sHCxeb9bn
	YWA7ow==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhwd59q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:13:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fa40fed05so6304131cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788160417; x=1788765217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=;
        b=ZecpI5B7gIRCZCaSLwGm6nqYNhuAl6780E+A3xUDwgnwTFvxENMtwWC55pBDZFl8WA
         s3cmkyNuVdxDR2TgJsL3dMMh9w7pILptzdfPehfdEfATsLI8Zk0qJzdSVr7WFV+dcUBe
         NHqaO5HRFGpl6cI9rYHjlR3Vnjm7q9PnOYVjxT+7pOKgRvY/T+fI3FVALnV36um6RTJa
         GbD3nIepRfYI9b9HPf4yvG/eIKOTtFD1e4pP8dYZhLR7oqJN0KWIRLbi7Rrz404F2x+j
         1HmPKIYrRp4hdsyVaF8+gnTs1rpFnweCZOjm+75qGfkxeo3Qp6eRShTnPRmsWDvxE9Qe
         LpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788160417; x=1788765217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PocnQeQ6O7VcIvt0+JawoO6B6p/AFAhDCRmYQgt+CKY=;
        b=Q/dYJsaFEek3OOaLZCh5YWJtXn5wE3XH1UPHFc6EX0cyuNBTXzyxZ2pQmqmF1PGn10
         43grmZ50AI7211rbjUqwXmIXTR6CNpfs8ybhJYTlY1b4reS1o/PM5DXgXYiqA/uTJSWG
         lkL7ksgBpr1WUB6+UpfBOJuL8EKizn6tZd86+9J1ZPFlz5tn6XfoYJ89egXg9WIlmkdu
         hC4xMt+qgkHQuf7HWcnAo7aZse3fYRS2T0yVO2r2hg2RcD3YSkWESbjKjwhnUqbPK0eI
         LRqtx/lO61wLetTI+xr/tGJNhYDNLRD2Zb3L9vEeZH1apY0XYCFcyBTJ5Kt1/l41n0Oi
         aXhA==
X-Forwarded-Encrypted: i=1; AHgh+Rr/RTlTZM3crrkTnwMf31NQP0TPYyIosg8fMU5a5H+znIlVfQGa15mloh65/benz2Sm/3a09y2ouIwrCAo=@vger.kernel.org
X-Gm-Message-State: AFuF++kMgupQkYQkxhUErrY3ZbT01aCm93a5iQOEYc0PjCAuMrmLyXAu
	i4mdFJ87Am4n6+cv/NXhwRJ4ZwuojAH+JWRoSqt2bMonqtMLbdQWa7sXHvneUNLBJB1a/sA073F
	2S/wceBR9WcZhTe4LEToo3rnoT5qC6gtpExKTRgIZqtvuO3u+Nez3vsiMmONhC5t1VD0=
X-Gm-Gg: AR+sD11xRio6dLBy40C3RF11SsF/1WzEph1zvSDSEW6GJV2/s1a7A9qbngV/+a0rIjm
	ZghDaGJETGhK4oYl2jldXqoKEePiAwy1OzUce6COjQphUmRP1LhdPpvedsRQMQRebWT0uIMxtXT
	eRuP9WsjvmrxkjYFy+Lu7Q0Jsw3I59KseudpuTmp5UPQEUp7MfJQNS7DjNfKj+n6mKW/aDZGZ1l
	O5sTQnZVZUyoyYFVB38BDV0/FUzTMLX2LmZkeT2BQjUXD9Wkb1vxCmDdA4LluSEsMw7Y3GVzKiY
	MR7Z0J5m6ihKHsBmNQgqYZkQZrMi4kBhmP8G4fPiaCapJHS2lSbrq1R0gFoEbL59XCn2R/9czjp
	pPSEcwIpx/hdsojATEDklPQ==
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189054291cf.0.1788160416689;
        Mon, 31 Aug 2026 00:13:36 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:51c:83f1:bcd4 with SMTP id d75a77b69052e-52fb91e676emr189054021cf.0.1788160416343;
        Mon, 31 Aug 2026 00:13:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a64fba5c16sm607868a12.22.2026.08.31.00.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:13:35 -0700 (PDT)
Message-ID: <6f33aa1f-563a-4ad8-8c81-6f64fb64f6be@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:13:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1-denali: Add volume up/down GPIO keys
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
References: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 89NSEYXctweveonmDRKvy29NVSeFe1-u
X-Proofpoint-ORIG-GUID: 89NSEYXctweveonmDRKvy29NVSeFe1-u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfX5qV9FAfS+WUJ
 QpfdFf3wLNQJlswpLlBQrr8pJNjY0jtj3rB1KEoPq5ISjwQSW3jpdyJpKWsUnhNEGDN4SGtMJnm
 gnEPYRjyDLDGw+FCFNUBXT+Vef+FsnA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA2MCBTYWx0ZWRfX12dy2v+08PGE
 0TljMHnNw7Sz1mQxLdZFE3ycAfLjK/4ORUiksfoystcyuuDHdwbEmo5RcDNfu75/HD5cbG4d/hz
 ZbTnlAQ0EOu4J/sJZnRXE+38260JYPxDx4Zg/0FAS+qHQ/lUM3LkJUhWU6jIT3xXfFQJAPlNJsT
 qrtvQUlBPbldjZ0lrrqgpCGSQmxfDy3KCFne2izXCGtFylCihLH5zh8jloj+NmPl5q60S0a14Q/
 j1g4JirnBo2CXR+PBp+J9TpHNVvN2akpjabkiD9orXH8Ybee8cTTcYEF7DAWYOQvb0pedf+pips
 E/w2RsyUWGwxOptIJxPr6XdnbSceYRNAKv8SOnU+rPKkmrAIOXrqhYbXqph3iclXzxJGThrclqv
 fXwBi0gZ9BgpqRWkoHg8eMRSOI0TcV1z1ogDaaXHOppYniO32mdGdblu4DBfcLIWNXXnm+2PrCz
 ToeUKQNI5y/Zc0hGZyw==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a9529a1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JO05NdOSlY_Y-sYczyEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310060

On 8/29/26 8:41 PM, Dale Whinham wrote:
> Configure gpio6 and gpio8 as volume up and volume down respectively, to
> enable the volume rocker located at the top of the screen.
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---

[...]

>  	pmic-glink {
> @@ -995,6 +1013,22 @@ rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
>  		function = "normal";
>  		power-source = <1>; /* 1.8V */
>  	};
> +
> +	vol_down_n: vol-down-n-state {
> +		bias-pull-up;
> +		input-enable;
> +		pins = "gpio8";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};
> +
> +	vol_up_n: vol-up-n-state {
> +		bias-pull-up;
> +		input-enable;
> +		pins = "gpio6";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +	};

Let's order the pin nodes by their gpio number

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
