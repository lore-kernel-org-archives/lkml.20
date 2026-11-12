Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794457822;
	b=WFGw2wadhWY/SKJTK3n3xgi/DPWo8zti/dDWMnGyrS+MCF2ftR0QaamMOdAhgUE1af2D
	 xkdUBP8eoJqrfxRL5PgA+fPPhYRgKBf8xZ68k/OOn03izPnBrV77MRoNtUa4+oXiBi/4J
	 CWjIHquGUbNrhbPoVmTQsxB7z5stZrgvpkMCcTKm8N6448DK9AL5wRIZbjg6KWyNVyAVe
	 AgbYHvveVRGlIrmq/uMGkDXv1Shi3ra5AnBNMj2HBOpMyldMAAr0Cb9kdpbqB0cJeAUIh
	 GIUo9BToxmsH3eKw0DaUKjzGBuitX9DhRwyHG42zOM6ccMvUVglhiqCK29dLJ1qBbCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794457822;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
	b=uBKCOJzDu14kG6n7GryWvpcEhrFlXyepC15phQrXHENLfPRuspZCwQyKydAlFUXRLQd6
	 aOKg+Hu1o9u8wS8QD1T1QPM4j8dBHbZbfLOFtt3JAQQ1wE/mMXSHhhvev2TRAwdzp/Hdb
	 teGWLnJpPQEDJ0VURjZ7MtIeZtVkDj6SgFVxIMHSBAjXC/5PqToQexHQyfiU8cXiiUyDS
	 ZagEBXpMYeyoiRfsSFYt4Z2Va3Naai38OQ48Yth0Hvc2KIRvScp6iOv81UgDRrIcjwfdq
	 NSmE33Fn+RBA6Ywy3vTU72Q9FopksSTqcMomi3baOdp9qWVwSxxE0Zbtr2Hywqy29Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pswg6HdD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgtBl6UU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A07F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A07F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pswg6HdD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgtBl6UU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZcVZ2135788
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=; b=pswg6HdD47FUDh52
	oBdstQdQmPzqZoDfnsLVUQkhDmuqumK9WAGLA0qD+js7fngSxDth9PNvL6KHjjzt
	sR6ppFEGfdpTKsX4bFQx2FWaNjaJ6aFty6JJRXbR48b4uds93geUlJVqadIXh52b
	mCmoM2BSvmeVsTtJxPIBS0KXz5oyWR3hSJ44pv4dFiA3gw3eFeN/s1zz0mSXLtXQ
	Lvmbh+H5CQIG+2zvxPF4ikFXpfYekR7UBzNDMeCuep+PBTMPcqiof7ganY4OIWpU
	n30ajMI8Ca7UgJxOdRpxlQalowv0ABEgPYDjZ00tv+nZG90cDYUwqcZ4dpybgmiQ
	rUEgxQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjuyp8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:30:20 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so4782658c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794457819; x=1795062619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
        b=XgtBl6UUE7fDhQp+6BhX9mz7rko1w0JN4FPddIWpj1WHAc6FRETmz3E3VX6ygIe9/2
         xsQ9p/rqNVtWZMxQLdu0LoT2Z68piTE4fdvhY4ODDS79hcscClEhoJgDSbI/V0Zizkod
         rqXQt1OFBxyMkWGuFer5B710euqDm49CfnxAGtlMg+HZLCvPbaMejFBm72V7VX41EZry
         Y3eAtuzNfMsMZal6b6RYw3Ern1lbRXfbPjtH849Gsa1ToPWz1RY3cf0+2jgBjsllaJXE
         RB7ogCpH3r365cEQKY9D+jEZl9PQC9HG/eopOVWFiVM1PQTB7lMFNEIB56Zzcwo6Xvz9
         GwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794457819; x=1795062619;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
        b=X9hgmEjfSYE9/v5oQY9AlXgj3RaUL0fm8grZ649kvMBf7LaJoO35ACxknxbGAHI+pG
         r0YrXz6R+hkCeGg6RNJnBGDFkU8DJuy7XtPRtYynv6p7Ndk6Ci4R4XP9TU/F7HCMGMW4
         TMzV0rpbSzuqQwSxsBIrN9VdAUwLMZVdtdkYSY7rcx8/DO2/wwdRcGdrF8b0kWRfspfB
         dvnZA/6su+zYJ1tIWdUg8eu8G029/WdorUYQ6qBe+WqE77Qynlqs5C0S6TXER47Rvy1P
         vBdIHDkWJQHwBGi6RAQv2kASCG0ZFyZOaSs9nKuwpGI7DteQDhcOb9L5wwJRkWlST+YV
         Blkg==
X-Gm-Message-State: APuU4Z86on6dzy5MTd/0WFzv5MS8+nWdSxhLnPcBDTlPybgDEfw7dFtT
	NFGKmuz2BqiDfP2wc94IheTdKrFzJ3ym/jFcArrazVAC4GIc04whIDl5fSze7Lw5i7MG8Z1/IUx
	ZvJ3z2qr8VGHhVJzG7Du4V1No03rWLibiNjUGFeEaLyCS9PiOUs/AuHIR4fZkpDNYUYQ=
X-Gm-Gg: AYBFou0oktN9V76eS3u6fD3SyJ8hzIGlLpU33XS1hPrUNOzwUz7lmXvM2JLAYWWmfJW
	UbSUM0ZYHqYIwKDnqv8oVQ5J8ZavXyhmo/f/g13K7lBq4Mbw8MeXCh4qzS8dMhxF1peDbF/vudu
	m9sMiQTRpE21hT4DmWEmQPkmrIPXS6A/vVV1txgXL5hfYUCdlwP3d2N0bLP5ROQehzIx6MH1KUC
	KBXTvHfTYJ83l/bTX4UpPMgI39i8bf5g+rd8WaJvoguaxRH18vZajRosWdS7R+13AQcxXJ68wri
	VuVMPvu8csZhpJCD3eXvWWXSj5GvErmh1MpOgZU3NL9VbvPa2jiPO9wXdrXnaTPh70pn4gikNsu
	EFlqd36lkBWxfET5iRosTk28+tAPjrSjx8nnJtp4iZKImSZV5YUUUDFQBfhiFVbhD7/JrQvo0sj
	OV6EgjqTGioYZzPTdh6ONkGM6UInY=
X-Received: by 2002:a05:7022:7f01:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b3c030f6e1mr4080450c88.23.1794457819073;
        Wed, 11 Nov 2026 20:30:19 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b3c030f6e1mr4080408c88.23.1794457818345;
        Wed, 11 Nov 2026 20:30:18 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm23163630c88.3.2026.11.11.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:30:18 -0800 (PST)
Date: Wed, 11 Nov 2026 20:30:03 -0800
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
Subject: Re: [PATCH v15 18/35] firmware: arm_scmi: Add Telemetry DataEvent
 read capabilities
Message-ID: <20261111203003.00007e46@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-19-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-19-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxNyBTYWx0ZWRfXzRgPQx1GwxvF
 XWTx25WAZ6eyzLKlbuT8q9LN7taMWlSgEb2nbxJrbetvKDO2SU2NLOJnbMC+8VHo21rJAcFnd26
 IznWjvOGDwwblSF5qJYTiP/KdiEj+Y5tF4d+vK+08193oShzIftn9vxeTMjIr4OohFbN1zL54Ac
 DSeg4jQesvCkdJJsPUMlo6ptHM5a4G9Ikbxc0Ao3n7jE3wYBARsmkTANuoX0tZvDjCzah1CRPCB
 WaGiyRudriSXN81fLVva0JEbcqOtLzL3iUr6ux+PWT9vMHyWN6X7kg/gtmN5P9z2M4o7R/kCVz0
 uFtB5xWx5JBrLFmsL5WL9/EFqsQ4xc1AWPgmyEYsKKippK6ysQKYrfWBTcNcGuRmEWY/6cCJqs7
 oZlikngu9fnpog7JdEpl9LDIKSZK1fZ7P/zKdL4jQEOjYgR8RPGsaT1wFpK3ZbXFTUTpu7hge/t
 tJscuP/U+R/lHD5lK5Q==
X-Proofpoint-ORIG-GUID: fD01jAAaozQ-KbNJY18urGo3X9Ou1-nB
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af540dc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=bWY2Rz8DxC4JnhDb7tQA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: fD01jAAaozQ-KbNJY18urGo3X9Ou1-nB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxNyBTYWx0ZWRfXwXwAbEBlOKWs
 KFD19IogSKow45JRnxPsTGncHB7qLOJqlCYlXPRGSdr0IwtWre5IbEZEe17pbQLYSj4QrvQk+ww
 COB2R5bCVrKxX/10CsjiurxGjFUO8mA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120017

On Mon,  9 Nov 2026 09:12:04 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for Telemetry operations needed to read DataEvent values and
> timestamps as single entities or all together in a single bulk buffer.
> The returned values are effectiely retrieved from the platform only
> when strictly needed, i.e. when no fresh recent cached value was already
> available.
> The DataEvent values are fetched transparently from the platform origins
> using the proper synchronization and consistency primitives, directly from
> the SHMTIs areas or the FastChannels memory depending on the configuration.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>


> +static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
> +					 int grp_id, unsigned int *num_samples,
> +					 struct scmi_telemetry_de_sample *samples)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_config_set *msg;
> +	struct scmi_xfer *t;
> +	bool is_group;
> +	u32 control;
> +	int ret;
> +
> +	if (!ti->info.enabled || !num_samples || !samples ||
> +	    !ti->info.single_read_support)

Trivial but I think if it's not supported we should return appropriate error
to indicate that rather than -EINVAL.

> +		return -EINVAL;
> +
