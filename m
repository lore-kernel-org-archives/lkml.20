Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84049C4C0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818720; cv=none; b=PkP+//TRtSJogOaQwIeFf0EpHV9l7tqtQ+D/P9dih/73svpe9RWrMuAtKT+nhb2vonvu3BoLr0gJWfH/2zquopD+URlTlne01G0HVKRMMYRfmSLSyLlPyH7rXrCmWqWZsuCt3RMeOR3ULI0mt77VRcSOMfAunsnBCHNJ4xcqYcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818720; c=relaxed/simple;
	bh=Mj4Yr1eXzYhzTFXQFevVuouNAAS0O5uO5o/fq/DFUaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e8k/dR/OE2JPNKB0cYw8dn6i+uWnRRtlu7ZrwqC3aqZlfiBtxfVD7cP2ZTsv2lSIRzXkq2fHOGsj8gqKfqhuToi1ovbQC120MNTPd16zUd5cbXldU0qrGulb1x47/+AdLTLeVBr0/r/QSECWPnmF4mSXl9TaHrPoa/0R5g9N8YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XBHVhghI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GB4DMTjo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XBHVhghI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GB4DMTjo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03lp801999
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	To+IxN3RH6HOHfJxwIJNsoOJf28JZNhP7whkAoi6D30=; b=XBHVhghIAfm2+g0d
	xDA/UREJIgEiUlC/xs5QvWlsMDahzmAqepV8URvO1SfSFEQxAfHm8l9jSKuduR+x
	H5qItGC8n5IbSWNZrazvFbK4lMr35XUXDbWg2GRZSpFhsP2nuVrUA4a0yMhyBfVs
	vH99EiTLzkHpt/h5O/2m0Et0ODM0jcRmbW04v/Y4Q/w+Hqb8OQdwL67RhOhza3CJ
	z2WiJVRzKvbVM82rgbX1zjxW2UXjxW2/TOrQVJKOjTfbXAd+ld9WmhroFUqeS8hl
	JfSHANuj1AErAtf7P3w0URotqUSThGBE4cJZ44I/R0xEc0OvmeBZ0KxTDZ3jbSEG
	NB4yCQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsd4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:25:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso22077485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818717; x=1792423517; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=To+IxN3RH6HOHfJxwIJNsoOJf28JZNhP7whkAoi6D30=;
        b=GB4DMTjokwn1bZH7T41/go1O5F/RYQTsiOA5E9nIEC7Ho/q936GlDw9BINVpRXJzSv
         32J6TRoh/DhFaHSlvoATsz+LqS+EMcJwLXi3pF8U5zJP89UJAJIz7DbB2vUZj23WyeWf
         vuaa9hGIJFmlP85sXyFqUuL3USoP6bSTHO2ZNoWRrwLvVoa+s+m7I8QK64eutUHmvdtX
         W1okpXYBEheocIyQdJ4OlLwZnP4VRDUP/pS5lNnEdmAU9BSYX+RgsEIcXvXLwaH/kz+h
         drqN2xUIOawUELt4ylUF1XeZjzFcW/bXyMb/pGt+PGtew6muIN15a13CMMhB61E/hUfe
         fN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818717; x=1792423517;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=To+IxN3RH6HOHfJxwIJNsoOJf28JZNhP7whkAoi6D30=;
        b=Yc5cIFu7PbEk47KfjMjvYpuifCrD19T6hfy7FGhFIZJnUVEIWuBboZQYgSovH02t0T
         QBVtL8Gx/xbNn/SQFZLDv5FC/k5OSg7zumLMOZtT5AJ40TiRXdgbVQ5Jk3fM1Sn/eXD0
         YcJWMwZV/ktYtKANpq+FjdStJUHhG2C8hfKUPL6ipD7TL34YE9p2KPwOBzTkSq/0SrZ0
         ImmPQF4//sgSq9sOFPG0Q7ICv69Mvhg5QInGJuqeEN35a/XJYE7aAV3e6+sk6c+oHi8L
         534KLuXeu7VfDDOEp4rgJ/Wmgzh+qqkU9VvjD1dI7fXAvkyLpPYVpg4Bxfv9yKwaNuil
         aR8g==
X-Forwarded-Encrypted: i=1; AKwUvBxxQgYrrJyKnOY9t439BDUFW9pNj/QXIs//okt9GvJtplauhfUjfzTHUTV/Gmf1zVK4OjcX/Ls32GkLItg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLowR3kcua2grV13SjCvz0U50WCqxxQHlDwJLw9qRk/M5S2E7IC
	eCZEJiOn7121tErJyW2I4DHSsBiTKegI4/lbRvZ9hvEuLXRCUYnYd253zmveJ0dm8S7bEaFwDxR
	tjg1mSJimVe0kvxPHxCmuqCewPljHmnc7nvgIdBMjam8tOgdsV8NlrPrdpAa+nc03nq0=
X-Gm-Gg: AYBFou02B3fewYqYmRWIL5fL/4CfDygutph88dGZjgfQTeRrOs46QiC26BS7fGKwFiK
	N7RW7+Bjsj72G0KuV5lvrHaGljqFVaaev0fblfrkfZnbhEPQzTltCG89WFlI6VhhjmBFQKFJg1F
	Dn1oDM7e5rZs5fWRFQ1KhDTKoPrarbp+wvL21qfU4Xs1N4fJHXtjLaz837BZYGMR+m4yZpksBXi
	E7PqBNY1W9S9omqOf2m9s97HIZlx9rMKV5aL39VnEZeWQFrNC2hD/dfB4G7ti8xdFfKGMzKrWEk
	zMOZlfbmBpStjNi5u+PVz/eKkaiFsegCeJ+5xvyHWszg2aNrR97gs0M6MS45Dsp5YLARXVmPiR7
	f12QVrNnzhkHAo+Wqh/kVcA==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr1897877985a.1.1791818716545;
        Mon, 12 Oct 2026 08:25:16 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr1897870785a.1.1791818715946;
        Mon, 12 Oct 2026 08:25:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9aa8511sm473121166b.59.2026.10.12.08.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:25:14 -0700 (PDT)
Message-ID: <989388b6-15f4-47ef-81b8-b35d1977a0a9@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:25:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/38] arm: dts: qcom: ipq4019: Add newline between
 subnodes
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <f7637ab5383b8bde1cde248a60d0e8bee01e05e2.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f7637ab5383b8bde1cde248a60d0e8bee01e05e2.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jAm-0XRT4oBXILnYHB5NeMRxfSB9n9rS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX83kc1id1cl3e
 IXYojsB9BcrOif7kgLLmUAFXef1hxLLYS8yLYqINjqt4RhSJytJZyQRTxBMFtpJjBEB+GB4wtuE
 gCX0oWUTPDlUJwCPo39xO1CgHn0M/0U=
X-Proofpoint-ORIG-GUID: jAm-0XRT4oBXILnYHB5NeMRxfSB9n9rS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8EQIM0joPA2B
 pcjwFfeWgY69P5JHopImFgHwgLf0H21uwuOXMzgRvrT956OeBAMpJ/mY80JrueUKvgGAEogbaWu
 KJTyMArGFCZoE2wOcY8vmDjSK7Z5GdNLe+LZ41wTfVns06MdSz4uHKZRXrrvJ5mMWT30BL6O13u
 p9yrCelPqNgLEtZUR7uJzyDg8unmUycjapz7zA8MFHyQJrKfDyWvqWUqDkpxqM+XBn10oSZYFFD
 aMWmaB0TSMcQaSyMsrjtedZtHYpnFGqPdVYUNh2m9bR023jHdQM0ClvWNnP/ciauAEvHw+FH1GU
 VV2v1kXT1czeJLkMYKDToFMlKj7LxuhqBTAPjIaCc3MrK9QI+WbFlZValUrzEmi6GxqvYGlxXnw
 hrvLlEKcXmKCA01+O30G0TanSeXDrPCiHafm8DmvJ1ZGOS2k181IPwUwx/gUH5MAITsBea1VF4/
 G+IeybrMxRooTd5lJ1A==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accfbdd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=mzYhBs4nDBQXKrYYQc4A:9 a=QEXdDO2ut3YA:10
 a=hTkh0tvSPVsA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> There should be a newline (and only one) between subnodes. Found/fixed
> with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
