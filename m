Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907801;
	b=SP6er74S7ReE2RcXJPZXqDp9THtxkuOy9XttmmCyvGzGLmqAWTdt0x6gCKc7X1nKMLuP
	 r9fl/7nJFgrozNkauxGLCWey1k5PMM7bzcMP11B4qdOzvabeGJc3/uRMDum8gkoX7VJv5
	 eTMZkS+t1cMDL1gO8BQt5ti6XoqOxMTSwtTnvsFxS0SwjS9tQD1EsehdqtRvmmecRFVZO
	 oMnITBHnYDWMavdsLaiBDFp4BZ1Wed2GJ8HpYO+gBQyZA+P2N0qeP7TVAgT5AMsZtRiax
	 1Sw3TJgn7XTnns8Ugt9EYE32SnOjKD2NzHiWMuMhj79u9FgZZWgVuDQgXP5eXCPh3Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ur+dA6WAYMtVc8plPd7obCovC4FNAp22JeB4ajYppFM=;
	b=jzK93AmQHx0VniEQmZu41Cv7kGiaJbVetQlFzddxF6+R5e+5o/5B1kk/D8UMI61nzcg6
	 hbnuvFTg5TTm1JNxlkln9bZDKnwyRjIJfcqtuQMm5RkzN8gYqgkB+gBEGmlCzYXxsckRg
	 r2EILQzULD8KCofE5vslHcWK+zbldh0/qYh2nCQKhlW50u/TlI9qBVkrtsYuhOK+oJLcg
	 nVc0NlRkMS1BEq5mr6OSB9utlhpqObC9FNwd7c3HODrEH2obI9fIxsYKlKEQkTKNLg86x
	 a+DKjA/Du86g6uE1CjtPGJXMRh4ddoEx7q402SSFkshOM0X6DtQ5qefMN9pk9rdAHbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ1iZR4w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs0ddwUv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E94606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E94606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VZ1iZR4w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fs0ddwUv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NLHh721616
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ur+dA6WAYMtVc8plPd7obCovC4FNAp22JeB4ajYppFM=; b=VZ1iZR4wXIYuF7yL
	i2L0fRtqiSJ1uQM1e61FDH5B9mBrH9bf1iac+Fec9nAaM/TE4E2etAgxr20LLXpE
	mDld4IsmwBWFTX83W8+cULcWocXD1Yup2NJOIx3A20yOPQRtCJpF4Dgk4AVXCQ8n
	mogWnTT85zRGhcE5hZvXv0CAFH7u6wHAg/95JMqzBg2ldM9jbggpMi1AjHIZJgQ5
	Pi5kAMfzr2jy+aXDd7drv4ZbA8NFHlOzdXrXuG3+/92r96vZuIP96ov+RnFuS+OS
	gygrxTfqsADyN6OYO5e3/CqFX2nRQgth1PCWcSvXHublVSAbV0UCd0N+Czngibvf
	oWfPSg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc88hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:29:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so5051078a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907798; x=1795512598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ur+dA6WAYMtVc8plPd7obCovC4FNAp22JeB4ajYppFM=;
        b=Fs0ddwUvwKKI+VLuerlkbxbXMuIPzbv5y65tQ03kcnSYcz1rlB5jE50MIoTCPEcs87
         wfmIhu+vxv2FFzk5dG8noe9YLkC/i6L4DKLfG6p93zXBiGpIviGuV2nrToMpbMC5CYpU
         +UE+MlgB06T5N9JP6k0b5E+J8zzY0tlUdPEl6DTAQQ3bIwqBw7Yz6DVxL7l1RIWB5zIt
         oHzJ1WSDjyT71je80qmabwp5g3cPv2UGfs1h9a0BzkUGflXe2enRnwhxntZqxSXAJ/hK
         c53AbBzKN/mf8XPsoIH8eDmGE8EPUNy5TdZsX7OqdCNKLkMD01Xc3tyoyYXaxym640vk
         gFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907798; x=1795512598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ur+dA6WAYMtVc8plPd7obCovC4FNAp22JeB4ajYppFM=;
        b=bbyqEFvM0Fdgc4R4iPewlaEQvFev71leQQjJ4K/6WrNrJ4Xp4SiWxhZ511HgQtzQj+
         VTSmDaabYK7eg9KgIMkJh510Qp3sxabuxPcDQjxVP0s4fwOOA6/pQdVuB55OrP9ZBq9f
         Orhi/KCXLcK1rCpuUVXV8FVSo3XafTvH2cLe8rLeFGIq/P/vw0clD6lemz/UmboCw1xj
         vTKmZ4wYKeuwXnY4WM0G79PTqwEDHZgIRDbf/Q3nZhxqT+EpG/J8ZwPna/sCDapHy8P7
         EycoE1xAsohVyyps5S0rssvzIdar9d5hVZkuL+PJm6fp58LayZqsiD27JWu+oWd/MUb9
         wHNg==
X-Forwarded-Encrypted: i=1; AL+hErEeXSMugXhE2Pq5kvF+aEkup5nOBjWVBv0yCLzYBNJnod8z9a9IDzF3A0f0kcL4fIKRo1HSJ37KqXeS0So=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yS6x1yleMzoHvQRB+bLwwj8dGLrVTDblaAMn3Vz728kTJQqKc
	P2rCXianCh6OSyZkODy18WDtuWL1CjuPM99pxFhO7o9OGlhi8TTC5ggL7DsbKry+rEjKWVfYgwI
	OAPbyLK+ADf8KZIGLji58bjOpWpmXGkx8V2ppxuTpyAOZiRKojNApZajvhWVN0xoWNbQ=
X-Gm-Gg: AZFdTZc+tlom+5jNwoMh5yDOZwzWrrlSkRWPLuaTX2cvEYehbmJjY2fh20bVDeMSz/I
	86L2DYUT5Q7qgCYhvOUxajFd3ZtEswfyC1M9L+0mucf5eWNTNeWg5Q1Agrw7svQ6Xw+wlqNH1We
	1mra2DJ8tLbeQJNZ7KTBM2lUZlLzI1SZjVQJG+OF1W1n3zCVj6X2cyki2Gidc02q2agPYejg2n9
	QM6BFALc5VtZ5Z/BB6PAvcQ55EDWTgfjRweNvAmF6VbzWCfTCFLYGgumE2qTpyBXWo/WUJc9L/c
	BAFuNvKfmEOiYo+/j8/BJL3EbDRUQy41N7wHg/A/hIwMdZCog+9PONBln0M7FUPxVd24lTAoz8I
	DCbeBlRPiwrHnSfVC8Xch/PT9mJ3juRgZq3hfYa1VEsGVY7OQQCXiJw1vOf4Lb043uywxlZVTHa
	R4FisIp6PwfcYRMIziXGZ/d3cvkjDirjEFi3ep9LOa2FcCuafaSiP5jR+P6vvj
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr13890134a91.1.1794907797889;
        Tue, 17 Nov 2026 01:29:57 -0800 (PST)
X-Received: by 2002:a17:90b:4d0b:b0:3b0:b03b:699f with SMTP id 98e67ed59e1d1-3b1b089e039mr13890105a91.1.1794907797252;
        Tue, 17 Nov 2026 01:29:57 -0800 (PST)
Received: from [10.79.117.97] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2cca15sm3168270a91.11.2026.11.17.01.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 01:29:56 -0800 (PST)
Message-ID: <aec5f47a-fb16-4115-bf3b-fb8aa1df59de@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:59:50 +0530
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
Subject: Re: [PATCH v2 2/4] remoteproc: qcom: pas: Support secondary images
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-2-715435f52dd7@oss.qualcomm.com>
 <20261116184430.iw5or2qzet2s2s42@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261116184430.iw5or2qzet2s2s42@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX7FLjzdh7+CUh
 Kz8mJnBg2/ykZkpMtYSSCYiwKucTjJCLm+c1R8V096pXuoG5yHbAQJdYUZPTLHtR/4NoglT8t5l
 ytLI7vvhgFKyuyo5QOeKahxVsayYyEo=
X-Proofpoint-ORIG-GUID: EQ7CIkxUtK1sz__E-YOzfYc6ynyClt4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX4ytFDF/dUr4J
 WjEP0CcowrGwaoOFXVnIlUiaMhe8TSU9WX2i5Wiai+Bh7X3+ewb55n2Qlqn2ga5Jd5UdxTxG8Ho
 1H/1knHgU2dqNrV6IsRVRyA3QeBDJ2sK+lX6GTo7aIZPCW6Nuz11SvxzrKUEKmppUuJX7vd9HiF
 NPgFusf9Eylz0d4qQNF2sMl93YN6Ldp0E4rksy5uy7TDpnLFQsQry8D0duVkEql2u0BTzxlUKH2
 UhgsRkzXMCpZ67R+lE+UrBOQok9LLLeu/87ZVqBoPQTmo37lG+B9rqy1PJK0CuURTBrhaMHkRPx
 p3hY0pjHlWnrsSMCJPLSmeN1fEW6rm+UFDpP1YaEdiumiIpNCyU+18f/8EDjBvtVqwX9aa5VjqS
 onJEerW2MDXKDdG+sy41HDnlNykeezdSE0R+wr5jaaeE+ISfC86t5zykkicm5J/LbYMAgQd3G9a
 niPvQBLLWFnyCzDslBA==
X-Proofpoint-GUID: EQ7CIkxUtK1sz__E-YOzfYc6ynyClt4o
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc1e97 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qdZlMzF9QyhxS7BQ5S4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170037



On 11/17/2026 12:14 AM, Mukesh Ojha wrote:
> On Thu, Oct 15, 2026 at 11:25:50AM +0530, Anvesh Jain P wrote:
>> The Out-of-Band Management Subsystem (OOBMSS) is managed by a common
>> remote processor and consists of two Zephyr subsystems:
>>
>> +----------------------------------------------------------+
>> |                         OOBMSS                           |
>> |                                                          |
>> |  +------------------------+  +------------------------+  |
>> |  | OOB-TEE                |  | OOB-Non-Secure         |  |
>> |  | Primary processor      |  | Auxiliary processor    |  |
>> |  | Primary image and DTB  |  | Secondary image and DTB|  |
>> |  +------------------------+  +------------------------+  |
>> +----------------------------------------------------------+
>>
>> The primary processor is the Out-of-Band Trusted Execution Environment
>> (OOB-TEE) processor. The OOB-Non-Secure processor is an auxiliary processor
>> that depends on the primary processor and cannot function independently.
>>
>> The PAS remoteproc driver currently supports one primary image and its
>> optional DTB. OOBMSS additionally requires the secondary image and DTB
>> to be loaded, authenticated, mapped, shut down, and released through
>> their own PAS identifiers and carveouts.
>>
>> Add generic PAS support for loading, authenticating, and mapping a
>> secondary image and its DTB, then shutting down and releasing both while
>> keeping the existing primary-image lifecycle unchanged.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  drivers/remoteproc/qcom_q6v5_pas.c | 240 ++++++++++++++++++++++++++++++++++---
>>  1 file changed, 222 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
>> index ca8e61254c44..0bce2f0d5b4a 100644
>> --- a/drivers/remoteproc/qcom_q6v5_pas.c
>> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
>> @@ -42,8 +42,12 @@ struct qcom_pas_data {
>>  	int crash_reason_smem;
>>  	const char *firmware_name;
>>  	const char *dtb_firmware_name;
>> +	const char *secondary_firmware_name;
>> +	const char *secondary_dtb_firmware_name;
>>  	int pas_id;
>>  	int dtb_pas_id;
>> +	int secondary_pas_id;
>> +	int secondary_dtb_pas_id;
>>  	int lite_pas_id;
>>  	int lite_dtb_pas_id;
>>  	unsigned int minidump_id;
>> @@ -83,8 +87,12 @@ struct qcom_pas {
>>  	int proxy_pd_count;
>>  
>>  	const char *dtb_firmware_name;
>> +	const char *secondary_firmware_name;
>> +	const char *secondary_dtb_firmware_name;
>>  	int pas_id;
>>  	int dtb_pas_id;
>> +	int secondary_pas_id;
>> +	int secondary_dtb_pas_id;
>>  	int lite_pas_id;
>>  	int lite_dtb_pas_id;
>>  	unsigned int minidump_id;
>> @@ -95,17 +103,25 @@ struct qcom_pas {
>>  
>>  	const struct firmware *firmware;
>>  	const struct firmware *dtb_firmware;
>> +	const struct firmware *secondary_firmware;
>> +	const struct firmware *secondary_dtb_firmware;
>>  
>>  	phys_addr_t mem_phys;
>>  	phys_addr_t dtb_mem_phys;
>> +	phys_addr_t secondary_mem_phys;
>> +	phys_addr_t secondary_dtb_mem_phys;
>>  	phys_addr_t mem_reloc;
>>  	phys_addr_t dtb_mem_reloc;
>> +	phys_addr_t secondary_mem_reloc;
>> +	phys_addr_t secondary_dtb_mem_reloc;
>>  	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
>>  
>>  	void __iomem *mem_region;
>>  
>>  	size_t mem_size;
>>  	size_t dtb_mem_size;
>> +	size_t secondary_mem_size;
>> +	size_t secondary_dtb_mem_size;
>>  	size_t region_assign_size[MAX_ASSIGN_COUNT];
>>  
>>  	int region_assign_idx;
>> @@ -123,6 +139,8 @@ struct qcom_pas {
>>  
>>  	struct qcom_pas_context *pas_ctx;
>>  	struct qcom_pas_context *dtb_pas_ctx;
>> +	struct qcom_pas_context *secondary_pas_ctx;
>> +	struct qcom_pas_context *secondary_dtb_pas_ctx;
>>  };
>>  
>>  static void qcom_pas_segment_dump(struct rproc *rproc,
>> @@ -198,19 +216,37 @@ static void qcom_pas_pds_disable(struct qcom_pas *pas, struct device **pds,
>>  	}
>>  }
>>  
>> -static int qcom_pas_shutdown_poll_decrypt(struct qcom_pas *pas)
>> +static int qcom_pas_shutdown_poll_decrypt(int pas_id)
>>  {
>>  	unsigned int retry_num = 50;
>>  	int ret;
>>  
>>  	do {
>>  		msleep(QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS);
>> -		ret = qcom_pas_shutdown(pas->pas_id);
>> +		ret = qcom_pas_shutdown(pas_id);
>>  	} while (ret == -EINVAL && --retry_num);
>>  
>>  	return ret;
>>  }
>>  
>> +static void qcom_pas_release_firmware(struct qcom_pas *pas)
>> +{
>> +	if (pas->dtb_firmware) {
>> +		release_firmware(pas->dtb_firmware);
>> +		pas->dtb_firmware = NULL;
>> +	}
>> +
>> +	if (pas->secondary_firmware) {
>> +		release_firmware(pas->secondary_firmware);
>> +		pas->secondary_firmware = NULL;
>> +	}
>> +
>> +	if (pas->secondary_dtb_firmware) {
>> +		release_firmware(pas->secondary_dtb_firmware);
>> +		pas->secondary_dtb_firmware = NULL;
>> +	}
>> +}
>> +
>>  static int qcom_pas_unprepare(struct rproc *rproc)
>>  {
>>  	struct qcom_pas *pas = rproc->priv;
>> @@ -224,6 +260,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>>  	if (pas->dtb_pas_id)
>>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  
>>  	return 0;
>>  }
>> @@ -241,19 +281,29 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>>  	if (pas->lite_dtb_pas_id)
>>  		qcom_pas_shutdown(pas->lite_dtb_pas_id);
>>  
>> -	if (pas->dtb_pas_id) {
>> -		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = request_firmware(&pas->secondary_dtb_firmware,
>> +				       pas->secondary_dtb_firmware_name, pas->dev);
>> +		if (ret) {
>> +			qcom_pas_release_firmware(pas);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (pas->secondary_pas_id) {
>> +		ret = request_firmware(&pas->secondary_firmware,
>> +				       pas->secondary_firmware_name, pas->dev);
>>  		if (ret) {
>> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
>> -				pas->dtb_firmware_name, ret);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>> +	}
>>  
>> -		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>> -					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
>> +	if (pas->dtb_pas_id) {
>> +		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
>> +				       pas->dev);
>>  		if (ret) {
>> -			qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> -			release_firmware(pas->dtb_firmware);
>> +			qcom_pas_release_firmware(pas);
>>  			return ret;
>>  		}
>>  	}
>> @@ -310,10 +360,51 @@ static int qcom_pas_start(struct rproc *rproc)
>>  			goto disable_cx_supply;
>>  	}
>>  
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
>> +					pas->secondary_dtb_firmware,
>> +					pas->secondary_dtb_firmware_name,
>> +					&pas->secondary_dtb_mem_reloc);
>> +		if (ret)
>> +			goto release_secondary_dtb_metadata;
>> +
>> +		ret = qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					    pas->secondary_dtb_mem_size);
>> +		if (ret)
>> +			goto release_secondary_dtb_metadata;
>> +
>> +		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
>> +		if (ret)
>> +			goto unmap_secondary_dtb_carveout;
>> +	}
>> +
>> +	if (pas->secondary_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->secondary_pas_ctx,
>> +					pas->secondary_firmware,
>> +					pas->secondary_firmware_name,
>> +					&pas->secondary_mem_reloc);
>> +		if (ret)
>> +			goto release_secondary_metadata;
>> +
>> +		ret = qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
>> +					    pas->secondary_mem_size);
>> +		if (ret)
>> +			goto release_secondary_metadata;
>> +
>> +		ret = qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
>> +		if (ret)
>> +			goto unmap_secondary_carveout;
>> +	}
>> +
>>  	if (pas->dtb_pas_id) {
>> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
>> +					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
>> +		if (ret)
>> +			goto release_dtb_metadata;
>> +
>>  		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>>  		if (ret)
>> -			goto disable_px_supply;
>> +			goto release_dtb_metadata;
>>  
>>  		ret = qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
>>  		if (ret) {
>> @@ -344,13 +435,16 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>>  	if (ret == -ETIMEDOUT) {
>>  		dev_err(pas->dev, "start timed out\n");
>> -		qcom_pas_shutdown(pas->pas_id);
>>  		goto unmap_carveout;
>>  	}
>>  
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>>  	if (pas->dtb_pas_id)
>>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  
>>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>>  	pas->firmware = NULL;
>> @@ -358,16 +452,37 @@ static int qcom_pas_start(struct rproc *rproc)
>>  	return 0;
>>  
>>  unmap_carveout:
>> +	qcom_pas_shutdown(pas->pas_id);
>>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>  release_pas_metadata:
>>  	qcom_pas_metadata_release(pas->pas_ctx);
>> -	if (pas->dtb_pas_id)
>> -		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> -
>>  unmap_dtb_carveout:
>> +	if (pas->dtb_pas_id) {
>> +		qcom_pas_shutdown(pas->dtb_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
>> +					pas->dtb_mem_size);
>> +	}
>> +release_dtb_metadata:
>>  	if (pas->dtb_pas_id)
>> -		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>> -disable_px_supply:
>> +		qcom_pas_metadata_release(pas->dtb_pas_ctx);
>> +unmap_secondary_carveout:
>> +	if (pas->secondary_pas_id) {
>> +		qcom_pas_shutdown(pas->secondary_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
>> +					pas->secondary_mem_size);
>> +	}
>> +release_secondary_metadata:
>> +	if (pas->secondary_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
>> +unmap_secondary_dtb_carveout:
>> +	if (pas->secondary_dtb_pas_id) {
>> +		qcom_pas_shutdown(pas->secondary_dtb_pas_id);
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					pas->secondary_dtb_mem_size);
>> +	}
>> +release_secondary_dtb_metadata:
>> +	if (pas->secondary_dtb_pas_id)
>> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
>>  	if (pas->px_supply)
>>  		regulator_disable(pas->px_supply);
>>  disable_cx_supply:
>> @@ -413,7 +528,7 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  
>>  	ret = qcom_pas_shutdown(pas->pas_id);
>>  	if (ret && pas->decrypt_shutdown)
>> -		ret = qcom_pas_shutdown_poll_decrypt(pas);
>> +		ret = qcom_pas_shutdown_poll_decrypt(pas->pas_id);
>>  
>>  	if (ret)
>>  		dev_err(pas->dev, "failed to shutdown: %d\n", ret);
>> @@ -426,6 +541,27 @@ static int qcom_pas_stop(struct rproc *rproc)
>>  		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
>>  	}
>>  
>> +	if (pas->secondary_pas_id) {
>> +		ret = qcom_pas_shutdown(pas->secondary_pas_id);
>> +		if (ret && pas->decrypt_shutdown)
>> +			ret = qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
>> +		if (ret)
>> +			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
>> +
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
>> +					pas->secondary_mem_size);
>> +	}
>> +
>> +	if (pas->secondary_dtb_pas_id) {
>> +		ret = qcom_pas_shutdown(pas->secondary_dtb_pas_id);
>> +		if (ret)
>> +			dev_err(pas->dev,
>> +				"failed to shutdown secondary dtb: %d\n", ret);
>> +
>> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
>> +					pas->secondary_dtb_mem_size);
>> +	}
> 
> Nit: It does not matter, but moving this before the primary one would be
> ideal. You can do it if you send a revision to the series.
>

Ack, I will reorder this accordingly in v3.

>> +
>>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>>  
>>  	handover = qcom_q6v5_unprepare(&pas->q6v5);
>> @@ -740,6 +876,42 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
>>  	if (IS_ERR(pas->dtb_pas_ctx))
>>  		return PTR_ERR(pas->dtb_pas_ctx);
>>  
>> +	if (!pas->secondary_pas_id)
>> +		return 0;
>> +
>> +	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 2, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pas->secondary_mem_phys = res.start;
>> +	pas->secondary_mem_reloc = res.start;
>> +	pas->secondary_mem_size = resource_size(&res);
>> +
>> +	pas->secondary_pas_ctx =
>> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_pas_id,
>> +					    pas->secondary_mem_phys,
>> +					    pas->secondary_mem_size);
>> +	if (IS_ERR(pas->secondary_pas_ctx))
>> +		return PTR_ERR(pas->secondary_pas_ctx);
>> +
>> +	if (!pas->secondary_dtb_pas_id)
>> +		return 0;
>> +
>> +	ret = of_reserved_mem_region_to_resource(pas->dev->of_node, 3, &res);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pas->secondary_dtb_mem_phys = res.start;
>> +	pas->secondary_dtb_mem_reloc = res.start;
>> +	pas->secondary_dtb_mem_size = resource_size(&res);
>> +
>> +	pas->secondary_dtb_pas_ctx =
>> +		devm_qcom_pas_context_alloc(pas->dev, pas->secondary_dtb_pas_id,
>> +					    pas->secondary_dtb_mem_phys,
>> +					    pas->secondary_dtb_mem_size);
>> +	if (IS_ERR(pas->secondary_dtb_pas_ctx))
>> +		return PTR_ERR(pas->secondary_dtb_pas_ctx);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -823,6 +995,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	struct rproc *rproc;
>>  	struct device_node *node;
>>  	const char *fw_name, *dtb_fw_name = NULL;
>> +	const char *secondary_fw_name = NULL;
>> +	const char *secondary_dtb_fw_name = NULL;
>>  	const struct rproc_ops *ops = &qcom_pas_ops;
>>  	int ret;
>>  
>> @@ -847,6 +1021,24 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  			return ret;
>>  	}
>>  
>> +	if (desc->secondary_firmware_name) {
>> +		secondary_fw_name = desc->secondary_firmware_name;
>> +		ret = of_property_read_string_index(pdev->dev.of_node,
>> +						    "firmware-name", 2,
>> +						    &secondary_fw_name);
>> +		if (ret < 0 && ret != -EINVAL)
>> +			return ret;
>> +	}
>> +
>> +	if (desc->secondary_dtb_firmware_name) {
>> +		secondary_dtb_fw_name = desc->secondary_dtb_firmware_name;
>> +		ret = of_property_read_string_index(pdev->dev.of_node,
>> +						    "firmware-name", 3,
>> +						    &secondary_dtb_fw_name);
>> +		if (ret < 0 && ret != -EINVAL)
>> +			return ret;
>> +	}
>> +
>>  	if (desc->minidump_id)
>>  		ops = &qcom_pas_minidump_ops;
>>  
>> @@ -879,6 +1071,14 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  		pas->dtb_firmware_name = dtb_fw_name;
>>  		pas->dtb_pas_id = desc->dtb_pas_id;
>>  	}
>> +	if (secondary_fw_name) {
>> +		pas->secondary_firmware_name = secondary_fw_name;
>> +		pas->secondary_pas_id = desc->secondary_pas_id;
>> +	}
>> +	if (secondary_dtb_fw_name) {
>> +		pas->secondary_dtb_firmware_name = secondary_dtb_fw_name;
>> +		pas->secondary_dtb_pas_id = desc->secondary_dtb_pas_id;
>> +	}
>>  	platform_set_drvdata(pdev, pas);
>>  
>>  	ret = device_init_wakeup(pas->dev, true);
>> @@ -925,6 +1125,10 @@ static int qcom_pas_probe(struct platform_device *pdev)
>>  	pas->pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>>  	if (pas->dtb_pas_id)
>>  		pas->dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>> +	if (pas->secondary_pas_id)
>> +		pas->secondary_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>> +	if (pas->secondary_dtb_pas_id)
>> +		pas->secondary_dtb_pas_ctx->use_tzmem = desc->needs_tzmem || rproc->has_iommu;
>>  
>>  	if (desc->early_boot)
>>  		pas->rproc->state = RPROC_DETACHED;
>>
>> -- 
>> 2.34.1
>>
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 

-- 
Best Regards,
Anvesh

