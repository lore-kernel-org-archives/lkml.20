Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44F73E1713
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790222295; cv=none; b=jMhyfJqq+Q6XHz/5WymXgpoSLQIKnLJEFrpdoUWlqG6H7OHslcP9Sg0qUlMDhX0thiPCaY3vWBf6KqER6gglGnpEwYmZUZiZIy1so68TRfVYLuMwv9xcIFH8n+UapINy/mUXIoInZfds2hbJri0ZzcjEbdF6lY87zlBiTqApfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790222295; c=relaxed/simple;
	bh=uulX5FGojWJSDtZc7ii0G+XzCHyxRxCELQ1PGoS8gtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+uUsnW4Poxng579sbcQYU99UZQw9SuUfvQeLF68wcDrHZdJruKOyzjLFRTbISBL1pK/o3acyesMi21WgWCFD4OEpW9m6COB8jpNeG6qd7hz4Hvgp6L7N5BAVUKjRubsX2MgTjxXzUnEob5BLZjh8y0qeUrSN2FdZh9nc8SGfC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ulvq1dS5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJV2ummp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ulvq1dS5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJV2ummp"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36nLW1101374
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRbK7/D1d28dTJHPBr6uYKi6Nho6ZnHImdmDHXyGjS0=; b=Ulvq1dS5hG3t0r69
	LPnsC/asfEOyowRlKcpvBzpihFsnx9obj/En5dgaGggMsxtJ9md9qCnL3dOkJNEw
	2gEumHzN8BnKsqRrV0dyYDQAVyoz1RxgTcFFHe7+/PwCZmteZFB7SFif447CSG2n
	JIAFF5Nt7sYN2QH12vk+X6qqe7gS6GVFBcRNuJDi/hJ9FDoZIFWr4g5vWTsplsZC
	CNgYw/gs4FsOcEhg1+0gVvwyg23jVx2/k+jyo62IyyWRpfBcCEKEHh4izOMZGzmZ
	BpqCT32iLicCi1o0L5e8QCPSOMQiKlsBWKGDMHktndwtnlrx9MqDpFck7HF/h9Eh
	ktY1Ww==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbwmc53d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:58:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-313d1015161so503138eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790222290; x=1790827090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRbK7/D1d28dTJHPBr6uYKi6Nho6ZnHImdmDHXyGjS0=;
        b=IJV2ummpAmN8fB92RX9xJE3XxNpp23mBTg3Pv1utQxnbc+DCQksmGtcJLBEGPnAo4D
         IZK1CKrIyGORD+wILI0TjSIgFDfOMiAXvC4kimyOC21xTyUlcKZZ7LWFxAzoXUq6nSGB
         GAdh4XyygZghU+khpLaMPL419TYhe7qVfZIiZea2MPx+ymqdMXm7kD1InWrsKCdTitJ/
         iP//3qk7Bx4x5VMWRLQH6hcf8PR4nzfDBJqAMWmyIXAvgFLf0BNeVHw3bI76tOcxOXxR
         SUVGFrg4QCVLsXpb/ygi6onjfX9Fxy4L124gAWkhA8qrPAw07nW+Awa7hk7zvRv+HbmD
         vgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790222290; x=1790827090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRbK7/D1d28dTJHPBr6uYKi6Nho6ZnHImdmDHXyGjS0=;
        b=Vin8X1kzi1y3PhtDE1RIwAc8lQGDwc0E2eUPU9rI+pFWmxcg7e6rh2Rfp0LoQY6XBi
         tCUyySCKBnnNiD6RkPGaR9lJDDzXW2OlzGHHPmntttqyREBGbMHIyfn1FWB45tqm8XTP
         ijMvTXm9d7XPatn0MOhGQHnY5tieVlRlf+fRzfjdt/dWf96GqBOC8jFNaBbzis30FSr5
         4I2L4XIt6/vV/uDWduedjMwFuiLfr+qp2SEll8F1N8D2JXQJHkk2tkVikM/scR0yNx7t
         xGvml+LHQXOrpjxwXbduJcYzk7wsar97Fcq3xCoDaCw7T6FdKM9CvywiuV5i3QpCBV/z
         UeeA==
X-Forwarded-Encrypted: i=1; AKwUvBxMUWiWpQ9ADoh3Z2Vbv6nDYXNLBohGamujbNvtIrC8/a7ijFOhfztgAATZqS0cHDsHbkQDKOtkDCxw3E4=@vger.kernel.org
X-Gm-Message-State: AFuF++n5qEdhk19Ff7XO9npX5gGClXO96EIFm8Qmh5Q66AAoYveZLxi1
	LsyGlRPjPepB4IFDmtcog1JOCI9gM+TKnkXr5TOHOurE5125EUWD49dg5rdxMAqVnc7zWuFHuha
	TKdjGr8+sxsGid10gdA1BY79AEnzMhjD5WpshRB8W4+rXfPhfMaq+v9zIp+2Xlo3yCxQ=
X-Gm-Gg: AYBFou0vfT2y/3H8Th3o9H5qZpvBdHnynZDcPaeawCbA2nx+A7KfP5F9YJWagbTfhrQ
	GXOSolKeZwTJ0fV6dc+c5c0vS3iXtGGYafBoWUiit/7rjelPxQxHocbi89PqDQDIzU2ZJl7nVtO
	cgKBHM9saQfSEMTBlY1BJZgCpVB+L7bIvN87Jym/Ra0oU/7WNzjkk43PVG7qMY81y15gAPYbUew
	slXdmTLC8awmuys1pTheOOcG94S4WDvfeZeGHEtQwjtJP67HTTKwE4FztziETJwemQS8YtmxHqK
	8YXuX6zoimMAEadjShsAFTHYxNGHm4Xmh30vwCKeOW3AOjEK565KN4V2s7/h6XfaNfcz7Howvwm
	TRG2nmfXtdqrozeVThBK/DdIRDptpcJ4=
X-Received: by 2002:a05:7300:c019:10b0:334:7f2a:1188 with SMTP id 5a478bee46e88-34004d8689fmr994532eec.14.1790222289888;
        Wed, 23 Sep 2026 20:58:09 -0700 (PDT)
X-Received: by 2002:a05:7300:c019:10b0:334:7f2a:1188 with SMTP id 5a478bee46e88-34004d8689fmr994517eec.14.1790222289134;
        Wed, 23 Sep 2026 20:58:09 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e48e3esm11090061eec.26.2026.09.23.20.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 20:58:08 -0700 (PDT)
Message-ID: <9b39dbf2-dff6-a2ee-0164-03b82fae4ae9@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 09:28:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 02/19] media: iris: Add Gen2 firmware autodetect and
 fallback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-2-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAxNyBTYWx0ZWRfX6pOsbEVBbT7A
 xavM7xVeKCo4kDSP/h7kCplr4mZq6ZypLSjkTfW3aAmXafyB8J7HI+/TARLE/5SGmMp5m/025NX
 WIuEe9tq0iRkaXH23YyW7eW/UWCmyT0=
X-Authority-Analysis: v=2.4 cv=R/6WitRX c=1 sm=1 tr=0 ts=6ab49fd2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=JaYJuxMhrG_Ych6-DJMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wbLYWVCnW07yOV6VDIjdSC5zonN5eXOL
X-Proofpoint-ORIG-GUID: wbLYWVCnW07yOV6VDIjdSC5zonN5eXOL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAxNyBTYWx0ZWRfX8u8HE9kA1tGM
 QZGbFaglrABVvdWeg5ZVm/WN5OO016BOF8x8Zv0stdcyBeVKp+gTrFu48ZwxedU5K9Mm0n7y2wl
 oFFmCAcXKQhnYSfxZyhzh0ucQ9wJ+F6zUaTk7YL1kI32q2P+VNhgJT3q+NxWCOby8w6DU3Vx62w
 Eh9g8qD6eNVxoXerp5AOfg/2aSug/1v5ufjszCReMICPoT5ivFlAQflRBYekS0W0kY5AxmuXT7u
 ffiOEddyERLjVjRVJYdcLTzDs3IpvLixtsYkfwZgThqTDBIcN+b26qy9KR16nVGcZOCiZuq7D75
 rmfS78ne8Ln2V33JFkjZUiGg+zad6P8Gf7NQAaVXljJETDwWVanpMvj++c4pB3PAR2pBpHprIV8
 f5ybuM4jB/6sQaA+curnaModPfzAozjF6Z3sxhdUNJZ6tNsWX+e5nOUjFCaHIbH6ObhZaMbXLd5
 Qyv2x7YpbhXI7SkdEaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240017


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
> Update the firmware loading logic to handle this generically by
> preferring Gen2 when available, while safely falling back to Gen1
> when required.
>
> The firmware loading logic is updated with the following priority:
> 1. Device Tree (`firmware-name`): If specified, load unconditionally.
> 2. Gen2 default : If no DT override exists, select the Gen2 firmware
>    descriptor when present and attempt to load the corresponding
>    firmware image.
> 3. Gen1 Fallback: If loading the Gen2 firmware fails and a Gen1
>    descriptor is available, retry with the Gen1 firmware image.
>
> Loading and generation detection are split into two steps.
> iris_load_firmware() applies the priority above and returns the loaded
> image together with a candidate descriptor. iris_detect_firmware() then
> runs only after qcom_mdt_load() has succeeded and publishes the chosen
> descriptor, so the driver commits to a HFI generation only for an image
> that has actually been loaded.
>
> When a platform provides both Gen1 and Gen2 firmware descriptors and the
> firmware is loaded via a DT override, the candidate descriptor is only a
> default: iris_detect_firmware() inspects the loaded image to pick the
> generation, before authentication. It scans the memory populated by
> qcom_mdt_load() rather than the request_firmware() blob, so that a split
> .mdt image, whose version string lives in the .bNN data segments and not
> in the ELF headers, is classified correctly. The firmware is classified
> as Gen2 if the QC_IMAGE_VERSION_STRING starts with "vfw" or matches the
> "video-firmware.N.M" format with N >= 2.
>
> If a Gen1 firmware image is detected in this case, the driver switches
> to the Gen1 firmware descriptor and associated platform data so that
> the correct HFI implementation is used.
>
> This change makes firmware generation detection platform‑agnostic,
> preserves DT overrides, prefers newer Gen2 firmware when available,
> and maintains compatibility with platforms that only support Gen1.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_core.c       |   2 +
>  drivers/media/platform/qcom/iris/iris_firmware.c   | 188 +++++++++++++++++++--
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 -
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
>  7 files changed, 188 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 8c335dbfce16..676baa8087a8 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -6,6 +6,7 @@
>  #include <linux/pm_runtime.h>
>  
>  #include "iris_core.h"
> +#include "iris_ctrls.h"
>  #include "iris_firmware.h"
>  #include "iris_state.h"
>  #include "iris_vpu_common.h"
> @@ -85,6 +86,7 @@ int iris_core_init(struct iris_core *core)
>  		goto error_unload_fw;
>  
>  	core->iris_firmware_data->init_hfi_ops(core);
> +	iris_session_init_caps(core);
>  
>  	ret = iris_hfi_core_init(core);
>  	if (ret)
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 1a476146d758..ea3b3a9793e8 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -14,22 +14,175 @@
>  
>  #define IRIS_PAS_ID				9
>  
> -#define MAX_FIRMWARE_NAME_SIZE	128
> +/* Detect Gen2 firmware by scanning the blob for:
> + *   QC_IMAGE_VERSION_STRING=<version>
> + * and then checking:
> + *   - version starts with "vfw", OR
> + *   - version matches "video-firmware.N.M" with N >= 2
> + */
> +
> +static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> +{
> +	static const char *marker = "QC_IMAGE_VERSION_STRING=";
> +	const size_t mlen = strlen(marker);
> +	static const char *vfw = "vfw";
> +	const size_t vfwlen = strlen(vfw);
> +	static const char *vf = "video-firmware.";
> +	const size_t vflen = strlen(vf);
> +
> +	for (size_t i = 0; i + mlen < size; i++) {
> +		const char *found;
> +
> +		if (memcmp(data + i, marker, mlen))
> +			continue;
> +
> +		found = data + i + mlen;
> +		size -= i + mlen;
> +
> +		/* vfw => Gen2 */
> +		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> +			return true;
> +
> +		if (size < vflen ||
> +		    memcmp(found, vf, vflen))
> +			return false;
> +
> +		found += vflen;
> +		size -= vflen;
> +
> +		/*
> +		 * video-firmware.1.x is Gen1.
> +		 * video-firmware.2.x and video-firmware.10.x are Gen2.
> +		 */
> +		return size >= 2 &&
> +			(*found >= '2' || (*found == '1' && found[1] != '.'));
> +	}
> +
> +	return false;
> +}
>  
> -static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> +/*
> + * Load the firmware image and return the descriptor that was used to pick the
> + * file. On a platform that provides only one generation, or when no DT
> + * firmware-name override is present, the returned descriptor is final. With a
> + * DT override on a dual-generation platform the returned descriptor is only a
> + * default; iris_detect_firmware() inspects the loaded image to confirm it.
> + */
> +static const struct firmware *iris_load_firmware(struct iris_core *core,
> +						 const char **fw_name,
> +						 const struct iris_firmware_desc **fw_desc)
>  {
> +	const struct iris_firmware_desc *desc;
> +	const struct firmware *firmware;
> +	bool has_both_gens;
> +	int ret;
> +
> +	*fw_name = NULL;
> +	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> +
> +	/*
> +	 * A platform may support both Gen1 and Gen2 firmware; which one is used
> +	 * depends on the firmware image installed on the system, not on the
> +	 * hardware. That installed image does not change while the device is
> +	 * bound, so the generation is detected only once and the chosen
> +	 * descriptor is reused on later core bring-ups (e.g. after a system
> +	 * error recovery).
> +	 */
> +	if (core->iris_firmware_desc) {
> +		if (ret)
> +			*fw_name = core->iris_firmware_desc->fwname;
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret)
> +			return ERR_PTR(ret);
> +		*fw_desc = core->iris_firmware_desc;
> +		return firmware;
> +	}
> +
> +	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> +		core->iris_platform_data->firmware_desc_gen1;
> +
> +	if (core->iris_platform_data->firmware_desc_gen2)
> +		desc = core->iris_platform_data->firmware_desc_gen2;
> +	else if (core->iris_platform_data->firmware_desc_gen1)
> +		desc = core->iris_platform_data->firmware_desc_gen1;
> +	else
> +		return ERR_PTR(-EINVAL);
> +
> +	if (ret) {
> +		/* No firmware-name in DT: select by probing Gen2 then Gen1. */
> +		*fw_name = desc->fwname;
> +		if (has_both_gens)
> +			ret = firmware_request_nowarn(&firmware, *fw_name, core->dev);
> +		else
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		if (ret && has_both_gens) {
> +			desc = core->iris_platform_data->firmware_desc_gen1;
> +			*fw_name = desc->fwname;
> +			ret = request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +	} else {
> +		/* firmware-name given: iris_detect_firmware() picks the gen. */
> +		ret = request_firmware(&firmware, *fw_name, core->dev);
> +	}
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	*fw_desc = desc;
> +	return firmware;
> +}
> +
> +/*
> + * Detect the firmware generation and publish the descriptor. Run only after
> + * qcom_mdt_load() has succeeded, so the driver commits to a HFI generation
> + * only for a firmware image that has actually been loaded.
> + *
> + * The generation is detected from the loaded image (@data / @size point at the
> + * reserved memory region populated by qcom_mdt_load()) rather than from the
> + * request_firmware() blob: for a split .mdt the latter holds only the ELF
> + * headers, while QC_IMAGE_VERSION_STRING lives in the .bNN data segments.
> + *
> + * The descriptor and firmware data are published exactly once, before any
> + * session exists, so the lockless readers in the ioctl paths never observe a
> + * reassignment. Later bring-ups reuse the already published descriptor.
> + */
> +static void iris_detect_firmware(struct iris_core *core, const char *fw_name,
> +				 const u8 *data, size_t size,
> +				 const struct iris_firmware_desc *desc)
> +{
> +	if (core->iris_firmware_desc)
> +		return;
> +
> +	/*
> +	 * With a DT firmware-name override on a dual-generation platform the
> +	 * image on disk decides the generation, so inspect it and switch to the
> +	 * Gen1 descriptor when a Gen1 image was loaded.
> +	 */
> +	if (desc == core->iris_platform_data->firmware_desc_gen2 &&
> +	    core->iris_platform_data->firmware_desc_gen1 &&
> +	    of_property_present(dev_of_node(core->dev), "firmware-name") &&
> +	    !iris_detect_gen2_from_fwdata(data, size)) {
> +		dev_info(core->dev, "Gen1 FW detected in %s\n", fw_name);
> +		desc = core->iris_platform_data->firmware_desc_gen1;
> +	}
> +
> +	/* Publish iris_firmware_data first, then iris_firmware_desc (the guard). */
> +	core->iris_firmware_data = desc->firmware_data;
> +	core->iris_firmware_desc = desc;
> +}
> +
> +static int iris_load_fw_to_memory(struct iris_core *core)
> +{
> +	const struct iris_firmware_desc *desc;
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = core->dev;
>  	struct resource res;
>  	phys_addr_t mem_phys;
> +	const char *fw_name;
>  	size_t res_size;
>  	ssize_t fw_size;
>  	void *mem_virt;
>  	int ret;
>  
> -	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> -		return -EINVAL;
> -
>  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
> @@ -37,9 +190,9 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  	mem_phys = res.start;
>  	res_size = resource_size(&res);
>  
> -	ret = request_firmware(&firmware, fw_name, dev);
> -	if (ret)
> -		return ret;
> +	firmware = iris_load_firmware(core, &fw_name, &desc);
> +	if (IS_ERR(firmware))
> +		return PTR_ERR(firmware);
>  
>  	fw_size = qcom_mdt_get_size(firmware);
>  	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -53,9 +206,14 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  		goto err_release_fw;
>  	}
>  
> +	memset(mem_virt, 0, res_size);
> +
>  	ret = qcom_mdt_load(dev, firmware, fw_name,
>  			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
>  
> +	if (!ret)
> +		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);
> +
>  	memunmap(mem_virt);
>  err_release_fw:
>  	release_firmware(firmware);
> @@ -66,18 +224,12 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  int iris_fw_load(struct iris_core *core)
>  {
>  	const struct tz_cp_config *cp_config;
> -	const char *fwpath = NULL;
>  	int i, ret;
>  
> -	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> -					    &fwpath);
> -	if (ret)
> -		fwpath = core->iris_firmware_desc->fwname;
> -
> -	ret = iris_load_fw_to_memory(core, fwpath);
> +	ret = iris_load_fw_to_memory(core);
>  	if (ret) {
> -		dev_err(core->dev, "firmware download failed\n");
> -		return -ENOMEM;
> +		dev_err(core->dev, "firmware download failed %d\n", ret);
> +		return ret;
>  	}
>  
>  	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -99,7 +251,7 @@ int iris_fw_load(struct iris_core *core)
>  		}
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index a9453d539fc2..974809509146 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -292,11 +292,7 @@ struct iris_firmware_desc {
>  };
>  
>  struct iris_platform_data {
> -	/*
> -	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> -	 * supporting both firmware kinds.
> -	 */
> -	const struct iris_firmware_desc *firmware_desc;
> +	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
>  
>  	const struct vpu_ops *vpu_ops;
>  	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index fa5bb143158d..bbdbf21961d7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -29,6 +29,12 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
>  };
>  
> +static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> +	.firmware_data = &iris_hfi_gen2_data,
> +	.get_vpu_buffer_size = iris_vpu33_buf_size,
> +	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> +};
> +
>  static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -100,7 +106,8 @@ const struct iris_platform_data milos_data = {
>  };
>  
>  const struct iris_platform_data sc7280_data = {
> -	.firmware_desc = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> +	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -129,7 +136,7 @@ const struct iris_platform_data sc7280_data = {
>  };
>  
>  const struct iris_platform_data sm8250_data = {
> -	.firmware_desc = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 2c63adbc5579..74626b35d9cb 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>   * - inst_caps to platform_inst_cap_qcs8300
>   */
>  const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
>  };
>  
>  const struct iris_platform_data sm8550_data = {
> -	.firmware_desc = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
>   * - controller_rst_tbl to sm8650_controller_reset_table
>   */
>  const struct iris_platform_data sm8650_data = {
> -	.firmware_desc = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu33_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
>  };
>  
>  const struct iris_platform_data sm8750_data = {
> -	.firmware_desc = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu35_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
>   * - different num_vpp_pipe
>   */
>  const struct iris_platform_data x1p42100_data = {
> -	.firmware_desc = &iris_vpu30_p1_gen2_desc,
> +	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 81cccb756b94..5db6398433a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -253,8 +253,6 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> -	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>  	if (IS_ERR(core->ubwc_cfg))
> @@ -273,8 +271,6 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	iris_session_init_caps(core);
> -
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 1c052ca235be..84d70beec350 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,6 +9,7 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> +#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

