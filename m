Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794155015;
	b=I73KNpYpode3VvGJbTsikamv4URp9PrUYz4YB5mf69yVPGdgnjCblRzADe0zAbbifEwk
	 9mVqRaYzu2atgGj/SOLhOExZRgKnM92FXeqcceT56E2u69OqfUf+LcQV2BldpnOt9tkuE
	 PFHFVYJUejoQZgG2tYRQtriRCn3RZvtgSYqbO3/xj9kZbE+ZnzMUbLXbASTdMt+VV6Yfh
	 y1HRAQMsRVB890DTyMKrDp6csvq2lj0uwJAkTmQxFmS9nXImceMezpAo30Dwv0W++ghYr
	 Cis9Dg54NyjC+r1l+aS4Y3w+m4LhApINr+k8sv+0ycbtgUb/KNtXtfbYLOhn1TP0Fog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794155015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=l+jeaBV1F8PaU18cJisCNk8O0OmFxHipaZWtTUasJGI=;
	b=g6Xb0QeD/b8IKhUl2+vdS92yu8e8vvYGCJqmlK1mbkBF8EgFvqbCkbIiyz0EdkJOofVb
	 qolT+5ikfte9pdUr+VfI8/9vWC91fpfsuyqTz0lcG7XiGPqIUOQxAbLJELqUo2eukAuQ0
	 L9bjQ6IpqHmHZIxGOI5VeTdylcoEYZSdUwkPNLI4RcHktrgr3qn/sEdUotV8sPuExiEcX
	 EXOAhBf0yw1vofL3seZ3zAEKy0tBDX25H8MjF2lOdwUdKOWP7T9NL4Tzz8w0+sE4JPBwx
	 NaAbCAoadC1gaqf5WYqmc9T4k407L5rxWp/eFKOD+3kabbeXvtLCU6dzupDfp++vJqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OUFqK+OW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78782606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78782606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OUFqK+OW
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso156558a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:23:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794155014; cv=none;
        d=google.com; s=arc-20260327;
        b=oo1lcl/vnmhNDXjGLVkq0UlA6/5n0204YcNw3BNXw9te8J1E5PtLG+qIb1iaQqn38x
         FmO5L38OtOPKKdoJLETbq6YUeQUORhpoJJJyrEIy4GrYEaXFYx+Mz5mzXJhEfUUfn71c
         dMfRDUhys6FdyD2ViGcdTzZppe1BRR0ZTyC2RDh8wdlzHIQjdPjsZu4Y5Ie+9n/rXsRl
         tp1FNHOwxXK/3qbdz+RXFjrCd5KsksN+9jp77XQHkADS6czLnqWq9xjpm3OdzSU7BjVn
         P7+PjbFcNheINdfIctUxGqkAI5/TL29Ly3SEsvxmN6RjoBnEN7OTf3StUFNtsV/ycBqV
         1Wgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=l+jeaBV1F8PaU18cJisCNk8O0OmFxHipaZWtTUasJGI=;
        fh=PGOZUv/c5BvKN4RC2RpRtxioB1liOA5/JUeT7/wR05w=;
        b=pcHTbdLIJixc5ikW3F7N836/YgDNdx7t6nHzg4NiZOhWTw9gcJrhBPZJ+V7VJ5fdK3
         xlSo9C2LJE/74aGjXOD+LE4fqhRhaOWJcaeZzqMJsvpRpu6+Q7Zj60sF7KoMgKt3i6M5
         vu9U5xQt+GxrC78ORT+JoBkelBvudLzgEapiUSfeef25VdQNBvrU9/iLsMs5QphePpvN
         uczfzR5yF7sTl9DvaOCul/OPlauODXG1ZjfQu02CbieLwe+fvLr4PJAdiKD9w1J1J7dY
         E7dTKhIA/SlBO38YzXEJict07xYb+LJUM501Spdl94Zpq3rDSrss0IcGqQtRtqCydZRl
         ymjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794155014; x=1794759814; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+jeaBV1F8PaU18cJisCNk8O0OmFxHipaZWtTUasJGI=;
        b=OUFqK+OWA7ELEgPkf+8E4femfusnhKNmlqHf+d/h6bhYatGYebEWPpy/PvxcaoMcku
         hIVXl3iGhRGBQfu8nwZ/IQAc7RgK2M+uO5vBWzKLGxSC/d4OnUenrYwGBZM3RkthOChi
         s9Ca+KJQKwAonTBOWjoVxkT07RpeRMpmjNF1ZiVt4I+PBoknX2zZyJA1pzejDeShQaEc
         94OdqATBkeKtJrVT4cA5CHld7qJlU+FUEkIDfNiGSSKQgA0VfMFqadOBa2h351G25nrF
         InLVHKc+PU43ZTTpYshQkb67iBhkJ1ZnTqk+g0SPviVYuZ2ggjvWcr+HY/mKOJlu1Q8S
         9xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794155014; x=1794759814;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l+jeaBV1F8PaU18cJisCNk8O0OmFxHipaZWtTUasJGI=;
        b=twdM9NPybtonLvN9x0zm/eqdAhqSVi1Bo2w3snIQs6HNsBs2FeM5zFk+6JXhOBAY7A
         YW9X2KzE9VXMPorT5j6gTQk2YD9yWsVOGLeNHmtfhO2fnzSFCU+qiMtziC+19QtK0FcU
         liaIQ89Iax+gBkZmSnFzY2t3ZQyPNq35jbehr8FrD8uGRyTrl/dmvvejGqDDUenzLssr
         Y84uyomUmVFJf1sIzKq8gDRLGxmYEIbLH5STpNaen3HSIkeUDlyxy7yQh5ywchK+gwYn
         p2tZ1M7/Rp56aYzYp+tqdPr3GiNZoaTVAL6KyYrAJQFmzGpXmy1peZcl7fVXP91LRpE6
         wz0A==
X-Forwarded-Encrypted: i=1; AL+hErFamA1/RRuY7b9ZIbRj3nRPY28TfYuOMW7KRIFihJn7xntwFdk0I6IuSw54Lfhqks/MDoV8g6WGeVXEC+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8figaUS8T2bLOANS3C57xSL4/83m7CVodUscqAiEhcUjpMkYbJ
	1aLmGZpwlF1AWx/AzJXgR1jbzP3iokBHx2r/OQdDYHhukWCRKxIaL5pOMEIrQ2TjMjwDFR3z9LL
	/RLC28EFCQefEfzd7wWSBj524buWUcoqUij5uHmY=
X-Gm-Gg: AYBFou0bFYFiiNLTjABDLOhkL5jk4yFmfoZ0Bzoql6uWOte6jI68Sou8g/nOs2n9BjF
	aEUhNron4u/ZZAqszeaxakJlotP+l4k9BCrJMwFA+nITHWmaBMxjwH+m4dR/OfJItFkJEnzzXFd
	sDKhyTDmG9EbYf/UCFL9egdH9614y0o3N+aHattgDU9aZFmE9k8qoVIo3zbevIXZ28KerrCt05A
	VSylRilCRXpnlIlatKn37hzX9pPs/PoTUdWwYRW+ubSolscb8ROxjr8EPO78VrO1MvbgS9rWgl0
	cMPgyuqA83PONnrQLHZORP10BOx36qGMvdx7xRJ0nrH7klmmycFM8a7UdEYeU/j/zkjqgbQuxqJ
	CFmIk4xz4DgQPkqr3G/StTw1ydw+34v4vN+sLX2U=
X-Received: by 2002:a05:6402:5d5:b0:6b5:7d7b:8e9b with SMTP id
 4fb4d7f45d1cf-6b7224c2f0emr1191262a12.39.1794155013502; Sun, 08 Nov 2026
 08:23:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: l I <paleahn@gmail.com>
Date: Mon, 9 Nov 2026 01:23:23 +0900
X-Gm-Features: AclHuK9mdZuqrGW00y6ghnPOTpI98t3rq9gilErH6RQdBVw6SGfvsEJSSGJmvU0
Message-ID: <CALcE18MKy0KbTC=mb0ir-g7g_YaN5AzPS=9MELTW84tyw0JemQ@mail.gmail.com>
Subject: [BUG] sched/rt: RLIMIT_RTTIME not reset after blocking under SCHED_OTHER
To: peterz@infradead.org, mingo@redhat.com
Cc: rostedt@goodmis.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

The RLIMIT_RTTIME counter does not appear to reset when a task switches
from SCHED_FIFO to SCHED_OTHER and then blocks. Repeating this sequence
causes RT runtime to accumulate across sleeps, eventually triggering
SIGXCPU even though each RT execution interval is below the limit.

The reproducer below sets RLIMIT_RTTIME to 50 ms soft / 200 ms hard,
then repeats:
  - Run for 8 ms under SCHED_FIFO.
  - Switch to SCHED_OTHER.
  - Block in nanosleep() for 10 ms.

Expected: blocking sleep resets the RT runtime counter.
Actual: the process is terminated by SIGXCPU.

Reproduced on Ubuntu 7.0.0-38-generic (x86_64).
The missing reset also appears present by source inspection in the mainline.

Example:

#define _GNU_SOURCE
#include <sched.h>
#include <sys/resource.h>
#include <time.h>

static long long cpu_ns(void)
{
    struct timespec t;
    if (clock_gettime(CLOCK_THREAD_CPUTIME_ID, &t))
        return -1;
    return (long long)t.tv_sec * 1000000000 + t.tv_nsec;
}

int main(void)
{
    struct rlimit limit = {50000, 200000}; /* soft 50ms, hard 200ms */
    struct sched_param fifo = {.sched_priority = 1};
    struct sched_param normal = {.sched_priority = 0};

    if (setrlimit(RLIMIT_RTTIME, &limit))
        return 1;

    for (int i = 0; i < 80; i++) {
        if (sched_setscheduler(0, SCHED_FIFO, &fifo))
            return 1;

        long long start = cpu_ns(), now;
        if (start < 0)
            return 1;
        do {
            now = cpu_ns();
            if (now < 0)
                return 1;
        } while (now - start < 8000000); /* 8ms */

        if (sched_setscheduler(0, SCHED_OTHER, &normal))
            return 1;

        struct timespec sleep = {.tv_nsec = 10000000}; /* 10ms */
        /* RT runtime should reset on blocking sleep, even under SCHED_OTHER. */
        if (nanosleep(&sleep, 0))
            return 1;
    }
    return 0;
}



Best regards,
Geonwoo Ahn
