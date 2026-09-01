Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE347F773
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268423; cv=none; b=OVOqEavhEinEwv1FjaN/bgQC3YfgEQzQUG49PrIn8dzXszPalxcrNtwTljQUs9+/2/spxwgXpD2VgwF9VxE8oE07JfLPr3/w0DNuA/GaHx+hFz8LwdfSRY//KBjtmcP1rISQZsjPA0Ul3pmb4m46gs3lKrDha0F9dP7/eCb0x8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268423; c=relaxed/simple;
	bh=YQAKN0YiI4XtvjUzINbwFPm07lgR9cOPHmT1QSjACjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIj0/cV8IVJERr4HBEKeBnG3OgsjNdsmbhMkRtWlFAOz+EMA/bprFVR4WjHLKbYhdIoN+JiZyclyqN2pMx72JPToC1gKmAi0LSm6W8+HG0xYfBKVgmRigISJGmFaMecAn3SUihZlAPiBYENOZkzgIYcXqobWuPRmxm/qlWVr8VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHb9FEdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WbEbVV7l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHb9FEdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WbEbVV7l"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJdpV2242288
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=; b=VHb9FEdttwlDQVrZ
	KgQWURvBgc/quc7TJyE+w3PbTByG1vYi7MHXpu9ZJbFakEDPqZ4ZLJ5C8tyuymiD
	R+7dKT8ekg+8+PoVKU4ggvVUbzuk/9RtZisOjUHjmR+l72TV/pukHRzOIuvbLNVD
	7yDFMG4YlzfERKbO20hUNq4/TE8DxxhwyYPS94G5MR64/53lnh645KAJSCarKly2
	OlrL5uiFHdktT9sXd7p6bVldos6htxzX2Dl9vmHBKWa1Cy3BVcHKCBO7aazcYBTW
	VOig1Ndd8wD5AbKUiPrK35o396tKkUGtp2+2yjZ3O8LVxUB1VBuAJXdVrd8mvoNL
	XuJV+w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm0q7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:13:40 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c67601735eso130568e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268420; x=1788873220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=;
        b=WbEbVV7lm23Pgd0kdaLSc9q45Jwv4ZPb8f+JWIeFAZ4Eao/yUz/udww90wvAuCQL1Z
         o/yBKpVonxlJO4rTizlaOuNaNqUR4AzZiABx/lAe2gH9VjqUR2LbvCJsxqBEV0XRj/m0
         aFxkayv78/boB8LhS+AMAukr8Z3EPCl+LEzUR6oKNgEARGwkC7Gl9i8NzHJtmSncoIn7
         NqmntY9CohFCTpp5UDDdSif65z0cRZSrdT+V2DCMkup9rta8sk1L6hW0lQQfjvyapT0r
         DCHPcrn37pjnE+FJYp86wYI2JHRjHn+9wtjURnp92+F85F23lv5Tdn+JlIh/o1sgXiYv
         BwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268420; x=1788873220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3xHTMAfV/QCmIrjOhNyUOsdra0RGuUp/HHKVpaq+N0=;
        b=SuGX754n8KjL4Bgpfid6TpF7+iUZc8Ja93qW79PiHBIuQaGmxzt09pD0VEpcOLW3F5
         Upw+vvZgMingKGPjwI0vKpjPsAS3cupnY9bE8N/f/AXZmAQow3rsuPd1+41pyN5vSwnx
         2+tW6DSMVl9sotA+S646DMAh80KdLdwpNIACFQCscw9Fjrg1nlD8g3UZLcXdtPANZDbN
         Gjt9WaaFNeavcc07F2Hykg/t+CtQxk5D9C/INTbR3mUo/xzuPCegFL9Ne1MXJ2Wcvi6p
         3EJ4cp8EHaU5s3l0n4khvexjTjoiMVux5OP57+a38AGcaS7wW7aPsIVhsEtKh4N4gwLA
         FSCw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7mi83K2zHK0DuftkLtcl9NEq11D+DBOZQBxMmA4YQ8Y+dNkLIwvw4Mq2WnAIMU4u6lJJupYGiUs61KkI=@vger.kernel.org
X-Gm-Message-State: AFuF++knL2A5MdJ6IBoivGYhgQWVkvXIvGA7DK+8buQFGZJBt5uGsX/z
	nQbJsDfsq7K+ZadP20qufml8T14eAuSl9ZUcWjnhnkB13k9II5vHDkjB1uHEf9roIrgncxYP+KF
	8N2XHQUT2gOa0iveSxx865U8pIqY7ef4XLX9lRFU5IB60MVkELQ8DakO0uW9gEm2pdMY=
X-Gm-Gg: AR+sD10wlnBHqTSCN6SISFph7Rv3aDeve9ITg3BsdLGjGt8tzgl7lAZ8qCL3iDwrezn
	BBEV1PNhKluOBktgQ/cKxYk7vA16I/Dvb1ryuyWO8jxSz8K4jMpNfdazvD+aonVBGJUGXpFQ57r
	HvRysmIUCGOtOtuSz+hjR51ikwbCsxMxxOzk3pCrtCNJNc/QH7lpDcFS6zzu9Z8VRZnNDFZ14xn
	ywZ6E4yvBbXO4kuVFqhPKUxS+4ZCxxTFfpZ8xMIawjcQQdH5KF3kAkvGgPPcu75yS3X5mjiljsd
	HsLQnrLguVi2z5ome6kJeXEDUROsFFYhT8DgX8ziUFA/pSEt2ghGQAIjhfq14PLNjkJIwI2vuwG
	xq5NT2KjSJr9UBa0WnqvS6w==
X-Received: by 2002:a05:6122:6302:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c680fff6fbmr3837920e0c.1.1788268418599;
        Tue, 01 Sep 2026 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6122:6302:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c680fff6fbmr3837859e0c.1.1788268416683;
        Tue, 01 Sep 2026 06:13:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5e1esm2901431e87.2.2026.09.01.06.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:13:35 -0700 (PDT)
Message-ID: <a57699e0-a0b4-438a-9ea3-db913301d90f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:13:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp:
 Refactor init regs table definitions
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-4-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1niquw4mj0Xm_MxbnRM4-55WNctDlWq_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX8VlJ4YqANLtT
 fjrJ8b7nc3XouFfmRad2HsAPrKT0BK+w8P14F0cauIJ4mZha4mLW0LN8lU/UzOYrbanE7yplnxa
 HhLqHN2aY6IbTS4/X1veYvSSXfoguBc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX5mlnqF53pHPi
 3JCm5QvWH/czZKiFeRfTXjEEe6aALpqMOFkqoTvn/Jji9AnUwU2JkIIsqqYhA7nhdPfCNH656Ua
 pYdjC0LfBsZyY4qtozeCUlbIooAUApZe8SCeJ8gQPbhk5jW+IhHcmVtH2erWrQyrSYI6sf/kJaT
 e2nz8QDPAIsXUocZTX17fekbOIcmv5yVmBTuaD1v91x3UihVaZRu+nVcaN6bUM6c0j4GlNFOsXO
 tuuiRMcqWs0xORp6DF46Wk68bGT4GkP97C6YafnnV8kzvRqQZdcMPTIvyojMVwh8VyvMpYyMccV
 hVQnRrFVMaC+TCgA1k3uYXY+xkHr2TPmLSvGi9DKKF3F+uZRQ6GmYa8xyFhD/UtsPmfBGjEK0K4
 YUAhcBtPBPQ1iH8gmvHHbYgjNcThxYJSievwZmaPRBtB6KiZK+S+8Yk1q99GbpwoVi1axSYrquj
 rWdNI0YH/laeME9jfUg==
X-Proofpoint-GUID: 1niquw4mj0Xm_MxbnRM4-55WNctDlWq_
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96cf84 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=XBovKe10WAMj5E-UAXEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Refactor the IPQ5018/IPQ5332 UNIPHY PCIe init data by introducing a
> helper macro for register/value entries and converting open-coded struct
> initializers to the compact form.
> 
> Also remove an unused include, drop unused macro register definitions,
> and rename the IPQ5332-specific PHY CFG register macros to make their
> combo PCIe/USB3 scope explicit.
> 
> No functional change intended.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
