Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4510401A2E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419751; cv=none; b=GrN/u47la152fElZ9K/QmhYP/WqeHNhN5s+F0wWtxTViyOOw+uw8fKSiElxCRBMmMQM3oIEf5bI2BFqGkDlsBEgtmMqxEmLh7pK059DTKMYwJRIh8F8mKDuZYuyhOuLjepAvsdtil4DE+2YENoelnBQYYNNyJI0NtBS6OPbZg8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419751; c=relaxed/simple;
	bh=C/nOroiUx2tLirDxWurDVQ4C//sLkZOgC7vYB6hGC2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ej7lF9UUeTZe+N/WP4v6zEcgDopOZ/lpwbxsod75FFIMGLTw5ywhzlApRJGfj0tvt9YvdtF9Q/IhQi7PGUVbctSUgvded4h1siLumBEbTP4LVGUmCEXMrYhzRhGtd7ey/7ADZiLKtdTOEQ3yQs/ydNmkCMwUOEpt5jFybAeb8KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IBWckHaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKcRByP5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IBWckHaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKcRByP5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lVXO3749563
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pX+PuPvcsLEjY2KfdhpqviBYNIleY94z8WtD2Xi80Y8=; b=IBWckHaXl3817XYm
	ukaExoP4nI8UFw2fvAiKrTF6yu9aRIuXADXsJEf1NjhqEBhVxMGuuji0xX/D5NPu
	h9pZ8r2HU1BvmmjEAJZgjChESDu1bUY4V136pjiodEcWT3Jn2f6lFLz3lF6zqXVV
	9+IxshD5RX3pKmDEdoBZbvXWAS2Xkpo1X+n2oJvEO32H4uCfJ9adH0YMVD2xlm/S
	8GRWDdX6Gk+9713Zl4SIf9Eldp6jYflfxnOxEEfG+/K73YRbHlmcQpJLYcCoQH8I
	GkRg60LZaLzASn2XLFoKbcrDXfMW7/QESq3CvjhiL8a3ZMbWYnbhTiNGLDz6W3RC
	hzBgkw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5ucqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:15:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494b1e35cso42727085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788419739; x=1789024539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pX+PuPvcsLEjY2KfdhpqviBYNIleY94z8WtD2Xi80Y8=;
        b=CKcRByP5jppZrdKH8KBfX7E/TVPJHaHMnB8PoIVnC8q7r8CkSJjhNZr02XWaBM9K5D
         fkROitPFd9l78aAeUsleM//DvYmyZjrT4TF3ApL/GWk0Z5zKi2KQ+1TUA9l2qfQ7bNtu
         E8TQ97eu7rb2c+ihvRMhe90Hj+mRuMkDpmPsrnZXC/Voh0OGgQNr1w5Qo/XdDm9hQXmJ
         rQWV9oCzMz4jtlkLH9VTsVW7VSm5RV7w7hz8HsLqOrmjBUkar2F2y5gGxlxXssfDdd/v
         T/i/fbvr97c47LjXIDeG+J37rxcgxTlqXaur8uLa7q3UIbOiI+yTG10VlSkPiYna4l4b
         Uacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419739; x=1789024539;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX+PuPvcsLEjY2KfdhpqviBYNIleY94z8WtD2Xi80Y8=;
        b=L5eYWpkGLp9Rhu0MslgpIsOdNjcYkjSWtUUhvcrPMOYfoX+rhWkm7uEqLRplked7bz
         vE7St9pTDZgUYIoXC+9/lBjaPFJ7zCN81AyimXWpYoIg/fCG+mi6VhvkQ72zH4B9icJm
         QCa0af51DnG8DRu+c5JgAdxC2tqnboKBUtM9Bw526ac9dYyx2H5+lVd1U95vucITAFm/
         4GIexKHdC7AL+tiTTJIl7jrXkYP9I6uLh1gSauHclQCDUZEIAmwLShNQEkhae85p0VCH
         B8OOYJFmgfD2uWS0qoin2BUhlqrbYL4ZnFk8FyEX/jzKRH9fMQPFjFHUFTVmO6RIQ37F
         WCuw==
X-Forwarded-Encrypted: i=1; AKwUvBwzIZEsKBy2cbwqTXAJOkm+sd60rzqIX0fiP2ID/elVwPzUeiTxe+yzG/9oY9A8OwhMR23FzeKb9H0t5UU=@vger.kernel.org
X-Gm-Message-State: AFuF++lfR2ngo7Qc5qd2g9UBThmH/iGzDe0Lb5DqDd4nRYtwuopElUap
	qTNpqmU1PbON17Dv9N05CicTKP/UJdjouH3X2CHXORt1+eUhBMaoD9rIrkqKvt6TuGjgLqkyPjD
	Dj+Oc9g+2HdGTpIoCDf2qkYbd9Va5pvacPIEUw/VHi0LD1IpSUiKGDpsRuyaGw2hsKU4=
X-Gm-Gg: AYBFou227eAxfEmpaVhZ18L+cVzSVXJth3qgUDBK4Va/5L2+wvIHLs/LWQVNU+3aVIz
	k0ikppUop7+rmMhMgCbYtFfRN/9+cZTQsO49Fzpmg4I3EKqJjARNKdIBG+DxUUSOzRw1ngTp9Ku
	TzS4naDMEirv6pOZUPfriQfaQiJHBiV6IfmG3aQjMo7ITtBPmKatcqdSwgQTO1FEBFP3nBZ53Hk
	V1IIanOKRUOFNr7PwwzMx4Z56pCPhD6b+T4NmfJxJHAhh0Q/XvqdR3LuoX4ZmSLh77iH+xx8WDO
	ZwZ6ImrEd/NzUXxv+ssMUF/TnW3FLCIsXasFfuT74pCWqEqoQDkGUF4esBCj3MJisLmC8VcDYzX
	6oV+DoUv5V+o1TzrmGRXlzg==
X-Received: by 2002:a05:620a:2915:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-93960e022f7mr811887085a.2.1788419739052;
        Thu, 03 Sep 2026 00:15:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:92e:9cb3:3f67 with SMTP id af79cd13be357-93960e022f7mr811874285a.2.1788419736851;
        Thu, 03 Sep 2026 00:15:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4173423sm55809666b.13.2026.09.03.00.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:15:36 -0700 (PDT)
Message-ID: <05b417d2-8522-47fa-aa9a-b82a252048e6@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:15:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: Add multi-port USB-C
 power supply support
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260806-b4-battmgr-multiport-usb-v2-1-1a6dd1e06cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a991ea0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ErecBaOdECMvu8LCLkMA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: DD4uSXLXK2kYz6ODhoNc6sVHpLEQOh9W
X-Proofpoint-ORIG-GUID: DD4uSXLXK2kYz6ODhoNc6sVHpLEQOh9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfXxw4Fa9eMdULS
 EQVuudZOlA0NkQqtr4soc99gitfGjg+yTqi4fztEpMwLBi83p55P3sLu3i85fDZlNbWCkJK7yJh
 0OAmHCGPW9b7KVwH+5Ek2JfP9hmqQxgTrzVv+P9n5mbG+MfhwY6p03oXz8spnzcSRbfjhx0g34o
 szKFmxP2R+36BB8nimBPoNLk7JFwEaiYEyU7xFXkwb5p5ydLlUknSYRAYqNtFppr+yWuxxCehme
 sPT1R8DdyKavDoChNj2IP83Hdl3o//BatNErlUAaYT5uFXuN7+JzCz1iWnSkSBf6N9IyIoLaKE3
 o2idbORfxwPchSJvFIzGU4ELQTiCMzfd3cpuNzs+GzC+QrzQXMrvL1DmwTmqoCk4gbcdCm40Sfd
 G4MYA13Wo3aOuPL0mvqtSO2RV1GAM9hX0umCHskMyi5WJgYCYWvf/oYillcrxyZDDVDCEK/oo8I
 jPTYNrownBmcDkwiMQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2MyBTYWx0ZWRfX8lUQ2oofrEeE
 kUPf+j+g/uDG+j7wirnItEwEiktXnZLTFrtEGKZ4elhbsSjxNA59zwucmZryGPXpL6RpY0SqrVu
 2ZmO7HVk83R+8eL4ttEtxgAlMI2Lgks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030063

On 8/6/26 5:06 PM, Kamal Wadhwa wrote:
> Extend the qcom_battmgr driver to report up to MAX_USB_PORTS (3)
> USB-C power supply ports on the X1E80100 & Glymur platform, which
> exposes more than one charger port to firmware.

[...]

>  struct qcom_battmgr_wireless {
> @@ -316,6 +330,8 @@ struct qcom_battmgr {
>  	struct power_supply *ac_psy;
>  	struct power_supply *bat_psy;
>  	struct power_supply *usb_psy;
> +	struct power_supply *usb2_psy;
> +	struct power_supply *usb3_psy;

I think turning this into an array could make things more obvious

The defines also mention USB/USB2/USB3, so I think we should either
rename USB to USB1 or re-index them to the more natural 0/1/2
(or perhaps primary/secondary/tertiary)?

Konrad
