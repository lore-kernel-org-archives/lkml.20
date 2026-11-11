Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794386007;
	b=p392RGJ+OKAMxjfPWINRdUvDM0KRjnMfhyL1iIUq+JjZyO2KoJKrdiWhIUNWUjJP3F1f
	 I2AAHJbcZaD5i/TRLPXFFsm+tXucK3whlQ+HAto+OAJxy+4IluQ+54ZxVWobRbxbu65HS
	 YO7YlF02TK7mE58n3tbR6LwmciyYXcHrwVkBmhZtSwy/x4AA9sNskRSMJS/ORxMEFylGf
	 4HfplcjN+6EW72DSDg9EQvBD+27UVhp0aM9G6MEHngLKfoUWQUOMqQu2CCNvBvsN4GTz0
	 EUbRgZphsK7HiWI2Ht4o/LAMvvFyRVbOZkuf8YXO96+Jl1hFdO6tX/SKRnxdVGunAZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794386007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
	b=Fmr945AAPXVlRam6jvheuoZ4a+dj2viaXG6xMu8+YkaUHPtrAAMbq4rgslUH0Png/Ptn
	 G+h7sewRUNcAhQC3nTblCpkOUAXHdmWHhjFowUGLPR2aqV8op6R2f8axAGCsqfQnMwjBs
	 s+LpisWmB3g8TqyAGHI/4LywBSr2iFkzPmj8SwE82uoD8GPqNR33WiW/waxIfbVXH8WFg
	 YNs6tZyFGrrDYhvA/Irp3gBsQMfb4QBOzbT1WPFsvwaFcsCqmAQagnS9CmWCprIYukouM
	 y+TTMi/Vp+axsprF3VO0LEc832x1K0ot3ozQCCelzIRSZZgslmzU8Y3Hohwf6Ra/O4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ExzrXnKW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LumO8tFy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEB0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CEB0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ExzrXnKW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LumO8tFy
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KKNA2017368
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=; b=ExzrXnKWCIJuRBYW
	adlPonufNKzumfWmayEMC2ytP0DcBjWY22YFKn4YbEymsgJmsfGf64Z/I99EVESM
	Iwwh2NEDAYO1fknxf3wpxObrSHiaPMgb0dFAejfkLOjJozEtfs0tP/Roz1hQmT+X
	KNtOXCwzMXVzmymZPX2+ldNXcDr4IbSK4YAKqiMlVRRBBPYuSJ/b9Onbg0VyWEkZ
	5noTWZOHi925H8YZ6P2Y99oaUphEDMhKHnGufPJahXIykXXB56H5oUiV1Y0Ubc8U
	BMh//eVhierB+74JJRmF2uhNuS3jwvlB+rKcX39D23/HSmhcuTBivBjo2pZVUIOu
	jAFQ1w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97caryw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:33:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so5218985eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794386005; x=1794990805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
        b=LumO8tFyNpgZ8WmIxaPO4OMDIu0tC/OKETcHi48LvuoTCqPGQwNB9CGq0oMq90SP+9
         k2yEcYpmBd3COz+n72MRc/puVC70IhmgIJ1AIWMYXjlcBAP7Pb6NjvgdGzbxPIPDgyqf
         bC7zsSRebGiHdxAqtRmJboMaXW5TZvCHoN19knYtib3XAElz2KGCl+bdpfNtMduf9gC7
         RRKf5sxYEq1sEiFeA9j/ZjJoSQOpmzFpnxPq2iWZPqam9HxRDNW+ak8zsRM8aTI53lV4
         48ke54AFgaa3mbljvrZDNNgaftlwmyru5jQSq2uAiCUFOFvrdY2wvJmHCM0czUmkKjYK
         rtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794386005; x=1794990805;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrBeNlBN5IOvDDr8G0t3/VlYmzMM0aOEx9XgntSJ1GA=;
        b=YexRNwtmOK3tk0LPxJfOaLCVOnssXyUEoU8byo6oZ2QMO87wCPrjDgXZfeM4Jf+fyE
         mgDgsRZGWAm+BkGpknCQZnpLMJmyhQjEG/uWWAb4Oj91InB05MhIIdnNE+pJ0ctwJdxx
         f7K0pFeYVzHO4r0RAz4WJD6Z8F7oXsI9h5QCjTSiD1mjMsMoNLV5AV4AHOAZcXghsv1D
         UOc9XxJYHowfERDI2HnvkM42Ltco4gIxgcqJ1brvG+fd823Tyca5mHrb2gysu4rHiIII
         vaJg4CKcKn+RZGg/MzdmnLmJ+mdC+h3I+AtNDV69xBnOXDNqw4zqcdmFD2ooTB0tLZN2
         Ap9A==
X-Forwarded-Encrypted: i=1; AL+hErHCTgIJ3B6niMPT+W/lTF2NOGOQovtUHRfoT9xoOErZCmRusQUQW9QWKQgWnaMOxpHtmTYBTdx6DXSvZ9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8T/EancKVnKjVo8CISPuCVybhADxU5V66ofJ84s2WpQloj4IR2
	tRPAn0wHwOK8nvOS8jBVWcyWejvM+5dx2Ra7qHDBFf+36v8O+6jqZGO7HqUZWB9w33l9obtQVGb
	e8pYFNpack0CQDhLmMzrzQPiZk6GhKZH7t4Bex90rqFzWtXBZLnQXVYctTSgu93TZeHE=
X-Gm-Gg: AYBFou2U4apo9+WZnWL2WtPIr7rZ57OSy4YkXeUPkYzO1goSZYXgPFsBOvc/IhVI+ux
	hTYmzcXSbylpNhbu9Ahll9+fQYUI/QLQXJXVNKpBlM0CDvuO3rIf/dguuIW79sDe8PKFuhD9EXC
	L5M/AB7ni70PAuF0htKKKFsz5eM8EifBPFBM5GXEN16Z6AoZYt2ZXXb3hqqirVAVAYz/fphMQM9
	Q4v8ElmNHw3OeiRD3yIU/dmSmwBHnEtaCGWsz5yVnSlFts0yLnbGI5qH7BgNPqUgzYrSWVQ5N5r
	H8w/fZLS4g1LiSjsHZhTRrY1z4L9pAKDBR3ESqAJA/UWIJaQy8TuuCOtE/BUdOOvt7OpsSQRV6r
	JV4Oh9YU+4yKJ4xTlZEwqJD6b52j+6FZJO9JToceokV1A3bWKiZTJ51HqgmySiVHQkBghazFvSl
	XcvQ==
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr2455974eec.5.1794386004936;
        Wed, 11 Nov 2026 00:33:24 -0800 (PST)
X-Received: by 2002:a05:693c:2a17:b0:36d:a465:b38e with SMTP id 5a478bee46e88-3768395f032mr2455945eec.5.1794386004375;
        Wed, 11 Nov 2026 00:33:24 -0800 (PST)
Received: from [10.219.57.104] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm26864637eec.29.2026.11.11.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 00:33:23 -0800 (PST)
Message-ID: <811819ae-ebff-49e2-be25-134b58711a5f@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 14:03:13 +0530
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
Subject: Re: [PATCH v4 02/25] accel/qda: Add initial QDA DRM accelerator
 driver
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
 <20261102-v4-v4-2-88f2f24a5f0b@qti.qualcomm.com>
 <c4f7b153-feb3-472f-b13c-c7fb0a46f9b6@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <c4f7b153-feb3-472f-b13c-c7fb0a46f9b6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfX6Pj41N839ZtH
 4VWkqyZX3BVV7d0fbqbZvZjelX0nRXXor4ew/n6POSCzmyySODP0uBQXN6I5w9qSfIJSprVh3gz
 JvjeYqtSr43hC3a95kyMuWo5h6IUebcS8RXxDaWbGk7a1cA+XJ4EJkUpTgcBZyBXBPUmV0o3/wc
 RYQ/8il6xM7VG5hOAwY92rQO/Jk6EVd+Uie3f0MRSXMabYPiQ9y+e7m+rL+YMwTxJTv1NRGW1uq
 OlTzaLOvBeQD61iuxykPt+x4lZMpy9B5bWE8iP3jU+Ke7lK1LXw/qS6flAIT+WhpIgAVKOh4KLY
 wsI25SISXYd0riD5Enup0DRBH6ow38wHz+4Mp4gJiVQYALkyJfLKZhT8lXF9IOcYExG8gSOmaYL
 LwYS5ciTSQ17p3/pW3EUyhZfnPk/9qLHVMC4pWHYD5csR+8awTMLSBZT1/CoiM6noe8Rfy4eQmm
 tSKZW91g0BtUDqTKBYw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af42856 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=3RgQX8W33KRH0BhMXdoA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: xX4f_WibJidobIRw4GJijwDHz8fijnHi
X-Proofpoint-ORIG-GUID: xX4f_WibJidobIRw4GJijwDHz8fijnHi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMyBTYWx0ZWRfX8Q6ZxOe0y+Jb
 j8i8jNVINOBOAJraem2KQoGmFnJRcFqJ+dkxaySRFmRSLVFJ54QkxTMihDd8BzDQj4jLSlNO/DF
 6KghlVimiz6+zzaLCitI57t4aYBccuk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110033

On 02-11-2026 14:12, Krzysztof Kozlowski wrote:
> On 01/11/2026 23:21, Ekansh Gupta wrote:
>> +
>> +#include "qda_drv.h"
>> +
>> +/*
>> + * Both compatibles the binding defines are matched here. The glymur, hawi,
>> + * maili and nord nodes name "qcom,kaanapali-fastrpc" as their fallback
>> + * compatible and so are matched by that entry. Per-SoC DSP parameters are
>> + * attached as match data by a later patch, once there is something that
> 
> So you add empty or non-working code. No, add these once you actually
> have complete and working table.
agreed, will add this once there is a complete table.

> 
>> + * consumes them.
>> + */
> 
> Drop comment, redundant. Referencing future patches makes no sense in
> source code, because there is no "patch" when looking at the code.
ack.

> 
>> +static const struct of_device_id qda_rpmsg_of_match[] = {
>> +	{ .compatible = "qcom,kaanapali-fastrpc" },
>> +	{ .compatible = "qcom,fastrpc" },
>> +	{ }
> 
> 
> 
> 
> Best regards,
> Krzysztof

