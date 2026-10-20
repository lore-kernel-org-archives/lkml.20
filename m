Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500785;
	b=uRj29THcYS8vIao8rkRPXbXdMiRXsRmHSnuUFQpVOpxFrVJZA3l6AbkWyOU5kOU6cPVe
	 4KASc2oJN+8U0Cu2caew5HA7qQ4N6psNHhiQn9v6CUMzugTwCTLOFNHSzFmsI+AOkoUKD
	 E5p2ucUYTL3fdtm1l2OkgMuTWK5aJT67O/Zh16JU9upGKMVBKVqG5ukj3rKK2OSvPu8ny
	 StEjM9EOBk9AtKKSSPWTaY2hErTp66pfdNdKrC5Mz5nC7tWkpiaiOSsNQt1SipbF0crwr
	 M+6e7bcI0HuzElF4ueZdmP7WhJuGtFuf6Cky3F0cTT8e9rnJ6JUd7hRN4XIUMCkLovQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
	b=asNPpfjMzU1ZBb/MRlAiMhASvG7zmLp7k94AMJMBsE+TSHnIdT/I1IGdLpD3Z/zdbtFt
	 PNG31lz+SB6itpIu29plQ6XiprfJ7Qd/61IMWv6y/odOp+zq9LO5DbNo1cC7c1hd+xhQ+
	 joJBmwBb2s/eH04nm7zVzT/yt7CyjM85pfDfxbrTKp4mFpXDgGwgkWClKXgruvbA+FbSN
	 /HdgQ2HkdjxagRC7tSgUQfiWL4ewXz5V3osWDpUwzywpN8y/N7JQqG3ynBCy2zxuQWEwB
	 m6EdLpVrZ5wfz6EK1LMIL6PmwSHWPdO5s3xymZrqH4FCtKH9QPQRl23RYxmeKrOst6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FKsBq85/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tc82hPZF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7016606F41E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7016606F41E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FKsBq85/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tc82hPZF
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBWWFk1571800
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f9IEdXDKhDYNUZze3bJsmCBN
	6Zr2GWDjTH6URqpvUu0=; b=FKsBq85//g1HI71xUj5krTCWHR8ZQpXIYBuW0tdi
	nWAIKc6OCcMYFrQoPtrI82YYRvN6eLYmyVvtGD5wqag7XK0o+Vk7Y4niJuT8cE+T
	1xLruJ6GdMJatM/6dIhxDL9WQ0akO7cvIbleLscpRG2XalVyUsLqUGva+Qo4jlqu
	r2QsrWuZIbzBWrYtZOtat97aErmKOVDdxCO2ul1v9/QRKoV9EzUH377NbvBp/tr6
	Qa0VWPu4teLOdVZvQn7lhk2+PCgiEOgA1afchK86x5m+nfcHzPWW+XHm90w0MJ7x
	h2Rim1BnSr7yTq9qPIHavLoWX4e15J9GEBXnOIUaUrbzUw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7h288cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:53:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-919879b09b7so71309806d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500782; x=1793105582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
        b=Tc82hPZFTMsMJg29+eXSJL1WPfVg5ElbUjR0wWffZe+5x6RJ/X5qExZ+yxlC24IuzW
         Ftl4uQ02uF1aJY9jD6bLDOFQUxioBIgqVEq8bfuQma4VrEzP3GmFvHTY+gt7LN2uHG4y
         9eCcpuepS7Tm4fatm0YvQTvCIjrFPuKTjePzTKNornzxryfs1vWp21ULFFCnngpTf7jf
         9QAti0lSV9V1mWOaSly8idCelv7qQvF1JojbyRQGj46TP4KxKKmlRC4N53DgLLKRS+VV
         mIiQCYESjBs8qZNBNNS/QT8OF5zcU5j9lYmuey/M9kEBBGsXtqF4nLGmI9w5xGsqK/L7
         dAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500782; x=1793105582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9IEdXDKhDYNUZze3bJsmCBN6Zr2GWDjTH6URqpvUu0=;
        b=G2vNA6aZu8pZXeqOAOHKZnu6nQWYtwtKHbOkjQJNnXuh8JE6Uw27kHScAvbSPVAoQk
         W8pzzRPNSOchXzeeWui+a0GxyfTxXk1CXEv5f3QnGqBHQ1VIdpHOFp7cUlSI/rAFHQCv
         QqKZiVi8Dn282I/AEfJWOFzy3aIqlxD/6xYRB4ajhbn1BRnGRedZquPE1NzYVV6K/htI
         rc+LRkZM+KhQ8BWTaB5kLVBESy3iuoqU0CBrdpfjnpMMty0spzby0jlV+OU/SoJzKiNh
         es0NKEutpCCBqEG9dxN+Uju4wd6Mgg206IdTuFvI2Y0/sDMeUYIpngb/jgR92AkHxiX4
         scbg==
X-Forwarded-Encrypted: i=1; AKwUvBz05Q3Nz86uQeNefP839phaXeINq+3pdbYcsvecqz43G/AnpesyNovw7+I0VhrUFPeanZSCjNDSpo6MiJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxcFluVwCApPKQLZDvFRMrz7in4LVLmxjdUksOoaPTgaEOqhBR
	9dHc5VzpmgX4Hc+XSRbyk4/n+2s4+9qYzLXAvczBfoVd+CbwiHlNdBrlMlEkK23l4dq7/uu8xTu
	eBsi0f4qAIY5Evr/uCOAxxjFTeZ2M5y9hyWzqvP2V6eTtdeJ3uoAAkEFJwIRsG1+uFTU=
X-Gm-Gg: AYBFou2Ph15Fq3RgUyE/FY+mRYVESo1VgQXS+Aa6AKmtljWT8ZUV3AN0fmqoh5yDwk7
	/NHVyAQllnvFCXQkBJzeojsMCMqAC0X00+tOuWLqlr9X5zJ31smnZmofp9c7qzmF/a94fDTzKGl
	hixSqc+jNQZEgruol49sAZRSMa25rxyM30xoJvfzcouIJCAkWLJdd6m8NB71Q1tGn14DIBqNFZI
	0B8iPDs8kJJwoLFq9P9qo+KYkSTLGjbqQY7ehOsBbXcCPZ4FpZ9IwFw2rBKcOuw/H2PCiTUmHJj
	2G1T0W1O0yDVMIwTQs5jk1gfXSAhGfhjFgP2JNa6lS3dJjeiNWpZGM2gm4rb3Q2lOVsc7Py+bKJ
	NC+DtSeI3Fa838R67
X-Received: by 2002:a05:620a:6f82:20b0:93f:2e72:8389 with SMTP id af79cd13be357-93f2e7288eamr1036122885a.54.1792500781895;
        Tue, 20 Oct 2026 05:53:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6f82:20b0:93f:2e72:8389 with SMTP id af79cd13be357-93f2e7288eamr1036120085a.54.1792500781316;
        Tue, 20 Oct 2026 05:53:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce2b8bsm73302245e9.15.2026.10.20.05.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:53:00 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:59 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra-evk: Add GPIO expanders
Message-ID: <kfabsthyoza7b4qbkabimkvoa3xhyqvmkburk4vijli7mvj2jg@urhns2imyvxe>
References: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
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
In-Reply-To: <20261001-shikra-gpio-expander-v3-1-d30c1e8067db@oss.qualcomm.com>
X-Proofpoint-GUID: M8_WRHChRxWa4usPQTAkfh2GigkP7pGb
X-Proofpoint-ORIG-GUID: M8_WRHChRxWa4usPQTAkfh2GigkP7pGb
X-Authority-Analysis: v=2.4 cv=EuJHPicA c=1 sm=1 tr=0 ts=6ad7642f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p-9omTesjESqsTKkUiUA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXwsysAT+ZjFHU
 b8sMdmsJEdgtd5MfvOPpY+iDRfMZpx5Iq59eX+ga3elFVWJGr/dh6LLxcMA9/5l+GZPcCWg4fZr
 jatHHnkw6E1KmT6Z963I2Ezr6aQ0W00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX9QfIrWD7ZIx5
 38ENMmG16Cn6Wp9olFvqiMd57qEGsOLQlhKTOwVs5cSMX4BndDNcT4lCE0YwcxXDBv4nlPNB3Ki
 zmF+I7YpDu1ZZAW8AeaJgZqGSPMsQGzZ6jLtKKxWtwwPLkps6FGwFn4vEaplsTFQVsnmzShPTdm
 XAmMQmSUJS6ZHRROoV6m+ctHJcZjmpTgQu0+OqdbZ4NOAVrBvbqFUJLXH0q7ugbvUdA8Vf05JL4
 jHSTwBFR56CSXWPZKo7kbBj2QNlMnvYyuGayv/lPb+uyj+xRy+PfXN+C+WELKxEC/I+gmxG842R
 6PvsX/MkMlhN6sANusE2CnMZyg7/dFM3rBJAo9t7sg2vowXZ1NYaiBwv+9N0+cueQY1wKFdzITT
 o3ZHri6+8jijoYW+VDbOGovqDxLQeiTz4gcKUYFDmIEl5Y0yJVAZFf97nJfzVLgmHHOaCsnfmSS
 tAMXkKoafd5Q/9ux5XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-10-01 19:19:19, Komal Bajaj wrote:
> Add the EVK GPIO expander definitions on the I2C3 bus. Describe the
> TCA9538 and TCA9539 expanders used by EVK boards.
> 
> Co-developed-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
