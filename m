Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351720;
	b=1YRXKt+y/moa8Ij6pYRWR56sHquc58Zzm/u8BlAQOu2AZQ9hE1RYI+PNOAiALH+/gP4I
	 sxOIw3ogAd3LZZ8hZKpd8O7ECd8eN046Nx23sfScSi5GS6u5lKkh/ub2bCOkJC7c/7clg
	 UvjvDwBKEe26KHcg4Ya/Nfc7GAVpiHug9YTTh1bT+c9SbTs11Wd3x9QRAfD5YkoOY2Lm1
	 zHmAGnbRm3cbfrtqgoZp7xGuQLyVG7b5w/k/sxV3NUdWYuT2zQhxTO8RSJSB21uebPeNe
	 5fGl3LKvU/XTPB9Y0QQCjOXT25F7o7dtB+YV39pXx9LHvVTUg9DnXj9kSQKce2WRC+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351720;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=;
	b=GRifPdiCtIoZ3jumSqUP0RRum+U8D4yTHxKSu4mQpuDBB/oOgUYedobQsGm7OX2kotJz
	 t39xJQCUA/rmapWGQrifsVl3aiJBIhNiZ7ts4YFwIO2P/boDBaTgjJEW+olMiZYSoTjlx
	 f8Ukkp2RLR4WS0TsielYO6KibqzSfzqlTn169GeH3WUqnWyl2i9lIU/mSxDoq1blvljQl
	 1LI9hPFlj+PdN00t+42e3p/Wus0WBqJm617uzRuYn89irCZ2cL9G4Mz9+C/euGqY1ejF3
	 lHx/PV7KWAJoy8VuHO7b/S+upIgUv806KwsMkldFPWFvVl7Miy+1OWnrptqJ1g64xQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GsfkK6HN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J3d8BM2T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41753606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41753606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GsfkK6HN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J3d8BM2T
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKKQY3714340
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=; b=GsfkK6HNGbcHCfa1
	KfU1R0dcCTCdE2EVDwx4d767g1MGETijAE0LOpY5jU1I6jk1f2oiM+FT7GSLSAEh
	jPr85T/ME9YsWHiUx5Ta8628FoLd8o1u+mAtGQD+hWEIbs8XMJ4vzurJ5olSaT2G
	tvtbGu1h3xmOP61sHC01yj/xR0MhHZXX+6PHaTBZ0acB4FeczGO6/brYmgvAOv46
	RA8h7TZ8WOgOfLHb3zRccAsPm+bSxAEhEzMmCIpbNKycqul5io3/w0AJ4JyGzWL/
	WJnYmZLgvA6Q46doauKWVEuO9UokSIIC71bsyAGHZhXTGzw6iPSmVOJeMUYSLDFq
	mTmwiw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4b9ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:01:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso2092374c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351718; x=1794956518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=;
        b=J3d8BM2Tv2J5sQIF7LdX0nCC90OxoAMeakc6Pdhi/nirdqQP9KQrk2jCrgl4tS1230
         0pNqjGi2JgoT4sYT9f04RXIJKkGaVB5NS444Tuki/3RM4FVwyshC3JmVRW5GgWrpF94T
         31f37oYr2dGR9rB5fo22U7CBHxpyUOe9QqhkEUcqEZq2WhM3nJqiGyn11ClZ7Ta2YVxS
         XVGC989znbeWmwSAboLrfS6Bj8Np4HaBya30IbK5PjekoxVsS4TaXwd8UT8Nr+8knEIg
         3nnPKkZTjf3pQUDVAByggV7p98eoCEVzKNXRc/nY3QxoKkrCy1jYnv42kLUtsWZ5oLHt
         V8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351718; x=1794956518;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=;
        b=ox58u+2Uouzs/44X3H4VN+oY86rD+6MPUJJ/8eb4clXUZ9X8g5aFefYnjJdOBGhQV0
         eDnLUpuRo9xdkFNBJhvMja+bEPEehawoYLrujRM9KdVLpEcxd/Uhp9D/EXNNcTzpN/T5
         qt6CNT01v7RKrnHbhaEFGNnQZKWto3G4pDvyZLkbhEBc5ETb9cCxh1RY8L4cJD/Utru5
         ITUoTYQaKtakG7gtBhkwfj2+uxWbtqm9cVRXtytWjXogURv27993Nkd51LSGMRmUfbVw
         zfff0ARrpSOj6OjIvkr5OFh/nImneC/pGdbx69oRFEJHexjNRdIw2GhD18RTPdOitROB
         hLgA==
X-Gm-Message-State: APuU4Z/hyi7/St+taQV7b1P/4kGSXTIUWzO5L54npxMuC/HFHAQMqwnp
	K7lU6i3kz3Asl6frXB3OqWM3Ofs6MnyZY51ILml4WpgfnZt6naWKBV/lQcBZWMRSkBVOSlHQ/Fj
	bc8v9PzAmipRg6tuZIjbrsYw/9Brz8C1pRb1uZi2T+2smHg+vIOkSG51MPoojOwAAb1M=
X-Gm-Gg: AYBFou3ztt3p33lARcVNsIOLeoiTRrQX+R86uJNfrJGd5RvmHHr5aZgUo/VAI4wzSGs
	Xroep5S6UayFm46v6Fgqp4AHcFE9wgHs2dqV5gtAnPExJE6qEo/nYYBriWyut+ZHRZ1BV8BmhYG
	TFkKju7Syt/7WdSlj6WU6DY5BOLMU8KAarDWS7i6QqGTK996yRXe6qk0+cCQspVABxkiBWhyHZj
	QYLJ6kq9hGLJFjkdNE4j908xgF5L9gs45/3lWTg+qS8DJpYPHRhcCP6hNHeOS7tI13hVwv5zsXS
	xd5LfMDYJSpHfHYucq1BtZpUmgdbyivTWt71if3RJHsntcJBPesnZYzj8fCIyAyY/1Q5cpJX6WA
	G7IeUcMCJbAa/5c+pjQi7JNLznK4QVvkCw1rM8CkxVxG8pWZbeKp/0xQAnwcuag8AEYM7FZApKm
	McTBROccwo0lATLPlpG8qeBPsIthQ=
X-Received: by 2002:a05:7022:287:10b0:195:9228:50a0 with SMTP id a92af1059eb24-1b3c035325fmr481383c88.42.1794351717612;
        Tue, 10 Nov 2026 15:01:57 -0800 (PST)
X-Received: by 2002:a05:7022:287:10b0:195:9228:50a0 with SMTP id a92af1059eb24-1b3c035325fmr481344c88.42.1794351716979;
        Tue, 10 Nov 2026 15:01:56 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm13944465c88.5.2026.11.10.15.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:01:56 -0800 (PST)
Date: Tue, 10 Nov 2026 15:01:21 -0800
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
Subject: Re: [PATCH v15 28/35] firmware: arm_scmi: Add un-managed methods to
 get/put protocols operations
Message-ID: <20261110150121.00000c6b@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-29-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-29-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfXwJ26IKCeYv3u
 CH7Kdu8JZK5+zGJA/Adr7LdoLlZhqo3XKNeQfylkDEZtwOdOjgxaT23zYaHlUGwQ924VSVRDqxg
 a5ampOyxZi/dlwG84ALrmgQIziK517QrICz1hLTuSdgdGb5oOuFmbc1XrBqilL1Qg2XRE4SgHNZ
 Gs/md8KX5TWXTjUK8rBLMRlpAk+9qx13VbVvVJn5JXq6nle3GwfEVHUw08bK4NCT6SLL6ZsXr6T
 svDXbK6r/7fRTxBCsinJx5HMKH2k/rxCOA6bdp/CvPGUKO9ZE75GlnwkOy6bC5m1GRRdBebX3d1
 qQTkXR5O/KzWZGScZYWinYUOWfxiAJPz7TtHPVxy5qcs62sIT1ElPR73ktrXFL88L3YAQbkWn6I
 sNc4TEFPv/o7EdnaMFk+6nkzNGxDXqX1LnVjLSmeq3RL981ybRLuhG+Ipc1WwPOir65nT6upQQp
 sclcvdn34zQMO/+Vi6w==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3a266 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=JB04BPaodQz_QRRZ9pYA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX1X4K2I391ZK2
 9YQFE3N6ZIEFdRYGaRpA19RFNCt1xChaH9F5hMcbnaR9KsyiLKOdY5AC6hvs5VaXMz0NtM7U407
 UWhlSDQ55rHDerSFjTA5YQtsiCujcYY=
X-Proofpoint-GUID: iUJLLuqtvaeaGUke_YuU7hRzcA-aYxbF
X-Proofpoint-ORIG-GUID: iUJLLuqtvaeaGUke_YuU7hRzcA-aYxbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091

On Mon,  9 Nov 2026 09:12:14 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a couple of simple common methods to be able to manually get and put
> protocol operations to address situation in which devres managed methods
> cannot be used.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>


>  /**
>   * scmi_devm_protocol_acquire  - Devres managed helper to get hold of a protocol
>   * @sdev: A reference to an scmi_device whose embedded struct device is to
> @@ -2697,6 +2722,18 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
>  	WARN_ON(ret);
>  }
>  
> +/**
> + * scmi_protocol_operations_put  - UnManaged put protocol operations

Bonus space after -

> + *
> + * @handle: A reference to the SCMI platform instance.
> + * @protocol_id: The protocol being released.
> + */
> +static void scmi_protocol_operations_put(const struct scmi_handle *handle,
> +					 u8 protocol_id)
> +{
> +	scmi_protocol_release(handle, protocol_id);
> +}
> +

