Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574634;
	b=435YAaEFJblELhlgciAM0ZRJ6+7Wg2KJhDF1DXfGP+OgHcZOqTq6GVoU+5aULya4knbN
	 ialArrNC8CHdPDTaaPH8fipW1GNrUOWJ8al0QawFvgsgiZSTdOPfXOQo9NRLmGydZOfXu
	 S296yCkX4NWkEdxyBBAaaLb7t4eS45Qr6BnjyvUug/5MovuiSWsABH+tgVZR7+Hp+c5bX
	 04BplZTUqNdbHX1yGiB5wCEK5ouJIY6ZDVrXOuZ6qirWP+6eQCQyDcciglBrpabC/GKhZ
	 NhY0J6p1axgw5DAz31AsorazrAwGXrS8OzaxB8jKqhKQK7NVLBdJGETvP1k9p8w3/AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574634;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
	b=RaFhVst6AhXenztqDuH0TGUx/kNtKi0zxLlxoy9xrCvKaZDkqKq4OWwm9BaLu8nWAvTR
	 TeFLZrmKU0Ai9rBIOjpPQYf4WgxnhyLqT74LsmzGqTwLqAjxg35UW3YfwZrFQ0bc7UJPl
	 XyDxALTbRie7lbUfKhpvVoKTtR2poC4H8mxHFVdNWhAG24mjPW5nGP/76lBWRyv/rAQiu
	 DIT6zywcspKTi9iQYnMm/OfsJMsktZ/d8i7uyXZECMIh1ZyxMmDGPAy5kmpZ6uUKLEhpD
	 TfoONwraBowyZ+fyG7PdkrD1x3aDBUZ2ih1CRX3rETTssBr9vnkob3Yjo3V7e/qln6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p5GhBL3c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok06dmPK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1282E606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:23:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1282E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p5GhBL3c;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ok06dmPK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5irOm3018345
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Ka9h8fsX8IsL44aOy+qAfpa
	60eGKQuL/LRaUzSn1uA=; b=p5GhBL3cgmAIKO6loMAHo2v0SDF8yHtFFu1gZTru
	6RZ8tfjhGZAp7kjI3yFZ7Zx1q/Ca7UBTlcJMVsQRNAWrpAehwfKBhNqjQOEDKvsq
	peUF7q0WmZkVDEinhMbAoNOWdQHnz4BoXYqRH4ZT/496tq1qf3LpTtUioIP4/oro
	RRwpySuxsQQkd5zOUlBJSKfZFtLcrmLPTXYuJZgNxWEPF9km8o+ZlonwLIppNy8I
	nnklXyZQUlepmPou38QjRa7eJtKesLnTqNcRNaqDX5w4zX9Nz8g+bhCdg9PqWvdj
	YrA397AdFZ7l8Yac+4znTMacz83AZ2bGhWie5e8pKnTLIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3n1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:23:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf7856ffso133018685a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574632; x=1793179432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
        b=Ok06dmPKo8V6ebagInItiz/FC2QiTEsZve0yNvMYK9dRc0bj+Tg2rxSppnyfbsr9bE
         NJrjAdENn3Bvjb9ugBXFlzpvvxipnf5i8UctCC86wLGmvxm+jEEq4zOV1iTfouh7XG35
         pipr8AgMr3e9m7clJS3OYNvZ+iM7IS5RGEfObYnXbZaLUDviF8yfXD6/lQM97dmAg4Ti
         PEHgRcsArM485M4kNH52wjP13wBU4MN3KwSjFEW04uk/1E/jKQV/q6SUkxtJcFLfgQwQ
         H13+MMAbYZW8w3PcIfvSNvtwRwwCfXWoJO+cUmISLPsyoYOp3led/M207i1+lNIusunh
         7nNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574632; x=1793179432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Ka9h8fsX8IsL44aOy+qAfpa60eGKQuL/LRaUzSn1uA=;
        b=XjYJGJdDPV48SyiXPmKRqSo5U49bR2jd0AjPT3cXdfE22V24F3ZMwjNdnb7xT4csqD
         bjA0WHTqJ6e2RF+unG/EFaVwZ0UEo0Qy8XBLkEIwxsq41oQjjF057PXJMn41gDUxExNs
         bCNHgd2h6KjR3JwkxaqwxDJTRnvkG+ZhX4VIFbRiPrH6bLsJF90J4rK5Yq+0ClwiuXTD
         DZmj+umclZ10XPnhxjVgS16i41uQZGc2RdiRCtixHl5AyElz663/qKDIIZfABuq64pa4
         QHQHd8FdcZDgQHOriLlBxfyMy1sY4hNyEMQXE8Ynnw7mPOlXGfxjnSwHkuL5e00Alcay
         me6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5mQuhQbMpG8TU2HbgKjZ0YVweCMUMyJBopxN9hKnahorfWDKjuug4IWJqKLCVCc93bgAXmfXzmWIPbDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuOHu6xiOyb0mLr2ghlMPDsmSrdD3bWeJiVTusu34Sv5lPwAIK
	wj9F1bGH50YgILT1CD0nSplVbcXPBudPSTFDvRjTR8AxxODhZDKYKk7IFiKej6hGy88HGu0++NR
	2wmTzxwBhRiWEk+3vsh9d65kWV5LpGikoJnEWc5+F/2qflBVNbUrQPtcsGgPBpRcDswk=
X-Gm-Gg: AYBFou1CFD4V1iR900PgbJFZkqcRf2ztWJ0CMG2Sijw9OxFZSdkvC+9CmZDLCXUIacG
	S8J6dgK9V6wOwXsHsNPYstAEAcNKmzQcBkn8VR1gzkPSrkC7Ci8WeW/zLNH+p4NetVFMIhIFoN3
	Hr0NJJaWJywvuu2vTx4lmb/8+zqUz8JUgkQYsZpG4CdUqWIYufDSTfl2u1J8JCWh+iRESFPuq+k
	2JNByAPa92B9v0hwFE/n9N7MBiDjTOP2nzcf2bDLvLYcEj28VFt6gwD5QR2LtLSiS6EUoP73om9
	4lWmgJzyFpb2TQSBJsq053AnuOAkh6nZAziYPAG3Mtug+pSUrH0bHFBHPV6kgXQs3zx7TKJLKAh
	onKwfCp0P4k9GAw3A
X-Received: by 2002:a05:620a:4542:b0:93e:f0b9:505a with SMTP id af79cd13be357-93f57faf951mr311698185a.58.1792574631899;
        Wed, 21 Oct 2026 02:23:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93e:f0b9:505a with SMTP id af79cd13be357-93f57faf951mr311694685a.58.1792574631307;
        Wed, 21 Oct 2026 02:23:51 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eedesm3949754f8f.14.2026.10.21.02.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:23:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:23:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
Message-ID: <cvz5m7jrudw3mhjmmf7aikj4kx4n7ooxjhye4n3u2mwnegsm5j@c5id5su5nd5v>
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
 <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX1ki2CkQ2kmCY
 Ivfs3KAnMV5UP8BaPb7TpRWVlkpnMNxGrDxCUTJqQjjBYjjdDz9nwjCIJCphZZMzzl1gzqWDmX3
 5PNQ4Gkbh5GCqBdAO18RW5T02woZxWuUDD5vpdSziMV+pCz6lpM39MFrr0XXIgmq5rhu/2d8KR2
 0nMb3M1QNfhLtmcmCor/tQVlXwrKqPkIz7btS47rkF/JttMAHQdIq1fnyYD5OD0kIZ2q9C0O0o+
 V9VHxrJ7Wfr9gjf1VapWz2nz2xJlC5KrjtPFWtA7f3LLmJMmJqKzSgAQJv8yGOW16YggbrRx0dO
 DTNWbtEvWkPKt36cbr+eIlyDxq9H5pO/DQrg2+nwx35m8biUKS2topplW+/P92Ti+BQICbaQ0at
 pNdrPTFlJgLiIL/XctjjlhI8Gw3A2Z1f2BMQCXS0AseCORMkWLWnwfblOHFAJv3lgCgjHd10Ycw
 SQyx1qUoEvA4pEgZsaQ==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad884a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=D3NtdokKTziOo_a1GeEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: j1Fdp2R2qTMxlurQYTcb1obcs8budJ_I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX/sc8Wi0MuqHu
 RnIezTp/WovvqRvdbcz8ZanVqCxYFgV7w2M7DdhmmuVX9TU1DVO8oizP1Ai6X8nbVGshD2DPGMe
 UJ/k4Mu/PBSyZcD+gdtQ9GvkioIMML8=
X-Proofpoint-GUID: j1Fdp2R2qTMxlurQYTcb1obcs8budJ_I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

On 26-10-20 10:40:45, Konrad Dybcio wrote:
> On 10/16/26 1:17 PM, Abel Vesa wrote:
> > Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> > the ADSP remote heap memory region needed by the Audio PD.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> > +			compatible = "shared-dma-pool";
> > +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
> 
> -> "0x1 0x00000000" so that 0xffffffff is also a valid addr
> (off-by-one)

Will fix.

> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks,
Abel
