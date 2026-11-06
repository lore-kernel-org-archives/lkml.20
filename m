Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942635;
	b=B6Z5aBpVv8Zh/nWau3/Ao9UBSmsenoACCLMnOhxXBKyCRIS40+9XGYZl9FJA57oubLJL
	 hO078z8hmSo1X5q/Ri9sDSQcyZP9FQfyFcuWJusXl1lYUlBDhenprDSkjf522luodtjtK
	 F0TCxIDUtJfgmiCtzKtcFnLhcsGzDcNPFlaeLEDUUF0jCBM3wlrGm0ioMmPx0JuAPiukc
	 goa6W5nfa/qSQpOrX2dctjxByN/DWPTR0gNJdf0JkthRREZ2uqfUMiJZ62VD7V/B9ATSG
	 hAikftKDQneQ4MW6o24cEu/nqPd4ouE2tRpXXhn1nmLu2m6XriS0tryLBElAeKl01RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YoVjGUFXpjQMcATtlpzVSprfp+MS50wgD3gLJA7JasU=;
	b=ae9TvGWl9IvSxrLuYYUMmikwVMjX5HNkxUilGTbEk6WaQyakMPG8wych2bk9pBIxpa7o
	 sKiR/pMswWUzV6+A1GYtP48dNQegac8sxfSZW5bC2AzHXsrcL6itCh/3TB7ieA4AMiHBE
	 T0wprFiy5KAJnWMo5vjbF8iII5LJHSUJJmWOYCPB71WSVCGLlY9TFtGUxV0gEelN1NChB
	 jj26JPLNhPqGn6ymcBvrsg1eF8bGQ9ozH1HwJ8CnbmT5SMtOq0jvrZ9+LmsoZQOYfgj4M
	 B/fBPq++9DXjPBynucOJ9ecEkFJqRcD3fsGf6GU194bfHJOs5mQmpwl0lXI8esRAdKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=UCJvIfCd;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF7606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11AF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=UCJvIfCd
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso817225f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793942633; x=1794547433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoVjGUFXpjQMcATtlpzVSprfp+MS50wgD3gLJA7JasU=;
        b=UCJvIfCdsa5d/5EFYrAqm4c0g9WZYomO5Ec+puuBWs9BjcYnTIMWUB3AxMeEuX7tjV
         2S0/OovwQKkbM9XKqvCGCsG8wGfRa89+FhBfbmZXVdtpkL9Xpxk+fKdc6ONqqtzFZmsb
         q/m9CyKDcSRF9xrQgd99vAqbtPYBUfQ1oRt87fzZL2nOuTGHIug0Oab72s/29LBBN5hL
         6ItDanqPeVRCINoT+E1An037YRJprH/aT3PY2MXdNMKXQTMXOE/T5Ui5zF+yyX6DzCii
         zU7+wKfcgopUUZq3fCA4GIIlW7NeEY5Str4h9Qx2LOPWoD4wHZwhUea6hrKcKW9c2l/L
         AGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942633; x=1794547433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YoVjGUFXpjQMcATtlpzVSprfp+MS50wgD3gLJA7JasU=;
        b=R4ReAYEwI+Dty8M4utV6YoVnP1iY8j6HWrXj8wDDqYZF6gUDF3f3HgBO3uAAtt4O4R
         yiKixqZtDOAwYsVpTcXaF7O49TUbh0EWqR6Buusfp9luqgdXqwtD5Mzb0f7ZcTqPzSWz
         VNz3yomskt2Paud/EWnRTlwl271eLsdXBvggBCLGVLPC/HMhD1Osng9fRnNj2QJFwT3i
         7OGAzNU1V71ua+JJb6QMNpo9IuoSG/CeZIkd/5lAqBaBfAiBFvdZe2tBgXTsXCId5YKq
         JC4hDmAEhg4CA5bXAlCyh6h1CUpRJeTBi5dbB9tmMdvxM1Wnw6ulNZ/uuDRVBAITolwu
         +Hmw==
X-Forwarded-Encrypted: i=1; AL+hErEvvRShaUTJ/OSYw2G8OT4/2a1yWk2doLHUWp6Vlhf7Y3//5pnZ/GzfEVtKi2/4vD3eH1rUsVCA4OZIjPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z97REqQsp85xRSnVYYsXdD1yXqmO7YSmCxE8bjZCdHjb2lV0vhC
	h3Ta5X8NpKOFBOIPps00ahLMOGcFwVB/JZxxRFRaxDDnJeQCx7abCBx+a5vNlabL4bI=
X-Gm-Gg: AYBFou12Pehxqty9tB1piSxsJJecRU+2AcSeBrlkQ8PDr7DxTHayd0QyXKAlz8JMxlc
	VYU3V1fc8saLUGk/k3O3tWKqcrpf4cUuYMxPYGumJSqlAHgWJbV5aQMBzUhGfv1zxOiMKKu3zls
	rcSItC4DmPOe2mx1cdetkqVVYke6HUuQpAXPgyZFnE7ZqXwt1PRLbkxFz7/cJFnrkv77zXJNh8Y
	mVo756NTqCyru5TBkhng/bfkeRpnf4VqIFOQth013pz8gnEbGdFJM4uFrfD47/0MMzhKMh+qAN+
	lN/Cbr5fY3UeKJan6AfPJkRyAHvA6YJ48G8v1kVMv1YmEWoztMQfhtnCzHCI6ZoKZBvJV9GVu1I
	Dg8UKxpeMIYeKfN6L1mIfSgr1Ddpts9dfmWzwRPxF76THgckrIMwdnlkQoxGW98ZZf0cWjmfMkd
	OZg+tM79zPhB4MRUQNCYdZdPRUuQ4dR8xki6BUq2x9YmrenalKAk212jWtBers6M5EEvacHS8//
	X99VCMhD89hVK5D7B3AvHb6TVD6oSDVbx/1v7UwQRByfX7lZQyYI+Tvno4GpRiARm7shvkxB5cq
	bezfwmcDBpUSXWsunWVoFqIRAzjlDh3ZUwaVYpnqn8KU7v5hBnvcww9RvdjFPm5CxSQyVBI9mQ=
	=
X-Received: by 2002:a05:6000:2284:b0:48e:678d:396e with SMTP id ffacd0b85a97d-4911906d313mr9445010f8f.9.1793942633454;
        Thu, 05 Nov 2026 21:23:53 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([185.57.101.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63ae2sm1456239f8f.11.2026.11.05.21.23.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 21:23:52 -0800 (PST)
From: Saravanan D <saravanand@crusoe.ai>
To: Daniel Wagner <dwagner@suse.de>
Cc: linux-nvme@lists.infradead.org,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	sgogte@purestorage.com,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai
Subject: Re: [PATCH v7 1/2] nvme: add per-queue sysfs directories
Date: Fri,  6 Nov 2026 05:23:42 +0000
Message-ID: <20261106052342.12808-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <23f41537-23bb-44e8-84e3-7069138d151d@flourine.local>
References: <cover.1793800758.git.saravanand@crusoe.ai> <656dac7329c8452efe786b0c76a3b8c0bbf53159.1793800758.git.saravanand@crusoe.ai> <23f41537-23bb-44e8-84e3-7069138d151d@flourine.local>
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

On Wed, Nov 04, 2026 at 06:30:56PM +0100, Daniel Wagner wrote:
> > +	ret = sysfs_create_groups(&qinfo->kobj, ctrl->ops->queue_attr_groups);
> > +	if (ret)
> > +		goto out_put;
>
> Don't you have to call kobject_del(&qinfo->kobj); here?

Yes. Sashiko flagged the same error path.

I will send a v8 that adds an out_del label calling kobject_del()
before kobject_put(), so a failed sysfs_create_groups() unlinks the
<qid> directory before nvme_add_queue_info() returns.

Thanks for the review.

Saravanan D.
