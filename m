Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.222
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697160;
	b=bJUlymMqlfb7sRdHKp5O2hX+Vl3P43ygmI44IYvsRS1KYvMQAV3ponjVaswBOcDpk1zr
	 XNNeB0mFw4yT4H1L9577sfdjedscJbumLBocSn7ITFR8N7PLblimV208dZiAmNg/HLfSA
	 q1hg/74cIUFQQ41dPVyScsdCJDJSy3qSmBHMWCxG7rG2macEhmdNj09s67ld9MIOzgSus
	 4dpu1ZA9cwOyKAGyB+cHn9+uVcKgLlkNXzaAFXcQ7/RIKdk9RddR/IgY4TZdAK8K3djAT
	 9H4ZvdS3uuuNgk5glsReFfLrM4oNf8hkoXg0uDCABMlVzI2jwTEnVPSCUu4uzxWo0/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697160;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=OYP/jrCpbZUv5s67bKRUA8Uq8znYrrO3Cdq0yWmKstk=;
	b=OpVvpTtudEIHmS8ZAETFzMY1ArEJ8HsqQguq37tW52UoxE2d9zlqd2h0rp8Rlewy9Xwg
	 BpM112lDb1cp5P+tYM9ims+mXYnP216bXbd65i+nMiVuMlP4MbQxXouzfMaTxLyk+2TzT
	 uMRlYYUnKqAqLVwA5gpqAbq2xKbyUkRDmEyraJNfmHa0cDxYsAsZj1UGNGM88B3fGN1fM
	 F+gX9DMtKNHhBLESzAuINjZGU9r+LfZiS4UDhOMXRuy6+wUWkmRgt/a3CLnkG3O19cmAD
	 RXukkKQZs+k8wPacDUSaPSUNo8unzWw6lFKz48/Piy3I27m7mK0ip6WQCaPcUdBp3tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBYNtf2f;
	arc=none smtp.remote-ip=113.46.200.222
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255CD606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 255CD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=UBYNtf2f
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OYP/jrCpbZUv5s67bKRUA8Uq8znYrrO3Cdq0yWmKstk=;
	b=UBYNtf2f67DlaOnb9IoYrGANta2eJfmSw/mIKFkMaKnEeyTFIzSpzB2ud3NkTLfmMnvj18r+d
	jXlWHO/J3axedY3/y8VSnPPtF0ekjTEJ2H+t05qN6hJub+uZ3jxVLweYCmMkVJ0tlQPL68jEgOW
	FZpbzTyoeBFsV8vryL5DQZ4=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4jJjWs0hd0zLlSW;
	Tue,  3 Nov 2026 17:12:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B46F40586;
	Tue,  3 Nov 2026 17:12:35 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 3 Nov
 2026 17:12:34 +0800
Message-ID: <7b68ea3f-23ba-42d1-b719-70c0fabf26cd@huawei.com>
Date: Tue, 3 Nov 2026 17:12:33 +0800
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
Subject: Re: [PATCH] powerpc/crash: update fdt on cpu hotplug remove
To: Shivang Upadhyay <shivangu@linux.ibm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
CC: <maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <ritesh.list@gmail.com>, <sshegde@linux.ibm.com>,
	<sourabhjain@linux.ibm.com>, <rppt@kernel.org>, <baoquan.he@linux.dev>,
	Anushree Mathur <anushree.mathur@linux.ibm.com>
References: <20261103085319.51480-1-shivangu@linux.ibm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261103085319.51480-1-shivangu@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/3 16:53, Shivang Upadhyay 写道:
> Currently fdt for crash kernel is not updated on cpu hotplug remove,
> which can lead to the following XIVE warnings on the crash kernel
> bringup.
> 
> [    0.630795][    T1] xive: H_INT_GET_QUEUE_INFO cpu=16 prio=6 failed -55
> [    0.630912][    T1] xive: Error -55 getting queue info CPU 16 prio 6
> [    0.680899][    T1] xive: H_INT_GET_QUEUE_INFO cpu=17 prio=6 failed -55
> [    0.681000][    T1] xive: Error -55 getting queue info CPU 17 prio 6
> 
> Fixing this by updating crash fdt on cpu hotplug remove path also.
> 
> Reported-by: Anushree Mathur <anushree.mathur@linux.ibm.com>
> Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
> ---
>  arch/powerpc/kexec/crash.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index 775895f31037..0ef10e39ae49 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -639,8 +639,6 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  
>  	switch (image->hp_action) {
>  	case KEXEC_CRASH_HP_REMOVE_CPU:
> -		return;
> -

LGTM
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  	case KEXEC_CRASH_HP_ADD_CPU:
>  		update_crash_fdt(image);
>  		break;

-- 
Best regards,
Jinjie

