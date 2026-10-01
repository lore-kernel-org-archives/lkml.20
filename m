Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330473EF0D7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790845628; cv=none; b=g3AK44Kj3gULKLNL8KHVIakcDntOE0Aiz5MUIrKdqtBW9gZSCJsTzGOXbkhhyrdn5axsF/5n1v2vWxYbcCF1pDAhiU8Inel1dTX5Kez6L1SRAapyiOF3EcBhkOeG7mxnrwBuss8uHr3xpLhTE5Tjcd1VxL1D9jhKRRkGw/iS9BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790845628; c=relaxed/simple;
	bh=xxINYb7KRet9mOnV/OAdNEkf2LjfFUGWBGdo/w8M1Bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzD+3AGuijhm53kWXAWBQEfIuHE0zQ5KPzixJvsTMDujmEXVR/JvyNmEDGKMb2kBDlJs5t/Mq9QtAhlQ7/LauAAbLFY0wFMrgOYSdrkT6x/UAFRjwRJq1pCsepq/4J/jkelifEo3uAg7+sROwA7ZmaZ58L8sqIhPYEr91sicpNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOLLa0RT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FGeofJp8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOLLa0RT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FGeofJp8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLWA1932307
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 09:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=; b=EOLLa0RTYRvY6Huc
	mbIsw8fBa3/+QjNRKqUH8/rAKJWdBWbZ0pAJHmLEn9hqyEV/rxVFkvmTPD9TjMKi
	gsFVeseG5UHUSwQCvMbPrpKtz+i9BsqPcjTsarUaq7KQHzxeI291ZGb/FDkixYJa
	KggUaq1Xt/4s14dD0Hhg29FRPXY97IK6zMTbt0CAojDSuukCwyewkI91d5QRRw/+
	G8mpGvMt9TKMo0+HHerbjOIv7P0p1QrbNVZJUEelI6zmzff540KcvowyOGOd1Eg9
	SFyK2CjmLFuBRs7TI9AuVEQC7YUvUZPM0cudV11ZkR041HZ1QMj/xYDZdBsWy4aR
	wBrBVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5a17p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:07:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d0caso118587185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790845625; x=1791450425; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=;
        b=FGeofJp8ZSHp6/BU45YkUgjIdaRg4vAXbN+k5brd5C0py5SMj+B+Ww2pivT/8OyRXV
         cLsuiCOj1NwfJkJe1fNBVLsUwGmKBu4k2h2LW5T9gpsXYqLKV58o3jmrPUdnnlzG0qrC
         eE/WOyAytXFioq9BPzk7jNlEtk8F5YBI44uzDPt+fpPZIyz2MCYJeodUgSw6RW3ddaq8
         KykUYmtCxe89sXdp+3Wc+OfjBz/xXBg+NLcdutSlQuOftjbjI1Bv/71bvGTgvyq02Dro
         /yRC75QKr+3hEQNbq1x6D2hgBprsPCz2ywpd7vsS9HZ/vFk4e9YfQ49V4YvnK2d8u9pT
         j1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790845625; x=1791450425;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+xEd6CKXKcA4tmdjetXgdA/2bmdstif2pLe355Exqw=;
        b=a202nPlh6RpiSy/fbjr7ytLE3fbt5ePn3ox6+u/2VqHGIZpzSTynGqQ/8KLCqNxpnq
         7vlKHqTawDMr7tPxbySawZK1VQypzkkN2/6Sf+1/Ty1vsatSWTL2DDHqMTcqsXIZTip+
         4LXfjrSFSekrPiqCPnPPBfgcKul1JF4w1eOCxwY5hbq1K5Yn6IgKLmg+4oEJXadPuCWK
         Ckqi2/lJZNbESCRHr+bTTeLM2c0PlfQVUT7vXdRto4Bl1Vrbt9GkOZP14RmudpASL/Ty
         787gPqdujkStrWhOQSy01yo/iEYuYXRFOTkIOobKP0qciCmyxPXIOuvQChP5Ljc9P5QX
         oy5Q==
X-Forwarded-Encrypted: i=1; AKwUvBws4ypSVwibJvSnH9Os5kbB/d0FiRs/FrG1HoQWkcZrmRC03/vN5kBbpVI2uqbZdY+Gf1584aPqKLc3CHA=@vger.kernel.org
X-Gm-Message-State: AFuF++m6JsNcd9WfrP86xF3fMtuUTvXJ/179pPlMaAfOjCHNkwYSsQPF
	/KKDTUfXoikiOtLFO+GNrdhYnwKotalSI8/xYRCi8vClzCcN5MsaLt/RgJ5B9CDYYd1zsM5hHWV
	K6/hR84BCSJFC33ibtG0Gd6Zw1MvdiDfdbIgVk+O2nRpZeZt7LzyUTDa79EAi++QM/jg=
X-Gm-Gg: AYBFou2Os5+irRHRt18xtjr34mxiBmKvpd4AkGhfyFtbUHm3lU8YKQHuo+WCv2EKQ+z
	Ee8QxBiGTYmVsjefK7tU6QdD/aZgagkMnKD5qz+spxoPEssHO+kr2L+YsjfrsMlpRcqCKFR4vGA
	Ybo1ztLgxffLtVscolHi5TgeJgn7OZBTvU+GBB4wSkg6zInr62EWvYga7zyOeTe3lrA3LVDs0wK
	ol2mqBMm5bGEdJVO64//GmMCy1IRbwuTUl8J9c7LHOdcekigzw8iovZmq7v/8zttwD1VqxJ3Xvq
	oNr4SD2EXuAyp25qvsPwxvETIflFBGJXrf3lJ5ocbmDxxVsIjVar29cx3GOAz0kFM7fZ5ABkIer
	XLrhAIF6cfQjuGxDv+pqrKQ==
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr733563585a.1.1790845625524;
        Thu, 01 Oct 2026 02:07:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:93c:6c6e:1770 with SMTP id af79cd13be357-93ca95164f2mr733560785a.1.1790845625116;
        Thu, 01 Oct 2026 02:07:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d3f98dsm117803566b.40.2026.10.01.02.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 02:07:04 -0700 (PDT)
Message-ID: <4905ba01-7b74-40c7-9f99-513b26a0d9d9@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:07:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8917-xiaomi-riva: Enable USB
 support (peripheral mode)
To: Reza Kurniawan <imkyufie@gmail.com>, Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
 <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260912-riva-usb-v2-2-997fe0171ee5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UmMrZRZhPcryqcbA4yHv0Y9Gq971HmW-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNiBTYWx0ZWRfX2aJfEyQGDliZ
 MI5QeO9Sx4cFq7SM/zqaJprar+gQvhYP7muKHEPtKTiFwUcLei3LDUQ13dzoJl0fL3muEJeQ78+
 IGl66ftRCqNn3tpIe0juMbTtl+xC8kw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNiBTYWx0ZWRfX7rdpU7cTkDxe
 jT72XR7H/4f3njT1LogYoF8i9lKXh3Gce486xBc1qxdbZkCx53DbcO/9fiaYb4JcD08e5dpzKYH
 Ze7i7Z21os/IyEXcqLOa2QF2AEOQvQg9i2h69y1TBcKzn1qk3VbPIAvulP3tGI+7UUNHj87Dcy9
 wFM0C6lEMFeagsuC1rxgfnoT1COIPmUmvOaKmqIDWNiw9A8kRYsVTbtqYALkeyQDcEtagDlbnoC
 Ob/IZyQPAZCrxPqMV76D4R49a0obHPIFJAJfSGsBo/A8zMHTdl+4FPV0R5pZGibTovMq9b/uy52
 +V+Y3qAw5G8ArnKdUVczoyeVkhDYwzb3yKaIvVP2zRmmIUhI2tamMtvn6Ajz/uJRhuxhtYDAiyw
 B3ewzWsEFb3XYFLi/aJJhB3P/yWV29fSrYIMmbWN464cVToKRh77XMmxJ/hjgaiRdbY1mabkCb0
 9O/MG+39WW5epoXdMTA==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe22ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=AYGg-ij1XDh01NWh1ucA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: UmMrZRZhPcryqcbA4yHv0Y9Gq971HmW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010036

On 9/12/26 5:18 PM, Reza Kurniawan wrote:
> Enable USB node and PHY. Since VBUS is wired to the charger IC, also
> set extcon of the USB node to inform the USB driver of cable events
> emitted by the charger driver.
> 
> Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
