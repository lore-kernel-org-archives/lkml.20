Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8D84908AA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146739; cv=none; b=tgN89cJl14dy2XdceknEygD8KT77zpGukrR1S9Qchqa4gYMxjHe+b+N7x9No704r/DItAgfL62e4+2CWSSBWQrEnoS4Vkz2f3PMZNHvle5bAJTGKj7gEmZIYtJYCJMbaEPeyyLVzLhsIUI7HSAYfRUjO+QO0eNjs4c/QETH+U58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146739; c=relaxed/simple;
	bh=wtfh54+DbmEj2kpdAFEn5f6ixXFIwBqvnu9+EMWfQfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFA1iGXEeCZWsOjV8vPxpk9x7yOpGLihg05jB17MwQsYURj+uqrcPhpvmeZG1tpLuKM0Vqgcwen/LtGW4rJsRJtq54F1diUh9cfAExZPL2vEiJQyEgtRmVME7uV1gHB58F8TmVCebacc4ukWQHxMJ8+DgJI9DVNKQSxH2AhuX1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y1dIizFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvAsSYdw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1dIizFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RvAsSYdw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA6G22403042
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fQiJOCq1unUjSKMoJUwERdxa98S1GzxFvYt/UTpkOPY=; b=Y1dIizFQg6x/OSgW
	ouvIVBBqm2tjGhJOtuUNMidOMkRl0kr9IwpHPhCGXgKfzBd/+CLjKT1P18k0GmtU
	VgT0ZK3EFQumR3JHlW1zCw3XYAXuQzFk5Zn1xkiRTtR5hgUnvLsH1NH130PaLhxO
	hAhllreCQ+OHfM8Y6KT8hnd8A8cMqCAP+tCgPyM9AMTCd9KHLp1zjgabk0LSwyPV
	SanWOjEJHbRS6wgumk4WA+BvmX5o4fyFY4CciLMEfTy2othcFfR/2Kjn7lFBJtV4
	XzlfWSuJtxR242Umdw4nt/NH7iH+ysGXUM9OjFE7vobBX7yrPpuHITlytav9dE0W
	VKUKAg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m40uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:32:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb1091fffso49754485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792146736; x=1792751536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQiJOCq1unUjSKMoJUwERdxa98S1GzxFvYt/UTpkOPY=;
        b=RvAsSYdwM15sZR9sUGbUxoP62RiGTBr1cR1ZSSCjSgFet75lQX6Na9eJp7ZhOBV68I
         qxpJKmNsIUmY+wYPVj88/dGJpqtmGTl1dV2canmlmCm1oodWLIjA/HBzb+Jlcz4gaIbD
         Ds1+ZcnA/YKK12rvzryEGS779W02dPz0kApR+b6pzg6KkMgITT7tjY0KPNL5ZwH3XS6I
         wpM0JZ1R/fhjdumndU2kYWApwtWbwct9XmERuyq3pcoys7g+nGN36caKj+WKyivKd2t6
         RqFCxMxTcJYhcJeBR50HTxt3knm67WpwepDclg6SLQFWuy/bvstvUXDf73Y9PBtrYmGT
         fClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146736; x=1792751536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQiJOCq1unUjSKMoJUwERdxa98S1GzxFvYt/UTpkOPY=;
        b=OQ9MHqwfmQgcrbmfBLBBYAuDPO4bCqD6Y3pGDUsnuy1Ohow/NyMLjzmXqsQ956me6m
         Xtgi+I3Lc5HZo9MFcI1kBtsrAGs6lyCXq0+xTQPJc89QPkvzyVRoHNXuPXb+yfPrY9oK
         GHInEM1pOemNZCRDhluhS1cARQyv7uR45TSp9I0eX6hiiEMsB6Cas0Eg5IyAu8k1PiOW
         iqmz2pV9vXAIOvJLhZFlA9PrgU8Y1NTNa7TxBRXrUlIO6NQJuQgRht0EEYRjh4nh37lg
         4tc5SE6Y7FqPnFYbFU0xgaZT7feDHv46lk9pj0Mga42IAhs3hflgwCU1rW1POVKqiay/
         zrCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVv0vUzpa/PyARQ8H5NEnhd2mlvuFKzdSBvC+2sLzFP7JQvxRwPt6PImilzjxF+HYrbSLc8nFAUW9FObA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7kqd57VxsJxqm7olga4KxL/3Am+KoKjhK6+WDMl86nAc4Ih/g
	JFmkstIG1RKDi80QASgLU59Bc/IV3vCvys+A3iQesKvdQFFguaVlfBWlvf/bIKYewJrsHDWrDxh
	lG92aYtdU1yrl4DZNHM2fgvHGQCZTNRy2nm4Ayx92jXGi6aus4w2dNxeW5lNze9R8BV6o+koyzF
	c=
X-Gm-Gg: AYBFou275lR+gZQ82+tyy0Gd8eMa3LebMlz850JyWZHwbZsXxZfUpqefyfSrGqjXnJH
	VAINKi4Q8p69+FKongn7CovctUt4vrMW0nvjOtbh8Y/D2A9AirwEM97O9NjCTSFbXCWmljSmi/p
	yf4XVLMmRz9K2UtXWGItZ7Jm4jkGTkYyWFEKyCwz7zsloJl/QrKTrQ8YOPLpKnLTdRLYzlW1mY7
	KodA+UV0mJgxD67udyJOhOjR7JIarDkZyQ90Ub1ZJmWquV7P0HxcSr+5MCnqsQwVc7syWajL/AQ
	oma4OKPCyKBgNVcf4+8gIBqrLiPCP7wWW+uP42doHjtRk7IdZ0o1TT6OC2kodZM8OoArgSXhfvs
	rRnZaqPw0DGi+G+py6isUAA==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr4306683285a.3.1792146736362;
        Fri, 16 Oct 2026 03:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr4306678185a.3.1792146735822;
        Fri, 16 Oct 2026 03:32:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03a5sm58202066b.58.2026.10.16.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 03:32:14 -0700 (PDT)
Message-ID: <21aac057-68fe-4a63-a1e1-15770830d7dc@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:32:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] arm64: dts: qcom: kodiak: Add t-power-on-us property
 for PCIe root ports
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
 <20260911-t_pwr_on-v1-1-c9eee197d082@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-1-c9eee197d082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1fd30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: abq-WVLGAHtHaS12Oan4TRU93EA3dJnr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX1FNs+HJ7Ibul
 TrI5dk1x/vYwVDx//BRi0pIpUW8SlL1M4TpEfwR+XJ+VbgMtfCviFOzI5E0c/CBseeRUWSbxAkv
 WBm9Gc9k070mF+DeArMjo6MpAhmNA7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0MSBTYWx0ZWRfX84ukWsr/kVe2
 nSEnz/khmRK0FFMZ+Vxo1yH8cx2zJcyXNS9IDleCH5TAXQG2PkZjvB2GjALxjRGDa07ywc92fZr
 SdfkzkJBHPhN14vbPxwpq4wnHjJDknWEx6mopAeWFWTuXdBOuLHaQwFUcwQA4dR+1uuaZ7hzJ1e
 sak9VuvrO5TFWDjUmoGY1t53B3VwaxAd3kBhQxvHC2aXjjyzYJ2TBIH2/fesk82SRkXW5W3FUje
 wIhX1OW8O5mO7r+khoAgfZfdpaxxLHC1edU6KCNAQ0XogHrCSRCAB2kUgOtqn84ULugDxG65GKp
 7Qy55J1z+9c9/mWtHBNV/QTRqZDLNadwK8Rs9Tj63P6xJ3wPtE8M1M8gTS1qJKkOUO2lIlrY3Ek
 u++Cud2vnlEEGa/plJ41jJpmyGpN7Oicp8ajRUQ9c9t2uBLjg8DrQCQcMVzb5QNJYVhZpA1F1y0
 ZikNzSpLI/j9NXAPRzw==
X-Proofpoint-GUID: abq-WVLGAHtHaS12Oan4TRU93EA3dJnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160041

On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
> Currently the PCIe controller is not programming the T_POWER_ON value,
> which can result in improper L1.2 exit behavior. Add the
> t-power-on-us property to the PCIe root ports so that this value is
> correctly programmed during host initialization.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> index f2da3706d5c8..54acc7d9bdea 100644
> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> @@ -2306,6 +2306,8 @@ pcie0_port: pcie@0 {
>  				#address-cells = <3>;
>  				#size-cells = <2>;
>  				ranges;
> +
> +				t-power-on-us = <80>;

nit: please put it there in all patches:

@@ -2316,6 +2316,8 @@ pcie0_port: pcie@0 {
 
                                phys = <&pcie0_phy>;
 
+                               t-power-on-us = <80>;
+
                                #address-cells = <3>;
                                #size-cells = <2>;
                                ranges;

and re-run the list of SoCs that need it (LLM should do at least
the first part for you in ~20 seconds)

Konrad
