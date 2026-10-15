Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2B54D17B9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054169; cv=none; b=b9knXe5i77CxWqfBV3f0yUez8PktG2OY0zsNOzfGZhWoFb5Yo236kH1z9OHUZHZ0uCBHrKWlAFYrMV5t7jP+EoD/u7piVbfCABNWZQprjOGlP/lY0Naowrdqmx8+19HA0oMOcRlxQxU+c4fYA6uYW8MNXk/ob5NCZ41bhEz+Sb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054169; c=relaxed/simple;
	bh=YOjf6rFSyqsJTThezuuoSLramjes3+jmyhplUceJ4is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkjDKPQN+FrA2s/+QecJoX75BCAICTCPJ6ybikmuaTUIfuF4ICpJhMHmMlkJ3aDz4niPOY4Goq7iIt2WuSW7Qt6zSPCpV4VF/lDCE2sYgr0y/WjFF1wBlhmMGwbGgEzDvcsgwC4Z5NAg43e3Yd6gywgZJMtfTWhb+so9tbVkY1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qlnZTA+L; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlnZTA+L"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b6dad2382so11723181eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054163; x=1792658963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YOjf6rFSyqsJTThezuuoSLramjes3+jmyhplUceJ4is=;
        b=qlnZTA+L/lJoealhJnAGj2bGmj11+hXXWzGfGnnjOnbBTqO/MoP/NtfcMoa4wwQ/kR
         7CHLNaZN0StV7YT8vf931Og+wHImg9yZJbdpbqwJRmeE+zDxtfGoG1sXfg07PwyY5xkS
         BOfyaqVVo3zYbow5hw0uabNTRKX1wixigmSc2q9OOvFkN82ewVWAWbk+Eej0hzMb/I8P
         V8vf7TpuQPEKfeRS0CYsF2e3qg/iocFAu4qnWg69W9BSVdR8Cnkrha8gCR9/MfV9e9Ys
         V2AjTTtxHZbQfR+Y1mpoNYV9ApOL7yiCQkJVQ6ZmUOlHuj5WVLuAWE5Le5aZUivAUMEE
         gKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054163; x=1792658963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YOjf6rFSyqsJTThezuuoSLramjes3+jmyhplUceJ4is=;
        b=IJBGukxAcH9CW4YLXcfLKOq8QHFvAYQFNI03xOugu2qUENmzUBDQxjHDC1Yc6d4+GH
         CSilZqlGhCLx3b9e6IY3PjLLsIDkuyiTMIpUJObWVKIH0rUqZmK3RDtjYFd/8yWhm3nw
         R8em7GxjG3rtTxIC3l6AXzY6M7WMZZkqZ34M3GvdR3DUkM7xBWzk8E/pT8367gjn2nRv
         VkqwpetXjYbLC+FEIq+HZiYAYOIPCJJnn6kFjTETD2p0C6yS2tIBxzaf0R9Wj3b7f09T
         rlPamAu4Jq2VGTmQc4sDqYVRPAJNsrk8wxG3U2rW+VKq9B9xcc4v2o1zYDGnC0NF8VS/
         1sgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt1IL9y+6pRwtOFplkvBwyUzEB1gPaEAGCLVm/hLYMcnYKCD/HyGun2hyYFcQIpq8qLMjyuRASZgzpPTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOEwzwLu6AQ3gcA/NJgP/dS053TYIDwYi+u89aDm6OGq1Ki7MX
	DnaYDxN1OS78R1iPbAaa1YhKjIJVY9AaflMEFXxw9LAzhO6cysZT4//t
X-Gm-Gg: AYBFou0EpofqQ+2NV50gMzKhHQdSeJbdzGnjmZdZ/CIOJS7ng8wIt86VyWz08pBmtAa
	5Vl183ewRIRDh9riv+quPW8KU4CZiOL56zbfWpyI2N3iLWj86bNwEckofFNWZjcoyngSjuL95ki
	OtUX1J3b4T5tnxhtD/eAE92OthqehFxxL47L7deSo5pAKwzQ4CdZpVGnT4Q4XegQKBAEOG+chLJ
	bVV9uqcUdMEQZuR7lhmVLXixq/DCqHINTzCzLz+CVBbcpJTaVm0Ai2y35cehVmVKmmrWi9TeTcW
	3B+JsmnZnl22lYuvzv8qTLddcsvBDkLGE541ZPlBmLH3bkrPWXuUGMGSxTzDZEDpF5J9jc9jeNW
	tvjy/Ry5Fts/AH1MhkAK6CpbRyRIGcdCSTRhMkn1jW2R42qBmEdBoXRISBKm4ipJt5j25dvcpQI
	EKnokLpu7E8hrjxsKeVgoFvQX1lrEgUlGQhQO7DzfFC+M7KG0KEqYApVUtfbUhsIBCplA5TB8P7
	TKtKNa2gJ/g3ycZL55lwNmJ8Io7J7Wncps=
X-Received: by 2002:a05:701b:2309:b0:153:7a27:b89 with SMTP id a92af1059eb24-16a5ed4008cmr29637644c88.21.1792054162846;
        Thu, 15 Oct 2026 01:49:22 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm58191135c88.5.2026.10.15.01.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:49:21 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: Daeho Jeong <daeho43@gmail.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daehojeong@google.com>,
	Qiuyang Sun <sunqiuyang@huawei.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	qiwenjie@xiaomi.com,
	qwjhust@gmail.com
Subject: Re: [PATCH v2 2/2] f2fs: refresh pinned allocation boundary after resize
Date: Thu, 15 Oct 2026 16:49:15 +0800
Message-ID: <20261015084915.3364591-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_xV4J8r6exS3ZdTA1aY_bjQ+PFL5LVn4ymLanxqHGqLGQ@mail.gmail.com>
References: <20260829060524.2656620-1-qiwenjie@xiaomi.com> <20260829060524.2656620-3-qiwenjie@xiaomi.com> <CACOAw_xV4J8r6exS3ZdTA1aY_bjQ+PFL5LVn4ymLanxqHGqLGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daeho,

> Could you update the patch to adjust resizable_tail_secno accordingly?

I've sent v3 [1]. It now subtracts the removed sections from
resizable_tail_secno, clamping it to zero, before recalculating the pinned
allocation boundary. This keeps the boundary unchanged when shrinking
within the reservation and limits it to the new main area otherwise,
while retaining the zoned-device limit.

The old tail-based rejection checks are removed. The current tail value
is saved after freezing the filesystem and restored before rolling back
the geometry if the final checkpoint fails.

[1] https://lore.kernel.org/linux-f2fs-devel/cover.1792050467.git.qiwenjie@xiaomi.com/T/#u

Best regards,
Wenjie
