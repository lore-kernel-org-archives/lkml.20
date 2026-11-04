Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789957;
	b=B7kaMYCrVuJRXaBmylKsksen5WvqQuFcJUAC6fJEX9mhh5TvxWOfIcp363uMKlB+vgyX
	 oUfXtCcCdUECqQtzD5MZM8Xupm9A+iIJsJ9AlKgKxviv+DCtfdhODiTi2Jc/QCcYe14N+
	 uNmBBROpJmsDcIBHyu+dK6eQ1A0JlB+4zzZ3FhoTYx0DDNkotJ0EAYrlHyNeko3wkt2fa
	 ndh0mSbZebWCryYyCFoJyH4Tj9YFWxlJFtZCXUlicBNh7koAjM6iNgjBrpJW9Cxa/tj+w
	 DQh4lTx+MS7LN2O8t2hzz+1vQTrl1/9afiybVa1/rVXW2aRW4oyDc80rAe64zUS3wBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789957;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3nff9d/AA4m5vVgbnjj/6QnlBWUP9A3eO3LG2cNpO0Q=;
	b=SBFb1Wxv9B5VNZ6W7yjTH7CZ4dILXaDc95Ui6NyYaB456JD+PgwsSxjTOIAfUZiXsCpg
	 VCvp34R1QBPnnskIssjFLBPfz2wED/iAQPMtOkFPHswJTIoVk6Nv5wzHa9e/p1HKKk5V8
	 i5BSvm3J/1rurYfl+bCa5AjA+QPu0S0Ngj7qptbzOMiYpsS8isFeWWWUw9q5vMskg56Vd
	 cz0GzjxSead+6qTVG9fcq/55Q29qx6egwpC/52eqv8vc8/GxOX00Nit8/44QeXvhE3zW7
	 h0ghsfVoLYgYsTpu4KDA3BXN1PWw0AzZGS+jnaYPtbL36eoplhPJBnfAc6d9zPy0vbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PFjvzsAn;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C8E606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C8E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PFjvzsAn
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793789947; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=3nff9d/AA4m5vVgbnjj/6QnlBWUP9A3eO3LG2cNpO0Q=;
	b=PFjvzsAnkJ0qrJnUVNU8xaVjNDMUGhfzpXPHvcuQAnSRMUWczSWUbf1XZO1KMx4gqjcFOGKHA36EjoBqaMbRvZGF2TMPhrrth+RWsQLa+OqZ9o+Thr20w7fMeIPaJa/vR4MuD5uiUbP6ANGtKNdwOBnj32sxcpHPedKxoUmLs0Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0XE5XI7y_1793789942;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XE5XI7y_1793789942 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 04 Nov 2026 18:59:04 +0800
From: fangyu.yu@linux.alibaba.com
To: gong.shuai@sanechips.com.cn
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tanchi25@mails.ucas.ac.cn,
	tjeznach@rivosinc.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v7 06/10] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch 
Date: Wed,  4 Nov 2026 18:59:01 +0800
Message-Id: <20261104105901.64207-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261104064540.115560-1-gong.shuai@sanechips.com.cn>
References: <20261104064540.115560-1-gong.shuai@sanechips.com.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>Hi Fangyu,
>
>> From: Tomasz Jeznach <tjeznach@rivosinc.com>
>>
>> Enable KVM/VFIO support on RISC-V architecture.
>>
>> Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
>> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  arch/riscv/kvm/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
>> index f7e4d0f9b156..13552cfc2cd3 100644
>> --- a/arch/riscv/kvm/Kconfig
>> +++ b/arch/riscv/kvm/Kconfig
>> @@ -28,8 +28,10 @@ config KVM
>>  	select KVM_GENERIC_HARDWARE_ENABLING
>>  	select KVM_GENERIC_PRE_FAULT_MEMORY
>>  	select VIRT_XFER_TO_GUEST_WORK
>> +	select KVM_VFIO
>>  	select SCHED_INFO
>>  	select GUEST_PERF_EVENTS if PERF_EVENTS
>> +	select SRCU
>
>This option is now meaningless, please remove it.

Thanks for the heads-up.
I’ll remove it from the next version.

Thanks,
Fangyu

>See:
>https://lore.kernel.org/linux-riscv/20230105003813.1770367-5-paulmck@kernel.org/
>
>Thanks,
>Shuai
>
>>  	help
>>  	  Support hosting virtualized guest machines.
>>
>> --
>> 2.50.1
