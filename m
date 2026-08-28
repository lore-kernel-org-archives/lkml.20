Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A8402B9E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911295; cv=none; b=bfaubd/TYjxuHJf+sEZ50krsiUWRuTAvgLYvEaXL/k0zs8a0CARTggr08Euhu92ZQHmKFdVBPqfZnOxwcBCF1eZ3W4wVC6NEoEWiiIwTuDGCsZqZR0cldXlvIcY2K+solh0GFWE2jjYWfoW5HG4dvsL46IcZF6GeL2fld2z9X4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911295; c=relaxed/simple;
	bh=V2NCxpXmvAGC3tPTzqlZs/jDxrN1fRwdEMJ/zkJq6SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvlYcPkjNbf3hS4+Clq5f4q2aO6OTBsURHXcdko+mYOze+tjtbGP+7saAaox80RtY+7TmQb2I3INwOylh5+beIxgGh97MYNzYiwI+Xtlsgjga0XYDpUHiNaDc70q3en2oSnU5TSCwHpCFbblQxjoRWHq69o76wd6/gkMqvdJCLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VGZxBA/f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VGZxBA/f"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49800c6a846so8101485e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787911292; x=1788516092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fyUgVdBXQPU4wNTO4VmSvvIoSyggZNmCxjmel6sHfN4=;
        b=VGZxBA/fVy4fwgUZL8CqMS+7zqHVsYiF1X97yKuNyEZZBmZWGVOImf9gmEgNI6YB0k
         gD4IKZL2ulkZRfi+lqLqKD4XVDHwPOuib41p2A9aB1GWGv5+EfMy1hOWn2+UBJqkIXBE
         z6BjtYVh6HdAnF1MiRa44ahI1W5C/FM0lTY6eNxE7q4Xk+pOBlZAIqJvPQIs6UtRWfKS
         WpHctSmAlTCnow9rbve1xUdKf3a1rmrIp/2DYhGFkNIDaxvjXkJoGG4asPWZsgDevtyn
         y0b4+Fp0axbM2Hpi+8RBjOIK0ZqeP2mCcXR7Zy7X9M3v94w4vjr2UXRbFkVymRa/x/gZ
         ai8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787911292; x=1788516092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fyUgVdBXQPU4wNTO4VmSvvIoSyggZNmCxjmel6sHfN4=;
        b=S/6/adBFLlWPAOqFYvOPiVCBlhvcwia6Oc51YNWTpWzAn4V8s8H71ZxgmbQhciHS1h
         UhNB1DecZiCkF3CfpIMPd3cr9Tq71wwnTB1uJR1WGKuxNg0FlB1v7JRkyYETQIqa1s4f
         wVd0YZhRDfPhlYZLrLTAT0gWj809IbqxKbnHV7nAOMweNu85sbiVLBMzwuqLv63XcTkv
         jbcr9m7Cg/XgSDUPtF87RW2Vhnek/g5z66sLlSpCH1Pvc37pcMKT7tkkiGrWKzVO8QcM
         6hV3NebBZRXrO2tHP1J8HJ77epcQoYdEli3ypr9hqN+DYnw6o7HlWSQY4t2Rb8hUeNAF
         Yzqw==
X-Forwarded-Encrypted: i=1; AHgh+RoLAqwS0rT4DpqU7ydd7eI6+X+Ly7sFFmpz16uHTUQJMxVNp01sN+/eiOCDUYSTbOXdgvdG8mGSFBHkBEA=@vger.kernel.org
X-Gm-Message-State: AFuF++m5o4XxpKedKwN9yNCRWvaKIANn4gHeDBSe4JyLLsn1K7ppV4ot
	C6r1gWzsaoMyyHsvVo4XDPDpV3x89nEGHVzxFiWYumCQXttWfTqlwFybuhpJZh4RdKw=
X-Gm-Gg: AR+sD12jhuCYsZp/FDvOQ5OIoauOcKd1pJlVjaeC70fViKMouxaurm/nfcL6eNXVQZI
	mteHp1lo94W+ChHbaEs57jLkd+JSvn0cELQzhcYw9i0G4mbIQKRzYFAbvs7teHvzfB/+zkWmQQu
	w+ai07IM2ANwWfXQSy8Km4YYtZrXCzXbVxZ1TgJbUDGvndJwpxKXYJzec1c9gnE3aBzXyE9dPnM
	Cs13Fi1UlYKtafE0ETfT9RDhtpDRux5wwtNKMBW6JKaT2tIMk7TqZiA+z6PwtjhX6PUew11Pw34
	lIsy/YmZmGbKQozzWnAymETmxS3WqrT31e8925eb1w3Z9m0/NCzkJSjQsloaf+M8d8VqLDRuKS6
	x8GI07x6PaZsS4dIt8MIyvyjIUp9zeAE2aaJnH0kaDQu412SOiGZayjOhGetGguboKYqnYMgZHk
	bp743pLgjLmLjG+5E9pjsYEpZrzabVr9X62XVOZmeuoei2EnyG+FmAAvUwoi2rCQYWfcUHp+lq
X-Received: by 2002:a05:600c:1f8f:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49b91c44ec6mr72112475e9.11.1787911291967;
        Fri, 28 Aug 2026 03:01:31 -0700 (PDT)
Received: from linux ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc103dsm36744475e9.1.2026.08.28.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:01:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: jthies@google.com
Cc: abhishekpandit@chromium.org,
	akuchynski@chromium.org,
	bleung@chromium.org,
	dmitry.baryshkov@oss.qualcomm.com,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Marco Crivellari <marco.crivellari@suse.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: allow retries of ucsi_resume_work
Date: Fri, 28 Aug 2026 12:01:20 +0200
Message-ID: <20260828100120.139648-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818205717.1492247-1-jthies@google.com>
References: <20260818205717.1492247-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

>+		if (++ucsi->resume_retries < 5) {
>+			queue_delayed_work(system_long_wq, &ucsi->resume_work,
>+					   msecs_to_jiffies(500));
>+			return;
>+		}

Just one thing about this (same applies to the other queue_delayed_work() calls).

queue_delayed_work() calls:

queue_delayed_work_on(WORK_CPU_UNBOUND,...)
    __queue_delayed_work(cpu, wq, dwork, delay)
        __queue_delayed_work(cpu,...)

That perform this check:

	if (likely(cpu == WORK_CPU_UNBOUND))
		add_timer_global(timer);
	else
		...

It means the timer used is global / unbound: when it fires it will enqueue
the work on the CPU where the timer is executed. The workqueue you're
using is per-CPU.

I guess locality is not needed for correctness here, because of that, so
you can replace that workqueue with system_dfl_long_wq. This is the
unbound version.

system_long_wq is scheduled for removal.

Thanks,

--

Marco Crivellari

SUSE Labs
