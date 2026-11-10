Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348483;
	b=XpZWgJ4w5IFLlaOk13AZCwoQtiuDZJTOIVA4JLrmP69bM57aYJsXNGMfLldPuygofSPo
	 HPXPeLuO3wzCRKRrJqfkNZyrYF0jckkbnyLCJacZS6N6RvF3w8Rmn/dLZfQM9/AyFHQyL
	 MUZWt0sEsYEadaXjTI4EKDFZsGLuWDqHEeeTVsKKXHPo/utp3672fDaa68Wx4aeV1zsEM
	 tfqShW+DDvvgavoshOFRGBJ+zUROtfh6RSExx3fl+exBIUb6yif0fsJ+HR7lw+xCyjalH
	 MjCfMl9sTEpDEZBXEOLyUw/hb4FjpEISXkJiKzfFOK8CuFYT5i1EpaYw2W6z+ojgWbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=;
	b=SsD2ITAZcj4EuefPgQ2XExVZ8/arcFyfzGim0cQXFlsbvNzJ+/lnVLTMfvw7CxZmGybf
	 clxCdsT/BOrL4WGdWTAllcyh1wG+MNuZA4ICbKsgaUZTPaIPQu7rmImF6/okuNroiYYY3
	 4aClAk5jKwSDB+BVCZOVR2CPqDK5FIu6rPTMS3PTJFVlywN8/sMtSqTaxeD6v8Ag3NunB
	 iBxen0PbCZxo1WLZQMAZA4pH/atEZQw7/0lrQ2LNdhPcGWwXZ/CpqAsWz9fhydhBbdUqO
	 RxGxoKNXHUMPKpcE1K1n5sR9cFC9Eh1LIIYq6zL+iPVZJci7UnEIGSRrxSUKm2ksKpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c86qyAqV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMQplxDZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A24F606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A24F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c86qyAqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMQplxDZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAJHOtL721326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=; b=c86qyAqVEQjKRFe5
	Er8KYOzZEgLoic6DIf0SBwpxaNoz94s9EcCc1yjf4dBrtW8TSccPKpcC1gPh4D9j
	k4Su05jYX00KVsMK0jN5Ls0pJvk76SDxOQsx2Ifnqi72HfXTJj4z0L2UM8r7buUa
	34Zsg7bZOzgePJMUK2BEtXIL6mxVahb0YbU3huvR4L8iWrbjZZ4ysH8VR4oKkYLf
	GAQn7SdP5iL+PwtMZR8KhY07k6yTjF3I80Y5w7qPLbjGxgOgSe13wC43l3zvT7ye
	6dly1MOnE9JFQhlpHOruTcaixz6BzWAc2LLekoZW+Z7VOACVqEoYVCFlmVTEd4hR
	gCBYnA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97c8p07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36de26cb4b3so3367362eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794348480; x=1794953280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=;
        b=VMQplxDZk6oCIhFEWtnJ1FTA3cnZnzA4Cku4/GN3KpNtm72HUpfQbQgM4s52jxr7Zt
         e52otrMCwZ+D8+QWiMBY+AvdQaU0aB+FGTP1djAhiMofZjNkAH+nEJSTwq4TYhxxXkdq
         e0C0xtEVdUNRu5/1s4wFG383AxpmnimOC3UiwUfX107ItnQ1GYYvyeTn7LU0aXcVRscW
         FXwLDaqzTkt5lQ9DPdsPd1WD7db7fgne7C0lwqhUrUCswujEjp4v712HVNBH/OKYZKiY
         Xwt9o84pJj2qQFMgn7Wfbk+n7RH5Cp/WsB/f1LrVrE0u2a0nokFa+8eFsF+Co+NFeV6M
         JFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348480; x=1794953280;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wFJ1R7uPrqqY5P5JMzwjD2OI5yMoWBhA9w+CZfdg8y8=;
        b=J5t7T3x8NuUpXvF/Gnnki0C9+8foSqQFrM8uwPmIMub30moyZGNuce7ql2ya5ngQXR
         IpVA3vURxMwAPUMCgBNptKPIG2PU8N5EnNngal8fZFFkkg8/iwRxVCRgQvZkIiVC5loO
         rJEOSAiNyaXBpVSFhxSAeNSbeSHMzKFIRAdbbepB+Ci23JLOXTD7k3Q84XFuRFvNUTrP
         CuhNV0hjfu94QflkB9IK45eS/r5/GUBjGl8G9Li7OCr9taF2gkX/V8YkgoZPEX4mZ3sG
         q24S+XG/iK7NUw2kBnftH3K2HFjuxZHmDZM8CnbVZlx5vq7pQgwDp6U97nJec8Uide3H
         7WRw==
X-Gm-Message-State: APuU4Z+6fuOOiZTHl5ptdYUt2oIn8ce8lpjJSWRwwQv5tSj/A6zbkEkR
	uqJQi/KznsfLkxvhafZfOQpamzA4IzLEXIDJPOL4tnurdQRJV8t1briTNrusvhvyznWdIugvrzE
	byZ7NBUulOCe1G0wN9YE8gIoxhJH4w69a6mTtx60r084XPBFN/rwXzIssgd4cyt+gZsU=
X-Gm-Gg: AYBFou1ZF3AZb/0M22b1UDrMPLfuhoS9HDj0IPrNRMFZ05k6wrM1x9bY9FacLbrNZYg
	JXhevvFUQtq2AKo3Zn1AfNWJAqU+DVVafsOOVcpT2FpSt7dLEFeftZwyBchnzD+P1bn8yyxWE3F
	fv4sRcZiaSVpkHXecGqCbLDgCK3WpXqlcufd/lsj9JQkx7dtmYdUZ8iE7qpDUiIES7fJLBT2+zs
	TgaRhouaHDIMYxS2SGhfnCXbG3eJN1VofiCQ/Q4z5bl97fzPJAMNibcC3N+okeJFxAcKojHWmRQ
	72t3XVpzlnyp9T0EFtM5xyG2o6GYo44vkxQd1V388NFWT3lZN+8RLYMtQ75fqJfssw1NcLjUHUQ
	CwCxGyQ8LQuYoTEltvQCqn3B9AiE64pMVHsbBV7u2j8b2pziq/yZuexkFs9qgkONYPetKstVznJ
	rmLhLnCUi/W/2k4QTvSSnX0pTZFzua
X-Received: by 2002:a05:7300:ea0d:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37686174a2bmr904357eec.17.1794348479613;
        Tue, 10 Nov 2026 14:07:59 -0800 (PST)
X-Received: by 2002:a05:7300:ea0d:b0:36d:e4c8:8f04 with SMTP id 5a478bee46e88-37686174a2bmr904303eec.17.1794348478722;
        Tue, 10 Nov 2026 14:07:58 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm10250365eec.27.2026.11.10.14.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:07:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:07:39 -0800
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
Subject: Re: [PATCH v15 19/35] firmware: arm_scmi: Add Telemetry reset logic
Message-ID: <20261110140739.000026c1@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-20-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-20-cristian.marussi@arm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX5KYNeBk+L0wW
 R/TvECdtBy/LYgRWrkPYfX0XVjQU8lgL7201sZyCrMASMQunm7PTZqEQGn0762x6GO0fro1VF2U
 5biNnMjqd1pSmzVbRr6YuNn6rf0nVYHUMaBfN7paiTztNoMn2Qz1pnbdvKuU7Lk/z3STr50WZCH
 drgDJvNG7xUrTptKMCH3UV6Zt0BWHGoTR233YesOeUKO124N+uW1B+co/DoNkvuS/sF8rn34y42
 qKAz4I8riEwalN3Q7/cSjGGDS2DFMcXdC7lIGpqRzCTQi8wcH+d/YjS0oFOqssBKWlXhKOQrhvL
 V8TAqWhyu9PBYmGN4UxlfSezwYBuWzjKZ7/J2WNM2z9g3xiWd0gHOMRcpWwzbrfnFBnvU3q/E5g
 wznmEKWzmPIoyun+mL9InW23o44TaqPO7Wy2soOeIIlOGneGW/qaV8EwrC4XuTwsvOgd+4V3BMv
 PfuYH5L9WdXTSsDQJEw==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af395c0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=ejotlmTCnjgNnXibSUUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: skgK7VD0jUKRprNGq4tLMG9Ab85uSFQN
X-Proofpoint-ORIG-GUID: skgK7VD0jUKRprNGq4tLMG9Ab85uSFQN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA4OCBTYWx0ZWRfX9ZN7WnJHtH4L
 WTRmiE/e/Nk3ePA/m/MP/LK3H1Pc3Kfb5Z9snk6vqp5/Xatk7CqNgW+hHfROOfvLc4b4OfQROVd
 a9I669cbBXgWvrqbuKa8YIkMa67x7Ng=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100088

On Mon,  9 Nov 2026 09:12:05 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for Telemetry operations needed to request platform to
> reset telemetry current configuration and data events values.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Just one trivial thing that might be wrong anyway.
> ---
>  drivers/firmware/arm_scmi/telemetry.c | 81 +++++++++++++++++++++++++++
>  include/linux/scmi_protocol.h         |  2 +
>  2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> index bf37faf99865..ebad4ec2afda 100644
> --- a/drivers/firmware/arm_scmi/telemetry.c
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -3969,6 +3969,86 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
> +{
> +	struct scmi_telemetry_res_info *rinfo;
> +	unsigned int num_des;
> +
> +	ti->info.enabled = false;
> +	ti->info.current_mode = SCMI_TLM_ONDEMAND;
> +	ti->streaming_mode = false;
> +	ti->info.active_update_interval = 0;
> +
> +	/* Get rinfo without triggering an enumeration, cannot be NULL anyway */
> +	rinfo = __scmi_telemetry_resources_get(ti);
> +	/* Make sure to see the latest num_des */
> +	num_des = smp_load_acquire(&rinfo->num_des);
> +	/* Clear all local state...*/
> +	for (int i = 0; i < num_des; i++) {
> +		struct telemetry_de *tde = to_tde(rinfo->des[i]);
> +
> +		scoped_guard(mutex, &tde->mtx) {

Unless this gets more complex later,
		guard(mutex)(&tde->mtx);
and resulting drop in indent.

If it does get more complex ignore this.

> +			tde->last_ts = 0;
> +			tde->last_val = 0;
> +			tde->last_magic = 0;
> +			tde->cached_msg = false;
> +			if (!tde->de.fc_support) {
> +				tde->sid = SHMTI_ID_INVALID;
> +				tde->base = NULL;
> +				tde->offset = 0;
> +				tde->eplg = NULL;
> +			}
> +
> +			scmi_telemetry_de_state_update(ti, ENA_STATE,
> +						       &tde->de.enabled, false);
> +
> +			if (tde->de.tstamp_support)
> +				scmi_telemetry_de_state_update(ti, ENA_TSTAMP,
> +							       &tde->de.tstamp_enabled,
> +							       false);
> +
> +			/*
> +			 * Unlinking ONLY BLK_TS lines since, per the SCMI spec,
> +			 * the UUID/DE associations are permanent within the same
> +			 * session boot: after a reset has cleared the server-side
> +			 * configuration the next time SHMTIs will be re-populated,
> +			 * these same UUID/DE associations will be re-instated.
> +			 */
> +			scmi_telemetry_blkts_unlink(tde);
> +		}
> +	}
> +
> +	for (int i = 0; i < rinfo->num_groups; i++) {
> +		rinfo->grps[i].enabled = false;
> +		rinfo->grps[i].tstamp_enabled = false;
> +		rinfo->grps[i].current_mode = SCMI_TLM_ONDEMAND;
> +		rinfo->grps[i].active_update_interval = 0;
> +	}
> +}
> +
> +static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	/* Stall concurrent configuration request */
> +	guard(mutex)(&ti->config_mtx);
> +
> +	ret = ph->xops->xfer_get_init(ph, TELEMETRY_RESET, sizeof(u32), 0, &t);
> +	if (ret)
> +		return ret;
> +
> +	put_unaligned_le32(0, t->tx.buf);
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret)
> +		scmi_telemetry_local_resources_reset(ti);
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.info_get = scmi_telemetry_info_get,
>  	.de_lookup = scmi_telemetry_de_lookup,
> @@ -3979,6 +4059,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
>  	.de_data_read = scmi_telemetry_de_data_read,
>  	.des_bulk_read = scmi_telemetry_des_bulk_read,
>  	.des_sample_get = scmi_telemetry_des_sample_get,
> +	.reset = scmi_telemetry_reset,
>  };
>  
>  /**
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 7177f739f062..012894e1d9be 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -1024,6 +1024,7 @@ struct scmi_telemetry_de_sample {
>   *		    the ones belonging to a specific group when provided.
>   *		    This causes an immediate update platform-side of all the
>   *		    enabled DEs.
> + * @reset: reset configuration and telemetry data.
>   */
>  struct scmi_telemetry_proto_ops {
>  	const struct scmi_telemetry_info *(*info_get)
> @@ -1051,6 +1052,7 @@ struct scmi_telemetry_proto_ops {
>  	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
>  					   int grp_id, unsigned int *num_samples,
>  					   struct scmi_telemetry_de_sample *samples);
> +	int (*reset)(const struct scmi_protocol_handle *ph);
>  };
>  
>  /**

