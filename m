Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10B838423B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055405; cv=none; b=KMi4SA4VDhh9+GTd1LtMECWz16RsV8gNSs5eH3yQ4DBB8cd7o9KOGi9UpZ58/dBDQswUggyY19I29wa9gsS5DSLff7iyqZUDQNK8hW0/OypHBGn+4D6PFZBLJEQfRQUXEthtxPCnkR/kyA/37s4F/RKK6gwzkuZwEG08Dt21uzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055405; c=relaxed/simple;
	bh=8r5cGtXcRlCpSLrA5wj+DkYKeYNRVr2vdSgvQQeioWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuEcfa3pfu2cnDwiZrHY03bAx5wN+xZP5u6uN0fm7Yx1szDoQJtadsDJNqS7BHGuG7ulvyKnjbxLg9Hqs3TmcnaGVpKS1YxxoYY5ZN+0FFQUkS1RWE2pjlJnAjTcVXpSIYzrpzHWBTUZO+EPPPXU1MIZ3mZyp+8Nx28F1eaqKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=A8MZH1Z8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="A8MZH1Z8"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M05KI82939901;
	Tue, 22 Sep 2026 05:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=TYmgw9Gfa3jSx7te61ptpyaIwM+IGJ
	syg43m8AoZy5c=; b=A8MZH1Z8KYFIBCL1/WYcYXMXPNhg1qc0aPYCAtcgONypk3
	uZsttdxavLmqlbDJyMyT7FyUo7zVnlG1AMf1M5X+9uNs80FXjiTehv9L8SMVBhEI
	coCEU6p/rX3klk1xR0q9osPx2msyOdjzY4TyXd9+OlOpEjg0eDif+yfWXpiu/eg4
	ZzBOM7Wa5qa4f05XuLrcyXnOYrZcr12akvmX0yNnlZozPTedzQTo15Knou/U8Zog
	VzCOuduBP+gqnC7tERI46cTRPp0oPCWGbsJASAsLZepVNYy8OmoyoTmmBNaNQA5z
	stsd0SqvV7PHTGsnSsxN3QRz45xfh3niVhbAclcw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gskg2c455-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:36:19 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68M5MqaW2046296;
	Tue, 22 Sep 2026 05:36:18 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gt67grcyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 05:36:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68M5aEx847448322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Sep 2026 05:36:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11CBA2004D;
	Tue, 22 Sep 2026 05:36:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D82E220049;
	Tue, 22 Sep 2026 05:36:11 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.123.10.203])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Sep 2026 05:36:11 +0000 (GMT)
Date: Tue, 22 Sep 2026 11:06:10 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: chleroy@kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mahesh@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        sourabhjain@linux.ibm.com, thuth@redhat.com
Subject: Re: [PATCH v2] powerpc/powernv: Cache OPAL check_token() results
Message-ID: <arD9skpQHxR6a8A4@li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com>
References: <20260626123534.396456-1-shivangu@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626123534.396456-1-shivangu@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: _CH7RRPmm7vPOZv4qXgXOQaVIwWSML8P
X-Authority-Analysis: v=2.4 cv=I43w19gg c=1 sm=1 tr=0 ts=6ab213d3 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=FLW2MQ4wR-WQMpjCD6UA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA3OCBTYWx0ZWRfX2i0nJ6H1k/Qm
 zdfk4/YoML9f/Fm7O+CMe4it9S4a6U6z/bvUHO/ZWHfi7UdG8m0Wg4PfmsTrkgMmUAi3wWA2J0M
 tl2zL5g2HIdcDoTE4pFbvAP04wpAYHQ6l/556SjZ1JZIuVBDbDx8QCvr62h1TvC54K298xQS6Rc
 TkdRV2FqLMjLhAO+SxqQeimtjgxmEJAyegQHNy71X5q0D7wwPVIb7gU3M6RfLAxrmu9jP1PfZfY
 jsmJtJuByclOPuLjdsYKYx5YEL3MmQQ5Y+SjSxku5wpDlJlT4lO6q2F2TjC0zTNgTKVLxxqGwfv
 BtnUnSyznHRGvMtI4NaZVLoA+b6yl8bxBPyXdreNFghfhO6/acMmX0/Hpm0d7xHW/Secr9aF/hR
 iLO3PmqW5RWCr7cM87so3mDZR6Tk94jqvQ/FdxT6WPsIwTAiU7jqoRpgbz3xDopeyATkoUCa2rg
 QKHh1qwUuBwzzCE/Q1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA3OCBTYWx0ZWRfXwrwsHT7EPVC3
 xnK5l5wXpZHcrp0qzv7Gzd0bddbmv3Vyd0ouynquxfo0XfPvhEs6/A1AzKi33ioUX/2a5ei3fxF
 hl+qkuEpHIV09u1qea78zbxDKk8S/gk=
X-Proofpoint-GUID: g_S1kAzUvGn8fLEIoTDJrSkNdtutUDdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220078

On 26/06/26 06:05PM, Shivang Upadhyay wrote:
> `opal_check_token()` function is used to determine if a specific
> OPAL firmware call is supported on the current platform. This check
> is performed frequently during boot and runtime, resulting in
> unnecessary firmware calls for the same token values.
> 
> Add a caching layer for the opal_check_token() OPAL call to avoid
> repeated firmware calls for token availability checks. This reduces
> firmware call overhead during boot.
> 
> Testing with buildroot images shows OPAL calls reduced from
> 35578 to 28983, before console bring-up.

nice optimisation !

> 
> <...snip...>
>  int64_t opal_xscom_read(uint32_t gcid, uint64_t pcb_addr, __be64 *val);
> diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
> index 021b0ec29e24..00325c189e69 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -207,7 +207,7 @@ OPAL_CALL(opal_validate_flash,			OPAL_FLASH_VALIDATE);
>  OPAL_CALL(opal_manage_flash,			OPAL_FLASH_MANAGE);
>  OPAL_CALL(opal_update_flash,			OPAL_FLASH_UPDATE);
>  OPAL_CALL(opal_resync_timebase,			OPAL_RESYNC_TIMEBASE);
> -OPAL_CALL(opal_check_token,			OPAL_CHECK_TOKEN);
> +OPAL_CALL(opal_check_token_call,		OPAL_CHECK_TOKEN);
>  OPAL_CALL(opal_dump_init,			OPAL_DUMP_INIT);
>  OPAL_CALL(opal_dump_info,			OPAL_DUMP_INFO);
>  OPAL_CALL(opal_dump_info2,			OPAL_DUMP_INFO2);
> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index 1946dbdc9fa1..1e9cb5271ee7 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -1125,6 +1125,36 @@ EXPORT_SYMBOL_GPL(opal_flash_read);
>  EXPORT_SYMBOL_GPL(opal_flash_write);
>  EXPORT_SYMBOL_GPL(opal_flash_erase);
>  EXPORT_SYMBOL_GPL(opal_prd_msg);
> +
> +/**
> + * opal_check_token - Check if an OPAL call token is supported
> + * @token: OPAL token number to check
> + *
> + * Returns 1 if supported, 0 if not.
> + */
> +int64_t opal_check_token(uint64_t token)
> +{
> +	static u8 token_cache[OPAL_LAST];

not a suggestion to change anything, just an observation:

based on this in skiboot:
```
void __opal_register(uint64_t token, void *func, unsigned int nargs)
{
	assert(token <= OPAL_LAST);
...

static int64_t opal_check_token(uint64_t token)
{
	if (token > OPAL_LAST)
		return OPAL_TOKEN_ABSENT;
```

along with other usages of OPAL_LAST in skiboot, OPAL_LAST is being
treated as a valid token.

there are no handlers for OPAL_LAST and kernel doesn't do
opal_check_token for this

I feel the logic should better be fixed in opal to not consider
OPAL_LAST

at the same time it maybe safer to have length as OPAL_LAST+1 here,
though it is not necessary, so the patch looks good to me

Reviewed-by: Aditya Gupta <adityag@linux.ibm.com>

Thanks,
- Aditya G

