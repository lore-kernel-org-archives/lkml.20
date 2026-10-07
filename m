Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221B8493D37
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373381; cv=none; b=uzB4w8z87NlxjNqEFpKqmv6n76rN+Ki7vMnpcThwJXnIvfdFMgM6wIb5SKYt0PStEEY6A+/TcoQ18Fm99IoOtMLZ53mr+nwwkYetUma7I/NaxKZqFJh5e/NNtkgWF1GkVQ+5qCQiLSXlu+bBKzjHkSm7OVChIBe9eNAMWQ9H+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373381; c=relaxed/simple;
	bh=VkAQ5FXt3jQ8CiSyMqGGK5KKhS1BKmpYpJP7xY2EjrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2mMBUt2w9jYXe71VVXNmsh1KUcwv77Q9cWGEgoqCK1ba/6Bcl5/AuisMTEBq/042YeAT/AAjf9sXF2ce1fIVVSjFOwnYg/eD3dgM7WqtrrWd0vIh1k0gsEsm2f/glfxQTgasOgdqiqUvoHT+WFCh/ClO6SFZsFa88zKB1z9CC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ossFhE2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wk/uwU0I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ossFhE2j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wk/uwU0I"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BV0ir3686722
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 11:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p6hqW5/rFJFQA/00dhTDWu5js5aE9G0JpWJp/ftxyPU=; b=ossFhE2jchHW7/JU
	XSgMLbfv9mRDELVMH8mgKH6cs9HBny8UPw1NmJy2c5OakbnBh7GLXz6JRXc/YtYU
	AWB/3cRLwkU557qecyD1FNAt7zt2O+3DtLHuqbEzZ64zgGtt0T2aBKuukNkMC1Be
	PGy5g7kGjYVmuuVV8KLbXMxInw2xUbrxsunJu3FxRb0uHwMbhzJCYxLdrviEP1wr
	8/0zqu2zNv/QoIVR8fpuemAPmf54M5Hm1LSYMWbYauoCepuAD+zg0+SjK+LGH/12
	vzkN5bs6zvTsUrGmJYrM2Bj2PNyWRlKvqK5MpGQpUNGFSG14L6j0XkVIT77eENKr
	AzwExg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr86k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:42:36 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a4b70941efso3144994a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791373356; x=1791978156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6hqW5/rFJFQA/00dhTDWu5js5aE9G0JpWJp/ftxyPU=;
        b=Wk/uwU0IfZBNZLDnKFPuS3raayz7HFMvO3IjS7SRJTq33r912ip66hVk+AjgtznXA6
         nHNkLSSLRywSrMvdENyI4zKrp4I09TiVr+YD+Juu0xtN9SqkqQpNeg6HAk494/gaIIG8
         eO82fGQqhEPAyWK0bEuHAUnWdXjvX1KURIanDFrhXDTgRxkWJYYw4cSTOtof52DgN9BG
         Levyd9SzyfNMdRQOEGG2mX2MbcBylzjmPgiPJXtFhiqU/EROT9TQmuLOIfdDOqgA0F+g
         s7s2E1Rew8Vz1n0cpVsvC5ffYavxyKLAWxw1N53N0JyOZGKkjJrs7LMkIe3Dgyyp0J3c
         aYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373356; x=1791978156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p6hqW5/rFJFQA/00dhTDWu5js5aE9G0JpWJp/ftxyPU=;
        b=PAJaDhBuCUKz6tiG0oKHUSjXeEUiPXC8eDp5c0Lnc3JpcxPu8lHmchhnsKGSxfg/Uf
         xyo8zoPHSGbUVXOx7HSv9ZdLICDMaS5wg4jwB/cM5bANfJRR2eNfwYO67Sb7vJvERzbE
         lL4VOb1XO5nD+QJbeSUiWjBgEYw5E74ptjFvG3glYZ20lqgdY5GeYZ3yATbd4XczlNYG
         vhWPSbY/AXGm5kxXSH9tmfJty6SIOK+H6vsjr9Y9MbD0NMtGCQy080H2c+8n212n3yJE
         GamDabn3TXy/Ga4ZcYPfu9BFfOfjiYgjQLjYsk0/0xCLUzIZMNNb47V+rekCTgT3cfQR
         leRw==
X-Forwarded-Encrypted: i=1; AKwUvBzg7NnYN/BY/fWFWzMvj32nPuZFFkMTp30iBRoy0DZNuopY962JrhFgXLVe06tTwmDRqx39mmwrjkqVKkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZh5b806MM3D/SQNdgHGCHfLsDhEPrwa5bYPESOgCvMe/1WnU6
	chon8IR6ThMiu0eMCVp2qH6Mf61w6pw8pRg0WzpPn79g13rYhYaZJxZU6fji277VDUJ3Bg5JsDu
	72AelH8YycUtw99FezZzHVvvOtVivjmH26vpUYbe06M4HGwhlK1/UzyNEXlzrvB2SRukJjCE4VA
	==
X-Gm-Gg: AYBFou2BzT8SHEVwddH31pu2/3WByxdp/+BGwSnmEKUf1QCtvMLSR02FJN/9dhRQIWz
	7ZSgZriHHy7/bHQ8EPCepyXoY6HeEYYRvC9zK3ATXnaekyVIiGY28es4KkkP8OGTup0rhzDT2N4
	64wnJHYB6XD9zgjytOAV1yG64eaP+1PBSxPx74uajyXWHFD3O53rQ+XgwTihAoWL5qId3bSZKPb
	rbdMTvrFPD93fqaDaBs/hPGKlVRDZZrx6VpC4iYNqaHx5PJO82EshSd8rs1nOs7Elnra8KcyS6m
	3fo68POaHPMJVQI+EMsbZLFoXrieFcEfRPfXNy98y8o0ctg/iig/H8bL+PGImUUxRGAKc4IfqtL
	fsvdeOfQ0FPhU768sJHyeESaMtzkoa/8iy/iuZGWznfm+xVVDmZw0nQ8yRkG/EKELJJKMZPSFsX
	My2YkrOXoDg38HHPBT
X-Received: by 2002:a17:90a:e7ca:b0:3a4:b9de:87a1 with SMTP id 98e67ed59e1d1-3a8a1b8e207mr1765293a91.45.1791373355852;
        Wed, 07 Oct 2026 04:42:35 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:3a4:b9de:87a1 with SMTP id 98e67ed59e1d1-3a8a1b8e207mr1765269a91.45.1791373355392;
        Wed, 07 Oct 2026 04:42:35 -0700 (PDT)
Received: from [10.50.61.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0a58225b8sm1312614a12.2.2026.10.07.04.42.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 04:42:34 -0700 (PDT)
Message-ID: <1b8d82ce-a63f-4158-a767-693d0596b449@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 17:12:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v2 10/16] wifi: nl80211: Define attributes
 to pack SMD BSS Transition context
To: Johannes Berg <johannes@sipsolutions.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20260924-smd-v2-0-bb40094da1d4@oss.qualcomm.com>
 <20260924-smd-v2-10-bb40094da1d4@oss.qualcomm.com>
 <d1f53a596835f79580b2078a83820d98d795ae17.camel@sipsolutions.net>
Content-Language: en-US
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
In-Reply-To: <d1f53a596835f79580b2078a83820d98d795ae17.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfX01qJ3TVZB3AU
 uuqGJDIU3euUFQI+IMt94yFVevnhe1MryKyWAYapyhUFbgfSozoj+h8KseYmi//ucDJhjo20cm4
 ECVhf0XXCgT9A1WPxUo2XpPzJkcsKJCUtvY62LR9V/hY+KmGcXykKhJbIr/RkdyA7Stl0neN017
 ZBF9HA8paAUcH1WMxutm8u4k9A73Iwl5qTCXsjL43AtdeLzLxD+1K4wUO8aMUeVHNZ8xGp5E63H
 emF4w4TES2lKwndIyOAJRghlxAcPa2k7fUmctc2kn+IFSExZIP75klj6uigIjCPFhRYaCkSJIeP
 FLdLm71Tc5L6qryGYZ5gnryVt583irk34TNwMQawWa2AF61VJ+fXbYMXTZGaXicc+2tPu/y9Dyv
 hvCC0mlvmTPkiX0Z7W+RIiDSVo1gIpuGK7ATJBRsONTDXfyxIHQeveDzMBuDfRwo7hsnQopNRiU
 TQ+Bj1u8yG2z0GUK3XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0NiBTYWx0ZWRfXxxKoSAIwR0su
 nW7MVe+qWCot9fJkvp5aHdB+SB8BlDJ6qWBMy7k01fGXfYhQ7WCNvDAuS1SCWrOcEiSo1VEiLiz
 ZQur6BZM5rercSsTQw+Lz6sD4W7DZhY=
X-Proofpoint-ORIG-GUID: hd_e7M8XlHLs74djZpB-687jU5EqJ3-H
X-Proofpoint-GUID: hd_e7M8XlHLs74djZpB-687jU5EqJ3-H
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac6302c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Avq_DrN9Xaf3zyNzFDUA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070046



On 10/02/2026 01:49 am, Johannes Berg wrote:
> On Thu, 2026-09-24 at 08:10 +0530, Pooventhiran G wrote:
>> Define nl80211 attributes and policies required to pack SMD BSS Transition
>> context along with NL80211_CMD_FRAME to be sent to userspace, and to set
>> and get the context during roaming via current AP MLD and roaming via
>> target AP MLD. Without these, userspace will not be able to transport the
>> context to the target AP MLD, program the context on the target AP MLD TX
>> and RX queues, nor fetch the context on behalf of the target AP MLD if
>> the ST Execution frame is sent directly to the target.
> 
> The commit subject and message don't really seem right - you're also
> adding all the commands.
> 

True, I will fix it.

>> + * @NL80211_CMD_SET_SMD_CTX: Set the SMD BSS Transition dynamic context for a
>> + *	non-AP MLD sent from the current AP MLD on the target AP MLD managed by
>> + *	an SMD-ME. This command carries %NL80211_ATTR_MLD_ADDR,
>> + *	%NL80211_ATTR_SMD_CTX_TYPE and %NL80211_ATTR_SMD_CTX.
> 
> This is a bit ... brief. Incomplete, I'd even say. How is it meant to
> work, e.g. this carries PN data which fundamentally maps to a key, so it
> seems the key must be there before it. Surely the station must be, and
> it must be in the right state (whichever that is) etc.
> 

I will update the documentation to mention the required STA state.

>> + * @NL80211_CMD_GET_SMD_CTX: Get the SMD BSS Transition dynamic context for a
>> + *	non-AP MLD associated to an AP MLD managed by an SMD-ME. This command
>> + *	carries %NL80211_ATTR_MLD_ADDR and %NL80211_ATTR_SMD_CTX_TYPE.
>> + * @NL80211_CMD_SMD_CTX_EVENT: Event reporting the collected SMD context
>> + *	(requested via %NL80211_CMD_GET_SMD_CTX) to userspace. It carries
>> + *	%NL80211_ATTR_MLD_ADDR, %NL80211_ATTR_SMD_CTX_TYPE, and
>> + *	%NL80211_ATTR_SMD_CTX.
> 
> Why would this be async?
> 

In ath12k implementation, firmware and hardware are queried to get these
information (SN, PN, etc.,) and the time to collate all these data across all
valid TIDs varies based on system loads. So, not to hold the NL socket for
(arbitrary) longer periods, I have made this asynchronous to cleanly report
back with all the required data once they are available.

>> + * @NL80211_SMD_CTX_ATTR_DRV_DATA: Optional (binary) driver-specific blob.
>> + *	Passed through nl80211 as a blob; parsed only at the driver layer of
>> + *	the current AP MLD and target AP MLD. First 3 bytes shall be driver OUI
>> + *	for the driver to parse as required.
> 
> That's just a vendor command through the back-door?
> 
> What do you envision this carries, and why couldn't that be defined
> properly? Is the intent to have some kind of optional data there, or
> would the target possibly refuse the operation if it's not present?
> 

Driver data had mgmt information and WinStartO equivalents. But I will move
these to generic definitions so that this can be eliminated.

> johannes

