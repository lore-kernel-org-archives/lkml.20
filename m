Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684440;
	b=dfGRFy5b0lihgigRWwA/let5z9iG0sVpz1c2I+ckpQA6Ss/PsolTzDlXqUQQ6nRfYo9F
	 bA6xTnLvAn2dQhtLCA3HIRg1hCAb70HyaWcS4kyHNNVY73UR5izsDz7SeXNzbk7m4B5+S
	 fnF7AHzUgTNIbSMyIeOV5uQV96jICxH4feNEm2tLchjgHYlsBb1e2Er3HQ8KKXL24K3x5
	 T70D0KUIGNawMZQag0hAuEliVQdYPppMHhf+6AL/pyBCL3+13yaBxr6EFmrYEhwd83/4O
	 Hvni6iOvpFpapffjbxs6k96zbjaHfCYI300HW4ao0cpfWr98Y9f+KmwqnK05GSQ0iCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=FfwESk2+W5GLOfREmJ4jIQRgAZiuRjaWD2FZlMqIe78=;
	b=3eMwcnqRYnE0fWVzE+Ap8TVK7vtsq/B7IoHnXj7bAUtprlsQzA2yECl3U361l8F+q4Sb
	 jvwMDVCNA3WHaaypztyCRVTQScxbaXtNWGs/t/DzybqdrXbTCll+YOBT5vWT4dQadwjoC
	 dhhsM3BdFCHYLEZ24O/Fx3mAmE2B11Uo4TAMXM4GavOzUpi0V92CB0WJ5jeMpGqL18Qcu
	 hlD4V97NOuFXPuUPXqgm5Isn+i9AwI2hBETNA/jNMuE1Y045webmLxBOnrxz9uh7ECocM
	 FUg6DUdrdsCP+43tbThSrYW/una8cj9Uq4bIHGWPbIG8eJBwSh2+FNFTAoDl4EC039w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rDMMaPPW;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E60606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=rDMMaPPW
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso3399907a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792684439; x=1793289239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfwESk2+W5GLOfREmJ4jIQRgAZiuRjaWD2FZlMqIe78=;
        b=rDMMaPPW90DTMQi9NJX0sguLIdDumDTL6hrvbR16ROZWSeukVKj0a9uWMfSa6oxBTC
         pyzoOphzHnqpVFZ5x9Pc3wwEvv39dLySj9lWln1C+mzTrQrLjeOb9yTNw7y1n5sgm+6w
         w4lSEHWqOMsVWrIEwguLdB7YUPuAl3zdHOzJMMAD6+c2lxoiB17SrfKDHk9778zz38dE
         3hdIRI12kMBVuggOzcTUU4XhXV3Ubr5ocOdGzxC9WN9oxOIUFDmrIDireYQm7PnsK3PL
         Y7Gou8MxQoxVLeWQWI9yTbFWgGvIQTTaL3KnC5K4pQ3jYCtkKWArZyKFMqqOYNcX9Ypj
         Qy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684439; x=1793289239;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfwESk2+W5GLOfREmJ4jIQRgAZiuRjaWD2FZlMqIe78=;
        b=oWPgaSxaNgKRKF9jlAsXSyUtngi0yyDafWyxnt+kg7SiDXnV+WWxjG181bj9T4YDdx
         quhWNap/6Rqp7/7zie9LDbo8ZTNZNxIQT1y4/4zx6ar9NX1dQ4VqWoF944JoreN5f25T
         Mh6uyh/ufd/5+EVmsqFTuHmKBI14GZWxZQWk5v9zB0DdYLcwFHDXdF1+GzqelRYGLsZq
         dfcvGtYx8PdjZ3CG5hUD7O1dvIL3+KBthHXqBc4b7+P9pKQfJTTNuRujfDJdOODvldmX
         VToGjXNhtOEuvfDyEyMpcN6+VJvreTzJN8/7NShaBQv6J1jqOHT60wH/o+XO2tQX5CTP
         Y3Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxu6YYZTQqeFLMlvcL+6X5CHduZg5zdf81Ylw1R5v6HIMqlwY/knATfBiUarWmsJCpOX/DrHiqTBI1SM+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLqSM6lGmGi6W0ced1C/QOIh7Xk9BzwskM6+xnMYswB3N5pSPz
	irGmYnM0DI5vlkMbiZ2z2YsFWcr1Mt1e8wKvbIc+4h4hFA/PHrz+HtkSl6m9regXSY7jdfvfnKI
	QhKTgMENRtw==
X-Received: from plti3.prod.google.com ([2002:a17:902:6ac3:b0:2e5:e061:9f9f])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:258b:b0:3a4:f8da:2478
 with SMTP id 98e67ed59e1d1-3ad86f3c4b6mr4324356a91.29.1792684439331; Thu, 22
 Oct 2026 08:53:59 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:53:33 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022155352.1293020-1-wfelipe@google.com>
Subject: [PATCH 0/3] workqueue: expose per-workqueue stats in debugfs
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wilson Felipe Pereira <wfelipe@google.com>, 
	Shuhao Tan <tanshuhao@google.com>
Content-Type: text/plain; charset="UTF-8"

struct pool_workqueue already tracks runtime counters in pwq->stats[],
pwq->total_in_flight, and pwq->nr_active, but reading them currently
requires tools/workqueue/wq_monitor.py with drgn and kernel DWARF
debuginfo.

This series:
- Preserves pwq->stats[] in wq->retired_stats[] when unbound pwqs are
  released so cumulative per-workqueue counters do not go backwards.
- Exposes per-workqueue stats via /sys/kernel/debug/workqueue/stats so
  they can be read directly on systems without drgn or debuginfo.
- Updates wq_monitor.py to include wq->retired_stats[] and report a
  'queued' column alongside 'infl'.

Wilson Felipe Pereira (3):
  workqueue: preserve pwq->stats[] when unbound pwqs are released
  workqueue: expose per-workqueue stats in debugfs
  tools/workqueue: report queued items and retired stats in
    wq_monitor.py

 Documentation/core-api/workqueue.rst |  47 +++++++-----
 kernel/workqueue.c                   | 105 +++++++++++++++++++++++++++
 tools/workqueue/wq_monitor.py        |  24 +++++-
 3 files changed, 155 insertions(+), 21 deletions(-)

-- 
2.56.0.218.g1ec904b173-goog

