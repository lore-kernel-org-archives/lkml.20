Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806053;
	b=UG+cdSJ4uHqlwInyhvaT7+eeP5KJBA3h/hDfCpc3pZYkw8e7IxlgoiT8mcJwiuZZlj65
	 T+2oIbKlhAqdviTVDuCw51ShU9NJvW+O/avJ9gMORIQhZwaTVLh5m7ZFbxKHLGj/6Xd6e
	 UhW8W9uWDLrJoJ2QGGBclX6YKbJqDHgPDPV9witmy5zzNOn6jm3amR1z8SI/6yQHdYW1H
	 mB6rLKfZ4cdoZ88o+bXE7XwmSJ8akBQSODRNefgQ7VDJrYqtoggSawttZxO+aNZmNVY5x
	 WEUGnPaIPCzUYd/RwOxuxhwXIuFnYf2nZeeFZcu0vnNR0TI33YgsyXA6hKwZC/Q1fww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=CIpKMto3juCBWIXYogyz/kuSz8z9yPBH98tdVVEJ+Nw=;
	b=kICSevfg9ZTg+H5tHp+FPt4RikDgaebg/xyNj0j+zWGt3YI7PaiOZIOIwvt3iogKm7kI
	 EewtgPGyS+rJMFputcCga2ZKII3Q4dQ0Xlz14LpiEgIF7Ci6Hx7g+GmNMzDjTThji/ya2
	 BsLUFliC8khsON+Vc0LNXpX//9hGXiLpMg2I2kcBwRTnrAKRRmXvR4JdxqH4HIUg+bwPX
	 Gzm0vIU9N+30ssWuNoyPtKkCq0aapyunXTJRVuutZYUe7+h2fYvNTS8tKgIdUDLCQHBSN
	 4qTTBPi3qJNaTyL/kXZlzRdwB1gTTEY5MSeUYsUQ2TiF3AOS50so3KRT16GtlJoJ/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MFBdRm77;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC9E606EEA8
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DC9E606EEA8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MFBdRm77
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1534095eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793806052; x=1794410852; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIpKMto3juCBWIXYogyz/kuSz8z9yPBH98tdVVEJ+Nw=;
        b=MFBdRm775Bi/ScTBqKRjBFWEA38yummgF+uxuNplvXnR/Z/ROf/AZuYA8YYRD20k1G
         4UM8BRc/wz72wN+85SIT2IctTPz3G38oamu7Ehxcn8wrdEPLPySIhAiJ2oyao0G6swEE
         yN/C/RofNftzIOCT3Zhl8qnJzmSmlLJNmyZC666rhikojqduFqSnX18DeIRud8JqZsgC
         6dQrN/fE5Bj2Z+851Up59So8ptymuu7b4yslRyY7KP/nLKRH0R7TQ4E0kZvOP6rOOX9W
         ozWZW77+XTmkzoVCX/JV+4gS6hkXmV49ruhL+g579TFnbhoCp0289ucaou6wWBPk2gCr
         hrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806052; x=1794410852;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIpKMto3juCBWIXYogyz/kuSz8z9yPBH98tdVVEJ+Nw=;
        b=gdxZhshY16djYYdcllThTZsyfFowa9w5V30CMZeihXoCMa7AysmPgEF3Nfzs8f4YV3
         lAHSrdVcfqse88qf3zbd/SWeFmmFhjMmoO2ckpWanlm8b5GOtQumKr/gJ5qSnKaHh6i1
         rhNRqig2F9kxvuIOJfSqxhedAps5x/gUKT7OA+ECRdZEwTIZAmLX3eZy0A4OHIkMMyhX
         m7kK5+35PXYb5/Ou9TmZksagqUQoD1Dp16s85mIexb2sUd23W8g/p9Tb/ZXVC6oNt7L3
         DumPwlOo8yLGKJvyPU0FtI8mTa1kukywXqK9ZrAN+essFdl3uV0fpw0UxtVqy7vVcwNj
         icig==
X-Forwarded-Encrypted: i=1; AKwUvByCRMdQlQcjLVbxzWtt7TSRQX8iUhIVhvbGmpMrSPiXMy6Kgu+THgd2Ecna+SoCRE1mWvmj7I4CJIcwy/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9rE7RQyU1SzXebiHRgT+vlvl9xlBS2p13fbuZjvFHxgJHuLNg
	8zxSY5jZpHXzr6592CRcSHMUYzwW7LkHw0+or3LGAuAc/WhXcVbFuAbpptkvvnBx5gWPRJnSAdx
	LATeWVGakioM+t19L8oAAhQ==
X-Received: from dyjm35.prod.google.com ([2002:a05:7300:16a3:b0:358:f250:485f])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:88d2:20b0:36a:6d52:e16c with SMTP id 5a478bee46e88-36a6d52e261mr13279550eec.12.1793806051988;
 Wed, 04 Nov 2026 07:27:31 -0800 (PST)
Date: Wed,  4 Nov 2026 23:27:30 +0800
In-Reply-To: <auo6bvjDtwAMKOid@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029040005.2100005-1-stanleyjhu@google.com> <auo6bvjDtwAMKOid@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104152730.3102376-1-stanleyjhu@google.com>
Subject: Re: [PATCH] PM: runtime: Update runtime_pm.rst for non-fatal resume errors
From: Stanley Jhu <stanleyjhu@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Brown <broonie@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Jens Axboe <axboe@kernel.dk>, Bart Van Assche <bvanassche@acm.org>, linux-pm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 at 11:47:58AM -0800, Brian Norris wrote:
> Those need a close eye, as the code involved is a bit subtle. I tried to
> review, but I'm not really an expert in those subsystems. (I'm also not
> quite sure the second one was 100% a regression, vs further exposing an
> existing underlying problem.)

Agreed on the UFS clock-gating hold release. Keeping the hold until
resume succeeds was cleaner regardless of retry behavior. That fix has
been applied to 7.4/scsi-fixes. I have also sent v2 of the block-layer
q->pm_only fix.

> I think it would be better to flip the comparison to the other
> direction, and deemphasize power.runtime_error. For example:
>
>   "Unlike with the suspend callback, failures in the resume callback are
>   never considered fatal, [...]"

I have sent v2 using that comparison, without mentioning -EBUSY,
-EAGAIN, or power.runtime_error, and added Fixes for commit
aedc51762a0d covering the ->runtime_idle() paragraph.
