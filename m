Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472336;
	b=EuAoRPXCleX025mPghV+dDsq02qbLJnk+1hO/Y6p3Xk8ISJax570UwupUEZp8YHrEZIw
	 hAwHDsPVx7CYSnwxFwOWEu4BURRA2Xo8xoV0Pa6jwXc7Vo3xlBTjsy7bOeqNVR0CxNUfg
	 6jF1+RmHMK3WE8jXPy32749H9L9XxyWqfvggNGq7zpl7dzGxqWTvfCjCs+SuWFjgxejI4
	 z3ok1GI7yvGewOVboPbrTFGxkjAkMZsNYLnah6+7Gd9ntZIVv1/DWx7TLnyoc37+nQtcI
	 0ygTXR2oV0sW/UnWB22vJhXh+gjak/YcOBqIb1t1sO/6ZxyRmxU9aHMPHWZ63DaMaBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PPWFCZPMdbZsiAXaewX5I067c3oSdHkIBL8gHJXwb+4=;
	b=sJWXafpzdrKlWvmP5JVT0lt6al9VBmqF9gvj6UKVm7K7vcPWGESZYf4IeocbmTxu96W7
	 i7dnUUGSqao0oDL0dZTafVS7iRkq/b5ny+JsLa2uyOz5cS/3xu1tBAJMz9YVY7jJyuKZQ
	 kCxf4GO6cffWXp2wO3oOgGYCkI59xOpoRL8fe13EdMbBOnt8WHPSEaCZpfB+i0z/ULele
	 B1VcD+D8hz6vja3WVAFLrugrTTRZugJ7NLJjkb0O/h9iDL0yWByBP63vj/PFrtDyMIcok
	 ZNa/9Q8TD0MFxPvi0x5+glsna+j71ad0qwB+s/43FLqYv7hqSiva6p0geyFOhMZNsRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrvaoMjX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlbJwqSK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D15606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D15606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mrvaoMjX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LlbJwqSK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZVoH597313
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPWFCZPMdbZsiAXaewX5I067c3oSdHkIBL8gHJXwb+4=; b=mrvaoMjXok1Dlrsl
	WpjTc3NXl9lKsGAg51AWl637hNXcryK+bDkayb1E9faNuI/1UxEuEf+8Me0RGtbQ
	zYJv0HC2hrm6Reh6GkhhbWuTmnudxmx7l/b85pyA40gyKHPEf8Yj4IUFG7H8m29v
	RfZPM9NjBnhNOZ+2QGCMkD/9Dlt5V/riPBWbIVyo6v6r1zo/DRAc+rm69Eqog7Xw
	0KcwF0bghurfy/qD3iCYhBC8r5fF01UbTSYy+gYz3knxVoMvmmNIHs+pGGk5oX10
	39f1mOf7/KjsohUgrRYaHL0roskL5WTFZGkpM4QvPOU5ZEkRKetcwuwOeIhOGngJ
	mV2PUA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt153ump-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:32:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2ecff433dso2623154137.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472334; x=1795077134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPWFCZPMdbZsiAXaewX5I067c3oSdHkIBL8gHJXwb+4=;
        b=LlbJwqSKEEX9lVKTsnGMTeKhgcq24nHZDNr6JvsCOeyB0vcExZheamdpxl2uNVPY3n
         UsuO7QEXDopG/iJPacbd+CbUbiU4vOBK0PejSXCQvqbi2z1SCkXIcKipmBkX21tOrEAn
         MUY2gbmfw7j6TeiWbDu/6i4o9nGJjFEe7o4jhOjzSEaH9x1jimX7d5uVeerfJ3LjN9gT
         k+OIHk15fwP+U5jA2hnVAy2igAh4kYwLI3GhwFBF6cRidN3jA4RsjZUk0Xc3J83iqfMx
         1mOUtIejV4RCuMGtNsmdz8b/QKogjVejI+lok8GF1feku4Go+g0QrXszSDIxfhx3R1Ru
         Mp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472334; x=1795077134;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPWFCZPMdbZsiAXaewX5I067c3oSdHkIBL8gHJXwb+4=;
        b=SzdKgiR7JUcbhEvhlMr521Sagn+ZJREeTgA/snkkAnpj4aWSLrDD7/2isrDxEbR7lf
         vAe9nPJ3ejT4LcvE8JMrIKgldRd3qwnhqmLtkKzh8rHx/WowRZSwiAUKei869VAEpKHN
         dMHuSxQ9K9imHBKOsumvGMl0eLehQB5ZsVuKtPxM491qU+FMPuHJ1uPrsxkNsERmnmNA
         JrxuEsRvIGTMc1hcHUCNn7Ra8Jxsqis/XTxWINRTWWk/chVXUfTtWjOZkbL6O4b74rXq
         V/r6VOLeBO+jreExszjXgNOaufnL4yu7ZHzLhpawJPEzU7V5PfQN83zoinci03+wZC30
         pqiw==
X-Forwarded-Encrypted: i=1; AL+hErEvTxX8WuFsatbaEOtM6Xyq9u5JLSs0ulNWvDVeXUMPNXB43wBPWkPujkWV+7UtbW3SWPPsoj/uVapM7HA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j8CumWpTCpmJtpyJHiryZCcDLar+6n0fhqoTNfU41uuQJ/89Q
	YPxFdfd79GN3rGOHUOjMGJ7X5THr8algmSwM2BQNbOVxs4lsD4/WDYOS2GTIOL0uoewIcr17IJo
	mA1h7HqyWq9CWpAzti1GOEaNWIWeOX1Im3gOJycEg5mzkJTTkdbOe7g68auiXJ24eTLc=
X-Gm-Gg: AYBFou2ycLPkkga2ofmpviswZEYZjj5vvhd32cMifsdiTbKfSqblBWmaPeFg/xvS6oQ
	itizKRjRka84NYfmU9MOKr3xB1eVIwD+1ksOsUVd9aNWId70o79O4wtX3yKXswQYsXRvO/7lsav
	xWJfydy91ko35d3r1iDgTLU99dKi1W5uCcGUmzH30OUVALFckyPEKfyqqGdc1qFjP16GB6I1Yz1
	NBAoWUYh0ssaNLSC1kr5QpgXhoB0hdasQ1wHuiXg2Dui2yk3KEgPc8f3WE4eOjOBbdXgywLgCdr
	Iaz0Shn6yO50vju0CcVI833sVNuQyeQN5AtPRRHllwhEQGYGB1Pa3Virv37vvKixI/OIKrv38Xl
	L2uuTlvOOOUtMZbKntNRjr9UhgMYmMu8sdoZsjcASfrTwYBF1/AYfjYZNYRRgYdZB+e7l3s4PG2
	xr8BhgCaeuACMpUOqx2RsN4qCCh+HjdsaYZbPX2dVKfQbNyWOk4uUA8koKqfnEpA==
X-Received: by 2002:a05:6102:6495:20b0:7d6:2c4a:469 with SMTP id ada2fe7eead31-7d62c4a0557mr1170904137.33.1794472334456;
        Thu, 12 Nov 2026 00:32:14 -0800 (PST)
X-Received: by 2002:a05:6102:6495:20b0:7d6:2c4a:469 with SMTP id ada2fe7eead31-7d62c4a0557mr1170898137.33.1794472334012;
        Thu, 12 Nov 2026 00:32:14 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29d24dsm52998955e9.11.2026.11.12.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:32:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: shared: fix a race in shared desc release path
Date: Thu, 12 Nov 2026 09:32:10 +0100
Message-ID: <179447232869.4814.17727040416334916570.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-gpio-shared-refcnt-race-v2-1-8a0b76e01714@oss.qualcomm.com>
References: <20261110-gpio-shared-refcnt-race-v2-1-8a0b76e01714@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXyI/8EKFS7+Ay
 NlCxgU3zxz0o6LjtDIWrDtFcItiEpwcNjqW7O1sjbbwXLs39JxGcV9lKYjy+xmzLAx4uZ9rl6zJ
 /bQSdHrxmwkFgRExolk09d32NuMyGbw=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af5798f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZucQ2ySppxIqqdNBKgoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 10U7gyiGv89zRoV_VeBl8zqW2ttzwOaO
X-Proofpoint-ORIG-GUID: 10U7gyiGv89zRoV_VeBl8zqW2ttzwOaO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX0hp26j9DDbw9
 HyUi08R/5Hk5UhiF8J5C2auPqEhHhLApgx9de/KDSm7ZQsHdPX9fI2jOE9tQH4uakhHpU2ZR/IR
 STcMsmLgs6WCFc6970OmMMDv4h66356HdtRScMAkNTjIlkoJimqPizRX/3jsLnkd/4zEchHs8Lp
 Z5whvSORjhrlxofOnU2CMBggxeWzrpnf5++GvJMY/92ABbkPs3jwhMiih1KHAkMWTZrCdB2T3rr
 3RTLeYblUrwWDAoY4JxJc38zHXCUdDIQ7170nsOM162zuJTXs0mknZs1NV4vAmh8q0s2Ai37uB9
 rliLGpcGTVof/6ETtY23pp/pXV31K4gMcr5v7eH6X1+2GEJzFOegrxHsxvetWzuuYPzORMBTlRV
 KRY+Ko2iIRbNYJTMTjkGvJo8n3ejFF63dTbnv9KAxmmkHtpBLe7RDUHJvPHX0rWyTpfAakahxLB
 xxnjBcLm+PIjRlSX6GQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120033


On Tue, 10 Nov 2026 11:10:40 +0100, Bartosz Golaszewski wrote:
> gpiod_shared_put() races with concurrent calls to
> devm_gpiod_shared_get() like so:
> 
> CPU 0 (unbind / probe failure)      CPU 1 (concurrent proxy probe)
> ==============================      ==============================
> gpiod_shared_put()
>   kref_put(&entry->ref, ...)
>     refcount_dec_and_test() // -> 0
>                                     devm_gpiod_shared_get()
>                                       mutex_lock(&entry->lock);
>                                       if (entry->shared_desc) {
>                                         kref_get(&entry->ref); // on 0!
>                                         shared_desc = entry->shared_desc;
>                                       }
>                                       mutex_unlock(&entry->lock);
>     gpio_shared_release()
>       mutex_lock(&entry->lock);
>       kfree(shared_desc);
>       entry->shared_desc = NULL;
>       mutex_unlock(&entry->lock);
>                                       // uses freed shared_desc
> 
> [...]

Applied, thanks!

[1/1] gpio: shared: fix a race in shared desc release path
      https://git.kernel.org/brgl/c/53043b9e83cc7f4e30e70161b67ae93c4c9fdb87

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
