Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D6A4A485B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188344; cv=none; b=rvM79HelWJ3cbM+kpw8wesQTk8yag8U6804TsvJx0cNofuBwncFf2znQtNgynB/t3t2XVigoAzQukhyiyGzOQ2HgnEVsPDDTGP0/qOIaODjenzerrMnJrC1vhw8jjNXkUyRSx/T1XVmlvDDH8ta2jhnU9sMn/Ss+dccAguZYPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188344; c=relaxed/simple;
	bh=z9waBFUZgrkQrg9/ZL7GFeUE/M+cVpy4tNRnzbvmabk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtxsOuIo3B/ObdZYiIOuQjt6fuOPxsFOGdsEpu6dJPuHoDqxiU3BzZvn3Yoa73y4ylOBhUFYEWxJZJHHS8kWozKJc6WB6qkPjhDBlZnbKeayNxHlAejAhtGcpgOGE3TRHX9rrnHwT85fJO4nyVxxCrRZWU6k2fkucqB7adJzLpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RNo5dLP3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jpp8+hF1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RNo5dLP3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jpp8+hF1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETL1p358413
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wg0JqqCSPSCZp/i8yYOWVkckv8WI7h3iPOxiOF8q4I4=; b=RNo5dLP3hOIk5Y67
	DuUCFYBfTeqD8IVSbibfex3eUWG3dGAVZkRRpZZB5RVRVwOaOx64pzGEmQtz7NXV
	ofsMDmGyE2+LY2AcMpTj/lGd2AljYUtRZGAiaMe3o8x/mtOPD1h5pIVYSXqlNAys
	UjlcUOHxNQomCcwKgPs22A1DqUTWJPS45w0urJKogvFWlTByo7p2FicOtEPQ+m/t
	XNmAZ9/We57PY+82jgilhZ7fOF7iJP5ca/CRwamMA2/qWajw0ctl93ETxhCOo6tG
	5P0vjmYqvgD70FqJvEJbI2Br4u9uut+NbNDSKUMCwxj6hrbzmI8sOiys06glGRJj
	vhVqjg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4x09xj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:59:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so72067125ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188341; x=1788793141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg0JqqCSPSCZp/i8yYOWVkckv8WI7h3iPOxiOF8q4I4=;
        b=Jpp8+hF1lyNXFu8iIaWFGyBnQyrrUY1jm7uaZugO6L3KYBldJPv2Wiz+IxXgRlmArg
         hr1sw128jWoV6t/jyO/SM4qzEU1Ib3JUCAtk9gOVPsGNh324ynjpSfUFy6VpV0fmK9yn
         up1AQDYNH6NiYVwpieqOjK0OYUJWKT5UYVnVIOupK/riR4KwXT6+2tqmGtUn+rkXdSJo
         or5ZuOgcWzJA8sk2ZPUX9BRp5o6Iej2V1IT4PYjIhfFxLKmbOdWTHnztlhWeKhSk4ltO
         YX8GKyGbHj7C617SYg8esxPOGhlMC95iEsxiNdKfBWcfG56GFGAqdljRt2eYJv4B3NYJ
         EsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188341; x=1788793141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wg0JqqCSPSCZp/i8yYOWVkckv8WI7h3iPOxiOF8q4I4=;
        b=e8C2oplBs7SaowxVrXdRirU5zhpRyBJhOMC8jHNvsg91PrB/xAEfXIt8og52Rw6PgW
         yisDwkAO/qCNHSL58VOuaNSt5NI8Qw1j+N6wb1bUpWRxsn69zTw+8VNdNu+Jbv3hH8rh
         vmCD7pav5FVSWmP36D0BoqLtMa9Vhb4+UtVFUUUoJnxylTPLYcav0c8IABxFMx907H61
         mMcXfYRgW1eV98Y55y1a0TGpiwmvxq63cPIkZYTq+IKRikrpPuwRqxoiOpwwrVPVcNlQ
         27u1pHTTCXCWp+i9faczABqVP+KiGJhgBY78+kOL99tvWgnteotMp7nol8+4yqUnycPX
         I6XQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv+WTOLsToHFdwaJDrTaVqqQcJjGv+lWnDAeUbEZtQN1Zlmyvkrgrc1/oJ2DTVzHqpOetBTzVzCK9UUkE=@vger.kernel.org
X-Gm-Message-State: AFuF++lm4DzajkjdMSPZFbP1NG78BGLV7DTeXwzMlwxp0Rwi44OG8V51
	7O2+PDLAUXICrWG4MWkXcp0Qhf4tfm1STw8ABhTQV+yyj3F5R69erIYHt/OqSLWfFMAmyuAiPrA
	YxXNXRXGAWqalkjHXx17BVO3jn+daI9kZdBJUj7CQV80TEmbDGKJurX3TCEG0vlZtM20=
X-Gm-Gg: AYBFou34R3C29CwrK5Zk3Fa6dzCJ9kCUoyx4jsqiPpjiXfQvA55QPTPUHdoaNizVknn
	XB8VIUayQQPJYKzXheCI/p7WY0utFtR5E+P+WEejhlYFKKR5z0QH55rpenXwT1BzbNLEkiB203a
	XzbuApkqzjWZIpsRHYVeX6JbFRgUtvDYRoOkDBUzaGISP8IGdKejB/2yWPG7tmon/p9X0ZsPIoP
	Ua+1Qgel47KMUXY9w41FvexPmO4ZUn8gPg18Uo7sSV5YL4ztlkTB73gmsVWinqB5v7jAPoxDjJs
	YuYI9tyAKzzD3O317LIgeqzr8LF9c5wQHZKg1cYDRKyBPt2NAbTDQ9u6vsf8CBHmxDgMCuJEYTq
	gFHy9Q1v2C1+F6+sRrhUR7YiVnUpxgg==
X-Received: by 2002:a17:903:3845:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2d94a8d4c2fmr16521555ad.12.1788188340999;
        Mon, 31 Aug 2026 07:59:00 -0700 (PDT)
X-Received: by 2002:a17:903:3845:b0:2cf:4339:aaa with SMTP id d9443c01a7336-2d94a8d4c2fmr16518755ad.12.1788188338939;
        Mon, 31 Aug 2026 07:58:58 -0700 (PDT)
Received: from [192.168.1.9] ([171.61.213.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm35296218eec.7.2026.08.31.07.58.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 07:58:58 -0700 (PDT)
Message-ID: <c806d7c5-98f8-4b0b-9d00-969e1917a8e4@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 20:28:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] accel/qda: Add initial QDA DRM accelerator
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
        srinivas.kandagatla@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-3-69a02e9090d4@oss.qualcomm.com>
 <81708487-89ce-4cd5-b39a-2989bdce6088@kernel.org>
 <3476b5c3-7983-4994-a901-3d7d8bd75255@oss.qualcomm.com>
 <4ef74e14-8433-4619-ac97-62868c8799d1@kernel.org>
 <g5orcvzjbwww27vwcsxl3ehrek6lvznxptd7jutifoiuicjnm6@iqq2pus6omsl>
 <a642833b-f22a-4bea-8a20-0debc47e1895@kernel.org>
 <4xcyqqrqbvgxojfcmnpwbi2uqk5tvhts52l6sxetltcgb7mo75@lfsgfoq4npz3>
 <59aa182d-1b4c-4bdc-a1d5-e76cc9c88ed9@kernel.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <59aa182d-1b4c-4bdc-a1d5-e76cc9c88ed9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX08WnoGwJOvuO
 scNgxyAW9JwU0vhsMN/+fGkm8UZv4202V/rb8Bt3hSGioC8LNjLpUU/nwz0lur2LFq/YRGspgh3
 HpztdMODllxsTZo/dfn6Fgzdif0C6Yg=
X-Proofpoint-ORIG-GUID: Kvv_CFnl8PASujJPp0i7fQkNt4I5jJe1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXxNGF88sOq31h
 kleKpcWQBCm6T9X0B8PLSpl1jip2jRLlZB6tQjCj5NAxj/+8L059APd6qM3f2LYMRGJ/2uTTRUa
 B1XYWdVnLrWAj8He6k02itOLmrsLDOK6yigGj516BsIH+3arlGopSvdKhFr+z5tCbgSmdSfv4e2
 4uZVk3G8wF/PHHJn3qcIiTjh/d1luNI4qzEZQx2HW4HvKb5BKW0z1Rn2zIVDCbWq7fSkyohinLh
 lqTr6KIWMuTKShOKkqHnkzXXKFD3NAl48juxvzS/wfKVJgb9DoyDz1fKRp9d9zN0KROn35eHADF
 cdCfSXxmtM3p5wBGlFqO3JeTF77qd/K6wZvPC/rLdVwwDmXpRgPk7b+BZiMBHaBYCzjv0gHTVNs
 cVCyi9jcKXWaVKhFgTBwXYTG4Sl3qli+VLXgqdodMAoo4Wx05rpPX2bbkWtyKnOvFU0tA32qiuw
 SYP3rX1tIGRM2jR2WLw==
X-Authority-Analysis: v=2.4 cv=Iqsutr/g c=1 sm=1 tr=0 ts=6a9596b5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=wNR32fmSmbAooUEeK+VsOQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=zzkdEwteAlqJkH2fiosA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Kvv_CFnl8PASujJPp0i7fQkNt4I5jJe1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129

On 20-08-2026 19:01, Krzysztof Kozlowski wrote:
> On 20/08/2026 12:07, Dmitry Baryshkov wrote:
>> On Thu, Aug 20, 2026 at 11:07:45AM +0200, Krzysztof Kozlowski wrote:
>>>>>>>
>>>>>>> Device node with this compatible is already populated, so this looks
>>>>>>> simply wrong or you are adding a duplicated driver.
>>>>>>>
>>>>>>> That's a no-go, you are supposed to work with existing drivers and grow
>>>>>>> them.
>>>>>> I'll bring the discussion again here, there was a discussion to move the
>>>>>> driver to accel subsystem if we want to support new features/uAPI
>>>>>> changes. Please read [1],[2] threads. The intention is to replace
>>>>>> fastrpc driver with QDA eventually.
>>>>>
>>>>> None of them address the problem. You want to grow fastrpc into user of
>>>>> dmabuf? So you move it from misc to here.
>>>>
>>>> It's not as easy and nice, so I think in this case it's better to repeat
>>>
>>> I disagree. The existing fastrpc driver is not that complicated. It's
>>> actually moderate amount of code, much less than Venus was (~7 times less).
>>>
>>> It easily can grow to support two interfaces and the only difficulty is
>>> how to manage these two interfaces simultaneously or exclusively, e.g.
>>> opening first one disables the second.
>>
>> I see the point here.
>>
>> Would it be acceptable if we add QDA support only on the new platforms
>> (e.g. via the SoC-specific compat), provide QDA for those platforms,
>> and, once it reaches complete API and feature parity, we remove the old
>> fastrpc driver, migrati old platforms.
> 
> The problem with this approach is that we have no guarantees that it
> will reach feature parity in respect of old interface, thus old driver
> might stay forever. If we agree for duplicated driver, contributors have
> no incentives to support old approach.
That's a fair concern. Let me lay out the sequence we have in mind and
then the concrete reasons parity is not optional for us.

The plan is staged. QDA is enabled first on new platforms, where there
is no existing userspace to migrate and the new UAPI can be exercised
properly. In parallel we close the remaining feature gaps against
fastrpc. Once parity is reached we migrate the older platforms onto QDA
and remove drivers/misc/fastrpc.c. The end state is one driver, not two.

On why parity will actually happen: the DSP firmware is not changing.
Both drivers implement the same base protocol against the same firmware
image, so the feature set is defined by that firmware interface, not by
what we feel like implementing. For QDA to support a feature at all it
has to implement the same protocol operations fastrpc already does.
Parity is a property of the interface rather than of contributor enthusiasm.

Other than the base protocol, there are some features(daemons,
capability, session sharing) that exist in fastrpc for performance etc.
but are not yet part of QDA. We want to implement them properly rather
than port them across as they stand.

The remaining question is how fastrpc can actually be removed once
parity exists, without breaking existing userspace. That needs a
compatibility path, and it is a deliverable we are committed to rather
than an afterthought. For that, we need to settle is whether that path
is a userspace shim in the library, an in-kernel translation layer
exposing the legacy device nodes, or a hybrid. We evaluated an in-kernel
shim during v1 and hit constraints around constructing per-client
drm_file contexts from outside the DRM core, so the approach is still
open. I'll come back with a concrete proposal, and it will land before
fastrpc is removed rather than after.

> 
> Much better is to refine the old driver, gradually adding new features
> while maintaining old stuff. This is the only way we can force
> contributors to actively work on minimizing duplicate parts.
> 
I believe you are suggesting we bring the new features we are developing
with DRM core utilities into the fastrpc driver. I don't think the two
interfaces can share one driver, though, and it isn't a question of code
size.

fastrpc is a miscdevice: it accepts raw DMA-BUF fds as arguments and
tracks buffers in its own per-file lists, with the fd itself being the
buffer identity visible to the DSP. QDA is a drm_driver whose buffers
are GEM objects in a per-drm_file handle namespace, with PRIME used for
import and the GEM handle being the identity. These are two different
buffer ownership models, and neither can be expressed on the other's
file type.

Supporting both from one driver therefore means carrying both models
simultaneously: two IOCTL surfaces, two buffer lifetimes, two teardown
paths, and a memory manager that has to serve both. That is two drivers
sharing a directory rather than one driver with two interfaces, and I
think it would be harder to review, and harder to eventually untangle,
than a separate driver with a stated removal plan.

There is also a positive reason for being in the accel subsystem rather
than misc. We can build on existing DRM infrastructure instead of
reimplementing it: GEM for buffer management, the device and file
lifecycle, and the debug infrastructure. It also positions us for work
we have planned around scheduling, drm_gpuvm, etc. Over time this should
mean less driver-specific code, not more.

I'll restructure the cover letter so the staged rollout, the
compatibility path and the eventual removal of drivers/misc/fastrpc.c
are stated properly.

If after this you still want to add or change anything, please let me know.

Thanks,
Ekansh> Best regards,
> Krzysztof

