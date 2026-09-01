Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E850E43CE56
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278134; cv=none; b=Iggrs0T0LKqzibAw4mU3B9BnmQDDr0/0KobNJbGqsmALooBNbQ9qaWReuyVz9C6D2hE40OS4JyPCFyCZ3vhyu3jfAl5PI0rNbGo2Em1uUX4JfiyHOGQ8CGApLuvy5+39wgIToR/bbaa48vbgtL1+KsoduGD1U0UROa69mc7e2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278134; c=relaxed/simple;
	bh=Hjr6pu/eagjal8jxOhPKaNfXz/MD9nUNeSAS7UrU0Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qwo5pT+WZF/9vtKq0MYewUUJPPh/dB3E6vi1rYZXK9+yuqhFf7j83MvsbINwoNUUADvsnCUv1e9rFu4Gw+z9WyW4cJsalumpvpgC1uxN/roO/yznYdLMKCebMv6iQq9C9xxvqkEDwWGCA6tJDlFpBW5OLvDMFM3S06XKHY0ltNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJw2hfcD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gm9o9tgO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJw2hfcD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gm9o9tgO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8aAx3495583
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1LD9xwtAYsfVMIBHE/konIrPFCY3x9B/N2DZeQ9+OY=; b=aJw2hfcD0xE6Y2JE
	RO6PCw0OKWHhRnvXyTWO+QC2yvb0+Shi0Ly0vnjiJ+7mKm3NZmNf19tc+MtVRr/g
	QazNQoPOR+QdBI/i7t/GwZSBUWUhpbRW10BhMDUyoKcR1CUHfgvvCvgSi1D6lgpb
	7tw/5dnUoi0PuCjWSBKk+dfOgYsYcz9H+VTU60n4wRQvuaQ0yLiWHGaJbdVJ1dKp
	B6LhVxtRpn3RNmdlhpnGU3CvKkN3K8UZ3Jc05KJPYC8YoJD4Dug34rsBw4LMjmeN
	N+O8TaWQMPeGWJ+oVDYww50Wd39SVQZ3RL2m7g+V9+0QbxxwijAOyIWtgQ8xhDJI
	eUwgwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ngutg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:55:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so210841985a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278131; x=1788882931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1LD9xwtAYsfVMIBHE/konIrPFCY3x9B/N2DZeQ9+OY=;
        b=gm9o9tgO9+Lac6dh9vc23l7qJeUx6R31lehhmLEPjQXtQOsbGRRjJ24TK4s4hy7XSn
         DJMT9WbwTKmRzH2vKgv9zaOQnEhciuJZG77G0Q9zLrEluCjM5XSbKLOL5F+gvcIKW35q
         lMCMJL6thjuePp2CVchI6y+DFzgQktbZOiQUwGC8417/UcpCJiPAQg12BdTSf8lF5xH+
         m3O9QCO9l3Bc1oYiUByGjcDVD8Gd6lttWbETu9+NsAPN5Vvvj1MX2QbwUCpwX+BJ+IE/
         Gfgb4PYeJEV0AgMy2yUbOj/uh1kRdcA+PUhGZtPwQBRJi4nkGw/Dbzf9ir4DaH3O7Qff
         H+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278131; x=1788882931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1LD9xwtAYsfVMIBHE/konIrPFCY3x9B/N2DZeQ9+OY=;
        b=ol3LeEIN/BLKPgKMOWmXwGakjX775WCC551Wld+u1gQvEI/kcIkpuj6Ey2u3IYXb31
         CKaCBmJ5Bf1oxBWid9/fdegmUIqO185MZJZhVO4GP0E2zdaa7lWaFs/3pdEiIQeUvZg1
         Ze24DZ28ieLTXk7i+MaKJ5y8jSSNJl2OAzepatgrIf5tpTpjYnesghpvJPMSk+xUnzTT
         Pk2ulhNngvH81YOEBy1oPF89CN7fQnH2QYJw4m3X6o3OqIzcCs2QEm/3d1sqQ0FpSeHK
         fSCb/7ZFne9nGkYPl3uuwTVNQB+g9AVBwDRYf6a2fGRYleyx16KXrOM23rXHY3mj2Rwu
         O5Rw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8X5C63iy0ILWq2xiXbizIZEbI7Lsvq10zTHic20IqVR5CmMpeNzkCmNC+AtfBmjeFO514B+lfM/fN7mo=@vger.kernel.org
X-Gm-Message-State: AFuF++lH6mnTeZUNlfn31UJq0I+P2ri0EtiJzzDQYDjenuAqpNioLLjd
	ksoIvMbJoHtx4RNsR6X0pOJM70fUZmVp8CJoh72U39F4SqkfnoAvpptxhOciJoP6kGtaG7M/pXe
	HtqJxamyiCl2vhkfBUnMib1lvFyDGNwBBD1hwBUYeDKDii0vyliKbdZYsKg2FICArxLI=
X-Gm-Gg: AR+sD13SB8kfPHQiQTDYFKXpSC2Gsi4huP4I5MYAVQhOBH1SG9XPjN3jTkFbLJ2Edhw
	0r52dGjHHS69hHAz/k1wImWlcoHcxCCS5JW935TiV5WVR4GRIWffcy1E0uNyVuRv6enWSD27MbG
	T5NM3blKw0IUDbCqlxCuPD9+dK8VLLKv+fa1hk6FSgd8IqLhskwbTWWiTcc94c1qbEJITOc1lnS
	9fVzc+FzGD4uqY2uKL35Zpi/fdR8bsXOreOzt9JOws55D59n8hjlN5tGjZbcKOAOorDQ0HI0E/9
	bji+m8EBSgwTZTjO1qX6v/XpiuZooUz+TLqPdrCo3KSu8RyPGmEvdsgqQ9bA8TqVQhE8gukUrQQ
	rQoibqsdUwT8/0B8ogPYYzBC0RQ==
X-Received: by 2002:a05:620a:371b:b0:937:17f9:da2 with SMTP id af79cd13be357-9394bbf52a7mr824122185a.6.1788278130634;
        Tue, 01 Sep 2026 08:55:30 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:937:17f9:da2 with SMTP id af79cd13be357-9394bbf52a7mr824111685a.6.1788278130012;
        Tue, 01 Sep 2026 08:55:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c94bsm5165318f8f.12.2026.09.01.08.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:55:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phucduc.bui@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] gpio: realtek-otto: Handle errors from optional IRQ lookup
Date: Tue,  1 Sep 2026 17:55:22 +0200
Message-ID: <178827811897.38653.11753666556124365890.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260814043028.12548-1-phucduc.bui@gmail.com>
References: <20260814043028.12548-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX0HmpfgF0v/K7
 aCXZNXrOxoE5aW0IDOFtRLJdOSIA0T8g6kewFY6dSNwvzztUEzzvevm6tqD98AGCPvbPWsDS3Xi
 7WTiXDsmLup6vutG2mpYDPdqj2GdwwE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX4Ze5mj9O2rsp
 gswLQqHlIaxgceNEDnP9BhwxDqZCqlUiGn72KyLJGCk3M7Q+VahnRdrwArdM3qzg1aA8SQkpydu
 pjeHqVwhWF9ufQV23SM7b49qFeTaBobugeYceln03Dnk8AgO5vX09vRHx85DOiJiX1jDackDVJa
 lhITDIDlh0exyCvpH7MhYZekYWWGvTcHEKOIwyvziBOh/uAlUidJlRhQjlSwfNThXRuUayRz5ov
 nbufpuUU9KJ1IffFyHuX4+vk7qbiRezlep4y60RPY46dnBBGdN2vL6HhPC2sDjHmh2RaP0J7pxT
 oPdYTO4yi1AZ9YmAkxJuSQ5zLNa+ypQFkGTALhFlQzhxoajYOhM3A94JzRoXtYjP9yMimO7fsMf
 0lvSqlFhA5FbCjvrl/JwesFdcyjWbYry/NbgnzRa+1Gs0/szjmBnTHiN8CfsTybrycCC19ILbiX
 S/HccVosSidsfA+kjaw==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96f573 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=YjrwkAG9RECl0-CX3-0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EaB8qbpQIbWRQ48HkanPNPLaIYns8jxu
X-Proofpoint-GUID: EaB8qbpQIbWRQ48HkanPNPLaIYns8jxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140


On Fri, 14 Aug 2026 11:30:25 +0700, phucduc.bui@gmail.com wrote:
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
> and -EINVAL, should be propagated so that the caller can handle them
> appropriately.
> 
> Propagate negative errors other than -ENXIO.
> 
> [...]

Applied, thanks!

[1/4] gpio: realtek-otto: Handle errors from optional IRQ lookup
      https://git.kernel.org/brgl/c/ef0d275786a3c98d1e52f1d4d89183c802af58db
[2/4] gpio: mlxbf3: Handle errors from optional IRQ lookup
      https://git.kernel.org/brgl/c/53ffd779a094d5752551dea2ba7bc787aab29229
[3/4] gpio: mlxbf2: Handle errors from optional IRQ lookup
      https://git.kernel.org/brgl/c/d8aaf6b0fdc835d10c7def7775803b28ebfd4d81
[4/4] gpio: altera: Handle errors from optional IRQ lookup
      https://git.kernel.org/brgl/c/6e6e585b603e4f679c2a33c8f0954ec88b52fd7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
