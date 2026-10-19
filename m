Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445247;
	b=tKk+phWXFSgOOxHKZQYmPHLixsCRkVQN5FB/bJBAAcaxdk1uEZOwXjpsPzWHLH6ZBxzH
	 GVCoB617HHBrqTbUsyW/vxhOcvHFaObB/cZRqJNzgE07V3m0BXFpka0JlUllf2FBkOIul
	 1wbhv9mRhutnQTBmeJMxbo6AERdLOn3qUL5OnlaQFUk4KN/h4E2uvXqVyOkRT2uktIBK+
	 I9H+M+b6QcrUbCaQdG+Nze8Hdh72/aF3zdXodPo4QT+KT95WbQDpTUj/YBmx5tzjUV2YV
	 CgkHBgu6klmmMuPvHh7rOOPKYDAqxFAGkf42WrdzYU63cRZo+f/6SMVfYgMQkdZwOHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=;
	b=DkKISmrW4o273OcBpdQimCVlzm7hgNpx1gMEdoJ1p9EiZJBbAAojMoM8alAKim1fR2e0
	 8MwpxfzJly/qOAWxfxkZEKnEDeuDUTE7m2MhU+2Op2YsmnvxJwgXlwL5y8hK/5lXhkQLJ
	 Mrb3XndoBRH2RIHC/wPEBTc6UQr/DcqYPa7IG94nhX2LA2eU0aQ0bm3lYA/OJLuWC95aX
	 VKXh8QS0DlceAoA5hEjK2ibHu05PgT5bbnyOatj67JIuUGzZY0bckNdFWwCLfX4fyKrV6
	 8DnFLK8I3S9qHgUp7H+75okEmg7Baj1jR3cbVdu40+XYN3Fnh0+K81KPv4AOh4F2BHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXOYYKIj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNbSzx31;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2670C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2670C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXOYYKIj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WNbSzx31
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JJJvU63672239
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=; b=ZXOYYKIj2T/Npqpv
	PnkgJ7GEH1Tqih+lwDXBB4G2XecFMot/BMs7ml6A+WSxz3cQ6iaQnqVOr2mfZe3I
	1CQoPkhjBC9V7ugFQfEJBQz+jU3VMqUE3+Zqozukg3EHlMXASVBvPV98XRw/vz4M
	8tSSx6bOSW2/cRjDAZlOaOY9B4sIP8h99EGCo0IzCWEZxbmwXGQ9YTtDY946AYkr
	y73qdWbw54Q5ehuaCPxISXwGCwIzczaoTRMzyIFEI0aw8p87spYDxn4pCex4nNcD
	UULwrygIBy3iuQ1h3IMMS/v8Y0fKetMJH6d88FTI/zZI+ak8JvtKTp2iOSKE1Ca1
	pL3W3Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3xbbma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:27:25 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so7015822eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445244; x=1793050044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=;
        b=WNbSzx31+qu0gaxfFs0YOO4ana9rpvSCmBlt+AYjJStFD5PYAojdQEYOMCFfHKO5Xg
         otwfTQ3BMMT6FNOD8Tf9bOVS3aEF7tZ5ys1kiD3dOLxScbFVAet9EKHSkIXUq5hC6Brg
         hIw2m6wdkNxynWBCq5RMxCLw2gRdIfNk/OBEHOCwq8A80bqtHjAPBvIR9tDStzAbHQ7D
         0nEe9FEYs+xYo7knXDFkco7q0ryzxkr17BhH5+8HXKTOzEfnRyBjKXrgd/+61RaNwle7
         FqykvjCIoAoasQX7nrwwttHxZwNAnIheBxXr4rEp8B3N2VWoTtJa07ecsvExCvOcZC6R
         fT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445245; x=1793050045;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L47P3Zpg3RMSsu5NECVxz4OxMZT8bD2P1rs9Ujh18GE=;
        b=oA+Rh108pxeRUHZ2eROuNzZ/uq+uADKDEKmlUaKN9iByMiNrZjZi94qHz5iXaVS+WR
         bj9dKf3KN+V2W6F0XMVOYY/sA2249EoEBgglPbeiWZGmrK/VKbd0f3v+A+95gQ/xjWy9
         YWk3IF7QV9Cn9iGSvDaJW16tYn7nnw7V3ERbQY6yl8vSoiLHteoCeLS/+2Y0hE/Y5O70
         M4SwgZ/yY/pd3coznmQvgqEmXBkmh5M/Ha0a8RKZAGnGSZF1oJfGwoHOyPgtMudQ0k7K
         foHdquEMItXMPJTcuwjIHzpKeFYQXOPhjiqUuOyLhy9OLjgcriWQ6Xh2hADvxoKzRy0e
         rqug==
X-Gm-Message-State: AFq9FYJ/OjAxfXhDXwwuhDHyxi6MJGlU2MRUyKkdIHWjq2AwEoZnoz9G
	XPF8xrkwjTm2a6AQ9orJfnCTvZSoULaXkBmS/7zn6uVgde9o/s0eIvOnOOzfaFdiUsQMTvjX9YU
	PyK/fJMrAYL4PeZyfTx82/D+443AhUyE+qTnAfDSW34DKdn1vbdAZZWjDVQiEFp0JrXU=
X-Gm-Gg: AYBFou1vwQURBy/Dx7MLzK5FBFqvkExdmRnpmwRZc8OnFemfzrE43KBpaFdkkyvzNKa
	3o9kmRfhN/bMD7o4BH0dVJgWeeKqw5M7UIndzfFi9DyDazJ1BQWuK1xmQWrVyLa8d6ekR0tCmMo
	9VzNpfBh9QFXimPmHo19QexsJAKoLge3pyidll6nLNYi+lZSRm/KwuDnFrJe4CI23y7n7TUt/oo
	Bi1sU+Dpmz+PIUFwEq0QEez0a4FK6pHdARicgayPY1UQ4SY1xyF7WSJqOV2p62cWIiTjcelpU0l
	bjmRf39zUG4LYO0sMh4//VUSzkvMFVWDu9LWu+Rh3k+lajJf+FzP+G0w/nAh7qI60GNYPrOGXpV
	k14Fkf3LuwDYEgef0ntqdIXSzqm3LZgXIPRqboAeE6g==
X-Received: by 2002:a05:7300:768c:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-361a18603d7mr18625589eec.17.1792445244481;
        Mon, 19 Oct 2026 14:27:24 -0700 (PDT)
X-Received: by 2002:a05:7300:768c:b0:35e:a117:8fd8 with SMTP id 5a478bee46e88-361a18603d7mr18625532eec.17.1792445243837;
        Mon, 19 Oct 2026 14:27:23 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819bc569sm33491810eec.11.2026.10.19.14.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:27:23 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:27:19 -0700
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
Subject: Re: [PATCH v14 07/32] firmware: arm_scmi: Add Telemetry basic
 attributes enumeration
Message-ID: <20261019142719.00003b78@oss.qualcomm.com>
In-Reply-To: <20261016185553.2794459-8-cristian.marussi@arm.com>
References: <20261016185553.2794459-1-cristian.marussi@arm.com>
	<20261016185553.2794459-8-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: 4DLfb85Od5dtkij4fydG5vAWJZDzeZLU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NSBTYWx0ZWRfXwxl7KSZpaW4c
 wYIcqimD/4Nzgvr3Y0R5TI0t9LA4nBX4PYTeDwaE4rzVR8+/I0dWEGxZuls7ruqWBfDUQDLW89U
 SkjqjBQPRXaqCte4B0ZFh8ZhtOiU+UA=
X-Authority-Analysis: v=2.4 cv=XPOl2ghE c=1 sm=1 tr=0 ts=6ad68b3d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=T7b44NXcgtRVRp_EcVYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 4DLfb85Od5dtkij4fydG5vAWJZDzeZLU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NSBTYWx0ZWRfX/37Lga7Hyz6D
 3SgNESgktUXNmzL9DA1C6nRvb4Pv49D9O3hSPO6Nv8ZCmqUvnjsXFcGeGOQkTk4pBRVPFS+TKBe
 q6xELyAYGCEkXCN4+klDCvLZwtePQeP4851bGzpFPm+42XHGb9wpgpQKLIRABVhCuR/cYwDPkj6
 XTRyibrAbSFdERtIFJZPvpfwY+YKi8WW4bTLWKDy1Pc2RYn+EBiaUVTCbO6CWFbUNYjkCO3pYqp
 f7E6fK7YqT9exzNQQQA8eCq/2DcDknSZis5qMLuKUtUEpuS7UQ9uLLWj9r5xASxRzt6asVRxm8d
 8ny7OA9woXjv3MnXx81oQ6HANrGGrKwYzidpGlcCm13BLwk9NtT6478iczRglVhX0bdqAplILkq
 BMaZLrJYPbUv5PSXEKMuuGv6a9cJYV7gkOVPknPMQNQaGGA4yG/F0MU6W5ZA0rEZpqCYl0psYGV
 RsmEEPy4hVbm7jwuimA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190085

On Fri, 16 Oct 2026 19:55:28 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add SCMIv4.0 Telemetry basic support for minimal initialization and
> protocol attributes enumeration: expose telemetry instance descriptor
> via a simple information retrieval protocol operation.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

A few minor comments but nothing I care strongly about.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

>  #endif /* _SCMI_PROTOCOLS_H */
> diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
> new file mode 100644
> index 000000000000..32f6f8d1106d
> --- /dev/null
> +++ b/drivers/firmware/arm_scmi/telemetry.c
> @@ -0,0 +1,148 @@

> +
> +enum scmi_telemetry_protocol_cmd {

Perhaps add a comment on enum scmi_common_cmd containing additional values
that apply to telemetry.

> +	TELEMETRY_LIST_SHMTI = 0x3,

> +
> +struct telemetry_info {
> +	bool streaming_mode;

I'd bring fields of internal tracking structures in only when
they are used (even if that is just setting them).

> +	unsigned int num_shmti;
> +	unsigned int num_des_tstamp;
> +	unsigned int default_blk_ts_rate;
> +	const struct scmi_protocol_handle *ph;
> +	struct scmi_telemetry_info info;
> +};
> +
> +static int
> +scmi_telemetry_protocol_attributes_get(struct telemetry_info *ti)
> +{
> +	struct scmi_msg_resp_telemetry_protocol_attributes *resp;
> +	const struct scmi_protocol_handle *ph = ti->ph;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
> +				      sizeof(*resp), &t);
> +	if (ret)
> +		return ret;
> +
> +	resp = t->rx.buf;
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		__le32 attr = resp->attributes_1;
> +		__be32 de_impl_version[SCMI_TLM_DE_IMPL_NUM_DWORDS];
> +

> +		for (int i = 0; i < SCMI_TLM_DE_IMPL_NUM_DWORDS; i++)
> +			de_impl_version[i] =
> +				cpu_to_be32(le32_to_cpu(resp->de_implem_rev_dword[i]));

That dance is a swap as data is stored le but UUID fields are be.
Maybe going via cpu endian is fine as would be silly to have le32_to_be32()
so it perhaps has documentation value.  Fair enough - I argued myself around
with agreeing with how you did it here, but left the discussion for anyone
else who has similar thoughts.

> +		import_uuid(&ti->info.base.primary_revision, (const __u8 *)&de_impl_version);
> +		ti->info.single_read_support = SUPPORTS_SINGLE_READ(attr);
> +		ti->info.continuous_update_support = SUPPORTS_CONTINUOS_UPDATE(attr);
> +		ti->info.per_group_config_support = SUPPORTS_PER_GROUP_CONFIG(attr);
> +		ti->info.reset_support = SUPPORTS_RESET(attr);
> +		ti->info.fc_support = SUPPORTS_FC(attr);
> +		ti->num_shmti = le32_get_bits(attr, GENMASK(15, 0));
> +		ti->default_blk_ts_rate = le32_to_cpu(resp->default_blk_ts_rate);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}

> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 5ab73b1ab9aa..121c83e1c6d8 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h

...


> +/**
> + * struct scmi_telemetry_proto_ops - represents the various operations provided
> + *	by SCMI Telemetry Protocol
> + *
> + * @info_get: get the general Telemetry information.
> + */
> +struct scmi_telemetry_proto_ops {
info> +	const struct scmi_telemetry_info __must_check *(*info_get)
> +		(const struct scmi_protocol_handle *ph);

Why __must_check?  Be a bit crazy if no one did anything with the
info they just requested, so that seems overkill and doesn't help with
the long line.

> +};
> +

