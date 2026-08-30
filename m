Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA79306B1B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788129877; cv=none; b=Rxp4NKAor9fXq5MoCCkyvSVgs48gQQh7A/dNOUjHb097yBbY/MNV5c118/VujZXSayAI6aaOrVI4sbC9cT4z6bOGKduWEUOQhKkmRCANXE2w08HPlGUG087rMVUMqgvTO+hH8nTkH3twH8q3rSM7IPqPP1Ba0yn+9YIjJVnZJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788129877; c=relaxed/simple;
	bh=oKtr+1RW9/uLqpEOVSUhepja6deb+3y8VqOpLnFTMlo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qW8c05xQtOAW5XUR19dZMc5XC1d/bJ+Ln0XwBJhtFtGflCKNjo+nJMybwWVmTEv/bK9CITTRTxmKULYEAd2W7o+DI61G/TEblkXiSB3K7u8Zsyf/QjoIjR2xmSj2aocAZckS742m+JFCk8mOvZgnjL6gZTbyl8duecDJCB8biXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so1210098f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788129874; x=1788734674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjwtFcUEzfpKYWKA7ptB92f8FX3uTX7SalDfIgZO2h4=;
        b=MVDKioQpYEBh2NZsRCDIKe7SJqe1dXvglStXL4Y0lajPrWSanCfGOSpcm71wfwmoLG
         Yp9a4l2lFYiTqxyWtpUML+Rj/8WTSSN/EDZYVIOSNPCs0Ast3M4eMQrbQkNWcaAP1dMC
         gyuNWW3NVQBItW32/jOXcQ6+swysQJDZrz0ENtLobW0AAKGG2WU2Dj09Zzsr3V0QE9BD
         tOgRvZWtJNfs85xptH0hFf2HwgbyCMQFIOODlIhDkSRjmigdVDfoxrop/UF/js0K6123
         qpODmLTWVwvBZUHCoNkNSck7X7E9hzmUplMeUUeZUF/e+jNpCNA9f5CDwvMwr6TDhd0W
         5cYA==
X-Forwarded-Encrypted: i=1; AKwUvByO399Cc52FilIuRG8D803tLvRQ9FVXPR4ryE8g9qHEBlHMfuaf0DKgaMwqUbxpjgBL3zEDXYqx9fdmQs0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+LecZjzh0fP9aASlGGtobH2fphCKFpUn3Ass/nzmd277TMERh
	ta+mihz+ChniUpGz/i+YgKl4wMsF7Blrwx4P3n/X3+7aPzrSqpTBuVQU
X-Gm-Gg: AYBFou2/OkNeFcOuHD7f01UdNxTji2YKwj15BrGUFrKBbxh4wnFVDSZgg6RbbmS3lp1
	fvbGtLilRqEcf7VkWRIRsyoDU4A8FPpFFvd8Xq5TyWIL4IVJIjvwMouBXBwg/Nd3D7DNoHE77SV
	IbzdCKGhx02Kvfe0WGPM9lt+nn0ufKfYXvYD40D0wK2oqqdpMsoTxz7WiZ1MDJJfd7+O2WI7kzG
	5qKfAoQ6HobQ2WmvuOvpke8e4WBPYQhFqsBXv88l2zDMPTWM2kQ7VpvOcQ7YqqVgVUrWAYas/s+
	0vj8KWYdFOKRHz61FDRdVNsGxgyzm/bzefNJ1Sj7WbdUfLk+DcjeEreJLqYihvBLKgF2Uc0ylJW
	OqlIbeDpce0ICI0stvzZEXCBqcMAdeapTs7IBGSCdHKU+Ybb2RryN/Pwry1kps+lZYJiXwo1TxE
	3fYt5X9WeZnjeshVkrJxhdAYeVJMFN3TzKWnWk4F8o6u25ceEE9AnUzyq5mVgLbDmqPRXq1EUKU
	A2nlgvjY44uDytsK3tepA==
X-Received: by 2002:a5d:5f08:0:b0:481:3124:c71f with SMTP id ffacd0b85a97d-482f79df070mr34983055f8f.17.1788129874388;
        Sun, 30 Aug 2026 15:44:34 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f16sm20507449f8f.1.2026.08.30.15.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 15:44:33 -0700 (PDT)
Message-ID: <4f2d2b60-56f9-4ae3-b38f-bba9754011df@grimberg.me>
Date: Mon, 31 Aug 2026 01:44:32 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] nvme-tcp: parallelize I/O queue allocation and
 startup
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 randyj@purestorage.com, adailey@purestorage.com
References: <20260824225648.316962-1-sgogte@purestorage.com>
 <20260824225648.316962-3-sgogte@purestorage.com>
 <c98fe50c-172a-4e53-a30c-5416c40cb23f@grimberg.me>
 <20260830222558.GB1842415-mkhalfella@purestorage.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20260830222558.GB1842415-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/08/2026 1:25, Mohamed Khalfella wrote:
> On Mon 2026-08-31 01:00:52 +0300, Sagi Grimberg wrote:
>>
>> On 25/08/2026 1:56, Surabhi Gogte wrote:
>>> -	ret = sock_create_kern(current->nsproxy->net_ns,
>>> +	ret = sock_create_kern(&init_net,
>> I don't think we can just change this...
> Why we can not change it? Today the error recovery code running in
> worker thread will be using init_net anyway, no?
See commit: 1be52169c3488ef98582ed553ab35cefa3978817
