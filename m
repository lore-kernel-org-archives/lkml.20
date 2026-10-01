Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416E2DCF4C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 02:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790822971; cv=none; b=V+oXhOyPezCNJHyNbCwhmforBnQTqDPmdDzRakVlzhehUzLjqUKkSH6wGCpt9YhSNsOwEDjH7fD+Fy4PE4nzfHXw+i6Yqx4VfLMjluWKl/E/OVpAS6BNHoQEyQxB/0kHj03k4GfORVYe7AaWSd5R9jByWNtL34Ecp/jvm/S6X0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790822971; c=relaxed/simple;
	bh=H0vTFFzW39bczpINGfcjUjFpQAVtYUbVDSPTk5bLgW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXVSxhrDQRMnTLYcnGWZfwE3Js8GQVY6Sn6y3XraZdKU/Lc4ynMIYuOjwk5LLfUWDLnH7dY691mM/EVYWkzDygGps8j1y9LnHtLYjREMsxrgTaAgpvsvavaDL5E92JDkEMnmkOpsH+WD6WKQTPiArr1TsfzbLIVLfVwmCw0o76E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6IiySGm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAShoreF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6IiySGm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAShoreF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910jXB4271291
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 02:49:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eqi1lToXLrNFs6d5WQVIm9fr1NE0oqHF1TCkIlVqtvM=; b=D6IiySGmZlkQwq/U
	6kOK5Ibe/znMucq82Nc7l0vK8wftsUOa4HLZR29RnYZuxSxCghAbojOoaX2ND8v4
	zmw9pbDH1iSQe34sq3dpT63XRTkIxjHFNTYQ5ssGVUjT45QOsvcD0YgclsFMxKed
	0A2JKON5tzfq4mkrx6OpMxmg+E/RKKYSrZVZ6/PNTKSxSudX6EhSl4CQeNbNVE32
	9wauTc9nkzVeNHBApqNrGjI8uw1jKLLKWET2gzq5h2kgSyLt/FMUQ6EBhcX/YoFz
	EVkxyPg14CDbJyvDWVepmyu5FhgKACRCsbnJY8qrrn3nuNzE+i48kcDC0Oj/+qXL
	2PGmWA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvskyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:49:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30f1b904861so8124798eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790822968; x=1791427768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Eqi1lToXLrNFs6d5WQVIm9fr1NE0oqHF1TCkIlVqtvM=;
        b=NAShoreFIR5uFtjPN1PiTmrisVzu23ilEJkzP0/62xeFtkDWbZweD4OMDVaApro51G
         5DbVRaI8S8J0nmgTbRBOjLEEO0h1M9ScHYmOvY1ncBdjXFLBErnx96cpNWeAyiLxKq8a
         ABIxmH4WX2g4ilsBJn88vxsemfrWdFza4pVaY89np3AIWB4twL4A7bR4wS4lgPGv9PAc
         5ZBiQWrndSDQUHsBcwuRNSq9bF85XhUWpHfa3rcfpjvYroZXvTWr4waIDvohSu1grxtX
         QtwPGf5AvW4032KoqhLelm3jjY+YyhIIzl3145FcrK8brzV86a21ubbVYMom4bMpfTrs
         +xMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790822968; x=1791427768;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eqi1lToXLrNFs6d5WQVIm9fr1NE0oqHF1TCkIlVqtvM=;
        b=jo2sBdDjIUcuzT7unnL492hzI3ZaWQwprWXdc9jW6lNJ/feNlLFTQZjg00kAMKdvXc
         t7002O6Xt3oOgMwSzMwJMq4r9P5EMmImRH0HEwcSvEgJ6AOwo8aD5Z5XHB9Xt+36zVP+
         LyqyDH+OG2zjyIwZFnVLx9QGdGWKirSeycUYzU5m6fNbW4H/KWesgQ7vOBak8d/zQFc+
         tK8dSUMaltfb8B+TEtwmpL/4yEU6j+z5bP7P7tUT3LVCRfZiN5CkgaTTMYPaqboh8Gr1
         dnjs6KNXcwCWHz1LxbtOB8Scb0rsApCMknOD5A/EjzXgDssfdkTH6ZTKtaeIyAF07f7n
         E9pg==
X-Forwarded-Encrypted: i=1; AKwUvBwViHEJLUuVnSk4BF5t0lZdDk2TOnYLha7UfyPc16n1ggktuPhogMCZvXwtptXIWQXeNZ7CIeTUVQPH7dU=@vger.kernel.org
X-Gm-Message-State: AFuF++kcAdiC28W8TXViQvrK90/j7tLnouavwjeOb7SbNUh63+3JnpvR
	VYKpk0H0K+U1rOeuguDCcQEeib/vP6ITR2TwyXp8eykZkv42d2VoYHp8F5Rhc9q36jPr3XEdtvk
	OK7Tt691nTK44QJZqJtNwYp+OxNtQaAaT/ceQIPybgfDzWwxhILvAiouUFJCbhTapLPc=
X-Gm-Gg: AYBFou2RNNSDpNVv3d0ApCfORUg7y5zM7XppEtELaDM53+YU9QOKPlhxllOacLzrqYU
	PxHoDzwdwjSMgNqfPUnr4eOhsaCcoapVGxK4a+Ubcimn0Ke9rA1kYtUNZGTox7liDcUeFxiiRZI
	8+9jfgye7XGIrMWhK/9Q8O4oH1C8EpMW5MxF1WHlej0SOThip3OxQeNxtOmNrPSMX9M9ivUO0Id
	eOMQKGVXqk/ML74D9R0EEwkBamiO4E1Ta/ZdnIv+AjdN64k7ll7XUKkXcQx1TdRWUmoeZXLjf0G
	1nCVvhj9g0835r3ZwH9BylcPefOeuNAdhBa011ZKgFAl3KaofUB1C50zjQhARIHL6B375zRZTxr
	HXaJd3btEcc2kV3RBo7vDSX/E+AIWt1k=
X-Received: by 2002:a05:7022:ea8b:b0:14b:588b:c80f with SMTP id a92af1059eb24-14d31a8191fmr2935631c88.10.1790822968308;
        Wed, 30 Sep 2026 19:49:28 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8b:b0:14b:588b:c80f with SMTP id a92af1059eb24-14d31a8191fmr2935611c88.10.1790822967664;
        Wed, 30 Sep 2026 19:49:27 -0700 (PDT)
Received: from [192.168.0.12] ([183.83.137.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3758da2sm2892431eec.15.2026.09.30.19.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 19:49:27 -0700 (PDT)
Message-ID: <6846a877-5698-e38d-41fd-95cb8c0986c1@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 08:19:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 3/5] media: iris: Add ROI delta QP control support for
 HFI Gen2 encoders
Content-Language: en-US
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260930-enc_roi_enable-v8-0-2c908f30e963@oss.qualcomm.com>
 <20260930-enc_roi_enable-v8-3-2c908f30e963@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260930-enc_roi_enable-v8-3-2c908f30e963@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gkMluptKyePzePpTujJSmwE2xy-aGVBl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfXyFH20llVxxIU
 8A5AO6rEfKx29mddohiWhY0prQz4R7YPA/aGj1zZPCaNaq/7qV4YDfxjinUsOHCfI4jclIoGWR/
 Gwj01h0drem8F1LWmqfQM0/dYdXg5bFaq9PHQ+fHJ01iXdFXoOA7PVxX4j7BQETuDGA99Nt2cMI
 rWcB9VGdnlH9du91fRtBgt9+oGtQVqbbNZYuAmL8rmmkIJDRBDyHRRLJxW3i+0ikX/LzQO/pxiP
 AS41WYa50V4jtgKZg/MLIEK61e7byT63RuF2KbJYlSXwdMvcX4kGiPzi9dL3+gB3zSFDOmtFpvf
 Fm6FEd+MfnDT7esL/YQpZagr6xZy7nr7L60IHIYdJOb5FW6RbfjTQ9558CgCqKoQ6yJOPV0n3w2
 l/Lvg9IUNv2Hd+ZolhFBje3LwtjhKyi0HGRVxmgghmxWVKLLRJWqvTkhoeH+HL5GIifGyqPIkcy
 aBzObB1cQOxMsq0emQQ==
X-Proofpoint-GUID: gkMluptKyePzePpTujJSmwE2xy-aGVBl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAxMSBTYWx0ZWRfX+XuvpKQ3fgu1
 2zPyCk9qeHDY82kOzOoKZKy8OuEKb55DY3c8D/yWTXbRx84o7R9IaiKgbZ1J44joqRGn3gbYHuK
 HmSFYSaLiKibEuO5TiipL+ZvK+h+AfM=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abdca39 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=gJrurTm18R8X9NiJySVakQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BQAKiL45JnMOSjkhOBIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010011



On 10/1/2026 12:00 AM, Deepa Guthyappa Madivalara wrote:
> Add ROI support to the Iris encoder driver for HFI Gen2 based targets.
> 
> - Add control infrastructure, ROI_PARAMS and MB_SIZE capability IDs to
>   platform_inst_fw_cap_type. Extend struct platform_inst_fw_cap with
>   p_array and elems fields to hold a pointer to the per-frame
>   delta QP array and its element count, set during s_ctrl.
> - Register V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP as a dynamic S8
>   array control (max dims = 139264 entries, supporting resolution of
>   8192x4352 at 16x16 MB granularity).
>   Register V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE as a read-only U8
>   control; g_volatile_ctrl returns 32 for HEVC and 16 for H.264.
> - Define HFI_PROP_ROI_INFO and hook ROI_PARAMS to iris_set_roi_params().
> 
> Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 70 +++++++++++++++++++++-
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 13 ++++
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  5 ++
>  4 files changed, 88 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index bf17d310eac081ffd3a4ad4842c2255ad798d4d8..9f84d28d00ab25555f1d2259f7ef0ed0786a0271 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -156,6 +156,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
>  		return LAYER5_BITRATE_HEVC;
>  	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
>  		return REQUEST_SYNC_FRAME;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
> +		return ROI_PARAMS;
> +	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
> +		return MB_SIZE;
>  	default:
>  		return INST_FW_CAP_MAX;
>  	}
> @@ -301,6 +305,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
>  		return V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L5_BR;
>  	case REQUEST_SYNC_FRAME:
>  		return V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME;
> +	case ROI_PARAMS:
> +		return V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP;
> +	case MB_SIZE:
> +		return V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE;
>  	default:
>  		return 0;
>  	}
> @@ -327,6 +335,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  
>  	inst->fw_caps[cap_id].value = ctrl->val;
>  
> +	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CUSTOM) {
> +		if (cap_id == ROI_PARAMS) {
> +			inst->fw_caps[cap_id].p_array =
> +				(const void *)ctrl->p_new.p;
> +			inst->fw_caps[cap_id].elems = ctrl->new_elems;
> +		}
> +	}
> +
>  	if (vb2_is_streaming(q)) {
>  		if (cap[cap_id].set)
>  			cap[cap_id].set(inst, cap_id);
> @@ -335,8 +351,53 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int iris_get_roi_mb_size(struct iris_inst *inst)
> +{
> +	return inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +}
> +
> +static int iris_op_g_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
> +	enum platform_inst_fw_cap_type cap_id;
> +
> +	cap_id = iris_get_cap_id(ctrl->id);
> +	if (!iris_valid_cap_id(cap_id))
> +		return -EINVAL;
> +
> +	if (cap_id == MB_SIZE)
> +		ctrl->val = iris_get_roi_mb_size(inst);
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_ctrl_ops iris_ctrl_ops = {
>  	.s_ctrl = iris_op_s_ctrl,
> +	.g_volatile_ctrl = iris_op_g_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config roi_mbqp_cfg = {
> +	.ops = &iris_ctrl_ops,
> +	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP,
> +	.name = "Enc Mb ROI Delta QP",
> +	.type = V4L2_CTRL_TYPE_S8,
> +	.dims = {139264}, /* Max MBPF = 8192 * 4352 / 256 */
> +	.min = -31,
> +	.max = 30,
> +	.def = 0,
> +	.step = 1,
> +	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
> +};
> +
> +static const struct v4l2_ctrl_config roi_mbqp_size = {
> +	.ops = &iris_ctrl_ops,
> +	.id = V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE,
> +	.name = "ROI Mb size",
> +	.type = V4L2_CTRL_TYPE_U8,
> +	.min = 16,
> +	.max = 32,
> +	.def = 16,
> +	.step = 1,
>  };
>  
>  int iris_ctrls_init(struct iris_inst *inst)
> @@ -361,7 +422,7 @@ int iris_ctrls_init(struct iris_inst *inst)
>  		return ret;
>  
>  	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> -		struct v4l2_ctrl *ctrl;
> +		struct v4l2_ctrl *ctrl = NULL;
>  
>  		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
>  		if (!v4l2_id)
> @@ -379,6 +440,13 @@ int iris_ctrls_init(struct iris_inst *inst)
>  						      cap[idx].max,
>  						      ~(cap[idx].step_or_mask),
>  						      cap[idx].value);
> +		} else if (cap[idx].flags & CAP_FLAG_CUSTOM) {
> +			if (cap[idx].cap_id == ROI_PARAMS)
> +				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
> +							    &roi_mbqp_cfg, NULL);
> +			if (cap[idx].cap_id == MB_SIZE)
> +				ctrl = v4l2_ctrl_new_custom(&inst->ctrl_handler,
> +							    &roi_mbqp_size, NULL);
>  		} else {
>  			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
>  						 &iris_ctrl_ops,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> index 3b8fbefb8b93576962abd3850215f7b7fb364930..d628bc6748438b19dac01cd11cb9f8da0b8500af 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1782,6 +1782,19 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>  		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
>  		.set = iris_set_req_sync_frame,
>  	},
> +	{
> +		.cap_id = ROI_PARAMS,
> +		.step_or_mask = 1,
> +		.p_array = NULL,
> +		.hfi_id = HFI_PROP_ROI_INFO,
> +		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_CUSTOM |
> +			 CAP_FLAG_DYNAMIC_ALLOWED,
> +	},
> +	{
> +		.cap_id = MB_SIZE,
> +		.step_or_mask = 1,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_CUSTOM,
> +	},
>  };
>  
>  static const u32 sm8550_vdec_input_config_params_default[] = {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index f43aea10090d8f1d6ae5c20547e5f6321b2ca203..08fc1036013de29e51747a6425ae7bb805ca3e0f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -133,6 +133,7 @@ enum hfi_flip {
>  #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
>  #define HFI_PROP_NO_OUTPUT			0x0300016a
>  #define HFI_PROP_BUFFER_MARK			0x0300016c
> +#define HFI_PROP_ROI_INFO			0x03000173
>  #define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
>  #define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>  #define HFI_PROP_RAW_RESOLUTION		0x03000178
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9748095091461ba13443c63955a42906fa4f050c..9910eb5514b3ae0a6b5349adb071d0a56375102c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -186,6 +186,8 @@ enum platform_inst_fw_cap_type {
>  	LAYER5_BITRATE_HEVC,
>  	REQUEST_SYNC_FRAME,
>  	TIME_DELTA_BASED_RC,
> +	ROI_PARAMS,
> +	MB_SIZE,
>  	INST_FW_CAP_MAX,
>  };
>  
> @@ -197,6 +199,7 @@ enum platform_inst_fw_cap_flags {
>  	CAP_FLAG_CLIENT_SET		= BIT(4),
>  	CAP_FLAG_BITMASK		= BIT(5),
>  	CAP_FLAG_VOLATILE		= BIT(6),
> +	CAP_FLAG_CUSTOM			= BIT(7),
>  };
>  
>  struct platform_inst_fw_cap {
> @@ -206,6 +209,8 @@ struct platform_inst_fw_cap {
>  	s64 step_or_mask;
>  	s64 value;
>  	u32 hfi_id;
> +	const void *p_array;
> +	u32 elems;
>  	enum platform_inst_fw_cap_flags flags;
>  	int (*set)(struct iris_inst *inst,
>  		   enum platform_inst_fw_cap_type cap_id);
> 

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
