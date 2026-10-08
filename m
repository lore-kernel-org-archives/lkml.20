Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F4036AB56
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437954; cv=none; b=WV9Q5Y7kJo2e4T3PApiI1K02jOwhWjtroNvh9tLux8+RaEsbckXKFxjIJN6MFUJzD2VDfAT/Zgt01CP8s3FDewNMmTK3X18/YA5J3clRI9Bbk1Y+dKf1lonyoKC3eGkYdDSCxEQu/ro5BOFwOGFa2vMhE3lFW2Ecr8fmlZ8O7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437954; c=relaxed/simple;
	bh=5zICbZB1R9qSjUQuU/dNeAk5DIiO8jYcPtpT7WWKmXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cExzw/vjECKG4tfK/FRrO4N1d++Nd1xuwpRkLVRVc5rrx9fSwQddu7i/oVLQ9V8Cim1xA8dA19rQ3pPX9lYVXHmKtEM3oOfll/GzBF+ccbR8h2PSO+HsGGwVhn3wU+KuAfKGcUPUUnkbVjxly4mdyT5nOHLp5e8F313k9XrmmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=InQ3HSIn; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="InQ3HSIn"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-351f7a0b13bso34195eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1791437952; x=1792042752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zICbZB1R9qSjUQuU/dNeAk5DIiO8jYcPtpT7WWKmXU=;
        b=InQ3HSInnT2crimm8aHYhWVYBwI9lJC6kW9r9etGWIOhTvhx9q1CWLYmlF9JMMJKbb
         SwEYPeBn8V8rRD6iyPBXgfYOgQg+2U+IYLLyeEHEFhujE70SKPZXtAg9s/y+Hk+TZEdf
         M+36iKhK7U7m+RNwh96tvQ8euxFKJkrwpcrU8qyiedVe41CEZMOMBGHhg1GAfs8yNyPS
         j/zVqp0bZRsd46UrYCWby+G98wkneqQC9kp9zYFz/gaZGkNe8fd6U9iwaABarg5WngVt
         p48ZkVvfzzo3fQ0f3meFlwwNxhm6KWTZIGh2Vj2wLrhMJ0S0SGpXJEjzD9iVDACQf3i3
         UfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437952; x=1792042752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5zICbZB1R9qSjUQuU/dNeAk5DIiO8jYcPtpT7WWKmXU=;
        b=ynDjBTDOFEWwxyVsaeSA94kDWwXTLJ7PlgCQx8XbCCuKM+RoyVxOvxzFlxnE1M5h+P
         lbiWdW6PssXWY6sk9Joxsdl0h86aknqymtMEfm5c9DwPT8NeSQ25Vd+wuWdivW6wbZsV
         uZXEma1mNgZBSbafQR/0Ai7WzX8hviVLamvKfLh32bMJoJnJHnJtYYulId4PiXRSx2c8
         ArUtCKuZ5pY6NDWuAedSlfLZJC2u1kure6uv6ddjyA+mR1kr7tW175MiNZg1XnrHBdzs
         BtLPkzXcF5h+wk40t77G8VbzGZd/h/0oRRTe4tS7mZZKlLVr6GI05a4LkkXEF4Y9JD1b
         lqLQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7UnSdOr6sKmq2YnUdATtkDeFNGGuN37uUcx/1qkIZ4mMcQdhIao7sirB0YO3wswppTOLC1gXQUbH+IaE=@vger.kernel.org
X-Gm-Message-State: AFuF++kLQXkbY15zR2sMJj97ar+9NaHJmws4o83fUZn/exoA/0qgScmf
	Zef+FDApiZF24O63PoQ95YmVQx4JgNvF3UbDV4R+Ba6DGKTHbsVV3bw61Y8q8nnwmA8=
X-Gm-Gg: AYBFou0t6qhvdA9WypZL9R8jdKqSd9xsbIO72vTbKZdG+gkOILuE++IwDHXbCra8ECs
	9KFVIyaq6ymmtfDa5h/nm7SwMeEMWurKWhNAQ5ismg+gcGsTE+Y0hON6hcJNQFLlnmEtScb43fn
	QV9SdQ5a+OEqbA/wrePyX09O0sb158zN0QmHrRTYlvWWOP2P5+TacTqpnzjOk3LmnfMDZvPCUou
	g83nXQCwYkZa2U0maH7GOUB6GIQN6B+qtjiAlBXw4S9eJDO8MYjvNkgcAxrbjB7QSnUIZthp0sp
	jDvHXT+x+AAwr9KdLqk2zYtkV9G7ASysnh4TBPDy6kfVXnVOHvfiG5TkNzWN9nHJCQJK94oS515
	l/hcPtYRXODa3dGMOdCaQzTAuSKlcxcFB3giZTFVXlTP1PpVGtPU8/vJYYcT1K+7qCEdvOW1wjt
	eWX8o+wNpRdSgiqe+BDapBSo2UZB7EWz0zWaeevg9E9bxhmf8UtFbZOrdXggBKUUVKXSuz6QUhL
	vSSc69VhPLc7UCPS/X2FcXdKLBPvpRiHed68HMYRC1hRBUl3VtkXw==
X-Received: by 2002:a05:7022:b053:20b0:14e:61bb:ec3d with SMTP id a92af1059eb24-165a21c3636mr1993743c88.16.1791437951948;
        Wed, 07 Oct 2026 22:39:11 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4380:3400:348d:5a62:5db7:75e2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-16169249859sm10418363c88.15.2026.10.07.22.39.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:39:11 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: linux-nvme@lists.infradead.org
Cc: Saravanan D <saravanand@crusoe.ai>,
	kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sj@crusoe.ai
Subject: Re: [PATCH v4 0/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Wed,  7 Oct 2026 22:39:04 -0700
Message-ID: <20261008053906.38005-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927070925.47209-1-saravanand@crusoe.ai>
References: <20260927070925.47209-1-saravanand@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Sashiko review of this series [1] found lifecycle bugs in the
sysfs registration, including a use after free of ctrl->queues_kobj
after ops->free_ctrl() and a reference cycle that leaks the controller
on every disconnect. I will address all of its comments in v5, so
please hold off on applying v4.

[1] https://sashiko.dev/#/patchset/20260927070925.47209-1-saravanand%40crusoe.ai

Thanks,
Saravanan D.
