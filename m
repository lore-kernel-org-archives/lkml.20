Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E57442B10
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790144222; cv=none; b=oCCHVNEFnJLNU0WkT/SMRCRx8sB+bvshI00PSQCRAEMtBUdipESY2vl+ByQH/rvEmrQqz3tOW8xv8Fph/lZS7Ar15hUOnI0YI7AP1EDfDjcx/SAniJWtDXQGyjjYHjOAeMdgYADP1oeH/ig2Mj2q+YKa1ZxeYJus0OWSN4iBvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790144222; c=relaxed/simple;
	bh=peXXU50xndQ4gAoFBh6lBioyyPiw7OjAKlIqeV7t6ic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FyV8f5qzGzcf8fCPhFJ6BJpIy5jLbDbubl3E1m9kaQKD89cLVyRmYqGzbxcr3rl2wU3BlvyEbghj0L/TmDRH8BJxx9uJRJTAEkgYLEV2PbXZhhNxGNKNTtQb6zkUY0lOFMsgu6DNppNqUCcDHIXJd9GxVbM3raZ86so3snRP8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LTGNdvh+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBYvZmOX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LTGNdvh+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBYvZmOX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3ioW82116454
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XAVSQafxI3Jl7WTU6fUPik0vtCcJL5EtlAGkPjfSPC8=; b=LTGNdvh+tK4uTGe3
	dBVpvQxGhbf9BoBC++S/Kx47e6bhEBx6Y7GO3GBfExQ1IMaljtbScDjHP/Mb2kTD
	TY87oyqfAjnTfbN6tZTLUkRJpOjxI+oZ9Drr+4NkWoTROCmNG5NwgfIZ2C8mFR40
	6Y0NO4vS+0MU4e6DLHN/Zebg2d40KaUAJxdDKx9EmDOUCRvUnRuhBuUDcS34b0x3
	DxLgfMixbbks82ORZavdA9VU/zx3l8ZpQgmM7JbbbZrVT/6SBO7Dthi3mTgv2qRW
	NN0Hpq7Wwq+YevdOHzudqa0YK3IlHSb137KDPPgmthg17kyzEipCkx0cf+DQ8RBT
	6/OamQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qs9x6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:16:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bee712354so682224eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790144217; x=1790749017; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAVSQafxI3Jl7WTU6fUPik0vtCcJL5EtlAGkPjfSPC8=;
        b=aBYvZmOXP6lkAcU5i+XOYZTNZiIsxDQCygSG+CT/QwVN35BOdFpG6MI1L42ZrP09D3
         gLTaJDz2VbIVLAwfCeOn0M8Ui8N1+InJSymZyKrkn7Vv9hMvrrEUSGmFI9gceke7w7Ry
         CaDhOzHtRjlXusnIF2DMdn3l0rbYblYVkrn9TN+AgI22PDef8dkhKa0yrAt8777qnoQm
         IRecteWp/Lul8fmP+oYY1JTI3yzm/UNEPmcGWoAAfE/QHrT3Sr3rWW+NZDrW5mZA7n/L
         /iWrE/XpBTOQm27n8VF4HPuUGgEb7WpY3kTtbC6oaadngyS0kKh3XOYDZDqv1ttvPILg
         lS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790144217; x=1790749017;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAVSQafxI3Jl7WTU6fUPik0vtCcJL5EtlAGkPjfSPC8=;
        b=czcNU8Sa0OO4ePCn5BvVEUMe6VwLWvcOsmXc4fXzo5izU2N0Rq32YfLnJzWz6/Cyrd
         wwLVD2UsF05FLJw+w6Kp/GvSNAyoqy3XQLMTSHObHSzRsqe0A7DBhMFN6kJsVqtvOReb
         GUS1ZfsZrWCrS53cwTHEEeJQQtnQKmLnxCwyjNprHaojhViqeLVJEhNTEzavqSfDBZVH
         fTmHywjPBaJROrC5v5eC6GZ2/J84MdKOop+wstYuHY2K0d91QgwTbeVpgP9SttVwATql
         FJXj175s3J0VTEmDo/kQDobzkt1DAKGhnlo+W1lnUgSRDXgsNcVggVNwSCpoAMMKNEng
         Kxuw==
X-Forwarded-Encrypted: i=1; AKwUvBydZlU3qYtGCttEeyXwj+0ACqPh3G/zMt/8/Jfe0pZT46q02tBNMg2eb3M4+7JEw0tf9yTygieTe3223Uw=@vger.kernel.org
X-Gm-Message-State: AFuF++kTp15iedrR1Y0wCdPaViLaqmRz/4OSSTYHkrht8uwQG1QUegU5
	UgQPycIMbPr2bFHFi2TQHOQDA/ekOx8EMvN+JRPYoS0Ch94ApOMYSUNpEEsN+V6NCkiQGI6ZNC6
	q5/ekXF1ga+ryikJNzYuTxFuYX8fhqd++RUv03jSVR49JRrd4hGoMmA3rFbq9vfwfnqI=
X-Gm-Gg: AYBFou2wU93Zos03ht5NOhc7pMEsaHovwNv4bWbzDYuJHj5Rc7mxsA0m68EiT5T9X5V
	Ge5PtmH62HkD6waosuKqX177nZCAU0Yp+NQQsNKeuioPmUroRefXH+MWifhrHfIiFTJvX4+1OF1
	lqf+bnh4T0pf/BRXpjCCeIl6TNI6/05iLbg42GghFCGiTEr13PBjKTNVTnEw1HXgNygbhTHvYtb
	d6hnrgHsv5yMd6xozJd14QwNcoJBcmluTV/XJJiMtTd+UovexhzOQ0fQE2c2+1g0Bp5tycwn+LO
	vEwD9uUOTbAqu6ZKZD74P8ujVGX0JVtDmsb/DAjNYIZyrw2SYxlWAA62IOtCk+YFH02iFXU8eyG
	pK0bFAda5HOf+Iu1EAf8rIfBitVsgc10=
X-Received: by 2002:a05:7022:208a:b0:137:f532:e360 with SMTP id a92af1059eb24-144f9086f02mr1827457c88.3.1790144217238;
        Tue, 22 Sep 2026 23:16:57 -0700 (PDT)
X-Received: by 2002:a05:7022:208a:b0:137:f532:e360 with SMTP id a92af1059eb24-144f9086f02mr1827431c88.3.1790144216582;
        Tue, 22 Sep 2026 23:16:56 -0700 (PDT)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e498f0sm3375833eec.27.2026.09.22.23.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 23:16:56 -0700 (PDT)
Message-ID: <023d4410-a730-a5e5-ea84-474e957d7a5b@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:46:49 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 01/19] Revert "media: iris: Add Gen2 firmware
 autodetect and fallback"
Content-Language: en-US
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
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
 <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-1-d71a782001c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab36eda cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fAD_4TVitci44sXei48A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: iM1lfcQNyqXojocLnOrDB_-mdZq4f2n5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX4P+zUQu6DqJI
 qFXjIupt8ke53dHAhzhdduvHGY5Y65u4d4al37B9F3lvqTNymFcnFdb57bUkvHu4q+QRUiCftA0
 9YCpZXSkmd7JHqyRTjvXB1PQKQGqBu8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNCBTYWx0ZWRfX0vKgvbogWbEu
 q9fOiPZ03Qz9X8temGrv3tmR0Rv8qbKS5eKWNWo/Vzz00O+vLJ1K6YlwxcZhoN2y479kKopNmM6
 VrroA72+gA4ITlvA1hMhFLjldbQoL5OyFP0IKwF3GaZiUya0c6Pjo4y6TGy+PWCm8JU8UWc/33F
 nCjKNBQqbyhgbINtvexskAFnF0UAv9huAg35yanTViG1xFODGQhflqjg3jgGBshWAjwh5jF+rzM
 n5TVT/0T+1ZZEQ/EenHRzAKz2Zr5p0Sg6hDwQrBO1q90pERzZ+bw8KMwNPsvQM/7jYLJZFPfXEW
 4LOqLj90zcr43X0p8nr3MjsqLboJ05Wj7Pd5c5xWrT1JQzpBXo7sQTE6r90Wi9kaUA4bHVERWdI
 hv/tEKbCBU1gGbZkfKzvWFhdiSxR2SC2NG76jJU33Qplt960BNMyaPMYgxTizFQTveayKTYMB9b
 WTJNCjJseW+LbmkRGxg==
X-Proofpoint-ORIG-GUID: iM1lfcQNyqXojocLnOrDB_-mdZq4f2n5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230024


On 7/31/2026 5:18 AM, Dmitry Baryshkov wrote:
> The commit 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and
> fallback") added support for detecting the firmware HFI interface based
> on the firmware contents, but it has issues with the MDT split files and
> with synchronisation / locking. Revert the commit, it will be replaced
> by the better version.
>
> Fixes: 412a2e5955e0 ("media: iris: Add Gen2 firmware autodetect and fallback")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c   | 119 +++------------------
>  .../platform/qcom/iris/iris_platform_common.h      |   6 +-
>  .../media/platform/qcom/iris/iris_platform_vpu2.c  |  11 +-
>  .../media/platform/qcom/iris/iris_platform_vpu3x.c |  10 +-
>  drivers/media/platform/qcom/iris/iris_probe.c      |   4 +
>  drivers/media/platform/qcom/iris/iris_vidc.c       |   3 -
>  6 files changed, 33 insertions(+), 120 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 965384fdd339..1a476146d758 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -16,109 +16,20 @@
>  
>  #define MAX_FIRMWARE_NAME_SIZE	128
>  
> -/* Detect Gen2 firmware by scanning the blob for:
> - *   QC_IMAGE_VERSION_STRING=<version>
> - * and then checking:
> - *   - version starts with "vfw", OR
> - *   - version matches "video-firmware.N.M" with N >= 2
> - */
> -
> -static bool iris_detect_gen2_from_fwdata(const u8 *data, size_t size)
> -{
> -	static const char *marker = "QC_IMAGE_VERSION_STRING=";
> -	const size_t mlen = strlen(marker);
> -	static const char *vfw = "vfw";
> -	const size_t vfwlen = strlen(vfw);
> -	static const char *vf = "video-firmware.";
> -	const size_t vflen = strlen(vf);
> -
> -	for (size_t i = 0; i + mlen < size; i++) {
> -		const char *found;
> -
> -		if (memcmp(data + i, marker, mlen))
> -			continue;
> -
> -		found = data + i + mlen;
> -		size -= i + mlen;
> -
> -		/* vfw => Gen2 */
> -		if (size > vfwlen && !memcmp(found, vfw, vfwlen))
> -			return true;
> -
> -		if (size < vflen ||
> -		    memcmp(found, vf, vflen))
> -			return false;
> -
> -		found += vflen;
> -		size -= vflen;
> -
> -		/*
> -		 * video-firmware.1.x is Gen1.
> -		 * video-firmware.2.x and video-firmware.10.x are Gen2.
> -		 */
> -		return size >= 2 &&
> -			(*found >= '2' || (*found == '1' && found[1] != '.'));
> -	}
> -
> -	return false;
> -}
> -
> -static const struct firmware *iris_detect_firmware(struct iris_core *core,
> -						   const char **fw_name)
> -{
> -	const struct firmware *firmware;
> -	bool has_both_gens;
> -	int ret;
> -
> -	*fw_name = NULL;
> -	if (core->iris_platform_data->firmware_desc_gen2)
> -		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen2;
> -	else if (core->iris_platform_data->firmware_desc_gen1)
> -		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> -	else
> -		return ERR_PTR(-EINVAL);
> -
> -	has_both_gens = core->iris_platform_data->firmware_desc_gen2 &&
> -		core->iris_platform_data->firmware_desc_gen1;
> -
> -	ret = of_property_read_string_index(dev_of_node(core->dev), "firmware-name", 0, fw_name);
> -	if (ret) {
> -		*fw_name = core->iris_firmware_desc->fwname;
> -		ret = request_firmware(&firmware, *fw_name, core->dev);
> -		if (ret && has_both_gens) {
> -			core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> -			*fw_name = core->iris_firmware_desc->fwname;
> -			ret = request_firmware(&firmware, *fw_name, core->dev);
> -		}
> -
> -		return ret ? ERR_PTR(ret) : firmware;
> -	}
> -
> -	ret = request_firmware(&firmware, *fw_name, core->dev);
> -	if (ret)
> -		return ERR_PTR(ret);
> -
> -	if (has_both_gens &&
> -	    !iris_detect_gen2_from_fwdata((const u8 *)firmware->data, firmware->size)) {
> -		dev_info(core->dev, "Gen1 FW detected in %s\n", *fw_name);
> -		core->iris_firmware_desc = core->iris_platform_data->firmware_desc_gen1;
> -	}
> -
> -	return firmware;
> -}
> -
> -static int iris_load_fw_to_memory(struct iris_core *core)
> +static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>  {
>  	const struct firmware *firmware = NULL;
>  	struct device *dev = core->dev;
>  	struct resource res;
>  	phys_addr_t mem_phys;
> -	const char *fw_name;
>  	size_t res_size;
>  	ssize_t fw_size;
>  	void *mem_virt;
>  	int ret;
>  
> +	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> +		return -EINVAL;
> +
>  	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>  	if (ret)
>  		return ret;
> @@ -126,11 +37,9 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  	mem_phys = res.start;
>  	res_size = resource_size(&res);
>  
> -	firmware = iris_detect_firmware(core, &fw_name);
> -	if (IS_ERR(firmware))
> -		return PTR_ERR(firmware);
> -
> -	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
> +	ret = request_firmware(&firmware, fw_name, dev);
> +	if (ret)
> +		return ret;
>  
>  	fw_size = qcom_mdt_get_size(firmware);
>  	if (fw_size < 0 || res_size < (size_t)fw_size) {
> @@ -157,12 +66,18 @@ static int iris_load_fw_to_memory(struct iris_core *core)
>  int iris_fw_load(struct iris_core *core)
>  {
>  	const struct tz_cp_config *cp_config;
> +	const char *fwpath = NULL;
>  	int i, ret;
>  
> -	ret = iris_load_fw_to_memory(core);
> +	ret = of_property_read_string_index(core->dev->of_node, "firmware-name", 0,
> +					    &fwpath);
> +	if (ret)
> +		fwpath = core->iris_firmware_desc->fwname;
> +
> +	ret = iris_load_fw_to_memory(core, fwpath);
>  	if (ret) {
> -		dev_err(core->dev, "firmware download failed %d\n", ret);
> -		return ret;
> +		dev_err(core->dev, "firmware download failed\n");
> +		return -ENOMEM;
>  	}
>  
>  	ret = qcom_scm_pas_auth_and_reset(IRIS_PAS_ID);
> @@ -184,7 +99,7 @@ int iris_fw_load(struct iris_core *core)
>  		}
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  int iris_fw_unload(struct iris_core *core)
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 974809509146..a9453d539fc2 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -292,7 +292,11 @@ struct iris_firmware_desc {
>  };
>  
>  struct iris_platform_data {
> -	const struct iris_firmware_desc *firmware_desc_gen1, *firmware_desc_gen2;
> +	/*
> +	 * XXX: replace with gen1 / gen2 pointers once we have platforms
> +	 * supporting both firmware kinds.
> +	 */
> +	const struct iris_firmware_desc *firmware_desc;
>  
>  	const struct vpu_ops *vpu_ops;
>  	const struct icc_info *icc_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> index bbdbf21961d7..fa5bb143158d 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
> @@ -29,12 +29,6 @@ static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
>  	.fwname = "qcom/vpu/vpu20_p1.mbn",
>  };
>  
> -static const struct iris_firmware_desc iris_vpu20_p1_gen2_s6_desc = {
> -	.firmware_data = &iris_hfi_gen2_data,
> -	.get_vpu_buffer_size = iris_vpu33_buf_size,
> -	.fwname = "qcom/vpu/vpu20_p1_gen2_s6.mbn",
> -};
> -
>  static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
>  	.firmware_data = &iris_hfi_gen1_data,
>  	.get_vpu_buffer_size = iris_vpu_buf_size,
> @@ -106,8 +100,7 @@ const struct iris_platform_data milos_data = {
>  };
>  
>  const struct iris_platform_data sc7280_data = {
> -	.firmware_desc_gen1 = &iris_vpu20_p1_gen1_desc,
> -	.firmware_desc_gen2 = &iris_vpu20_p1_gen2_s6_desc,
> +	.firmware_desc = &iris_vpu20_p1_gen1_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> @@ -136,7 +129,7 @@ const struct iris_platform_data sc7280_data = {
>  };
>  
>  const struct iris_platform_data sm8250_data = {
> -	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
> +	.firmware_desc = &iris_vpu20_p4_gen1_desc,
>  	.vpu_ops = &iris_vpu2_ops,
>  	.icc_tbl = iris_icc_info_vpu2,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> index 74626b35d9cb..2c63adbc5579 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
> @@ -90,7 +90,7 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
>   * - inst_caps to platform_inst_cap_qcs8300
>   */
>  const struct iris_platform_data qcs8300_data = {
> -	.firmware_desc_gen2 = &iris_vpu30_p4_s6_gen2_desc,
> +	.firmware_desc = &iris_vpu30_p4_s6_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -119,7 +119,7 @@ const struct iris_platform_data qcs8300_data = {
>  };
>  
>  const struct iris_platform_data sm8550_data = {
> -	.firmware_desc_gen2 = &iris_vpu30_p4_gen2_desc,
> +	.firmware_desc = &iris_vpu30_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -154,7 +154,7 @@ const struct iris_platform_data sm8550_data = {
>   * - controller_rst_tbl to sm8650_controller_reset_table
>   */
>  const struct iris_platform_data sm8650_data = {
> -	.firmware_desc_gen2 = &iris_vpu33_p4_gen2_desc,
> +	.firmware_desc = &iris_vpu33_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu33_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -185,7 +185,7 @@ const struct iris_platform_data sm8650_data = {
>  };
>  
>  const struct iris_platform_data sm8750_data = {
> -	.firmware_desc_gen2 = &iris_vpu35_p4_gen2_desc,
> +	.firmware_desc = &iris_vpu35_p4_gen2_desc,
>  	.vpu_ops = &iris_vpu35_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> @@ -220,7 +220,7 @@ const struct iris_platform_data sm8750_data = {
>   * - different num_vpp_pipe
>   */
>  const struct iris_platform_data x1p42100_data = {
> -	.firmware_desc_gen2 = &iris_vpu30_p1_gen2_desc,
> +	.firmware_desc = &iris_vpu30_p1_gen2_desc,
>  	.vpu_ops = &iris_vpu3_ops,
>  	.icc_tbl = iris_icc_info_vpu3x,
>  	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 5db6398433a4..81cccb756b94 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -253,6 +253,8 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
> +	core->iris_firmware_desc = core->iris_platform_data->firmware_desc;
> +	core->iris_firmware_data = core->iris_firmware_desc->firmware_data;
>  
>  	core->ubwc_cfg = qcom_ubwc_config_get_data();
>  	if (IS_ERR(core->ubwc_cfg))
> @@ -271,6 +273,8 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	iris_session_init_caps(core);
> +
>  	ret = v4l2_device_register(dev, &core->v4l2_dev);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index fcbc60016bee..1c052ca235be 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -9,7 +9,6 @@
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
>  
> -#include "iris_ctrls.h"
>  #include "iris_vidc.h"
>  #include "iris_instance.h"
>  #include "iris_vdec.h"
> @@ -197,8 +196,6 @@ int iris_open(struct file *filp)
>  		goto fail_m2m_release;
>  	}
>  
> -	iris_session_init_caps(core);
> -
>  	if (inst->domain == DECODER)
>  		ret = iris_vdec_inst_init(inst);
>  	else if (inst->domain == ENCODER)

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

