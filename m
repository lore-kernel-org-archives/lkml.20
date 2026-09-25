Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270F248A8CD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329704; cv=none; b=P7IClAAyyswSOeMtiy/LCijHROlWdgPa3MxCAcno0q9ncNzT7sOqe3cSAgYIoZaBHp19ertNbD4JQ9fhwyltRlN3A/2vWN8/fN4/EL3rND4EVzWUyKP8EUgmA8Nh/kl2pqG/TTW5qDGxIM78dcpLG++9Q7E46aI1wa4taY5rkbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329704; c=relaxed/simple;
	bh=88IX1tmHXms+pmBDY4fQ91nC5iyYvEp++1JbnZD9ebo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDeXZBnbjR1zQLPiF7wvZauB6o6OGwzjr0uOkHapshL2HW+/DCZbiZFBWlH6a2jTgesDNJFRxIpn6GpWuV+SzrHycHoLgx2dXyssW3QJ1qq8KVM/IshN+zwKAWODRk/vB/x9f/h+sLRiQ+MCEuxKh8hT0xtasvFi9OqwqTPz5jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dse2ZHvm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNgOG6Ku; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dse2ZHvm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNgOG6Ku"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5InBj600190
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bKpKeKCtxn641s9Sq4IOPtWi
	CTENHPj6K3Ie8LJNauE=; b=Dse2ZHvmbRwKbQP7R+1JgOqw/uBIw700fb6P7xrE
	ddICyVpmtmwVTC0x6X3jcTqEf1wQp2D130IE0unoUC54pIPv9+eIRYW20gyenzLh
	9kUvJOJltqYj2j3r5RBktiMtXDaGB/JDeKKGOHovw3Ot7F8bqVi5Hd4zs9FzdUu0
	IukVBdq3eCM/vjYByd0LdPj90YDHoFeYFvn5bYaAkKLv8oAbV4gy7DKdfnVb+CzZ
	2qc0erk0CZpX2ApbzUWtNzL1WTuUQnbnE9zVtW3W3iorMW1hE5WKPPkVyhG1zG6R
	bU3YnPYYdeEihgT9b969GZNHyn6R2QgJj9kWUSwDM3PUsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvrsx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:48:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so135233085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329692; x=1790934492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKpKeKCtxn641s9Sq4IOPtWiCTENHPj6K3Ie8LJNauE=;
        b=NNgOG6Kui08O0Ir6IVebm562Y1t1OsoOTzfAAca8tqPCwQse8qHuxU0rahl2t+V/pg
         gwcm547UYOgI1OAzaV8/D+r4L7QIPi7maXCp4das3aSZ7UU/j+BSftGvz5+BXrLws+Zl
         9rQ271FuBdM114BpU1rAyet5D0buN2PsBQo6Adm6KvFg6r4ZXOMJ5NoR7aAUNXpeyUox
         vSESBKRaaFZBgxzSzb2M6GTj7x/5y7vAbvtJy9ArAM75szpOb4vr49aatxJFBz1OcQ4x
         cuitoD2EtJPQCgIW4ARU67QEXKirWKCxD7oe/UgdG9YpnCytMRe5cLmUJMIY0kH1dl24
         x+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329692; x=1790934492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKpKeKCtxn641s9Sq4IOPtWiCTENHPj6K3Ie8LJNauE=;
        b=o3SWwdpfCmXh6wLZc88lc0fu9PymJ8mZFnDADnIrpmFptcJVZrxiE40tHfFeKLPNIq
         PP1pu8tTcaXOWCBPEt1AiE+/ibrJ7uT93LW8H6p54N8vpiYkUXrCxNE7B2D88C8yRgeW
         ND1NBOBYbNtFfVMrlj3Baphdnjds736acpVPJVpB+x0nLTpOuNPdiWvVT6HidZd0pyyS
         XTqzkmp8thA3Sr/eUwWyGwmnoOUWL/Cx+N865v/xZF6SPA/w4tM1BD6m4pB5plbdhCVR
         Q5YT/oj3T1oXYpuQnZXXyJIaAlALYVgknvxQEFPQ++4cymc4MtqTxbtWk3+ra47Jpn3y
         M1wA==
X-Forwarded-Encrypted: i=1; AKwUvBy0NlfN2cWD3VmnnOdlBJVznwPBvFg2wPfYcaGofzSBt3BLQy78eCkZWqEZ5P/dZJwZ21pJ5Tc5dBmAKj8=@vger.kernel.org
X-Gm-Message-State: AFuF++nGC8UAcdbn0SZaf198Z9CUxtCDj7VmYmPytD+4Fg+TJR5+a25A
	IrC2ccGaa3fqYxJ1iTxn/r/PUghT7aH9h23W00aWg0nlrW7s7pJLLfyaf8NII+SOR+JJyk8KGfn
	jdY9p/Y21zCJL0/mtXve+lQ+WtvZaSwxr/0sDceAg+CYuKnne6r4meiuHke+zfum6jUI=
X-Gm-Gg: AYBFou2eMgcf8aeM5AtDAkzrfotnEUxXWlsWT5x445SXYdiwz4IMa8AHOD1+E09Bvng
	yss64IbWrdRaZeoavfYuJCbQymT6+afNtBphRnINjHC8bzBMGUmQjoiocHfcWN3EErqy3WI2rCf
	ONWu9vsNXzAEi19YXIEVBloT/UO3vw1tTNOTLo5P0lzU5vEtH+Y5yXbrjaBFAT23C5jtCJyA3Iw
	nXKiAOhI0phzVKiKRriR6d/iqmEEXqfyNpygidZFAs0zOwDV9gkZuGnB2lpWN/HdmMf3f5aU+lC
	w4SNX/eh82tYpR8dX1px1ULjyd7MYmayE4ZZ/2N8sXvApo5csTgXgj6WqfBCKx7FWZhsK52pLp7
	72hc/Gvw0b9hyUnI=
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr347260885a.15.1790329691488;
        Fri, 25 Sep 2026 02:48:11 -0700 (PDT)
X-Received: by 2002:a05:620a:370a:b0:939:c7dc:8712 with SMTP id af79cd13be357-93c43c51d50mr347257885a.15.1790329690987;
        Fri, 25 Sep 2026 02:48:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff2884552sm29134755e9.10.2026.09.25.02.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:48:09 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:48:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <nwpxqyjjusepqubva4hsf7e2wfvvigz22p7yp6c2tblezz7qj6@2s2tmiggu2dw>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: XJolYLy7u3Cix4AXJaIer-xPDydUFQVc
X-Proofpoint-ORIG-GUID: XJolYLy7u3Cix4AXJaIer-xPDydUFQVc
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab6435c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=IINBPA3gYupw0c5GNbcA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfXwWb7z7lqZd7G
 rASCL037JoDb3BpHcwEelXF3NuQ4KUXabrHXEG5wQlS6MpV3WtL7gZSKm7eJRo7GJ5Z/T6feixc
 Yc4/P5i4bquUeuIk8utCt+nseMQ0dXY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOCBTYWx0ZWRfXy6M/qkINKoAW
 EXb8iMNBIro1hbK3vGrcdMI1l43FazJIbevYgUVbzWmcJpwy43devKzgROsMtyleI7CUjhdeXqQ
 XyUhQD4stYdxmG2FNhsp1k7vgevzOAKoZeh0sMzFEbkU86Qe5DWrgHkQAbMRlF+WZpo3ZZulnY3
 sFELoJfHUDiw7DLL8MXbK6Z8saYk/ANKfLFS+lT8EBVUTe6iCD8fuJTmRdg73J/oPZUpK8Ww6Jo
 X4XdogpZCi1/icMEeDOQMi12tJdVbewrJ2NMpfSfmakmMSBZ79wWpfcslt63JEFnfKjiOyBNOZ/
 iIPIYJ9CSCoQU+Onp2QuEmbGrWZSqWMy8WRIxKRDGW9c24424V3v0VsD7ij+K8iFlWZq0Xjf9Bc
 N5F/SWG3Gs5YFz03MC3Vgcl0jGlijkbKSEyMm9VhMHUGk0dCqqUHREpAVzEAEGcfDTyJMAVGh29
 V8NUqPD1Dni4+cOw8+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250038

On 26-09-25 00:11:51, Shawn Guo wrote:
> The videocc node supplies only the two XO inputs. videocc-glymur.c
> expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> parentless in /sys/kernel/debug/clk/clk_summary.
> 
> Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> is listed in video_cc_glymur_critical_cbcrs and is therefore force
> enabled through regmap, bypassing the clock framework; the sleep source
> simply keeps whatever rate the bootloader left. The orphan still blocks
> any future rate management of the video sleep path.
> 
> Pass the board sleep clock as the third input. The sibling evacc node
> on the same SoC already does this.

Same question as on the 3rd patch.
