Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283551;
	b=AILGTPdHreflIAkF4cXyf34v+uieoAKpG6CAB1Ofpd2qegA+1//Kv7p76Xi1eeqrnLV5
	 OmU9CwnA+pwwnEGSD6f8L06zRzKMsqromD/wxfQdjh3YMt/6d5Mg5T6ePE7nS/ED3Nm6R
	 5EX6zMOWXBoBEocNhmXPVMSDN6gjHOhrpwtLPf84ckcr34SAFEio8Rb1tIk5FLKE9jWPp
	 VU6185EntuBcp1I4nShYrRgsiqPTWWpn7AS35bM9a+I155TPLxSkHgrK3TomDYIxSXepr
	 TO9SWHzDPTev23J2kPKnHvD0WOzIncITzJprE+I5BAqC6nC0FxEa0S2u2pD5gx+ydrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h3LMsbtIcJ0VDO1NfF8USKNq+9F4WgnyItWrt5X3yTw=;
	b=LSBSi9xsi9wKwyTqqzyTspShucavdnvfJRrgYBUiq0DkOBvAJOAQcuyJ75RobxYxVC06
	 L7JWt8Zc2zcFlvQlueqfzblo3TvkLK8UNQ6CNs0bXXKx9hOV+pAPECejzR0oCWTP9xyWQ
	 cq3gam8gX+9NaIw2vJktQeaVTHPrZLoHW8xKlIfbJwI/ytb0eOImmkSm29pgIBR+jgVWT
	 phWQ97e0Kf54XuaVTRJmF6VdY0BEfboPpJ8EnDoLJaV91iJWmdKLCajZyXfeIcwd4sHso
	 NMaH0l8ZRUNc7a7vSUfuBvhlHUKUkj0J6ILzpufWePV5tdFpEO9nOSYDo7XyWmTSj2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w5u+SPT/";
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B0606DFF2
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6B0606DFF2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5u+SPT/
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7ce77f98658so576144137.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283550; x=1793888350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h3LMsbtIcJ0VDO1NfF8USKNq+9F4WgnyItWrt5X3yTw=;
        b=w5u+SPT/+ou5Z9k2lLpKetNuoAoooLIoSWeAZ3GyoWHclxB/0KhHFdDcrbLoANl9vw
         fiWr1YPtWhv0Ez6DnTLYU4gghkzKA1z1lMGwCf+b91aUW1GWOdlpg/pb6Sx5G01r9AYo
         B/vZyjWSclGxXnjYlOMIAsMC6NmfMWRtTF1XIe0yUBruSbOMUVwMPYGlQQOvIDiyRUg5
         /afg46BQWWxPccLRvSpyMvnbAGKVbYDLjbxmsjxyYyCLXPC6m6G1LvpyUS53a2w3YIUg
         KNb/+0YNpMmzBxxEWcMSSPYF+Z7HTRrVri5EkiyG+DXUNkC5TcRfFJJR6POwjFtF2Zis
         D4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283550; x=1793888350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h3LMsbtIcJ0VDO1NfF8USKNq+9F4WgnyItWrt5X3yTw=;
        b=b38tFq5xrZDiFp7morBriCbd3PpvwTYYf6u1JMAbhc1GPwHuv+WGod8IHqfygaRRz6
         s51yTvMdfUfK3Ju/v3gnjavR8vgSj84t7sjFmegARmG+wbq9XHGLH3ChX0vuAL3E3IMw
         ZyidTTWdPZQ3pacvxLL417n/60ZVQ/01aZhrqG7QFZYXkmvRzdgq/S6rlB0PA+AeAhoO
         KtZSC5fZp4/hwYDqFf7C5S+yXkTDkip5JZgeWLXC4ubUwwrWkRApgo8/ZYsy8jy2R3Z6
         AncOn4FLqsjUMUiSYgeMrCchWam7ip0D7q5gCfnomFxC+04l+tRjcefqDYiHx6vcwcV5
         /ySw==
X-Forwarded-Encrypted: i=1; AKwUvBwhQUIbZ+vYXJg+RrKW2sTrSS2d7NJT97EIZYbIVTHe84D4hI1fdvL1/HfCzPO0NKEKaxiF76ezBEYU/JE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKB5V3o/BZwl1legltbVn9X578z232X7fn3b1PjbGb8pNP3rjuQ
	xAUnhtydiTwognsPn7jju8HbEjXi8k8otmv7CUKKovu7XrcQ5GABP9db
X-Gm-Gg: AYBFou1G1KLZqxS6CgiO/5ZNurWjD61A/R4U6XuT6PEJfWsfxob6IrlKnNhNu0EW0iJ
	0es/7yUM+diIX1fhJYJ5GTatEONBhwKX8IdqQUyhOWDi+lN0wufF+TcO/mtx1glkRzVrdwNZLAt
	Ns1NVsp3p+5MkyW8Tau/Jo8UEYmhUiJ6/SbLS4zm8VIWN5ArAGNKN5pxydcoJaZE76YRE8fa7Iq
	PIbDlwxIJZnI/OJmMeP6xXLVfZDAyrjoGMk+u1yiHl6m/x8MohvZH9QGrH3djwEJht3qzEStIT+
	We0vaHCola2AJrcf7zhy3kXvBNrG4clWDePsUohkkgZMaZOEEiOmvaAQ4YOiRGZTIUwg/Eh7d+9
	KVjsGgDmUZCNnrauzMakrk+a1TX8Naz46Q1+O8vrrk1AgJVnly3eDVUk17aIuO+MbJz6pH7SaJI
	FyKliOuPcMFrxfkKSP69XmqpeAF+idrXjKJ4aSTaWSCI1FJ1zsDfcMBNftdi/xV5rwf09cT9Us7
	SBL/gzFXw3pSVoBBsOH0/3cjl0rE3rFuh9Gv3QUw+F/OIsSFjsFzAGqmjs+CScKtiivc8TgWR6g
	86NWs2bhfLOrZWSPpFISeYseXMELhgekREgBvTTgIEC2L6bYBLH+zXjf6NVw
X-Received: by 2002:a05:6102:f08:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7d03a62cb8bmr2399258137.36.1793283549317;
        Thu, 29 Oct 2026 07:19:09 -0700 (PDT)
Received: from bridge.. ([2804:14d:ba6b:8339:e751:b7f8:a4ea:bd70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9362274137.9.2026.10.29.07.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:19:08 -0700 (PDT)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	sgogte@purestorage.com,
	hare@kernel.org,
	nilay@linux.ibm.com,
	wagi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-rdma: fix NULL queue->ctrl dereference on reconnect
Date: Thu, 29 Oct 2026 11:18:43 -0300
Message-ID: <20261029141843.2066616-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029060521.1690223-1-christian.aurichzm@gmail.com>
References: <20261029060521.1690223-1-christian.aurichzm@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 29, 2026 at 03:05:21AM -0300, Christian Aurich Zanettini Martins wrote:
>  static void nvme_rdma_free_ctrl(struct nvme_ctrl *nctrl)
>  {
>  	struct nvme_rdma_ctrl *ctrl = to_rdma_ctrl(nctrl);
> +	int i, nr_queues = NVME_RDMA_OPT_NR_QUEUES(nctrl->opts);

Please drop this one, I'll send a v2. Thanks for the reviews, Nilay
and Christoph.

When creating the controller fails, nvmf_create_ctrl() frees opts right
after nvme_put_ctrl(), but that put is not always the last one. With
CONFIG_DEBUG_KOBJECT_RELEASE, KASAN reports a use-after-free here on
every failed connect.

v2 only moves queue->ctrl and leaves queue_lock where it is.
