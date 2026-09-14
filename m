Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7AF47F3A3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397339; cv=none; b=PdzDMKd4xRpOmOOD8Zigyc6XVFn2xo2ESXFtnKIglxp1YwLJinHDv93sec9Lt5zARRoCqGDQ1ELALnN4BkP2MRVxMFhFXrQG7AeN9RSJ4GxSqHFYNOai3s/n5XcjfgFDXw5UDU/hVnYxiVznQulW0seYhTpTd7f6b5OOpSWqoXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397339; c=relaxed/simple;
	bh=quh94/AJr9y3llEvHxq0YXMZ9NlLMA110pinXcbYFtA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X8X+F3VZi27j+8HZJA9ON0A1eRAGY8CvGd/PbaKJZ9nlbNgeU8uiTGN0o6wyOENF1rCcoys2qWf4jLTcd2VisIIzaxi6Q13O+CPXwhCVuVZ9Qbk0dXcJeWCM0ekqqAuKhhADI7AGlYPNRmwBntekecsrH4iKU6RTsNM4N7o5Z4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LCnVUhva; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LCnVUhva"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso6056026a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789397337; x=1790002137; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=liUHSJz2sQjWxVOaA4OPu7PhePlMRZGkaLaf+qxvMtE=;
        b=LCnVUhvaS+IqM7vgKjBfQ+9o0faLLrgdZ0WIjdrn99qdWrKYFFYzE2SUleT/WM+pmY
         et8XOkBZvlWpghhkUt/hPO/MGbO/9dJ72Ih5fStTsNwbzjcEkywYiWqRxKqUDCxF70vY
         7dt/hksgexRuEO7L9I3W5ztZfPgPPrw3fZle0mPpzhKz6fpNKJQWrGDMCc8nqDDznA9C
         XA+16Md1gO2iK2F3tLuMbYFLTY26CXUDhrHCrCCW5OgHRrfdkLdUUEaQbVYph8/a8V+n
         WEeEUr3epsZN2Zkc4El76jC3IA09O8pJcZl1mpuLEsn66n4UpPoVUiNRkoXhAQllWHry
         6CWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397337; x=1790002137;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liUHSJz2sQjWxVOaA4OPu7PhePlMRZGkaLaf+qxvMtE=;
        b=CaHam/B2Cpmp10zZWwhT6WPh3gAaz5A07LoP4wtYx4SHBqK2jiDa/MX9cNaaBN2J/L
         FZhyttbhgz0pl5hSRz0WQXbI7eBvQt5Z+PYF6fRhNiL8Bwk23lMTW+psa4godtqe7BK4
         43wZh75Nfy8rhpuCkAYMgWLVkYw2xlmX1h8IWHswIE2WaqvbQM0itY3gAD3NHq9c8q05
         DI6u9A89WZ9NRiIIz2/e3m5zF6NRfqtYc0qzZFhArN+ktNRZdq4GA8o9ic4Bez1Aphy2
         CaQktK1hFie6mdfrduUgPLKwTsr2VOiXoNUfMCMD+cXB63XojxAH/kq8n6VPU1zytH5S
         DyVQ==
X-Forwarded-Encrypted: i=1; AKwUvByPQXtTNmWeBd5Wc1LU+7gAkuwVZy7JP1njd48qKagBLyBgey2TA9+XuJUzfXkSKZebK0bJRgHVNrLfz7o=@vger.kernel.org
X-Gm-Message-State: AFuF++llIhaUjkGP15r/WWY9JEN86kZhQWL15WKXsp+AyRSUA2ob7fJU
	pYPa/XqHAySf2Fyr49SVnfR4jzt65QNBhx8JibcIq1u8wCQqqJMCqZeAM5mxN53vDWWMQeZU02H
	OSPezHFTmijhBA5TxTTnLeA==
X-Received: from pjbft12.prod.google.com ([2002:a17:90b:f8c:b0:39d:a3bc:5ecc])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:582b:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-39dec0aac20mr5937667a91.19.1789397336285;
 Mon, 14 Sep 2026 07:48:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 22:48:54 +0800
In-Reply-To: <b07b648dd0e914e2f6d10fcfd90225c1ae83a8cb.camel@iokpp.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260913033633.3159296-1-stanleyjhu@google.com>
 <20260913033633.3159296-4-stanleyjhu@google.com> <b07b648dd0e914e2f6d10fcfd90225c1ae83a8cb.camel@iokpp.de>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260914144854.931149-1-stanleyjhu@google.com>
Subject: Re: [PATCH v4 3/3] scsi: ufs: rpmb: Drop the unregistered ufs_rpmb bus
From: Stanley Jhu <stanleyjhu@google.com>
To: beanhuo@iokpp.de, jenswi@kernel.org, mkp@kernel.org
Cc: gregkh@linuxfoundation.org, arnd@arndb.de, bvanassche@acm.org, 
	avri.altman@sandisk.com, alim.akhtar@samsung.com, beanhuo@micron.com, 
	can.guo@oss.qualcomm.com, ulfh@kernel.org, linusw@kernel.org, 
	shyamsaini@linux.microsoft.com, alex.bennee@linaro.org, 
	James.Bottomley@hansenpartnership.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 2026-09-14 at 12:05 +0200, Bean Huo wrote:
> "has always failed" is not correct, bus_add_device() only started rejecting
> devices on an unregistered bus after this commit:
> 36f35b8df697 ("driver core: reject devices with unregistered buses").
> Before that, device_register() succeeded and the device was just not added to
> the bus, so UFS RPMB did register until that commit 36f35b8df697.

You are right, and the consequence is larger than the wording. I built
two kernels from the same base with the same config, the only difference
being a revert of 36f35b8df697, with none of this series applied:

  base:                  /sys/class/rpmb empty, one "cannot add device"
  36f35b8df697 reverted: rpmb0..rpmb3, four regions registered

After unbinding the host, the reverted kernel still has all four devices
in /sys/class/rpmb while /sys/class/scsi_device is empty.

So the leak that patch 2 fixes is real on v6.19 through v7.1, and this
patch re-enables what v7.2-rc1 disabled.

v5 restores Cc: stable on both UFS patches. The cover letter cites
36f35b8df697 with the measurement above, and notes that a backport
needs all three patches in order.
