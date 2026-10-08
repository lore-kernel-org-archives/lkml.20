Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045821CDFCA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486996; cv=none; b=b+T8dMzLeAyr1RObwSHD0GhuLPEDFelSJiYdvA58QlCh/RURjMZ4+yvs0oIAl1Z/4xnCR07F2klxbl+ryPnGJkOrYiHTv1Hj07F6CG0t5aR7IImVQOV7phN9kkqzKR0rW5wV7PtclGj4vvYoV0yH2HmpEJB4EIQAek6gK6n0WMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486996; c=relaxed/simple;
	bh=Zduh2DU6SfY5so6BkNbBiVSWdbKi86BAIrpyrB+S01I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QUwVaQBhKeJF0raOcKRJoohshCvtlLWdSaFfoaPNJ+CMl/cS1yvzPBLsdDj5LRLPjm5xP3V49VRMBrtmeevXc0XTH6YAArX1kWnuBwPlg5xx2J3GUDWZpI27M4B8MkUmXwsXIjxQeTeeQJwQKzCE++Wi5zLVGa0b+IPfRRS2eOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=OLZWcymH; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="OLZWcymH"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33e6279a1d7so3252825eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486994; x=1792091794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJxEIraSPOLWNZvCZSoZUxwKzeKR9+5tZ/1A97aGpYs=;
        b=OLZWcymHWyplJSXrHp7cCMtJkQy8ScOMVcrXzeqegCc+EEzXECFp/FGgnU7bUH5mBt
         SPRYTbR+COdrOmSoWhmMY/+IZshLE2ZVu3YrFuKAEabs2CF1aPD9I5KOA1xTOmbDOqwS
         BUmHhoozekjgQDCimZo173L/L1yCIDctY84klyPvPEdemB9rv9yI3DUqNI6duL+9IKu/
         Z9A++QoLoe2BooaWcuh+3EmSTb1J6R7zu2WcmaroQ0TFxz1Fk2sl12JKF7CPx+m8Rm/o
         Qz43gnBH/6aukgPaSncvpGAolDGaAZjMOFSzQ6uebKXQjE+zBSyrQ8SU1GXawq4lfHdY
         AgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486994; x=1792091794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJxEIraSPOLWNZvCZSoZUxwKzeKR9+5tZ/1A97aGpYs=;
        b=WA0+gRxvb0HTbGOrHShFK1S/nVXH/ZsC0NQ2gu85Pjv8AqKcexzUpiwILXL5bySpnM
         RYYkfbM8PvJDDP5PWBm9FzdWsrzTlYw4TFjG6d4rEwOfhFgF2rAQwoelBvog+I2Ddbf5
         bhtFxZ8OxdyWdXFIZxYicTemVPSmZh+esrXkg3b6M7Cv9r3Xv4clX0lC7wEfoZK0FR3i
         DIkU629g90vLKjOhBcR7OnAgv/i4RRDZSzAitLYuvgwh4jjbv1fBHBMf35lh/EIsepyZ
         CbdXNGhDY7aR3XjRGhW+EK6O4Qev5u/tgzqhEF1UMikXyQGX7c4jYdfKF4MqM1sVe9W1
         7cug==
X-Forwarded-Encrypted: i=1; AKwUvByYNqqN7+LjVYLq0t3fyK0uj+noWGrzQNGWEKyf9vZ7711V1fBwoct8z7EQyWDRa7F+3IqEiPCrHLD/uNM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuM5yNVkMHs3Ku+k99NiypQqZSE6Q7a6r7uVKGP1ZAPCAtWEQ4
	d5B1FPF8zJwXX2B40DRl+h46FCg7P0cwTMfZfxwa1Cz7Dw0NaDAwHHoTy5kFQBd4R6A=
X-Gm-Gg: AYBFou3RIp5ASOOPG7H9qf9UlFBKuOKWPYh5EwTRfIIJCcfY6bxRqbFe3MbY3HnO3Hc
	mW/EYvD2t+ITPrxUldvi2B4nn62fmBhhIb2TOzB7eSVGDen2JtKSL1vPmN+CExHx2xTKkb2famM
	zQSrISnzLR1myoPT7RsrOgOyb0181N+srQW1X8VEJuIHehDk4O7NtFrSHp1ma7N+KfYq9rayzYq
	ROs7Y2y6BmaCtn/k7WtbhOfE/3dg1aqFQ8P8UpskrcjJsxVhPQcobM0hIOQXlbYOKjxDOimfi+Q
	cxbWAL2hbEl2FKxOwEwAmTkyOhQODCU3AJHtjROuqX04CO+CUUQGA06o1GVI74ed9sBIrTBr9L6
	a3pWq5N9grHBAJpOUR/YpmgYtRDEz1Yin5aKRJzacq+U63qheGqSa+q3gvfCqvxqUd439Pz/2LD
	ry4wcMabHtGyXw4EwK2inLj8a46hfXJIFKPDz+XKjtLvh30ChHxFrtNGuCWD8P61qQUxr44J3Ud
	BsJQHRRB4fR78rIqLKH12l/sQwpfQ76k8SD7Q0l3Z0pZZCJh02MLg3GbZrqMzQ7FyuzbLYLW5i6
	srzU3Q==
X-Received: by 2002:a05:7300:881b:b0:351:207d:bff4 with SMTP id 5a478bee46e88-3515db9c789mr8494154eec.4.1791486990854;
        Thu, 08 Oct 2026 12:16:30 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm54053eec.20.2026.10.08.12.16.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:16:30 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	viresh.kumar@linaro.org
Subject: [PATCH 6.6.y 0/2] firmware: backport CVE-2026-93083, CVE-2026-93093
Date: Thu,  8 Oct 2026 15:16:19 -0400
Message-ID: <20261008191624.98532-1-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg, Sasha, and maintainers,

I'm working through the smaller CVE backports still missing from 6.6.y.
These 2 upstream changes belong together for CVE-2026-93083,
CVE-2026-93093. They must be applied in this order because the later change
depends on or completes the earlier one.

The complete series is already present in 6.12.y, 6.18.y, and 7.2.y.
Patch 1 also affects 6.1.y and will need a separate backport; this
series contains only the 6.6.y patches.

Could you please consider this series for 6.6.y?

Thanks,
Artem Dinaburg

Series:
  1. firmware: arm_scmi: Publish channel state before callbacks
  2. firmware: arm_scmi: Unwind TX receiver mailbox setup failure

base: v6.6.157 (79643295eba17affbd16ca97f3ef04c90266b28c) plus stable-queue
revision 958ddf240a33ef26b1771be944f0ea6c3b597472
