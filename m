Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860623;
	b=eiq/0tM5DNgzzoxtREcTp/RyXMvqcGR+Hi5dABT4X6lYXqg+g2JW8rul6w28nP6fA9K6
	 CocTTDjJn+ZrlCvte1cmT1tGWRJm0xfqH8vIxfLCpGd0k9+8PN/036+MMpMxvhZvCg46F
	 7yIIA//QFbuwUh1HD+TB0ytaB4Xysuuz6B7gI4MnkQCBVYCIYVambyxffj5XjDrKEoHfm
	 hKCOQiaOe0S315lUn09cR7JKd4QsJ5X53wewqSI8oLKBbk75323dbfRPd+kQxZiudXpZy
	 bhdIH188yjgwx+K+1B2wO9GepJ+d/tGFCIW1RbmTOLdVHIqe+3CncASJ9wdzxXi8E2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V9c4JR1l1BlqJLMhXPHekxlcKPXrrtwIQDnuHY/ovTQ=;
	b=y/1dyawvKvCdJLcV9aNRwXv/Oe1gAhOQHThZVT46uZek4+KF+uflrCWjouN53mUXZSF1
	 NZNPfts4fBcDMhUvjvuXe7O4ofuQW5uPwhLuR7Q0cE7CXK0+Pxq3PdlU3T0NZ+/+enKJC
	 pTis1WnbRcQAIRH4uHQEuTKdT25skJKsgdQYnlha7F5FnZ+U2jIRDXRCe3YMJehtkHydM
	 dIbGapo4zIUGFiWgAb33kS70Df7ocOMjOHHXaKOBv7wXV45vg2vH+cxyIE6nYkvAqpxUv
	 m1L13a/Y5R2V2AYjTK8w0+jsVGU7GYCT//ti7qjsnwF26TxWRNGVKCKCNgsCy3xZGKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQbT2rru;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE705606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE705606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zQbT2rru
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so2944473eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793860622; x=1794465422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V9c4JR1l1BlqJLMhXPHekxlcKPXrrtwIQDnuHY/ovTQ=;
        b=zQbT2rru9bBYKGciF+LGs+SL/2P0O5Pz1jnsY0Wbxy0uWYPZ4nHVsnzEoGd/Hx+SuR
         kdzhheEOykq1+jWx94FFifxG1h+uB36na4yB+Me0rGcz0CxGX5bZpyh8fBnMPf4w2uQW
         ld/F8GGJYk4HRazfBRFBhJmcSwQRDsibTxJJAfaQ6Rw1B77d6xEXVkdlY2TUngnYbxFO
         GE4aFtA1vpYYUm1SytHyUnotHnoIReS0BSMIWfNvRL7HgI/FPZZ3JoTvKyGrUW8w6zGc
         S7Hr2yt7k0BsOgSD+0mfcAnoqRzHcrjum0L7Dx8JYFXD2TSYsX9fi0jtk9F5f9fnYJWd
         9eEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793860622; x=1794465422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V9c4JR1l1BlqJLMhXPHekxlcKPXrrtwIQDnuHY/ovTQ=;
        b=ys8anhkbnPGotyDNjvxHQ7/8MTMI/5E1ex8S6sVNca8+nPJ3mmrR27cfoeqHarWxkS
         chPq94+cbc3hFfD4BW7suR9uNFXCJw55PFZ51zkm/H/xP1351i7Fd0e7Z73jKrq+VQqy
         kzL9p4EYzotS7x7X5Paj737fzyMeWFSxx9L63FJgBt4OeEcJvcpUcYJqFIpW4jjqB/cV
         kMcm98u/b650q/aZXgGV7k1sotjnINQ78RAZk8AmuMSCPb7zAWAkBIp69SonUfw+ukkm
         EHxIURDC+ogw/tUMql55YGKVD6raYMVVSVE3TidwMeO1t6ZEOJo0AWbahtvg5rFpGo9n
         6OAw==
X-Forwarded-Encrypted: i=1; AKwUvBxL2+aSrPfaEJe5uA55vfGUZImovnWuWca5TG6qg5dW9dBHIolB8+9WwOSsxgswq9tj1zHt7sP9F1n8VJk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eFzZQvS3Ls9v58jH/G6TVesNSYLoEd56G6i/UF3HUTn3cEzli
	zV61pTUkaoM2ssH7WJWrkFZjgfTegn/NRwKz9uQu/unXrcBev4cYT8rf
X-Gm-Gg: AYBFou1UUHWIA9qyomKlGDsYdTgGuLZRycd0Rm0T9aiszD0w9FsxR4RkkiyiVHZW7Lo
	MLo6SXo1xsVq/qeDsFzPCU8rGwOIBfgJVbLHXvHraJOsEPjLJosvwOQBB1hb45iNuN5j9NqMC/L
	ZXu/mqnlsvhFFVN7/eoFIoaUbQK23BDdVgt2VeYU1/c1EKdQbjRS9gFD0zxhpbdEoeNICWG3WF0
	DO2Pd53kDzVaVF3n2wpMNW121RJHabxiloe5xpO1riPWVZnnZ6v//G0ElCUn2e48Vk6iGUMRyYX
	KW6BMX7PZhXvohodrNWPFt/Imwrn4sGj4+dYlQFG54V04hxB7ExsL4EtJZSQz5rcfcFKBy3XZJ0
	1IlS54tb1BVR6gLAopZnbj8br+RBpM/XtwviRMG6xStr/UsjYbf9cIkqGrVb7dYgIusuNSwnJhS
	Py/7s5IvbwTel9y7CFUte5/SIgTRBOMeNMJl+oZTcT/JDscijI1JEmyEgxaNUD0p8tIUkK6KTe8
	PN/DfAAh5jKZscLwFCqhkq0cdhknWkf0keTrDtv2SgvkpTI6cHr/V9fZefhb3Bo0iBPnJVStlTz
	rAYMTcIzeO7Tcj3CXuS4h4cuos6t9nrCeqR4r4AUvZW/bveTr6c/9A==
X-Received: by 2002:a05:7300:d58d:b0:369:e8b0:af85 with SMTP id 5a478bee46e88-36a4243a512mr30366093eec.36.1793860621499;
        Wed, 04 Nov 2026 22:37:01 -0800 (PST)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36d34d5960esm13148900eec.5.2026.11.04.22.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 22:37:00 -0800 (PST)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Xiong Weimin <xiongweimin@kylinos.cn>
Cc: virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] vdpa: fix typos in comments
Date: Thu,  5 Nov 2026 12:06:52 +0530
Message-ID: <cover.1793860522.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261102043526-mutt-send-email-mst@kernel.org>
References: <20261102043526-mutt-send-email-mst@kernel.org>
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

v1 was a single patch touching both drivers/vdpa/alibaba/eni_vdpa.c and
include/uapi/linux/virtio_net.h.  Michael asked for the uapi header to be
split out, and pointed out that the eni_vdpa.c comment also says "ENI is
build upon" where it means "built", so patch 1 now fixes that alongside
the "specfication" it was sent for.

Nothing outside comments changes in either patch.

v1: https://lore.kernel.org/all/20260904104440.18772-1-hemanth.selam@gmail.com/

Hemanth Selam (2):
  vdpa: alibaba: fix typos in comment
  virtio_net: fix typo in the ANNOUNCE_ACK comment

 drivers/vdpa/alibaba/eni_vdpa.c | 2 +-
 include/uapi/linux/virtio_net.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.48.1

