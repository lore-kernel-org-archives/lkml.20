Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576621;
	b=Fmt8PSBunMsck45KlskYiVoNbaEy8n2JG/8OmZV7TQVOMLXRMuic/wmehjqLj9aFw+Ph
	 b567iNyDl6waYZsYnqZQQEQnsoEjBDg0DPrRCD+cciUHgl47Ea4NVeyZAQ/AKbncNiXPE
	 MZVxkn9G6VKMCeDdurSvhjg/hy6POMPEu3RPNh/lKhL0JDzyeO1T5lgIxUmtS4xbzZnA+
	 orai/R6EUwcYnVxlajUPXahK/yUq8T/nJIxawftEDV0/IkVxCSw3UQzcDT5LMIWwZaXXA
	 kJig6/uKPso0wQsilUxT0ru0mm5vlRCQ8GglbJmIU5gqV3PIgdp/i9pylCCtju4c+lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
	b=0UjiRKCMZqy4XwlWQwHu93BOP27Wq9kIgnYD1vLYHYHJX9nb5w++wxspFiUhRJSF5kU0
	 bJ0ja8heLWsImPJvzZWT/Spi+avbnbeWe2TMbUOp42nXldmv1op+eORu2pTTsSF2oDQT1
	 wcnb6+2wXIOZaJPoWE5fLmZ0sVdWA5xQNn29z2lkOHFKiwoBe2xDepO+BA531ChT9bVa3
	 0C7vYf52IHyFeLz5Xl/gh/6RD2JGzC8FQT5rKTXR+y0CMPyH714DIewK3c2UqkPaSxXyr
	 QdyXiukUGQGagLdRqw9NS+2kp+U1PHkRnnp4eyeaNNExvmcUbwbsf24YGlkH+6cMmMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxntffuu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZ6m1f2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8AA606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E8AA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kxntffuu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZ6m1f2
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j2gG3355926
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=; b=kxntffuuGMwXjxkn
	gOl0blnyh5KYfX6lAiuPZWEnEZ+wI228RcmeF9Ft8brzaJuk9IVb/814q244u6TN
	gja38tjFsMUFoqKhWFnJ7jDxENiouEG7sdfybPrUBkzpNIl3zSGcq0IyEvMD6399
	+qQMm+0NjW7c5uzqS6f+U30Fe2e7lKuvsbKczcOoXeoFMXigll2lazoR88CoQehj
	O6yQRbieWHV3xhjCVhW+vW6ljIgX6Osemgq3zPF46rbjr/mq02+JrwTBLFZn1Q3a
	K0mTkor1CmAI+DBzshIeOTJYgfBujdIUFj3cBSz/7r5n+aowwvvhNNJiwDAfmrCr
	ArcXqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kbes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:56:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so13982885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576619; x=1793181419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
        b=NVZ6m1f2CGeIazpdKJhYEdF/4UQ0nQwMco6apm5ZPN/J/a+SveGWrRecDxqtNPxVWF
         /Y/iMJ688gC6cUUsIo0ZNsz1nO6E/gvLSwhenzAqmyX3pPHKdcMSDyPQJsr+9g6oh2M/
         ZtbEyfNskPbd4u1i8fGMNczcn06s7ArUbAX3CNO4XntKrbFZYg2716X1+glgu5QUfxvZ
         7w12sG/v3mIQmd49Iu7dWnyBwzw0EiAcbclvVVMlxyaXYZMaQ0dgm2Zg/lYGvrMZMdJM
         Q6OUpQR0JQEFiX6ZmNZJ2rG3OXpctjI8KqZoMwLmg8Tbyu21czVmM//7JxXhLMwkVHWG
         7tFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576619; x=1793181419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKY9xsZpiB2hvy81yowzV1na85VWyKF8Dx5LqzKmNxg=;
        b=Kzisq9cR9oQCDZaccJs1WZc93pggOH6JTMyXVuCXebi6kQOeLeEZ2H5sV9f6UqifpP
         HRP4px95NlDuzdnfBV2ZsX45BR/B5VL3BKQZX5YPAxT6DXg8EdyVbob17zu7O5705Kd0
         rl9xvcaMU0wWHts8gzSt++JMppMEJQRsgPCV/+v3YVdCWDfhJJtLbn1pbR4DKsSvU0XP
         lZzOoO508OoqWRCJu1PJanpoK3DHEJzooD7CXl+gjQaqGpNoQICKJ7yahyuDy+ASW7Z3
         Trg9cvbgOBQOGiME1YxnqhjoKsvpXdkDK6Z6xFvypcYDAWaB6a0NYaW+No702xQH0zOA
         tFJA==
X-Forwarded-Encrypted: i=1; AKwUvBy2b6ywK2zEM6LGnx9ODXmc7uHq1PL+f3AH6WTQW81zrDPTBoq+hnyxKzRYn/tZFjTjYpZeeYLCrAFqePg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAxQY5KFyHQ9RuNj96unKo4ZvB8BVr+0RybP1Re+/BKyyo3pJK
	qxp+eJRb6Cs1OwKgGJEuY1OUzZ81wDgYsuNqHmPH3qMCJBMkB/ExaMYOI/oGUTXGFrCc0p2oqGI
	aL92uavmAUhMVBppT1o6O83JONGA4E7rJ5LCo5erK39oGk8SIY2Q9Oc31s6llaoGpBRM=
X-Gm-Gg: AYBFou11gFJVF/onnEc8vhCI+/GVwc4nD8yva8oeEAKWYCGlncnEdDXxt9Shsb/AmZH
	6xdH+LMyaT1yNHy6FgJZ/HvYlVCQYWaJIAyQ5VwFwZXByo/XpQGneUUTl5T//ZWZ2GUdb6l74Ht
	ZCLCIcFo9kkFoXqZ/SearvJSGY7y4qPIJwnhDD0iLWHCyDfoL8d3+9Ccem1aLFVJX86ihHqdeIY
	4x6WA38yTTaYj/CGUDquKAIN8nhvdvgs4dfyfNcWcCgyZ7GE6leQK3kkQExXUkK4mww1oGYmTfa
	3vkkfrZPdUy48SSmM/kowE+hxxcrxIadBUL8DOuXAT+aJrgwrBEl7zV7GAw/1d1qw4xrBPyHkoy
	bpCzUQ2ySC8FL3VfqkbO+/w==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr380063385a.2.1792576618814;
        Wed, 21 Oct 2026 02:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr380059585a.2.1792576618283;
        Wed, 21 Oct 2026 02:56:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679035df0sm60238066b.84.2026.10.21.02.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:56:57 -0700 (PDT)
Message-ID: <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:56:55 +0200
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
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX087eubpDB7un
 cegpBOmLSQqv2U2YBOsThi2PmoY9qNultYokT01pjNKtRFSVrvYCa/B/+NQgTqHjNI2bnUadDuE
 Tb8xc5GdluoGcjPMwbFPS0caCv6iqdN8Ytvkx6/SA8uDjlYqyo1YDDX2qJJF01htOTA5Bt+E0ck
 F/WDtkPBlAcxMxtOJ1hd47WuH5PVHk+SX6Mbmv7evz5l5JjqwzQzHPWrworXB7JrXTF2BLoGENt
 wKu1L584n/4kEKF3abhwmGMtK/EjqoZtU/nJRW3s5Jl9uu4ipQvG0BDFKir0tDlpX8Ml7nB2k5w
 eTVC64UTmcmqaN1kkOm4GFhBSWiTzTG2SUKbTXLQPMAMu2uDAtJgkIEkBClT4YgW0zWXtffBpT6
 58SL5cIMdI8OytNhi/P75p8zoV2lV6IEDEPoz07j1TfDLUnbcGJRQjXat7T9a2Ojy5Md/GO4V8n
 OqBDf/ZeKngZF3OLpBw==
X-Proofpoint-ORIG-GUID: cdsXdBQpd0yjo1AaYCA5vgYT1qF9MCt4
X-Proofpoint-GUID: cdsXdBQpd0yjo1AaYCA5vgYT1qF9MCt4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX3JwbxkYEHBvc
 owZ34zO7HnQjPJJoVlyWnGs/KYjX+VDjr876e6jlzHviGMCZzTUsijaDtZXBAXUMQKFwJ8gBwMh
 H9otTnIkAE5acgjqzznMaMU/oHznf5Q=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad88c6b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kut_hORSmwJb1qpv2dgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210039

On 10/21/26 9:36 AM, Shawn Guo wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add support for the Qualcomm Nord SoC to the protection domain mapper.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_pdm_domain_data *nord_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&adsp1_root_pd,
> +	&cdsp_root_pd,

I see 3 more CDSPs:

https://lore.kernel.org/linux-arm-msm/20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com/

Konrad
