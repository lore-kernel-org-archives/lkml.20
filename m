Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C5F4E3250
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685974; cv=none; b=AnyxdYKADtnxPNmZ2mC2gG512UMXSpJhRZzqmWanDPigHlJVHXahCVD6a6UJT+Twx6e9eh5jHdaYAZDTUuBvSE0VW2cCVR+hchy73nmMeSK0TSl04q0X4uKrMPsFWfHyrAlUSBnVzfX6H66GA2+U5M0C0Q0/c1UDQazbu9215RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685974; c=relaxed/simple;
	bh=nIPIQvLtAiBWpuYZ7ZeBGaIDzZ8zCI5CfimqcKJJ35c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMJ4xj4FSBAQ1msj26FZudvLE2ghbgKXSxDIppJQ/ZQdHE5uZ9yA4Ssw3tQzr7SA/vNkqrXR78hVd/Or9s9y6sa/9c/p5oXbWUPeZoSiqgEBhx1rjr57Y/OhcLb5AopEjejASSMaxN/eVQ9wS71ymArAEkbSG4I3jLKQWJud1PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aoYSMtS6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Za6TES7y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aoYSMtS6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za6TES7y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCE7FJ528987
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dfppG4LZcjp+lnODDg/K8oOq
	9to8YwqBX2eBOXC0hq4=; b=aoYSMtS63MepcEYleUK5/MjdrKxIw9vSaqpK94Ll
	gax7pcyN6/zO1m7DYfxNHaG+hM6JQWEuWZOKXYac8ltfgcev++lB49Y62J8/PxuA
	5Qk1nQUuzcBKjZNs4dBWqQYF9a+6D5hMY5SMc2h1tcgkGcpkpBca4vrvivOk+ho/
	QuypnBQC7VEYdDGmkjnAMt4oDLhUrfAG9IlVVbScMA2gp5XFKyzwmIVSccP2t4jO
	VmTHQ90uuYM/o9p5PSLYYfmhPzOu8+4MkVGJthdeD2V4cn8n58KQ8R4RwnY5z9ed
	QsQSc3veVUnqnSg9MpxmRVziUftNy7z+82CBFh1EkNJpgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew2fxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:46:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c77c0d96eso279559785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790685971; x=1791290771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfppG4LZcjp+lnODDg/K8oOq9to8YwqBX2eBOXC0hq4=;
        b=Za6TES7ykdsR7yZEjzCOSRHe9FteEF5pXIC1+zph+TYYM7PLq18PYYjjIVmYZS6FLN
         t+BGcpzwO2uUOFpPOEWsyCDS387XU5D5zprJ9/AJxq/JY9PO7pdv8E+zlM4JMWlEMpu0
         1Wg6voLvpFuMggBrpp3PTU0F4QCt4FZclQyVgm+SBRFcIgE/dcg8AvAT0T4R0fp1WeAD
         w1x/N7ICnQcjCMr5lgcFYAz++kHAfBZMAQ2t67ZJpWRgcnyq62TSGlFpmBoVuScELJc6
         XI+dme1OMuDuKCZpxw7MzQI5zVCxKduOTfpLBtgPlAa+zJK1FF01EFlkNLaz8AJgbsTT
         22eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685971; x=1791290771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfppG4LZcjp+lnODDg/K8oOq9to8YwqBX2eBOXC0hq4=;
        b=1Yieh/8WR4mm8qk7vi0IKQjq4wRFq4DbPPQcRHEfDhjHNHxfqNsjsrNLzqbLtZtSLU
         11Bmun1g/LXFIJkDadyOYkqsHJyX5m6EfW8agy+lWR/A4y29YDW2Pge0NJPbwZlGMUFl
         dWNMds0p2sR8jHYHUkwULqWA20dfXVV77Jvklg1rJHhhhPkC2XXTHX3+plHs3uBoDXM/
         XGy7a3xU6TR+4yTj6EIRPW2rlZ8KKVvQ/S/gFU/HX8TbnjF7Raiz2M93FuIk6dFQuRL/
         kRhlp1D6FsGvX7z2IWNKECYEy9f/54Ijqx+q06AhExsdLyJu8hBpsquSZ/895gFH+PUY
         m7bw==
X-Forwarded-Encrypted: i=1; AKwUvBzroooFH8EtzUcTqeTlB+jyh/kwvmHvHeAtFvoW9Gmy+Abo5DqMIU67qghOyvUo1mbb1N0ijnFVLy19Dus=@vger.kernel.org
X-Gm-Message-State: AFuF++nKfus2AJ1A+xS3QJvbITfz3pLbusEC0LghTrX8ka2GGDIgp4X0
	JmvhkB7l5njkcgsPz4fSIbBFYB+h6oeyANYuMTjQ7z6Cd/uiwCrE4QrK6n7SkafhvH1QZscGywI
	KRxq5rWB6j4V8ZYPS1YsCcFty4xVlp85bO41XJUAJ419+kHaTmcDZ74VZfz60Hx+JJr0=
X-Gm-Gg: AYBFou2HLo5GRQNbE3JsPiD63vojwhSPkSVyGyc3tBAG5rbdmKbNrqIVWNUawbFA45f
	hdyJQ5W5JGYgC11Fmv0ku7Pr8R2HSimceBf0sHrm34oq3xekDKsgk2uyBIau/+fFdK2JO6ZyyQ2
	E9l0uMiS5ZiDC9/bIfJDoO2ca3g2CbZp1WTLfFMhvR7YvAD01XBFafqO9h3j9IrPMUki/2i02RV
	duLK8hxFMvB8jo1y1bOyMP/AzEzZ0Mnpx60bq7MQ4Rvf81uIsyJ3IZ1Q3UgX9tpC+ErfuOVraBx
	Qy9Q5Vha8TOsrM9uawYTe4NPlWVohwBjy/KJDrgGgaN3Z7CgsXCpjuu0fDCkP8yjyW+IbhKUF5J
	oIWI4qMtyaaxzYa8=
X-Received: by 2002:a05:620a:2618:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93c43d17b62mr2682091485a.56.1790685971202;
        Tue, 29 Sep 2026 05:46:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:93b:d79b:9a57 with SMTP id af79cd13be357-93c43d17b62mr2682083685a.56.1790685970512;
        Tue, 29 Sep 2026 05:46:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50513c7sm3850730f8f.16.2026.09.29.05.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:46:09 -0700 (PDT)
Date: Tue, 29 Sep 2026 15:46:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: shikra: fix sdhc interrupts property
Message-ID: <dwb4a6s4wt64agybmd3gbtdhwe6nepqz65ew7wsaufuo74yc2b@3viooou3she6>
References: <20260929104127.3156764-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929104127.3156764-1-arnd@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MCBTYWx0ZWRfX1ZJwyj+Ukh+U
 ySbCEhhXc5ddzKLdIJ2Jdeu4DrFMCUeXOBEL8n8wDVsCTORNYOTFrpiD36X52wa0a2SHgcYjR38
 zdiP3iXGgzBWgi/bG0O2tQig+PLsbYU=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abbb313 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Eo4bF1euHd9rOWEQa6AA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MCBTYWx0ZWRfX55hzhj3cAkIp
 MWWJ9OhB6niUK1QwX3cuZYsIng5FEG1SoT+sYwHQNOZqbvFCfW1qkdHZqORqtNenvXj5BKQZ9rh
 dgLhTfBRY9BkuldKduFJj4QXjuMgjeyhhAFYI91NXQicp9uzCOKGLbML2V3FNw7IYuAbBmZGM0b
 +93MfgPn+SH8oRK8AQ9HdYXRXGeRqAoFVF9w44Cm/F+Fry7uL4XUlKN64tR0gBXetQxoHiJABRt
 NgZu/PXywOpWa9R2TpGeBs2Ni5scF4qwyj2eFnMPSALbN/ivPMKSGdG+ZAuypPsnKJFCIoGwrcs
 sFiwOMbMsdvotoGjukpPmucxQxUJ9qyOmZxAlKHqfATGsROwyMfEYr4IGhmBJhxrgNprCcKZFTu
 i5s5eEiG3PfdKES/5oiT4T8oPTabaRGRcBGiktw1nhCiILmFDX3FJA/WLOkndc1H+6EuRL6JXeb
 cO2DW5dmKlUJufiFLpA==
X-Proofpoint-GUID: Wno6m8wudsk5bZDWM9BHIVW_WUM_WiVE
X-Proofpoint-ORIG-GUID: Wno6m8wudsk5bZDWM9BHIVW_WUM_WiVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290050

On 26-09-29 12:41:12, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The gicv3 on this chip uses a 4-cell interrupt specifier, which
> includes the affinity, but the newly added mmc node uses the
> 3-cell format:
> 
> arch/arm64/boot/dts/qcom/shikra.dtsi:4151.4-27: Warning (interrupts_property): /soc@0/mmc@4784000:#interrupt-cells: size is (24), expected multiple of 16
> 
> Add a zero affinity, same as for the other I/O devices on this chip.
> 
> Fixes: c8e3d40457f1 ("arm64: dts: qcom: shikra: Add SD Card support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
