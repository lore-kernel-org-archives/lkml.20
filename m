Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6253CA499
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073737; cv=none; b=g8BxmCTbJuho4SnkrL6UV0g8RbKTh2fyEd5on5v24iYdhg9G+QQdpaSbQ3mavrQKJWaAIFLPVhRJB6HV13XC/yu3Kb8qhjgUHEn+CnqLZWgrMi1lIivK9pdNW/5W/AwRMjXYGo7af6qE0WaCg8ZKGK+xItXAsPRz+pG2ziXB/C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073737; c=relaxed/simple;
	bh=UY2XndqblTUXCDmu0W73JbWw75AHqJSFdH4toNPJyog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=elgWmUmUI7V+ejdkp+DypAsqhFBzqkJBal1r1pogv11P3vG+Z/lr72RO1vUA98JFkpcS+Jc3Ho2keQzZv81SSTKP9K6oIXvh31KSm+zCEUHQk6Pr1PXu+rz/dmyEGFImDwBDSW6eqUodyp5u5J0kLv4K/fT5ohz1HJhSyCMcdC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=xFURFx92; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="xFURFx92"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7fc4034841cso195448a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073731; x=1789678531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BgPIv1ZQw0ml091p4qej1j/5Et1QAUdr/a/BWY2itQ=;
        b=xFURFx925LNabTvRpPuRALJP/xAFhkZ1lXG+8SReVSnWfOIHm9j+gmvdAIF+9/ZttA
         ZCNbv+2S7SlMnfI2h1njj9CMPPOVo04bnfLOEiL0Yz8051uHnEV/QvEr+K3+voVOf1ou
         bdYKzQTFb9kzH211On71QFHoZ154WsMAFPqRnADq4be/Kjsub+5WLIKBy/bZxT2k+PiZ
         vPy8cEuJxWkXjJut2FRRQ+BT4ssDeFaC072OtIk5A9WVfpggWD8dDfWQkA418O9bORrG
         pae6oxIYVaH8O3kYFdhDmsByilxAInKDHRCDiv0YwjWSusEKk29wrEEL8gn36i6fHJep
         zhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073731; x=1789678531;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BgPIv1ZQw0ml091p4qej1j/5Et1QAUdr/a/BWY2itQ=;
        b=jlg7LWJnBcI2iCYjJCwIqGTrEGEHJrIbvI4tEjnqZ82vdhpYI6tcx3vWMCAX4WCYYo
         hmu3Y3gvp2RPaXJulbpcJxnKdL1rzHlBsjOc+lal7NhAR/xPWQoTc3Se+yloaaIrpaV5
         iKime4/gLgeLhyemAIGkGSOODU57aQoSodU0b1Swnk9cJ6M7uSbu8HmRg528SpTXYfYI
         74ml4LCXWe31yIBVV0cF0j+JWz8s+lMHXZx9uIIMVAGvsCWTrl3MPQmM1eKnQsUDRAZ5
         FiBWfHbBxd1LsG4mQRbWtAKN7eGwYX9G+FpmFIvdXs63h4m5hceFz2OFtVi0bHLhLLb1
         bfqw==
X-Forwarded-Encrypted: i=1; AKwUvBzJVtS47rFr3pqCkKIE1ltijztbimSo/u9dU/SOuKMopkjwmZKbeGVNoxgMWWVk4BqZD4XaSHgw8gOc+H0=@vger.kernel.org
X-Gm-Message-State: AFuF++n3N1IAuQg/gqLXYq3d/YKvXOJf6Ir/PpLCQTzV+ASBpGVc+zFu
	lLco7Is4VBvr1WxSd8VYZc+PCcKpTnkuN/TW4H7SpwMfPOr6Pm7W1E08UHMHX64eKy4=
X-Gm-Gg: AYBFou0aT8n5ufHDOtgjA7zI42n7Yrnz8obIKN9nxhCAIlU0+rNDuJCdkuzWOeAoH8x
	dfCDMUFB6KZLZT24bi2Z8lmg7FB3bSY7HdK8k2YJxodwaCSR7W2DsDglee5nxP2qVwcMeKaYPZ5
	mgP+sBGrgDqOtFogFExjcebNGkWJIrJ/+NdY+bcp9L5oMaN0Q3k7Stf09VdEU2/hvACugtzPHjx
	y87gkilSIo7A99hEjaaPC9E4i3wmzwVSmn9dZKp9r2YMQkl2Y/cLYdP6Oc7XqBKjI6Cm7B2AxQK
	PFwsmclBvTKjeUZQIO0gE6/tau3bS2hYwhDi38oj+kF18CvZfsqbu9mdnQbX7v6R9qDtv8/SA+J
	VgNlAAjk0o3DX6ya2j5q5XL/TN4ILb8b7Zh6sw6jmh0tjyfu/n4go/XNs6TcE7WrB/RUZ7hSk41
	uKVt3AjsCUzRGL1S7TONH0LHGrWQi6bS1yU77Vkz0fCiM2+ItBFjC119hFCh6Olmj7S6nPFLxkU
	K7tKKHpmocGZcTD7xTboIoDbGHgZ5xCLAvZNR/1r4NEfSu37XM=
X-Received: by 2002:a05:6830:67d1:b0:803:3878:bf59 with SMTP id 46e09a7af769-804001c3c9fmr433555a34.13.1789073731594;
        Thu, 10 Sep 2026 13:55:31 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm635779a34.15.2026.09.10.13.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:55:30 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: Joanne Koong <joannelkoong@gmail.com>, Ming Lei <tom.leiming@gmail.com>, 
 io-uring@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909155848.2069290-1-csander@purestorage.com>
References: <20260909155848.2069290-1-csander@purestorage.com>
Subject: Re: [PATCH v3 0/3] io_uring passthru: set result on blk-mq request
 completion
Message-Id: <178907373014.484803.6342081621851413599.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:55:30 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 09 Sep 2026 09:58:45 -0600, Caleb Sander Mateos wrote:
> io_uring NVMe passthru currently receives the NVMe status and result in
> the blk-mq request completion callback nvme_uring_cmd_end_io() but
> doesn't post the io_uring CQE until the io_uring task work callback
> nvme_uring_task_cb(). The status and result must be plumbed through
> struct nvme_uring_cmd_pdu, taking up 16 bytes of the 32 available.
> 
> Store the status and result on the io_uring request in
> nvme_uring_cmd_end_io() instead of nvme_uring_task_cb() so it doesn't
> need to be passed through struct nvme_uring_cmd_pdu.
> 
> [...]

Applied, thanks!

[1/3] io_uring: move req_set_*() to public header
      commit: 7acb6aa7916023e072eadb9e45e34a4b3f5801bb
[2/3] io_uring/cmd: split io_uring_cmd_set_res() from io_uring_cmd_done()
      commit: c54cf3476674a6a01c61da85fa32aee9f07c0741
[3/3] nvme/ioctl: call io_uring_cmd_set_res32() in ->end_io()
      commit: 11773ae6da9c9d92f5d1def78f7e70a9f1fa7b1c

Best regards,
-- 
Jens Axboe



