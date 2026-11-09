Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245490;
	b=yzyOs14H93Xt2DnjhNdZXEsGBmFtXxlmBjBGc9bE/P+hpyz6FaPJlJ7A1Cf+LPirlkGr
	 fIANb6wR0DeuGhV3PRHMcBiYrT5/WWikxOXB9lNn85hl9KMXtxu4n/BW3CQW+sK5DMR5R
	 SvH7kOjX9X2Odv8DKnI0jl5jRA8e+FiGZQBAg/bkDZUwDIYKX222FDqQDro5G6ADOd0lM
	 mvwy2//TBu53lHgl7OOuTHdPKPpuQR3WovjA3LRcP7ViL7Fuuy32mMay+SWrVXceoaEqG
	 hjPe2HTYMD+8NwTzFqfchaYFBkPS96ANG7cr4W+1m469cEWskF8UTkvhL7+cUPPf4DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
	b=mlOSIxZym9lNeMiBlCSU/ZSpmhgB1G95r8eUQp6k0bbblYeFMAEYQcaQxm0T6ZNem5y0
	 tHdSM8SoHCQNBPUO/AIiOaRDb1T+HYCVUjKVzJKEHOsBfU4n2v5+sWdmk8VpTueoN+R8V
	 dB5thwswDhzKOa2jFsGMc9YZX5jUOkrpRLTCt6yVIArBqYrszke0HQtmKJkmOEesTVzHc
	 i7xNwkavydp2WqsS06hY+zfHa+h1QLEj5+NAu/tSQU3dT13AWtxrT/hTCLck0Oju0kw2a
	 0md/Ko9iHe0A+6BkVwfS13Tu1XMpWMAZxAWlUYAcKrsrycuoa9PglN4wcPGwc/OnNuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NigkGu1q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYwL2Dag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FCB606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5FCB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NigkGu1q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bYwL2Dag
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9HHHnx4001638
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 17:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=; b=NigkGu1qQjA3ANzD
	/6hAxXrynh4xMsmFeYkLy1+iNeLPA3Ion7dkHS656M3psjOOTg8Z68F3UL/vmShT
	zORfzWglAV6Edd6vMHw7X2I1XRAYJHTBO5yPfwkGcvg+wGffn54JEMGgMo3p3rQm
	0gNwi+ptCQDtnMmLpuKeogqkok5wOovOvQQjvKsF9Y0+e8vEUiGlNQlT552S//Dm
	JuQuOstbv7gA7wFbdq8Z1hhCui7x1OX/dJQckDnPQlBn2wOCp9vupFA59465K1fo
	80hwbgKnbNxWn/YXMJp94HsYZXteeOdA4xa69+5RHukwwwwSZB7kAEdDoEKmemW8
	McYjSw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rs7bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:31:28 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so274142e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794245488; x=1794850288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
        b=bYwL2DagUmMF2ukutLGF2UDXAEloPVf2gTMQpmEYBeFYUL0L+lsqQ1XBEcy0Q4nzxV
         cTA+KJ+Mh6aHF2eN1cabkKuKQyru2wj0gMKVtPzp/YwuNb0ndX9C/Jeld9Drr/aITJD3
         FwbpmVkte0AvowACovZoXJgoV2i4K5JNvJUjkh8af07KAoqIFf2QUcZ3Zp8BSdq8E2Yt
         uMYmmSrYRxFheXMhAePlHOLlKpdRWqjeZNVkRZXhP7v1U3lzFG2ZhsXLvgSM6vuFzapq
         HGZ9F98DFDBmUdkP3h0DgTCrUc4pa9rKFLKwx40V7siBbwcY3RXT6DNJT3wPodT1b5GP
         ESVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794245488; x=1794850288;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jba9YTfpv2o6XFwrhMZ/0GoEqiFmykqBRWRUZQ/DELo=;
        b=nSJ6R6ayCh0pFBcc0yZLQhh6zgLKoE7xctFEXduIcUTnFcSrwS2mzgSseJQzL2AKzZ
         1LL6PsH8vJ/JLi4OuzXtz3i3w8rgMwX+jwk/3T7e8cFQjin20X9KK0l+lE8egTU4EWjJ
         +t4FsM0qLlI2K4Hvv6HWEsOBI2/+BEp3P1SOZciOwVhoxcJTkx2O1shUOwX8uiaI2+Ql
         B1E340Bc82lRXesnFbTA7d1Sgs2FQn0iJKTGa3zSCnUQ2147zn4qGAXM3EixKf/XTn44
         RCgS9QSrXbTSugDzazwiTe5gUBuXBtSuaio1YLzXJbPa5pyTOHOOq0Xmoiqvh6ge1bBz
         CfYQ==
X-Forwarded-Encrypted: i=1; AL+hErHxCtTrGHDjT/JLn6nSNS5dZel9srznvKq79DgyCf8StKB0v6POoI9EWlxxNSJ7hTLJdnl3W+spP3kNYMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9bF1jAj8wq3JSQkIQ9voBgbm84c0DwzbS+DVYfVbQYx+EeRbb
	3wBr9ZEU1uGJM+J+x6AwcG2z8f37eHsJyOk39PkY+CZUVEjHAbtk6jGWhfMjoRSq7nPDkgJohDM
	0LgndKvdnAPvnORVpO1UCSLdFCF5CuAg9fntd5X3usGZg+stmeTCbtVtazLU8/3lvTs1pFgQU9M
	I=
X-Gm-Gg: AYBFou0jeZBfkSA26Vnb9Zp+kg89r+CtJJRyc9sO71mcPssfvEO+gma5HkEovfb3Fy8
	7tkbm+fij7w4FBb642lJWE1m4J9hHUcpzkUekm+TjEYUQd3bBN3JHJvJZyUpvW4QJqTOG3ED5lE
	9uFKLWl0FDKYOzp64rO9GFgUuaYDX2zKxV5HYiBls2V7O17o0Nnlz7xrUcyK7U0Na7VSfcVoe0k
	jjmEEnJpTF6X+DtwkXcNKXIT98yF+AuSoDiQN4NCR5ciHz4kpdExpPCiFjS68P1XJouCDAzTf3R
	ewjZ43oR1fZ5ITfX0OxGcsLkX5c3iHVxH+KuEgoB2hnrvydPzDQ4YW3y24x2k907j4OnReab0S8
	s+IZhmtHZmB4AUXccRQwHl0C4tX+z2B/fpP5FH+JfDq5G7+X5CBRgTWWAG2CWxlp5N+HDDEd9kh
	h+d+caapNF8PE=
X-Received: by 2002:a05:6122:e465:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ece724b48dmr1768676e0c.15.1794245487999;
        Mon, 09 Nov 2026 09:31:27 -0800 (PST)
X-Received: by 2002:a05:6122:e465:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ece724b48dmr1768589e0c.15.1794245487449;
        Mon, 09 Nov 2026 09:31:27 -0800 (PST)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe63e6sm3867185e9.7.2026.11.09.09.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:31:26 -0800 (PST)
Message-ID: <93c00a19-9d6c-4a51-91df-ae75ef112cb4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 19:31:25 +0200
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
Subject: Re: [PATCH v3 00/11] Add SOF sequence logic
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: w-FaX9tfrWgUXwfCwf62rlaeTJxs1rF0
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af20370 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=5jSOgbY-jEdhu9h03aEA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX4dLdf8tYjRw7
 DOpAkIFnnVo9s47VNATkAOqbu4AzUmijM4fcC2gdLrjgH8o79oAmB2CKDizJdbwST2oWS1F4H+h
 2lQ0wo6AcTFOa3DTIP48hKOEPjb/dUTVL1FI2I1d7wm++eB8s2N2G8nySanWBIv7/QzU2z+MwJW
 uBWSCIqhVNso8IIOStXK1SHuSq+T1Z+26q9uaHr+vIHWmw/koC/10BR8/G7Vt/7zWHfx5LzMY+g
 uitVJs6HZUVSSF5sBYcOsGcV0E0oSXykx9rbmtYqZT/n5A/OYvJs7yACtpLXu5BD3pU1dgcrmLP
 zkUrHz2QQQza/TDNbTQYrD7+B5khfzvijfmNfoaxmoEHFkuVFPKs0yii08VMPzUnKcqauWNDpf8
 i63SFyjKsHbJCD6B3SXU9AOCoULDjubVXG5SKvtLrQrUnqxa38rQ0H+4BZue/oNeV9aVAvqRmka
 uLzBRG4mPRe395vgVKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2OSBTYWx0ZWRfX4f+qPEhHB9Em
 lwJUdbn55MMGdY/AvCQcb96C4NhlvDrdtyqRlkaBYGed1jFsRJhBGBHhHeasxsoFLyaILpGx6K4
 YjqSEf62560UxpkHwKfrADeh4Ie68xg=
X-Proofpoint-ORIG-GUID: w-FaX9tfrWgUXwfCwf62rlaeTJxs1rF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090069

Hi Bryan,

The whole series were verified on RB8 board (SA8775P).

Tested-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

~Gjorgji

On 11/7/2026 3:01 AM, bryan.odonoghue@linaro.org wrote:
> v3:
> - Added CSID-340 patches from Loic wit permission - Loic
> - Explains the initial -1. - Loic
> - Drops the .id field enumeration - Gjorgji
> - Accumulates RB as indicated.
> - Link to v2: https://patch.msgid.link/20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org
> 
> v2:
> - Amends series title to drop EOF
> - Drops EOF inclusion until we actually use it for stats production seq_no - Gjorgji, bod
> - Moves QoS into pm_runtime() callbacks - Loic
> - Switches on vb.sequence change for every SoC the silicon enabling code
>   supports - bod, Loic
> - Link to v1: https://patch.msgid.link/20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org
> 
> v1:
> 
> This series enables SOF AND EOF event tracking making use of both events.
> Whilst the code is actually very simple the functionality we want to build
> off of that simple code is not.
> 
> - SOF
>   Serves two functions. Firstly. Informing user-space of CSID SOF events.
>   Standard Linux V4L2_EVENT_FRAME_SYNC is trigger from this event.
>   User-space wants to capture this trigger because it allows user-space to
>   better align the time a frame begins to events elsewhere such as IMU
>   event timestamps.
> 
>   That functionality is directly applicable in this series.
> 
>   However we will also build on the SOF event in later patches to allow us
>   to begin programming of shadow-registers for the next camera frame.
> 
>   When the EOF event happens, we switch from one shadow bank to the next.
>   This is only possible if you have the SOF event.
> 
>   So SOF serves the immediate purpose of timestamp alignment in user-space
>   as well as the 'evil plan' to trigger off of it programming camera
>   parameters for the next frame.
> 
> - EOF
>   EOF even on its own is useful because it allows us to increment
>   vb.sequence for each frame as per the spec not just when we have
>   buffer-data.
> 
> There is another purpose to having an SOF and EOF event with sequence
> numbers and that is.
> 
> User-space submits a parameters buffer. Kernel accepts that parameters
> buffer but can make no guarantee about _when_ the entire buffer will be
> applied.
> 
> So when kernel finishes application of the entire params sequence the
> returned buffer contains the sequence number - from the EOF tracking which
> informs user-space _which_ frame vb.sequence its given params buffer was
> applied.
> 
> Similarly when kernel produces a statistics buffer that buffer will have a
> sequence number - and that sequence number will align to the frame sequence
> number that the statistics describe.
> 
> Thus SOF/EOF tracking is fundamental to passing parameters, returning
> statistics to user-space and for the IPA algorithm in user-space to
> understand which stats, params and frames are related.
> 
> The first patch in the series addresses a corner-case when a quiescent
> system can take quite a while to wake from idle, too long in fact such that
> the SOF event is effectively missed.
> 
> On 'normal' systems doing lots of things, this is not a problem we would
> see however on my test X1-CRD system running from ramdisk - there's
> basically nothing else happening and the wake-time becomes apparent.
> 
> This is not strictly speaking a bugfix since right now nothing in CAMSS
> cares about SOF or EOF so if we take an additional 2.5 ms to process a
> data-buffer on a fully quiescent system, that's not the end of the world.
> 
> OTOH as soon as you start to care about SOF/EOF then missing those events
> is no bueno.
> 
> The CPU latency value chosen is 100% stolen from IPU7 which seems like a
> good starting point - the stealing obviously - and happens to also work.
> 
> This series is really an enabling series for more work to come but even on
> its own is an improvement on the current situation.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
> Bryan O'Donoghue (9):
>       media: qcom: camss: Introduce CPU latency QoS during streaming
>       media: qcom: camss: Introduce SOF sequence tracking
>       media: qcom: camss: Use SOF sequence tracking for vb.sequence
>       media: qcom: camss: csid-gen3: Enable RDI SOF driving
>       media: qcom: camss: csid-680: Enable RDI SOF tracking
>       media: qcom: camss: csid-gen2: Enable RDI SOF tracking
>       media: qcom: camss: Switch on frame_sync_en logic for csid-gen3.
>       media: qcom: camss: Switch on frame_sync_en for x1e/x2e
>       media: qcom: camss: Switch on frame_sync_en for csid-gen2
> 
> Loic Poulain (2):
>       media: qcom: camss: csid-340: Enable RDI SOF tracking
>       media: qcom: camss: Switch on frame_sync_en for csid-340
> 
>  drivers/media/platform/qcom/camss/camss-csid-340.c | 39 ++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++
>  .../media/platform/qcom/camss/camss-csid-gen2.c    | 15 +++++
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 +++++++++
>  drivers/media/platform/qcom/camss/camss-csid.c     | 68 +++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss-csid.h     | 21 +++++++
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  5 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c      |  9 ++-
>  drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
>  drivers/media/platform/qcom/camss/camss.c          | 65 ++++++++++++++++++++-
>  drivers/media/platform/qcom/camss/camss.h          |  2 +
>  11 files changed, 265 insertions(+), 5 deletions(-)
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261029-v4l2-frame-sync-0d6fb94ab6e6
> 
> Best regards,
> --  
> ---
> bod

