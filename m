Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288870;
	b=B82y7JxTPka/BRo/mieZTydVIXkfuPPwu1kKI+BoFo4WgmGiE1GOTpTQjJjdBpKkMIRm
	 /0Xzz+NP6vQpVFx4xMiCG8xPy7xIhD/eePSdwAoOZBcjFC5iE5deHLjQptAp9Zy/uPHTh
	 ZLVWKP93J7HHv3RbX9Ahic71uI6UJKqvDmtSPhSSXbuckf9bEQtvbzjqA2Tj47sN1EWOP
	 bPcsJY6oNByIeltSpQEtF6FkfKxpV/6hS0coEuFmP0NCli4vlIaovsuB4LQ/7sT7Dpnib
	 8vPL5FSEpdPQjQSWnBiI79SHmurXUVevP+ce3bBTIpaGi85TuZqqheSUTHXDbnyTM3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=b3Nm/KNlTBzRFfI2r+/vpAKCtLu6IBibLwEKHK4FKus=;
	b=bGbwqTSygBrNcfgXrqP5Kv6nV6qVT+hKLnNdG70yZbp0jCMtLLfinMwWz5Yg96Ocsn4a
	 nW0m2sBKxYqdpr6FYrw3S211Yqz7dNvKcCAIqtBJyb9ea7FfDRA/sH5YP15LCeWZueHQN
	 VtGneo363iC/XeDT9aA1/uEL/nxf5V8x98YhNVESvYoTe2GJPVFxErQZL9Ff8QVpAGTQ9
	 HsDcEaRypMgSxw3Rir3PyL+/Q/IMd2hrO//IxjU2CTprs1m5VWUXKEZsD3/yWFkQes+1+
	 5EzWCo45Yd9YS9EVKMAOCQ9rxUmKVhYvvR5OInn5YBNPPx0EPt0+eQDNu/RfiXdRafQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KSwjS1wy;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7757C606A329
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7757C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KSwjS1wy
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c46822eefb6so298710466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793288868; x=1793893668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3Nm/KNlTBzRFfI2r+/vpAKCtLu6IBibLwEKHK4FKus=;
        b=KSwjS1wyFZZ0wmUt7u/O+xAKuUIlPR8di9BtQxjno2CwsgUh4poj4+MFpIlSeziGb8
         SUYlPuXpDxk2dhQu1/2Uh4gaBh+UB70pg/VgD2V/QMbKvypYOgm8Op1mjXhha3JQ4Zr8
         KivtJJ+TYGcApPb/6StRX2AQneR+Lh5B9TWbyOyUY2VhKvWLQeS6kAMovaM1byI0CvP0
         UZsLZEHmiuyGa8f2JwJu8lJwULONhI7kUhFclX4vWj71BtulpM416/M56H98HF7/eaZN
         tOF6pubgIFNpj9vAj+YG0AMiGqFuGtiy/UUMg3newc5piiEm/dtpD0uPj0XdFHIuJrq5
         5fZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288868; x=1793893668;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3Nm/KNlTBzRFfI2r+/vpAKCtLu6IBibLwEKHK4FKus=;
        b=lhkj8nDLou+5u4oFYqrDM4UQ27zui3SnPLmbLAp0hyQdxeBvyWF+yVM4BsRgXKyO14
         MRzaPF0p+TqDU9Upz4b8LMxZU5QdbPWeYQxbMfR94O0Oso46jgAl3H0VuOZSHKDB6ZaP
         4vkyxpIV8nOQKTYvTaoesfRUzEcN+E4NgyBNO0CcJW3+ZTcx9qzCodixbwjOMP1Vtlx8
         Z7+OzQrlAonhLRtzRIESGLYBsddkmTp3/WhlfHCVU+idqHvrD+L+PkbPI05bduhhJZi+
         dnNQAEg0l8ZOCdtBYj/1kKpmxEXA7rDi4TkDMVCl8DLuboFR8n1EYs/o9fRGwVVswMzx
         rKmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgeGCkXF1iqVRrjVipXpviyrRPy82uL5CVWjKYtTYlVpbRfDtYbzFmmAR0U0H6ew07rgbl4dQ/eLvqu6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn71qRLZZnPQsw5se9TYVijkIG8Tx9BV7fr75gaoAUvreRxXoK
	QHI++e09WGCOljHEsvAMf2jezsrScWV66Xw3W6KRVyOpmRjhyCX2IVQSbuphPDFlERA=
X-Gm-Gg: AYBFou1oroWslTipU8sFnIOctCrE/5p65v7WYMkjl6hQHw8tGxHwNhl0+5MUvil8kBL
	wpfqcxe5vGeygNyaB6wWKLVhegAPklHztP//FQElA9PqNsuhs2owxE5OetYS0rCoM5a8DTNqwhj
	xEs/lBFCDqVfMvTLXIyc1bqbBdXpwyNXeLlkp2j0zzaaQzEpqFqumGjAgh1tSCMmRLu7Go6ioeC
	QEfeozWwwPJ/jtFp8rwoCFhlfr8iUGpwAlEGRvWt/OlhYzJgp+ClD+9Bq1e2CU93LQMUBTICS18
	JX42i+/RRTGDGuEQ1XgZngjMHm8o1yX93vT1yRYo/9nt0WO0sNDS53y31McuM30OSLxUDwiU5l/
	J+4kkyAMyW66YHIAkmuq49E0ArWfjOKTHffjaFMzLN8s5sTSEwy+FhKWztHfFZJ+eeGY5jykKUh
	/HdE+JyGJoaosMc6kwHZHvJteLDZOQ7wXs+nFLEyniDI7h8c2FUBydkG7pMsMsEpDNcoyKHgUId
	Csbf9yqP/I+Pr4E3gJ4aJrNp2CRtksdg+1tN7pNdxoX5qHYM+KUShMAIvWoWcZKUvDOOhdIALgL
	Hnx6POEphkrnw6umf1V5EVGF1hBQOFc1txREDcHE
X-Received: by 2002:a17:907:cb88:b0:c40:80eb:c544 with SMTP id a640c23a62f3a-c49bdda7123mr536994966b.4.1793288867635;
        Thu, 29 Oct 2026 08:47:47 -0700 (PDT)
Received: from [192.168.0.167] ([64.43.45.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca255d350sm8340566b.11.2026.10.29.08.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:47:47 -0700 (PDT)
Message-ID: <a1f10794-d816-4d52-9868-2fd14b02d5fe@linaro.org>
Date: Thu, 29 Oct 2026 15:47:46 +0000
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
Subject: Re: [PATCH 05/14] media: qcom: camss: csid-gen3: Enable RDI SOF
 driving
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bod@kernel.org>
References: <20261029-v4l2-frame-sync-v1-0-d37992559c58@kernel.org>
 <20261029-v4l2-frame-sync-v1-5-d37992559c58@kernel.org>
 <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-2ykusk85REekU3mmFw=4g3yjB=doOi=i=1LS5JEe4T3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 15:43, Loic Poulain wrote:
>>                          __csid_configure_rx(csid, &csid->phy, 0);
>> +                       __csid_configure_rdi_irq(csid, enable, i);
> Is this something that should also be tied to frame_sync_en?
> 
> Also, just thinking out loud, are there cases where we'd want to
> toggle this dynamically at runtime based on any V4L2 configuration or
> pipeline path? For example, should it be enabled for the pixel path
> but disabled for RDI?
> 
> I'm asking because one of the appreciated strengths of CAMSS is its
> relatively low-latency and lightweight capture path. As we add more
> features, it may be worth preserving that characteristic where
> possible. Not saying this particular feature has a meaningful latency
> or compute cost, but more as a general design consideration.
> 
> Regards,
> Loic
> 
>>                          __csid_ctrl_rdi(csid, enable, i);
>>                  }
>>   }
>> @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>                          val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
>>                          writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
>>
>> +                       if (val & INFO_INPUT_SOF_IRQ)
>> +                               csid_sof_event(csid, i);

I considered dynamic enable but

1. The design here is to move ~ everything to SOF vb.sequence
2. Standard design pattern with FRAME_SYNC is to generate the event
    having consumers either trigger on it or not

For that second case I opted to only send the signal when we know 
there's a consumer though

=>

+	if (atomic_read(&csid->frame_sync_users[id]))
+		v4l2_event_queue(csid->subdev.devnode, &event);

---
bod
