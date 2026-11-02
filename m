Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622409;
	b=JAiakBVXfHdyOEebTUnAZLvjnn94UgvvQ87+8GYfNfDHD1sU1kSb8D6Q3IoRIawgIFQZ
	 2eTacmhKAltpPI4TwBpt3eWW5p24Rs5VEU21Ft099SUntcd4L7NcmpFutdGjoI4MX5yMB
	 hVZ3d53aeHm970m0ht/Ejt9VrXBzCg/CZAZZTw5qN3icwpV1Mazj7wzyStkpTAaZ2/SSM
	 ub0yVIX3UNMD2x82hzMpSNb+o2kCiCIfAkoehtQZP5dO0nVGceMiwfgG0lhlLHXhZiuyk
	 FxrotTOHp6GjIuG1WbAbyutb9uSK7uLGegbWs/st1nDcXhvfa0AKwuh5zg0zvUMdCfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Lr8wxNz53gjidnft/ui9bDD2OfQ6pl9HcEvNDFeHwIA=;
	b=D9q1q2+s/tQv36v41hJLF1XzKuzFxnx94jlJZIf/SM3pEHrssYy4dbPWHMzEYvK7LsH2
	 RdYopJVpSQ6he3hbTqqm2v3eu58R73khMLFtSvPrGSJddnb2DPevDPFT8r8G/DC7n7+wX
	 QrgR/bTHGySYO7D4GY5j0pqQe0BU21brFUbApfNVQy832LKNK1bC/kMNrP8QN5OlJNg3l
	 sEcZgu69nVlcVdYYh/hlqOjpQyCY8HlbWzPd2x1MZAmFvHL2k5mym9BDX5aMYvOOBerxU
	 PbhTlCwWmHx/aKF012LmqTuYvhe7QLp6YHXzLVMgMr9karmlMSG56f2g+59GJL8eg9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7NoyQdo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6eq3mSu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E399606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E399606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I7NoyQdo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K6eq3mSu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMeS1821156
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lr8wxNz53gjidnft/ui9bDD2OfQ6pl9HcEvNDFeHwIA=; b=I7NoyQdoGVMJ/qAt
	/wzcBtF0syYg1aWjuYZvoFGr5Phw5ZLLgoTsqWA20MQki1et5biLMXS8FUpJxM1g
	mMS+HSzyHTafD+y3JhgnYnsd+5+v4xirzvgc+zWOIXXGbqRJkwlVwnhJGyxXzXe2
	yW9ZbcvRFL2g/n8XiC6+4P0mC95Cm34FfzMnp11u3hgFNabEuP728AwYMlqyU3hz
	HOfGNSoECgRq3p8lO99iB7QAWe5euFjQMl30ZPZwb3fOllXpV8V4+sgJgQ2Ia7Ob
	zow60SUFddUMxYARXYQN+tUuzvPW5WGbDvr3Up+pBB3Wp0Zidk8yoXtSM07IlYR+
	sRl6YA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hn2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:26:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso4790671cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793622407; x=1794227207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lr8wxNz53gjidnft/ui9bDD2OfQ6pl9HcEvNDFeHwIA=;
        b=K6eq3mSuXhakRBHfUALOSGGPUsv1avxDwIXMr59TOvipAjI0fhOytAyrnPGvCAVtdP
         GdRpOMLsNrHL89ZdiLFBDgz0krx/kW2163XusFK3PJJAcmzqJE+NgOV3BjIRWhDjdnOj
         TbD7+SFaUHjKJND04YjANi5HFQu4KV7zmTCTSVA+6mTGvdSxtX2CStdAMPYSvI+gN9uE
         37NqbBRyJaKPJCPC1qne2jxVWarLwqRZ6y1LqcK3bRdXVrcL2wvHzvGFXxGoFQMjCE5N
         O1EAnOj73pStd4UXPo96qGqU1u0dgfuA+V6TbkvdHFkFrEqOVaLGXD116oimLdrbTaQG
         0TGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622407; x=1794227207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lr8wxNz53gjidnft/ui9bDD2OfQ6pl9HcEvNDFeHwIA=;
        b=ZWv08+IAtik8emThWHPUHE5cBk7y1tEpd7PIlTMUuukkR3j+OLenql0QLdYdghU4p6
         ls65hp0ic7UL0U7lu4WCAd0ldo8RX0gdHEDa4w+7skREIMurLfGKQ+GEyuarV3GQ3f++
         h/WaIvhFpnKyzYUMYykvMHSQJXffLqtyLGy7OSAwHvjpCRTZEi2uiHuhcaS9BxqwRTCu
         22UNz+EXNxuM5mvrCYl25Re7B+lCWdNSo+igtop4Jt1B+brpsLWsa8ihqeWNmW3aszvX
         5TVoY0ozQlEQE01h+LcTnttsy9dFwt8QDCLqqIM6GeVTr94Fl//PVdvku4DnkPemJZFd
         O+rQ==
X-Forwarded-Encrypted: i=1; AKwUvBybHDiTVNZ3Air8oREHDWNU1KXlSNITSWHatsSsdQQIqX8SiEgoMksWepAEtsh0K9ZYoa8CW2UfCn8GsZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aX3n0MM4JyqLIaYQF1Trkxcxp+yo7ZbjYmpW7jIVcfyw/SBrH
	nedeY3gG6fksb7UCDKy5O9Ko4TV3V/W9HBfQHDV/pZRYzSnt8vesM7pIGWOgJ4eimddDPy6yaWc
	eqdweaOs/204+L+ehKxc0Tqn4CSK/p1jEMgZ7sROqWqU5F2tdhW5LfscHT8rCl0SxWFdFS+cgKn
	A=
X-Gm-Gg: AYBFou31mSBrInUUdKncUc3HbRuPMjaA7SKDO2KisNYhmQtZjJaPjYA3mYCWf+USoxR
	TrGNiKX+Dl2dv4WLI983QryQegyuI4obijc6u7Uw1vHz60QK4ihhmssPFNAOVtkwAFRuIR1mk3T
	R5EuVrZiYBzElN+NELOKisqncUL/NtGvi54vfuwAhP5/bJC2MZc20irWcWyr0Jf5lVh8ZowsmB0
	gK5cfECWpq18CyaA5nZ3CsZPVtBwCBmiZE+1AWQyRRtMZvHIZOVXgok0rITBQ/Q4hy/mr6ztzQ1
	DXIDKDV0oKNQvuv7+IHwNzJBlVNpu47VGTzR5/9rP7WHRO4VaTeFtHc4/dl7/XmzFGZz2VXPfYT
	i3KTJExkT+UvjVq7RA+J5p3U0CyW5Hss71D/Ho4AdyM2EZ53mAqFIYmjeACs4BseMHFDQ5aU=
X-Received: by 2002:a05:622a:e0c7:20b0:51c:2324:666 with SMTP id d75a77b69052e-542b687da82mr163915161cf.3.1793622407175;
        Mon, 02 Nov 2026 04:26:47 -0800 (PST)
X-Received: by 2002:a05:622a:e0c7:20b0:51c:2324:666 with SMTP id d75a77b69052e-542b687da82mr163914731cf.3.1793622406580;
        Mon, 02 Nov 2026 04:26:46 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07551e2sm1578902e87.84.2026.11.02.04.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:26:45 -0800 (PST)
Message-ID: <60afa31c-0c68-4e77-81b7-ef78f987f429@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:26:43 +0100
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
Subject: Re: [RFC PATCH 1/2] firmware: qcom: scm: Add QSEECOM app loading and
 shutdown
To: Haozhen Li <dezige131@foxmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        =?UTF-8?Q?Dawid_Wr=C3=B3bel?=
 <me@dawidwrobel.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261101160110.3622-1-dezige131@foxmail.com>
 <tencent_1E7A74EBC425C78E07DED39F31807B7E1D0A@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_1E7A74EBC425C78E07DED39F31807B7E1D0A@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UNeNTSJnHHuvi3qQKTasQjAdQ-Ae4cSG
X-Proofpoint-GUID: UNeNTSJnHHuvi3qQKTasQjAdQ-Ae4cSG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfX/41W8he1CZjl
 qtbVfrTHpVjnUaHtxKwxQFPE1yv/+vTWHiHR8Vc/B7jxCsXIbvEyRdtQiYxiDJEhh8x97Kp9fEl
 qpj1pePTgOKS9TG0eLculGYaBuODp+E=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae88188 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=X-gXLV8O-kk81oobTu8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OSBTYWx0ZWRfXy+oB5Zl2eKu+
 DylfviGq0O/NEN+tFHEa2yXr67OTqlPjoQ0jVjgVbp9ywV7Xvc+Ad7xotco+7oOr7ft/7u27wb+
 diQcHe+1gjHGlbMQq+JEEMSyMHr2FTKFTuk+RpAuXuWnqNci6Xukb+k4KqialXtD3dhr+ybqgYS
 gYR5IhqzriESrY960SV0F88cHTlohTQIFK9HHaPdF9GzulJdegtlioSyr2UHCe1rtVv9pngIs7C
 /XFKoXU8Dpw0aG+9PRhuK2AXtcA7Y4B8q43ho50vI6G7yRnHcvwT35TOfc+aXICFqVlhM/kR2z8
 TBNTdxk58r47E2U8xS43X+b351kK01SJWvGZdcR1BqlKtn2CnZTO1uXz0f4G7G+bGqCGNRlVpDN
 zbq+2UowJFLQU5jmLlQ74YYc8QvK0mpAYF8wYVwVpu2VpVnBXwHCpTJI9Q3Tn4Ux7PaeL4ERnAa
 O8vgfB5CENHFS1MRoEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020049

On 11/1/26 5:01 PM, Haozhen Li wrote:
> QSEECOM clients in the kernel can currently only talk to trusted
> applications that some earlier boot stage happened to load:
> qcom_scm_qseecom_app_get_id() looks an app up and
> qcom_scm_qseecom_app_send() talks to it, but nothing lets Linux start
> one itself.

Adding some relevant folks to Cc for awareness

[...]

> + * The image buffer must lie entirely below the 4 GiB physical mark: QTEE
> + * reads the image address as a 32-bit value even under the 64-bit SMC
> + * calling convention, so a buffer above it would be truncated into a wrong
> + * address. Such buffers are rejected here rather than passed on.

I think that only holds for certain versions

> + *
> + * Return: Zero on success, nonzero on failure.
> + */
> +int qcom_scm_qseecom_app_load(void *img, size_t mdt_len, size_t img_len,
> +			      u32 *app_id)
> +{
> +	phys_addr_t img_phys;
> +	struct qcom_scm_qseecom_resp res = {};
> +	struct qcom_scm_desc desc = {};
> +	int status;

nit: please use reverse-Christmas-tree sorting

[...]

> +	/* See the comment on the 4 GiB limit in the function doc above. */
> +	if (upper_32_bits(img_phys) || (u64)img_phys + img_len > SZ_4G) {

This can overflow on 32b archs, do `|| img_len > SZ_4G - img_phys` instead
(also below)

Konrad
