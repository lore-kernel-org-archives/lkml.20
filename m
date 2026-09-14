Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ADC36E484
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789362393; cv=none; b=Zdzuxq/XxRzLQABRDBu3rQFelINymx9P9z0Ti+789pcxblBLAViy5rNe1I8IiAPaOHdaG/YO3TaQYE/IiNAYQEWyjIIJq2Cp+FQA26imbSbXajZZAKP+oS732HIQV17rI8Xle+FON98GUOS0Bgi+gzH8IAUD1N2z/BfCGzgVyBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789362393; c=relaxed/simple;
	bh=E9cc/135TTwNgjmAOrXJSDfGY3OksbkbWgtTU95PGtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOsvqPP57ABpfKNU4ds2QOTrYhH/wVBn5Iur/b3p/0fnVZZZu1iNUbahTSQJknrY+6mCu4CS1VXJnhsZ7cHBQyuTqaJamSkIYdDz+FQLg/47vlu6Moer1Ru9ML2pz8kFhilO2v2Blaa5IgkEkX/CwssoOw0WBmT0MRJJ6lHBLvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=asX0I/fM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jONv2xl3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="asX0I/fM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jONv2xl3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789362391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTGrNcFkd0r7wvxM+LayJdDhB/Bf4MUfRoY837NnKYo=;
	b=asX0I/fMVUQdNmYhX32KyOmmVo8kXfRf9336BGRAtfIQHZMUJers4hDF1aY622baNQhh86
	OeZxPPB1znQRn550oJIWMKYOhfIi5TQdLBUXD0F4vylEVb73xSyaMOeLuQBe84qdoIciD4
	3w0OGGYIGs5OpTbWdK2IGJuPOQRQhyU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-W3lWV-SpM4GDa-Wz9HtygA-1; Mon, 14 Sep 2026 01:06:30 -0400
X-MC-Unique: W3lWV-SpM4GDa-Wz9HtygA-1
X-Mimecast-MFC-AGG-ID: W3lWV-SpM4GDa-Wz9HtygA_1789362389
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so2240378a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789362389; x=1789967189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTGrNcFkd0r7wvxM+LayJdDhB/Bf4MUfRoY837NnKYo=;
        b=jONv2xl35EG2/+qy0VdG3Q/3pfknoJI6h2Sh6K+TjGumlrdNc/oe/ryUIbSioqvm3a
         ukZIuXlEtHDAw/yf1JAa4zgsHCkUt4NPiUXl9ti+EqZU4qlUmrRVuCIS57le6C5k6bx6
         d6ywc2fcqOZoNMWJy2PSI13c8a7h4HbFYEIaQcBRKBTifiuuVAmlV8Q/VSoJDLrgVLcq
         9CTsY0kEJloK3smmaWxFHg/CVnTfzktQxT2xfZdtzioeKLwoRrQmTT78CARSRq/MKwdL
         UD4qBtnXDmw0efmmecXIC5ac897s20/3VpwJao6HgY7gRKD7CG+zSxI4IKb27ZmPE0Es
         B9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789362389; x=1789967189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTGrNcFkd0r7wvxM+LayJdDhB/Bf4MUfRoY837NnKYo=;
        b=Apfq+6yHlf37yTACY905NsRl4e6v6Bn6I1BTeH0//v6/ceTzipfc6rvgCRgf2TVm0D
         2JJ1NSV858ku5FXJlOOQ4G6KuCSdSWZ1ZxCJg5OZNypHWnzMlZvgQqUzqzaq0LWY4ktR
         rngAWTcdh749D+lgHOKthUiIRx0ORAFpZP3KbKd8YkvOWdgoiqb0AQthghRcciSdiSFS
         GHDCh5R5+zShERzXkr0tlQ4U7+xKjRi60W71RU2lNCXvfa31E/rOFgeoB6Y8cN9wNdPR
         6JeKX31YJDiGgJkjoVI9Rd4ghRE3+a+nt1CRMddxa40szV2iuVmEZvruCCNNFTLC5foB
         Eetw==
X-Forwarded-Encrypted: i=1; AKwUvByGtAR8xxvyjdl1brtuf142VWLMir8DjBoR0fCvY+Td73mv63gtmwyrKVbv4ZdyWL8ScLW/objYDfI5PVs=@vger.kernel.org
X-Gm-Message-State: AFuF++lz62VckvjPeor0E5A8ozS6kmZceUT2tLFmeV73piVotvQ8FrRA
	+AZBAutHtXDzQqFhe9CyLz6VA6pP+LJr67287DBZGH45+RH50aqRNBaorvbaJdrZzICH2GUy/U9
	C2FlfPv+xfHaeVnP5WtfJbQMULSKlLc/0B5rZhMQ2DmEDVp2qnUoTRjSD8DUNMLnQaQ==
X-Gm-Gg: AYBFou2NVvWWPo0UCfS4FiMkQjfS6+aSv1qcZZ1k4EVjc0zOKUo3k5NbA2x4CQSeMrH
	Nyi89R6wUwRTad08WD9+zxtT5/ED8ndIzIRDMxPfcYdtuOs9yMZ3b5kc2gdy3VaX/2BE47tfg+7
	R6BcQO60Yw8l4YNHrOuWuUT9O2bIkrllFKC6KPMKVMWenS8//Oaa/O+UBwtjOVRrKCrJuIZ1Pea
	OoX2dx+vJe+Pk6fwcGJ2MKdDylhRXITwSs36fxjBQZnmpBJvhY5qc8WHWkr2V2o+rXlhroWMvoX
	DAF5hBqh/mEEsVvEQstzs/lHlYs+poozs/NZhiFoRXKvuxiy7ccpsEyD6J9HEhyXz3SFBq5ZbgQ
	G9ePMN2nd5pmpc1An1nslbhhtf9A3RA12j2jBnaE4fQ==
X-Received: by 2002:a05:6a20:7290:b0:3d1:2dc5:7d37 with SMTP id adf61e73a8af0-3db4039c82cmr2007604637.3.1789362388792;
        Sun, 13 Sep 2026 22:06:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3d1:2dc5:7d37 with SMTP id adf61e73a8af0-3db4039c82cmr2007526637.3.1789362388369;
        Sun, 13 Sep 2026 22:06:28 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c654b5b0sm4167221a12.13.2026.09.13.22.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 22:06:27 -0700 (PDT)
Message-ID: <e15dff15-74d5-459c-98ed-0473a7761c69@redhat.com>
Date: Mon, 14 Sep 2026 15:06:15 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 5/7] firmware: arm_rmm: Activate the RMM
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-6-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260912083611.2513845-6-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> Activate the RMM after the basic configuration. This is a memory transferring,
> stateful operation.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>   * Inline RMM_ACTIVATE command and remove the definitions from arm-rmi-cmds.h
>   * Use scope-based cleanup to free sro object
> Changes since v16:
>   * Split into a new patch
> ---
>   drivers/firmware/arm_rmm/rmi.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

