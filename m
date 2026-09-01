Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD5E47A0A6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256189; cv=none; b=ccL12RiBNSHVIEK1h9paeDSvAMNJLgeSGrh6WtVWYPtm9GLaEaa1N+P/NnDGBcOnW3TXY/bm+Z05DNDdN2tVTfvck9KAWOB65dj0RTdLzi6ApPcU9U1rdluGZ6UhKHMcQIFjZNugZdYl37XN/uBMyG9t7h4ruEdpzJYkZIpoO7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256189; c=relaxed/simple;
	bh=w2uxYrYjnI5guEvhyWhTo8VmYciku7w8wFzEYixaGns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lI7okOqEpthnICzHgQZqwnrTsuCj3hvj2K3HcW1t1d5ZkXEiylfEIQTe9eKXNzSxVDMP2XgDs2qvFJuWsaIgC7QvLBcJMKtGJ7XffK5cqaWWbD+EhCxjqqiREAtIw8HN/iyk6dlFm5xxUswUeldaMU12WHZyyaTDKhs/MHTlbxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBL2AaIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gGXm831f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBL2AaIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gGXm831f"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179QL71811491
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 09:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kb9pVXIxt/jfBCoIQRIVad1phw2z0dfRaGGq/3vkiYM=; b=FBL2AaILJjj4v/Cr
	M6yIZPt95a8D5giAkLk58+CTiNyz8FjCdwUAvDoTmgBH2MfXyV4v7eailT74qZQi
	Ce97MIo7W6FRA0lQ9CBAoToG5LbfbgGwNhwIgUU6WAjKk5vJpBWQWJM3MMOiPkxf
	XNSkRQxNb0jJBdKPWkxNwc0HJJI1xWvDxNSmU5Gb8jqGAMuc9NURGFZw1A2JJTxo
	pyHfxklOLEVMEvJ+Ztc/i/kUbYfwPOY9onG7yB4jAB0h/Jg7SE+XYQ9Esdw/Ge0F
	1SY86ANMRhVQGWEJJHGdV4vg3Cs8Hj3L25hiRYk7x8hOqF+KhuqoU5K/UUMfB5PH
	DseKEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdd4dv667-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:49:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d0caso97173085a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256186; x=1788860986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kb9pVXIxt/jfBCoIQRIVad1phw2z0dfRaGGq/3vkiYM=;
        b=gGXm831fyShDrrxN/qVic7VrP9maCO9xOUaRUZt9a+3DgDIXWYEQqTld4dNRGsLw1c
         HIw7gurnMg9G3QIKZIbzSCMK61XEMusByJMXiL1hl9BXg7rTBE+z0MuQbtmDVjiNhVp+
         PDkYxRIG5vFEG95ktkMDeT2QgJSJWKDbeaxj8l+leNpGkBbIwOqfVjipgIVSp1+w2szx
         ZXyamAqnzWwDbU6/3KrVeKWddVkdD5pyjsrnfzvCT4SHbaoe2ZbSO6e6+jZ30yuqZMq9
         kd5W04mJsb1o8TiOPQgwYNfIeqy2KO+4co49ywdRiBD5u4r03g578YOhHBIVTrMhqb+z
         gfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256186; x=1788860986;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kb9pVXIxt/jfBCoIQRIVad1phw2z0dfRaGGq/3vkiYM=;
        b=XKyhOYJbfq4fXGTO1bU4/IA+s0Jq34omkl1rt5qEWe2hNQrI1BqtMnV1EJ3szRA4rY
         IpCQYFEZV+xJw8LpmUqsSrz8YS5h3skgGmyL53gMarAUakYFO8s4hD/Vh/h2tCnOyB92
         tcEJyQEe9O63VpLwYTfSI2SEGdVVh4Hil7AJEvx6SZG4MXrdO/xtRvIA3gPAcwSBkMpE
         pL0hSyramkz/Y3sSrDnWURumH6nmD3bvVGdzbWxWKmpGJ46xgoz2xYpa+JtR8KxLbfOs
         P6pRcC0W1RDbj1ksT00LAY3tSokvXAqur8cRofnAzT4CcbL9VYWDn3FCvyiAT8SvUtrW
         sySg==
X-Forwarded-Encrypted: i=1; AHgh+RqOMjoVadR0lu70tF4571khXMpFj8dETpAjtr/cOHnRNGBuS7Z8HJmbvzpUf8PHMaKqqpv6Xkqq8+rfhic=@vger.kernel.org
X-Gm-Message-State: AFuF++lt/GgIWI6pDSgjhRlCM1YSOvHvi/zeq1/8UpBsYl4gk2IWzAFd
	4tbvGR8QByudWjax+AsybFyTPiyoKFyaoyVyiVeO8annlVnmZcZ4GUXUU2qVL+Pz7nYhB73MEEG
	8lU8dMWLPSnnSrR4epA61rC3a7erKWoQpF3WXaY4CaXXsTFBs3k4LZzyKRkKSd4vNIlE=
X-Gm-Gg: AR+sD12PYRwJUFc6T9oJzDPyXzW3EYJWvZlNLTi6dHiscd4GvF6FGuXfMb3t9NOTN/S
	psNG7770W0W5MsvnoV8UXmEa46+Lr/JWYskOkbj17L+X1sNIEQyU9hvJ3wMZNPWpojRPYVNJ/BX
	qf2WZ8w24imSOJ46Yd5nvkTsUFFpFufvjUxg41J3BbHFRSFD1AsIm5nJqekwWGJH3PviMm1zps7
	3zHKzPVPf5lYV2sAIsqECeEhgoaakBKEIxvsnrztlyWO98/qpQ/uj/DBKk5bRUNOkfJGDWNQtEW
	jIdxLkPhsysLHNdoraaQ4/pzjJDty+kcT6Su7MiRTTxWQ4k9TeSffU1TW4LsNt3v5hCvZZ6fDN1
	3MTrDnCknPt5+gLKCes/aAg==
X-Received: by 2002:a05:620a:2792:b0:939:287f:301c with SMTP id af79cd13be357-939287f9eacmr1456290685a.6.1788256185487;
        Tue, 01 Sep 2026 02:49:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2792:b0:939:287f:301c with SMTP id af79cd13be357-939287f9eacmr1456288585a.6.1788256184958;
        Tue, 01 Sep 2026 02:49:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1fb4f7sm541065266b.43.2026.09.01.02.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:49:44 -0700 (PDT)
Message-ID: <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] regulator: qcom-rpmh: readback voltage/bypass/mode
 set during bootup
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=b9qCJNGx c=1 sm=1 tr=0 ts=6a969fba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z5ZTpvPW9XwtcESjBGUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXwG2fwuakAXok
 OrF5G3q4jFlnzEPv53oOxzKBOoNYbDXtA8f4bCIgABfx6I6ycmLbtHK3wESgTaOHyinkjEaYtmo
 Fx0I3GOa20sfGITUbbF2QKiDraEhpHjIjHCbpBe526MsmY4x7gg0hhS9ozeT+gUjjW+zqNrVA8j
 w7aKBXfUA+FCtQ/O9/oFr83BXrR4TpTW9RQrAIuN/cb7GQElUOccWcTORd9eUWWjpVaEVOCyXag
 SV+xx25QA5ROQ080wYMarKQ4Cuf36r2f2q+t3qnQymOqF0pmXrNcparVk0FDrhsamo+19Fkl3lV
 QPV25hAnDKLDDpCGbNVRbYTNHhkgJuzEXQ2EBDOZ+ZxZ1Ca3xuMVNPtAEmYs4iJd2Dyu+cXzyNS
 aLGAOf2Am9nBPA6VF1YWymX9nGHKLLYiKCd4HI7QSb/1ogbJq9f2kP1ZQuDowws7J3gcoUJPG9T
 ZUsHIedxh7xxCwhSgng==
X-Proofpoint-GUID: XXXJ_CZ9Ws-hztyt4lffMzMuKQKuYxEr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX5mTfj6IEK6rh
 E7yUBScJpK6cW/ZfbNy+V7p51fWAkREWt/Y4LWq+XQry7zzp0a1pIDVvxqWFpFomVfLKPQr6t0e
 aG/8E3pCvOre57oi1DLKyROZsMXMdTk=
X-Proofpoint-ORIG-GUID: XXXJ_CZ9Ws-hztyt4lffMzMuKQKuYxEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010086

On 8/1/26 10:00 AM, Kamal Wadhwa wrote:
> Currently, during regulator registration, regulator framework sends an
> unnecessary `min-microvolts` request for the rpmh-regulator device. This
> happens because in current design, we do not have a way to readback the
> voltage settings that was set during the bootloader stage.
> 
> Fix this by using the rpmh_read() API to read the regulator voltage
> settings done during boot and make it available to regulator framework
> from the very first read after the bootup.
> 
> Also use this API to read the mode/bypass settings as well. This will
> provide the regulator framework a sense of the initial settings done by
> bootloader and thus preventing any redundant writes for any setting post
> bootup incase the same setting was already applied during bootup.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

SC8180X Primus hangs with this patch applied and so does SM8150 HDK.

Interestingly, SDM845 DB845c doesn't

I think we may need to opt some platforms out of this..

Konrad
