Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC91448E0
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317886; cv=none; b=k8bIkJh+TV8izXOxc7NL6cC737ObqyQnGJ0rHPw+sJUT9wO1M52027v3f1XlV/sotDMVEgXz0gaC9jmfIojHBpmX7AYM3b7byHZMmvodyNGpNA5AdkRhp3IrzGCT1XhPjyV7KZvPzS9KiqIewCOl4RRryzhn1DaxLuLUTZeuRLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317886; c=relaxed/simple;
	bh=grygU7FlCAJ3iLg1pvfJrxZJMYPcKaQUG9efCsSDnsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaByTayQkWxICA/64gGc18DhJkzAavmH/nKh/YxDy21y5qJYtYCTwZEsMtUiySUU1051Bna5y8mE0a/6kj0V1aO2Lp9sZ0pONxgw2ZagJGE2tYCdPKsuasVPfZl1OSQHVWHKhfTNXGODoXWwfz/aB2A1iJRsUPXGc5JzYhntifE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+GJTxuD; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+GJTxuD"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b69d00121so407896f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317882; x=1791922682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grygU7FlCAJ3iLg1pvfJrxZJMYPcKaQUG9efCsSDnsU=;
        b=I+GJTxuD/dZgc+tnVdvtOQQ/8l9jvsR5sVS7IQsTBJAKj8f+OKlVPIwOuyg3jMI2lb
         DXdmI3CG+fTUtxS1S8r49r250nkpGqO7gBPTqCGTh7dTgC6rs5URyJxgiDzwkF1eO73y
         aKXBqnQ0r4m0ZCIVflPjSSSo9nvosD5OIpOFT0UYUBkRzX7iMJxTOYV85sh7IC4tl8wi
         qXqWJ4OmSGCaqb+xJXcQQjMDNgIF8NSWXUhGL4lab8MfD1H6gT6f2TYsMC+e6FnHbWUs
         FwPtzA8uwMqyN2T5e7ngRDK+fxpl0vEHoyQeUQtuf2Z3gVmL2fMUAJApYz2+/etIPcXt
         5iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317882; x=1791922682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grygU7FlCAJ3iLg1pvfJrxZJMYPcKaQUG9efCsSDnsU=;
        b=wpLDw0x2RfPt4sC1C0IL3rKkcWfnZ9gMpLAxDXbZ+Uw6U083ohnHooU+MIiifFOS2T
         Tte1r4qjlA8Q9LQiZyJM0/GUz1lgY0WYauWOtk/Z+50Y9xa1ntgRZE+XE27B/KX3JOYz
         dpHRrmJXJIvxARn2d/7yQNtvjae8iu/a/9OPgp7vgX/90xwKWVPPBUYiL4mqTWTd9+mR
         /djpltr4EUfqvZagxZWYqqQjt24FRu1xXn0eQvsYfz9tR7DFeGoC9XSd4fqP0/NDN/Mt
         7VTL1ZFL5t8iSnzhHlMntLzX9y+lX1Vkc5Cl95YBvto17tJLkJ+HGLnWLBa1o9fYXw56
         y+oA==
X-Forwarded-Encrypted: i=1; AKwUvBx7hmspCvf32bTIpX8ZYasbBNbePdVHPhmzUBVjOriJv6IHIGimi8BSiYd+IJkPq1QbyKqLqWCAF724jdg=@vger.kernel.org
X-Gm-Message-State: AFuF++mU9nL42BY16MAjK41p1zY4+9myqqUPc9Z/onrro2EPVJlV9Jbk
	Hva8Auj7TuaLjdYnpUeZfVD/hD8V9CwWfX7u9uu2SujrJ/+NGOLbwZOj
X-Gm-Gg: AYBFou1iUNMe7NuJSPu1VLJmwN+4JXKpp5tiJQZHPkJ9WSt8Y+Zn6SAo/7bGNnFaTJN
	TVoH96C3sGEaVVH3E1Y3wsqfs+ihYfnVswLTM0qwCPRkA0fD2RvmEG59+VYG4n2joF8HLW4f5XT
	mMkva6ZXvbZnr59+Xp9QP4/V6OpwyIMqnwZrJz/wcZ1vR5IYmqvFJl/FYHTHxLpFynpenyQId2/
	zc+Zglx2AmrOwBjt1sxjVSgDpNLnCSh6jX4hY+Hi0Vm0LO5xIuWshIkYsY5lJcc4tseeHfDN9u1
	VNyBjqNwR4k+I0wU7DwSg6zZU4gEOWxjLlaCmP6/v+ck1HP8fZ4i6IRMiSJwCtt0o0Qp/v4uWMH
	mgymRTzaeSAiI7UZCXbpeuS6IORq+BC49oiwxcR4LBhUXKZVHhpiaALQmW8UuwgckcZj5cY2/Iq
	8UAALe7XoeGia2C8xQW6k4TQftkkx3w+rYNKqwwjyi9woA050AZKv4rWST7hEnNXdTfYhF9wCG3
	VKDc/+b3R4thPhPramR+PDzfi9HRFfd2bBinfyEO2SU7HKPIZDEyY8WYDvEY1FRgA==
X-Received: by 2002:a05:600c:524f:b0:4a0:1973:f05a with SMTP id 5b1f17b1804b1-4a1802e92aemr128075e9.2.1791317881623;
        Tue, 06 Oct 2026 13:18:01 -0700 (PDT)
Received: from localhost.localdomain ([194.36.104.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f795f29sm9366805e9.11.2026.10.06.13.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:18:01 -0700 (PDT)
From: Iaroslav Voitovych <yaroslav.voytovych@gmail.com>
To: benquike@gmail.com
Cc: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	lee@kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: MGMT: fix mesh_tx leak on hci_cmd_sync_queue() failure
Date: Tue,  6 Oct 2026 22:18:00 +0200
Message-ID: <20261006201800.3597400-1-yaroslav.voytovych@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260919115436.3998954-1-benquike@gmail.com>
References: <20260919115436.3998954-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hui,

I reproduced the leak and confirmed that your patch fixes it in the
tested cases. I applied the patch as posted on top of bluetooth-next
036d4119079a and compared it against a control kernel built from the
same revision without the patch, in QEMU (BlueZ test-runner, emulated
controller, KASAN and lockdep), with legacy and extended advertising.

The leak is reachable without fault injection: with LE and the mesh
experimental feature enabled, a Mesh Send while the adapter is powered
off reaches hci_cmd_sync_queue(), which returns -ENETDOWN after the
kernel has assigned the request a handle. I also made that call
return -ENOMEM using failslab.

In both cases, without the patch the failed handle stays listed in
Read Mesh Features. When the next transmission ends (in the
powered-off case, after powering the adapter back on and sending
again), a Mesh Packet Complete is reported for the failed handle, and
the next request's packet is started on the controller twice.

The leaked entries also count against MESH_HANDLES_MAX. After three
consecutive failures, three handles stay outstanding and subsequent
Mesh Sends from that socket are answered Busy. In the powered-off
case, once the adapter is powered on, a send from another socket
causes the first leaked handle to be completed without ever being
started, and the other two failed requests to be started on the
controller, although their Mesh Sends had been answered Failed.

With the patch, in all tested scenarios no failed handle is listed,
completed or started, each accepted send is started on the controller
and completed once, and repeated failures leave no outstanding
handles. The powered-off reproducer gives the same control-vs-patched
result on a 4-CPU guest.

Separately, with both kernels rebuilt with CONFIG_DEBUG_KMEMLEAK,
kmemleak reports leaked allocations from mgmt_mesh_add() on the
unpatched build only, for -ENETDOWN, -ENOMEM and -ENODEV, when scanned
after the test program had closed its socket, removed the controller
and exited. The leaked entry keeps the MGMT socket referenced, so
closing the socket does not release it. It also stays leaked after
the controller is removed, although the commit message says either
should release it. The -ENODEV case needed a
test-only delay in mesh_send(), added to diagnostic builds of both
kernels, so that the controller could be removed while the Mesh Send
was in progress.

No KASAN, lockdep or WARNING reports. BlueZ's unmodified mgmt-tester
passes 503/503 on both kernels; mesh-tester gives 8/10 on both, with
the same two "Mesh - Send cancel" cases timing out.

Reproducer, kernel configs and logs:
https://github.com/ivoitovych/qca9377-bt-hang/tree/ccfc358e2cd866948aea3ec81bfabd5298e30618/retest/mesh-tx-leak

Tested-by: Iaroslav Voitovych <yaroslav.voytovych@gmail.com>
