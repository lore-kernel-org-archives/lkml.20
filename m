Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E08396B8C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851975; cv=none; b=h9R6B8OQnWeose/wkp+JgWjMfgWO53FsH+d1zQazWVZYWuKqyK5555TK7+nuSu6nycfSk1Pz+LmgH2JBAV/7LyKPLMZPx8ZcND9ffSr4gguZ8rNIhKdgPXJWFnblv8pw+M/j6/Yx/Vi80BNVC/D4CWpAY5L1G09RPVyg5HvFLgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851975; c=relaxed/simple;
	bh=Ora6sadeyViVycjKTx40vbOAm0KDcOCTjb459MoIpdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdwsR9+QZB+hz3wjRUgzQKXlGvwTpWmL7/NWj9rcdebdCIKL0KrxdwX7A+Tms5mOzDEIU1Rx9lXJMAKVssZvd6jIl5AZMnVqwJ9kZv8gwLdi93M5mi0lDaxV17ZXtFpBDei1ovnCjfYEb/r7pG1iRQmt+EwgOobxGCIoYKtOeKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yzfg13gu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=juyRgnan; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yzfg13gu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="juyRgnan"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Ljrn1645928
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 07:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MSh8ZXxCngtmXhzbngM3XhQp
	WNOjHFHLp51iif8TSwg=; b=Yzfg13gudpEGD8iWOaI1f/xcayBP+KuTEt6eFOe3
	DnPisuX7hwVZCn1A+tLWnOfZoexxsVSi02xbenAeekDIVOqDF02SyrnXH48dkWlu
	gyK8/c0YThlCGQuTtsQp0SVWDQBqSb8yMlQoHCgwP6G5k3at2hfnXxs8ced4mWbS
	Kwtn+5jMQoNjkHR6FNNQd5q5VJsBPs50eL4q8IqdQl3XY2PAo3Ngz7CGUrNfyre+
	ZEV8FtQ7IXVdRMAiaOy6oF8nx9sIWFEUadrC41uET9AWrRWZUlq5BtaaCV7CE2tx
	410DldZJ87UxN+61HBH5ho6pG5HcapceqbBBk0D63Tx7EQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvug8yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:19:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390a2c895bso882570585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851968; x=1789456768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MSh8ZXxCngtmXhzbngM3XhQpWNOjHFHLp51iif8TSwg=;
        b=juyRgnan73nFfbIJRwTtVzmL0N0nogGSL9YvHeyypcvRY8pJmg4AZiCfnQnq1FbUPT
         ySTyIvNR5KIHTKfW517NIhcL3ZsCDto34T3y+bCJMHu5Iv0eks6NA8n7aW+51It3N2gc
         xUUaX4kmCJPFx4E1dSfJPLmp3lZigZTPu7A+X4hc/QioZ0hwCicnOG42j+p34FHZlney
         LpiCEa3HA3ejwS1M97NvwC6e8xTOvOv6dPkUlLQyhH+6AdAt32gufINCLLGtmwZKsVeC
         37a+8oszuO5mf/i/M/9V7z4TTz8soVSECpwPmEVYn91YPF5Kpxk0XT3ZWw/10ikGBIIa
         wx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851968; x=1789456768;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSh8ZXxCngtmXhzbngM3XhQpWNOjHFHLp51iif8TSwg=;
        b=TA/Sp6f4m53pWRA9RPR++jcvzZOeANkgzuWT14QwfDfzO0vabfm5Ssn7WkC5wooJVY
         m0J4MMLX2S7EftsJF+i3kJ4ZoVCjASvfXlCtzt1DaidkoGJSa2B+4nt6Mx5tBfBXYmgo
         drSnoPGW+PPiCkJnLKiWcK1l62TVh3ZCcno78Y503J66mfFvrVBEJqkk9maaZFBpRerZ
         Hh7rvdWEBg6PO4rZU/tnK+X/H2fomM2+EKtDpRPbjfx8aZdcRRMsOubmsW+Og7MlAWfN
         DFf3hLP8nosnClXv0TDpzK6IrlWYcNRX+OAgFilU4T+xVOHWpx3+l0dW32xxbzIXvv1a
         zXwA==
X-Forwarded-Encrypted: i=1; AKwUvByRT4d1BriSJtVzjI3QxrzLqLtmS9RNAAyzkrHt3cS0C11zoxek8H0dOun6F36btL2Ym477hf+wQc5pxWA=@vger.kernel.org
X-Gm-Message-State: AFuF++kY7wNejRjVB68vUj/AI+XQDbdR7xt6xztSrT1I7bylvfJDkWht
	HMKHx8kLhjgb1u76LwIEppGU1P8WqV4xd8SiVxqaqoQy53X+w+jBnb5GokiluB0rmxffKg7obAp
	t/zR9v/5E0eTXC2Kz8FGH+mYTp78p1SHxcSAnDIMfvKoyQQKdhpW+CejaWdVvOgiwJXc=
X-Gm-Gg: AYBFou1xxV+aL7RYS6/5xHUjgqpOKGm82KG0r/QCinMYNtRpE6mP776CZtlhxScAn4f
	Fgocq49MQHn6La8fH30JTOtXjrbL/Xnd31bHpAQLyEepefNlbHC9cx+lvAZHmHhMEfDLsdik5BI
	Z9B3HAGiOu/ulvrChRXrWXyDiJzNr3u8DovUdt7aGYzpuq2jdhXbUfdrlmutiHXmIAH2dNYqhid
	GH9bE+Xcb3RwzTG/V9OhWrskuANqSygqHg6NUraMoLpsTFRRn4k0zxPf/Yd/d4aWjoO4HpNyAmL
	09ja+LvRiW7ngurPUBzWpPhZRLHaHE4a/5Ox2QQ08xX1tfPIvSKDqidIdF8fWbygTI5ItfT6V5i
	HLY2uNC32rKY=
X-Received: by 2002:a05:620a:2888:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9398059a718mr2929289385a.11.1788851967584;
        Tue, 08 Sep 2026 00:19:27 -0700 (PDT)
X-Received: by 2002:a05:620a:2888:b0:92e:f3ca:2eaf with SMTP id af79cd13be357-9398059a718mr2929285885a.11.1788851967137;
        Tue, 08 Sep 2026 00:19:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm33045263f8f.3.2026.09.08.00.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:19:25 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:19:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shujath Mohd <shujath@outlook.in>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845-sony-tama: Add battery
 properties
Message-ID: <5enkadptjkxm5mmjjwtqehm4futxejzwewevoewlpeedjhszbb@dsfsfewasuiu>
References: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PUZPR01MB51418AF84C1FC5F640144D57C3B22@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fb700 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=i5nSP4-SYfabNta8v3YA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: B6bmRs3QONIRqMAlZW1m5vHRh1LkdJ3R
X-Proofpoint-ORIG-GUID: B6bmRs3QONIRqMAlZW1m5vHRh1LkdJ3R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX2tipdvpK2qa0
 PuTC2t48ohogCyi94EtH8dawkpLd63SOoiCKfQhKXs6DWnAm+nABw7Er4TapEXcGmhN/f2KFyLz
 kZxJxjgwPSBlRa7cS1aUBY4/DYh03PaHWEAO8x6GWWO6c8X+ZfcRcRK/ExfFPgE1fpo4syATxZu
 ru9Otiu23jx81f/zDfGLgb/JiCNaV20piBeO0OlXI7KwPBVdKfbFBcJq+TCz1NbwhaO4PsgGrCJ
 Gqacfp4JkZpBmzuO8rLiSdf3L+KLOCE6/0drubr0ZEVZgm73F5EnuW8Pucf0GRR9OdP14pxQI95
 coIXOX6e9yu+gRGhGyTuuzPmhHSTTZ8u+GwArF/NugPdIhdOjMCX/lWftW5cp8XWJoh5a94xAoI
 0fYdXZrZsgMAVXf7B515Vn7eg4IkFKBxolVEY2JwVmVpnvuEVrl/K+1ecmkao2xYzvm4T7KF5Jd
 CBaN278ijiw77tisUnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX529W5wA76AGQ
 3AP12s8BgOydN0qTb2w1Zauk35+hfrASmeMv5fXfqfYfGkazY0HdK9L0ax/6xGLb4WPPTE4lIAx
 5YOEx/0o/l6dVRaOfhKM2/UyVCX4BuA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080074

On 26-09-07 21:33:08, Shujath Mohd wrote:
> Add simple-battery nodes describing the design capacity and voltage
> limits of the Xperia TAMA batteries.
> 
> The Xperia XZ2, XZ2 Compact, and XZ3 use 3.4 V as the drained
> battery voltage and 4.245 V as the fully charged voltage.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>

So what changed since v1 ?
