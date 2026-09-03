Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE38F4C77A2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447757; cv=none; b=sfC9OvQMDavtjAlxS63w/4xJeUegAJSt4H1ksffUCBjcqcPeW9WTEKhox3+g3buSfmekWUUDmBBpAF2E4kr/YGnipcHq3i5x+yhKGs36sB5bl3gd2DeO14ZGk7wNwwIMqzmSzILkBEmr8COUh2+8XQ5bI8ujA353658n0Fy04YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447757; c=relaxed/simple;
	bh=AxPbjgW5hIJNKEht6e/FfDCQU+F6mgJwY4mRccMHmDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjigJvHuCU9YSH9baDDAvmtrsLSVOo0K+yM1LQHVGusDn25+KODqcdBepMXTIqpkYkWb5+SjsVlRcXqb1XHg52ZCjR2nGWY9kf91Vh9gJba8UT1wTaxDFoDUrcVxXbN+8tMIvDGwPLEIx3Jc+FhH7OeZ0IjiNZ/fbEE3DRmuyuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niV6h4q+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYPRT319; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niV6h4q+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYPRT319"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DAK3s4093583
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 15:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=; b=niV6h4q+H+Q5VhBi
	LYH7QygpAFEOOnqS7RB3wub2fEBMJ3oFOE2NaC+urEeb+PEz9mmn+i+eZNPSjbQ4
	WEisdzwGLR3JnZWoXSH8Y/I3e12kJnT72p/GNgzzw1g+GmX0WOFEL6OutZXdRDRK
	jQvaUCUrtJYGmWdJf1P4CRdihYJcOt15o8l2pTEStifUe26xRfV5u886s2HxbktA
	FjNZtJtlRXg3OOBopv8r0PPps3iy0dti525To8MyBpcJxjaPynNXp7cJiqYoA35K
	qFeJhLbBP+Z3Er9CqjO9jeV+40mXbGWR+ZOY7ZLDz1I0+Jfhv2kmZHf+mpTzcUds
	5EFBHg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjtqt4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:02:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso16119a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447754; x=1789052554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=;
        b=OYPRT319Bc6tV1eK14U6V5LxKpL1U1aIdqxKlQTfn9J79BtNk4/4KHGF3THIIJAzR2
         1MiH+4ddoshA/PR+x1EBGBh0eH5KrKkqoz9PmfsfCJUUs9CC0X/F8UP1IdFKpaHgthTn
         h/6HxmwDA1Jmhnb35HerD5albJ6zkBPdHI5AlbMpD1D0O3Ml46whrq4ey3N5GH8lhrCK
         DhCZ7zuQxCzBBKarExxAhnsIbSgBVXhkQ1LFrxvIlURoJmUFbqt6LQ2i4YkpWoHpbomc
         y8h8F5xFdKThcBJsA7LgmYWTVeVmVEoVwzI7ghS9G8TM3hP1CXTkvOT8hUUrQAFYs88G
         8b8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447754; x=1789052554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsBOWHIG/eoT3H41FqfAd1L5ODyMGMsTY1eqI83neLY=;
        b=NMuRmdrb87Fd1NJua1+vrh1k2i0qMHWidyUYRNRp7PxaV9eWmpKDEaZzWrBQr74DA6
         W67Vn2p6OR73moAwNFSp7nZhXjbqa8vt6g+RB5X0BsEfT7dE6fBbaCLmcTp30YW2xX8R
         T6X4d0eQamLfdm5t9VySA8PYCvAybsuRF+jb34FF7tduCs+wNdrYZfutRKK47JYJrgs0
         7sEQt9FFBxsV5eqa5DDjti8QTF8s1UmdzXafOTeKa1rtfiItFaTNpRzWCkhYxvCNWYpK
         0oZyLqOumEIcjRcFpBYn2OdHFWYe/t4sYieIYeqG4bDV+CUCJnct01Em+IFjoGvSDrhi
         q0cg==
X-Forwarded-Encrypted: i=1; AKwUvBzXWyiZk7XymQ663kP2KStfG0ovqC8bRXei//CQsPzL72G6tuTpwz0kcGL7R8hjYuHDSFqJouaHWz0WjTc=@vger.kernel.org
X-Gm-Message-State: AFuF++lXjQubkFMpruoicfC4OcEEX0yNdR7wZio9BGPhJakJnNl308EI
	I6FuW2ZgeLV0LrcRzUExdLHvELdLN/L0JTPPCq1Yr9dy5AlsYCtNPex9DZT+fKV2BYmZyjBNlZJ
	+lwbZtaHcu9UBsO+OgqFdmsQ4zVb5XumD9eVau15/deKql6WiWgS1WrxE9UvOg+d8W4Q=
X-Gm-Gg: AYBFou3dUWwuU92u5KKBMGNcTYvxJlQEAbglLJjIPeW+PFcYEcxIwCRVJ0Yqj5i4+SV
	rhIswTUNUZy3cYkRlJsZzvxHt/dz7Ecr8OBPsDRNrkbaKWD6B5+L8uA3AgK+o2k4YUondWUZUxb
	o+ynroa/3oG+dYZBoFJwseNevrkI9/9b0RiitKemBjx+mkl+kcY2ZrzRqrxsQlzLOiJpYBgT8/Z
	fhaSul8jpb+uHJM6kqaRCWuzREGFWs+37M9bsQNnzn1bADdIQwM6lsLyzhbjHz6Op8kfeEle8Kc
	sbNq3RaBzRkVGtEYzJAon5/jwLzUtegCjFED+Q3rHUQycojyU9kT/FaSTlggI73tQ6nQiGeikHV
	o4ivQM70OQHRLVtwwJrd+f/YAIiHzFxPKXR8rOsegi/bxPqqhy3H+3yMYjqx3mo+C
X-Received: by 2002:a05:6a21:1509:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da35d58df3mr922372637.3.1788447754477;
        Thu, 03 Sep 2026 08:02:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:1509:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da35d58df3mr922230637.3.1788447753951;
        Thu, 03 Sep 2026 08:02:33 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d3a08fesm1113532a12.6.2026.09.03.08.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:02:33 -0700 (PDT)
Message-ID: <a032745b-e4d1-409d-865c-49e7cd408906@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 23:02:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] clk: qcom: ipq-cmn-pll: Register CMN PLL /2
 clock
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
 <20260814-qcom_ipq5210_cmnpll-v3-4-21c3db378611@oss.qualcomm.com>
 <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <219ad037-ff37-40fa-babd-21276ff23f50@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfXxeMUPDte3NNL
 8twyuNigFQzd+RIRuETXsOGAaCDHCtqU96CMWUOu+3gkPbxNnbVjbeyf/wrXSrdG04k7nHtkwZV
 pTlxk2LYZt5cZByLnjqlFx0ikC5roB5vpPhDG/vymblkCBR16WB55P0XlbN5XRo3PnO5P1UbyOF
 ODjWeK53fA6JgmONIHZbYIYieqd5PNXjIRqE5kV7Wkol1a5FhsHa8pKu/VvDpZhdugG09W63QvT
 jii++iprDr+uLQmZUETiyjwQRMwPezA/aMBhob/BWYhSVopMAzIs8uqQQEuMipqQ11OrsIf2cFx
 H1t4RDRlj+hP3upy9sA+FiSPIkQIKNeOJE/kDmWsoXI79gjz6VB2vyNKNfEByo45e7aBYFlsLl/
 7nJnKhfH5J4WlWrMaWKWpnD887aGnYw4H4+59OQRKsEEk/RWYeNCBZ9AVNxTiMha6HmzA9xPSpe
 YxS9+Le4r0sIwpsfbig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX0I3Z7++Lf87E
 JyNatWVlW1H/xfFptDVY00/c0FVWDMlEtJ+IJXZoVgxIRe4AeCt1E4cOFZWI/jsq2FZqWLQMZ3+
 On2fQnCBMWKr0kKz8wwZMBZRmmTk6/M=
X-Proofpoint-GUID: SkBlErN5K-4fm_wryaPl7QpfBqsr17nS
X-Proofpoint-ORIG-GUID: SkBlErN5K-4fm_wryaPl7QpfBqsr17nS
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a998c0b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=tiEyg7sXe0Pth-w7ixUA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030130



On 9/3/2026 7:55 PM, Konrad Dybcio wrote:
> On 8/14/26 2:48 PM, Luo Jie wrote:
>> Most CMN PLL output clocks are derived from the 12 GHz PLL output
>> through a shared, physical /2 stage, ahead of any further per-clock
>> processing: a gated fixed rate (PCS/ETH0/ETH1/ETH2/EPHY/ETH), a
>> configurable divider (NSS/PPE/PON), or a rate-select bit (EPHY-RAW).
>> This /2 stage is present in the CMN PLL block on every SoC supported
>> by this driver, not just IPQ5210.
> 
> I'm not sure how the mention of IPQ5210 here is significant
> 
> Konrad

The /2 stage is common to all SoCs supported by this driver. I will
remove the platform-specific mention and keep the explanation generic.

