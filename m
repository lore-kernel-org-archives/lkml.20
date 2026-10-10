Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D202EB5A6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791599769; cv=none; b=UzmGIVZO4kt0ofN0pkTxYsAIfh3Isyc7cN9p6bunZet+0sGk9m7Xw8pjsgLSpho1Nk5CIJI0Dv9ATmTlnQh92jzPsE8txSQUeuErAcx5XV6ZrpRXMzB6+HnqnPH7Wn514MbcAcM2pYNaDD1oUmGGOjNdLhfVcRK6jEOcIysm4bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791599769; c=relaxed/simple;
	bh=4auVpVDECss8JHkyoH45SEYXeAJOaapu1VO6PnM/Kw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bbbnlh/TOXbz2sPI5yhrryBFLWYNDTd7IRV3qyqCqpzYnZxjl0QmQqvdkbFbf/TBen/lEtw+HoDJTNPmN3e1EAlye5UwTPUactgCCWAvt+SDx7pLNByOinhW7IBk8pcD203SNrCT+hEI6LFtOxPSVi9o0gxAJJRgYweLKWfq4dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPtVtRED; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPtVtRED"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-351767ef18cso896470eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791599767; x=1792204567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4auVpVDECss8JHkyoH45SEYXeAJOaapu1VO6PnM/Kw4=;
        b=NPtVtRED3qHxhYQLxI0Vb5BlsVTtD3AfaSOwnSjW0i4XLoENGPMB1bVBBSpZZLDAJF
         wFQICE2YdalciSF2Ta7YbBElehgnIWpFo5O/ROqZkClLkTnKKmErNW9qobmT3+fSdEN7
         cbOqGEozO53eQh8unjjwefvI6/RXKTnhJnFENfd7wSqeCIrxnB9IA7QjJSd3WlCjkFVT
         Ry46rdsRkCvmgV/R5YF2NmqxgeULSxZSWqNx89CXCQRsNXz5VrjX2ln6E+w0QW/KqdGd
         MbVC4D0mS9Tg+UrTI6vB1Bfl4xx7PVmbDjMC8E20nLeEjfI7LVOHaAi9+EqaQ1TO+OK3
         w86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791599767; x=1792204567;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4auVpVDECss8JHkyoH45SEYXeAJOaapu1VO6PnM/Kw4=;
        b=WKY0ZdUB4Y88CgYm/akQv5RJLmmkZ8EJ3KCPRo6nPfbW7sizUEXsJaDgAz9zNwGahf
         +QTb6Wl7TfzOgAF+3/QikS2V9oz++UP4KheQad+d4FNn0G75PADZtqicBD+rbDc5V2aw
         kzMwWE47gCpAB9d/LZtDVtuuxFnxPhAAnZB9ZMgE4kxkFy3OyxwlKFeV/YScCIeEhlS0
         8s+3/E+ZndgxOxCOtEmRnQMwp51N1jO/VReesA+uz20vI+WHciKu5KoQhMaxUoOR0gq3
         pnpSHo7+ts7hkhcFm0MiSmNYgdAiGPsiBxKRg3u8XR3f9ndb16L0XzownNseh/I1rWdR
         EB4g==
X-Forwarded-Encrypted: i=1; AKwUvBxuB3GFZWffxl6tZ27X66C7d0SpGsPJwMJk4r2noDeXTWV4LqQWtLEi1Ky7QaBnN95PM5Hyc3ttRzZ3eqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIklLLxVB63UqGQguZQPUF/neN39jPF/4j03vRnw5W6wS8tyTfO
	8BXcPaQ70v9+4mLlfiDBAKIFgEpedmNgNZkrWj8OIFjQKD63gXDbt7zl
X-Gm-Gg: AYBFou2bwbRM/gZciddMeNoBw+n9OniGmy9LnRs7ReExDYZBnrLVOqUwbsm77vgTPmn
	H09Iyl8fXIRgKbPtfhMUBe/GEXejY1Y/DsBIYdmbQKR/TV8Ljz4AsogGoP3QOIco/ESx14zSVW1
	LEJIczrBW7SC67wEflhcPWvrS2vi/V6Neb/qCl2XFgL5vyOgSVyrezNrlUtOyDd9wZrGk0WFili
	DbNX8v72OMlHcr0cfM08Tl43xpithrJv8ZMJcvnUPSxV5x25HuqyzrSbh9Mh3Bej5dWWSEM6kIk
	mp5do5LgLF65PkIBcuLshhTwwztNZXMZsQ/iR+YgW4O2ktvsYhuQySHBPUYNsB+VgJxHBTEEjf4
	89dQR6zlY+Z/d3izlsMNdHVzJNR22Va4pRaa7lUB+UOQFIYbNy/OtL09Buz6XWkS6+j/gYkUFcz
	wVdplzzQ4flMz79zFqp/xPGhlmIZCMQ4gEOWS7L996zIej7TyiD0ELiBJc9pyNiQ==
X-Received: by 2002:a05:7301:221b:b0:342:645a:5cf with SMTP id 5a478bee46e88-3537dde8888mr4922240eec.1.1791599767463;
        Fri, 09 Oct 2026 19:36:07 -0700 (PDT)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca67b21sm10057666eec.11.2026.10.09.19.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:36:05 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Ming Lei <tom.leiming@gmail.com>,
	Wen Xiong <wenxiong@linux.ibm.com>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] blk-mq: run the hw queue synchronously for unplugged scheduler inserts
Date: Sat, 10 Oct 2026 10:35:47 +0800
Message-ID: <20261010023548.3666200-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930-bug-blk-mq-noplug-sched-dispatch-v1-1-ff1e49e52b00@gmail.com>
References: <20260930-bug-blk-mq-noplug-sched-dispatch-v1-1-ff1e49e52b00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jens, Ming,

Gentle ping on this one. It fixes a v7.2 regression from 9cbbac29d752
("block: Remove redundant plug in __submit_bio()"): unplugged I/O to a
device with an I/O scheduler is now run from kblockd, and the kworker
preempts the submitter once per I/O. A single-queue null_blk device with
mq-deadline drops from 289K to 193K IOPS, and a single-queue ublk device
from 265K to 113K.

Every single-queue device that defaults to mq-deadline is affected, so it
would be good to get this fixed in 7.3. Any comments are welcome.

Thanks,
Qiliang
