Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D638B7D1
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302578; cv=none; b=nI7ipOV5FNrVBx8SUva+N2YZclhQRcxfqV7a1Iepp6REjKQmtlVgRoaG+96vbsop52WzHxpR6GdaCftvadgOSrFud2vgwEhWw1QL1/H5D6sQo3JSqQqsYf6zHskoJN5BtOnR9uPe9j2bFdlNs7tA/fAgYHixY4Zts0qzjHC+mn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302578; c=relaxed/simple;
	bh=q4fjasdbU8CXhGSf2wuaRkMDY3/HoQshsdxG8+nanK8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPODPwK0mTDKHzu6xSfBpp7H2DNbe8h6imualM2Yzncuto5M1Jj7hU6ekKqA8w+ObNAI4RFLgbfm8boygd8Fq4Yawq/JslBDKKJrPOuwB2HHuonk9KSkAYkdJpKH99fuEgqDOJMfh42zXGyBA9ZjEi1V/EzSeyETkC8J5ibWDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FL9EYaGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MFPvU479; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FL9EYaGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MFPvU479"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAUITV1368159
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZiFSE7w9X8V3sAW5JuIVDzme0ri8XnMafaiPz34DX4=; b=FL9EYaGMQ0b5VDOj
	PiQ/4dO76aXUP2SPqZjLwU+EZxVq3h7SBvFU7LKanL8DqXajvIWvvKV60rNS3kPd
	bDRnes5O5Db8ljQOzTXe231eOEStTDbRM7uHhVqgVNuBIEuOo325FFkqzGF32F/6
	MD9dsOdSlmKZ7ZDCMAbhQlRfSl1Rmem7SzlT9/OWe0F6PDCkjxkI/T5Djg7Sc5ej
	O9Zt9et3m/QDPWEeisZceROrJARdJc/p53hoNoNu4uB+63tih8/drwFhnu0uvaDq
	X97welWz09qhtIzBBJWXjGABsPQYEvzxgtE9osH2mKpcL2IvKWh2A5dG6iOWb3t4
	LDJmtA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9db68q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:29:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39d865b11b4so628273a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 05:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302575; x=1789907375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZiFSE7w9X8V3sAW5JuIVDzme0ri8XnMafaiPz34DX4=;
        b=MFPvU4797a7u0IqpfJsH1d0r//PWGO3uyBSqt49j3CcccXvxlkUASHqDtTE0i15aE/
         prYsIsLFTcAfBOZGSM+C4Nr/7dI7A4L9FDk1W2gS9i4RvBC9Cb6h4ykR8DlBfRqpcbZa
         QWXC2OBnBPkk7SacoRH4h3fZeI3pj7surJvV4IW/twf+VmjR698AN26IJJ5/izU7JA7I
         uLFbfotQYKw4aB8I0OG2TOm0uo3wSdQuGQEsxsoBPjaYLjRiaT9eUS2qxgcvXugYyWCj
         kj6lubMOt7wysy7B3kKAGgAdP57Qis4o3m5FrXq+y6PQTMbFeaPs3QnspM9+83Nj++Ei
         ybEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302575; x=1789907375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZiFSE7w9X8V3sAW5JuIVDzme0ri8XnMafaiPz34DX4=;
        b=eAI5ppy79vE8bWHtQdi0WftT1lwh7/BdOADvFOqkzAe+8o4bfg20fT9P2QsvEAf3VM
         XJBgwrTVf7wb+xP+wz+8CXQOZE5/VNNRDrJ5AUOWE7D/QZ64URnKzgBPJNSAOhU1NTWh
         HewnnmUjqLF8oRbLwli+H41n3MyeAkEqnelau0bwJzbeQ117K/12p2/IzfIqDqSq/MZg
         ZQwssi2M8YQYGnIU8nD61a9zwa5q17VAMnjta8nTE0ygI2UuKWYsjBpzI0VLGdVqUaDO
         kz0egdjxYq3G8XkUKk7vmoX7sQOb9+mjD9MCh3kD+cHR4kfscfHzEhxT5nlGQsULmD+q
         JVyg==
X-Forwarded-Encrypted: i=1; AKwUvBw/Pja85d+5jT1gLlrcea0YRTeG9MixHGnuBcE2JeBkl3HLXZa1vYqh2Y8aQdW6Ntdpjc33ouIp4ZXvA74=@vger.kernel.org
X-Gm-Message-State: AFuF++l6qIf4mBM7gjYmz8rdHjae6F11EQ985raIDope8RjOz6nal9yW
	4OvbrgjQ1CmhJHl4U0sVYGwWcMEWykWV3VMrf6v0bAnSVWgLGDFUx2vutNz/vloIUNrd1AqPrA2
	UsN+IU6zXISTv3EcL/krsQfcXWKeFJciMN4adZ22caCPciFAP887+BD7ZiKxOfrkwlR0=
X-Gm-Gg: AYBFou2hWYCrOGCsTgTP7KKvk1n4btoxEtWUSAdlqqt18uFRzZRVWqsJCwVeY02vqGz
	VEkSxiGirD5aW72rqxotSGi9YvAROLHTNA6K+FfvnA355AzO43UOkLQk7M+Mk6lPYOP0e408bKj
	oUMjFTHYPaLsJzalvyw6glBpP2KFVl32litxetK3Y9ezxaPYFSiFOtyMv/7dbexSGAuD4je55/C
	fi+XarvRupP1hNMjerwN9VsFaBBYJ9Ny8vvzkUL0SJPEH9ap7FV3YYbENuMGRB+nu5AdxpCKig7
	nOz5kS3YX9/QMNe2ym8HSDswdaRPSO0NrWfw/+/7zynUHedyKZNVcxZQstWLCXtEK/6nQVbAPlp
	5qszOkfYYaelZKh75yhOF2QR36gewaw==
X-Received: by 2002:a17:90b:440e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39d9bc0ff30mr22214177a91.4.1789302574672;
        Sun, 13 Sep 2026 05:29:34 -0700 (PDT)
X-Received: by 2002:a17:90b:440e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39d9bc0ff30mr22214130a91.4.1789302574164;
        Sun, 13 Sep 2026 05:29:34 -0700 (PDT)
Received: from [192.168.29.80] ([49.43.227.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8ead8sm18732494c88.10.2026.09.13.05.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 05:29:33 -0700 (PDT)
Message-ID: <f87533c8-1e37-4977-be55-00d91dc40c76@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 17:59:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
References: <20260812-rpmh-timeout-debug-v1-v3-0-68c0a40dce23@oss.qualcomm.com>
 <20260812-rpmh-timeout-debug-v1-v3-3-68c0a40dce23@oss.qualcomm.com>
 <e9288bd8-20e8-4cc7-9f51-be64c2b60e16@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <e9288bd8-20e8-4cc7-9f51-be64c2b60e16@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfXwXGSLgYceZ+l
 gP8s/fRr0y09Qx0Yc0sjhORgQiLybPHA/Qf6/PA8NATxBXiYOpOsL5LByecetJrg0HGJnragxoj
 ou5gIbxmtjxo4Reg3m7g4hlxp5Ji3pXQDzQSesjYoxbCcVhJZoJfHwbg0BQoNhXlmWvaqeseJ7y
 YKsY2szFp5E3ObZNu86r/fHhLdOSfOSo6UYYoXSuqO+iduEudvUgW9j/XzYfNKZMI6cqivtf0/H
 SatEKFX2D7606Iu8fw92xioAxVMqtOorLYnMMhtLKSV2zFICo6xCrgHv91/r9wvE6dYfhn/57m8
 sBHvjcGVB4ARCuiXrSSVkfLF/upTDBbQ2XCNxphzIZQwUdrqZge9wY+DjJn9cpaoiWV2c09YeRw
 7W0gAYR1jO2M8QHdZCk4jbU1MBp08Se3RvPVQmV8W1TGVm3MPBlX82b4mHDrFhc6BjI9BmvngwH
 IZWbg52zUSoDPjYCJ5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX5Xt6quhjozVa
 J5kbJ3+ALJj4KOpRj5r/9/h9JgkZriCkivgoOmPgOWNIoUXkcwxGe7ViQALCij0kDUDS1jDbTnk
 FWAe5lS3nVY1RijE2pGiuazm7hyHgdc=
X-Proofpoint-GUID: pPsLzfEFAYUdzjK4X4UkAGWDkWjcxEEa
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa6972f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=+gzpuW31rJJ6FpSIJpHnyQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=LpQP-O61AAAA:8 a=Q5UiuzsbWbT1xojvao0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-ORIG-GUID: pPsLzfEFAYUdzjK4X4UkAGWDkWjcxEEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130178


On 17-08-2026 19:58, Konrad Dybcio wrote:
> On 8/12/26 8:12 AM, Maulik Shah wrote:
>> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
>>
>> When an RPMh transfer times out there is no visibility into which
>> TCS was stuck, what commands it was carrying, or whether the
>> completion IRQ was pending at the GIC. Add rpmh_rsc_debug() to
>> capture this state at timeout:
> [...]
>
> Looking good overall, some minor comments
>
>> +static void print_tcs_info(struct rsc_drv *drv, int tcs_id,
>> +			   bool *aoss_irq_sts)
>> +{
>> +	const struct tcs_request *req = get_req_from_tcs(drv, tcs_id);
>> +	unsigned long cmds_enabled;
>> +	char rname[CMD_DB_ID_SIZE + 1];
>> +	u32 addr, data, msgid, sts, irq_sts;
>> +	bool in_use = test_bit(tcs_id, drv->tcs_in_use);
>> +	int i;
>> +
>> +	sts = read_tcs_reg(drv, drv->regs[RSC_DRV_STATUS], tcs_id);
>> +	cmds_enabled = read_tcs_reg(drv, drv->regs[RSC_DRV_CMD_ENABLE], tcs_id);
>> +	if (!cmds_enabled)
>> +		return;
>> +
>> +	if (!req)
>> +		goto print_tcs_data;
>> +
>> +	data = read_tcs_reg(drv, drv->regs[RSC_DRV_CONTROL], tcs_id);
>> +	irq_sts = readl_relaxed(drv->tcs_base + drv->regs[RSC_DRV_IRQ_STATUS]);
>> +	pr_warn("Request: tcs-in-use:%s state=%d wait_for_compl=%u\n",
> Let's use dev_foo() everywhere instead of pr_foo, you have a struct dev* in
> drv->dev
Ack.
>> +		in_use ? "YES" : "NO",
> Please use str_yes_no() here, or AI contributors will rush to "fix" it..
>
> [...]
Ack.
>
>> +/**
>> + * rpmh_rsc_debug() - Dump debug information on a transfer timeout.
>> + * @drv:   The RSC controller.
>> + * @compl: The completion object that timed out.
>> + *
>> + * Dumps TCS state for all in-use TCSes and reports which accelerators
>> + * did not respond, to aid in diagnosing RPMH timeout failures.
>> + */
>> +void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl)
>> +{
>> +	struct irq_data *rsc_irq_data = irq_get_irq_data(drv->irq);
>> +	bool gic_irq_sts, aoss_irq_sts = false;
>> +	int i, busy = 0;
>> +
>> +	pr_err("RSC:%s\n", drv->name);
> Let's perhaps touch this up to sth like "Timeout on RSC %s\n"

Ack. Updates in v4.

Thanks,
Maulik
>
> Konrad
