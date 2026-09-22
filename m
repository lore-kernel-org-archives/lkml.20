Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B533F4DD2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061717; cv=none; b=k60j9AvUZCxKwZFemunVXHtMrSmoP+KBgFwS8VK/Wk5yXVO+938wV0DBsMAp2qyCaRqAGvL0/jx8z5OqAc9WjHf5IpMLcDab7n67GrlX3ZwDOzvt1fJnNlrriaLNpBSdCP0TZYXHMCK9xPLO+sA0BKKhFXOg2va2v8qnCoqMoKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061717; c=relaxed/simple;
	bh=i6+9O7L6qCQ5h69lNzkhEL6SI6PUQRg+/hzlVyYHi4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6P0fPwY4n8SLry9WRHKw9YXRTpFmUjwuYf3Ao3x3TbaSd5/6+ajpVYk6Ych+Y43iLKREA8fK1wUqpTfNSegoBN3FdSUsd0fr14PTq1iLCxPw0IoCEAH2X14FKL6iAGV1I6R+gGg+AjZ5pW+ya6xk8vCOLGdJtbWLpdmbCKmwyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXxezq7D; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXxezq7D"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06a25so26455625ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061715; x=1790666515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6+9O7L6qCQ5h69lNzkhEL6SI6PUQRg+/hzlVyYHi4k=;
        b=nXxezq7DlHXVb5KoZzi0tmIHwo2Bf+Y8ato0VOz8qy9skDMmiEecwOgQmPhp+Im29D
         +doTYCFM4rV6asR7nxqIr8EEheKPTYdUymlzx2J4ye+eZ8WzIEMAY99ukOIYTsyGADp0
         52w2+DbM3CRDBBtve0msIj6u8oVGpE7/T5hKbOqbf9LVOReHQwbuiG48EU4AEMAUxHnX
         2bS4tnWbcCPy0l48adNKF+U8ceM91ihZD/fa+Oj45ZkVC6Jsp6o6KlnkPCvVrw9aLamE
         YZBjhflONVdJR7lQ2DQx+PI6cbqgTuP1LEeEgYwE3aGW5FoJbKLMOUj7dQZEsUsYcvY5
         80AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061715; x=1790666515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i6+9O7L6qCQ5h69lNzkhEL6SI6PUQRg+/hzlVyYHi4k=;
        b=CtvOWhTROdqUjgXKH583V7mVxE3+a+lGW6WyxHnpOmFiDPdSqNcNs9FIx5rOqGvcW7
         owweyATwaNmygkbpZiPt7pglQ5vNKHkRy5ikTagDhPtEX4Ls60y7oqzLV/husJmxCITy
         43RazK3YbZBjZjLYXrFTFn8HBzEl3I4UljawTzAX0lAOCAspNgxNBOatVfsqSJmkrMBy
         uxtcCoum4ySEDN+Z5QUjatU8CZOJFER72auv/mGspk0c6UU8KR6FYmJ1UUyYkgxsTgqL
         bB744UDQTwFzLjZtiTLQ3pt/XnZPBU+1pjENqGwyZdqyBnmNpdqpC+xlj64umorcHKNa
         7FyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYGw2q6AI/gjyjTvGG7mWawVCnWn75hJwwYm/3Qquref1dE+LzPQz0acRgm85jdgNVi9iqGxA3I4UgBoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nz08+bo3PlEa/cNxzQkphb7TDUomixNIuDgc9KgAl2NdyKdbXs
	5fXDwCMrt2PjDxZd2fC9LRDqatORHLJX5QoQZ3DKb6qOweSUMAnd0GY5
X-Gm-Gg: AYBFou0j0bYhcPcX2X/tk4LySHmswd9B0ZJIZlF/IkOtu3zC8vC6ypnVtjFAbwILmQB
	rez7dXakT+upzQeQrjr5jzUU7psoa8ATMd3O5YrxU3GeMp8eoy0/p94yX98fV9cr0sO0djdCFia
	if/kMAwN6m4EAOqHQk19BR+5WmImEXjCh92jsUbfQ4/DrAXtf19uhRqhdNWj6pniRO5dNDWCDgx
	apvE4hqVjWn0qP/flpDzuzuzOMRPjwMzHqb7PzC20aQ6p7sh9hrI3l/fV57gVGwf4Ddx7vYo4Ee
	z8jNPhF1Tvafz6qSmtt73EcFAAHSlDhUC36WVky/kTg9KDfQmpLBaG9i6d5ce7swgur1U2A8cMp
	KTZWOlWqxriTH/uN/lkEwNqBJqzPXNrPwZxJ5VucMPyv/QBy/AsX8+7npNmULZkSdPKqGPfkVBx
	L+xKjndOpt0oig8uMAV4CjOhyhVbVXqk2k6Q6HVM8k7sAkAAk70QfehkaD/bbvA5r87QXn5Y9FI
	itWdNgcDFKOZQPTXMmMsiX+rp5978felJtjD6E=
X-Received: by 2002:a17:902:ec81:b0:2dd:c100:80b2 with SMTP id d9443c01a7336-2df60b61d54mr3177535ad.45.1790061715434;
        Tue, 22 Sep 2026 00:21:55 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:b94b:d1b8:4cbd:b7e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d057f55sm4912055ad.73.2026.09.22.00.21.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 00:21:54 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH 1/1] xen-blkfront: unbind irq before tearing down ring and shadow requests
Date: Tue, 22 Sep 2026 15:21:46 +0800
Message-ID: <20260922072146.34611-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <arD7FHmbqJlLHmyE@macbook.local>
References: <arD7FHmbqJlLHmyE@macbook.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Roger,

Thanks for the review and catching the right origin commit.

You are completely right: commit 11659569f720 ("xen/blkfront: split per device
io_lock") removed the lock protection from the interrupt handler and introduced
the race window.

I have updated the Fixes tag to point to 11659569f720 and added the requested
comment before unbind_from_irqhandler() explaining that interrupt teardown must
precede queue data cleanup.

v2 patch has been sent as reply to this thread.

Thanks,
Yuchao
