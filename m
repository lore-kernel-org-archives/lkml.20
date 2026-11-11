Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386107;
	b=jcardHAsJ8krMoVyO0Bef3aaBBuAHR+LC/qsX2D/fXTJ0Bl3V1zaFXlIqQqWgVnICbQy
	 9a+vs0S7eMGhE3RXMphpXNPgeGJUuOPrmlTLnUqe5l6RViUG8er4S6AlbQKdXLQa9vSuy
	 32Gzb7yA7WYYFuJvS3XmK/RJ5pqAFtThAV3FWUz6ZDYOzx63XeGU4yWwXOkw68ZpFnjDu
	 iGmlHI9MNlXahumPUgf6Z/1ImOrR/iDhMyWviAxE+RdQGTu/aWf4UXcM6k4W3a89Pw6Dq
	 Mp/S72G4zRULy4F5FD+LO8PFFpwe+tSc+Msn5wXJU5N52yKQg0Z6MPus6JzREPyBYnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386107;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
	b=TmaC8sRxQdE0tTL2VjFgpDmjw1+cB82jbnuZUFKL8qLFSjMxc3FHXz/fUKNyraBuEO7l
	 UhwSSPc+NtbAi9Syyt3T1YFZDLuwVNoubt678TNaVwT4u/X6gR+q+dGFoAI+Dhopk/7zz
	 rrQWi0FBOUJdWFww2bYEvxQvtgkA+8eIvS1qq1fCVXwXVY1yQMGvRYzwdcrFCHHRorrj5
	 f0FKrNnlXIYaescaWPl/6i6Fl9PrH7JXDkvKuC8ptQji7z5qtAs2TqZG2q6w7B9XnYSdT
	 kKWUlnouKnugFZpSMlfjzC7waqx0g7B4FE0HMII9lPPC04zigzAGqobx+Ej6mh/fFhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3MTb9Y+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjdZC0l8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF812606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF812606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G3MTb9Y+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjdZC0l8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KEd0863494
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=; b=G3MTb9Y+8weOGt9Y
	0+2hSI46Wr9+Kwaj1870IOXSx1KuhQOGseWxevW0WyhgVw8JBLUG2173hWJj4OEW
	SHDGiOZsFx65l1TAU4ZmhIjNGzBFh68P8mW2IaUPqq4ZA7jdV8tVgdjZwEjw7e6i
	7riyufEhiwVMl2YbnQkGk2peswmp8dJtiOkc2ohko8HhjjZMSwMhSThbEFgvdPxC
	kWJTzxN0DUJ7vwdeerFRkDPPFpayGrBrunj6h30UpPUfay7A6PzJy4NYhC3bubv+
	D8uvY9d2+8itGgJXtEs2+RwMd6H/ZDeQJyPcClfnRuiNelMcSB5K8mnmDZZWIAZ1
	A2vm/A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawh9d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:35:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3925888eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386105; x=1794990905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
        b=ZjdZC0l8oV+sMnH0NSJcrkNuJQVoBfua7bNYTbzZwFz2tjDbhIxUrFCBZoixGFzVhp
         /9mFjptd8QeOxNqSc3AyyrzXePt34abTWh0ZdRWDl3V1KwPquP0lLwH+anVIEL+PiUbx
         gyMFVzoMHHFMTBpWqMFplu3Ao7YnWZXiHnb7PUaYqAaOpIyAJQ/bChRkugTeSY/PqqkP
         V/YHVFwKLuE7dJEK3PFLX4MBM6ktzY7Nh6hYXdATr7Py80qv1iBfljQoUWUJKzEzdlT2
         1JTtiSMReW56PgkDo5uAADv777jSmzdQd6kBPcbXI4yIdJeexewW3gzCRVnLnsrSr1sJ
         ipWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386105; x=1794990905;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AtNonFM71vbXHQV7j3ip4nyJfhO59wdnq4MfPfi1bI=;
        b=p+/gnJwwEcuemT/bUFBiQQiqgJqKWy3GoEumSr5YBvUcddD0ClrnEwcXNBqXPuNuWq
         go44T2q9G/8M0GyotPYhBUdPxkKrALDcgfDgMqaF9NxQJyE4WJ7dUToqJL9JA+2jaCXT
         Jrv+wCuxVPW4auh5nMfmAbakZG/4/8HJnPuXMzP4eFnMH8WG0+cmjVIaC2HQC4YWhd4a
         DEO3kWq8k5RDEsEqE+1exF9rs/ENel+U+oFIuUJsFWAX6aibKKFWxO1R1OyWTno2TGYq
         q/4e8Obtq3WQFD/o7LsGUvAkmXoQQ636dpQJl3LgFceMcn/GncMSja+coIESEzoiv4o3
         lVBA==
X-Forwarded-Encrypted: i=1; AL+hErHo8izpcv2bIqvx4/M+2YYTu+R493pN7D5UdhnIqIn4ggyjAlEN7ITlWykCKwG4PcWn87+4xBSzjEbD0fM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ap3QUScxNa5/gtC+Q+ECZ4jm2LqLn5LZ/MW19pp/j9ibc1ma
	lQpknPFU7bZwT8BCAPaFcxkfW34Vx21Xb+6FNnmyHi7/aywKX/aWmUCoET8qRYxkwM9gAAoRd3+
	Wxk3bMvQaAJ8bgzeams+IfmtsPNQiZf0A7v2CirGDgcr9Fu3Wz6I7q2CJ05YCAs3Z9as=
X-Gm-Gg: AYBFou0talzu3DE5ExJHVfyc3Idxkg3qnw78+L3lq2oxbShmw0v4MwUdDANqnDq1Y1x
	+5uXVs3em/wsLnRx6X0sfTEcSMTwdQGZLjWTw2QYPN76CTnsRqsRYn+YWZSyHmfUfxqyeZ5ug3b
	FDYmUN5K2T3b5kLDKuuHpOpmzJ3lFJ8nS3vjUMMGbCH6G9tDCYa7xrimeKNfZqTEhX1Wi87FsIg
	OMDYpewbHDwrV+RGMThDvnrWQkQFou0adcl3Twd58N80M22O0xfmfHXt6WC6R/2pciGiIR0p/Bx
	B45bdoIVrpRQpdnNsUbUIAQ1rLTPZzND8g+SUwNgRvFD9U2DorNPephs7b+oAZL06tqNJXLdjJJ
	5omLufuVGfA6Rg8H9RnETg5rrHY2dNOUYJXtrK5voJLAzAEL4pLPBz9qdms0ps3nl91y+i7hwO8
	iOn5g=
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr3633524eec.10.1794386104852;
        Wed, 11 Nov 2026 00:35:04 -0800 (PST)
X-Received: by 2002:a05:7301:5f01:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37685b80487mr3633472eec.10.1794386104118;
        Wed, 11 Nov 2026 00:35:04 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e7d24sm21766474eec.22.2026.11.11.00.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:35:03 -0800 (PST)
Message-ID: <0f24911e-83e6-4de7-9af9-3c1bd3e143d9@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:04:52 +0530
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
Subject: Re: [PATCH v4 03/25] accel/qda: Add compute context bank devices
To: Krzysztof Kozlowski <krzk@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Srinivas Kandagatla
 <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, rob.clark@oss.qualcomm.com, jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-3-88f2f24a5f0b@qti.qualcomm.com>
 <492ed183-9495-401e-b678-e91a324f5a64@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <492ed183-9495-401e-b678-e91a324f5a64@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX2TFIIU9G08lC
 AVmvQbOhLbLPyJCNuC/Ufa3v0GWZ4gYz5YLV+v0qK2YmpyjmYrs5YatuOBrMrs1hW0ffz600VRC
 L/kv80m423WptjcMBim4K+gPp2oGAQ8=
X-Proofpoint-ORIG-GUID: fUolp5q6RaRlsRtacATuAywWgSwzgjy7
X-Proofpoint-GUID: fUolp5q6RaRlsRtacATuAywWgSwzgjy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNCBTYWx0ZWRfX+wPLusIfwUSA
 B0SS8WvjGaXgGgFcDig1VNVh33Bn447gOmn6rM5sayR4auIC1sTeQlU5ElYQxz1yEsIDPiqUEkX
 lOf+UAgRBQFaAyCT7Q/6fjmtNTsDzRt/+raLt9z99jHRMJKFuKClVgEpTcyN3mIf76eII+huSOA
 RyR+MCGAdp/4MLKydA7ZTI2R0vCo1AaBsMq5pleRA4wGhIvzVuy3aQgBPC+RkkvY/dS6qlwCR9R
 PO8nnebk9z76MiMpK45ReUm4fZejDj9/ox78Cpy5C7MVS9IZL9J+WNlLFvgFiCiGKtM1dW1054K
 ORr/UKNRsVZuHnxBz/XCW08OHhdhrT5hzNHkEVgCWg1gKMzZrbIcXOmdQzc7K4GJoTaR3CSRDm9
 rdjEMyoKCyV25zf/cBprxKrC0cjcpM7KaR0kP/fy4oQbT+UpeYkbbpTAmVp+x/If12fT5nW/r79
 j3LjUuTqBDE0pkWBQDA==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af428ba cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_YfdpRd3OS4PFdmd1n4A:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110034

On 02-11-2026 14:13, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> diff --git a/drivers/accel/qda/qda_rpmsg.c b/drivers/accel/qda/qda_rpmsg.c
>> index 6bd977e8d68a..78b5f31974c1 100644
>> --- a/drivers/accel/qda/qda_rpmsg.c
>> +++ b/drivers/accel/qda/qda_rpmsg.c
>> @@ -5,18 +5,18 @@
>>  #include <linux/rpmsg.h>
>>  #include <drm/drm_print.h>
>>  
>> +#include "qda_cb.h"
>>  #include "qda_drv.h"
>> +#include "qda_soc.h"
>>  
>>  /*
>>   * Both compatibles the binding defines are matched here. The glymur, hawi,
>>   * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
>> - * compatible and so are matched by that entry. Per-SoC DSP parameters are
>> - * attached as match data by a later patch, once there is something that
>> - * consumes them.
> 
> You just added this in previous commit. Why adding invalid
> documentation, which is immediately removed?
I'll fix this in the next spin.

> 
>> + * compatible and so are matched by that entry.
> 
> 
> 
> Best regards,
> Krzysztof

