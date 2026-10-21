Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585928;
	b=rdebyrbTbhkLq4Y5TktWYiuuDtQqWW5ZNGN3vEkCHLc6zPj22u4mBKPvYwoBwbLUDovf
	 4bpTif+I71/g2nH2PLnHZilCE2CHgkR1PuwTotb6fjdUdyJfv+xjTQ6B5y13PrlkGP4Ik
	 ut1IUCeCj45fqi/wCtPO6zo+K0avTDgATS72Kk2tK2NSeT1+kygHXNQdpBJGW8y3ferCw
	 vaDJqmaikFwtB62EeuLxuzUgbxzubb0QO0JP6ppmfFxVS99uC6KFtcTKZv8eJfwOnE62Z
	 Xt9WNnj7NPOOqGV8sULmfaHYSFJg2a+vDxFU+o9w+1E2M6dnyRGkkwcoX8JJd2BpStg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/ce1C2Fjg1s3ZxxFhfwNc4CspMfGOZG4qRjZvIxl9lQ=;
	b=fzXF4XgP5A9IUWI+vlzHFSeh51zXYvzID5qR8WXE+qYMI3IwXIMKey37Ud5PX+PNoXG0
	 BfAjC2WpVsOm6mOGpwpdwpDiwgg68MjfhquG7FJgwvmqWOpafA8iCdY+fiLQAc7bGSGi1
	 r09ijbLg3+Ms/EYd/vdTJ+YyXoaBHF0Ndl08CsHvlTSsh4k21oE6AYAkqsOhkMHpFMmiV
	 3ndG3XlMEfMjouG1zO03iM8ToFPFEjhdMIUEoqTpIOSJ2Ogj1H0mBVQGfMEcIJ6ZIOSFy
	 9V0yaMsEVDkCgZXwxiJ9oaiYZ5XMelC42ZDKbjhu1is67ruhPCxlynSN+ZsIHXyZ6nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nxPwO+jo;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F1C60A3809
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3F1C60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nxPwO+jo
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so1202502c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792585927; x=1793190727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ce1C2Fjg1s3ZxxFhfwNc4CspMfGOZG4qRjZvIxl9lQ=;
        b=nxPwO+jokBpaCZh7UaLwZ1FqQbIF0wHv8IQUUbdMOBeamRl+xzBBk/v+kiOrbUurk+
         uEi+EsWed9uWdaJezMLAdkfFD2jTlERXr1eNdprvX4dVcpdAxMGGv2fNjFz/QEmb2M+x
         Qww6TJI+jE8dc2Ohht0PvSdIKz87PtjKtOhsdOCdsPU4mxlnfi2MEORY+bI2Mr+PqEUH
         UoPV8nU4L3oLeTRFH84CU96jPeYbFDK8O2Z8r4wWAEFzjevWMDLG5tYKbj3cefURXeRv
         qPi/oofwvEYMMk+y9dQ8HbWaP1mOsWnHruznm+2lOm/XU0o9mMniGoVFKRr6j4oedL/u
         xIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585927; x=1793190727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ce1C2Fjg1s3ZxxFhfwNc4CspMfGOZG4qRjZvIxl9lQ=;
        b=fYhvOMXJyachbY0NLXmFheqpJj/l54YRqehXXyGHy1qIyHFHzWatvy72OGxKm0wFIp
         MvMF42x0bt5HtBKGVQ3BV5/iNEcsnlIgARj6PG5tDpZNfpjrjqS2cokfySdjhsCFKzEY
         RmSjKG0FKd4wtJNMjGkv/c9pSmh5t3zFAb2e4Jg5KN8lnjHT35Jk3EVjSCOHOXNfGGQP
         UpQmXEwjLzM/FlZkwn4xiblKEntP/tCa+lo/3R5a1oMLH6/9ImJePxiXnILCYKKQOSkT
         zrFVXJjpTPULmNDhxrMJPodaStDjcqmAqwY+strCTjHZCUnRXuv3+TXLcmimJDl7KQSx
         GRDg==
X-Forwarded-Encrypted: i=1; AKwUvBzd/JXXs3+U8JeHLnPF93Q3W+dzCQX3nnT9nCpzCZAhUKRG9/vGR1EIs3kdZuVm37+1zoXBjTGLnEvrQDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJegfZiLSPuE7GX42enRx/nd6FjSen4kk3Q7IwlCNY4waXM6Epg
	k+lGgXkXrqMnAOe12e+LJL4o/4nlaqGQ/UIFvdeKgOLN8f7+xX5UIsWV
X-Gm-Gg: AYBFou2+t3l8OBt3RMpLe9CM7btTtqAo5YbxKapA2Xswr6gcs/o4t/7UAWUgEPbgfJV
	K2X699LOje+eMb70mXoJgC66Wkl66rvGMQ7iwYnR8FwRQ9TNjE8K6n665ZlZcijoYDWmYkd0sa0
	a6gclfDOyGdNS7zk8k0xW4oE9JihxjRvluY70RxY9lLGGhnVLmGFEeZ6unDcWvzn/z5WLK5KoaT
	xJD0LMFUsQNLafnGbm1SxOjGR6RvOIkBfDNgMVEjmMc6VoE9xWC67M0CJ3JmXSWv+hu/UQQpG0n
	0vkK0HLAMnp8/iDheQyWTvQLZUg6Kfx02rfid6/ZAYn1DHMGR0VtoPTj9wJLBPxpBEY7EMRBtPd
	Mwp+BcpHWRziSX0IOBikRv9t59Qws6cjtw7RTSZG1dTChLX1SK2zwhBX6IVMOx9f/1XR9oJigkR
	baCe+GJi1q3j2N37VpJWtWiAxhoB1LQUp8p04vgVKQTgPStBrcahQrOtibde2x/HWx4Gc036m3t
	hyhH1+60X68OFPJKw25cfo2cZq+V7bppDw/ETLvgQ6btZcbZLqXdLeeZQdfMB/BDKqhQVY/qg==
X-Received: by 2002:a05:7022:5f1b:b0:14d:baf5:c419 with SMTP id a92af1059eb24-1909f5c8400mr1785476c88.6.1792585926762;
        Wed, 21 Oct 2026 05:32:06 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm6268475c88.22.2026.10.21.05.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:32:04 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: vbabka@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/4] mm: compaction: mTHP-friendly memory compaction
Date: Wed, 21 Oct 2026 20:31:55 +0800
Message-Id: <20261021123155.2295447-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e6ba0e36-c0b6-4cd0-b2fb-fc288468bce4@kernel.org>
References: <e6ba0e36-c0b6-4cd0-b2fb-fc288468bce4@kernel.org>
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

On 10/21/26 11:31, Vlastimil Babka (SUSE) wrote:
> I'm not going to answer your LLM's questions for you.

Sorry for the previous mail, which polished my English by AI.
Let me put it in my own words.

Last mail you advised me to use cc->order to pass the target order,
however /proc/sys/vm/compact_memory and kcompactd work could
only be distinguished by order. Because in both cases the variable
direct_compaction and proactive_compaction are false.

Without adding new members to compact_control, it's impossible
to use the bool instead of is_via_compact_memory to achieve the 
same goal (Or maybe I missed something)

For skip_isolation_on_order, I want the new logic to take effect:
with a real order it will skip folios already >= the target order.
This is what patch 3 does.

I will keep the original behaviour for fast_isolate_freepages,
suitable_migration_target and compact_zone functions. I will use
the bool variables to express the same logic.

But in compact_zone, should we exit the compaction when the order
is already satisfied by the watermark? That is I want to discuss.

Thanks
Bo


