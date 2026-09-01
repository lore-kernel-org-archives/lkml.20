Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD05946D577
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249438; cv=pass; b=ARKrdQIvQipCNuI5CVkDCzWFFH3M+WvpAW5TUVdr3VVNNnTSKoJCf8r0i1QzKEyEBtIdMtLsmrBAMmixYcVqSL4Dt79Ctp3cfXOj6utyorNARZcTLNKUtuSTD6Zqib2Q4EaIc84HaKL8kh12PspYi7DuHCzAbPd1Bz5RfoBnIB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249438; c=relaxed/simple;
	bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTHeGw+NgW5ZxL804DC8dJFbSQqr4OejLQgXFyrRcN7fcEdLm2cr3JuDtnYUdRS9ve0l+3J44IjAHp1ki3jaVv/f5nyOw1ekI6lZT1klHsmbsAH1MRia+roVUnVx7/VlVx+02doHCjbMY1P7Vl1Q33HYZFOvPISRnm6NlZ5FbAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U/CG5LUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZdSLXFb; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U/CG5LUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZdSLXFb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681792uw705425
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MT95TXLpS8p3pbuJaaLjnBJ6
	LWQyjI3YRFCLnSR0/wE=; b=U/CG5LUpyU0Id0Nz9vRevwpMevriHtEySFK1ORO3
	sx1h1N76x4h10pA5D5hXi03IXLlyi3qinBsusTM3sYkwAEFUXKpae/ONh3zCqByD
	Sigc/ZtOKmdIsr9CPj84TduPSi3LFIjTUIDD5SgAe7i8gjj90IAXT2UzQ5riHHgo
	ZUYpaTJk+IQEe5+OHinLsFlyzS3q+AHacYjfFMahzYF9O0lb+w7SNiaGIm9DrMTs
	NUHFhs1PU8aeivtjpi60tFokifv7DgPAHmVWn/Awy7ViKzza5++rffdy1TzFK7WS
	LL+j7O/8mrw+ljJDTF1MhoohgdOrwuoBbf9UwQIsMDKnvA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsgmn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:57:15 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66cbb3dcea7so5361655d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788249434; cv=none;
        d=google.com; s=arc-20260327;
        b=rNoJPM4h05jdzduNt2SMmOiWcM9gNAxBTwXs8cxEuOkfEUrcfgLHaHgL8/wihwdKDO
         NUrBsrn7bTEs+RTlve54ezZAq+HQcNf6CJqjIQ6LboZlugAUbn4mGz3vuCy1g0RHfd+8
         jnnroKea0+6u341Swv449dISH5MYu0sbWfY2WkUtgziuIXjx9NOt5H/bnyHtJbXPYWZN
         WZsTT201PTI5FLof15WGCyhu5J1VllsGl9GMLgiQJfdkOwgMmC9KB/w2AZcWEe8vFmbY
         z/tFpvdm599Z98GBc4KQB408bU32XEE2Kre6GEjiileljQlNVMYoUI41Lw4zcJdBIEXg
         aZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        fh=Zi5uHQ3+c9CguKMcdhWRifKLJWb71+r0s9NlxUrZJdw=;
        b=jRdsMlRue+Geu42BZNqSIJ5MUC7DsQeNhNTA9ue0dEl64Rz5VINAdN3VcQm4J7Rlu6
         cdHDEvsYh5N3XtxwkWyhHj02o69av7BULgbvhJN5sAYvc/gLzINB97KHTixeHYW5/fwj
         QuSfW/ZaKL484PcP6sJaMFIsdbv/JQXs8eGyW4fpjp/Mk9bbUeuBExvAGNixSX6ujaQS
         gEpA+qBt5QRQ5vZ+FHMVBkdfgora03UUjiDmDCI5g6Bn/twmhU/57wzZa3afy0/087m6
         8T6bxk4MWBld4ClyWIr2FpvNYa6wLICpZX0H9cccD8bQnkz+nyU6gTbw3b+HH5rNfzRc
         xYWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788249434; x=1788854234; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        b=FZdSLXFb/2APXS386Urmt0wQNBMp1BEGbJLT0ZVmmpMcJ6a0RLUZh9k+xJYh2KGGB1
         o5TaKxMdcxeJuUwtQDQ5dkVV4diBKlpyz3/uUAg8uuS3JLlNOsJpK4EuZ6nfEQUvIwV4
         Cng5a1S+3+paNOv2HDcYFQMekV7/EOSeP3XQyxewEWGiDyFVsH56sDT4H4fhht1FZErC
         CUodnbCQntmkfD9QcpVOjiSN8FC75kWoQPOqOa0w0G589xElwNv3u2xOOX/kVw9Ni7Im
         D/gDjTBWGq6hUX/7lIVgKPRyrQoqy4rJxsELm6Orc5n134mwjYr0+HV9vQwgMp0HXUxg
         19aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249434; x=1788854234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MT95TXLpS8p3pbuJaaLjnBJ6LWQyjI3YRFCLnSR0/wE=;
        b=ok0WdB5W+LDbHTH449L3iLiJAjnuWFfm1e5pu1Z5XuUtnQNi+XVWLExGvxkiqkzYpG
         mPAcEVmuuu83yrFzMJ1ZrYpKG5ZcIHVFIQsQntuSxMLFr/7yqJtiX3vl1sTidRxPC9IY
         sJg8aTRXolci1sNzR2bZarILDMIsOTDLd02Ish4N94b42mDJ3DvyHyBLXY6Iaer0JGHu
         dJ9tpcc7dbJnM9vQdrfX4XQh5vMPS5k2CkNyytWUej/0WIjJK1YwzotPfQaiakk/qiD9
         3fczjHnemofYVRnv9n189EnWlNuyke7FecavZ9DwPfAer59f1uCNtuGT1Df75SsFtNqT
         +qmw==
X-Forwarded-Encrypted: i=1; AKwUvBy/rC1Gh2N3xuLTW2K6eu7Pauchq9iBTb+rDFpgfVvmCrtepLpR9rStBK6VURs8ghfP260mHapXHMVymdc=@vger.kernel.org
X-Gm-Message-State: AFuF++k15F04Caoal5MtLA4g4xic4QM4+QWvgJmDYUTwZHkXZjJyPXnU
	1ug4oHI9G5Q3iQb2jdO2NeEkZZMAZLcA4srl88+n25f0KKJUSdUo16KsYrLI+2dVdIhDEduhKpd
	IoizOMZYp56Xtmat8rus7/wt5fQSNXPVlE1iK4QyoebySHyW1Uk8In4C0+prRgU6fe9u3tUTsZ1
	z70WyswIoLiKCOqlbw93+6RAAt4w7TBFGIPG9QJEevhg==
X-Gm-Gg: AYBFou3qaq88tpB9D1xBQfUMqo/8cs4L/t/xObyF7Sd0vqlwvMbZet/XBzocq7U2wZU
	FWekCSgsvOO+a9F/DMiDXJD9rAXWRmLz/24h2IxkdQRN+XiJFnWeDUUx8CljPSkEem5+h/0CXMg
	UYeyRyqACDxCgjZ/yRl4B0g+f1JH/H+H39EarvNubY04HRO0ty9FMcyac+kw==
X-Received: by 2002:a53:d081:0:b0:66c:d803:b45 with SMTP id 956f58d0204a3-66e4c728865mr7583297d50.25.1788249434555;
        Tue, 01 Sep 2026 00:57:14 -0700 (PDT)
X-Received: by 2002:a53:d081:0:b0:66c:d803:b45 with SMTP id
 956f58d0204a3-66e4c728865mr7583284d50.25.1788249434062; Tue, 01 Sep 2026
 00:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org> <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
 <375dfd48-4351-445b-890f-cbf3a835f65a@oss.qualcomm.com> <36b61b1a-1b5a-4946-96d5-576baf707af9@oss.qualcomm.com>
 <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
In-Reply-To: <19a8ee86-81eb-48f7-afdf-7bf5eecb8629@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:27:02 +0530
X-Gm-Features: AcwNN1XYMRVqJMDI8M2Ek-7j5XHLY831M1TAKp2IsZzjDOzQlIlkiRN0nFaiwDY
Message-ID: <CAC-tS8AHW=jobjaDnyw3BCo5SXZ3nSzuC1L8vV4aq-zkHuzDyw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX2XYLhS3G85MO
 Ajg4rII5mFsQsHebDofngCi2B9SqlWLy/I6Yhljk3ffojwbD2DvGDk+6TJ6QGpI2WA67dFgidCH
 Nv9MNOF7Lq/YDkutDQX+UQGhMTH5yqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MCBTYWx0ZWRfX5ccvNXWj2S/b
 Wz5FbZ/IFG1YcGSSRj+IV1myVN8zTl+JiyDP7yHmeS9+3yUjLrliCAcM1kfXGyGRk4bXJYbvhfZ
 ABM5TpqD8LJqR4QGhexTbqTNCHT1b0QSl69QaI7WCX478UE6k8lV9ydaVXcc2ZOCqfFIOcBFtr3
 XKViOgxUDKNokWV1ZNMFQwQ7ziq97T5+i8kukJxzIUF35gEnW0MIUn0cmnZ+oI5zOvDgWmGGGh7
 K+SqtcujP2L4PIn2BEiixQ5A+aUpMKo1sWQrTLxybH/+Qgln9cR2Kb5/TxEupzm7rA7zurJ04RL
 07GDl3ywX0n/K9s8/GK9FDwZcZJwfZhsWSlEzc5su7FsXgpXI56dGzqo825aVLG0vJ7y7otXtu2
 kgY6LiQPfVWqTlRyE266Q7Zz+mxE7UtFUWi98Di1AbJ1PiXDj9sBqOeocwbEzXND5x072liE5jq
 xbR++RYT7N2SyoAcwJg==
X-Proofpoint-GUID: twPXifR26jbqIkyjzS1Ea1RddNLoibIJ
X-Proofpoint-ORIG-GUID: twPXifR26jbqIkyjzS1Ea1RddNLoibIJ
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96855b cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=nUbHkpXoBt4ruc41abQA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010070

>
> @Harendra
> As I understand it, the hardware interface mapping is almost similar between the DSP and CPU solutions,
> May be the no.of interface count be different. Would reusing the existing DAI IDs therefore be sufficient for CPU solution as well?
Existing DAI ID names are tied to LPASS hardware topology and do not
align with QAIF port indexes. New QAIF-specific IDs are needed for
clarity.
-Harendra
