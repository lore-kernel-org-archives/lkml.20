Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421575;
	b=uUc/jqiWPLg1vppbgkGiUC32quuusw0C2CI55PFzN90J5ZS4rsFhUvsksoxgN8yu5+4Y
	 b/cv+ZwG15USw6kmdRt01ZsiXE6CZkzji8db4921dziDRjAi+MYNPMqw3HwOoUlPYNxZb
	 Nq/CPzOgOIoJrxPYoQXAoK8MRXScdQhILj7vey8UhfxLUerQrx6MAGmPF90xf8imoRzQx
	 9SrjSK4d3Z5V+GXgnjNDAjwxAR6GCm8uFjfow5bznV5fBGD7eSOBL6WH5PggpAc/UALzb
	 Dnfc+yHVGXzz/HnpgpnakYsqAHJCfYL7MnG5Um0AuiXjC2oCeSOa2K8qCG9wQAVKW9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421575;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
	b=4rIbFBhreXBELbviEo2SlSx95xSrcg0zOqo+4mmvfYgnPLCSzpxrClnXibek7QjM7NC/
	 wiMXKKSa2AV+q4XnUvodQnibqE1KgBZKOXX9MiukehrjD0+FBaiVYPPkm4nd3pgxmUJzT
	 mjdMvQFM1layv6ViD36H9EaZtjHz02JyxWkxIXnhzip2az20QicjFDQ81ecr3BMLbPunm
	 q+Jj5fvic9MlqoyX049edTn+h5pFrrevB9U+uGa/Hpn7Zxew3Byh4LJ7uVrlcWwh35ECe
	 LTKP7k4BxedI+oKfNcSrCVz6MXw9QWqT3p5tPWzqaXhiy3XhDLafve+jGakPtV9OIVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o0H/27FL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmzJtK5+;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4801A606A338
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0H/27FL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmzJtK5+
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0278E4D3BEA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421575; cv=none; b=NtdKwJnDkyhOoGzd94C7w7NCZT/L636ZnnOqyt16Y8PDmsAqr/SEYdcKZR1KbPWAA+4FWiJ1hfQQcfD7hKa2f83B59aAXTgT79q1zbGaoSm6Qfh65n7nbSj7LhIGjMAjVe0h3cGa4TDj53YfeDO35xUEdU2T+HTrI47SyxauWhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421575; c=relaxed/simple;
	bh=orrAvnQKodrO0KGN/q1mi3EWkwR/z2Dn0RbWC+AZp4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bb88yRXUara6zRZ9LWErEJGGLhD+gL+zYKsVyMkvgX/TEPwDU38r6Yryf9+J/2u+GJFt/VSFhr5IHHAR9zEQA4ViU26X9cIulHqVouIMdSJOzjdZxwRDNRoLkbn+uTHjHpl3ILCRjxklqwadUQEzpnrxxsZlUWRWfFBoplyOhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0H/27FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmzJtK5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0ZJp2774612
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=; b=o0H/27FLsKCbcENd
	zuuZBR/4NyfyMNXLYkNG7wfXWl9TJQc5wQtIiqdnMyD4LVcYUO/4FGlBTHEoFGCn
	0mphYX1DZ4I3PFbjQD7EWFndAtFiXABmnzyH52QPRkSUWDYyh5DwbV3k13KMCwT2
	3WcoPqGuke8/owFkINPYH+7vF/NzXVuUx0IMwlkS3cbRZ89zwqbOvvEE3uSr3XBS
	nMV113UEy8Z+di+Z+3/ftstE2Wx5BXjBwzEaAV69Cahegn8ggIN0zO2Ydk8+nuJ+
	SRGSUyi3yQXU7aWoYyqXPX1e8+GoPOO4jyLalOeZ76xjuCEdaBILAyMIhgOwm6Nf
	KkOWpQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur3bcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:52:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so24471185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421572; x=1793026372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
        b=WmzJtK5+FB09lwKb27nYOHSRSUtjfmqrIx8F0G05H23MR1+CBMa70H/joJslgaLq9P
         aLr8Pe3svLcfbj7SizNhs8UOVQxsohGzym50rQ+2zO4izV046jjOkdYwepG+wB4X5mch
         IUJigmalNJWqPP1mDKzr/xS5dvGA8cOlHcQ5Pir3HmbGUeoloTrXkKy5UFgIDlDWyRx1
         dnKGPG4lh4DF0bYzr8+T2tOpnY2SdDXEGy3Ilm30075tZYdFxtRJXwzKb++vTcQp3sxU
         nCuA/4IKP8E9zEzRYR226IaX6mqm3vFToRN9fySm2pBpjkNvaPOXNXSLlAh4/prAFJ09
         GRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421572; x=1793026372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
        b=Zk1QG7a7dUZtu2VTqZ73RAxH4sm2ydvgrBa3/QQQvFE7WMiZ9DGYqG8uNx9LNitx9f
         fflfV3+7p6jq2z1P/lnyaHoNpnTIsED0GspOdzEUIXRJB7I/gmRvrIAhFaO45x0FUiHh
         5zws/ldLdYfrqNMdVg/K8eqjlMLaGqoZXRCI8+DviLCOj6MGNaO4rJMjZz2wE6jbqmLp
         v3ABuN9WCCfwTVViBf8B88tby6VCF3LpSyAywxoSMSK6qiSgCa16B5GbYFLlV7eHw+fM
         tCMKiRxUb4kzOsqT5hSiXtnz204JTuuC+8j/ggEEIDXU/2tVj29pUzz07dCTPZjMrVOD
         VNhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM2gW3/sNKTiDcH+Bc1dKrGSDwH0Ghf+SzBXxMgkP72Le42PQu+3uI47730eZl1mjgmCRps0bS8c1IEUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYCHJKkhVtElOGaaVoKOwmdQZnaSO43ve5GVqgwbh5dadlgml/
	yCHO45qPY2vYMQncmW0jTFKB0mHSwL0F78LlUxAQmoE0eDxKbn2xZD0xFnTX44FY2okJngQR6JX
	WBKirSLBgAk8SJMq77irKxIv91N/JypXDs/vvIVuYjhMGsE9m4tQzsOd9Sc5CUGMdPNM=
X-Gm-Gg: AYBFou260zwDC4HFaFQ8W87d9VZLhE4yqw245slbFaXn0tqP8Nbe5vFae6SW6/rmEXA
	n8GOnV2Z999/EfFE6Z60dRFu41LfKKRSO6WYwmI1q5OlOGMfT4SUIHSJEvdtEzSX/ljahqEijzU
	ax8gIYVeu0LxWKzjtq3Jq8WIo6wAWMP6e8+XLnmJZ+sOrepkUULC3vGk0MHmZSWgyZ65WgpJF0z
	QF25+RpvtvRh6Gf/mkDM2EQhZyzb7IhOOlcPF2DrCAjFG71OqnO8w+921RdEyAjqJvPZJlFEN81
	+PAjdon9z7AVIBwaxBOtF5peAYT79LOiNpUXHVVxQAQKwKjZr1eVb/EcLImGj/jCD/B0PWIdBs6
	nTH8gigsTtzRRPyFfXgza3g==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1420801085a.6.1792421572225;
        Mon, 19 Oct 2026 07:52:52 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1420796285a.6.1792421571699;
        Mon, 19 Oct 2026 07:52:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:50 -0700 (PDT)
Message-ID: <40bdd031-1d56-45ef-905c-32e706376d01@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:48 +0200
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
Subject: Re: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX38jU2KLg7EyL
 QPvwaT39DmLH2wKOcpIUaT/MO3QxCxWYivnVCVOkkJTRL+kmz87/1o1Urej5XqWB0f8QLb2xR+q
 tMYgv5guwZIs+Ff2fjPLmDsX2Sevy18=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX2ysvCdsReXe+
 pa6Kc8hGOgkgJSS0jwn6lv5MSettK653M4Hbm8wbIMU8CG6vy1FOGzs+J++54uF/B6Zi77eU0CR
 h6hvHlENK8qXRVPg526lkwO1UnpnuV45iu4+0T9VIUrblMbVlrone0GlzmCbNAnBT1FhEDvt44k
 31EgRL43tMrOMLgDXW1tlPCZB2/5dB2vAlJF1ThB8f5CtvnjuPiOtSdqIBA+73J5N3ZPNUKRcuH
 ZLN9HtV3oyiZFdFedBV7+Ml/w+ugbBgaveO1GBgMAq16k515Hd8aMgyOyoYBRC7nmBOnOOHaCkb
 D3MShY67n9wvtwJo8cPWf8s2Bqm8bVs7g+shl225UOPeBx5MvO1G4VkkCO+7qWnqqSE4QuMUFhp
 gSITimoQmT6a/xHkJ8qqQxpl5JjPzsMKwJKYS0ATimFtrPOgZG6spMc3fE+6ne/eAXHgLget9od
 987jiDa5Y1z7gu4abng==
X-Proofpoint-ORIG-GUID: CpDhXR0qPlyXBUtPs63QNPQj1-HhG7Lq
X-Proofpoint-GUID: CpDhXR0qPlyXBUtPs63QNPQj1-HhG7Lq
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad62ec4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
