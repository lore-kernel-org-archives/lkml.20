Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D74028E2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765925; cv=none; b=TpEifYdHfOW0KXoou/U2JhspKbhz+cgBnJgMTo3xD6j0kcx2E0yZMmq+7tnQjVl0g7YV/SQZMW1BVaX5Qyh7SXBVZl3KrVx4dTz5xP6NrkQ0oQH79QMmBuBLcAFAxVQASsrveUuGrvORPMIN6L89GpzOawqk58wYjkx6D3XIyFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765925; c=relaxed/simple;
	bh=45G384sHb/muNeqlCokryNPXhln5CIbFxbacPGlagfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbHgUcZ19KIzIAFveNUXHDDxKtqrm/2sC6kQLL4hKNilXvBkX9A60ha4/4Ftu1brOtPpdlXeJQqfi74nhu5+ekYX8JZCk0IQzgN9LvaemnsRzPogUelL4HqNi0QY/v07MmRMCDk6TEYcChClwRlfqSPzVq74Mi9yFfb+keyoJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XH2Pv31A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLVwx1lo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XH2Pv31A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLVwx1lo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877NNtv333056
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tse8UCFve8e+o+mmsY6iw6x2prwa5xpokEYT8L9AOhc=; b=XH2Pv31A0BcrwUNg
	iD2QZKkvWvkhY1Einw4iD2a6LSLoUku1j14bcUVQ9eVfkThzinmMCqR69LUw8gzR
	U1HFou/47WFx2Rv0pfJFV5eY6/UuZ7MQwUziRrDARaLrkGgC2ivvkw641BLMRIJN
	G9/wQPNrkEReJrml5/nWH2dY5116CdN1R23hF/LBeCYAJVApoiYsJqQBcu5jaBT/
	w0yaxUBTT1MykL7hngs+9VHgeRBY00zoNbWMcq4/bswB6vcrkWP/ml+r/gXnXYwU
	YUHmMUWF9q0Ftc81I1JT6Rk2PEwJodbvSROmbR7jq7RV707CuwPWFvOC+Ed6SiTN
	mW19LA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua82pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:25:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db050d469fso13470355ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765859; x=1789370659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tse8UCFve8e+o+mmsY6iw6x2prwa5xpokEYT8L9AOhc=;
        b=cLVwx1lofadyfcO7l0wC27yr/UZThQLYZmslV5TmMGCFYeyh3BsNc39EET9TvSdx/W
         jdZZXBdbjunpZBBm8by6qED8zLJt2i2PpZnc5kPJRs8G+nvv20qxu0lXpnI6lWvUK3bM
         WMSbvWFm6xvH7oZ1rGYMwc/A22FbWl3StVNsXZKT3mKhO+aUkuOt7vH++5koYYEIqZm3
         bSxoBztwW+kVrX+u5gIVk329VTRu60BGzEwpc7IsQn2W4LeBgrxZVWi/Aq+DOZn7u1Y+
         u0dRBJ4AbGEvXBOgsBSuZqTEL4WpkrF4f+dq+kYhrJin/CiqsAJXWOf5cvDQoiQS5YpL
         5EWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765859; x=1789370659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tse8UCFve8e+o+mmsY6iw6x2prwa5xpokEYT8L9AOhc=;
        b=bBwXHRLidmEa6x8LlH4ab+DFx1hYhMrh7PwENOFSwWwX94uOaN/FxPpH5bD1pvQ47+
         eQzDnRXpAI/Kb1qZewpAMTYDGWPizaakTeNLKlZ655L394yf5pnt3v5d/IC83YfDYc6m
         5zdC8/eWDUJYQG9sH8aTf1SY8vm4jq61V1YBX32kNxxnGJJm+gqP6H3NutFkoJQ/ncxc
         dbqhhCTNDyr6ccLjkIQiLjlI5EjhNylVZrLWnrvKum/WahW+P6lEEWBM/JvbL09rieOJ
         aKclMeqbWawww+EvJXGPGHQG4eLx7ku+w334tL43hR8Y0SXk7yhiws2Xshr3aVh0ktja
         uXXg==
X-Forwarded-Encrypted: i=1; AKwUvBxdFr6vPs8R549PaeRoG/dxslGFh7SIkPpNV1M94uKdtaaFYc60BGNNiTmGfibEZmhfi3sa2r1uMIdqOv0=@vger.kernel.org
X-Gm-Message-State: AFuF++laGsu5jD9JJcuLINubuwAUFVU+0hwE2DJ4BRplC993VJI0KuF2
	rfNqwVq4nXGOz4ZqqkGcF7sngfYT1FvASuCWFfqaUIVHd9RfucGrk03O760Jkqxqn0tu6cKAoup
	BmWjLB1rPIw6TIyVxiCAyFKQQLX5GM61w+0vLrhhlFj/bJcz0Zfi38r0YYB5zKX8wFG8=
X-Gm-Gg: AYBFou0fyOFHsSr0P/eQAtVxHU+x5V3099b4faN4YJ6Dt7/qQtPeocTxweRvJXfs66q
	4ib4nza9nBkroD/nxKZe+hbvx8I/zmu4cXoQKW5kGhum2GyB6vnkHv/surCQSkjIMkvuAXMvgeR
	HRwiY4wM656UwSfayAgXOZDvR+XURV4I1FWI4OCcDR9GlQYpYPfGxt999kaGy0sH7XQlj+Id7gQ
	EcgWSaEMve5Q2f49BxLxVhbMpyqq+1oKptBpOtxso8h+ZyJQooGwktoYh1lDihwFF9WIeReFc43
	oPy/aDBaIztJnLRv6jbRBfBrOzs7Ng1O+2jgWUowlUeG4/yh/IixpnX5PAshju1wnS4uilUAhRy
	wgoGvJahrAgNHStBM3Xhc36/x9AdGAdu+LQ==
X-Received: by 2002:a17:903:37cc:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2dafaee6576mr219280285ad.1.1788765859224;
        Mon, 07 Sep 2026 00:24:19 -0700 (PDT)
X-Received: by 2002:a17:903:37cc:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2dafaee6576mr219279925ad.1.1788765858714;
        Mon, 07 Sep 2026 00:24:18 -0700 (PDT)
Received: from [10.217.219.15] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm23938529eec.18.2026.09.07.00.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:24:18 -0700 (PDT)
Message-ID: <e677e122-8653-4de6-844f-b7ca7154e3c0@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 12:54:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260827-master-v8-0-596bc81c5cf9@oss.qualcomm.com>
 <20260827-master-v8-2-596bc81c5cf9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-master-v8-2-596bc81c5cf9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t1ddtdADGPOeuJhMHKl3-_XiLgrzWrCn
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e66e1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QSOts3N8JwC41gCs4uEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=ZXulRonScM0A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: t1ddtdADGPOeuJhMHKl3-_XiLgrzWrCn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX+/FPw0cG+z61
 hKhWOFPudcYNh7OaNXtbyGkdcsNcLEIjOc6TRttXMvvrhUn04DYNSPJC9Vowx3++dkNcW+xpl8B
 r9ZIPxeE47IE2z3arIeaU4AnVfy/VtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX1ruxtoT9AFhX
 spEVccHLo41iO53BOPWGS4fPn2Pw4hqTLCbeU7kbPzFrSEugiiXKmyWJSIDI8FnJ3ZVxPF+c8ap
 aCP//kRwbDuSe8urftxoqdELdDnPk7xBSQWhndL/nO6+IDIOf2gpex5GKx0NLzWpBUsYlfeUUxw
 w8qc8XOvEsVmu5P2RJPs0EUVrmQJ77My55jAHTIlSQbJk3niuUF49IDm/4eYXEHtFaECg53N9Ll
 sXQGWVhH1lK2y3zHw3UK9WWC105tF3XWoo0/eDepAFt+d5KXEa5kO0jvlIv2tqxPzI4U0BdxEJx
 Jp+V0XwHZRGwbgEZSoKzS95FKsAjD5ReXumI1jVrIqV6Mv9qEKRPb0aEbhn57jdMgNTcRTctfkm
 floKMbniO/VPcCCsRaGOQrXU0kEImi+sNV18IlAU8Wn8Tz9HmTDL7BTdCMIiNZ/UbpeQu/gAa3P
 J/9xF+CamaTSn7rlB3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070078



On 8/27/2026 5:57 PM, Aniket Randive wrote:
> The driver uses a static XFER_TIMEOUT of HZ (1 second) for all transfers
> regardless of message length or bus frequency, causing unnecessary
> delays on error paths.
> 
> Use i2c_update_timeout() API to calculate transfer timeouts dynamically
> based on message length and bus frequency. update the timeout per message
> for FIFO, SE-DMA and GPI single descriptor transfers. For GPI multi
> descriptor transfers, calculate the timeout from the combined length of
> all messages, as completion is reported only after the entire batch has
> finished.
> 
> A 10x safety margin over the theoretical wire time is applied, with a
> 300ms floor to account for I2C clock stretching and other situations where
> a slave may keep SCL asserted for an extended period, including faulty
> devices holding the bus.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
