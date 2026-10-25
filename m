Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792946819;
	b=aGwbslb7lSFfK6Pft1pZmK9FgNwHnpdgnCXSBj0ToADmPp0HOLos3T14YYcrdZp7L7MQ
	 WylhespUzMAPa47LUARYJTrWNTEumYhz85jLm/B+Xnojpsp2TKCm9fGELoe/Gys+08Vmk
	 g7o0qdx1jKxZ86yYiGD0Srl2/vJ3ZlNvGq2ojPxr/ctzKS7Nr8Z4GgOeKqBcT8l3TmWB/
	 HQ1Am4Nj8OuhwkKtz3UHePhWEIoT0InJph+3UDJHdzohK2Q4KKWlv/2KXBMy4OcqI6DYP
	 YjR1EpVAH/hotZw++j1nwxA/r6UYrv3wrHRO98Me+mzyVZk8xOT4vLPgZ4EJvNGlgyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792946819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Xp8FtUY4IDV5E4b4db6+noYAQseHMiy5uxXtnclLFYw=;
	b=tkZS7i9zMfB4bAAULtkD9imN/1FZhBJvX1xk2uQC4Q4mbodR4lHVLtNGROTDeLI5/n/C
	 nO8ywIPsztgpbab60SZAMda5+406WoVXztwdZUujXIpPFyLRf3z4KczzDdLVNjs3fYCIP
	 b74Bm8mV9EB5cMcQQV4guG1To9hKLxPyF3dTgy0bpO8XxDAmyhABYZbAWWI7lQvSg107q
	 q1KrjywnoJizR8+dkWqZcoMOgFowZoG79upStMYq+5aYDahRt34KQqlNb9cWuTVLaQmt4
	 RkyGIig68YEiVDGODU3FqDDflV/jwnGgOBMMDmyKM0bKGVWmwA7MlbqYuw9zyWYrIpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UGO8N2bE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q/dOC/vP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9720F606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9720F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UGO8N2bE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q/dOC/vP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69PFj8LU639021
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xp8FtUY4IDV5E4b4db6+noYAQseHMiy5uxXtnclLFYw=; b=UGO8N2bEPA/9WR8c
	pmMe02dkH2DV9moeXtM7rl+9ZfqhhixfOs7tUecHgQnEk5IdKQ6NTyxCwbZlX/qr
	xWN2nWbbEKp/HZhKIwGBsbQghnCCpf47jgWi4LvuhTEjyCk9fhdnBzIupfxeDZJB
	mXAxe/z0md1NQqf7eSVjc8bd4CHmQxbO83roBX4fGcVlQb+q//C+8bL4tcPtqgwE
	Oifl1cu/P7zcUJZURPT+Se390nt40wskyGlLRP71yD3e6GtI4gXfvXzfrLkfaHv/
	hTBPvN4AYXrxrGCy+IxewNXr9o+/xxyV7sD4zmIo5vm3rKvr5QZVn0lbEtuUoO0h
	44x2mg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmrukevf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:46:57 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-18b5ee75447so10009135c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792946816; x=1793551616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xp8FtUY4IDV5E4b4db6+noYAQseHMiy5uxXtnclLFYw=;
        b=Q/dOC/vPOVDlRbtbD9f41Ahngu3aGU53HTSB2uTiD4/0WCtTSqmoe0FhXlp/bDG6Ud
         t0Oii/Nh/PGTftpKGCFdO7zIY9z2uOA0csx/qUeIctOgXOXOLl1WYDiazfD6JjWaijDz
         QP/nivL99wGJ/rx6WLRDGf+1WeLzWIAVIAE0ExbWoc4WyZKsbw/AeLYwIS4f36kxT2bq
         k1PpB6zRGffrkuT1wN9pzwr/uB20+mBnoqLNnchFvntuSDhWdeJ3ExRVX0FhIV9IJePG
         q9Gd7iL2Babp8BSbuWlmnNeOWSRxBaT8pk89/hSfqYbbyR9TBgxsJJv9QAZPVzhrLjDo
         hBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792946816; x=1793551616;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xp8FtUY4IDV5E4b4db6+noYAQseHMiy5uxXtnclLFYw=;
        b=D2rmy+OhrzQpkRMYS+s0nuNjXULnqYXIS7koo+Q6LiVrGzf5rldGs0uwGhh/M26Ytz
         4+Flah9C3AjHn27d1YuS8+tsD0nb+TFgQ63QlGit6zdoEw8Fm+JNIAv8BWpiDtCjw+9O
         sT9vEZZaCTVKe+3bIgaL68t1v35cGsBS20EKWkfZqLh0xFlOLSVY5aWuMLtEsuOcrfNH
         8+MAbnm/5+8jWPh7EZN+22u1B2zScW2HORzdlRLY7D+RvoipqKi8l06NqFnOGz4m0I4q
         LgbQnUMhJsk8jKHBWTz1P/K1KOn8UQY0N01tFZ+1WiHkcvXZ4TDSInKNjR9ZWiM5K1FY
         evHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxok4y8P/c8maxsTCta3kKFHiReQu0CKr2yZ8+K8D1QzLMwM2UaDcm4ybkqa6EeiWXap0ZLUVfBT6Z3Stk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjYlySide8Hk0mWvP+/pKRfz4U7WEpmG02CwbfZWQoVO0EtlSO
	UG29lYcfZqyrZADTvpuKGmXyVleYAsgW244DO0yxHU+AJWE6v4ZBXOXfsfEGET1kZlmf7fL0Bdd
	7SUHOTV7yG/lvTxygUSrH0qxcdjkaIjjl6CfLJ2x0tw2jFnGru5DbMlyX0c07yMkZLCc=
X-Gm-Gg: AYBFou1Qdt0RfvzBWgNotk4l3N70h9ty1rauR/df+YV+apMjnRK4l3+FiT9Qpaju40y
	Zr3dZRLqJcoL3ObgvbWDbJ6oaao+oc3EC4wMQsEvc4sr6JMLZI9v7jEgmcc+RRIqjFJ5T+7TdMZ
	eJU0/vueojuJlfjcvqpj4t1/eHSsu8onqVvzSrYeXgQY2FxQa3UaMu0BK8qYjy/Fid/s5G2EaRa
	Vzlt0LWFI1pILdXLXw3Ar2VIZPO3JjpqJf4IFkee0+lY2JWJ5dgFRDACx14goYZ3aluWHamVK+J
	DrHA/h7tqPQZ4HTXFdG6u1527uoXaXMwZEnvSFd52JXcQltremV2GrEI47M69pHplDOQ7ZqORpr
	NKI7yTEywZ+CftMhIHi8yWqo8KOaAgg==
X-Received: by 2002:a05:7022:5f14:b0:144:de98:eec1 with SMTP id a92af1059eb24-1993571a23bmr6611996c88.11.1792946816216;
        Sun, 25 Oct 2026 09:46:56 -0700 (PDT)
X-Received: by 2002:a05:7022:5f14:b0:144:de98:eec1 with SMTP id a92af1059eb24-1993571a23bmr6611976c88.11.1792946815627;
        Sun, 25 Oct 2026 09:46:55 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.153.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm37712917c88.17.2026.10.25.09.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 09:46:55 -0700 (PDT)
Message-ID: <b5cc804e-0f73-4ec9-88bf-ef6dd04eea83@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 22:16:49 +0530
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
Subject: Re: [PATCH 0/5] Add support for a TEE agnostic Inline Crypto Engine
 service
To: Eric Biggers <ebiggers@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261024185602.GF2553@quark>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261024185602.GF2553@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDA2NiBTYWx0ZWRfX9TOcU+chqfNc
 VQAH8pJmvvYoYQVN7EwdneBv9TZVcnfBHq6WRPmx9vURLxsmOJWzDo0caWTdze73twCIpS3S5r1
 foMwOmzli5cRvViJf5cKZshOpJdB23KipgPALkXqz68a6Vx5qmFrg84Gk4F1XdXldmz+NpB1yYR
 zHJ6D/vMcv1x/jxrj0/nw5QQ0TQbbf77pvJ+tF6TOVz8KBHtiDsRK3g3qS+O9JdA9DD2vfgHzOO
 lFgAhRQ1OAQOPY+Xe0RuFaPRU/NHd0leb7+anCbtsLZ3xq7xE8Bqb1NrJZmPlZJJq96obCXjq7i
 9DKTlHob5db7yxPHH5tcd8oyPdZT3vk5T13LRMxNCigVQWgePjCLa66VqjEd3iPSpQJg2+K/Bsx
 /vPDSlyaBzTzu61/qTGibjPQ/heh54FcvpY/fmW4fa7E/qmc1TrracMD+Dsz4bDQcORZ8xisMXe
 zUV1uFtEkkXvkT/YZ4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDA2NiBTYWx0ZWRfX0D2OMP16jsBH
 8ZZf9vdRB238IccP+fq1k5wMH+aHsoBbz4Ys6xlkrGKDTZV2pjGH143EzkU94ohuNM8r/CpM/sd
 /dynYo/ZFN9u7k1ilWkEaSTdtpRIZ5E=
X-Proofpoint-ORIG-GUID: 6ERSeeC0o8f8Fp_WPOuYVdrpnlWInHh1
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6ade3281 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=hZ1hWxSZf3UX9FuxeSnJ0A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=P-IC7800AAAA:8 a=2OcuuN4x_lZ4hByzxpEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: 6ERSeeC0o8f8Fp_WPOuYVdrpnlWInHh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250066

Hi Eric,

On 25-10-2026 12:26 am, Eric Biggers wrote:
> On Wed, Oct 21, 2026 at 09:13:06PM +0530, Harshal Dev wrote:
>> This patch series adds a generic ICE service which provides TEE agnostic
>> APIs
> 
> There is already an ICE driver: drivers/soc/qcom/ice.c.  If it needs to
> do different things on different platforms, then it should be updated to
> do so.

Agreed, however this series does not intend to replace the ICE driver. It is
only meant to make the driver's calls into the ARM TEE firmware OS agnostic
of whether the platform boots with QTEE or OP-TEE. The ICE driver should not
do different things on different platforms, it should do exactly the same
things, however the TEE firmware calls should not be tied to QTEE as they
have been until now. 

> Adding a separate middleware module underneath it, with the ICE
> driver as its sole user, is unnecessary complexity that will just cause
> problems.
>

By moving the TEE call re-direction to a separate middleware we are ensuring
that we only touch the 9-10 lines in the driver which depend on the TEE firmware.
Merging this functionality in the ICE driver would substantially increases
the total file size.

> In fact the middleware module is called qcom_ice.ko, which is the exact
> same name as the ICE driver.  That's broken, as it's a name collision.

I agree with this point, I will re-name it to qcom_ice_tee_svc.ko, Hopefully
that will help with the name collision.

> I think the fact they have the same name hints pretty strongly that the
> functionality should just be incorporated into the existing qcom_ice.ko.
>

I beg to differ here. The ICE driver programs the non-secure hardware
interfaces of the ICE hardware. The ICE service this series introduces
re-directs ICE driver's calls into the TEE firmware to the correct firmware
booted on the platform. I believe these two are very orthogonal functionalities.
> AFAICT, this series also breaks boot on platforms without ICE firmware
> support, due to indefinite EPROBE_DEFER.  Choosing a simpler design
> would help avoid issues like that.

As per my understanding, all versions of the Qualcomm ICE hardware depend
on the TEE firmware to program certain aspects of the hardware. In-fact
a portion of the hardware interfaces of ICE are secure-software only
programmable. So we don't have any platform where ICE works without TEE
firmware support. This is why probe always defers if this check fails:
https://elixir.bootlin.com/linux/v7.3/source/drivers/soc/qcom/ice.c#L568

Appreciate your valuable time and suggestions here Eric. Do let me know if
any further thoughts.

Regards,
Harshal
> 
> - Eric

