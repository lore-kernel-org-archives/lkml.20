Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB71747F3CA
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938578; cv=none; b=eWOUWcCCNviDOAmqWB9AiqfB6173EL/nETWIrjENvHxsc8WKz1hX/9gp0kldyM/9EA5IlOgtZQl/QJxSXajd4UXhr0DaRHoj0YpPkzVo3G+KhE2mrJKBJMzspxpDtxZOooHBiqaaTgzKMuhBxyLEP6lcv1gBoXgQywqiPMb7JT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938578; c=relaxed/simple;
	bh=vpk8Ru4AsfGcR1vRakWQaDXiCf8WQJ/l86p5N9xJk9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XRHwrfSeosQh9PfqrAc7sfMmkI3TUrj71GRPfiTqcD0P3rTv2K8iE9aBAchKN+DpW0IJ3C4DP72K/fXvvj+HVNxYJEl2MOc9syJU98b0I6NEzjari9EoYx05Sl67iKDLkyCBtuF7eNTgR78RVId+IeSamyA7sxSWImIkw/NXWEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=KqE392HY; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="KqE392HY"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so4541499f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790938575; x=1791543375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpk8Ru4AsfGcR1vRakWQaDXiCf8WQJ/l86p5N9xJk9Q=;
        b=KqE392HYzIDlA7jUSOLYd57oJfySvjualqiUWMCSaTkxrp2l17/oAfuP6+AfMkcubf
         eLNtn0OEdSAKYbDanPwUi8FxJJjvXCYmRWCXLwBdJmib3nbQuQfZMpyNE79GWsNdXGlS
         HiTJmfPd7CMVbBw0NDG95CDeyd+bBF3PHDS6WShLQ/sho2ydOni7SeL4CDplKgYLysuY
         H8Qq+cYVV2Oonph+X512zceHLtoe/jEI3agK207AQPAMpdaFJQ91zu+cwoSMMW8AmKwn
         IMQ0yOEOA/b3f8ba1sUrGj6o6OIUTfkrJArsBXuTJke0ueurq9+/bdg+J1bdyZ9kR39t
         +Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938575; x=1791543375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpk8Ru4AsfGcR1vRakWQaDXiCf8WQJ/l86p5N9xJk9Q=;
        b=WG5b3OFZlQplgNpP4K/e+Wykej1BE0rrxSKfPUUOfIxPOTZ6jDGNmlGCT0WV4s9RDK
         V6ADLqQQedtbnUqFzFBMiDwJWD1FtFbYIJ7uGX73i6VjgJCS7LAwk5YaH4y2hnnnYRJS
         HXnvAcZNqPUTCn4snEHAN4SdAVim0SxioSdcNT3rlGAVTLdnCbWoY0br7rcwFDMqnjLi
         9vCPjt+nN/BVCYuKuvmdwshWKFt8Vib0eZFphSOCEbI0RfpJC+LYV2dJOV76kidCF3dk
         cUL3W7qIC7uIogJC/G7WUyqhfpct/hTcKZVLohCfhCFyK46ZSQmgnjc5T1W1WjF6ZbQu
         +ffA==
X-Forwarded-Encrypted: i=1; AKwUvByxJRQdqWbtY5PjgWv5HeXByn4pmKXpBF6XliushUBWJGQ7hivmPJUadGCl7h2I6Q1LervcS1iPJ65Xxw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB8vPMzaECmyzWRCXkUqYWuhyBI0Hq7tNeaK66Q7BNwfOc29C8
	YqkvoiIps8Hz8XZJJF5Of61ndM5Keqep7KB1VLBz/xjqEBBsB5gLdyuFr9TV0FRb6QR+Up2j21b
	pTiANkrF9Iw==
X-Gm-Gg: AYBFou3pmKyG7ZBHOMPx/7Bkwc3k5GjXs7HpHAsfzg2fb6OikfTj4RPtohmb8w/PpJ9
	0LyHWi561TzaFxQ2vmM3gNrQgQPvWOiM+XUkgXpLqlE9cUH5l0xlstGEGh9OTx0S3pGTzMiw6tm
	hIeLD5Qe7myJjH03WbtEJae0A9+SCKArQoAPaMPTNUwCzmfnsniGsmir+BH8l8K2IBZ/DY5h77C
	Tr3Hs7Zu9OPWNFPdSU+Vbufkmw4AHSWdJv13OYmV6Y8d1QR5fpe+TXLldd14GLxJBv04WMWap01
	m5V1jEjf4QX48ra7FLDTU/7Y5MzfnarWGdkJl5El6HolnmJhMpmRoGhtAdVIYzWc7awbFQFpk56
	lqQraKMslEnEIkaUmKkUbm8TUSi1Bsa5vJohxryddCdqhTTKsFy04qvkhDmDPxsmTO9qX3B/NXJ
	vKCiKyRKuW5BdiPr3NN0MeAln4crlR+DFFIeRp1z3QU+zBXTVZrHfXuzs+TYwgQlA/1NnlPxOXG
	2Nqy/AI2M8yrJngQUqFu+IJs8ZGfwuuYJPgrz5iTceLzw==
X-Received: by 2002:a05:6000:4304:b0:48a:fba3:d5b1 with SMTP id ffacd0b85a97d-48b127762c2mr4417736f8f.55.1790938574625;
        Fri, 02 Oct 2026 03:56:14 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([83.71.242.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ae1sm5102058f8f.39.2026.10.02.03.56.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 02 Oct 2026 03:56:14 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: Hannes Reinecke <hare@suse.de>,
	Nilay Shroff <nilay@linux.ibm.com>
Cc: Krishna Iyer <kiyer@crusoe.ai>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	saravanand@crusoe.ai,
	sjpark@crusoe.ai
Subject: Re: [PATCH v4 2/2] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Fri,  2 Oct 2026 03:56:12 -0700
Message-ID: <20261002105612.25298-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <4a4e228f-7143-4d5a-b773-2c6238852503@suse.de>
References: <20261001094857.74567-1-kiyer@crusoe.ai> <20261001094857.74567-3-kiyer@crusoe.ai> <4a4e228f-7143-4d5a-b773-2c6238852503@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 10/2/26 11:39 AM, Hannes Reinecke wrote:
> I do get the problem, but I think that 'fail_if_no_path' is a misnomer.
> Problem is that we already have a 'QUEUE_IF_NO_PATH' setting, so
> 'FAIL_IF_NO_PATH' really sounds like the inverstion of that.
> Only that it isn't.
> Maybe rename to 'FAIL_ON_CTRL_LOSS' to make it clear that the two
> settings really describe different use-cases?

Agreed, and thanks. You are right that fail_if_no_path reads as the
inverse of queue_if_no_path when it is not, and the v4 split makes that
clearer. Patch 1 now fails the cases where a path exists but cannot
serve I/O, so the only thing this attribute still does is stop waiting
for a controller that is gone or reconnecting. I am happy to rename it,
and fail_on_ctrl_loss describes that well.

One piece of history worth surfacing first. The fail_if_no_path name was
Nilay's suggestion in v2, so I would request we settle on one name you
both agree on rather than change it twice. Nilay, does fail_on_ctrl_loss
work for you?

Cheers,
Krishna
