Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82A52E07F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689611; cv=none; b=noQSJU767bahpwlmht5viDY6nHYoSKBaX93Bw8xZqkoVYm4WWQxmdtpteIw0iFXA5bpjtiYRP+jtrGBHn+KdZUAWBitHA2SxKpnT0+9e1hWp2waV468ARyAZUWEYYt6Z64jizm1E2iD4NTZIluAkNTAp+/4cNnJjnzYpSsQ5EZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689611; c=relaxed/simple;
	bh=t2v5EBAm60/SpL/4Kgrze9O6NYflbFJ7yUWXn8gk/gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tvMwdsTubUdr1QhCJPKH0LYV8kcItqhNB5VGxaMYkOsrGwyDu5KMCgpSlxSe66wNParlNFaI7E25pLYyqQQ0AxWgZ0D6sl0XbsfNCXzNMXEud/v5539RrEiOls1GwG8oQ6kpr3dcodmQzG0X0VmsLPkEvYn/6u94APjlb105BCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhuFgRMJ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhuFgRMJ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso2124976a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689609; x=1791294409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWDGuqjnTvGg5NH3Y73uLzFZTfCnb2e6NEIBzCLI7Cg=;
        b=HhuFgRMJivirdLH3vJmAhlrL5Rrc8R4lmn+l5SEkKnC2KEGjnDSFB7S8u7g/1Iq0+F
         ouH3PZK4/h6qYle4gK+MT3ZYMgDaGU/3yp6MjuE6n8c7VJ5pDiY/INUwaCQBmu8Oo5cn
         sbLuHqvRLCtzXs84OQLzb48/NI+aqwTVttd7VWHATcHEJ5hu6wsOyZaRfZoWaNzRMT1r
         TMKtX0/9oL/YqW9vmWUJc2G8Bea84lXWXgdOUGhPitEj7lMAYso6WP1GOj0SL123Kz4p
         buVReSnCfOZjfhXKlmurJk5jJrqPC6jfBBWwcKvY+1H0GNctCzk3Wsl8PXPwPz0iC/0l
         tQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689609; x=1791294409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWDGuqjnTvGg5NH3Y73uLzFZTfCnb2e6NEIBzCLI7Cg=;
        b=VqSkZzh0wi6VTUTbUiYo1+l/GiHe2+iTC7pLl/KgLdXH0KwQ6P11a5SLkTPddo5hQr
         aknQrySVC27re0d9smj+wo8kHUHKL4R1BbCbRIcaQLYyHPhmNsrX67afUjU/+qms9MeE
         h50AdkoYZ9QBeRCP1pdJLxavke7oJbJipvnNO6sBAR6h0+qryTcELmUThu+fEGp6NXYB
         Xy9lVXx/pwx7eJMQVny4ZIcpR4XnmeZZGIKRd813vSjuvA/8zWI+mdjBIN/4on06R3VY
         D+tJaHOuaJKorVQUn4I3mZsHtmI7kXBmkyfCX8axFiZbUUUOXzbZHyNtiSVS1a2K81Yw
         Jf/Q==
X-Gm-Message-State: AFq9FYJCv6HpeYI4oI+fJ8lFVHi/OpylKDa9N1gsa8n7f8MyiWZEK6Iy
	RsL9DdmjMfaYJN3FR8hWu9mB6nY3si5wfulkDfN2oQGDTCSWjMLq9eSIvQpVkPe+
X-Gm-Gg: AYBFou2wuVbCnkVuXfMyL0I5L7qTyhH9opTvudK/K+KzhKvSI4HO7p9Q+l+eRN+B6HG
	IMlkufpBbU6D36pcaH7eOtnjNvpbfihzkwZOgjmGaPSz5Ll90GHZHFBEzkkLpwH7yOeOKNvpSZf
	YpLnwmPPPM8Gu2qVCUPkP2CFQdQg6PfUIuVz1MxGmTcZqe9DXAx7SF9Rws3VkL5hyTMOmMJQwku
	fwE/1cZt0lkuh/rm5B7EmOVIblRtetRLQNZR+rZD+EppVVX+aGHisaAgHe5W7n7Cb6jM4rm0qnX
	DTUnxRoVOG8x/Cv3QGdwvf866nJimr7713D9bm1BGfIje4VTGppDg+BFt7TeFTAc12rf4JywtFk
	4VnS0b0+frbymKOqm+fa/EuZIQeB5kO1LYpXXjeuvIqFGR13sGAWhanhWN07ymmZJPUFoLM4P+8
	QXr4kIXzdwRUWdaB076UP6Q1cZZ4m3OicdTSghc4NYxEW3xXqB+uGaXAsPMLPC/ewDBs3T5a+o4
	05h4kacT7oK
X-Received: by 2002:a17:90a:51c5:b0:3a0:ab20:9e97 with SMTP id 98e67ed59e1d1-3a0ab20a15bmr8684739a91.15.1790689608914;
        Tue, 29 Sep 2026 06:46:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4b7890699sm276838a91.3.2026.09.29.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:46:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 8/8] watchdog: core: Update last_keepalive in watchdog_start()
Date: Tue, 29 Sep 2026 06:46:35 -0700
Message-ID: <20260929134635.2567137-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260929134635.2567137-1-linux@roeck-us.net>
References: <20260929134635.2567137-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When starting a watchdog whose hardware is already running,
watchdog_start() calls __watchdog_ping() before marking the watchdog
active, and fails to update wd_data->last_keepalive. As a result:

1. wd_data->last_keepalive remains 0, causing watchdog_get_timeleft() to
   calculate the elapsed time since the epoch and return 0 time left.
2. watchdog_update_worker() inside __watchdog_ping() evaluates
   watchdog_need_worker() and watchdog_next_keepalive() while WDOG_ACTIVE
   is still clear, using wd_data->open_deadline instead of
   wd_data->last_keepalive. If open_deadline has expired, the background
   keepalive timer is not armed; conversely, if the active watchdog does
   not need a worker, the boot keepalive timer is not canceled.

Set WDOG_ACTIVE and wd_data->last_keepalive to started_at before calling
__watchdog_ping(), and revert WDOG_ACTIVE and update the worker if
__watchdog_ping() fails.

Fixes: fbbe35dfcf94 ("watchdog: use __watchdog_ping in startup")
Assisted-by: LLM
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/watchdog_dev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 24488c20539a..b9979f9957b8 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -264,10 +264,14 @@ static int watchdog_start(struct watchdog_device *wdd)
 
 	started_at = ktime_get();
 	if (watchdog_hw_running(wdd) && wdd->ops->ping) {
+		set_bit(WDOG_ACTIVE, &wdd->status);
+		wd_data->last_keepalive = started_at;
 		err = __watchdog_ping(wdd);
 		if (err == 0) {
-			set_bit(WDOG_ACTIVE, &wdd->status);
 			watchdog_hrtimer_pretimeout_start(wdd);
+		} else {
+			clear_bit(WDOG_ACTIVE, &wdd->status);
+			watchdog_update_worker(wdd);
 		}
 	} else {
 		err = wdd->ops->start(wdd);
-- 
2.45.2

