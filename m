Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368008;
	b=xW/lS88aLoLKtskZbKTg+7eO3/+guwCYhp4M6Z3PHPAqC0ZTN8o6K4DgdMMkr25N1I8A
	 AOLmSX21RY68UTQtrLOUtwyU01+KerMswia9Rq+1tZLP7zyytQM8xA6pdIhH/vKyzmo2v
	 LJn/ZA80aQm9p+wzeiKFKiBAsO5epWWZ+CHmjoEZyfGHoKiI4B/Y7XDhf1DAEo489W3XJ
	 jHwnh0vLwlE3k6tQcj7mRrB5o1+PcGG6hCZX31DtYwg6HnXQGvCC2xwF5yZs29R2ZXAgq
	 DW01Q48GVESQRUTdRPzM0WrfW6ehxDyvV01zey6eh6k/bwZcmCAgVNBKZZMCJX2f2Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0NcigoaWZbBvhzKKergF0yshnBcIAC0oeCoWwdEcoSY=;
	b=2aHtdCdk5dJrqHscCC/4gOW8nN38MTOdtuzV2WiKnE9Qi/b5JP0s0oBYVocgomcjjaDv
	 WDbfkiDtvi/i36W4OPNumnKr+U7Q7e5vLq2B1q1aZPCKkx9trGGQUm4FnQcHRamF8m1N6
	 XpAmTIleyCfyRXqnqmnx95gT1/nKsutmPCSWW1a6poofR7ZNzJ2kHZUe2R5Rd5HX17Gb2
	 7/iNYzGoxHr/eTdAHuF52JSGjbVAbrYe3H8KZ8jXLYysjtu0GqgnBCm8i/7w7EZJTIq89
	 NRT5D9cVkM6bfJrThQRrgvYRVjlld2n49XrwIwn0yOOgwoW6h2QlXD9PMBTj3EP8m6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=No443RHT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VQvlmlH2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FAB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68FAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=No443RHT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VQvlmlH2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBG2He4144618
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0NcigoaWZbBvhzKKergF0yshnBcIAC0oeCoWwdEcoSY=; b=No443RHTXo5OlYX2
	d3LQA14O4Fe89DgHq8bilq01x1XqJcERXdk0Nhe07kpLU7nP+fEshnHDYMVt0h8/
	O6SR2pLzQQuKlrljpQeKazew2uA7SXbYASvEQhu3z5c+oPpaOnfB8k3GpaXLQqWP
	8t/CzVYSzcCxeqWQfVnrccktgmrwxppycvtt/2D0lGoq7AOhxEo8WrWQ2S3hudUC
	8TASEPMUAXmD2NdPwfnxMRZXKMWl9aikMuoZKOkCFTpZ9pR7nJjek2cynFvvpDL5
	uFVyiqhcbtXk3Gry1IQg8+Dsyzdbn+pLWzeJlGp1iwtBsGJoRN0GmCCZYRC/tQ3V
	i7LUmg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme75398w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:46:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bcc2f50fso24698241.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793368005; x=1793972805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NcigoaWZbBvhzKKergF0yshnBcIAC0oeCoWwdEcoSY=;
        b=VQvlmlH2UQHAzOD98irgxVXphRmAm7wqucp5idkOviO9sByHoZgk1JFBnbj6KyZunL
         y6M+jQXtGaJEBCIGGw3sLGUhSLTQwyXWIebztA0ajDjHkQ0VWCfO4WFdM/auuYvbN5qZ
         2WMSaT3neS6DYmhpEVVeZu5LvoingOyx0u1D6320kG0RJEUJs19S9hwY3/GeVDr/gq6u
         mIgJNurNoWQnl+ZwU/4Zmq/doEjo+OOhBpVCDaAMI1PXCVKxyTcFKIP22LrEEvYYikWM
         W0zQf2cdW/TMUVsJjDgVXZR6IN2Pk3j5Xte5kIRLRdKHucPqCaviFrTzO5Zifk5I3YTk
         PxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368005; x=1793972805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NcigoaWZbBvhzKKergF0yshnBcIAC0oeCoWwdEcoSY=;
        b=1JAcMae2PxscuiQgyU0K3VEaDVGOQ08BgvYP/+bZT5FHDpc3SlINfR2XW66wG71k9E
         WCzcB7zy9CZvvcIxx2HM4wGOBFdGAQCmzF5iydcXaPs53RH31b/npHK7TV53M/ejk9/J
         fX6yCtdDRoUpHxfCGDDW9SOE1lKNGcdP/eFYXeIm9FHvAygUhPY0STic6uJiJak3aFbS
         lStcFW8YKKWyzfO9160gsRjuS197gqG/Gedy3dpp5y7s4bph0Q51NaIzJ9PF9KekjM4h
         mkUpF6/bGPh0NH/w17HXqllBjpDBqllE+QcVr+oYT7kGV/Vyk4nOCO1N4cV989MD62hb
         c4FQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2aq+N8VUpREONA4byOa+jhos/DRNPPPiX+UyDVz0T98ouCPV5In1bTDR+77XYNenJAu6Bs5C25TiKac4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKWgqf1K/mhlX6UxBz2zoOSMCBCBvBhD0XqsAJi2wHZqPjcrmt
	vCNK5hT4XsIQAO92E9Wi0z105DWkjw3sTPUFt/xr7p4Hc7DSxK6/vt3ol2CnHlDkqn0ivtosOw9
	SXGtFNtiAgpyFQ5NgQVBlL/LiS/DX5/Tlrj7KwyGpfaiCgBqtE70e/D60sbmRzhVvUjo=
X-Gm-Gg: AYBFou2shslddpPzYJ5n1yJbRo5ZqCdrXlpoBnXnYhDNHew0wEhySvTFoeAUDJgcGb2
	GaymgRFFHTdFq0Th1rKhZDIrrq08Mn78B5DbFAEbd6223Bs/5QwfSbj7UGvSC7Z3Khy0CHXbjXv
	PvdZhjtgd/O2M5buRDFTRZZVGd9bGdV+NFqktGkMxxv20jLsKn2gvTanGtsDk8mY0VYeuGA6Rg+
	hr66pe4VszcMYoYcqkeYRDaq53VQX/MNCWxZ6/+lJdEUAPu197pkOI0oUUqvb3wPWRaro1uGXWO
	r2w+0m5JA2GS+DRFluhm3Sr8nj4Nw4s3iGuNN0/k57Kx8smnwMUYEYBpmKgCOjuLyaLT/WKcBmm
	KmyqwcfPzXt2SCYFy08cX5IYZ3pONoMwTOk0IxMCCjGhM/e/ahsLfQLbFvWXsoemyfP6VogZ/
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id 71dfb90a1353d-5ec6883359amr1068950e0c.3.1793368005437;
        Fri, 30 Oct 2026 06:46:45 -0700 (PDT)
X-Received: by 2002:a05:6122:6310:b0:5ea:c984:5ad5 with SMTP id 71dfb90a1353d-5ec6883359amr1068930e0c.3.1793368005039;
        Fri, 30 Oct 2026 06:46:45 -0700 (PDT)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174dbsm68328466b.3.2026.10.30.06.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:46:43 -0700 (PDT)
Message-ID: <b1bf792c-8571-417d-9c98-f0b330a3abf9@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:46:40 +0100
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
Subject: Re: [PATCH v3 13/16] drm/msm/a8xx: Add all CP_PROTECT_PIPE to pwrup
 reglist
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-14-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029201730.151754-14-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OG3V2AHr2dX1Om2l84lgpC_erpTXV66w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX2D7MDbvVWnPZ
 7bKV9TBWSNxfxqUHoInSVykz+t/P6D7wXOGF4103ojYG+C1sUTLT4B81oIaLOpe3A9Xya+9UiLH
 pptPsQ0dLnHkb4EvfXiPzNQCYPHBBPUtbZ1Y2nmg5EuC4DjV2uwg9vbBYoYXXjbV+6G4yBJIjza
 b9gd6ZJ1MzcBzrVhlAX9zVCZOEBajYhZj0KUaEcExNdZkgUCeTbpiPfydeDkw0xVHEdAKzrruIw
 e8FKa5ySdf0fvwZMyUTUQN2XdrMaGI8rNRT5h7EN58B8Yjy8EpzfojyZCiTZKPHg6qZOIB1QnQF
 Vhsikj++9CkXOXtJxQBrfaYsJdiYSISj1WXyh2UL6NIqdAzH/D+EhbJARzuRsj6asibg3fDDGS7
 F6ROBNi1eUNemN/GzY5Ze+PmMazbQ/I8Bz1Weah8sB3TZFYjtlRxT8TMo6PbWFqEVxX/1S+9mrW
 hApZ2E/1cN3twjUT+/g==
X-Proofpoint-ORIG-GUID: OG3V2AHr2dX1Om2l84lgpC_erpTXV66w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NCBTYWx0ZWRfX4rd71NLeLeLA
 I99xgLHZdH5cXE8GCOUdH7MNMQnDmGEzeDny95sFfr6IWFB4wMVA43Yz1rTDjgT1DhrGQmSUNvr
 L0MvT/1QVZdGLfiGQfXH1FOCEMuSgWQ=
X-Authority-Analysis: v=2.4 cv=KdtHIgYD c=1 sm=1 tr=0 ts=6ae49fc6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iG851RqCUpnUipWvLlEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300054

On 10/29/26 9:16 PM, Rob Clark wrote:
> We're going to start using more of the CP_PROTECT_PIPE regs.  Rather
> than missing to restore one somewhere, just add them all to the pwrup
> reglist.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

I was kinda hoping we would iterate over them in the code instead
anyway for this one

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
