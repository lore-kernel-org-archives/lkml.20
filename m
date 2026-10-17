Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F571419FDC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792222661; cv=none; b=sCAWQtndgi1VwNrvzut8HHGFuZ8CEaxTF9u6Tuog5QwtAnfYea+uRdrMYuKNrhUfrVtpt/Sk0E01W1NsGsiHNfek9tP8Awsuahp6B8+HITDAWu+E0TrnUtPQ3h8/0PWNykyxzwyKx1QQLyObAFu9gB+jhXHWtjQFvmkCvTmUqf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792222661; c=relaxed/simple;
	bh=WZdjCu0rAOvAKnFgRIUfmcDKEMo+oJUKqwWbSnvz7ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Se+Rq2vY2fPXK9U6TcO4fmzgZJwKslkPlWqEbBzusuULBRHv/9zrLV88rcbMWsHtHqG2zbcvlamancDPwe8NRh72QczNg5R0c23HW9R5VbZ99+sS8grTYjJUCgXQfF7TLcv0cT9zMRazVRkCZlzLHeeV0Sw5yMDgCpj/Z7AoxOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOvjj9ZU; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOvjj9ZU"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-354ba08cfd1so881921eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792222659; x=1792827459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFRuAeszDrkm1yI3pZR0D3+csEi+yPWQc7sruL4+TM0=;
        b=hOvjj9ZUOBl1OpOIHZxp7TmlR6/uI2J6U2iLSOijCaukVGLryBsNrGY53gfk64dPjw
         sI71Qhim/L3SZuQaxcaVq/dJvTtEvohquQ1rHKRXRa4zxkBWOHqFh+C455Vm0VMZs2Fk
         nILpTUPb64X2cIRJW8UFQzsSB9hSkbsTDFt5KfzuyjhY9SNnqKSAh2clDLxg385BwSGl
         gc4+rIDFynm4NuQAQB1ZN+F5mS3yi8vOZu5BfeL2p72wjzUAhVvIgzwZ7tM1hyFIOWa8
         +Zrj97h/tXZw4V/MvxWUJqKmbd3ExsG0uwXXkJwSPPq9wWJyOy+kPOfhhr3n92gy/Azp
         Uy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792222659; x=1792827459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AFRuAeszDrkm1yI3pZR0D3+csEi+yPWQc7sruL4+TM0=;
        b=NOAfBzRvPkL6/1imsqX4/ZOsdBWxX2bs0hWeRBq8833chzNSy51m6iHXnSJug9eHlY
         HfbIlQ1pLad5BOOYXnLEjbmeMxA9o/HyXnygBm0I8Cl7pC0GznMxt8ox0qRoj73RnKJq
         Uu2bLrIIS1cXw8J0AhZ98X7SWmFs14wRftq9u4BPUq1Bq1SUOzzAG2PTpC50/ZmZXgzu
         K257yfmecbciXfd7zSjQXxK5ZRuXeZH6NM4BCKdRTw1yx5HstveV7zCNohD0ZwcZ0UTk
         yXHvcJ0c3NMmQpIu/53RtWN4E/VtkYt8fb30syj148Wx6arvc9Ky4MSHry8k0PyIHzJn
         yI4w==
X-Forwarded-Encrypted: i=1; AKwUvBwScjHksRgjegsxhvO8OEJTGhYw4cdCJzJOnHCPpzfXleHwfjTjQI7sUiYDtXqKLK5eP4+AhXA2PJ9xX60=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr9R0xedD9dBaSCZAOu6drS1WfgtputjSCrg+SximSi6QWjs6w
	rt3P362Zz3xLi3/XawC8umS26rd2cYWQcpxu7iWcA9XTQ2R/8Fr2k6Jp
X-Gm-Gg: AYBFou0xDkGzlCgXdlKceIw7Rtg7AR3JuAOaWisHgbcKeZ+Vy1qPhDt17Q54CFSWK/h
	oGbMok8hxHZJ1iL4ZJZZvmHRZsaGp1vfrFUARF/w/s21Dnx1h2JRW1O1m60xEkBkv/OCPlkUm/e
	9HobMrHVWyEabOjU5IwGCvBRggekowrjjpBSu4GSvDQkJttfo4yxkHU2hZ4a8sN8UkyNoV7KcSF
	UhgpEmKFSBEv/RS4E3qXIvqg5dJOFgeI0BxqNcvNnM4Tg4a0mkJ6fj8vFCloUa0ntpdltBSFnHK
	oUEIk+x6CUoW8cP/2WC+TLST1zIrAyQQJbkpgKHq6eCosTdNj/K6Id8hBm83Z8iL8tMUBy1AN0v
	1tYlt1qWoBK/6RkmDn2g10I7EZyQ5cx6zJllCFQIXS6kx5FkdPac3JrZZtK151TUVHyUfOMWyPx
	HhVWgwwjHyeS+GrU7ZaMSZ9d8wdY9sjSfL4TlwkehWYaRjLB4s9XtR/rEtbq2vitU4VtQ8kFncM
	k+plG/D0a0MoC1Qybew9+VR5lh7UB5QnqSC
X-Received: by 2002:a05:7300:10d:b0:361:306f:c32a with SMTP id 5a478bee46e88-361a0e869c7mr2944000eec.11.1792222659389;
        Sat, 17 Oct 2026 00:37:39 -0700 (PDT)
Received: from chitransh.. ([106.202.98.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm15999208eec.3.2026.10.17.00.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:37:38 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v4 0/2] platform/x86: dell-uart-backlight: handle stray EC byte in responses
Date: Sat, 17 Oct 2026 13:07:02 +0530
Message-ID: <20261017073704.606497-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell All-in-One machines the EC sporadically inserts a spurious
byte after the command echo in UART backlight response frames.  This
causes a checksum mismatch and the driver returns -EIO to userspace.

Patch 1 is a preparatory refactor: extract the byte-level response
parsing into a dedicated dell_uart_bl_receive_data() helper with no
functional change.

Patch 2 adds single-attempt stray-byte recovery inside that helper.
When a checksum mismatch occurs on a frame longer than the minimum
size, the suspect byte is dropped, the buffer is shifted down, and
status remains -EBUSY so serdev re-delivers the real checksum byte
naturally.

Tested on Dell OptiPlex AIO 7410 65W (board 0TKWC4) where the EC
inserts a stray byte on every get-brightness response.

v3 -> v4:
  - Perform resync inside dell_uart_bl_receive_data() rather than in
    the wrapper; status stays -EBUSY so serdev re-delivers the
    checksum byte without additional handling in the caller

v2 -> v3:
  - Guard resync with resp_idx == resp_len to prevent memmove on a
    truncated or out-of-range length field

v1 -> v2:
  - Extract dell_uart_bl_receive_data() helper instead of using a
    for-loop with a pass counter
  - Split into two patches: refactor then feature

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data()
    helper
  platform/x86: dell-uart-backlight: recover from stray EC response byte

 .../platform/x86/dell/dell-uart-backlight.c   | 52 +++++++++++++------
 1 file changed, 37 insertions(+), 15 deletions(-)

-- 
2.43.0

