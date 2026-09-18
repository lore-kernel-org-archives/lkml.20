Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667353090C2;
	Fri, 18 Sep 2026 15:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746983; cv=fail; b=oS4YZCbG7udsgdameqQdK1OTxvtvaLByehmMaJ9Dx8H4nBqkfR0mJQUIU2ntsef22Jddm+Bkhi4VZ9hg45SHwtiCW7UP+E3oQ0f3cJHL0nYC/tw3MuwuxKKh/zbuB5dbOZUFlMLQtN8+7N9OBBwWr69khTDfEnberILCIo+I7Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746983; c=relaxed/simple;
	bh=pjFKKE0mpOorDlWZif8bo8JMBwvCipUh4WGX0/5jgjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iuVuvM66+U/mxmtzf919ZiqApLy6lSnZazcTPWBjg9NGAxHgVSa1dBWR2IPePfGL1MTy12tWwQrnAIp1AFUd3EesFBnwWU1NNa+uD8sZl/3yo77b0D7wcqPiuwNpE8XB7NPCkIZwcgV6fPoeqyVK0YhKV1eo3f88rBNl1Br8d6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=EF4p26ee; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A0LC9k1o; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="EF4p26ee";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A0LC9k1o"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEJdRM571742;
	Fri, 18 Sep 2026 10:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xwHYF3pZ6S7IKCKmdXpJbdiA8tUOqN4SdVKVkE57w
	hE=; b=EF4p26eeduPQ0JcXyckTIJFGLw99raoBQyJWvyiFY3o+ys6kpyPYTC2I8
	Bf8zt7A4xJQSFnxlEEhKTnJA0w0tEYTVSUrlQ7w6vi1GqVI6vGiK8bZIe8cNsGQZ
	59oolmtqOG8XAjGX5776BsAMog3rdboWqUo8aKNpznG6GN87hecAOaikXhMI3Vqw
	hsTYYILc5YieB9SwukI0AMLzKtWpjshTpO2PZWnA0ph7Clwr9NzHiAnIEQqymK94
	IezUoaqKZNdg1SiyNWKhqen9VSF3EXX3IpL7PaD89bc880disQvJ05h8sRzWyZfu
	Fb6V5HmGmdjKQeWIMuBLpnAdPGurw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gs0k3awmq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 10:56:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR2i7be9QQfe132xleJ11Imawh66MjRzwXmfsw2QRgIIGeZS57q7BL/R+Eo9UtzH1tEmgMlGXSpOgxcXuZyghRfWHiKjXTkERwism5dc8b24/fWl4w25Se3biz2MOzWhMR1Kerj3zWfgZ5EHHYFW6AxY/eyMLYbMeHT/nFoP37TnszRjiqLpkmpdDH2NqyzjN9JDyeXPrB5uumfYvFddE0no+43rAC1R8BOSEWaGwHrqXdOvnn/ga2KCYAV5WLEAWagJIopVTsO0hGCA28Px3ps5k+20h/KEmrIZAOPdFGG8EThA4kqfhqGDAiEB3ZqSSmxmeoWwo6ok+23tVxHUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwHYF3pZ6S7IKCKmdXpJbdiA8tUOqN4SdVKVkE57whE=;
 b=JDzPUTeU1q085XPsOTCIePpcMAAJui3TxP1cR7piOlRPZQI9UFRlEVrS+gkE8KxFgjoe91W6HnAHnrDBUbQWrYNBhdppE8zKZC+DnjJGVRPHLjWnDoXIRty/y2Fzx2BmP1vgbLBmq0sb4QJxY8BQDyAKOBnaCw4Xv9we1dOk1FmRiqc4agi45508mc568+YoBQYjxCBTx2HwN0Mdo6asaVh9TlmAbDMNuV91fnrHcIowH8s5QeSr1pB2a+IR2ofFpinGU8ZFg7XgfZzwOHT/RxxLpaicR8y3wlNhlXt4yHyN+JRGfNPnqul0uOR5GSRPk9OvkUF7ztNuSFOK956t2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwHYF3pZ6S7IKCKmdXpJbdiA8tUOqN4SdVKVkE57whE=;
 b=A0LC9k1o+Me/ziIVVRo9Thneytt+xD/xC6juyPVrF8W2LAMTHLScp4JdG6hDFNTK64a8uf5sbXI4hzlsA7tXCG4JMTO4Css8OjrSCgNjtahsNz9WGH7r6+t2wUoy3x3ejq5SzNXZymsEqpZG9p7o5Bpd8o7vJ7+6Lw4O238lcB4=
Received: from CH0P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::27)
 by PH0PR10MB4725.namprd10.prod.outlook.com (2603:10b6:510:3e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 15:56:06 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::89) by CH0P221CA0001.outlook.office365.com
 (2603:10b6:610:11c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.13 via Frontend Transport; Fri,
 18 Sep 2026 15:56:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 15:56:05 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 10:55:47 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 10:55:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 10:55:46 -0500
Received: from [10.24.51.87] (devarsh-precision-tower-3620.dhcp.ti.com [10.24.51.87])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68IFtim21983013;
	Fri, 18 Sep 2026 10:55:44 -0500
Message-ID: <b6994778-7e69-435d-9f41-e46795397726@ti.com>
Date: Fri, 18 Sep 2026 21:25:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] media: imagination: e5010: Enable autosuspend for
 runtime PM
To: Brandon Brnich <b-brnich@ti.com>, <mchehab@kernel.org>,
        <hverkuil@kernel.org>, <sebastian.fricke@collabora.com>,
        <benjamin.gaignard@collabora.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20260831213231.2125544-1-b-brnich@ti.com>
 <20260831213231.2125544-5-b-brnich@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20260831213231.2125544-5-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|PH0PR10MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: 58c81569-26dc-4e96-8f8b-08df159d58e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|10067099003|4143699003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	N5IG9Zm3NaL0gx58NZTYWi2HW0kknh5fIpd02mT1CqKUousOocBbjc9GC9SpCp7gEPy9rO79QfDMANVRxsvq2oMCQuARD8eIHd+V+wRIIbiJCr8/OR+/ax57oytK7xMFY7YfnspSl3eo5zP95Z96wMY81j436WSbtG/naYporFuC/Xmlm9NiTjn30X2MJG8BWKnI7aHy6RGUlIsvghndXRQEx4nkPswkQuQO2qI2Eskzvame4NHXt/jCqjBJkzwelu4280ZqmXrxCyEsxwNPrYf0/H8nDF1tvBW84Eu/ieLMp5+M1pDUeBLjJrSb2ykZOvcXLOgcFxAMzmyJ3Nyjr0yRHn96N1EvpdEDZ/RUpTlrEqGKWu5eYSGy4bp1f4v5wrp5stVwJMYDu53hSRLoU8/WhRasln+ZNF7jVHvweRkgxJuCguY97W2mbRylBxou9+Gn8ORAOogcuDuCVY3BsjYxWlGWW5sVHB9merNXZb3Cv6sMSqwwzbo9n7UlVM3+RLpcZql2YPCjdym//fXSunVxXvmdnIHgIwlwfiwel8UKbt4JqxRJHPgvq7JPIB7xAg888wXkE0L8XgRWw37ekRWSfe6Jz4TxZ7B+TtkdioMOAdKQHrC8emi6M2i9ziCFwHtK2dt/fBgZqY75JVoIlzHNqQJTQGvYZ+8mCRDNkFadILjSw8GKowTf8Ggzw6wxm5hCjmO3KIWARSykH4J5Jg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	k70DNe+o7ssAXdjSkmAs0rb7TwDJ6xFoCQ1eLWrOTIbui95zYrIyLp8OYdqnnq1NVDs7siwKqy14a76EnCYDACnF6EKsnzdBS4VBTYOYYqkSIqQPBNwM+zPkG8xe2SKuvuBVwtcnRHACjwzPrkf/Yjg5MhBsnFAoHRYWflsM0090RgGOrk6XrHX2GJKIAJ1UqzxFrv0cTG8RpJD4ZYvCnmBH67Dc2Yn5gEfbwmdUVPaOyhLa7y73Vycvf9l5l2LX9Nvt+Up5kGo8nCH4hnwC196z9Pra2qzN3ZJLviyMPPmCGUQw0yiv/3YUyI/3gojAHeAyoGUqMdb8D6sQLLcUXGaX9qkly9/ZbvGomlLgPycJ5M6fhhyQr4GCAp+omY4Pg452CvZ/CoV4pMpmjpHCRqVoqwIihow3dJg0azBS8BTm/GURyqe2PeDbyy1DMg1z
X-Exchange-RoutingPolicyChecked:
	bXHC4cLNmnKJc6EbFGBfM56CCRtIOVMT2/iEpn11zitfXkf9BpGmIFjTIvyruCnIAc1QSS1kTrDSyXFZs0Mvw/GdCrWY4FVJ+1XjDKlhIDGFuH7CHrY8y/atO/RVDN6Ot/sFNZIpVLcvX2DcMtSzWLdPMVilB5lr48l+Mqg/CSBok16oiE0QbZYgn4iHwJpTnSCNAQMhwFeal7c6XlF78QdiETVSSU8dEn0xYaxLWb9XpiTW5AAeDVwTgUfi6pJ2vg8ZfNtKr8Pj9J2ttH14oQ2wdW6/yJByc2EWhdyLMP9kjKN7eZiQe096jXzx5Iw0EzFY14bToRxwO48mKg+eVA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 15:56:05.4718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58c81569-26dc-4e96-8f8b-08df159d58e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4725
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIyNyBTYWx0ZWRfX1xjWI4o/UDsY
 2CqmPExtl9GFVQtpDtKXWFgM/TemQ9flqaXWfbNKHzCzc6ogi/frA5WkTYGkCby9miN9orZRw4V
 aWb7zM0LR+UGv7I2ubFcXZXfBTxsHLs=
X-Authority-Analysis: v=2.4 cv=K6S3jCWI c=1 sm=1 tr=0 ts=6aad5f19 cx=c_pps
 a=FnNH6Hr+id3EzXqhVuY+iw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=W6E41R0lDiBO3CxXzIoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIyNyBTYWx0ZWRfXwyVusfHct98b
 mGY/BOCdCLBtYJdQWJkedn0uSSgqULZnXu/U7gwptYNbh9x6rhztu2rCXyvea9il7vYBKJyXCMF
 IDgRKWd4EcqgtQxFgJeGvNoxv5AY0F34CZJaounbhSjj72jtDlaH+1gAXnm64pS/q3zQKi3IzfS
 zhf6V3F+s1+wdeOuTDvjRovxVrJyXappR0GIDy6bWZb/0LlVIoZVz+4IXf3w8mLD1PxCnMsdAjK
 7ivLCfntBm+etygT7tRS45JfplDCusMlRpRTrD4/YG/NTX9UjIVmDRnjI0Zt7cYDPZs5yxtD8BI
 8QvCvXLdCPqi5wOof0LdFHWquDjC8YqtL2VTLbV6W65cxvz2wUcfwiIl6Qt6HRnW5RRtQl4Li1Z
 +CYPz8RPBIvokebSzps0ZNZ34IX9USdMuS9aJqGgfF9Hd3AZjw7Jl/kBg0cpQCbmkGNc3WSDZ1w
 V+P748WFdKIkhYO6RPA==
X-Proofpoint-GUID: rfuvd0ajY_iGAgef21m5_7Zu98oFylpE
X-Proofpoint-ORIG-GUID: rfuvd0ajY_iGAgef21m5_7Zu98oFylpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180227

Hi Brandon,

Thanks for the patch.

On 01/09/26 03:02, Brandon Brnich wrote:
> Current implementation only has one call to turn the device on -
> start_streaming. This can waste power of device as the device can be in
> STREAM_ON state, but no buffers are actually being submitted.
> 
> Need to set last_context_run to NULL in resume hook. This will trigger
> QP value updates during next call to device_run.
> 
> Signed-off-by: Brandon Brnich <b-brnich@ti.com>
> ---
>   .../platform/imagination/e5010-jpeg-enc.c     | 41 ++++++++++---------
>   1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/imagination/e5010-jpeg-enc.c b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> index 488f5d7e4c9d5..79347014562bd 100644
> --- a/drivers/media/platform/imagination/e5010-jpeg-enc.c
> +++ b/drivers/media/platform/imagination/e5010-jpeg-enc.c
> @@ -976,6 +976,7 @@ static irqreturn_t e5010_irq(int irq, void *data)
>   
>   	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
>   	dprintk(e5010, 3, "ctx: 0x%p Finish job\n", ctx);
> +	pm_runtime_put_autosuspend(e5010->dev);
>   
>   job_unlock:
>   	spin_unlock(&e5010->hw_lock);
> @@ -1105,6 +1106,11 @@ static int e5010_probe(struct platform_device *pdev)
>   		goto fail_after_video_register_device;
>   	}
>   
> +	ret = e5010_init_device(e5010);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to init device\n");
> +		goto fail_after_clock_enable;
> +	}
>   


I think we already do e5010_init_device(e5010) in runtime_resume,

I understand your goal here is to handle for scenario where PM is not 
enabled but it's kind of duplication for the scenario where PM is 
enabled already. I would suggest to wrap this (and also the clk_enable 
from previous patch) with a check :

I think in probe itself have a check :

if (!pm_runtime_enabled(dev)) {

// do clock enable
// do init device

}


>   	ret = video_register_device(e5010->vdev, VFL_TYPE_VIDEO, 0);
>   	if (ret) {
> @@ -1112,7 +1118,11 @@ static int e5010_probe(struct platform_device *pdev)
>   		goto fail_after_clock_enable;
>   	}
>   
> +	pm_runtime_set_autosuspend_delay(dev, 100);

Better to use a macro for the timeout delay.

> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
>   	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
>   
>   	v4l2_info(&e5010->v4l2_dev, "Device registered as /dev/video%d\n",
>   		  e5010->vdev->num);
> @@ -1299,31 +1309,13 @@ static int e5010_encoder_cmd(struct file *file, void *priv,
>   static int e5010_start_streaming(struct vb2_queue *q, unsigned int count)
>   {
>   	struct e5010_context *ctx = vb2_get_drv_priv(q);
> -	int ret;
>   
>   	struct e5010_q_data *queue = get_queue(ctx, q->type);
>   
>   	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
>   	queue->sequence = 0;
>   
> -	ret = pm_runtime_resume_and_get(ctx->e5010->dev);
> -	if (ret < 0) {
> -		v4l2_err(&ctx->e5010->v4l2_dev, "failed to power up jpeg\n");
> -		goto fail;
> -	}
> -
> -	ret = e5010_init_device(ctx->e5010);
> -	if (ret) {
> -		v4l2_err(&ctx->e5010->v4l2_dev, "failed to Enable e5010 device\n");
> -		goto fail;
> -	}
> -
>   	return 0;
> -
> -fail:
> -	e5010_vb2_buffers_return(q, VB2_BUF_STATE_QUEUED);
> -
> -	return ret;
>   }
>   
>   static void e5010_stop_streaming(struct vb2_queue *q)
> @@ -1339,8 +1331,6 @@ static void e5010_stop_streaming(struct vb2_queue *q)
>   	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx)) {
>   		v4l2_event_queue_fh(&ctx->fh, &e5010_eos_event);
>   	}
> -
> -	pm_runtime_put_sync(ctx->e5010->dev);
>   }
>   
>   static void e5010_device_run(void *priv)
> @@ -1353,7 +1343,15 @@ static void e5010_device_run(void *priv)
>   	unsigned long flags;
>   	int num_planes = ctx->out_queue.fmt->num_planes;
>   
> +	ret = pm_runtime_resume_and_get(e5010->dev);

> +	if (ret < 0) {
> +		dev_err(e5010->dev, "Device failed to turn on\n");
> +		v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);

You also need to remove buffers from queue and return back as 
VB2_BUF_ERROR I think you should do this after the initial check in 
driver, something like below should work :

	if (!s_vb || !d_vb) {
		/* Buffers aren't even ready; end the job immediately without touching 
power */
		v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);
		return;
	}

	ret = pm_runtime_resume_and_get(e5010->dev);
	if (ret < 0) {
		dev_err(e5010->dev, "Device failed to turn on\n");
		/* Jump directly to the clean-up path that skips unlocking the unheld 
spinlock */
		goto device_turn_on_fail;
	}

	spin_lock_irqsave(&e5010->hw_lock, flags);

...
...

device_busy_err:
	e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
	spin_unlock_irqrestore(&e5010->hw_lock, flags);

device_turn_on_fail:
	pm_runtime_put_autosuspend(e5010->dev);
	if (s_vb) {
		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
		v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
	}

	if (d_vb) {
		v4l2_m2m_dst_buf_remove_by_buf(ctx->fh.m2m_ctx, d_vb);
		/* Payload set to 1 since 0 payload can trigger EOS */
		vb2_set_plane_payload(&d_vb->vb2_buf, 0, 1);
		v4l2_m2m_buf_done(d_vb, VB2_BUF_STATE_ERROR);
	}
	v4l2_m2m_job_finish(e5010->m2m_dev, ctx->fh.m2m_ctx);

Regards
Devarsh


> +		return;
> +	}
> +
>   	spin_lock_irqsave(&e5010->hw_lock, flags);
> +
>   	s_vb = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
>   	WARN_ON(!s_vb);
>   	d_vb = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> @@ -1484,6 +1482,7 @@ static void e5010_device_run(void *priv)
>   	e5010_reset(e5010->dev, e5010->core_base, e5010->mmu_base);
>   
>   no_ready_buf_err:
> +	pm_runtime_put_autosuspend(e5010->dev);
>   	if (s_vb) {
>   		v4l2_m2m_src_buf_remove_by_buf(ctx->fh.m2m_ctx, s_vb);
>   		v4l2_m2m_buf_done(s_vb, VB2_BUF_STATE_ERROR);
> @@ -1518,6 +1517,8 @@ static int e5010_runtime_resume(struct device *dev)
>   		return ret;
>   	}
>   
> +	e5010->last_context_run = NULL;
> +
>   	return 0;
>   }
>   

