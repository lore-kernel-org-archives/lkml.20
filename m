Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993577;
	b=Y51fjGbgvZzkeS6TMEL+a2+4sSSnEGL5+hBKG4yCj6FFb1dYgKf7gcQD/J+/chwcD6Ol
	 R/P2SfYKcQ0RWDrIspnLcvsjDnxzJfm87aFWQVAmPwYWTxSYOeIklpCAy7nRmBHxxsXF4
	 gOXE1VWW7y40r4KDBD7pQGD5uSHPl/TILFVW6ynhxi7JP1/CdCya3zxSoTcArc3ggD0A3
	 01FmrimVEwdhMzmT+l/n9fx8BDZcXFSJNZLXuOMr86KnbQh63dFMdTLP3+QaOyWSq4vgJ
	 096pb4TWUH4IAQaSfgSaaAuw08HkEfPwUYPVOwGwcyr+RGtDRxiMSQ3/aq7JyWIQjww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
	b=ex0KBGTrMtsgMqOFAy5A6jwlkEivI9ONTrJnKkQtUf0KCByRvj0NCbTyhSA2qD+t35Vl
	 HjICRVk6ZLE/J33MHLqITu2pGG1l58PHJU+iAr8T0jeqmioy0PPQi7FvotglV9AzIZs3M
	 SxyEPMj3aS2hCpJoGAkAuXnEIW4AA6S9UnF8h0SSRbWaNrrFpIPjTmSVxgc/mag/j7jm6
	 RgkphdztZbixrWgRSqOyft3vISIySsIYNk6zweBbbldDdXcniwVOt2LiSr2HFHuPlNSfF
	 ttoPH3WMxAZ7Nb7v0LAFWrErbFKsNbpKu6HImPfzSFILQKYKQ8WEprQ8tVdKsOSJy7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZuEqrqc5;
	arc=none smtp.remote-ip=209.85.167.72
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD26B606D802
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD26B606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZuEqrqc5
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5be4f207adbso505372e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793993575; x=1794598375; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
        b=ZuEqrqc5moQ8zAXTVWRc3MmHjV99fcIi5I+eXYb+MaqleUi+jOsied54WKEB8jQJsa
         CqgvUyDoZk0r33vgI+AQ2PTXDbZuJo4bCbsfUeZ5c8hUcXn/8V18PpeLdjL7/yqVrCQR
         5y2nEAMgcbOE3ZnI9WKteq0Hjd46ctISfebk6LBsqYLzK6r2J6NxnqttC3mzBMu9furs
         U80FG6iDeCVS0GmwISG96v+NE0wz92PvJ8Lab/Nese01TLZ/SBUI/zDl1ALNq1RkLLkF
         QUhlxrsCAE7WDqErg+AxqOJ4bOO6hM+EEtsINebgoVZdFS7oPPymt8aVTb9wxg9tyfp9
         raew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993575; x=1794598375;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eV00qevpiw0uwOmkgJzGcKtSnafIzvVPxNUpPKZUN5Q=;
        b=IAFWZF8t//h2AC2YSyyHzGyxSgvsy714w5v3iuV+YYJG3SpMfs1F4yqQwAV4uycnvK
         nf30cOHzPkfLBJSKUYsIqql9dgt+q7m/kPWzzTMiy4tbg5pGugzzmx5K+zQXGHwv9QIg
         XM8btu6h5PX/bOUjfghHDcVqrXFykxAoevjAC3N7/aN4ZNeOOo6YBAcOWNIk9PRZ0V4t
         32WoxOvMe9Ik/PlHLNAUUaMJF+Y3LfNMctd4HAApxwjraFB7IKuCAC6PV6MznWulOuen
         1vMimQUrDOCIeXCRGbIiJoPhBB902PEOCN7+iGibQtSMmQ8GcekZiI7iVlHEUVKz36VR
         kP3Q==
X-Forwarded-Encrypted: i=1; AL+hErET3E17FnbV8RDgEMZ0OIJiCMF1FoBTcwOyZtADJ3b3SbJQhBxnABpb4bnEP6A2aC1oJOf0Sw9sF3EXfLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8LnD8eYFS+pPg4JNpscEmBctt2wonN4LY9t/998okUfwXIt5P
	YxVrh8oMpzTZVcZcjO5Tj1qYkc3u7+t56aVemyoRoVS08b8zkOuasC/S73YSdVFAT9mOfu8eUsl
	SouYlXWFUtg==
X-Received: from lfyy9-n1.prod.google.com ([2002:a05:6512:609:10b0:5bf:f63a:785d])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:ac2:4c4c:0:b0:5bf:c9c7:eae2
 with SMTP id 2adb3069b0e04-5c003c595e7mr1028653e87.66.1793993574941; Fri, 06
 Nov 2026 11:32:54 -0800 (PST)
Date: Fri,  6 Nov 2026 19:31:17 +0000
In-Reply-To: <20261106193129.43493-1-dbalint@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106193129.43493-4-dbalint@google.com>
Subject: [PATCH v1 3/3] mfd: cros_ec: load cros_ec_pwrmon on supported ECs
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Daniel Balint <dbalint@google.com>
Content-Type: text/plain; charset="UTF-8"

Load cros_ec_pwrmon driver when the ChromeOS EC advertises
EC_FEATURE_PWRMON.

Signed-off-by: Daniel Balint <dbalint@google.com>
---
 drivers/mfd/cros_ec_dev.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 529a23b804f7..9cf85636b7f9 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -115,6 +115,10 @@ static const struct mfd_cell cros_ec_charge_control_cells[] = {
 	{ .name = "cros-charge-control", },
 };
 
+static const struct mfd_cell cros_ec_pwrmon_cells[] = {
+	{ .name = "cros-ec-pwrmon", },
+};
+
 static const struct cros_feature_to_cells cros_subdevices[] = {
 	{
 		.id		= EC_FEATURE_CEC,
@@ -151,6 +155,11 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
 		.mfd_cells	= cros_ec_charge_control_cells,
 		.num_cells	= ARRAY_SIZE(cros_ec_charge_control_cells),
 	},
+	{
+		.id		= EC_FEATURE_PWRMON,
+		.mfd_cells	= cros_ec_pwrmon_cells,
+		.num_cells	= ARRAY_SIZE(cros_ec_pwrmon_cells),
+	},
 };
 
 static const struct mfd_cell cros_ec_platform_cells[] = {
-- 
2.56.0.455.g6c5a503b38-goog

