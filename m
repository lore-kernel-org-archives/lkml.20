Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779252;
	b=zW7Oapg6XROELeSlfPsK7EhfcfXZVuByGGOwBhFeKA7SvbPvi2URDn5GTeuerpyfO/bW
	 8ZvOg6MTPDARBLfFsLadUX/hqHh03v0gRJUNmLxsYcPMotBG8VxkXcWvhtfa4r6gAtixR
	 4QU7kx6sB5AO6PEhjh2ssdLmKWjXBcdVk3wtp9bNKscYAND1WzrbGJWe0d6BJxS5t66QP
	 cobAnWaAL59WkRYerjFLn2tmxFvbQ9F1kC7XCFL+bzCATVPL6+pvkKBTSxcgDgwpxmneg
	 Ubd/NxGnGayhDa1Em8xp19D2TpXLr49xviOVBqJDK7d7zjNgH33aYjvTe95xHsiMP2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=39gK+a8D3PLdfajH6qYcSlCJPVlME+ibj0o5GjMZDos=;
	b=LMwMGel1gkfPnj2+Ntmc2BOYYYR+hTgaDWImAFWZFu/ciDHbT2tkBoZyfyf3R6eVlaRC
	 ja+UkzipzM5vzUo5sJ9Tory8dUwlj2rbOtIvlKBuMUfkqbx3alyN08EocKrWswR8xztqe
	 JA693D8mwLw0OViwdh3OGg7LtTD/AKHfve6oF6IxeFLYR8cwGlxyaSZS1d8WAiRaDLocs
	 UItEiEuUb37J8nu6zi0nXcUUcJ3bs9nGDcaoX6ZN+wCYZbsIfD3isdECEAdnUaD+RAcFX
	 0WVKtAj/TI5xg8Yo4IYCq758FYemrX7HWFpIKvGSc2hvA5/m+5jkD2UPlZRqcPf1cdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=YSA7plLK;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F22606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F22606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=YSA7plLK
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1adbf62dd31so646410c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793779251; x=1794384051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39gK+a8D3PLdfajH6qYcSlCJPVlME+ibj0o5GjMZDos=;
        b=YSA7plLKIBemS43qzGAufPyFo8kwXvCw1oRaPEW63emS/qUed7jXwmME81dzMlRK2K
         pS86+Bylu3Ea+TAA/ExeOkM5n+mOnH5TCYuk9IeXOXAj/OG5oXtjCTMMVuzR2VSsqv6m
         ZY3kEYBv1VrVmODJ4su9KxVlN9LbKD25t8yjJ9p+jdhn9sRk6IzREaV2ntWZvTFdXzF5
         +C0P3C05zD1v1BpQwlZUVEOqjwAwT68H2mlgxMkxqA9hNL9NQaKCRSQMT+xsdmqxNGjm
         3mKSFRSFIvOWlV8c9mlPECLsxsbIOBHqzVnP4V/7yxlJDHKTm3fa6liT3dikEcaBthnp
         uWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779251; x=1794384051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=39gK+a8D3PLdfajH6qYcSlCJPVlME+ibj0o5GjMZDos=;
        b=nR7EZkG0YdZEZVlAW3ryi5VZ19JxHt4CX4ATPD2i9ycV+RXc3s6TSErTRytF8D1sJi
         Op6Yyl0isoU+OQfr15TT5rUOIMHxnJJEvfSQY3+00ENcbpNdeeFVp7fljReQ+oPhnKzz
         VtjMPBsEVE6vAP3Gh352Mz/lrkq7L4jl18SRxSOi6ct5sVnDcpXIngbJT5pkKnwXfPng
         8aP6h1iXPWJzdPTJxu1FincYuqSMxYK/zf+eZcfLiAlv0fOzgE71PBe+XDOduB6GVJNj
         V+zapSY+wmNNL4MI37x8xATHBJZ0sNYJTl+qqlGTwaEjOH14ghToSS3d0sXpIfjRDydO
         Uu4A==
X-Forwarded-Encrypted: i=1; AKwUvBxypkBofyeHw7lpUsTy1cRnA+yokigY2Gzwq1s5IALFUfC7jLIQ4EBtEYy+ZLH9bB8lNXX36B97fB9DtXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8egMoac56830dX1x+2fjki+ixGe8dm5a6NhOnFhZNdL+nX1udp
	pWaR8UrhD5waYtCO98fTV5A5vj9g9Ldx+QghdC3DgtH6iF/Gp3FesyOYdJPpng6uJtIFu9m2BjP
	hZsvRgWw=
X-Gm-Gg: AYBFou2wmctxy69sbj8RnJGpM6aJqCyjjCiXSz6cmrdWMZ27EbOgDixm9KU0kE7bj/K
	YQgMV/HkvYxy7cazXn0ZPaW/L3SEmmPzKoROtpvPoac2QLGnJtRTuCnAAtzjK3rV31hx3mSpcsX
	TSBUF6SpWozAaZvOIC8KLXnjLUxbW57OrTiSPePSBw3M1a3Ifr8n9h6elRcJJiVGJv6vix257HC
	8VYhsso0ev+7GR4UxoWkCFom2C1FM42DeqcrQVZ4JKGYU+VmPzfQOtzidt6Y65gwLbBqS7cMlsl
	7e3V2eNJ1UcKWgXK5V3jx7dDhDOJheFGfkYlk6GGs7vVywc6BxvXXYZ7+CNi3ONf6hozueOuBJF
	QzvVOQaSoNfj6OwMWlE5o0d6I1OUPPcRk7NrGIqpUfsDvdr6p5ldTJl/c2D+4MMihlWyE8aobXF
	csfdzpUcRqrXjOuC2NdqHPif5gj3N0me3MtAmTwX2WlOGz/v2tE0bs0pi16OWPzLvB9gqX2YGui
	WhgbAE1tMJI+HdUm32K4Rv6iuQB4va3YvrCvcsxMlvu8tF2nAWIHbtIuge47PUaDLCqk5SwYDZq
	Ch29OCb99D5c4INUf+gJ9N2Ql1ckVu9qcwXejM+/cPIunBgUQfOZECYdv3nbVpDhOIJfxm+bzA=
	=
X-Received: by 2002:a05:701b:4583:20b0:1b2:4871:b1f7 with SMTP id a92af1059eb24-1b24871b239mr1578681c88.39.1793779250836;
        Wed, 04 Nov 2026 00:00:50 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([71.202.170.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm6175875c88.22.2026.11.04.00.00.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 00:00:50 -0800 (PST)
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
Subject: Re: [PATCH v6 1/2] nvme: add per-queue sysfs directories
Date: Wed,  4 Nov 2026 00:00:25 -0800
Message-ID: <20261104080035.95142-1-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <10c9db86-4313-4a1e-bec1-e4eb9ae32ef0@linux.ibm.com>
References: <20261023230426.6425-1-saravanand@crusoe.ai> <20261023230426.6425-2-saravanand@crusoe.ai> <10c9db86-4313-4a1e-bec1-e4eb9ae32ef0@linux.ibm.com>
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

On 10/30/26 7:46 AM, Nilay Shroff wrote:
>> +	/* transports remove their queue directories before this point */
>> +	if (ctrl->queues_kobj) {
>> +		kobject_del(ctrl->queues_kobj);
>> +		kobject_put(ctrl->queues_kobj);
>> +		ctrl->queues_kobj = NULL;
>> +	}
>
> Can we have a helper something like nvme_queue_dir_destroy()
> and then call it here?

Sure, in v7 I will add nvme_queue_dir_destroy() next to
nvme_queue_dir_create() in sysfs.c and call it from
nvme_uninit_ctrl().

Thanks,
Saravanan D.
