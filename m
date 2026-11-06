Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945579;
	b=fmQCgeYuEFxXXwR9g7CNKe0/SvFDfjGdRZXPqNF0sdSXUGecTUfCiF2CdPQGXGvYvggq
	 uZSvfH1oaC/qlLOC+g/kgPbMI952wssRgX45cTzETDIo9eZqbcpDj79iReO0ARIGxjJN5
	 saH7ibRTFOwcMZSP1Lzu8+PJCx9F0H8RqvRz7nzoPUiYrmY5Q3x7PyE4FkAup300PJ9uQ
	 zAIQlQdSNy8khZZTo7hA8wrnchoqNOy2498kFK7/sBqUy7nGpfKTjzXdLAORnwkgf281L
	 yF1RrnIorGAymyz+f8cS2qq5xozBE0k7kbigTOS3beaeTdM+l3ZauouE9r3IRcPnItg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
	b=KdUg1+cAfgcorx79pCQLMVamYEXqGvshCy3YESEsIpdDuqengiS27/gfuTqDlK+dgTeP
	 LlLg91xron51ykk6KRfJcs6COgQxZypY1UpdYTL4rExzKljaB6DHc8grh3fqcWdV4QKmY
	 oEnC4dJSr8Uezb8srCAQ1ruN/T+qK1kj2vIi0TAGsi9zwKDemYSo2e30FFPxROH4wh6rh
	 1BQWpbBpb6jHoyo4jDy5AZNYCAogzUqrtCmNNmq+88Hl9VG1BfSEouAcqsgRJlrmm/HI5
	 XCUGOjXXaYqzT5aJGz5gCQ8uPYPYedtg4FdkZFIQ8IpbXqVO95ei0RtXSsxi1eIsFnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dn1UgjEw;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA86606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CA86606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=dn1UgjEw
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35829219da8so1430318eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793945577; x=1794550377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
        b=dn1UgjEwd9O1KMrjxmyVATBPLW/7Tg+o2uk2jNpDRJ7zln5a9gi68UkEyZVo8vYyj+
         Iwn2B/rPOzXwdxYUEPeJ3/DFyPZI2ERmxaM5V4W0P0bMsKcvplZ7dI+5BQlasOzp9Ovr
         oAivFEe5Kjmd9p5BPIJ19HEVAh/k7wvsN1fZpM/3LU6z45eCT7E/PPFW/q0o5x37Ga2a
         5GXbjhfxQ0fXJdT8q7bkPlq2Dss94yOEFN1aI3jm8cPSEsMoN8I+oD4fcaBOKZN0g7X0
         bi/Vx5cSU4SRxAMTBdOkquHotduIUnIRokW/O8KCqb5RFuyR9mRiOdh0sXIO+dhsY9XG
         eZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945577; x=1794550377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqC5kqEmzZTPK10ulwI68LiQM+78XkN3IO/N+99yYEU=;
        b=0AeM1DQs/RhpipMBUNlx/TqZYa3BGBSHWrRTX73bHQNkghQwELG14zMPx1FxAFyrl5
         2hyAQtYhGSbGS11oTKEDPAEO8rz19hPufbTh7XAzXNhO9R04zwFL76Ep2eY9C1AI2sCY
         UjYLH3Q19G7EinFNsBWJFJ8KKT8M9C14K97fYLLd7EEetIEWP0Y5p1G0GYG5gxJAjouY
         OYtwwFHqggzDIzTqCGg14HJFkekM7MIbd8KYL+CEc/wnFdvllbSmq8Yco/rg5N+J/8AB
         bIYpyKQIQ1jnsKnGJjvjj4kRfzldOsIECcHU1WWK6A3wiEsF7WJVEv2xRSSau6V6exT7
         LM6A==
X-Forwarded-Encrypted: i=1; AL+hErHLrTmaLBrW7iYLLj9cTUp4Mpx5unE6f8oYgPsxrU/gUyIzUDhlwq/F8B+B7fkM7Z05aV5dOvJH6bAM7TI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Tve8GBLp8FmscgrK/xqtN+gQFfhUZHZtOEX8lXlLdOscGT1yt
	VLA+5KYjYR/wVbWWnyuafcEobTY9bDBpyv4BOwKwBaE8M8wxr+XKvcOcP0FIAYT2vQ==
X-Gm-Gg: AYBFou146Na/+xR87M/x+KvbYBQzqEDUQTVn6nG+IjKNiR1E5ENnCnJBk5aNwB/XwB2
	iLISpC2b7ybA1qdzeekHZdkKZtcC2U+0p89z8p6uUNkYb+3krECCoMwi19MPfWkjQ5vZ+QTofrE
	LOqaTEVqFOIIku72lbvlD+B3MiVGuxPZm+FNWJb/j9f+z1KxWSXd9PP0QYtO4bTBAYfSPTSt09g
	zGSuNn1kWCSPmTy3r7GebS9ieLm2xTO7AuSRHgm/tXFaVxFm4rHtfKnEi4AOoWe37X/Uu5aISZZ
	ElwTdX3So+YppNN6hSahvkp7YkAlB9YvszJTOe+EhqULhWfxpaOiUqEEeXlxikDapfYNDyn/8wP
	ju6cUaqETQUloKvPTkuaWspevVyzzLFrXqAmBupmr+VduKpTcLWtvkmCOptp9sz/5JS4FzR5C0Q
	ysWZDIxPabp6mvCaDYuSA7QPzmzKJCyntVqfp2y+hvJF/Xn6hrgWD0vP1JIWH0Fpb3oLLTc3Z53
	2k1ZsHf/csKEWvv6maL5x7hLDFmasY/PdIztzZyIiT/s9fUpHKLJWC+gc/9Ja7AocSsqf6y/wEZ
	FDrv4WO3ICcHEfxy2cjOcHTiv7QE72egppFdHq++Cxq3PRUa2I8UgO/sdcB2Mi4bv/CAy8ShC27
	XDbqWhTFtUWrccctQIQ==
X-Received: by 2002:a05:7300:8a14:b0:343:5f5f:eef0 with SMTP id 5a478bee46e88-36de7432bb6mr6742335eec.21.1793945577142;
        Thu, 05 Nov 2026 22:12:57 -0800 (PST)
Received: from cantal.lan ([58.136.77.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm3755879eec.10.2026.11.05.22.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:12:56 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Johan Hovold <johan@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Matthias Kaehlcke <mka@chromium.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [PATCH v4 0/2] usb: misc: onboard_usb_dev: don't defer probing after the device is configured
Date: Fri,  6 Nov 2026 13:12:49 +0700
Message-ID: <cover.1793941292.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On a BeagleY-AI, kernels since commit f918e3804498 ("arm64: enable
HAVE_SHARED_GPIOS for all ARM64 platforms") no longer boot: the on-board
USB hub is re-probed in a loop, because onboard_usb_dev defers probing
after the hub has been configured.

v3 added a pre_probe callback to the USB core, which turned out to add
significant complexity. v4 follows Johan Hovold's other suggestion [1]
instead. Patch 1 exports the generic driver's operations. Patch 2
changes onboard_usb_dev to call them itself instead of setting
generic_subclass.

Tested on the BeagleY-AI on top of v7.4-rc1: the board boots normally,
and unbinding and rebinding the onboard-usb-dev platform device works.

I used an LLM coding assistant to help prepare this series.

[1] https://lore.kernel.org/all/auSdA8MfolA8OhdM@hovoldconsulting.com/

v3: https://lore.kernel.org/all/cover.1793669297.git.jjc@jclark.com/
v2: https://lore.kernel.org/all/20261030151919.3511106-1-jjc@jclark.com/
v1: https://lore.kernel.org/all/20261030114705.3159093-1-jjc@jclark.com/

James Clark (2):
  usb: core: export the generic device driver's operations
  usb: misc: onboard_usb_dev: don't defer probing after the device is
    configured

 drivers/usb/core/generic.c         |  4 ++++
 drivers/usb/core/usb.h             |  6 ------
 drivers/usb/misc/onboard_usb_dev.c | 14 +++++++++++---
 include/linux/usb.h                | 10 +++++++++-
 4 files changed, 24 insertions(+), 10 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

