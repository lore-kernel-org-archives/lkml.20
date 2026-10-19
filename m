Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84AB347BA9
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792375106; cv=none; b=Z08Lzq/Xq+15dwYMCknbZCOKtj0QagCvGt13In9C4ga+Wcsl7GjbEoa1x4MAyjb3f/yrD+jl3Dan4282qgt00ZHed923oBwPhIj6BxAt1hzOSr2dCh5pDYzo1RnO4p3HJkNY7kvwOd+mLr4CElbHkpDy9xsXb4f8MilyfPHDiBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792375106; c=relaxed/simple;
	bh=kl8uHsKtcdd3+P1gKs83VfUWcS1UvEVB1ftqYP2i9GI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ncAm3IOhHy9F9dB6v57WWKSpJpWtfXfx+s+uUZ4rziYxg2FVAZVZRwyyv+tuLXTP4WYiKxS6i6p40trVmc72sfty7QEebUfRlKlt0ho97pMbSkCP3na67SlHkfEM7sM6mPVkV31z9PXag7DG1MeJm7ZAEVHDuxJk071VZy86NUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=feE4iIHP; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="feE4iIHP"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b06c0794cfso12429777b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792375104; x=1792979904; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qiiLrBltsrNS/cDaqww/ZFhb64+tZsgZICIoZQIW4nE=;
        b=feE4iIHPPxFeGPeXKVUThttWLY1z4pJQm37Wyzvcf4xj8e/yvVhMvlMNkzAg7hkeQx
         KMm+atZcF/R2zpgH1/d7Ul28VijGj5PPu/sQjt3TK24nBp6tbxBdZ67nXc3IoT3KFryz
         wjjtnP61/HF9xVYSLQR5WUmbT1SVYWpQ33jPtMzmFau6kXIxn8gWYh9GKyGeFNF82Xdu
         hoqQq586l1vb/29BobZ6h1Wz6BNYh4fAO5okkr0K5p8D/BMhtDajEka4tyGVR3fjXiJI
         Ug8/b6CqVZcbqW6ULPggsGq269V2YcEx/2UITcKzoWMEN0Os9AS9mbyZRTtDvUzLEkIl
         km7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792375104; x=1792979904;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiiLrBltsrNS/cDaqww/ZFhb64+tZsgZICIoZQIW4nE=;
        b=McGjjYq5XDSF/Whc/W35+B05y2CDbD7rWN3guloPy6Hfsx3kP9ATW/nkRKoni6O0VE
         NMrCSvYO2GVB1oGt5127VrHs9JDhc31ghDpVJhtqB8CpctkMxwVm0lZS7QGcVKXUkLYI
         6TmbsYTPsb3o/2kXeU7jSv2teqnijcysKBhSJ0sA0e9L1cM+fL5h9y7iuKcV2uCZhbzI
         LKhUWajHyXdmX/kFn7/vo6O7SME6UFAmrT9CVsG3sYX3caoDQFdDoQk0f6Kr/XUBHXOe
         EdVXOhfzAl40IOx+nMHMEAn8tpyvB15zbAvdEV713oIqDdgjIqa7jaZdpBxQIBKqNIiZ
         nyeg==
X-Forwarded-Encrypted: i=1; AKwUvBz7MYzyYZGtkwQcOTgrmUmdY27Z3fXJJbsbjAOZpc0gInPV1F1cUCaFL24wv80nGYXfjuNsEK4SA1yY+CA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJctfpvi+1B8uPPzFdbQXr+Zp3hPzHKhaa1rj5r+FIQPQw8EktT
	ve+/n5ni+HtKJ2mTxMOa/Gd0BGL9a3EH5/lH1v//wQRA+cecg5oJosX6
X-Gm-Gg: AYBFou13sXp1d+lyubom6QL2e2vItEnrW2WE/qvu+pUBxkCN5xg0GUig432zLXfmrl9
	m129d/bbK2OEfYsY41ZQEGshjMkhVzGjHSrKmtNhU5HVGxd2pbEmrMYMqL7rCjsBu9LvKr+TimC
	byc0KQN5Tsr2VFb3D+qM0YY0KqDkwjkuH2YDJl/+hVmD7IifJRqPuo/N1LZK8uvOOD/kEAygfMd
	9X8Dme6yaow+PViPVuz3sGLOFjYUGQlB14qsNBjZx8RPe8MqOqoCaprSvkYptIMzbs12GM6YGQA
	x5EA3Md3dGy4+L8zQ+68eUfK/dX3ssNpUdqWgxMl6g4Buibtu80nQkgnK33eQZty03ZLzqhPGI8
	9NmlRXGlRCEKUojtTDqEm2vXqHGgoqulrK3IWGRLanMTtWB3EAZMn1At1V1mki+grQqZidKQGcJ
	DtAX2hqct6fJgWghS8R3pP2NXV18TL/d3UDn1sIi4LnY2zN+AIc+nrqOBfBg/4WjrfFme+yP5wr
	0D7en3yVpIl3TlqPIjodHalQcxwT/EMfGcJZ/FBhU6/qAr8tZCC7Pt06RHgGPS9gFIDADn5R7rb
	f/Ew
X-Received: by 2002:a05:690c:e3ef:b0:8ab:33d2:152a with SMTP id 00721157ae682-8b0f21c14f5mr21503857b3.52.1792375103747;
        Sun, 18 Oct 2026 18:58:23 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58af029sm35834427b3.19.2026.10.18.18.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 18:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Oct 2026 20:57:44 -0500
Message-Id: <DM8FXLI78NYT.1211XFYSRH5P7@gmail.com>
Cc: <linux@analog.com>, <linux-iio@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] staging: iio: addac: adt7316: error code and probe
 cleanups
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: <raffaele.tranfaglia@gmail.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Michael Hennerich" <Michael.Hennerich@analog.com>,
 "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, "Andy Shevchenko" <andy@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261018-adt7316-error-codes-v1-0-1970b7e242ac@gmail.com>
In-Reply-To: <20261018-adt7316-error-codes-v1-0-1970b7e242ac@gmail.com>

On Sun Oct 18, 2026 at 4:41 PM CDT, Raffaele Tranfaglia via B4 Relay wrote:
> Two small cleanups for the adt7316 driver.
>
> Patch 1 makes the driver return the error codes reported by the bus
> helpers instead of replacing them with -EIO, so callers see the
> actual cause of a failure.
>
> Patch 2 removes the dev_info() printed on successful probe, as
> drivers that are working properly should be quiet (see
> Documentation/process/coding-style.rst).
>
> Tested on arm64 QEMU, with i2c-stub providing the device:
>
>   insmod i2c-stub.ko chip_addr=3D0x48
>   i2cset -y 0 0x48 0x4d 0x01
>   echo adt7316 0x48 > /sys/bus/i2c/devices/i2c-0/new_device
>
> - probe succeeds and no longer prints a message
> - device_id reads back the stub register value
> - writing 0/1 to "enabled" updates CONFIG1 (0x18)
>
> Error path, instantiating the device where no stub chip exists:
>
>   echo adt7316 0x49 > /sys/bus/i2c/devices/i2c-0/new_device
>
>   before: probe with driver adt7316 failed with error -5
>   after:  probe with driver adt7316 rejects match -19
>
> Signed-off-by: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
>
> Signed-off-by: Raffaele Tranfaglia <raffaele.tranfaglia@gmail.com>
> ---

This is the current policy regarding AI and staging [1].

Thanks,
ET

[1] https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh
