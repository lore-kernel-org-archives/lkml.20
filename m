Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350834;
	b=ktG5WxFM+rZMG+EzHPSmTF8J4pCmfju4sKuFOza1fRXeJ02ir7Tpl/7a0tNfoeT66UVF
	 1FTXFwNl7B/FSjJ54GI/m72mTTAH37xeCkEhcPESGDeTvB+jRcbmvRdOr7tX4e8N/uwfw
	 amPuYEr3o388N/sxySk2ktit4spc0mvJzjRGd36ekMsOGi5SC1g6OlIP2Fn69S/BKckmC
	 ocWuY0x4cRRQZxEA6n8PNRj9JSNoYQMg5vh5cGIrQ10tZzUDmJPm+fmwMo/6Y77qZ60i1
	 0emfQF6EUnKzAfvMLJmJymw3BzGnRy/rqqxrIFOKNC5Y/uTaCCVs+r7dQ79yQqBsmGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
	b=lqpaf6iH7EpmcHHwk8rE6fKHKq+3wYwF5dDEhCD2SQuFcvqeXKb3BlE9hlfugqFX9p8h
	 LwPVV++LNPmlLhyA9CbGEO+TFrTJtNFVTEN3b49cSsVCLw1TTV+QLjv2YQSvmdimCvBBv
	 lAfpzwA6mQ8deOYIYq7EaosOhgUfVsWTlqcnL99UJjMvJvdH/YJx9k4UpC6K/ao0XCiEK
	 7GwTXr3fX/HRxyQPTVIm5EFaM4QvpkmbXicJcXLOTw+UgXhUOQy0ozQIUKBVv77m7619I
	 EyJIefSMbjDw06HiCN5KoNU4WWPQOOn97nC8PgLGcANGgTXkFuNXv1r/QYxmdOV3yTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G312ZYHh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzQQBjM1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A1E606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59A1E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G312ZYHh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DzQQBjM1
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKZPF3715011
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=; b=G312ZYHhWJ4RA8TO
	ubEW2+HPOqqU/suRUSiYvGRhEfntYedSdH5+UJsj8eLDQE6J05QChMWhdxfOFUdx
	t+DBWN2mcezGVO9FPgjtPClqb3K5tDg8yQGdbbIT1c/qX6jfVMbtV/JFJJzbbJhm
	5GYQ7pMJJXXJf4uEFkfeVFHvsawvDkuLAQp3h/52waU09fb6+8qSB16W+oLk5j3g
	m5TJ9Pd3przbuBfHtdmIU9bLqB+Wt4wWOEDNch6vxRzFEbwmTaoaBBi25HQ2OmGo
	54Vd955tycZQfSgarFEjIV72YP/cwlczbFZjRApG/qFJUbyjUK8g7Wgcok7c5yl9
	bTkPnw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4b84q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:47:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3420554eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794350833; x=1794955633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
        b=DzQQBjM1q7kWmLebokVMHwKDR274PgLwA/CubPlmbhj3PbeM4xu/fs7J6oAB1gQj19
         +vfmZ6vvkAPui8n/fMzwerjxCR2BVPc+TXh3nc7X31vZ34jaSH5uy3z+B+f6RUQ3zLqd
         S4EZRPkoPVQ/iVLid8+XL46VP4OBGZ0Wfdgeny4GuJsZUP1BdHHlQoJ95110dB3TGucg
         qlooT4KZyAkqpc6vTxD2CDLMb8gIVyJouRHC1LrmBQ6kbDKWXgoFXwoya/v75hRFm3pV
         5NDZgC5l5Yw+GgqcWD9Pe3QmXfETHYbQ65/VRjgn+Ciqc7FwqzyuTuNVWgSCjF+M/VKb
         F3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350833; x=1794955633;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4W0ikGgFM9zKPD/Fw/OVvFAzJFp3P3xmCgp+1t1D+8=;
        b=DsJUVazjpyfC9M4sgc+Tq6ZinpiC6PszMXshXSW41F4KLLrjGOuQ2UlAIkRhhi8mK8
         rXQiygi5xYB8anfqxnAnPXxjmc3ASN4klUIv9Cs6KFVnnWnzOx1CZxsAqij+Eav8rCKK
         NOAHJx//k3CeuxZMtdkHp1cp2DR2P6863gRWqMT2RbppFDGazuKdCHrmaKtaoA385nAX
         FcgeyTBLl4AgSHEK9DzdN1GCFcFXnMlH6S7qIjrKXR97A1x9k1KyDEoJWlfEEUk8+B9m
         ppb11H29NA/DuncTPr8O19jaxCJ0uInxVSSVQWjdRvU0NLA1GN4iLGW4llIb5cs1czNM
         0g9A==
X-Gm-Message-State: APuU4Z8E+xrUNNgBynPWX2ccr0a7jtNgmOCNmrGVgYFovXQosdsF0RTZ
	baICvtNlK5YwhZHYhRtyHZYKLE3WUNRxM1pTRrkRlExo5OqHlIi+E3C+K7oIg11ME04q2R55Baw
	3xUs/BVE6l8c5hrecUvt3qJPoRT0d19oqoUq2fgWDWQ87vSq3PxtgNB8QncuHeGbUwWE=
X-Gm-Gg: AYBFou2MfQd/8lmLX3nglrXv05+mgwB3Xe/g4HnFtQU13IE/lkDkXTy0wV3UBC4sWUp
	XZzmpPIX7V2VPSOMhCJZY5uVuAcQn6X4La0KHcLgbvSDb8cAKFiL0PSvF2Avt0NUdccQ3tXj48w
	9GznpcopJdq21pTM3YpILHkykC8Qffrn9eTLumFWAPAeqQV9d9/qN16VjuPzWECMfJanNgGpTg7
	mUfrp5/z0G/0cMcluFJ3W5UquCcYveqjrz5Vo2VB8+IPNrSsIPNvULKs3QY63FWHPWeOMSANzvH
	nxs8UvF0grvDFZ0OSrkAMTcwgC1HP/ET5huFpwPhhOAX+hMGxdYg0y8WkaM1fdCNTsSDa8E0FuK
	023/PsAlEu5QARfyzL8E39tv9Gse9zq//RbXlfjvGlIY6dvY/ADi0nExBkUtrZnJjReuam2ecJ2
	me8drCLXIElac4XLeexRp/YRkgOOI=
X-Received: by 2002:a05:7300:cb13:b0:376:7cda:a103 with SMTP id 5a478bee46e88-37686d30378mr1356746eec.32.1794350832592;
        Tue, 10 Nov 2026 14:47:12 -0800 (PST)
X-Received: by 2002:a05:7300:cb13:b0:376:7cda:a103 with SMTP id 5a478bee46e88-37686d30378mr1356702eec.32.1794350832037;
        Tue, 10 Nov 2026 14:47:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm9820360eec.5.2026.11.10.14.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:47:11 -0800 (PST)
Date: Tue, 10 Nov 2026 14:46:35 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 23/35] firmware: arm_scmi: Add Telemetry generation
 counter event
Message-ID: <20261110144635.00005964@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-24-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-24-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfXzJY+iGDBqA9N
 Upz2Fg4vxCHibDVqqwEStOLE+WCn8Px5XYixnGvo47EeZOdPdw2ACp34LMq+lXYE1KvhAAoHAZU
 XyLDQVEDmmezWsJIc1Xm6+R9eopXND5uLp0wp4lxb7Pjr0qqfzDN2GmKmA+N5L6MPqB6ibQnh6x
 /dh+LBc3dc/c6mflLFq7J3GHHT/SVn4DaUgaBvE3nor5RwLmj0NLkHX8+FZgKedj/fEY+OKklvm
 uAmGJpSxvPmPkA0dSZrbR/ZXoQxboI+9V38M1bV2ta/kFDWgewWOCxTK7g7HmjPRbZrDO/I+SHP
 L8u/zI6hg3OC5tvrfzytambe9PPf0Q6/fbvMHkKYWCludv2GsrzQRWfcmLAYWGYUD7VJ6KKuMwU
 tLb8M58nYA+UGYJLieQZR5WarmANlHmJPxUgdsYxO/ry1D+gLnZETYSBoCObVEcaRTA5DBd/ZRZ
 IxxQGQ1aX6Eq+iI90mw==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af39ef1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=C8gR6w-PNCreNn7I4OwA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfXy+cA1BhUJKYr
 nKj9Hu/++kq9fzDIRPkeMgZXh3RWiuvtbsCNRg9MyTXuhealQ9OPGQGUfFIzywmQWttTMR9z39D
 Git4GmF3M6hgkQ3zKyoEaua+bgIEVCc=
X-Proofpoint-GUID: xx2PMy7M89EG_tHTy4rz12bhI43yTICt
X-Proofpoint-ORIG-GUID: xx2PMy7M89EG_tHTy4rz12bhI43yTICt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100090

On Mon,  9 Nov 2026 09:12:09 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a per-instance generation counter to track configuration changes which
> uses the common telemetry events framework.
Why?  What's the usecase for this?
Needs some more information or I'd leave it for now.

> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - do NOT reset generation on RESET
> v12 --> v13
>  - update generation counter on do_xfer succcess even if failing to process
>    response since the change hass been applied: this avoids state misalignment
> v11 -->v12
>  - reviewed generation counter update logic
> v6 --> v7
>  - use new Generic event mechanism based on EventFD instead of WaitQ
> v5 --> v6
>  - add relese semantic to the atomic set of the generation counter
>  - use new eventfd_ctx common event logic
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 46 ++++++++++++++++++++++++++-
>  include/linux/scmi_protocol.h         |  6 ++--
>  2 files changed, 49 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index ba17204bbfc4..c21700bd1b43 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index af882c1e4ea4..585eb3a4684e 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h

>  struct scmi_telemetry_de_sample {
> @@ -1003,7 +1005,7 @@ struct scmi_telemetry_de_sample {
>  };
>  
>  enum scmi_telemetry_event {
> -	SCMI_TLM_EVT_DUMMY,
> +	SCMI_TLM_EVT_GENERATION,
>  	SCMI_TLM_EVT_MAX,
>  };
>  
> @@ -1030,11 +1032,11 @@ enum scmi_telemetry_event {
>   *		    the ones belonging to a specific group when provided.
>   *		    This causes an immediate update platform-side of all the
>   *		    enabled DEs.
> - * @reset: reset configuration and telemetry data.
>   * @event_subscribe: subscribe to the specified event @type using the provided
>   *		     @eventfd_ctx.
>   * @event_unsubscribe: unsubscribe to the specified event @type the previously
>   *		       registered @eventfd_ctx.
> + * @reset: reset configuration and telemetry data.

Unrelated change.  Belongs in previous patch.

>   */
>  struct scmi_telemetry_proto_ops {
>  	const struct scmi_telemetry_info *(*info_get)

