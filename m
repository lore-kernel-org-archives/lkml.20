Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779258;
	b=VHn85NjZwC4wDhdJjELCCiq0ernu06XE4a9s/CI3bHAbw30paRxV5vCjLWqqVFIsuoy9
	 C7AtEvIv80EPmv+xjCqfZ0Tx4Uj9BfNcYAxnWhiljwV80Hv3ITXCG5FjAVDFxOoeheyPo
	 HmtxY3WXRRI+iNszTru565muygu8U/Fg1ZmSO5p0mMr/hQ6eeb2Z4RrM0eZqd6SxBly2n
	 wkeV2h7RTcz40qu2IK203y4FfwDV6otxjRIpoUreFh5xHQppoabY/zZkkw8jCBuED0HPL
	 ZAfQWUdHL6UdCJhqKb/xB9liN/4zxOerzEDp4MCy3zGKhMXVV7pBH2Ji+oCa4aPiEIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jFkZAo9Q6iSPI3rhASOoo7X9X3+PA65f8F8L+U1OsP4=;
	b=bBeezpJ5ar0GU6N0G7Nagl4AOmZurY9K0cRkLOHze3TL4ztY5W25ckh7XpSIWZGhhMP3
	 Np/FlXrcPRbFeYZ1hsoEJp3Eysv42pk7SXRd7QhlPzlqtwIiCpg/Gw8fHK249HJA37Ijq
	 U6CR4KwT5EMBHaFagVTxZqSke8P4dU6ZPO+9jD3fQjXp/rSxYVmIH9vkftILVp1Vk24Is
	 DgrnjyN/oPJ+Pumdx+F0FXv17TAXI+sNgA/spsrpbRzAqFveuiXLYKzRta2zjFtpEZNTO
	 RxhxtuPXk9bfjgDMcyQjAso1wO7X2WxAqbPlufofy8hOMjcflKcV32as9a3NKhq9HRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=DHuLIX+5;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFD606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DCFD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=DHuLIX+5
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so717724eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793779257; x=1794384057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jFkZAo9Q6iSPI3rhASOoo7X9X3+PA65f8F8L+U1OsP4=;
        b=DHuLIX+5AtbYgWKEyQ2LYCrRgusgp3NRmrfQaY1veJZabkTFqtIKn3gDAC+3vxe8Ih
         ARwpDUH1ACEg4FJ1uDU45V9FeAGZu/BxTXwDScrLMVS2j1xCY4QlcocvAS1ofSIzMdfI
         LrpY8l0ztqZPJty7GIkIWuiXZP/7Nljf7fLjsppAW9TPi3sosd3HhEs8MnF8NketD+3k
         PJPVMqtAgjxa4mS/UDV+lqqd6K3+5babkPozmYSgznDsOt4pvggtZm3Uj+KK/mm2uR5N
         RDt3a0YjI1HwSxbiOpMSr1mTTvCjMv8cpHntaQ0Uk+BOaGQebnjVAfkBrWV6tznUBWOl
         p+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779257; x=1794384057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jFkZAo9Q6iSPI3rhASOoo7X9X3+PA65f8F8L+U1OsP4=;
        b=P/d78OwUQbwf7tJY0Ej3DN0yOPisA+PIvmDyqzd43bdJS0nugezSrO4tYrPD0wuMcm
         pwyZTur7pxP0xL2ZAqYTSbWGjO1wR88oaAFusab5cjZL72gnDlY4xaKOnTsm9VPfGew8
         n6E6LKyx3LFn28hxv2Sw5oh+o08C2h7wID13TsqsWnYj844ROoegspVlNwxHRjy5FZrg
         PtV0yKx8VagQuXvIX8eP5KYPtRlkt+b/pHyS3wx7jizEU/iS4Hp7DLc3sT1OCgRCv8zk
         DlPIK4UUraZ0H68PAZMVK7IwWyfea1SYL283IovkJgbN7Qms4gbaHTvwycgQ/iDrZi3L
         hZzA==
X-Forwarded-Encrypted: i=1; AKwUvBxGaXYCF/r1x5Q8rq/frbipD3hLwDDIWt2KPWoYa5T3OOlNOJw/btAi4TloNZ70dryLMqDMw2C4uQ1CKiQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fZVTHcpMuRyArnAiHDUmJvvoed4qUDpM9Vo2kXEhknS+R9wFW
	Ejn9x2A+O1SEZtg8jNILv0Jx41doSiAHpy+XU3LipKarotHzhIQ4bgWFDTgki/onCsc=
X-Gm-Gg: AYBFou3ArYeg6VVulei9ZgiBZMMalryEQhQpvLqL4DvYjKEDprev4GKyaSl0zrMYrss
	iimgUSYhgz43NHaPium3VQ4NR6Ji/LkY7xL3Z4pm4N/eOz4LuQOO0EQVt5R/udhDFAVSu5GVMlw
	Ebip+h/APLg84dj4O6wOf8GhOWrtgM4Bf6w6f5y2+gZMjYjXPtMi/Qrx7U6YmUUX22mxDq5R5O6
	cWB/mA4+tDl/f0dUQRPIECZT6d7Bv0bAOL9xlLyilhAgdmKw0KR8rnOmWozxUz9X8OO1n4CEft0
	epHGA0qjB/PuAMMMEnGNsDvxM45+Y7bilooU16xUpRKY+HLRrs7bhbgReSPBzAi2gO/8HEA5hLG
	jNtSllm6S5ZKqbk6gsgGawhtaio/sJh2+t5KGNG7Ev8E2bYN+r5ly2N+7cFFiThLc1ianbjza3e
	qH/8m34vYpEA3JWIwiejrVGsVE21SxprSjySQBBbb6hNBL13ZG2jvHmrhy1YX0jqVHRJwE64JTb
	UnGBHiXrAMnxjLZnQ266HspKzNDWvqS4g2KcxiMpXpOHn/T80eB8j/SswWs4MbGgulrGnNj0I9h
	gprNY5DDSVQoWeduEJkPmfzhbb42Fezw86E0dcQL8Ul24CG9jVTMm5NeotxW+T5ej60nDd/0Nw=
	=
X-Received: by 2002:a05:701b:420e:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-1ac5e6f5fbemr23645043c88.47.1793779256879;
        Wed, 04 Nov 2026 00:00:56 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([71.202.170.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm6175875c88.22.2026.11.04.00.00.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 00:00:56 -0800 (PST)
From: Saravanan D <saravanand@crusoe.ai>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: Saravanan D <saravanand@crusoe.ai>,
	linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai
Subject: Re: [PATCH v6 2/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Wed,  4 Nov 2026 00:00:26 -0800
Message-ID: <20261104080035.95142-2-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <4b3a601f-3035-4883-ad2d-c6a20d2891ef@linux.ibm.com>
References: <20261023230426.6425-1-saravanand@crusoe.ai> <20261023230426.6425-3-saravanand@crusoe.ai> <4b3a601f-3035-4883-ad2d-c6a20d2891ef@linux.ibm.com>
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

On 10/30/26 7:45 AM, Nilay Shroff wrote:
> I see here nvme_queue_dir_create() is invoked on every reconnect. Although
> it is guarded by ctrl->queues_kobj, the directory is controller-lifetime
> state, so it would be cleaner to create it once from nvme_add_ctrl().
>
> Moreover, this also makes the ownership asymmetric: nvme-tcp creates the
> queues directory, but nvme-core removes it from nvme_uninit_ctrl(). Could
> nvme-core manage both creation and destruction instead?
>
> One way to do that is to add queue_attr_groups to struct nvme_ctrl_ops.

Thanks for this suggestion. In v7 I will add queue_attr_groups to struct
nvme_ctrl_ops. For a transport that sets it, nvme_add_ctrl() will
create the queues directory after cdev_device_add(), and
nvme_uninit_ctrl() will remove it. With nvme-core owning the directory,
nvme_queue_dir_create() no longer needs to be exported, and
nvme_add_queue_info() will take the groups from ctrl->ops, so nvme-tcp
only adds and removes the per queue directories.

Thanks,
Saravanan D.
