Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC8C3793D0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270902; cv=none; b=gXGewz+TTAW1rceOl+viPuC/lRNuSjzdm6JggjbMThal/o3LBDWby1o0K2l2KvF9fayQXXe2uAq7jUQqoW8R6To3bgQevKMxzqmsG9CRwaDyHROgiVPybwc7sadeBNYUByg28rMgerzyIjOqa/VT9b9gNWvvnngvVYYX7tzTSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270902; c=relaxed/simple;
	bh=JNpViAt3rztoNvFFvGSsB1bX3qB9kMWEiZy0iNQ3tlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGi0xXix5P3cYCgbJp6XpE8CxDdFSKJ/VEys3PwaCW+7NKe43PKXEj/LXR0iXMG7fpxu50pjs1Xp9sWia3gLlnaiLGxEnF26xps4oxXs9Dm4tVfzE0XK/oRyybvSXSiAkJQKv5pcCjCG0+DQOpDYNrgrBdmJUVtOY4+OJ41ALj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQP4mnql; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQP4mnql"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso148539a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791270899; x=1791875699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNpViAt3rztoNvFFvGSsB1bX3qB9kMWEiZy0iNQ3tlM=;
        b=eQP4mnqlcpNqSchSirKmFq26ayeTv+BYKf4c8P3G/TktKXdQC8p9BJUrFwNvRUmqSN
         uvqr+4rJcUkGM5iU/CsFb2w/G4yUjuyzAC+QWJ2sS83NYToNjsshOrqTVB43j5XnT/c1
         iFeM74slfMt5PSyDTI/ddm2Gckd/oa2fCympmSIhVhOzKOr8gzeZZRQynSal5LIqx+Vc
         uIUPBPBcBpUcSEGxRthlEMFf4f7g6SE9aDQF0nP5hebff8n/KXmsVARmfTcwdTM9G/Sf
         GwAgC01OWkrPnoaywaYm/KpteIbkf6Z7EBF97zB5cW8+DhMT9A/7ITnpWfsqH40cVc4b
         9kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791270899; x=1791875699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNpViAt3rztoNvFFvGSsB1bX3qB9kMWEiZy0iNQ3tlM=;
        b=bRUghN0lo3ux0U9c9D4Oio3jpzijKeF5ihXZjl0vaOjmsT6r0nU9v7KiXWbp+ZD41e
         CtodWHWtROQp5gNdWEbvk92d4CpG+n5dtV1crRphQxWH53y4Z9MAQ1MIhfdlTKHqT21/
         v5tIqzsGGYbNrHN2nQZ+A74Qs6twW1ZxuecYeS0nF+JIEMnIveziOxlY1NKMVWRGZ0qv
         h/VF0Ge4BzwaiBGcw+/QZwy6mH519j2xNOD+nYDpSu6s2oT2OUTRqELfTOy05LX44D2E
         f56vGp3rXWFlVuErrzh2A5YsxB/G5mjGPdm2TlKypuNrxAr3z8drFrFQR1p74sJneabm
         vWIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIAKFRtvzE/uwFhdfqsxBk7Q70QYJQdflW5tO8JSrY8mzBqA9FFJtoDergOvl6XyDQvQ6DjKRQ0yfdJFs=@vger.kernel.org
X-Gm-Message-State: AFuF++mDCbFwzKaBlu590jedSJ/2zMmvXpP8UwEtWB+uMIAgducxcc43
	BM7lXaA4HL0sbgapiskaRe2RO5s2PdjBtKFQ5/V9kxk0+NnWhvrcywaM
X-Gm-Gg: AYBFou1LZmd3XlpadHrdniKWcwyNVY9hWZL9XHSG2ygX9J1ysujxx88feYIHq6wal2w
	NuM+QeJPnFIwO24L6LtoD1MEaFqIPvhJ3qEUfcbp1MMcvyLg8rt6bHrcIXyg/dyBFlUNl4m8yCz
	SvpG28fFHWjjxtzRgcKnoqoEqylFWEhqJUBTqv3XMzIH++tHK+Gkg/UY/ZaQ5V5oFmzkX8ueVND
	sZNhjJZteN7t0W/eu5epxMNyYkQIz//C/bfsJtwuDUvrCSnpECfd/3RLH09llBwm/7R2ZPzj3mk
	vBewJOAN/jUMyjzLMHJltE9jrV7gfUBkEsl43+5KGtdRWz1ur5EC6qfYeSlR2IyYdPDM+i3rhUl
	KJNW28I3gB+T+OR8wa3tme8annONOoMKs1IHaCBZHImpACAcEN6bTVbxtmWVBhud/yZFbR3w2kl
	ZoKMqv+oTWF43O9mps1B3KOYcKjn2JcODWHImjJLatOEN5s+ClfXR2zfV5pxrvOjxNpT63GeqZ5
	M1SH+uq9iMKxhCxCGNEslwoLHjXOOek29u0r3NMM16EIieQfnLud1klMx3Pc8AJ5OcgSIRGfdi2
	LelstGvZA0URCw==
X-Received: by 2002:a05:6a21:9191:b0:3de:4976:a0fe with SMTP id adf61e73a8af0-3e124802d96mr502913637.64.1791270898475;
        Tue, 06 Oct 2026 00:14:58 -0700 (PDT)
Received: from eve ([2601:644:4300:43e6:fe7a:b82e:befa:cd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6ded11ebsm2073356a12.24.2026.10.06.00.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 00:14:57 -0700 (PDT)
From: Sergey Tiraspolsky <stiraspo@gmail.com>
To: James Fairweather <james.a.fairweather@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Sergey Tiraspolsky <stiraspo@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Only use parent drvdata when parent is GOOG0004
Date: Tue,  6 Oct 2026 00:14:50 -0700
Message-ID: <20261006071452.11422-1-stiraspo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003222855.23707-1-james.a.fairweather@gmail.com>
References: <20261003222855.23707-1-james.a.fairweather@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Oct 03, 2026 at 06:28:53PM -0400, James Fairweather wrote:
> Only read the parent's driver data when the parent's ACPI node is
> GOOG0004, and otherwise continue without an EC pointer. While at it,
> drop the reference taken by fwnode_get_parent().

Tested on a 2017 Google Pixelbook (Eve), where GOOG0003 is also a child
of PNP0C09, on 7.2.5 (linux-omarchy 7.2.5-3), with this patch built as an
out-of-tree module. The probe prints "Couldn't get Chrome EC device
pointer.", a charger unplug/replug while awake and another while
suspended produced 13 USB PD notifications, all taking the "EC device
inaccessible; sending 0 event status" path, the suspend resumed normally,
and there were no oopses. Without a fix the same machine oopsed on
charger events and on resume.

The test was set up and checked with the help of an AI coding assistant;
I ran it on the hardware.

Tested-by: Sergey Tiraspolsky <stiraspo@gmail.com>
