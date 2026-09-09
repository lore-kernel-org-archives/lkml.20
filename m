Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9684347F79E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940956; cv=none; b=HDcn1+ZS4qi6d7WHA25p4pcS47D2xBgdSjeevOY8AdFf9ZNptHYtdYMkqCiIsF37LJY7exfUnWBfx9CO7H2euSHP1Gs2JPi1IJwhv8heMNze/njtZtFD3yN0BPNi5elrSYfzkwe5oBUxeO56KxU5VFicX97GKj2T/MDQEcsEIOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940956; c=relaxed/simple;
	bh=zDuQWKjFE3DA1NY7qbs8j9W49XMYV2fstg2LLl0QS1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bqOjhephXyVs9DirhYeOMKwnIydvtrwJMXAij/G5OH18jLuvUQr7nMm47k4qxo8DB+cGW8tWtBjKn3tDVK/Q1Stm60/YaOfo6h1oQlUtfuEF5rzoZ8f7SoGK3nD6CaHdmu2tE7rrtHYhxB379Z3r1HFgk+WIsrsOjXCXK4rUxOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHYMzPk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C8NLs97p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHYMzPk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C8NLs97p"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896XcDs1274451
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 08:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSMHZUD2b2UJe3yPgP/kY+F7XMMhsGVvoGqYP6DBmQ4=; b=PHYMzPk6+E474nh3
	z524YrgoQy4kEv7pHq1xxG4rAulORuiyo9L3UgMBT+OZtyExRTBfPC4xfnQ08uES
	iDOKWmz6W7//m9Lg+K4aEbKAyXB8TmZRRHTTBUsyn6eKR/OEaHcASA/A4B6AtWxO
	KrCMVrNk0H7p864zRSVJDm9HRNF21hZ7piVivW4J82MeAVj0IKnt0z3WhKG++8n+
	vhiUtWWtpa7P71MrSCUKCdFSBc5RE7/Pt8hzDT3VuPbWWJ+Qz+8SQwWDak9yh7eM
	XQe9ABJvPVPOZ7wt1dcGj/WXzPldVlxK1JfnlvOUZ6YhdB7eQ3ADI/rl4EhP3DDH
	+XcvDg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw30te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:02:33 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9829a8b46a7so11635241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 01:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788940952; x=1789545752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSMHZUD2b2UJe3yPgP/kY+F7XMMhsGVvoGqYP6DBmQ4=;
        b=C8NLs97pxWhGMyNPoa4IH42qArUhStDOinMklnDUnHZ0r5BoJqPSWjF5WWEeNjdGHb
         EXXv19dIyrZE3i8yuIbzGtMwqOOPP5Kr5U+V15w/6y2yg932iHueEsFx/B1DQ22iMlwQ
         i/i73PbxpYVyai+BnRswSAwdE+eKNC1nhDXR3fA8Hs2Kv2CHjVXRi7BvJTXtWI1LxNMo
         KA50XGUwaEhBV+YFdIGU8RhxpnY8p3sMyu/vdwwlNJ1eWRw++fFeFDi9G25DyE2N4omM
         cxtu+ME7BK8/FguGU3HzOw8Ww5lhJRUafDWBAqJ3iBDvygiEuxUUOoDFSJcf/fkbQyiq
         Rj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788940952; x=1789545752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSMHZUD2b2UJe3yPgP/kY+F7XMMhsGVvoGqYP6DBmQ4=;
        b=K4YSmmSIQTXm55UegiiB1KRw5aXXNBWnP4UPrgCVME4uInenEefdtSfyTM8vgcmjvF
         c+X2QQMzXFtf3VrVwwKL7HF4SrVOXx8+ZwMjH0/BR2mf0uwIqA1rBJAjd4KIQqLyyVqO
         aCNNx+3WBZrPU4SOkZR95H/rPdMUuq3xB9ohZ2ZnnSmvCf3ZtiJIV53kvC+eUxp7mWei
         wS/CnKJ5cTYdjMAVFToLIdTKOMyh9n/gI/hCGZpVjrDTs0zIsxktS0ggcnO0oEa3ZLSC
         24eNWrgv+FSHbee5hPMOUG20zvG8un2LOJBS7r1CHh98h91RSK4kxbt6pceaaoBYrdht
         GThQ==
X-Forwarded-Encrypted: i=1; AKwUvBxa0h2teQ5Z242BF/oruaPgFDGiHZlpaA+fF5+c21/M6c9J20hrnbXPfoHeku2PP7VVHrW3fkLrO5vwYso=@vger.kernel.org
X-Gm-Message-State: AFuF++k0wzR6MYYt4Z05UBRlJFfybajYzqJT4rxuTUjvqvlsmdYy2zWv
	khH6iTU4oyPbQZjOqpkXdtqeMu32raGIbInNyqdd1zOdkIMvDvTO++1p/c9URRZ+WjfzmZdyV+w
	26k2OEkzxsDQizK5YpzYrAaRF9PQ4niuf9hJ/x4jKm15mNpp3v0HQgcZj7DbRWxz4WFs=
X-Gm-Gg: AYBFou0WpVh+pCLwbA6SeE7N5ypIyoFY9yxHGSqAjcag+V9EE4kBy4MhjbT8cKQxWE2
	n4Go3SK2dEDvpxRxilsf24zERMyWXUDdEz9oU+BjlZzxtGMJn2yiGFPEQHC/C4Rw1CMKXRuFF36
	lOIAgeJ+5w8Au0dfp39MV3vcuiLbYO+Z+xicve4sMdYGaCEXGoQhLQOvMA8L6Tau3nHGpGiq1jd
	czDXHc2d2odYhSsdtG1P7IolfJi2rpkKSMfnXE/5BE1Rh3mdax2woKpp2ck0txGkvB+J/kg9j5o
	YpQjjYHelwmZR9TFs8bZfnYrLqTn0gHvZ1yTDy2McJ4socr4Z2En5Znh3B3TTK6eRNb1okmdQ3u
	43ZCXA8roO/BjEdemQyo0klqhM2c=
X-Received: by 2002:a05:6102:a218:10b0:78f:f234:75b9 with SMTP id ada2fe7eead31-78ff234864emr445490137.0.1788940952039;
        Wed, 09 Sep 2026 01:02:32 -0700 (PDT)
X-Received: by 2002:a05:6102:a218:10b0:78f:f234:75b9 with SMTP id ada2fe7eead31-78ff234864emr445466137.0.1788940951571;
        Wed, 09 Sep 2026 01:02:31 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c260d5277e6sm707351266b.27.2026.09.09.01.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 01:02:30 -0700 (PDT)
Message-ID: <c447c7ef-828c-4fda-8e82-6983a3d0eddc@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 09:02:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: rob.clark@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
References: <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
 <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
 <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
 <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
 <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
 <23e31249-cce2-421e-88f7-1a2af66e34b6@oss.qualcomm.com>
 <aqCKgM1yCbWjFdgO@baldur>
 <09f62d84-18ad-4d7a-ad18-9abccfd5e508@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <09f62d84-18ad-4d7a-ad18-9abccfd5e508@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: D8qihhbFcsIa9KugKOoG3KazGsF3Pere
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA4OSBTYWx0ZWRfX5el9KmTUCaBm
 K52DSKTLnbzBc5ilwCyOWvkgsVOJGZ/2xVPYJEjiCR/XbRMEX7An2LXSC/2cjNer8G9XcH6aVgP
 BDjF1Egt6xp8JSeg5PnqxCbxb4qsIRk=
X-Proofpoint-GUID: D8qihhbFcsIa9KugKOoG3KazGsF3Pere
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa11299 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=RSJrEcLJ-t34lzZDKPUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA4OSBTYWx0ZWRfX+JiOonLYnLtF
 0RnTU/9jTzRbbU8N4MmFwwGB/9K6wJ8FqzgzXbjstNeYCWVOA3eW3pwJ+EFKWVk6mKBIY8PQ2FE
 NDxRiSa6499CUOgNv5kXo3v/w/ZXg3RqgQSDhmyuTWIKaYwA/R5hSPG2DKlnZ+EWMte+nDumGsF
 dmVJ06ddSUP3cGO0qBNqufCXXxJIklYM6a+zU5pyEzTxgHgsRzdsCA4biKKb3/CnL4K0BTvxHqE
 IkOyXG1oeRBvapvX8JPnSPVqnjHiD/v3zvuG3pXhswADXroja9kwv+LZ40ivORrV4c58JZ12vU0
 e56xfRh7/LaoM1F1XAHvCePjsqoSzORGkxKGonwZmDoBA+Fty3ODdNrBq7sFlovCPFc1kMd1gsR
 QVzkrdUNtv0MIGpaXmJzHmIVOG3mrIyE0lpwvfS96eMSQ7Sr5tnTryPqOKfXPpMQLoey/gL62Ei
 +yoJRQGJ/4lpjfasvdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090089

On 9/9/26 8:53 AM, Ekansh Gupta wrote:
>> This is the actual problem!
>>
>> We have existing user space that depends on the ioctl interface exposed
>> by the current misc driver. You must not break these.
>>
>> Hardware cutoff is not a viable solution, because that's just a
>> declaration that we'll let the old platforms rotten - or alternatively
>> you commit to maintain two drivers to the very same feature and quality
>> level.
>>
>> So the only reasonable solution is #2; from there it's a valid question
>> if you reach that point my stepwise migrating the current misc driver
>> that solution, or if you present a new driver with the fully backwards
>> compatible interface, alongside the new ABI.
>>
>>
>> But this does bring to a question which the cover letter should explain
>> - but doesn't: what problem does this patch series actually solve?
>>
>> Regards,
>> Bjorn
> Agreed. I'll target #2: QDA implementing the existing fastrpc UABI
> alongside the new one, rather than a driver split by platform.
> 
> On how to get there: the blocker we hit in v1 was that legacy fastrpc
> buffer semantics appeared to need a drm_file, and there's no exported
> way to construct one outside the DRM core. I want to re-examine that
> constraint rather than treat it as final, since the legacy interface's
> own buffer model (a dma_buf fd as the buffer identity, no GEM
> involved) is not inherently tied to drm_file, that's how the existing
> misc driver implements it today. I don't have a concrete design yet
> and would rather work through it here than commit to one prematurely.
> If anyone has thoughts on how the legacy UABI could be served without
> requiring a drm_file per session or if I can somehow bind drm_file with
> chardev by exposing some APIs from DRM core, I'd welcome them.
> 
> On the cover letter: fair point, and I'll fix it. The problem this
> series solves is that a miscdevice interface requires us to hand-roll
> what the accel/DRM subsystem already provides as common
> infrastructure: GEM for buffer lifecycle and reference counting,
> PRIME for cross-driver import/export, per-file (per-open) context and
> handle-namespace isolation, and the existing debug and lifecycle
> tooling the DRM core already ships. Every accelerator driver added to
> drivers/accel (habanalabs, ivpu, qaic, rocket) has taken this path for
> the same reason, rather than each maintaining its own equivalent
> inside drivers/misc. Building QDA directly on this shared
> infrastructure, instead of extending fastrpc's own ad hoc buffer and
> session tracking to cover the same ground, avoids that duplication
Am sure you must have already tried this, but Can you not migrate
existing fastrpc driver to this shared infrastructure under the hood?

Can you elaborate on what are the blockers you hit in doing so?

This will ensure that UAPI is retained and still get benefit of QDA.

--srini
> going forward.

