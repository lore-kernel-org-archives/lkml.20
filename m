Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537F143CEF6
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191494; cv=none; b=dTZmkmgUz1JqF/o4TBymFfcC9LOf4lX+HcvyBg+S4IwaxMomEGQjqvRP5uyGCuh4tiQzhheP41uS2DlepmTRLNSCuO55IQ3QM5MC3ym11Ei6WIU/tpkG07vV42JEJHhwSQSCKIxwIw6A6+NXzdJqO/KuIcfUMmDOkbhW4+Q7fo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191494; c=relaxed/simple;
	bh=8ihMWrIT9uFTwzaNMQ9UjoKXafQbC9kqbH2+NcWsbtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DtoMX/X8t5qZ2ur6RefPPpmpKHQDu6B9NxU2AAD4JxyXfQFhIiQaDCkDxMG44xhMtgA+8phIOfFqZDDslj0vu0vH6BhHdCkGjYM1z4HAVbhe3cVuPnoHI5v+Zx9+TVFLmSteu0Rtf1ECpts7KaxfUXPfEobMMVZRMROXZIkD3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7Cz2q/T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZC9LR5V4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7Cz2q/T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZC9LR5V4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958xRVZ493660
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 09:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9oxOuG7wNa3Rqa6hUzdfTKeLLzuEgWjUSJ0eKN2I8Q=; b=F7Cz2q/TsBt3Itl7
	KRD1ug1h62PtAKBZh2lxFvSfnIKniBm2tq6ngc3tWjsA0etzeVS5WDQttWzeFkqp
	wVrMdtL0AJ0jQFKzaOJE5BjHk7+2y5EfQSOczc65f6DKJLgoplPbkK5EcMU3HILA
	BeVhLRw/KkIGwV2fSjOmpYKW5z8w5PtlSgo/7fHHdapDwuiUTD3KY6MRHxliBNSg
	IVi1ZMfxqpaCJd8nn64w+G4aje5nJvd1V9Niap0CG7rG1r/b8Y/ArBDPe0gzktLO
	ne4il0D9LZAzYUDfRqkW8p64RqCpINQFnEL3uU2XrF9eK5pfCGJ/ZLrCFYyiJgP+
	q3mSGw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfk3bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 09:11:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so3167706a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791191491; x=1791796291; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9oxOuG7wNa3Rqa6hUzdfTKeLLzuEgWjUSJ0eKN2I8Q=;
        b=ZC9LR5V4vKLjXAuaVQInWjXXo98QlhlqmCfO1bPlyRY0NNigXj22K9OmYreuXaiz9s
         aS6AVjxGzVljUjjEGNaUq2sMb+4F1ZKRgiaAcKhNilu1Uc4aVRS0B17Uv9AE0ewgQfg0
         c65FAWdI2hD+2XErC89I9+gPSWow0TpJmBim204lMXtDA9PT634X0xj3DfWg2swID8Fd
         mJv/rwkxQw5XZ7vuUW6JwDASs/1RjaMW8ikL7iSU5ZHC/i2h8sqxSWao4j07NF2Y9FLY
         IYfnBFk5wVJfP6MbC/uBRCHpVQ/zkzmF1baSJxYO8dY8hBcw2SkXlX6aLStMaZeXmoRz
         bnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191491; x=1791796291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9oxOuG7wNa3Rqa6hUzdfTKeLLzuEgWjUSJ0eKN2I8Q=;
        b=j3qYu7PJo+sOOBv2LC8gRGPEmfqUAc4BgFdh5G2RQwQWmnPm4nmt1RBPmks8mkypt3
         co8iY0pdReVj2vS1uCm/PLJAvLgq460+Dh3FKBCbYzVJzAOa05O5WhZ6OWzbeS3w43BF
         ypjb1jceaEsI0thIpvC5duOowpQurc4+EvXlb0mau22kOo85xK1SrowmoXX/I0jkDgVw
         5Jljk6NZpFi5Qbz45hMl8WXSlk27uXmgV27i0aegaxBJu0g9hFvnXQ5Y2XSPKqe/5ZUo
         MwlBE3OpfeNtGHTrqALPBd+5DoSYSuWEAi6SFqyRPzNnLfcT0uN80742v5eNAsBHxw1w
         rBGA==
X-Forwarded-Encrypted: i=1; AKwUvBxHUwa9HPmcypVdJHKjEOrxHXRsClsnTo8JbutsEoIWI8n0jjry487n3NqGZ8+PTwH7P7t74LOVP02XmJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKb//Sz4TuEEu4GiPyGpIvMNJAiFnKYpTrYq4dEiebaW/G/H/Y3
	vpnH4yL13QIVWD4tfnavi/lkcoxrgj//ojPf2UDjh8FxzkbTbe8yEH8VEzKrnDXxppio1M6O67N
	IZLhHfJK4L1N4tC4cIwRrwHAxCQAygjtgjxbhmz+kK7gIm+j/dP2NyoxZt+hXgBo41dg=
X-Gm-Gg: AYBFou3b1gawDklv7oMsyV+zL3eoi+6v+myBn5I2KE299OG8RBd28AVVvH/um5HzaqA
	Jww5NzT8CHo78nuDYHWRX8X3gm5aPl7o83OUDPvuNMSBQcXq9hTPfUCAb2qMaNpwD3Ua22Vs+jP
	XS033HYeh+D44J6HbY5oT86J3Dz8A1//HmgCO9/sGZ1w/B48X0sIq58pIKrUMt+tnWz8VdtdUOj
	ImMxurcVLwtXlge1RwQsQbNSAhXhdGOFDdQ9qWnLK36/bppXhz7ttSNwL+120iSwKASVxTIW31m
	LXaQsjyEL/B8MDy72rgfsqDRy5Vfxgk05LlXTKpcrsfEysxmZxPFyNFsXo5/aWtLLoqJeyiDgAN
	X8F3aRI7FzKB/UJmNN33lrxFY8VqAiuPuKyS56+OK2HPC7mxYxT8aK+EFYwW7xmc4/nZ71joQpd
	Ae3j53ySyN5mvw3y5e
X-Received: by 2002:a17:90b:2791:b0:3a6:f90b:20ca with SMTP id 98e67ed59e1d1-3a787181deamr5551518a91.12.1791191491173;
        Mon, 05 Oct 2026 02:11:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2791:b0:3a6:f90b:20ca with SMTP id 98e67ed59e1d1-3a787181deamr5551496a91.12.1791191490675;
        Mon, 05 Oct 2026 02:11:30 -0700 (PDT)
Received: from [10.50.19.182] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d6b3ceasm10369860a91.10.2026.10.05.02.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:11:30 -0700 (PDT)
Message-ID: <8d58dce8-36c2-4e03-b10e-0aac1466f848@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 14:41:20 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/13] arm_mpam: propagate MSC access errors in
 mpam_reset_class_locked()
To: Andre Przywara <andre.przywara@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
        Ritwick Sharma <ritwick.sharma@arm.com>, Gavin Shan <gshan@redhat.com>,
        linux-acpi@vger.kernel.org--cc, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261001153439.3295416-1-andre.przywara@arm.com>
 <20261001153439.3295416-10-andre.przywara@arm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261001153439.3295416-10-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cdX-kMjbgESalGRdXS0sGxTrBp3sLW0S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfXzzGtNqUw0a66
 IAocqavvSFkZzBq4N96l3ZsFZbSaLgz9Eu3roXifWH1Z3RbUBH+YZHnKNhCogTOZeJSkVJQIn90
 q6sMTZYgA0gveuswV4IxnI79fuTqKuU=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac369c4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=7hQx6daNV2sWy6eBiVUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: cdX-kMjbgESalGRdXS0sGxTrBp3sLW0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNiBTYWx0ZWRfX7u46QLT3YCiH
 6S4GxxA5jaDpQ3r9FmKGoziNTTM5L1Ah0Pev72Gcf7hp5+7nQzq7orQ+1kcScISKoHm0y0FOS3F
 cVHiDSuikJBjiEHSDsMeCsMOQci3vN14LOVjHvlIfZoeiIZllCe0yIe++qBaDomLixnBCy1eCbl
 wokX7dVU+NXU8VbjedcmhZ/Lt6BKAlTjmL1yYLPclSdl8cjZ+2onZ5SQ+tSPgWks3vF6zp+QJHt
 8Q6GmFQyGkmZWRCZm5gR1yrR3FgFJyD8H09jC8rTto/1YwaXeKj91Lxy6aeS2xA2dQTRrJ70mdD
 3Cv2FcuoYr//iqRE3ddKBJJPervcRsRyLiwouWbi7QkswFvNr2u6r1xVBFc4gs6zU7PVNDe1Xsv
 TR+NWqJg7JB79fdAjkceEtVX72DxvXrtdf7q9EO5+bLm3DQyCEpGZLkXcf1Q2b+JIj6zzHu/7jG
 3dtPZOQkW9N9JxooVqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050036

Hi Andre,

On 10/1/2026 9:04 PM, Andre Przywara wrote:
> The mpam_reset_ris() function can return an error, propagate this up
> through mpam_reset_component_locked() to mpam_reset_class_locked(),
> which is exported. The external caller is a void function, so cannot
> really handle the error at the moment, but at least we report everything
> on the MPAM interface side.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> ---

Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

Best Regards,
Srivathsa>   drivers/resctrl/mpam_devices.c  | 24 ++++++++++++++++++------
>   drivers/resctrl/mpam_internal.h |  2 +-
>   2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 60f6a39176ea1..c639aaa5f38e1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -3007,7 +3007,7 @@ static void mpam_enable_once(void)
>   	       mpam_partid_max + 1, mpam_pmg_max + 1);
>   }
>   
> -static void mpam_reset_component_locked(struct mpam_component *comp)
> +static int mpam_reset_component_locked(struct mpam_component *comp)
>   {
>   	struct mpam_vmsc *vmsc;
>   
> @@ -3021,26 +3021,38 @@ static void mpam_reset_component_locked(struct mpam_component *comp)
>   				 srcu_read_lock_held(&mpam_srcu)) {
>   		struct mpam_msc *msc = vmsc->msc;
>   		struct mpam_msc_ris *ris;
> +		int ret;
>   
>   		list_for_each_entry_srcu(ris, &vmsc->ris, vmsc_list,
>   					 srcu_read_lock_held(&mpam_srcu)) {
> -			if (!ris->in_reset_state)
> -				mpam_touch_msc(msc, mpam_reset_ris, ris);
> +			if (!ris->in_reset_state) {
> +				ret = mpam_touch_msc(msc, mpam_reset_ris, ris);
> +				if (ret)
> +					return ret;
> +			}
>   			ris->in_reset_state = true;
>   		}
>   	}
> +
> +	return 0;
>   }
>   
> -void mpam_reset_class_locked(struct mpam_class *class)
> +int mpam_reset_class_locked(struct mpam_class *class)
>   {
>   	struct mpam_component *comp;
> +	int ret;
>   
>   	lockdep_assert_cpus_held();
>   
>   	guard(srcu)(&mpam_srcu);
>   	list_for_each_entry_srcu(comp, &class->components, class_list,
> -				 srcu_read_lock_held(&mpam_srcu))
> -		mpam_reset_component_locked(comp);
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		ret = mpam_reset_component_locked(comp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
>   }
>   
>   static void mpam_reset_class(struct mpam_class *class)
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 68a6cf2b9cc73..09f8168fb4d2c 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -465,7 +465,7 @@ void mpam_enable(struct work_struct *work);
>   void mpam_disable(struct work_struct *work);
>   
>   /* Reset all the RIS in a class under cpus_read_lock() */
> -void mpam_reset_class_locked(struct mpam_class *class);
> +int mpam_reset_class_locked(struct mpam_class *class);
>   
>   int mpam_apply_config(struct mpam_component *comp, u16 partid,
>   		      struct mpam_config *cfg);

