Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FB2522699
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689610; cv=none; b=rCch69vNNstjnm91moUOJNMNWqr6BG0Ru/tn0rkJffy+e+7KvKnUbETRkR24Hcvnzr0g3ccURYwC8ePvvmWVlvVxU5er7QKBoY9CXMsWkJQa4nplEaQRnKEzFApmZ33CgGQf9KlIhKUeoqNg/dwliK00r8+9uIZpSWmvgm31k5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689610; c=relaxed/simple;
	bh=Kp9CE48bTabbu7VpGK2iXLCSKus8lSoacT4zk2Yq+AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rxcvFQqy3k/PkadpwAuU/pQcUHe9Pfy4leAqUwKwEYiuDNU9S/S1R+/qBWFvrrbDj6LfeXenm+Urh8LDs8RSBFsgbtqlBor4H++vHrn4zoasXDMcBt2sVWxAGTQQqxvQTt2HSNaMGtqkBIPx7Z6PbBWFQpCN6QVFqlOPP1Pi/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUnsJq87; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUnsJq87"
Received: by mail-pj2-f39.google.com with SMTP id d9443c01a7336-2e2d42b972bso2284825ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689605; x=1791294405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOOeJvOJP4u0GvXLFwAgs2A1imOHsTYXqHxFA32e08o=;
        b=kUnsJq873TiD9/sJhPbg0xr8cMbHIl3psrxalQ7og/Mi529uKCuH3BqfdVgm/qG3Jy
         9QkyzDRTbegPTh20ezcdIkbb4ZIp9rQaN5OeKIK8T2N6b7GKQUZOVQ5BOAf9HqJZEfr6
         PTIQNzHyOcwlOqmvCDom9Ze3tO3skqrd8yBmMCKTmVaW5w1JEEFeJ6+xisPDBOycUDzn
         CZBl9O4OJdvLkpYMVBwBcPl+G5XHluPBMW797rwz3GFA2sCURD9AYGmchLF/juVmZJ50
         LbwT9G6ss0c9hqEzG5RxVcmSwkT7Yyw5Z5G1AmrWLE3wLmtw7VhVCPN2ZypxxJkqBkmX
         6Jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689605; x=1791294405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOOeJvOJP4u0GvXLFwAgs2A1imOHsTYXqHxFA32e08o=;
        b=r9UB25bjCAWrrJWr8WKalvH4kL1bM0sl6pW7YmkOCuEyesYrVJnplrlKWCxn0AcE7d
         asAncMixw2PStsNZ/nZh3Zo7X8gsbnm8vLkOftJCifatsMyUYn8jPe24H4jTVqM2viMR
         Skl+Vr1joll+g0oFNf+0EKdHGpCSYrSGOuoWKK39VM4SzfKjK6zaJSBETy1UP0UedTA7
         cf8QPveVp36O2DPeHOH3RHHToorxkqe75x/Pso1EL0n5jStaz/fGL7FOqSj59MqAiQVs
         THvR3FNQ3CBYxOTNpmZNc/IX6aXyOk+/kefMU1w/shKAAmdIAJDszu1e+yriFIJtDsw0
         r8zg==
X-Gm-Message-State: AFq9FYJenxSPa2y0BeLwu7DgxT5VI0GPA542OKKZfO0KO0TKlXDD6vrH
	qk50DI46IB2mwtLsw5Y2Bt9WaqO8Bx+cII8CfojNt3tOpMH+iJu3ymo2mAdQiVfJ
X-Gm-Gg: AYBFou2PY9SOKsRMTtDtDRXgLheptU81Z0g9QvI/7HPQ2TbfAxWp+SCA+rlKdgaDwBH
	/EtBul0ewQ4HaK5MF3HLMB8RgcD0Y+oVyZeAB7aX950PJl4+8eTCuNzGQaMQXv02yOHZ9PdIXpY
	hfOdcSLiZBPMOrJMhFsO8Zu17EtytyyPPGi9X3fSoV13GrX/b8fp1yoOEtXxgDSr9uwCntfYsIj
	Fcgb9WiuJnbSYhPKWOwPBQQdrOhq3HQf67dZUD6Z6NYy1685pOJ7bbT4x4FclsnlVBshLdNDH2j
	fOfo6BsXAnYIA+1mg0jZXuRLibNseq5dgPIWQVQrlz6FOHU265Z2ecGUNWBNI2tQxpXGgRX1OOU
	wWEoQKNhxFU9pVb9320boL6NQDy8+YR5UKT/FaL80deemtuFbccE9CXkla49DB3O5m/8nYe+ZzX
	8RfYHhvV3a1JuE7bBpOKgRjp2XgC1cceuuHthZNETK5FkShtDWpP35mCuB10BoJlp/24riAM34u
	ok4+fPeBnTM
X-Received: by 2002:a17:902:d4c8:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2df7e669010mr129912855ad.53.1790689605311;
        Tue, 29 Sep 2026 06:46:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2bde57400sm18234425ad.47.2026.09.29.06.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:46:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 5/8] watchdog: core: Restore WDOG_HW_RUNNING if stopping watchdog fails
Date: Tue, 29 Sep 2026 06:46:32 -0700
Message-ID: <20260929134635.2567137-6-linux@roeck-us.net>
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

In watchdog_stop(), WDOG_HW_RUNNING is cleared before calling
wdd->ops->stop(). If wdd->ops->stop() returns an error, WDOG_ACTIVE
remains set, but WDOG_HW_RUNNING is left cleared. As a result,
subsequent calls to watchdog_ping() become no-ops, and
watchdog_release() sees watchdog_hw_running() as false and drops the
module and device references while the ping worker (guided by
WDOG_ACTIVE) continues to run.

Restore WDOG_HW_RUNNING if wdd->ops->stop() fails.

Fixes: 3c10bbde10fe ("watchdog: core: Clear WDOG_HW_RUNNING before calling the stop function")
Assisted-by: LLM
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/watchdog/watchdog_dev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index af756ee228b2..edf2cccd1c0e 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -324,6 +324,8 @@ static int watchdog_stop(struct watchdog_device *wdd)
 		clear_bit(WDOG_ACTIVE, &wdd->status);
 		watchdog_update_worker(wdd);
 		watchdog_hrtimer_pretimeout_stop(wdd);
+	} else {
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
 	}
 
 	return err;
-- 
2.45.2

