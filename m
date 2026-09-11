Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8611D569F2F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789158833; cv=none; b=TvERb5VnnKySSyTCskKFWuE5AdhiOqRkShUOiZyOMDPpdkcxdP4JC5E4Bvxm6Jof4Jx5ARFIK7LQInudiIZfNSzPtVDQ15MbmAZvbdY9QXBxxYINMTxMRFJLrCB8ginw/mDdP4pZizYHa7v+XZu0OWsP0iacwmqzEI16+4CEBps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789158833; c=relaxed/simple;
	bh=rxrU9Z3T7gqcTgXERMJIoMWeuJ+okTnGoXWmPT16i54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhW/+IW5zLZGOBynU/ZcKe7HWMpElo4zux+vDwZPS3h/VUxgILwcBYD72K3KpL3ho9pCfWanw17agXvmnJTuzTVaCMkbl2/YTIu2qaqGJK8fFGFBT0oobqSBhgIz9MHgll4fzAXlbezQo3RxCRDzMd3Y13IeoFskF+Mkirx/UkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWrsTIB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AMqROgCq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWrsTIB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AMqROgCq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BJTAca840369
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IPqDuq0pRw4lbQ5pSC1g/+jS
	lk6nJKPgi6L/QwNJUG4=; b=HWrsTIB78dnLABjMeYbxEbLDbye3CEUHxlSc7qtO
	wHOE5HKd+jP/6SVu+SCKlmXOMXN7KW88Emsoz8j7g6vEpud5lCROY4Euq49oE2FO
	2UZvRH+S9V1D0PqG2JYWmvCHzCEq/kdAVSSgbiW2xaGELB1rut4as379V7wWfsv2
	LTkvxZlQcsddTQYGlkJp49ui1JPxGX87wxzaX7XaEAHGQmo2WvdgcoKoCStOLVU6
	hHGcasJ5EaBM/WD5i8j9MspjJ/TpvN14ePOMU+wmhJQNokfHHucPCgvgIA/v2FMK
	3gSiXqIfyNAqSCbFlj4EW+QASRWwyTffbkwPstOiYE5cjA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmqub0752-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:33:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8627258ef12so2441599b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789158824; x=1789763624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPqDuq0pRw4lbQ5pSC1g/+jSlk6nJKPgi6L/QwNJUG4=;
        b=AMqROgCqhSw22EBzlQuXcJ+IszFpx+6WLvHiUu4d/3H/1LHEsPDkDktNlZMBOo1SE7
         M2EsbfGnPC+UVN+YH32l5NlWTtVK62+c1ZPCFSlEdrA5PwWBTYg3JRuFq5OhJz5R9krq
         jOlkDxky5qdTVHqohAqZqT0JOrcdUBKUf7Ht418cUxLGvH7S3FLbiA7piGmzrOPmVWeb
         X6GvgpANGf+Q/xlgDtJ9o6GwcscT9BW0fKhe7TpWqBPi8gJDVNJdnVdJCsanorbs4HT6
         rQpbp8sU9j+1ss92/l4GFgedmpDVwz3r3i0RWN6gyYpbGq824hmLFLtpXpIsQ4nQCtCq
         poOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789158824; x=1789763624;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPqDuq0pRw4lbQ5pSC1g/+jSlk6nJKPgi6L/QwNJUG4=;
        b=WJu+PZaV0eCVEH9eCiFECPwAuADeNRWggcH6B/wWbt5aXtxjXUDJdwASN15vtZjMRl
         BslWDFBMIOIuw/iIu+Wf85Y7olUoD1WXNJNY82ToRUUievNhkN9WywwpFbAaLRvJRDlw
         c70/AuWe6VV3nLKrJGKVXThsZtrg0KcvljK0ARMVfAXZHZo0mR78guDd5PaTWrUlsHJO
         P/CbofEiT9Ps4ckF+V4IaWp8sLzS4yY5q+nZhnCDg2+/awPHBQnRrIdFQBxEjqmEA+CT
         NnAqIdk46pJvnsdywzc21yUViRlxBreZfRK5EgsSCnOovEsnjIeytEeregX1hxt2O8lf
         l3NQ==
X-Forwarded-Encrypted: i=1; AKwUvBztc0qdI6VLU6/x+PIGAzgCmOssTvyAZBOQiTa4HrGIMzWDa1LEn2IuEV7KBMrpr5wGY2u8CVyBfT1DJ7s=@vger.kernel.org
X-Gm-Message-State: AFuF++kJfFGaNgiRSmxpelPb1ikQe794AnYBwjtTubYIy+rzvHpgQGEw
	2GgWAPeNyMDgBGL7zJH3T9OpK1Lg6PzUIuwuCFoomKhQMycFeyKaCHiIkAjmn537raz9sRPQ2/w
	QSIaGbA4s2r1mUYCCt7FaFZ5QqJfWJ1VOemlFcFW/VB/l4Noc+KpdkmGO0lOiGKqM2rc=
X-Gm-Gg: AYBFou3KBDEaSdt4t3p8DO3aaeWhgtjvsg8fEvOU3GsLW3nS8fjdbCpsxgniTpW7I7c
	4+70MAIArm0e3XCDU7uHFQ2J7tY+QmJpVvt2v9o2YnXoXjKSgCfrWHkKeSZVRqs/ZuvolWpFRtb
	FiuosfbA0z5lgUSdWe3itOE10f+Ah/xSwDnnq90LBavlABj+ymV/eLnKQs6PaHf0DfDLOggicHH
	JUdlzPfUpiJHSgofMXcBwwoe1xUDqYQAsmhJvX/zfELyeaVUd/DotJohq3VdH2SKTzoP0LGVbdr
	Lk/6nAw3jwKZTdP0eckPJYn28F+jj1Zvi4NgQi6eemw3+eE83DsDeEWvRlaU3rXTHNNsjHtiEG8
	4L0EC6qIAucZxepP4v+aKR7AvyMSLzw==
X-Received: by 2002:a05:6300:6cc3:10b0:3da:f21a:23ca with SMTP id adf61e73a8af0-3daf21a255emr6162784637.22.1789158824629;
        Fri, 11 Sep 2026 13:33:44 -0700 (PDT)
X-Received: by 2002:a05:6300:6cc3:10b0:3da:f21a:23ca with SMTP id adf61e73a8af0-3daf21a255emr6162746637.22.1789158824221;
        Fri, 11 Sep 2026 13:33:44 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365bb6ba0sm8410818c88.15.2026.09.11.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 13:33:43 -0700 (PDT)
Date: Sat, 12 Sep 2026 02:03:37 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Cc: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
Message-ID: <kgay5aouizrcft67vpfubbmvjiocsujyt3uw6uboyt5au5gdzd@ayb2t7iq7mho>
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
 <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
 <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
 <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
 <e9a39278-dbc5-46b1-8d74-581dac008b3f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9a39278-dbc5-46b1-8d74-581dac008b3f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI5MCBTYWx0ZWRfX8i8HDna3JsDg
 4zNv5YfuX6yG7gphkyfPSLqpDyR60RqnQ+1V21AjjCjFOaCFUx8tapgjMKpjH8+mKrmuirvGBZA
 cIq4yQ2DNVCgkqtFHnW3oSCnkPPQXVU=
X-Proofpoint-GUID: 9Y3fZETDm1j_XxW5fLy9LZvWz3c6Fts9
X-Proofpoint-ORIG-GUID: 9Y3fZETDm1j_XxW5fLy9LZvWz3c6Fts9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI5MCBTYWx0ZWRfX7VqieRHGax1l
 gP44Lh1ewQNbqasrrlcFHcBMMEMSoma8RVMwpsBkNzWSVrODHMXXWy1ofe3Rre+t5pvFd8i2TF7
 MUkh9ueQ2EhERKhuvyuyVbOeHUO2Wzcs+ZSfq/LUXQkI5RAOtX/tZcgbZqeKneIfxHDQCPT998c
 Ce3AKgNu2u9LiQv/wkxPUvkG3l+paEW+EvzFUcgk7DyvtJO9EBm4+5LWTz0FvkMmzxk5hqhKdKl
 PNSizL+exVX5FRkwSSjUeObR5rlvwZVwRWbAYosIX3s2tjphYnfROSsvpfbvjjjrGSPIFSBM0jA
 uBiHDTeQisbmWOXxMg+PKa4IdMaW9+QbC6W8nib4Feg9Ywcrd2LDt1W9y5ojfIhL3eOrqJAivvs
 ji2T2VpzEKJ5wSDrm2XP+3faxlYx+KLVEoDwJr8JPoCW3g+jZRvrm3etIE++byimCSjrMYvZsSA
 u1wwgqG4FwQDAFflAtQ==
X-Authority-Analysis: v=2.4 cv=LqsHWXdc c=1 sm=1 tr=0 ts=6aa465a9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=0eChJe0SIIvfKPJWEoEA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110290

On Wed, Sep 09, 2026 at 03:50:22PM +0200, Konrad Dybcio wrote:
> On 9/9/26 3:16 PM, Shawn Guo wrote:
> > On Wed, Sep 09, 2026 at 02:13:35PM +0200, Konrad Dybcio wrote:
> >> On 9/7/26 2:06 PM, Shawn Guo wrote:
> >>> On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
> >>>> On 9/4/26 10:16 AM, Shawn Guo wrote:
> >>>>> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
> >>>>> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
> >>>>> initial device tree for the Nord Ride Embedded board.
> 
> [...]
> 
> >>> - Supplies of Nord SoC
> >>>
> >>>   vreg_l7a_1p2     -->  VDD_PX14
> >>
> >> Does RPMH require HLOS to cast these votes? Generally such supplies
> >> should be taken care of in the fw
> > 
> > Good point! I just did a couple of tests by:
> > 
> > - dropping regulator-always-on/regulator-boot-on from these regulators
> > - dropping these regulators completely from DTS
> > 
> > Both booted fine (the nhlos software for Nord Embedded variant are still
> > under heavy development though).
> > 
> > So what do you prefer, dropping always-on/boot-on property or
> > the regulators completely?
> 
> I think it's best to reach out to the PMIC folks and ask what they think
> 
> +Kamal?

On Kaanapali i see that VDD_PX14 is actually controlled from the audio codec side.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts?h=v7.3-rc2#232
but better to confirm from the audio side.

+Ravi Hothi 
can you please clarify? if vreg_l7a_1p2 (VDD_PX14) needs to be controlled from APPS side for Nord?

Regards,
Kamal

> 
> Konrad
