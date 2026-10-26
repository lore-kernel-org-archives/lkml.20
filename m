Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005915;
	b=JSSFq/RMzicE04BhzVKZSa5F0uwFAhFzaYaTKTTv0/yltI8aPwIAldIWo6MZIFH1oGJi
	 vDHoKbNOm57JCglTwxfRYOdhHYwYfKBmFxbGstK7p4P9TxZVOiBlVrj532tEZtPj/IXCf
	 n2V/+LHN4ZRdRFp40g8Xx+09jF98T4mDSEHNXrEyCNUb8EUKjhfcQokvhZfXlSioDYQif
	 Ry0VVOhoOpNTj+rRY+ieVxpHDhxyC5r5zO1D9lIbDrM6YKPLQXpfWHWXI2lN/u4JYWl81
	 sz+7ZM9+uKZvM0hMy/1C15E3YoXhq64RALAAVB5VxeYWmB90k02kwEGaX04lc/Z6dlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/vDERYeVL03wKO34taLC/BjiC0AyLdy7FJkp+DjJcs0=;
	b=NM37y1p3/NKthv8/yuC1ci0eszZbSoITppoFw41G50GoJtPEFjCxY5/8j06UGzCoi8rH
	 bMfNagep4plhfJiLMbCBlmSSjVI6wny4OugwpTkIs4SauxmGr+8IGxw7BdR6/EWWmMPOa
	 aTpZUctXQg3KMZXXCjniWpO80reN1xoJIHOJY28QCnqBnJ0afk3VbPowH4YBWnedJUV1I
	 8CPEQG50AXJsdwllh4Rnrtmow3vhcoIa1xwZJJ9w/gW3bw1KVOuBkMUUrsLjxM551l4yR
	 tKZRrUMg9JfZVxnn+VlsV1uLTElLodbdPRzVR1Y8aZSeKbIYqdZtFcIAE1wJFJ8xK2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AM1cYYST;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aGBO+gZd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADADB606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADADB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AM1cYYST;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aGBO+gZd
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b29a2206280
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/vDERYeVL03wKO34taLC/BjiC0AyLdy7FJkp+DjJcs0=; b=AM1cYYSTA37KxufC
	Y9gCmJaHvPM8awTBsY97AbFNn/5c/owS0kW6fy15Ri9NiVS9o5nrNAHLFFoJ2HEw
	aJKbm0d5eJGmj5yj8rnlgqxBLtoekUOIRSYMh7IWS9GjoJtjZ0s57/W4lGmThLFj
	/O8/iiJAr6xLsRuQdKrGuRHpbX32hYprGHTCVK9PYWuGbX2MxfJH5EIV8I4cHQ+Y
	Hgy1iCBzc1bXClRZhAcPbAS9Jxj4tfWf6YL02QW2BHYue6CbdY3WgQPz4Ho57vMc
	DTiaswtRB1q3ataXB83m0qnfOAvqIwe6xsWXpWkf2N64OwQZnbhL/9hghwj33Je/
	WESGNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrunmky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:11:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso34311485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793005913; x=1793610713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vDERYeVL03wKO34taLC/BjiC0AyLdy7FJkp+DjJcs0=;
        b=aGBO+gZdavrN6jm3GQ6HQMzMlHa4Df6qljq9ceT127PHzxF1erXc6GKABmR1FHccXU
         DQzfcKiBxlC35haPnYCl27+8Ttof3jzqt0S5IsVgq3/uGZ9ryRo/Dz37lQLOVGTwN69/
         ogDVIyrxEtMvDs2/Pvkoug8CSjXyVZGmJN4jaX+YpcascFrwRrvnZx+3UaXl4wdv4DIC
         n+Bw9oDzTd2qmDmOfviAnNe3Vu3zxif54fJ/v9CH3PRvbcRYumfgwFAAwcDfXcjqhjT8
         luI9dA+Np6sS3dvvaK+gUJJqKkLnbXTPhdOF6h4cTeLgFOgGNYRX6XOXviVqI14uVazx
         Vc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005913; x=1793610713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vDERYeVL03wKO34taLC/BjiC0AyLdy7FJkp+DjJcs0=;
        b=u3z4Emff0GQqnuKBfA0fUxpA5yut9Iff7K/LPuPPN7SaWLpUpvqQ+CMfUepXUNYxTM
         p3E2V/uXBNvE/BIJhrHWkMHhOK8oP3HIeGuNvyUeyomzD+nrXZ1pfsdM1pJrWntXyfrj
         ThZ7Rpw5L/5SJW11m0N23FThUzj4wgzWbGwqbBdFY3pmnAuwJH++wg33GRM8dQ1VyAJs
         YAAg134BOT4BaCp+o2mDDX/mgmVH26Gr/QU/vczqCiNVm6SWUjxD1kQkHf/WD8giZHVx
         N07ko1QgbBnwZb/79fG1wcmUwXV38aJcNQmZAw7U4hRY/z+SJtO7DGKEaOwrP6iWPUnc
         Otfw==
X-Forwarded-Encrypted: i=1; AKwUvBzA50ZBVbPGPHfo5rITRsescseFd0a73w6VuXT+zItdbBCvd62dOmmiIGcdTorA9oD1WNoT4CWMLHjQtcY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDgJV5T3WI126hIrG8nXZglSwC9D2bjMzY1CQ/6pwVGNOvZEG2
	jWl5H1GoAi2Y/Votn/P4hz0b3ZxVQ+7tuv/c+vqoo6f/j7dgKDW19Vmi4HuAleav+qXPHFQgGpr
	UCxL0jLTEQZU8vKSCVzfXoythaLX0kl5BwiYQImn6u4K2x7u8Lvf/60kJOqJHqNpIUTM=
X-Gm-Gg: AYBFou3epC7LnTtep3ML1Iw5PSlSOKNAZirbCfJEVhfS4zDv66Gp2x+XLCs4ZwleGAN
	lZU8bQTNw2JbBW95/+t7W3bbclWrIT+qu0HzOY6qIi8kjm917b3rvvF2a6z11Dph3Epfg8SPetB
	LDu6tOJzkkg4ULC54dhu5r/zN202IQQ79ZYWSf5ATVy1RqcKe33oYFb+C/FNNa8bjQ02x6SXMnH
	lyy5FK6qOc00h0VgFYH+lznSk1HCilraJHRhyr6ic6QiG5suWULqhii/1+l/5LPMZP3ZcAWakKi
	eRuSw4mPn4WnAOvDn15DoKMxSl6mdvDZvrJyW9lNTJV9T2j6T+SGftFI20BRfVOJfxVPtSVkr+I
	WOmoXhaEn+OhKNIJse+MuGA==
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr999828585a.3.1793005912388;
        Mon, 26 Oct 2026 02:11:52 -0700 (PDT)
X-Received: by 2002:a05:620a:26e4:b0:93e:6d87:4f69 with SMTP id af79cd13be357-940ef8ec03dmr999825585a.3.1793005911851;
        Mon, 26 Oct 2026 02:11:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459711d2sm3281710a12.17.2026.10.26.02.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:11:50 -0700 (PDT)
Message-ID: <c86259a3-f719-4e92-ad8b-a0cb6e1d685d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:11:48 +0100
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
Subject: Re: [PATCH v5 04/10] drm/msm/mdp5: flush the interface before
 starting the timing engine
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
 <20261024-fd-kms-fix-smmu-v5-4-a5b0b284aead@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-fd-kms-fix-smmu-v5-4-a5b0b284aead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfXxmHzOfLIWrn0
 XZCqjEiwVMt1N+TCs0Vy1eCki0K5btlXkyeB4hWfROO2vSaTvflCRuJYRBzQyXHQ5TyLcz++90E
 07MYPFFW7Cc99qFlXdbiSQtH6a25466o250z0Ak38CEuv2NeWoPtkzR5g1vYRHmuvFRn6trIcjf
 yqOW9dmJmWKFA7YLTJvajqWseW2xe7ovjS45GfsqCLwmiKY7rQZmYmjaoP+R0KdyA9uIHgc90bQ
 dn8cNXMlL1QKzvsRe9uuBv0bYOLLeg94teviMFiTY65147QugP2WAUiq6eKTBpoLau9+h6ZfINb
 7N63G2NrZ6LHc+f+LTvVGFQ1v4fgzR62VTIqs/qJeN3JE4aaZj+aMksxSCgcyLFNegERT5hLU1L
 WOUy9Ou5cs53bip3QZA33IoBzrxNdHmk6TrqUeqhopje8bspzBlHViDxsnPN7b9Tfx3kscFhEb1
 hqV+yleWHFu2P5jSbQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNiBTYWx0ZWRfX2+eU7DkoFgBJ
 +vm1AFtoW1Di3zs8jr/jJ6uhLIp4K8RtnijxIY6jUyQGnrG+nCCk/mOQco1xfo2txQOrbbcbHs+
 grSVPWa40u+yOBO9BghoApoayekx5qA=
X-Proofpoint-ORIG-GUID: 6iZa3zpzZIlu17aIV8pvzwcP9LataAQq
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6adf1959 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=t3vDU1A9I6D9DDbkPvEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 6iZa3zpzZIlu17aIV8pvzwcP9LataAQq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260036

On 10/24/26 1:25 AM, Dmitry Baryshkov wrote:
> Disabling a CRTC and then enabling it again can produce an SMMU fault on
> MSM8996 as soon as the timing engine restarts, e.g. when fbcon takes over
> after kms_atomic:
> 
>   arm-smmu d00000.iommu: Unhandled context fault: fsr=0x402, iova=0x01fa6e00
> 
> The faulting address is inside the framebuffer that was scanned out
> before the disable, which has been released since. The pipes keep that
> address latched (CURRENT_SRC0_ADDR still points to the released buffer)
> because the plane removal flushed after the timing engine stopped never
> takes effect. On the next enable the pipes are programmed and flushed
> before the encoder is enabled, but that flush doesn't include the
> interface: the encoder enables the timing engine first and only then
> flushes the INTF. The first frame is fetched with the latched pipe
> configuration, from the released buffer.
> 
> Flush the interface before enabling the timing engine, the order used by
> both the DPU driver and the downstream mdss driver. With the INTF flush
> pending, the whole pending flush takes effect when the timing engine
> starts and the first frame is fetched with the new configuration.
> 
> Fixes: 06c0dd96bfbb ("drm/msm: add mdp5/apq8x74")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
