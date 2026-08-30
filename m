Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874672EDD58
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788124638; cv=none; b=WHCqBpLxLPKwYmwVstJWRl6gLzDhf9EjpWwV2MAgf7FOkRVaRGhiuRW/bLGqdbFxGCklJ18rPrjdInwFTk62Hi5e/EI5UzHZowDVCAsC34Dk0b/5+gJiC7wZywwgasE3m5ZMa+rrQwYv021CCQBJDwvxSWqAmrdrh4CHMakcodU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788124638; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ClOLEeo/GCB5pg70yVCSRHRszWZGwmWbWnsy4mT8K8YqQI7e/3hNB5eotXreEuagHB+x+REUS0MVGVbB/O9CM7ufKwZAJtj8c5CX7u11OQHnczTPNn1te3oivkeKsJai76Ka5Xv9Ryor60eVBY3wRen58lIAdxe3YXNSvWWCZiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48436216a98so431973f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:17:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788124636; x=1788729436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=jmuAidHXZWT1Nd6A+2CAjyOwq5WnR9pJgVoDMmtNXH4riYSoUnMrH/wIBctGziaSFK
         C/jTWNJ9V6KhZOkyWPuY887PSw3WZjm3LGTkjoYDVA66FvMFdC9lHlmCnu5/xy8mtHX0
         PC+RzC5G7vyGFSLpjEhIh0BwJl1CVwyzvhSYYrjwMLORDcUquT0gOZLtTeOEkGFYiLUT
         O//O4rQjawXbGDW7M5OV9cR83UUKtOVbmn86Os5hBxN/v6AAYuKUMaepO+msx26mwHOD
         vTr3tB8aPguFXp8HiKUgCTntysvXQc+WZ1qlMFU08h2jagtQ/U1VFvM7awchE9Dmfj7w
         D/ow==
X-Forwarded-Encrypted: i=1; AKwUvBy9CcKbsGNxZjE6vF+4TwofdH5f252fdhi8/T2b1Tw8FN0Qn4BKspJpbc/Rrx+jIcluJox7IaIfD6Lt8K8=@vger.kernel.org
X-Gm-Message-State: AFuF++n4W+aIs88ZkJBcXQyKqdhXyHJNdtHZzsoetXVy0SMj4+j1l+6m
	GlQI2xOOwd3MBOIhg23DF0Xfo73/J3XR10IdERTYj7sJTQYws5sOxDVm
X-Gm-Gg: AYBFou0DmfQRURzM/cbRVQLwhMP270Ch5PJ9vRc5qPC44X22hOBsV7qg68pagbwpUdS
	wMd1gM9/8x/4PRjRsBhQ9mEXyvJy4eWjIT1xsO+mHhCiKurAcgowrP1oAjYasvpr0YJ8dm9K5em
	lGqGZs1U2KH9Iyy95pFC9kApf9z4oELmpCy6P5euTs6bLHdak4AtG74IbWdEyzvCwj2iVCH35fG
	dz8CvE9UatETlBqXdFAxu+touoBGuE08hdBa5sLHNBySmWYqpy5VRInkZhOZMjLOkr9eCGfl2vD
	RQDcBhqB13mI6GVX2ILGHpuklT/t5nZn3mJ7zQIvsSiMWvKhNHS824LFwamM/Ca5yPioJKCYfYU
	y7halAv3ErthJJQbHOlS6RzVvS9qve/rvqTJmQZIJyhlJJmftCDKlTX3cCILz9W7QZG1DEkvnmG
	m2YV6sW+wV10vqs/IsEb+aIh3mq56EhXgocDubzWIjEU4VYBmjE46B+2pQJ7F/mWHMZTFuu7yQC
	uFvX0ZtHVYHwGmPBzxkJA==
X-Received: by 2002:a05:6000:41d5:b0:484:36e3:a427 with SMTP id ffacd0b85a97d-48436e3a5c3mr11060867f8f.2.1788124635719;
        Sun, 30 Aug 2026 14:17:15 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33d58sm15962156f8f.35.2026.08.30.14.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 14:17:15 -0700 (PDT)
Message-ID: <4897e209-7fc9-4421-9cd8-589e83e94436@grimberg.me>
Date: Mon, 31 Aug 2026 00:17:13 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH nvme-7.3 v2 2/4] nvme-fabrics: add helper for owned string
 options
To: raoxu <raoxu@uniontech.com>
Cc: axboe@kernel.dk, hch@lst.de, kbusch@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
References: <0D24A9A3F19DBCF9+20260827125710.1381672-1-raoxu@uniontech.com>
 <92BDA706885092E8+20260827130340.1390531-1-raoxu@uniontech.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <92BDA706885092E8+20260827130340.1390531-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
