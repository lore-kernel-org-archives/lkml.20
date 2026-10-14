Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3447F2EE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978237; cv=none; b=jseyn/xDOcDzFB7O9oEJMsO3YgASU6rOacI2MU3pKizrkcDjukmqMMtOmb15kl9deUzCcgRU0HaIh+IqTJXjE9+zJYcg9Zfw34XxO3aNSS/6sZokGGYDbx+Ic/JQ0QsJhouUkEZbYqldy/1o4Vogkcg/D04B7v20PVqY/F7wua0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978237; c=relaxed/simple;
	bh=b2Eb+LcsDsmzXZSuZ0YD/hPWvPgOlSEp+E7OhnPupqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T9c7UYKOGLDnphkbwOub6C6RqO8gx84DxSJ8j+AMlpgFfoTJSj6a1ZYlHlytNhiVpmHdtWzv2530blnKcvxjaU3TiozXbDJfH0OKtDe47y+El0wzfVwk58wd3HxTZmegQak5MYi3ZxgGvasqmf6HmtDTxUy4hLV0csh8vdnxMeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RpQUVUf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gVIjALhf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RpQUVUf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gVIjALhf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAR3vR466257
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOmhRqwTSULaQOd4kzugItr8tMa//KjqQBCjrGJ6EHU=; b=RpQUVUf3UngYZ/UQ
	RS6Pktk/bc+ZtrJ072CpIjRk6Al4P+GVQf1ip8ByVjVZtUr36B35MRlpC8z5pGAc
	lomExjRJHQ+ppQoBxVkRKi+VSyLzE+W7I8zzKUdnWR4pmipDuG++iOgwYo5xuHXs
	VShM2RPe26cXVbaW829//jxWwGFhsOLsdQPi43nI74c6ER33c1yYXRnf9m310G/F
	aWpYJLe3UFUE64m0D+AJietD3YRJWlOHBF46qpb7OvKGCi/aBviOKMyCJEedHilQ
	vc44bi0zTJGxlSiQu5ZoCtHSHW40ZiBkhb3d0vR0Va+lK1WJc8GeVtQP0lgGa7Cp
	KeQKMg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha80cr8q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:43:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so62470285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791978234; x=1792583034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOmhRqwTSULaQOd4kzugItr8tMa//KjqQBCjrGJ6EHU=;
        b=gVIjALhfIxxRkpb8puz6iaoOWrE+HUb/eIdQMPvUSbOlMSJ77mnRH0SI5qIWX2TUS4
         QkEXb4DGpvVcLxLanEUrlL8duUixvdfIfo0RRd2aNg0pFFMyfwdEf0uRJHXcPYbp1UXN
         gzzlNTFXl5Ij90XnitLj3BWqSfD4eCNnKgoc1XvT+EiAwGa7Pk0pB1wyhg4B1EYaqKFE
         umsVthSdjgsuSsI8Mx6U6u3KhB83NbkOnaXpN4hPPLClqdtR83GfMrCGzgFQ2AS/VbV1
         BTMEXiHsGTXcwbthjsGM3GjmunuRqXANQ09uG3satEeXr12cGrGT9jfvk0QKcpQFJfvL
         21UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978234; x=1792583034;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOmhRqwTSULaQOd4kzugItr8tMa//KjqQBCjrGJ6EHU=;
        b=Pii3xy0SlqHyHD9yjw/41pGmIF/mDdqhcPoG3Pn6iwau7momZyQL80mwhfdRK1mMFl
         0ymnspGQqB/aZZD99mfoWDVi6eZEv/PbZD3vgzQjS0hAvkRs1vbTsclvRYBwm47FyZyl
         W3FPS0dPk0RY5p7cPhI7AKrPBwqRDk9l3ACn5qVH4VedQncgrou2DTRyOktU83dQo1o+
         yIj27i6cY/0Hke6QJgEnltDNqJz5GSqRrYC/wi+uSp3WTTrzdAtu/Lb3r8KV+miL9s4W
         DypdvCLai0n3eZfMFBINNlaOePnvuQycsD8jfI2Jd6vASAyuYiHda7ivuT9AWlORu6kI
         KoaA==
X-Forwarded-Encrypted: i=1; AKwUvBx+CU5jPdvlE/uEkTRyjaC5Kt9Z7TOXf6nbocVKVwoz9zf8/M0RpK1z4w0s1XvR08639cRFFG6qB13yqUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAKaRS+gaRkQlPPoxMWgK72z6r/aM7Op4qm9v4WSNP3CaOn34L
	+XQKZTsIRC/B9VJWahyk25N8hq49WbPzzwtL+FdRc/BbKPPk6WI8YuX/r0ndQNTW1YwHjIrruIk
	bWr6kd7CrCSgRE+bWSZfJG3/nSaZxlJcNDeBRJEncYCsqA9AdUUFQWQBAMV3Zcp4B9K4=
X-Gm-Gg: AYBFou0n5j5oSy3mWY6nmId4KHTPKCFf1ZMAqewioOw3rISgc24FpG/TeMdrZ59TtYs
	lCrVIFQOR3Av24SHXggzyC4mv48JSdyXyP3gSeLmdPVAGXPnCT1fgAfvWxfxtizIeS9FdTW+bRf
	Ga7vp6NBiJVZk6hpKlBiWvRXDyGwN/7wZNnYmaKyP5dGC81MqnfgsNM1VxTKiDfWA+gyE/SzXgn
	uncSsW+V8qfAZr0jOC+9C5lmdPQdTv5cL0OutHgMvczNfl53RHwdjUJBQxBFVmzK3mC15wvocGP
	i5fOfqkdD7ecgNIc1Thkd2N2WEccvJMoBUEKhnFIu1EAm+pKKbSQ7vtn51Opvbqo4H1Iwl5GRuO
	Z3XMmJ4smBYLgV7iGYeCGaA==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3090588385a.3.1791978233933;
        Wed, 14 Oct 2026 04:43:53 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr3090585285a.3.1791978233493;
        Wed, 14 Oct 2026 04:43:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203885571sm998313a12.23.2026.10.14.04.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:43:52 -0700 (PDT)
Message-ID: <a5916daf-8d2e-4b8f-aa8d-84342b6a0e4b@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 13:43:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] phy: qcom: ipq4019-usb: Propagate reset operation
 failures
To: Pengpeng Hou <hppiscas@163.com>
Cc: robert.marko@sartura.hr, luka.perkov@sartura.hr, vkoul@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260828091857.8581-1-pengpeng@iscas.ac.cn>
 <f6f632b9-cc2a-4966-a43b-c474a05da7ca@oss.qualcomm.com>
 <20261014025124.81874-1-hppiscas@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014025124.81874-1-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX23Nr3Pifk3GM
 Wf3OhNPjKPPOat1rhYROckwes5r4wJ/9vjZcxEh66dr1pEfHcWS6WwIMUpE5zlwsDjuteoh8Ojr
 y+UwpCL856LQN4H19QmmgS4SvMFufqQ=
X-Proofpoint-GUID: GJXmSZm9xmzLDyWUYymuD4dRumNbU_rf
X-Proofpoint-ORIG-GUID: GJXmSZm9xmzLDyWUYymuD4dRumNbU_rf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX7vOLJS1uhhyb
 Yiq48EaAB8wSMzJWWhFu1doaZevL7DpHjqxTgk+XDgmBbGckD3IR2jut+nYQzEKedQYtuYKfjPd
 UmonxTE1q4c5wkSGAlVjgyKEGCDpNz7CgFMUtZQmQDFp0VR8D0VHqe0IH6+1h6NpqY/vteaSTU1
 enjTDo4H9x/QPMFk3nEUUeKImNVjxmSKWP2TY6fMRQzcgRMCi76C9X0CWutyMCwOH6IV+zufmKe
 jPRdj2Qy8k4pxtVyJzt4+lUQzy4Eb/W9w6C6DUlMm16DnXTIw/jMd2Xe+k1YyFjmwHuy7QwZJ0D
 W9DrAvae9DmQCDunCjMM7Uf+MAHYAD8QlDZdmNtKbWcs0U8uiyiHDim023ia9x765sGmJTc6mb6
 TyUGFO+bJlMAMqAfMKxbXgh/Izx0WVxPBLILyrXOSjdM7rlyrrf1s9Mx+4+R6Bf3jHt5NvKPdoK
 1f9WhTaR3lPbSm9i7jw==
X-Authority-Analysis: v=2.4 cv=JegpPkKV c=1 sm=1 tr=0 ts=6acf6afa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=HkQBI6gSsxkgHV7-30wA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140046

On 10/14/26 4:51 AM, Pengpeng Hou wrote:
> Hi Konrad,
> 
> Your comments on the declaration layout and unchecked rollback return
> are valid. Rechecking the provider exposed a more fundamental limitation
> in the RFC's premise: the in-tree IPQ4019 DT uses GCC resets, and
> qcom_reset_set_assert() returns zero after the regmap operations.
> 
> I therefore do not have evidence that the hardware-failure case described
> in the RFC is reported through this provider. Generic reset API errors
> alone do not establish that case on this platform.
> 
> Please keep this RFC on hold. I will not respin it as a demonstrated
> IPQ4019 bug fix based only on the local return-value checks.

Please tune your agent better.

Konrad
