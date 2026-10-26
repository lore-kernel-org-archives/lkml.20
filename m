Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006353;
	b=KrZqy2UXmVq4bNGFpsTNIiXgVN3pq8vdJBiQTA8uoAKLVaKEZ9lujaxfO9naO74OuxZe
	 sTmewoCv0eOYkzLCxbqHNHyyPALZxLYIltcgfWTpoi+yhMqwv+M8/XYVFU9MUm6E0bQ1h
	 i7+/WhbKL43V9EdIPC+1qMHVaH7KXl0X7tJo2eJ68Mib5ZuJAS+31kODuGEqp4lHmM8AU
	 A2Xudz3DsNmGR+EDgKcXgCNvYgxY0Ks2EuNP9kTGBc9XWWYDJqkzfyozGtCabF5tKenfj
	 C5yfGxfKfAHmit+LO8w0ZhV2t/3UHH7NeXdcRtRgq1O4CA4iopbTVKtqD+23k2szxuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006353;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n9MudQ0NaHJP2SfNJ4CqXFHWBa7zfJmnwB9phhWhgS8=;
	b=wdAGGXsQiQ+vJCUnoRCJc8NVQ18nCtKVEiHfNjwvBp4lhtgy8pEo7zZE/pNWGMP+STwC
	 d/Fhb/fn160REa2MUqvfQtb64zVZH5x/gyWDlnPW+V1VTR2mOHjp22ynIBSWn7DXNOieC
	 ftFebsAcFeuJ/1/VncxfRaCONylp99V9hN1NbUMd1G5GkQFA5Hc5SC/gUHqE31wDlJC/g
	 s6HIR+3Lzp32/vogQUiyoS88zB1iafkjnsWvrkyIHZCm/Uz0jimaKVxzQofCdqph+C0vm
	 pSrzJswshnPQcIjTkhCmcSmeP9CygzBfndmc+7mZcPrvRWlkY62BeGatgsygV+2FGxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iy78WORG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQNwtmJt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4843F606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4843F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iy78WORG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fQNwtmJt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b0s72806309
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9MudQ0NaHJP2SfNJ4CqXFHWBa7zfJmnwB9phhWhgS8=; b=iy78WORGwPeWAGI9
	z7s+NJqkRJDPjiGphkUqRD4G/WxwyZxs84YzVslcs70p10trDhQAt3MgJ7HOnv/I
	vYwbrT/UhU1HTX6nDrt8Zt5abLEPdhNfva29hqAxtc1aBS2cuTU6/PzLycmm++3I
	DupcSUEmiOz877jWhKZC7APZUkTN4lV5DfEfoerl6yOiOFTcQ3W9KjhHjIJltvP8
	1g6FHyFAaMg8ZiVK3beJXbAMeq+yWBvJbf+m732RbbYUIRmvwcbAcqTEAFmLSPgX
	X8HJ0SF6kLUFY9rqLxjKscr2GZTgJ9nNTAYad3zM9yglbq9WLjxuABgcl7nHapKz
	aayNrw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xnr5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:19:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c008df17fso8479486d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006351; x=1793611151; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9MudQ0NaHJP2SfNJ4CqXFHWBa7zfJmnwB9phhWhgS8=;
        b=fQNwtmJtKsg0yKvzmNCvEiV06xdnaaj/pnIHelIvQSTM5bSK+9xXrV6DFYXenn3Aog
         4HXpVOMxBBqa/+KqEJ6xHbRpZKIN4XlwNUCZsYYTQD6XazHo+6FT8r1O3ErHm6DPm6o6
         ySidyPAUovoxtDPcTSysaH8hxcL9g4pUnv66SD9G0xjs8LWTzq5h8N3+SqXJeU85GIkh
         cMHumaL1arLM5K+Xjtjxb4lsb3H1amVm2Jhk3bdIM1+Ac2HlZdWwqCzfhenfe31hr80s
         ybkuUjxGQKtSWiKZiflfOGEaRb0PhaFvksjWGqH53uu8J47xoOlvJ6b1U5wL/YFjiLtj
         F1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006351; x=1793611151;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9MudQ0NaHJP2SfNJ4CqXFHWBa7zfJmnwB9phhWhgS8=;
        b=ZiG6uoeGeNHAcHD5rHuGUbxI81vJmuC60SPjsARRowL7YBXtq9NDf7ksdTthwb89L6
         qjO2/CrjaSIG6iNrzmT45TDeUwNtexDRmeSawpliCMNQsEWrpjcPBxGoUujvzAm9gYfT
         XyOn33gA18gWHLX+TpjTSoC2JiMr4jtbSu1mR1YAfJZ6T3a0tCFKPbVeQ9DGSD2QJvGf
         DgHHnpv7GJCdRtLIooxxH1nI3RkQLcg0U9DpM/tldmWP3KNTeruVqtmuq3tOokoWsuRT
         vw8edy5EXB4i/j5Y53ZRHtuFZOaPPMezObJrzxkA8XSltT8EgG9X2axtdHDYxSWn+JeI
         WBhg==
X-Forwarded-Encrypted: i=1; AKwUvBy5P6ASzCMCValCkIB1ppBfEJBg5OMO/9gNxVqtmayFYZWc2h4vQzJqfqwzVmrm+AgffQX5Ubs+cSX7NEQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJl+sXu7hvNYvZRxaDeF9DTIxj1yuQ8F/XEDUFiDsIMkU6H0pZ6
	7WOHZvsVkyZstklD4PWrvVDAs0klyfxfLBq6dPkmzBVlghPz+jr0k5jxUZjoBfJgoRT/wPaaO6y
	FDVIDLJh46gKVtKy2bLmnqo0oblKv14hVmhENcCwfhaBH7x9YYmcOZOoEjd7cWtchAcE=
X-Gm-Gg: AYBFou2B2XCvLq/pFIDJqt3OWsjsNThyN1bANAWbCm4H7T+bIxROpWSYBYHY3GVsTJj
	IKV9p6xu6uJAaruH3zYVXNyz/5ter0EITWNVIu30mEJbADtRC8C8zaDtvIdU995z78xOFbyt0Mu
	rW4TD9rsxVBdLcYWeK17sOW7r4arRVPWLG7Rz/V7ntFw8q6lL2yGpT+3H/YTmwZttK3Sc3Zvmti
	OoABl6g1M7erQPIzWQMxkZ51TY2puKu/3hww6ZJghbjxB9KEvtt9LMCtzn7qMdz3ug+RJlqv2vO
	Z8uHdi+Y53d2ljuW/YBElziV7/SQeJVRkA/ruu6SqXIaT8K+e7Ngz8/rKN5UhASRKlbncYIgPnZ
	pOh9er97LvYgZ+55v81WUHw==
X-Received: by 2002:a05:620a:4bc9:b0:93e:54fc:2c79 with SMTP id af79cd13be357-940ef942706mr813955385a.5.1793006351385;
        Mon, 26 Oct 2026 02:19:11 -0700 (PDT)
X-Received: by 2002:a05:620a:4bc9:b0:93e:54fc:2c79 with SMTP id af79cd13be357-940ef942706mr813951485a.5.1793006350822;
        Mon, 26 Oct 2026 02:19:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f95csm299862866b.5.2026.10.26.02.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:19:09 -0700 (PDT)
Message-ID: <86bf919b-5528-42bb-aa89-b518452ed7a0@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:19:06 +0100
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
Subject: Re: [PATCH v5 09/10] drm/msm/dpu: only reassign resources when the
 encoder is reprogrammed
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-fd-kms-fix-smmu-v5-0-a5b0b284aead@oss.qualcomm.com>
 <20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-9-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SY4RZZJeLBGMiu9_im74S1ojAMqkS7z5
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adf1b10 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4sCBZ3MT6_yhT8qeVe4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX5pVOdNc85SdK
 X6VIlN2mztMVu2Y9C9w0A66kz/MVe5DbYq6puPRHzRr6ZkU6MW08OGqF25pYvrv/VmSDQVIivyJ
 s16WCm7Ycg+i/amsAfO3mTwUH1wC33s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX8i6O9Ljy/K9E
 qp0Qbc0LEWR4nwQl/5UXwHoSiyHlWhONNNRhXeuntBT/RX7iGBPzfN5R8g1ZXhQDeV+OWb7j5iS
 uPyxMT44e9sppDNMJFjMIU5QF5xUEs8ExoNz134UPyjgcwr6JmP7DGLuefRTzVT5U137Vuseuq6
 E8j2kLn6asbi9G0aMz8ROLLqUf0jST1IqLTdNDDUB58WuCDbZehc9dp2aKAfCn2o9vI8Y6r4COP
 7kYsMUabpfzCtztPoVwuFExmUIjeeUmsYqx4tiON2B3tw0nKWNz0FJx//TZ8F11lzGYt3Ms12HL
 qNrzyDPg+3bqkFhAXErizPgqrEuLe7RExelalx4fEHhBIrz3Wp10YmjvSBqLDEKbYnjXqxItpSF
 j9E0ZpJCOCWX8Gh0rW7wkz1ZhxFfpqqv/UP8ZAxjOtQ0ZiAzOO7q/acH7ubcJL1zqU0MMFwHRk7
 s/fqZqjqhRPDQLdTvzQ==
X-Proofpoint-ORIG-GUID: SY4RZZJeLBGMiu9_im74S1ojAMqkS7z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> Running kms_plane@pixel-format-source-clamping causes SMMU faults
> (fsr=0x402, iova=0x0001fb00): it sets a CTM, after which the display stops
> updating, so the test times out waiting for a CRC and the pipe is still
> fetching the framebuffers released when the runner kills it.
> 
> dpu_crtc_atomic_check() reassigns resources whenever color_mgmt_changed is
> set, but crtc_set_mode() only calls ->atomic_mode_set() for mode_changed or
> connectors_changed.  A colour management update therefore re-reserves and
> can get a different CTL: cstate->mixers[].lm_ctl points at the new one
> while phys->hw_ctl still points at the old, so the flush mask is
> accumulated on one and triggered on the other.  CTL_FLUSH is written with
> zero, so the pipe is not reprogrammed again until the next modeset.
> 
> Reassign only when the encoder is reprogrammed too.  Enabling colour
> management still needs a modeset, as that is when DSPPs join the topology,
> so ask for one in dpu_crtc_check_mode_changed() and only there.  Drop the
> msm_atomic_check() hack, which forced a modeset both ways, ignored
> GAMMA_LUT and overrode allow_modeset behind userspace's back.
> 
> Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

LLM is curious whether turning off CTM/GAMMA should trigger a modeset too.
My hunch is "yes"

Konrad
