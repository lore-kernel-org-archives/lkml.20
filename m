Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E6947D931
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466154; cv=none; b=flS8e54Y48nmhV1KERAZtNuPV1YFI4bEi+ZQqZIb1lXZDjya/836MbGMexqZrHy5euF673r56YmFNSRDjI2fnFPqcTsfb5ftsskjBTUfOPLcrF729hiHnwZfVzl1ARCtpYP34mH3uyq3h6zJlwRG0nL4i7Ye7nX9DcLp4mVBejE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466154; c=relaxed/simple;
	bh=gDXbyir9zNLTnY8M+vk+mIoyuEwmxWrzN2KOnQMYvVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1XPmWe4xT5WHl5TvQ9YMWVvqyfNgJRpVYiSnKlJJ0OZCUrTLqSi55+Gb0LZOA/E0MKmQzwe4W0cnjfxHaieiDttxfwUNw7U0RvnN6VeIX/dbLQWnZdWgdE/TQ0GASvXRe2+OSg28QDfXgQ4iNEm/RteVU3h4Umk7dAlZfrcZXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRb14ZnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RXAtF1Fu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRb14ZnS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RXAtF1Fu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hGYO2086976
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6m9X+B65XWswH5gO8xBSHz9W
	RGzYzaS4EqboxMS1g1U=; b=dRb14ZnSW3i4AuozJwtoX1s6PEnBOzpu0B27xsmh
	6kJ3HkSHxAVqQXfBMpF3hFSEej8N+7dI+NYd+E9e4s5mITAD7kaWgn8Y/W06dOn9
	3Kid0SfgNYo+Xi2OwaYs/cXDE5ywiYGdTCKB9kI6bjypH5G5RHjyHHj1PT+Qf/dE
	DW9tKV7CRmgkSVhXdtFoeW0SzbEGoJiL3DWF9BXsPBuENuMFit0i0158YCM+xfSx
	Q4rDWtrS/ZgkESgruYQasnhmAwMlJG3+kbkN2pnsrq3UnGwNFe/aXf5Q+/KVfwQz
	zNufGKn2DOsfOvD9O+m+PvGKygjlOWFroheqPp3C4/2TNQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp8pnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:55:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0c7126e7so462011785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466147; x=1790070947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6m9X+B65XWswH5gO8xBSHz9WRGzYzaS4EqboxMS1g1U=;
        b=RXAtF1FuSRYEHJ7TMK82jyn542+L+XCPhzCIgUI472Qk830HCJQQ/kFwP52gdIXLnS
         srq8UK+40DdMy+fU5MKU6I5IbJlpNKgeD4JzG6MLXWbx/iF/Y/GazydsJ8UKIIKcfKdL
         uGlJDMmAAlDh1MAy/WOP5PrlRbUI6eqEHnqnIiDsOdvy5IG25GPlnMjTrrqVaQjtfKqL
         K5MVa+lbWyGjua4rtBBudWE1DpG349MBnZp345fpajxhDDnAYxxG+2MXgh5lR7Z8ZT2M
         h+T0vMtoKHNnmfIimNqDhkJZ+EMj9VIVFGWDoKsrfV8YxZBFQDUwwYptsjyHCnfJfJN6
         ++oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466147; x=1790070947;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m9X+B65XWswH5gO8xBSHz9WRGzYzaS4EqboxMS1g1U=;
        b=Sx51dmoQMk/wv2hWM1c+03JWtT+O7eBZ1aBIc4f9gzfYrxMZ51QrUNZJB5N2vEe5Hj
         78fngktbLfdRf3GJcc64DtMqDloPRBSX9zk1hJSul57DxKkKKd0DuuNdyeRunMjRhUp1
         /VgoQI6RNMRygWUeEueoFQzQBiz+Gl9Cj9Do2s+NrHqjaBcS8Bqbqw0eRZvrq6JMPQp/
         sFK3v6weUU/r2PaaizJ2QPe4ptm3AS65uS/YXvIi/xCdpWaXc6EFHDpjJvQkFtPTOaOL
         ZtfdoY8roMcc1wnCu0gKbaYWS2c8gYYtwwwGCkvfe7tlEiOIpGTpDer+w+YVjl/3Zzhf
         zTOw==
X-Forwarded-Encrypted: i=1; AKwUvBxHJFjAvCNIObvQIdUKHCuwRWQw61U8av3P0mzZwrScswfn1KcyGHAhC+d2ajGk5WOGcBuGGxq9x2IpJT4=@vger.kernel.org
X-Gm-Message-State: AFuF++nXYN5dZADkv4c5UhiKA9XmGgMpo59tt8sdk7gOtoUQntKO8+Pb
	gT60i8KXrwpAJrTnkFMcL8mChUKr2VSStQ6lp1kREu3UCuRRc56JR94EQ9Avx51nukrcpmgUI3v
	Rz7gxniBWsLdeBJTuaEfZwMohjgsY9CifDJPJzWYQUmO/+EVUSqLpPIrQbB+piqMtNtM=
X-Gm-Gg: AYBFou2bdS7DCMd5HpwLjX04yAkyRMIcVJx3bj5Ori78luHQpT7SmRzkwEiaHhSRH+e
	+IQHbFniyyYHqBXE9iluJ1VLMQHOD7q5LlxqIRrA/MYYEpRHiAjnWRTS39Xuw2Ix6KPeeKchovm
	GCjqK0W7dN/R6uPPiRjq8Vx1+xTNG8+a+ltLhRcDtnZH0CFZbYK7HCDrF4ovxsUS2EHijI+X5/I
	Eygeuu/61EbftpfK0AFG4N5whwR87jxNFDmdTqnqKS9unQduuUxRL6FY3kQIsKfkaNbMJfXncJs
	IOuWR9auhMtxpYZ3/DWOXpzevnfzDUeDWif/cijGtOhuX+sXvJNqBCvCmjdQJWmXsyUwsPQl7lL
	fnHf7Mo/eK/UjBnw=
X-Received: by 2002:a05:620a:6602:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93a407b811bmr5427085a.23.1789466147015;
        Tue, 15 Sep 2026 02:55:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:939:74ab:c1b7 with SMTP id af79cd13be357-93a407b811bmr5422985a.23.1789466146454;
        Tue, 15 Sep 2026 02:55:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27c88fsm53038125e9.2.2026.09.15.02.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:55:45 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:55:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to
 PS8830 retimer
Message-ID: <qwulccp6m22csfxfpivgkzw4qla4cilpwmkcxbszayzxuhdugt@dkw2ytmn6skk>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX7HrJVhMv3I+M
 WikUImPD2nC9pUVMr7TVhbeBDaZ0jwFnwCbSw3g/Eo7KTRMJKcqQKK73NLR+eVt62W7Q8Ze2a6J
 NHxetmgWmbpvMOmDh6mOK5teN77txmw=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa91624 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0xWNcfA51jHuHAl5ng4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: i-9iGF2BSYKqkY8b-WN8AlZh2TLmvKy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfXz29s1tSBS1PQ
 EUwtgcutkPJTZ6DSNj5wAlh2H68cIncjtZBo8SzWjvkZgdRtt3qDDI+yqc9HksrEln69KuH1PPL
 JswzdZ8QYHG13Hr31UXt0Drs8xPNsEMq8/a7hg74/NnTugRsSECz+mk618dP/O2gUVQ8SR32/DI
 9qvdPUj5sEb8vDCL/AS6jLjmAIInTynlQ74ByTEATj5pg0PBTaZEP3pGsr9M5/bW9M4Efdp790N
 2n5SgMY3A0KhxiEPAuLRrI5EiY6E/8e306dCRzBseL+WhhlOpFYM3SIykbBlUkPLV/ymrIu9mTJ
 WSf5TmjAiwv2ThH9b5czqYHKxBqXjEJqUDr3AV3hKNveU02Sqsyd3hS3DZEXHfUC35jZXJdILY/
 QjBU8NMgSubT1GP77vr9TNTa8ghfjyNyhnB24O0KpUXEbVVWp+k+KDxB6ec6x1CfVLspsbpJzge
 VW75/4bo76qlsaOmWNg==
X-Proofpoint-GUID: i-9iGF2BSYKqkY8b-WN8AlZh2TLmvKy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150142

On 26-09-14 03:12:30, Xin Liu wrote:
> The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
> I2C3 for USB Type-C port 0. Describe the retimer and route typec0
> through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.
> 
> Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
> their stale "Left unused" annotation.
> 
> The FSUSB42 SBU mux chip is present on the PCB but with all signal
> lines unconnected (NC), so remove the fsusb42 node and its pinctrl
> group. The chip is retained as a hardware fallback: should the PS8830's
> SBU path encounter issues, the FSUSB42 can be activated with a simple
> rework, avoiding a full board respin.
> 
> Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
