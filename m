Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849670;
	b=otzAjYsSkLTNPUg1813mSdg+YAPkJgsKEl1aaV3hY1up4R+vgqFHB9eChlMBwNWMnuKz
	 bSoPzl93U3vs3b6RTxnh71S0NWBiU4Kog+oEYTJeXWBuA/wLP57RRd7k52t0kzA1z3I6K
	 roTmd1OCtmyTw5NToHdOYL3WCUH+7gWM/G9Li15R27XIWQ8PMPjPui5TatKKW4jzhezyo
	 JpHH8pCJyMwK5nVbnqIOW2Ly/tLi5WLnMsEZBDIywqrCBSMp7IMdu22L1wICpD/9CZ8d2
	 WLzXXIJJpugAV4mnegYZYXieC19es5PxgKHe+EeXPOqgkg1a1C8TYYZdKygcH1WSXhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=biPhynUTSKbI2UIg5XKWQGsnKDaI2r52w9/sBmJ42sc=;
	b=HE7Ke7cNKjGCcc+X2HWpC8VqO1CC0EO3vqw7TUNLGzF97ULY4LcPhLvGXutGhr8VxsBA
	 HGKrg8MXt2gNq7LawQPiXMEj4XQubSILvWV4uxf1a7yOu+I8RGVaUbR6jDO62I20NaYdI
	 eCjVmNXTt7lQtdJwI/JiHBm5hamONSYIainyOn/08r/OVvqUB3h6QQRuhEQUS6cXwOMDO
	 Dmgyx48ygd0Ca+o93/rgS3b+zOuJGP1dI+EpkJ+tunDMEhOjLFHIuLjH9PES8Jk8M96fx
	 Gqr4QaWE1RF31e1lyWAz5N7CgOwu3WlzMP2ix8W6QI+SeP6yDD7ALfVsp1tuxksqPnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FiLnUzka;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a7G+7SId;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD68A606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD68A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FiLnUzka;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a7G+7SId
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8nvJT1706839
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	biPhynUTSKbI2UIg5XKWQGsnKDaI2r52w9/sBmJ42sc=; b=FiLnUzkaym5pkLb4
	nfk+1JYT+1hU8zdZ3ho/UwnAd87+v74x8sFZ+iWBi4eLLK29NEcHFn/eW1s3Pd/i
	LLk/oMACDIUaECzOq6uFh8mcj7y28Uxk0Cn3/cO+prX9rSwYVxaWD3Zs2LhAGUkH
	JU0uVhWEVinx7Q7CM3527DXvHRXKoBGc2wS1KtwbZihDAYq25jpCD5iDiRYmHrAj
	FzqYjUFDzGf7+UgrJs1+KJEKpJScTkC+kdCfwsWxlp0Rio/5s/0/fC0gEZ0BJvcQ
	3aJuUnHclgBD70GeaShdTutoo3uRkZ1sTFVQU2hQoDVtc+vyWYFP1RnTS0tK/wjM
	PtGcJA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xh3pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:47:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so2848043eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792849667; x=1793454467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=biPhynUTSKbI2UIg5XKWQGsnKDaI2r52w9/sBmJ42sc=;
        b=a7G+7SId5bSX/6rLAtRFXZFLo9f/I18V+EhCLHuiRQ6SvlLW96aZspaEpcmDtHuIZ9
         XJGY5oDUmQpPDM54zDBreQA5vh426HDU7q4/X+5qJd4q3tjY1SqJrzh0c0nVBCkhe5rZ
         Lz/dsB3jbZ1HUOll0vBaV0nVrPgvgaGsB3BH7bSSmaUNg8oBalbEyJJShvxad25oXGEr
         EvftNwx5tI7o3CFAcgh6PXsEtWb+VzRGbZJt0+1JVG4PqC0Q3dprwUBGUw/FJwUrNdcz
         UwHMfB8J5N2cwUqZQvufV0+YlwEW/rCbLWDuwJ/7K77QJQg1PQHlIABzfg6gMpbMUlVK
         Zqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849667; x=1793454467;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=biPhynUTSKbI2UIg5XKWQGsnKDaI2r52w9/sBmJ42sc=;
        b=ezrFY8zBo0gM+IlWkxjdZ9B5rgACldzRoj8rhCxiUYsOhjaTcPDUHakyAR9pGOCU/H
         cRsecrAx/16qP4U0zYuIgFh8g/YYuxZgAaNXq7lu2xmNmZ8ZpMP7/+/V7mx1IcBHt1fo
         jSO/32OeqHKXQwseWS53BgGa0nX0Rp+ErDMQz5pVWojtfzs+kpJI4pT/yb1kgS3mJXsa
         mbw5Au+KEzru3syOhmLGjBq/fL9cj347kDalBO5PvA5FpxaMa+ylz7UqcB+OHGlOB13e
         yEe47LySm083TYpUSH9fL/ks/ga12qvIqyurJsvfT2VRRUYfDUJaCXXAj/MWLCwmq9rm
         5pXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyGl0RzF/hQV26RMdEDvbWldJzKVLF2ev1vfLXU0/onIN/LOe9hj1/yjLhFkQnMuIWZI3XTjQPg+MEyfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfuNLfz71EPRQdPaLnJpYLBCbFoEgtrH5uehp1idbZjIn0y1t+
	hwKcYFZvtHDZ5Ekt32M/4t3nddqzNA4qVYKU2rSa0KJ/gBSFqVMHQSdcR1rFHrzqTyyKrcAcars
	MMto2Vnb7GVsNDoLfGnNeL1+3Fqkgvx8B+jccFtNuUn7uETDS7DYiqBBYpwrNnmC8dt8=
X-Gm-Gg: AYBFou3om5S7PXSz0WJ7LiGZ1DpZmeUIrOXtKNkjGwVCclpIiJnAeDeEBO23ROkcXN/
	U3ln4LusB7GVT+A4c+Pb1whwadmdDcP4sNFSxkAQYEcy8YI+qZtAdpY5jPk85cgBkHnbfijzeJm
	55n9b+Gmwkyw/5OicYZOhEMhJ2VeqxdEbx3+cIqTShPYSAdpoGMQKXKExMCUqbAffRedbuJ+/2H
	4CuW5vxjSnc3HQLk3bWBLBJu6z2+kd8+9m2Xttg+3YH8GtuX+w1eHFlzyvl1ABgoioewzITeWGX
	dY8+h+7v1vJ6yVdNUMAyK2Fif9FB9GrnMAAFT4rpvy9jSLnJtOPtf4WXAeVsnXTVa8EaTd5V3WF
	f2FpPaRnwQYW2qF3iTBAXK8sNsMxU
X-Received: by 2002:a05:7022:3f0b:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-19936873b40mr3015020c88.29.1792849667409;
        Sat, 24 Oct 2026 06:47:47 -0700 (PDT)
X-Received: by 2002:a05:7022:3f0b:b0:14a:51c8:ea06 with SMTP id a92af1059eb24-19936873b40mr3014995c88.29.1792849666881;
        Sat, 24 Oct 2026 06:47:46 -0700 (PDT)
Received: from [192.168.29.10] ([49.37.153.119])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm7575697c88.1.2026.10.24.06.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 06:47:46 -0700 (PDT)
Message-ID: <9be32afc-4794-4163-868b-a0af29d8a2f4@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 19:17:36 +0530
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
Subject: Re: [PATCH 3/5] firmware: qcom: Add an TEE bus based ICE back-end
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>
Cc: Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-3-b035be7aab0a@oss.qualcomm.com>
 <21185cf6-253e-48bf-ae7c-bb160a4c089d@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <21185cf6-253e-48bf-ae7c-bb160a4c089d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AY2VIxCSamAB76Phn6CnnkBA1WIalfHl
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adcb704 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=hZ1hWxSZf3UX9FuxeSnJ0A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=63Wl8F-6p0i4whe-SeQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfX24O5QP2DcsFj
 kidr/H7Ciq31tcLvBUMEoDFnGjahpfVlZ+zypOsi6tRdDqrS3Dx1CppzwVw3T9e2HcU5swKCKMe
 KgVjS2PqtekagqyjAj+PPnHh+frh/KA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA1NCBTYWx0ZWRfX0q19mqog+sz1
 vBHWQWbq33jl7ifZ4FWG3RchwK4gikji2SduxTlZEhm2DH3qhVcsCdKCWYUQYnRtBJr0nww30fj
 hkrbTS31Y3IYaV2s+dhT8vpv78f/zS6BOGQdv42H0KUTqWoqJUILra2C/5ZFBx6t6BA5LPeRj+r
 p+3VcDMEkLdXuq0Z6L8DuOQUoLWaTwF5LtUj/7rsP7nCjlOd+34/Y6nudVFl0YarB7jxzzPJJtQ
 DEKPQVii41BPIzPpUnFEYOLKi95HIJge1ujEyKkWGB263mLA9WbY028g6ZqTPZWIDZR1YeKemn7
 D2+x4MCWqnQPgdy6gmAXonNixc49cuk3lW8FrjQthbSSwm/KBcKnpsQkITHdPIrzWzVvBWeTixR
 ZobZ0F7qhTptzHzcUAB//dlJ8JetrkuXZ+1qXGkJiQdy78jMbquudwNYPzglPoADS/BqWvkF188
 Y61gMHp63TJ1pEQuTlw==
X-Proofpoint-ORIG-GUID: AY2VIxCSamAB76Phn6CnnkBA1WIalfHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240054

Hi Konrad,

On 22-10-2026 01:22 pm, Konrad Dybcio wrote:
> On 10/21/26 5:43 PM, Harshal Dev wrote:
>> Add support for a TEE client driver which forwards calls from the Inline
>> Crypto Engine (ICE) service (invoked by the ICE driver) to the OPTEE ICE
>> Psuedo-TA.
>>
>> The ICE PTA supports both ICE Legacy and Standard modes. In Standard mode
>> Hardware Key Manager v1 is supported.
>>
>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int qcom_ice_tee_generate_key(struct device *dev,
>> +				     u8 *lt_key, size_t lt_key_size)
>> +{
>> +	struct qcom_ice_tee_private *data = dev_get_drvdata(dev);
>> +	struct tee_ioctl_invoke_arg inv_arg = {
>> +		.func = PTA_QCOM_ICE_GENERATE_KEY,
>> +		.session = data->session_id,
>> +		.num_params = TEE_NUM_PARAMS,
>> +	};
>> +	struct tee_param param[TEE_NUM_PARAMS] = { };
>> +	struct tee_shm *key_shm;
>> +	u8 *buf;
>> +	size_t out_size;
>> +	int ret;
>> +
>> +	key_shm = tee_shm_alloc_kernel_buf(data->ctx, lt_key_size);
>> +	if (IS_ERR(key_shm))
>> +		return PTR_ERR(key_shm);
>> +
>> +	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
>> +	param[0].u.memref.shm = key_shm;
>> +	param[0].u.memref.shm_offs = 0;
>> +	param[0].u.memref.size = lt_key_size;
>> +
>> +	ret = tee_client_invoke_func(data->ctx, &inv_arg, param);
>> +	if (ret < 0 || inv_arg.ret != 0) {
>> +		dev_err(dev,
>> +			"ICE generate_key failed, ret=%d, err=0x%x\n",
>> +			ret, inv_arg.ret);
>> +		ret = ret ?: -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	buf = tee_shm_get_va(key_shm, 0);
>> +	out_size = param[0].u.memref.size;
>> +
>> +	memcpy(lt_key, buf, lt_key_size);
>> +	memzero_explicit(buf, out_size);
> 
> LLM says: s/out_size/lt_key_size here?
> 
> Or said another way, currently lt_key_size and out_size are not
> cross checked
>

Ack. Will cross-check these values. 
> [...]
> 
>> +static int qcom_ice_tee_probe(struct tee_client_device *ice_dev)
>> +{
>> +	struct device *dev = &ice_dev->dev;
>> +	struct qcom_ice_tee_private *data;
>> +	struct tee_ioctl_open_session_arg sess_arg = {
>> +		.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL,
>> +	};
>> +	int ret, err = -ENODEV;
>> +
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	data->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
>> +	if (IS_ERR(data->ctx))
>> +		return -ENODEV;
>> +
>> +	export_uuid(sess_arg.uuid, &ice_dev->id.uuid);
>> +	ret = tee_client_open_session(data->ctx, &sess_arg, NULL);
>> +	if (ret < 0 || sess_arg.ret != 0) {
>> +		dev_err(dev,
>> +			"tee_client_open_session failed, ret=%d, err=0x%x\n",
>> +			ret, sess_arg.ret);
>> +		err = ret ?: -EINVAL;
>> +		goto out_ctx;
>> +	}
>> +
>> +	data->session_id = sess_arg.session;
>> +	dev_set_drvdata(dev, data);
>> +
>> +	qcom_ice_ops_tee.dev = dev;
>> +	qcom_ice_svc_ops_register(&qcom_ice_ops_tee);
>> +
>> +	return ret;
> 
> This is always a 'return 0'
>

Ack.

Regards,
Harshal 
> Konrad

