Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D7B42124D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792356622; cv=none; b=sJchHcQW5UPsuGzeRjprKcC/ISCrb47Ms0xrZvNZtiiAo4s9VXBnavzfuf3hZ3xRL+a0h6D9hIKRcAVYH1K8G+ULu7b0W+X2YrfVqi7HVgovrUPebGE+y1YjVUOKNjEkE1dnybvFFxXI22pndG8LotiJ4cd6v6lee3hVSOkRqNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792356622; c=relaxed/simple;
	bh=lggYG3UIDLXk68ELUMdJZsGAmWEaotCE/D1HZh4Dk6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nm1Eysi5357RUGrOVO3W5qfH9yatP9nxuvE9+7nsAAsXXguf3p2h+oziV6viOqmsxEnVqRfqFW6JpHE02yFJBy+nWEKZb85zx1oFvb4z1zCat2CRXyx8uelAVbr7QS1Ai/3IxSh2wQSabG8K3Y3uravuYcNGGg5F1BLObe6yPTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=alPDUBmX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JJ4bMjEg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="alPDUBmX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JJ4bMjEg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IKBOhs1211388
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=; b=alPDUBmXZj67otSF
	nWir/HmgR0gxkaq9xp6Blsw7Nya0qwRi1CBwOiPBMf0eMHnvVwQDhl5fdH4Ag/UL
	LaA8KFy8Wj+qLHgKRVIP1Vaxj6VWDxhQbs/9tJnAiWfvyUhr368UuawqW8vnG7SS
	ODCoO1dfucNZky2JVCE+IGAt/BYrSW+aLK/ICn9DQhApMT18Nskfb3r3TgXgPuBo
	i4Mh/KCxROcs6gibcBeRmDPwcBiuc2DKpMOd0sHQ9sFwPi2U7Fuw6qzBziDRZlgC
	Ki6jYeOX2lv6KKFD+Le25U9cMmGYoDBfzyQMugtnw0hiLx3KyPh61BlFrHw6PvCv
	yYg+Bw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0kxkxnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:50:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso263458685a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792356619; x=1792961419; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=;
        b=JJ4bMjEgG0i7qOqHcjV6d7CrgkwUo0qyq9jGvb5G7IG7Hyw5tLMBfwP3Pju08JaJTo
         /0C07N0ViLpobKwG5igQIsKZUaUH9sBXllgS51ePLrBCzUixIfmxM5J8oS6Lb8S+sh/I
         QHLSGiFbP8r0vsBuzjHtCFRqGa6MFJVmNGzwdehf8tpAoNdzlNA1ROxgONvHD5WJAM2v
         FS5knzdEjldEQyeTTqxhMoqjU8AWWhavFox9XxuomXO0/y5+G+VJHi2xlYP6TxpEmqLi
         ejkUIonMxvEgQ6brewVIa2bCOp1/xrBZiszgjQqjxqGgD+O477pOiaCSGvNdnOz9YLdz
         uVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792356619; x=1792961419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qjeya0IdQ3BzmDbZDR5yncWIDXEvsfN30Jepiufy56k=;
        b=FBh1mEuWml6bbTkc/b5yFqjCBaAu7JJyBLkIbPbbAjvVhVHH8vyAX0aJjvsmKgHm0V
         ngIu/ToiVfSrBEEJOUUQfJCwHykrY3CWd6MG/WsasGKiiVbup75/Nc6MCAqeOO/scWgU
         /mi+n+9tC0ZTPWP1EwNClhnLE6v1AghcWQMe2kCmJ2++RrQ7fdcURzeu2kMv8OW98RkI
         GUgPVQDltgSWlUt0i69GBNnMjJUahi9f4NQusOvIo7mENhBhcJpf6b7kjUch2zpPg1VJ
         iW6HaHY+56gRXxgb027Bc+orR3ndRil8V/ur2D8ALTxy0HMDTvkABkNCzuUk6UP8W5fW
         qQMQ==
X-Forwarded-Encrypted: i=1; AKwUvByCCVZY6cB07DLBtpQ+SE3exTAoc/b7wc5rkr3vzHG6fWAVk95UuykUNFr/4oxRyGS3nhEr57F/COM2Sjo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+i07nrQZnEznhBFF/M4iwg4gWTemIOT/Gj9Y79FcXoih70Ypi
	hQ2xShZjrFLy1zSgMxBw+dTutuoVxfqE7ntMkMwjHNJ4mqoEW+jebKu2oqWdcpa3nGSc/TMSCL+
	3VvgwZcWDoWCoEd/72+xRxn0ZFvgm+JahQlyea1tm74vHezHBaASgCbuYnBG0kumP9Ww=
X-Gm-Gg: AYBFou2a3z1Ayn5QR1WyYf8lObt9SKSfI6A3i9c3dd9tnwJtlllanJnmJYy+LGFMul4
	VR/aS6ADg2X+qfhl4Zf7unHuEB1YQaKn9opmbLWTf9d6FtRNuKV5NduCeghbAEJem7wa79QxJCy
	e9ctOy4tDLyibNUsPE1Sh8vbWQSObC6eLHbwldlcm1VCl2PlJXkeRhOXoL3xH9r5gyNR73gA9Vm
	dlAGVau9KcpGeZwcxZIU2QW057jRwdnGkp15G+H0cFmhsn2y70g8UCmayTcGlVirVvX7iqvphhW
	82s6w59Pyp5T0NA7Y26lhV3VY/EpcknNxJIZP/ACb7tVnT7IC7fYNLAZT/nmiHY1ZvrXp4V/FdE
	1TcxPYQLNZsbkagDWGsKq0ZaV0FQVjNhkcGbRql/NI8DdR5SLUH6ycqFUxJF/azyswW0DBqQH3T
	GIKgABHV9XXGOz
X-Received: by 2002:a05:620a:1a0b:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-93f29dad8fbmr992433785a.66.1792356619145;
        Sun, 18 Oct 2026 13:50:19 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0b:b0:93e:e2a4:b0fe with SMTP id af79cd13be357-93f29dad8fbmr992430785a.66.1792356618645;
        Sun, 18 Oct 2026 13:50:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63a2edsm1669525e87.68.2026.10.18.13.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 13:50:16 -0700 (PDT)
Date: Sun, 18 Oct 2026 23:50:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?Q?Micha=C5=82?= Szczepaniak <m.szczepaniak.000@gmail.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
Message-ID: <svmk5fixazvuzkkug3mvay72kah2kf73iptrrsc5tmjtqmpp6e@4663g2h5qumr>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a469aa9-e4c2-4d13-b544-104f4065a14a@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA4MyBTYWx0ZWRfX05OX1cXlL8/4
 105b5Kx1ptuaLyTp6b2l6FGibVP9zmHsfFx/2KFD4PFESoKyfIgrXk17k7A5RpLOK3saCv+lMAB
 KO4LSoiNdkbpPRpqjeHv6TJqvTma0jg=
X-Authority-Analysis: v=2.4 cv=JpZkP84C c=1 sm=1 tr=0 ts=6ad5310b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KAcPb9uwQpV6Y9LkPCcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA4MyBTYWx0ZWRfXwoGp6kEuP0Jv
 wy6bCVbKncLCHev34BO2dU9nGX/G5T9vX7PhRdoEVUqW3wUorp5WZRa16mLuquyWdoyjPhbXrEL
 BjZwspYkArhlbjKk+AX5Rn+592Q1tMsdpj7QvHfDogsDOj4lrjKr1mPjiRhBgKunJdEldcLqEU8
 amVhx5mmRpNWp+Jh/0h3Wdh+LQDIfA0MzUpUw/Be8czPDJgmUoGqemgI41vCPPhk2P6t80bXzpj
 P3WdDt6BWVp8lHyV7XW9xZ1ZRKi3H+VUYErC17xcsEz6PRC6tfuvaS3aGvgz436W88hm5I+ILaK
 2FvzzRynO/dgx567dCOj602GzdUM1H1jQaXBUcuDRHk7knXAok9cDaRn0XT/3Z7Ewxd5mVpbYsI
 zPmGmW51ijHrChzqa3UJTT8AB+9Buh6ZA4ZeGQKfJB7Jj/JpqFhgbxB7ISMxQ7LWxlTyuPJkfYP
 iN0bL31gefstLnv6tFQ==
X-Proofpoint-ORIG-GUID: WQnVqtvICjUGnOo8gSbCEBxURSAqZ9dQ
X-Proofpoint-GUID: WQnVqtvICjUGnOo8gSbCEBxURSAqZ9dQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180083

On Thu, Oct 15, 2026 at 09:59:44PM +0200, Michał Szczepaniak wrote:
> On 09/08/2026 22:15, Dmitry Baryshkov wrote:
> 
> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> 
> Hi Dmitry,
> 
> sorry to barge in but I just wanted to let you know that I 
> gave this series a try on the Motorola Moto X 2014 (victara,
> MSM8974PRO-AC, PM8941 + PM8841) on top of v7.3-rc7 with the
> msm8974-mainline patches and "clk: qcom: mmcc-msm8974: add
> GENPD_FLAG_NO_STAY_ON".
> 
> Display (command mode panel) works through the MDP IOMMU. The GPU
> works too: the Sailfish OS compositor renders on freedreno (Mesa
> 25.1.8) through the GPU IOMMU, and I don't see the reboot reported
> on FP2. I tried 3D acceleration, and it works without issues.
> 
> Hope that helps!

Could you please reply to the driver patches with the Tested-by tags?

-- 
With best wishes
Dmitry
