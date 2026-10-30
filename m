Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793370185;
	b=4L9PjbzhqI/GSdOrysyJFE67GiP1jWezsZttn+lFwN1IE6n8AB/5G/TlRpf96vEgGMEe
	 Bx5M5GldW4CW+lr3N0DV9GzjKCcgnpax3TxqF2amhZp1l8+GoP2QqB6uZIEybHnYUNiMI
	 JOXb/BuMIiZ7lWcpIuGgiOPzAvllw5+Aok7WN519vhwBaX5K0B/s0u3Bvis2hvod5g2eF
	 5yHF6Seys57YjAj77I3BEE+Q7UDgIe6PmHDzuIIiQPhDzswkIUYrmep4C9PDUurqmaFQL
	 N4/1iRB2ePC24W3YfmC5JjlVlC13c/113A9PqDOyF690CQ1pfrS9NHzGIlrlqk1NFZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=;
	b=0JM0TeeGbqhpuzxdeCEhJvRSTRDPawfY0fcrJiBaxdJfDNTdt7y2+upgxeXrV5lu+zoC
	 2nspz20O3zQn+yRZSIvBrOXzE/Ou7Ht/xIM/dyYP1Jw5v4P4QJeTfbfzg+tBmvtXb8uCg
	 e/8v/kssKOSVaVyVOLgbqkBe09pMPrR11yLBgTDfHcPERNA0D9FwNSMAJ1dHuVqdtQSMK
	 4XOO5xscwbG9dDSqr7L/oIXOKne0seVuc328FXTTz17zYqgifR7EWh2M2qSBFhN+xFjz9
	 Blk0sYPouYk2UxpEvaEeutvIsdmhFGLMtEn+FjLmoISdS+BLT9duJjJG+ynJ7K4jdFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hjE8gb/B";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRIa302H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2BF606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2BF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjE8gb/B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRIa302H
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDnCMr3468750
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=; b=hj
	E8gb/Buf1te2qD5qTJO1a2YL6QQfCZsKF4VOQYoPrfzziWccpC7DCMd7N9os00c3
	wcoVX8ULmhHOyswUm8tJgAx2MkIrIGhyCUsrEuFJC2A6icUPauFGzEUywLZzWnUI
	woNEmnj/Ugm8Iz/Uj2Z/VYP/Z9T3aWfbeGYOKPRYsBAeyF1Qo2PUX0DIW10IkYO/
	jC8MXE8OXgdpgoL701MqonhfcOA11m6u1ZeyA5P90Rnf/AMMsjLk2Qdh/V+uhKU9
	eovfZcTeBmKSLbTwCRhYCZS8FsXcRJdxZvyRbgxIuLyvmWycI4D+pLQvIcNXRth6
	vAEcYLnadSvAED05VNNg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkdwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:23:04 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-46ac13882ccso705318fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:23:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793370183; cv=none;
        d=google.com; s=arc-20260327;
        b=JLEMkIbfWxZZfFa0UPKNMKWqzFJBl43x8ajFt/WEv0dcCxYaC1itd06O8+dZS3BFEA
         UTYs1GSvUfhiDpJEJwv/MQD5iHr7Py1c+fS5rNcPAqITq/tB0w2d/KgrEv1biAIfvgVY
         6tQfAakzsUwmjJGGXRm9Be/fwQWg2Pj3MLqd5+23vDBQwG/ML6ND4qK+yknvy005qDGV
         DsjfMCuRc3PV0LJB1xANfsElZdbwTI9mUHAO12ZWRwa7qj2RkSd02yGJ8gn0qmirx9ez
         5QaL4Uyrp7RkZr2MXLQGhl9RtCqQVqT8onKPlXxQ0XGq7lSG3xOcbx1AL0NvpNvF4U1P
         I99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=;
        fh=ELMG4PsrYMDDNQj/2IObZngtaOwObO27bqpSE52tNN0=;
        b=adOkgs0bXdJgrxofXVYdwo0v3W/BID1AdvS6+XVeuYJaApkLOOTNIAg/4NjYA5bXWa
         vE9/Z2ASJemxNubGBnKldK6IXBqaWTybDAndR9GdWdWC3SeLq6hQqQpfP3vERm0XTBg9
         jrz+CPo89hnH+LCMXUTpBgt2PwszrWerNe4lEatZ0KzcyiMxzCwWIR7QtR8Twcm14Ezw
         6x4iz3j9Jnls8nD0VtYCR71BP4taKI7yFIqhaRBW2ngL8qU+xHxB+7mjL/kw9rIrcwdk
         dAQNKSH6Bf0GLHQlgtMVx8anLF95SepfyES5UppQTnApR9o/2e1oF1wjNdQikrufSIoj
         8eTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793370183; x=1793974983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=;
        b=aRIa302HyE08UfmCorZdeydGshGboJCBe3HestU0xBXoUmMRW8ytuwR16s73SMbQO8
         KYrGcvOSm+o4XGHErBye689yzGm/3THHVPGRLnAcNixV9SSofaD6Z2e+sbmuCgYagPZr
         1EAmch1+vTn2wBIftyC9Hmbd47HEoAo60Tw6aEjFQ63fOcFzRJZFvZfCiIGmmSl0z3ri
         HvZoJzySJMfDk/w1IeNKZaj22QCens7Sq6SY/wMsNb7DFpqvYtMEhWKn9+ctUpcfzc3X
         L21lYVm/H/l1U0thWiRK6u6G5rkV2SGtyWzwSOnc9shIoUVCkSLo62VVwOvjKeHlKMwj
         L/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370183; x=1793974983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yjr0RvvmXOhOI5x8DKMkHT1XyeXVZPh6p80n/QvfSz0=;
        b=dOhOMZneWd2T2wWEcsdfX42w9RMEm7UjeQjS+fKhAriHTxNQ0P84FmbUV2tW0SB6lj
         MUm4zKNCmvavAX9xgwky2x66d2hGE68O3u1nhaYKFy9ftAybFjYqPxfMAaY6Gdyf5+iC
         pI0Av2szrM+cOtN6aM6YSeuRmQ3TiimDEHL96i8Fqa9mlG1XQEYvEiEA0R1RSU9PA6ka
         461/kWhLGk7GdIcnrGWHp68ODvqg6lFiSMeA/QrOBFxHqWZtwNf1p6MVMgkngROllHbE
         10zXw3LvhStr1t/qi2l4IZvAw7rzI+9ia7uxVi7JxfzPnqY22wgWpvaiDitM1oWWQ70b
         QyIw==
X-Forwarded-Encrypted: i=1; AKwUvBw9SXUH3oEkvl0bM+S+cdIrqsv8UpFYqMz3E53VkaFTYzQ8mA4z9V/bJyfdz6i3CfubuExlWJDw9KMJPhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLz8ujhq6IwWWpCpGu9KYyzya/u4oF6zFZktNHE5EkMfb2knIj1
	EwJldTBS7ol+xAH001KzuwqIVyckA4t+x+zRKOlgrVzUzTiGGOTEVzXY4ixkfldAX1C6kyjKwIc
	MXxHQDv3X5tsZ1tZaoOGGG0duoz36FozN9Qb1rPSf0frBlpN7yMTSAJWbkY+TNWCkpWrzzA9wxM
	+4mjNfGq9cmGu56Jc1gASlkPFIUob9i8zbr9kOvi7tPA==
X-Gm-Gg: AYBFou3kXrlXYz00e0WZMRUMnSaRWhH6p4PbBAADIWsze385o5SyJ/UUvwdcgdFZll3
	kymsq8ryy7dr5Y/lpFALcz/LxgiAKdTEcT+o8XbHBGAigMjCovOkx/8rHlLqf30aMJBuGh51cSY
	53EmH8u40SZfx6dYAJ4HZ+6fRG8kDYdX3OlJVu12JioeT5Q90ZNruD5j8bBw==
X-Received: by 2002:a05:6870:702b:b0:4a8:1837:bc27 with SMTP id 586e51a60fabf-4a9072faaaemr1677690fac.3.1793370183314;
        Fri, 30 Oct 2026 07:23:03 -0700 (PDT)
X-Received: by 2002:a05:6870:702b:b0:4a8:1837:bc27 with SMTP id
 586e51a60fabf-4a9072faaaemr1677666fac.3.1793370182955; Fri, 30 Oct 2026
 07:23:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
 <20261029201730.151754-8-robin.clark@oss.qualcomm.com> <0103e15d-42e0-4e8c-9f6e-ebd0b56bf3cf@oss.qualcomm.com>
In-Reply-To: <0103e15d-42e0-4e8c-9f6e-ebd0b56bf3cf@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 07:22:52 -0700
X-Gm-Features: AclHuK_L_2HBiXq59BCEL1wHfkKwJn-aIJQ8gMMWTwWyz_La_kw_FYR72xePUcE
Message-ID: <CACSVV01QNDTkri8WB4nwEHjOZA24x70LfKsqJa4sp9NmJp9_5A@mail.gmail.com>
Subject: Re: [PATCH v3 07/16] drm/msm/a8xx: Stop getting GMEM_PROTECT from
 nonctx list
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xKLfCWNBKg7JTh5fwmZb0FdKXBCPskoT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX3UL45nfYnfDK
 1r4CVzBO5zH6u3TQ5yiudBivEWTKrDgw4BHIRpME/9kY6OpoOveOR4ftXYGuYNVxYb0u+rsV5S0
 2x1Jx6p0BVVoK0lnWLMmpU4ajIJUfyk=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4a848 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=WwG0zxbtD6kTrJi3JyUA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: xKLfCWNBKg7JTh5fwmZb0FdKXBCPskoT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX/el//pPl1du/
 RziFRi5XKu+jBKKHTN59BEot9Aev8OGDZCalk66WAzvb2uJENb4exr1LvlvppT00HQNdv1IiZjV
 if8rFDVW2ZVZvOYOtWWlJGnXHcDOTOtYEM8TBg4y4t0cbrzsbXbdP6cF4uWvd+WGag2lLeIEojW
 ZXhV5bELET90yMalZgcUSvWUJGSXm1VMTDBqcFtnzJlrirblGWqRRIHNh9sRh3r34wNnZ44uDLn
 Bm5NqK9CAxe9UrZtW8xSni4IQGgYB/Saw7NrjNDTeUyUB7lS7X1UJaMqPpEYpe2Mry7Q0Kgnvpe
 HGSxVMNiwaW4cHJXI1xcE11b8cWv7btBZSyfrNbvuv5FM+o+soU6ZwHO5m4EVyq3nkb5rbVcXk2
 6Ypvnhf2fw7r2Vi56Xs0IrSHTY0vRE58WH3u49vaPQ03Xms5XZtJVeZsJyxsKM+lDJC+uDYiGNn
 KO9owwhoY34RdxClyDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300057

On Fri, Oct 30, 2026 at 6:43=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/29/26 9:16 PM, Rob Clark wrote:
> > We can just simplify things and calculate the value, instead of manuall=
y
> > adding it to the nonctx list.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Should we drop the entry from nonctxt tables then?

Yeah, since I punted on using generated nonctx list for now, I'll drop them

BR,
-R
