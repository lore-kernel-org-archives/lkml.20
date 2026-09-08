Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B615476F4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878403; cv=none; b=mhs+7jBllbK2hmlOGPtp+PONbEsXNac0ZHCGH03mFg9lEOWmfgFfPX3MfAb02lPyCvd3Rh/84Ie7ExkWYqP3pffLdpGa/v+mv1OaJX5lWyOgFIFoRYeVE8Sqjz7dapPcR19YnqsxsjzaJzrEo/pVna2y8lIAjLfMuK+ZwvrPfdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878403; c=relaxed/simple;
	bh=1joaK8aDf6gINARecUyPM7jTH11n+uwWquHYgC5ycBo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nX3OvbmpVpbFmi06LQnI+Hw9kKnMVeFZ5WChi6nuNMQCCN17TqWBz1SNn/2VDOSO6enzt5jxUgvsQRlrXwPIB8cq2XifJbeTKYXOu4D3NTbLdbPgVgHrjtP8znYVEh/5xZCSJI6TpNH4DMpCBhAasbrQ/HwQdWYUFEZznzkihCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jubzgs1d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DfH/hXd2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jubzgs1d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DfH/hXd2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EZUdd3815656
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 14:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GnrkNZL+INa2cy2Ro7Zdvw0+JDD23kLec3hRWayNkE=; b=jubzgs1dXVYggJta
	BSb1m/n8aZvWqkFEAgUXQ+rvlzUm83GS8zyizStP/Rd9LsSLBXkIlmVv1lHXNeG2
	jEu4jtVvpFYRyLK0lHDxbEod/P2NMg2GpAcXMsYMIiavlva7JyWyUwHP3IvMJf9i
	P5XZte/WQtpgvcj/Mdn9r7otMWKu1i9e5NrLsOaK/5B4j5zH8F6yMuFb6ZEsJLFK
	cUR8YwsHRFX6RB9F4zdj2A3cQyWVeqGNU1EuhGteCY85u5dbkjU0etnZPqVqCSIQ
	6IsQnd+j9KdOJ5CDyOj660cq+MqdXMhlqVkPJ4SMyD7zbhPERZ2mTQdxYpluKqVk
	8/wXww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp499kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:39:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc487bd6bfbso1804786a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788878389; x=1789483189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1GnrkNZL+INa2cy2Ro7Zdvw0+JDD23kLec3hRWayNkE=;
        b=DfH/hXd2wP+dCOU89OxMA6nMbX6PfxgBVF0qtkxL4G7KHoXHXwjGcM8b/lQEKyb+nG
         /kL82a05DtASSBZ139IQ+7TtKNlSqE1L3OxBh1X34C1PiUrAouRkGxnfhG2gcomLtw2j
         qDXjUrGajb/DDJ7tJxZJyBFaTnudNJfJHRDF5drkJD+Pur1An666HAJKRRI23yFrL4a1
         PzwcW/fhDOELwGXk7Aldti1xh79tSrpxgIe+Kj8Jwzx/xNGuVdOfCL1Z2YgAy2ktwaTA
         tq0YXBGuSzMIln/5AIueA3zzOFRP+q+1i3rhud5CiLVOVKwxLlxbd/3KnzjGEb9JfTEC
         WXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878389; x=1789483189;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1GnrkNZL+INa2cy2Ro7Zdvw0+JDD23kLec3hRWayNkE=;
        b=VZsbBACoavZo6/2hOaAN3/rdp1KEm1nknukFh6GtLf5nxkyLkfzyUcKsouR0ed6YiO
         wfkZ6KmcbkT+vZh222BGbEYlXSqu6F80fib1hkptMB6xkqq65LId6st/YZjNmBn1BT8/
         /F5cwCdUuWtMZ0ly8wVkxYbu9+/G419pgfRqKQs3ZyvYRS62oGByfXp1FY7UXbs630xb
         9oHDpATLOPyLvhpvVji7USgD3nhdKdzNkPi2eZxFNIogCTFgYnLr7FAvOgpikLGm9pLy
         VqfRqJJYl9MqIFw98h1w641cXYJWX4gz2XO3jNxApVUCancTzk5YRCtwEbwNdOvqiiQo
         dJcA==
X-Forwarded-Encrypted: i=1; AKwUvByACKORRVCrEzKKQm+CD96Z08HcHs+JIn1NM/3xKzlJrFhr9JRw38IG5d4GRJCHaDDM4Umi93vF/tvkhc4=@vger.kernel.org
X-Gm-Message-State: AFuF++lz39qhvpM/48Eq/NiLDnnrz9k0KByXOr/mGXWaZd+6EE68JUOH
	k/k+td2QQWEIMk6YhmIXytxjdHviGPJwJUkWVp9MsyZnI0NQFlZLyUUzwoV9rUlh1vV7omoVfuF
	TFGo/J+lLU+FdeeSNwZ6yBVN3qVSz/mcE8WedcEmuXP1IBR/rPteZamL1U6tbNwIRbsA=
X-Gm-Gg: AYBFou0Tbt6GF3yzzxhpdZTIb0bfIAcdr5vxhWhpIhsloVk9z2BZafJyufUUpxZ1u3A
	K94m7FnLV0noMqDX5VU0CpzdbNnrgYQf2YN+gB6MKYhg5sTB40vT9O3TVYDl/XyxCPLrMUg3Pgj
	bZSC1Suv4j1I5p+flXu4B+BYTNzcK9FC5v8dVdqhV+Z/cB+kXRkK9bVU3H8VjoO9fm56DxKx5Vu
	DRoTlE92+HaV0aQQEdwTgr2c8AikVSeDx8c+VqUXVwhzzRnSGK8SM3/Jw5jj5hO2YgKcJ45RQ4W
	ju5irNki+5gADIma0ACSDyF56j56K8hPqWypY49NhJFBx4ntygBTR3yFYEDwuR835Db8QyIgt7a
	LrqMQZY8vUxjfoT1hXv0GUQXBJTxd8Q==
X-Received: by 2002:a05:6a21:880e:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3da3bdbb2a6mr41696233637.20.1788878388741;
        Tue, 08 Sep 2026 07:39:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:880e:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3da3bdbb2a6mr41696167637.20.1788878388154;
        Tue, 08 Sep 2026 07:39:48 -0700 (PDT)
Received: from [192.168.29.80] ([49.43.227.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm31086850eec.4.2026.09.08.07.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 07:39:47 -0700 (PDT)
Message-ID: <9303e64b-00e2-4b8a-b92f-b96c0a3a5546@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 20:09:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: Re: [PATCH v2] interconnect: qcom: implement get_bw with rpmh_read
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Georgi Djakov <djakov@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908-topic-sm8x50-icc-read-rpmh-v2-1-b6f1c4205450@linaro.org>
Content-Language: en-US
In-Reply-To: <20260908-topic-sm8x50-icc-read-rpmh-v2-1-b6f1c4205450@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa01e35 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=lJ7UW0itocO6TcfiNZNlOw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=TcFiEEHan0Z3ZoItQ4QA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SzqPmsxer29mcmp6sr-K97spRAaXIz7p
X-Proofpoint-GUID: SzqPmsxer29mcmp6sr-K97spRAaXIz7p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1NiBTYWx0ZWRfX0rXIIiU0I1GO
 APbiOHyvm9ev0EUqw4MdHQq4z193hcIrJe6CH4fTR4J1jnQ7AZMm5EvZ98AmLSOL+pEcNv/zSQi
 ARlp1wT9IhR599q+W+cQkC7bJm/z6uWhUQSBxeW27OF5YYHblZOOz/iTcHo+iA6wBecTEBiWFR8
 RPO40l1qO+LoK1j0YRZfk23bxYkixrUwXydX5OpWh9fgzliahcTOsO4kZAW3fUy6fdbRtf1SESJ
 bDT9jaKREcVE7Z4HDFFaFKnWMj6a2eW/+zgwRBY/3bTOmKY3peTfbB2Zqcz7XGfAOXnZHYqE7tE
 do1/oLvFanquvd+1uk1zw+F14nMesH1K6Lx2k5B529xLR8qorub6Xf5jrt37t0c9d1AYPEClVuM
 uV9j7fJXHWdra0zjqEmqqlcEvMmCMAeIobbIzdyDBUfs6dNqCLvCX10t3A9sDXhI+Xk7V50b8hx
 ZD71HbTA9mjnSFFR8/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1NiBTYWx0ZWRfXxA0lThCPlGW6
 PCeQne1jj/jRoZ6roz21ExcLJB31SyN7ONOkd79R+IqY6OaSxWyvzTBECSKFTSYQ9wyetODE6cA
 VuFhi1xSekBbmfzR+t58F7RsEJNCmTg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080156


On 08-09-2026 13:39, Neil Armstrong wrote:
> Since we can actually read back the APPS rpmh interconnect
> BCM votes we can actually implement the get_bw() callback
> and provide a coherent average and peak bandwidth at probe time.
>
> The benefits of that are:
> - keep disabled BCMs disabled
> - avoid voting unused BCMs to INT_MAX
>
> If the interconnects are correctly described for a platform,
> all the required BCMs would be voted to the maximum bandwidth
> until sync_state is reached.
>
> Since we only get the BCM vote, we need to redistribute
> the vote values to the associated nodes. The initial BCM
> votes are read back at probe time in order to be ready when
> the get_bw() is called when a node is added.
>
> Tested-by: Georgi Djakov <djakov@kernel.org> #db845c
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Added tested-by
> - Rebased on v7.3-rc1 now the rpmh_read() is merged
> - Link to v1: https://patch.msgid.link/20251106-topic-sm8x50-icc-read-rpmh-v1-1-d03a2e5ca5f7@linaro.org
> ---
>  drivers/interconnect/qcom/bcm-voter.c | 36 +++++++++++++++++++++
>  drivers/interconnect/qcom/bcm-voter.h |  1 +
>  drivers/interconnect/qcom/icc-rpmh.c  | 60 ++++++++++++++++++++++++++++++++++-
>  3 files changed, 96 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/interconnect/qcom/bcm-voter.c b/drivers/interconnect/qcom/bcm-voter.c
> index a2d437a05a11..9014bf20adad 100644
> --- a/drivers/interconnect/qcom/bcm-voter.c
> +++ b/drivers/interconnect/qcom/bcm-voter.c
> @@ -261,6 +261,42 @@ void qcom_icc_bcm_voter_add(struct bcm_voter *voter, struct qcom_icc_bcm *bcm)
>  }
>  EXPORT_SYMBOL_GPL(qcom_icc_bcm_voter_add);
>  
> +/**
> + * qcom_icc_bcm_get_bw - get current bcm vote
> + * @voter: voter used to query bcm
> + * @bcm: bcm to get current vote from
> + */
> +void qcom_icc_bcm_get_bw(struct bcm_voter *voter,
> +			 struct qcom_icc_bcm *bcm)
> +{
> +	struct tcs_cmd cmd = { .addr = bcm->addr };
> +	int ret, i;
> +	u64 x, y;
> +
> +	mutex_lock(&voter->lock);
> +
> +	rpmh_invalidate(voter->dev);

Don't see why rpmh_invalidate() is needed before a read request.

Thanks,
Maulik

> +
> +	ret = rpmh_read(voter->dev, &cmd);
> +	if (ret) {
> +		pr_err("Error sending AMC RPMH requests (%d)\n", ret);
> +		goto out;
> +	}
> +
>
