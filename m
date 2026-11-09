Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262066;
	b=1E3HSIrCmqBSl3myOEiYeAMqdBLYGPvrqxFadF4qeizT5c2PdCo1SK8EIKPFComMZXaZ
	 fDSGC/tprmvcuiXJWQNKyxp8NHwOgod9gaWX+bCcNOVH09F/h9LevITfz9Nbfz0rJS0qM
	 3IwUh0HZeWjAUAYkEE9mWg+fy5Mv8+EZGztVJqf0CAgdypy0+KXbP4L6AbDbZhHdvBLl3
	 bcgqV7ny76lDdTDxO/MGm48lijD2Sbyav372jagbljBJLvQwjESmng4eJkcHwbh8ZS5rD
	 oIFrzzB2keGFI+xBwduXVtPi2yEMBVF2AOBigLFhtiT7jk6jtTw4sKqGFG+8xAVM9xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262066;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
	b=CprwXCfHKKEpxsEktR7NIPwvM9ui/xXrsKSaGuXIUUoDJaMC6pTVnOaNmK29xXCA1ZIm
	 58XnBu7J9e9wqiWW6Y5zb/WeqylmhMnN9GSjReh/XCpGaqy6UWwgswvtWWHLNMGlwVwj7
	 cJdILg/mvqS5H1QGvF+StR5WwioOYFw0CH8YKMXjL8Gnqvse6Q06C9/Qfk5Fq9yCacEr2
	 ZBJrcP6oXYlKeWR+32Une/e4tWflnrzvVt4tHMoINKqDmnOJBgXAbQ5drprnjaHHJkILJ
	 KJ6LDUe1zqsk+nvtKewWx7kPy6HbLE/su0kYYCHYwzgAfvzxsGuEmmZ1HbS300q3aUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k27vhz8w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMzEZUrM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DD9606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85DD9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k27vhz8w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aMzEZUrM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA4kt1375889
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 22:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=; b=k27vhz8wVvvcrL6l
	474K+JnAqSvQJwpwRco1Wu24Vl/Nep5ME71Q9GOO0jRZzox6C6TRlfar/s9scZQ7
	zuITRoLj06qza6O/7o/KjvESXHDjvM/TsyhMmq/+Fe4bgKFtB3d3v45ZD9dvkiAI
	8JNiper23JeS7ZR6dptscHWBxIyDAh9siyzyINiOLiDsCxLc4ggeH+TiTRAggUxW
	jACzqyP4Sro70axn9Gvqk3+WlZL0s3FWA3kcTDzYfhK+c7WsJRUx3tusHxRg1ava
	7lAa74keKoyQ5Rj1tjDDFg/X3chbhJB8ydGW329Jeah4miF9OF6lvJ6O27HNtnpc
	04txSA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5a8g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:07:44 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37390b2989bso2438299eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794262063; x=1794866863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
        b=aMzEZUrMwnW2UADO2U/ixUjBB/Gr7Ue5SOidcVfDFUetWdgBSsmVophpgAU9j9iSSd
         ZPMy44Y0sLrgdyvI1eeeYR4sSO8kMyON/CX0nALVbZKE5WijFY8UhuUZCXPndosLUvQY
         CcjMcncwZtYYmmYjGueaw+H6ebO8j6yVoMGRs5kmYutWy/F8fU6Kim4gjOiVNpscTmOx
         ncw++Qv79AvwnP4I5PjRcupP6rmGwI2e/kbmtfyQNaOs/gJLKngbnKYcqo9znjJi5EtS
         +6eY7cU7B6QZjstj/rqMjc6woxwRZzXrIGnddVWaF2ZV72R1x0/QmNBXwQGV6R2Yj0uk
         HNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262063; x=1794866863;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
        b=GYR21EAeq4HIeXB5Pchpq4RhAAVY+yD4kSOVryu5ayeUsE66twQNF9ivWPc/Hi5Bgj
         2TaGpxGxGnWIiWu11J7tuGM/fuEKghWGUaG76eYvwQYX6h2gL9rGxekfHo7MuIA2kBT6
         74JaAxK164Ly+P0KBRaVRMuKqBrK3KTQDLQmseqipvULqiPDhADUtzP3bq1b70/QzMll
         +JLve9w0wSHJvUc7O10ZXEdfmrAhMl8k0vDn+Y+6pW7raq6MykDbJZm6k9klDl+Ua/Fl
         nmQxPk+dyaXZ4+QTK7g02gCQBebc0eqETRLoSds1FywOAiLPuv2GK5eZFeptDwW1uCNu
         xJSA==
X-Gm-Message-State: APuU4Z9pOJ3JMtPh0nxUv6rpXdj6TbmuBfpcHo0eIqMbD0smLQFhdIEk
	WzuGtlxAHOgEr3WknwkrsxrMQ1mcxg1SHDRK/D1MhKe3/7d009iuD0ybwJAhGPhUMfoWyDhT3Ql
	AtyZCZh9aY+L1Q6SPb9PQB7NSbGm+6S2hX/l6rjaVBZTZHDylZfq1zN5WtIecSODENEY=
X-Gm-Gg: AYBFou2Gii0tT+EjEs3cZ298+43uhYUBoBLYCpG6xQK+UH14LAc3zXUobVQ+85mVpqx
	sO2GrXTsFbX3vVMF0E19hB3Pg4NTdHruQacoEOXp+BWqalVa1xNVPsE7/zKVdPPaTi0MB4zo20b
	xy7a6C2keuXLUiiJ2EK2zHA4DgdksrMZQ60X1WcNYAHe+1sErccsfgkbEDrQvimzoYKlMuHLySk
	LF5DbhRAhiGXeuXatX1ZyOhTkKTim7oUbkQlgkFwIuU+xpebcsnUtfmSk2tZ50m2Fxa6S2A+Cai
	NMqr8IxFlUlyzZGrGF8WzYBIIOHKSjGI0oYcO83tqCk/LcLUhhyyvNikDU/VDpWdtP8yVfnk17L
	tMMvJKc5yajVSlOkm5oqnBP5UK3Ju8hQF6QgDHzaBm/kZQgNGg1Uu7Nr2+oLSTQU3CFWxBoEKZt
	8zrPgpqCltocLtfo6Adbo2K7W/vg==
X-Received: by 2002:a05:7300:d20d:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-3751fa3d46bmr785358eec.34.1794262063192;
        Mon, 09 Nov 2026 14:07:43 -0800 (PST)
X-Received: by 2002:a05:7300:d20d:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-3751fa3d46bmr785302eec.34.1794262062597;
        Mon, 09 Nov 2026 14:07:42 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm1256570eec.24.2026.11.09.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:07:42 -0800 (PST)
Date: Mon, 9 Nov 2026 14:07:36 -0800
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
Subject: Re: [PATCH v15 04/35] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <20261109140736.00007915@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-5-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-5-cristian.marussi@arm.com>
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
X-Proofpoint-ORIG-GUID: ZLj8vUbQJRnFlUzJizQVexUtcdaYaQxM
X-Proofpoint-GUID: ZLj8vUbQJRnFlUzJizQVexUtcdaYaQxM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfX1kYcp2y9iecP
 Ln6xHCJBjkKFnojgefuTX3V/+D5AqtdjV9RsGXpM+pg+zRkugUR3cK28oX2d/FWqzTp5OPIodvu
 NLd8uo8ji1VnnPAtsokjpmRLt/exfgk=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af24430 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=4nPJYbkOPloEEcwyAJsA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfX0PwMyOJXlavr
 3W98P7PtBSnP7STW88UaDiTxwiC2303Ti3Z4Xi0WhfqusxNDLD5zXvfFSQZbUojye8rgZXKZusS
 91KxmHOW+m72dzG9/b8mVt0vGJGV7NCfT45lYyhmUr5WIeldXGy7LKfPYzydIdHysxdfWZDZpqI
 WJxl92wALcfIHZy38VZdoMxyqKItDb+S9wWsAPZXkA+Ob3pUXpKLiUF+sQR9ds4+bhGF26qlanV
 vt2fhL2sFhNoGHNAh9aA2dwBfqwOGHsPjAKv2pcnMEVkwyJhg+ANlcmy1iTi+WGQOKpW0cg3SbU
 ppN5G0Nj6BqwBJ8vvxd2K55+qfsjjxgZfm9bjV+GFTRu2BuMBjA63/JglaSjhEI+B1O4SGptV8X
 MAnoKOBqg29h+0x26X0LU8DrC6s74SK/zD1jgc9tsXAqTVNo9NjU7iZbf2Zzdtdcw9hqeZXYgZL
 gDFK1gGrCC6k7LB0llw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090088

On Mon,  9 Nov 2026 09:11:50 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow protocols to register events with build-time unknown sizes: such
> events can be declared zero-sized and let the core SCMI stack perform the
> needed safe-net boundary checks based on the configured transport size.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - better commenting

A few bits of feedback on the comments.

> v12 --> v13
>  - improve variable naming
> v10 --> v11
>  - account for ktime_t field when checking boundary
> v2 --> v3
>  - split out of previous patch on protocol notifier
>  - use max() instead of max_t()
> ---
>  drivers/firmware/arm_scmi/notify.c | 28 +++++++++++++++++++++++-----
>  drivers/firmware/arm_scmi/notify.h |  8 ++++++--
>  2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index bc046f2f83a6..a30589c9b377 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -595,7 +595,16 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
>  	if (!r_evt)
>  		return -EINVAL;
>  
> -	if (len > r_evt->evt->max_payld_sz) {
> +	/*
> +	 * Events with a zero max_payld_sz are sized to be of the maximum
> +	 * size allowed by the transport: no need to be size-checked here
> +	 * since the transport layer would have already dropped such
> +	 * over-sized messages.

'such' here to me refers to the first bit. That is, those that are "
sized to be the maxim size allowed by the transport.

I'd just drop 'such' and have
	 * since the transport layer would have already dropped over-sized
	 * messages.

as that avoids this potential confusion.

> +	 * Note that, though, while this protects from buffer overruns, it is

Drop 'though'. Doesn't add anything and leads to odd flow to the sentence

> +	 * no more possible at this layer of the stack to detect zero-sized

'not possible at this layer ..'

The 'no more' refers to code that isn't here if someone reads this code
once the patch is merged.  So if you want to refer to what changed, keep
it in the patch description not a comment.


> +	 * events corrupted by truncation.
> +	 */
> +	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
>  		dev_err(handle->dev, "discard badly sized message\n");
>  		return -EINVAL;
>  	}


