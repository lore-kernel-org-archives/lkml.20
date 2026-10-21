Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575064;
	b=OY6xtyQ+z0k3xMYChpTBsnCkHqKOxQLfHa890EW8MmR7GqlW8FZTVzLQ2Gp9qJW/fgUm
	 PsTtJx9tKILgQCjlg3axw46tl+nvDUeiZfH5m9hm8IQVMVJ0D7FdeN6+q1eTP2UADrld5
	 8kLmHa+HzTs08LkIpQ8H4SjdC4EhhE6eE5glQ9x59O7nLrKjAPAe6BhygCiXhtH9+3Zj+
	 GfOS4wwo4UQM+pfBl3sJWWjRQStsfehUBKVoxitCUsYM8L+34/YKcqlN5ObTazuVSMRjS
	 THe1VHLipmlgE1ecEK/ZloOFaNmkGH7YIrIvMZPHaN/W2GiICl62w2BBX3Me6CNEH7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575064;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Smr7Z/3piMyOza0AUKfxwXfspyKbzW8yZL1Hru6qUxo=;
	b=bvkWAO+RGkbO5KRdnfDwoEpt5n/xf9iqD4p5XeBw6aT1HbYue8XJyiJ8GAqs6fqoCnZa
	 2a3/i6/0BkE8KzRIGNmu8f8JzaY91VKLSM5KotZgsW3yK8NcwvvDTYtnrUlpPJBRpniVJ
	 PmrUzVnKqE2NSSTjkjWEOUzgoJfAThNNevJhqrFxGEWsCH6h0IW4BD9rN5y7hK/eqLlt7
	 hY6gSJizJka6UFJx5IkWQHrix5DNF4oV0Voj6GH97SZlrIaIm1T70CfJheRlFdTBNcoO+
	 6ahUoHgkHWQ2R561pKsF1jNVq7RJTmET0Kt7khTJj6Fzug34qrBT6DG0JG3WeNEuRcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyF1QSRL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cytphHjt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300E2606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 300E2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cyF1QSRL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cytphHjt
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8VSXH2795069
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Smr7Z/3piMyOza0AUKfxwXfspyKbzW8yZL1Hru6qUxo=; b=cyF1QSRLF8ir22kL
	23SSE8mJBUhI8j8RI5KZQ31i/WFwX9cHa5K3VruoNYQOMbwZq//tqdhQf4Uyoefz
	yn7vPPgQL0jEvDPIznsOri1mhsClaq4cQMYkBrEuCZmBHkNpDNYk/iiz4wp9k3kI
	yLfJmZNiKiZFPD+1JjwrLvH1O+zRs5MtNhT4YjTS1ikDx4Wpmcb/GZY0zjzbdkG3
	N8KZ4UNIkSqug6pCn49RWjF9pQzaee8V0Rh8tDvI2zhIEW5BGC5NV7hALU6eFytb
	B8Coy1WRVZ9ja/9+Kqqw3JYYT24yGwr29D87kPjxKXZZ7e/1ubnsSmkGiIPx6N6n
	COizoQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy78cre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:31:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso1622261cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575062; x=1793179862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Smr7Z/3piMyOza0AUKfxwXfspyKbzW8yZL1Hru6qUxo=;
        b=cytphHjtwYMY7TDyr7YPRCahv9QPlg2sU5eu2k22fDGYEY2VBNciD7L5d4+oiVtT6h
         6pGuWytNzBAh6WvTmzqeBt8AKV7ox4xKD2mF7tDJ2TW804F2WCnzLz/qMmYB9NYKfrKH
         muPJS2E9EY7lQpeLRcUN83JSXHbv5WmAJ0L5HwfG9FSynUJ9HrVDxCA1bRPflxKraJUC
         MbH6IXDfukRjG3aCywhfu2uGZ39sqnNFGV9lGJ73uxcQcCpRsRgNQHCj804ebzfNNcUP
         A7znUCG214dWbz+cS/6gbVNLhNNz1lFjJuCsG+e/0EF0UNrFb5UIOfET6+fSHUN+0qC3
         vayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575062; x=1793179862;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Smr7Z/3piMyOza0AUKfxwXfspyKbzW8yZL1Hru6qUxo=;
        b=faNoIOytLvabnwcmNVYagGwH2UB0xWMBrratYJwYsz3V4II2zaVkkyciag5e/Zscq2
         TGA68Goe2NYvuOJxu2a0wV9Mx4mMvFKE6t+XCv25HVMEfFligYhFMLgViLyukrB6XZlP
         Q8GJYQFNnmidKN4mVfmMTUyDFniffhAEnKcFnhlmcdlWa6IlpvsTT240ErywdTVtuBVu
         FU5c4Uhy6/NGkofq1q9vrEGAIYDV4/k3p0TKv8kUgLJ6YruGNq6hHyAJ4saSPqv0PlAT
         4fF0sVb/b+HyrxuG14lpM+KboOTiy+0Aw5gSainyU4yTqvq79/uPN+AbJgM0Qdon9ft3
         5njw==
X-Forwarded-Encrypted: i=1; AKwUvBx331uNJN9QVdmG7IaepWwhUYhDLFKhlMMB5MelmJkAqn2fevL2GIqxojM8qLrmsCyd/BYKTaEpAgWCJi4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl7lWTVBzV1suPoF5X8HmoPrSDKkr948VDepe5lpMfdv1zRxj0
	9rJZZkuXmq1Ix6egwYC33OrFOJgeOy/byzrN1cKnN5hEmX+hlVVLhCYaLanC09afEnT6/gsWgYA
	8+auH+58Aaz2vmhw+hSioHwAHg0Uv1oTBTpEHNn2XOGRlOQSEBZEGmt7rIALicPr6AjA=
X-Gm-Gg: AYBFou1Rz9l0UaHH6UElLmZXonBcLJbzSs4VfAyLLIOoDMDnf8WMXwqSfI4Y9gB1YBX
	g5ej5h6AyscC4Am/rlGFGLvcduvEqAhj4VdEEw3EuG/307a+nkm4zbmgi6aWj3HUTp8bIn07Z6o
	QgABPyMVM/Eku5waihcM9LiFFCQXO4GLkHxIK3Pjw4BM/wnmf4C7Dhtfdv52KJk72VfPI4n75ne
	H3ftd7B5Y+zk/NPjecfNWAlOS6Sk3uapLqY+PKP5U/W/j2GxaUhi6qgCLlDqjxxff5/R/67VZri
	xlejqtEXs+XUhVdEt+gDqbAdIds2vn6lhQbSYm5vYC8OaXlHmzH0gASAeYlomcnxSPqjFWoXsbx
	Dqu9+B3TbaGH1ZzWTAYOFxg==
X-Received: by 2002:a05:622a:1a94:b0:51c:2324:666 with SMTP id d75a77b69052e-5369b7b364cmr27185251cf.3.1792575062256;
        Wed, 21 Oct 2026 02:31:02 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:51c:2324:666 with SMTP id d75a77b69052e-5369b7b364cmr27184921cf.3.1792575061742;
        Wed, 21 Oct 2026 02:31:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fd700asm56543566b.52.2026.10.21.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:31:00 -0700 (PDT)
Message-ID: <4ad0d837-dbbb-4f93-8c1c-8d2b1e4f5ba8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:30:58 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] power: supply: qcom_battmgr: implement battery charge
 control on kodiak phones
To: Federico Amedeo Izzo <federico@izzo.pro>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
Cc: luca.weiss@fairphone.com, val@packet.cool,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <DM7V9WDDVQ2I.3THP2TDPTP994@izzo.pro>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM7V9WDDVQ2I.3THP2TDPTP994@izzo.pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gnz7Pqp53cavHee9VjhwzSSFGG03roNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX6JgxgQ9JOtfP
 ZPsRPkGtB/aIgFdKhl+mm1Bcdbrk9MbRvYnKPuSonyFHPoaDa6QI0d5YauBbO7/3NLclqCGIxOO
 mW5KKJ5ZuL0KKPcBEGH602Vx8O8JyZjgGIhU8wDiKEGlnn8GPbZ3lMChytwCak4b+SFaTVuiZ9i
 1+GaobKWAZim2W8FvznzIe5m3f/0jKY0RFPfQptV9FeHqQRNA/qcEp/B5pYDSzOjvq32Z+JpeYc
 SZuEV49by2X5fK4+KaADgdVhQzIDZo/6BvcWjm8ZmJQD4o3d02dcfD6gCOufCrvvVpPDq6B3Doi
 t4u3nqDjytNGosa6pYh4/lzYxBuG8ghJ2l2RDzDuxTi8BxtAx4UncnpRVqQBNSK53oPxvCOKZSj
 o7LXB0oLAsaLN2KMlvuzDDcn/nkFomB941FDJj8BAAHJs05t3q8Mtq1etiXqFgVsMNd2ROTJaeX
 1DTMh9/Rdic+16yKH/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX/ZgIrz+9ly0j
 mhMj29r5LflR1qXfLzRJSYTazVVSX1wpXCfy60hrpdW+ALhJysozYfOhAMHcc8HMx0mI7E2K5OP
 XMkax6LeYEgCS9O05hni+1MshmbNifI=
X-Proofpoint-ORIG-GUID: Gnz7Pqp53cavHee9VjhwzSSFGG03roNO
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad88657 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=IUnBqQRzFFqqQajOH8UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/18/26 11:46 AM, Federico Amedeo Izzo wrote:
> Hello,
> 
> I want to implement battery charge control support on two kodiak phones:
> motorola-dubai and fairphone-fp5. I kindly ask your feedback on my 
> implementation proposal below.
> 
> This feature also known as "charging limit" or "battery health" lets the user
> limit the battery charging range to 0-80% tipically, in order to extend the
> lifetime of the battery. It can also be used with a lower range 0-50% to
> prevent battery degradation on devices always connected to a charger.
> 
> Newer SoCs like SM8550 and X1E80100 implement charge control in the battmgr
> firmware, but kodiak (SM8350 in qcom-battmgr.c) does not support that (I tried
> using the same property ID as newer SoCs with no luck.
> 
> Looking at downstream implementations, both dubai and fp5 implement the ability
> to stop and start the charge with custom extensions to the battmgr firmware,
> while the actual charge control logic is implemented in a kernel driver (dubai)
> or in a userspace java service (fp5).
> 
> My plan is to expose the start/stop firmware capability of the two phones using
> the charge_behaviour sysfs property, then implement the charge control logic
> (start/stop charge depending on current level vs thresholds) in the qcom-battmgr
> driver itself and expose the sysfs properties charge_control_start/end_threshold
> to let userspace change the thresholds. The scope of this "software"
> implementation would be limited to SM8350 in qcom-battmgr as later SoCs can
> already do this in firmware.

I suppose this is something that could be introduced at the framework
level (+sre) - using a "stop charging" command to implement a charging
level cap.

For battmgr, I see there's a BATTMGR_SET_CHARGE_RATE (0x6) command
with the following arguments:

struct {
	struct pmic_glink_hdr hdr;
	__le32 battery_id;
	__le32 charge_rate;
	__le32 charging_path;
}

charge_rate being the % of full charge current that is allowed.
Maybe that could work. Or maybe there's an existing mechanism that
I failed to notice.

Konrad
