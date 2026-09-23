Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DBE42122B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185658; cv=none; b=Xfec+YhV2rTWEzH7tCLubXgt61aO2zI9/859T1vFcxWA1qvtVDX8JM4c1iaVvtGUWsCPZP0z4Vd/9UQG8cF8ZLWgJfJNEwCXpN8OnParWT3rKQ3Jk1I0e9gQY5mbmwBliEAINq7kuxeVTTGD2wKh5XJ9vLfT89D9LuGxdPK9VZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185658; c=relaxed/simple;
	bh=yVrM8sJaHGXl26LeCM8G7k1yqbumhmWeqCmDq5/L7Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQtksiFmkLuMRdNnHdu9ClW0Qq8Ot27udcdb4SIgOQJCkLw0AB5W4fT3GPc5yXJ+IoJJcnlEQP2YuR2u7jIWNUwAHA8xsQ5yHmgk7tBwnzSjqj3wrR/42IBUjg2DDPTr3NjA3esOhlJyO4L8vKFZHYCkFUGgmg3CDKruIeuGHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WIWAqEv6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WIWAqEv6"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso730808a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185653; x=1790790453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAVRGQRwud/0zcQSf2CKVKNedLQyxLV6xXHev/2q8II=;
        b=WIWAqEv6u1l9XVKDQP1FMT2wvYLOp9REyDm5+m0uATBjDFDs1mJ+WJVSvNlpt0RtVL
         YuQW4QW8FfZCV8pM7pVDbmGhlg872Vyq/s+XoaAZwofyLs9W08rsyhnJOHZn1YqlH+Li
         641VuNvd8PMCR1OCBVNLrYPnCtcFPsNIbyrnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185653; x=1790790453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jAVRGQRwud/0zcQSf2CKVKNedLQyxLV6xXHev/2q8II=;
        b=0wAzOpqi1a0wYv2EeXVstEgianVtmTkTf2o8IFXfBTG1wEQXQljH6dX/aVJxW8yC+0
         nDy5rYRB30b/JWCIWC11D20C0JONF93adaimktanPIqPy+L0mWmNI+KR81Znz1nrJzBO
         ++sE2TJkgFqVNnB37EK+OZtt2+JRKCNBFtm8bqMiMUVKCjkZLGbRbkydCFthjPoqIAdy
         SyZ8aQt3SMOc3mn/3kwbz6r5Pjm2qXskZwmKp2M492URDD2cNOA4l3ZyEDZ9X7IbcEzE
         DYRiQKogzcAVEK8CGaXUQCpc8glbMT2ATwjhY9nduTr/zIFgJNfp5m9/yFSjB7SczJqj
         66bA==
X-Forwarded-Encrypted: i=1; AKwUvByzRJtOaalA8RJVUqZ9QZxZV1CHMhRkZ6NCoIKGLtCnDzSomh7zvwlBxrdBe79dPfU5r90xWj5ygA6oPdA=@vger.kernel.org
X-Gm-Message-State: AFuF++mmA8QG6QrVUhzOcyi33MVmBkbc8fkaUDSJjTkebSpVwwzrpVap
	QoKbE6rOKK46zLlhwKMAcN3HTzYKEXZoq2frKIfT7yBtGtk+nJIjxP6ihG7VVGShrQ==
X-Gm-Gg: AYBFou03q8/clD5S7uesStnsNEayJKovWaq29TV2y0LEmMg/FL8qeUaZ6H5rkTlZZAP
	U93W5EW4yy4NuZZzIQ0ZejshdKc/aCYrSZoq+vuf4K31ZUqPB/I1EI16j0Ze+mch90ox4O7Ljrl
	JJBENh6PoFvCBTGoNkJBvHm84i1z0hdWD+8Hhm31qY+DVAjR4MKDEOaFs4sSfLvCAeA0lwnHT9h
	4MUUIZ/LFw2IuqlrL5GTa1qZjpZbdrN2XzyP5C0tIj8YBKDKAiCo56nVzoxsjzIUE1uFp7jioT5
	McdFSGzsJbOZkimA5SwShDFtmnog91x0ya+f01N2NpzwINQstcLHEzbK4giH4++jeDbuoSAbbXu
	9WAumCoPVKA4hgoe0vRzLfXQQusz+YQ7cUOHe3/k1umh9XsFgH+pS0apNCAp7Pe1txX5u/z8SSZ
	V8/xiNMjPAZiMA6+Mcq/GsbMcEedlvjE7fmcw3Mj4xaF6EpDQAxd/SQQQMBzo75p2/JlhbCwvfw
	8+F/pWDCy05ReUym1rbb0T3DMjOvUX2LU+19A==
X-Received: by 2002:a17:90b:37c3:b0:3a0:4146:2954 with SMTP id 98e67ed59e1d1-3a07e6be0b0mr2933474a91.27.1790185653491;
        Wed, 23 Sep 2026 10:47:33 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a097663e1dsm158337a91.7.2026.09.23.10.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:32 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 1/8] PM: runtime: Correct pm_runtime_autosuspend_expiration() doc
Date: Wed, 23 Sep 2026 10:40:25 -0700
Message-ID: <20260923104031.v2.1.Ifc8b2d1742729cc82f46220d85c6382fdee1fc8b@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "adjusted to be nonzero" comment may be a relic from when this API
previously used jiffies, although I'm not quite sure about that either.
In any case, it doesn't seem correct today.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
* New in v2

 drivers/base/power/runtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index bb008dfe85a1..7e75f6d5df07 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -169,7 +169,7 @@ static void pm_runtime_cancel_pending(struct device *dev)
  * Compute the autosuspend-delay expiration time based on the device's
  * power.last_busy time.  If the delay has already expired or is disabled
  * (negative) or the power.use_autosuspend flag isn't set, return 0.
- * Otherwise return the expiration time in nanoseconds (adjusted to be nonzero).
+ * Otherwise return the expiration time in nanoseconds.
  *
  * This function may be called either with or without dev->power.lock held.
  * Either way it can be racy, since power.last_busy may be updated at any time.
-- 
2.56.0.rc1.310.g51773c2048-goog

