Received: from mail-qk2-f37.google.com (mail-qk2-f37.google.com [74.125.230.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5B232B12C
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791088334; cv=none; b=Xhu5ToGzMO2klQjE1KLd1PuUf9HACc++AYH6J76YLMsCQ3sx6DxbzupzUpRuSJK2WFqRZ5Jher56383M1aVjVQMY2GKgRPXdxA8YLqLyjV//vN+mM3VmMfdUqNQHpai7d0oWDp/G7WTJyb3gv/hseTk5LS6w85DxfE8mNwl/F2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791088334; c=relaxed/simple;
	bh=9erteH596wXutvyZZZYexewCpFU1dXOiHruQ4j7BF+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=syvcaZwC4mvF8DTp121NE/p0JoNdswjGW9AkMGlrd8TnPvLoygJOAJQ+hl8+hbaopwoKXzanIhq5jAj41gw405sTbZuwtXcypV9q7T8D1GGLka3OLhBzsQtSFr+rKI9g+MwJW91H4+yZK/IFnvd60rcWM4e9WG3pfVu1gIE1UKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tlf/3oHG; arc=none smtp.client-ip=74.125.230.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tlf/3oHG"
Received: by mail-qk2-f37.google.com with SMTP id d75a77b69052e-53514007236so6852511cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 21:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791088332; x=1791693132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RqM21WrlpOyZNVMgtLzt66M+0MPhsreG+St4PF2KtwM=;
        b=Tlf/3oHGC+2Mx2oK9bNIcvR90Q/AV4+yKVmPqJ+DY4YfexL8QMar/BvnqsNmn2pp6J
         FnfYtUcQgCxhegTYJttWXtxB+rZ8Fu67toV+8vc3XD+oT5ustTPpm9LdYcXo10cLfdtw
         Af5MsSiynCG8aXSvP5EZGCg6q3wiu3Gur5Ow6He5Zr4s9PjYRYnhsl9mJxwgz0+U/apx
         VKEBwGLzxQyY0r9H9KRrBPgH65jlfIcLrpz+bO175s82cPo5cPPd44kXDJyrLKzr8Cqc
         scldm/vsFWZ5LjUSsR/cXLN0OC/YDd6mqgSzOdvou7KDkXItKk+X/z3TCfLomBCecP2A
         KTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791088332; x=1791693132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqM21WrlpOyZNVMgtLzt66M+0MPhsreG+St4PF2KtwM=;
        b=Ty9TZhMboVQa5LCJrTjI7atTZ23EetX8rGyPZujnJVqw5XKbWmqF8EXV1L5uf59q3P
         Dug4+NyHgiwc4/B3BCYjPDnmIx+2YapZMLclRfkE5epylwOcMFQIj0sZ11DegD78ARgj
         AZzyuPnHhMj1kxZf+PV3asq9rNE9iOVFyDrj61oQDUjS1F3+Ws2q5srBuwWznUXD0InK
         5NKOxAPIVMVA3lWM5SZbaweAdLlFwOXggG9s3d3bPpm/q7CR3ahAhRU7sOFnPsXXaj7r
         0AM4qCRM17SAWuBa+5I7uZYDtRyHk2mJ6JWbH0LfE6/Xy3YHxFy8YP1yqYiXdJApcW3M
         H7yQ==
X-Gm-Message-State: AFuF++kCh7rH0vXb9unJLfG7SL8BDwmbxEkxI0lV5Zshncp6gnEKkQL3
	fbIp3HyvWP+z0YzQAZHRZDW+q1Zi4cTGyWrxpK1jt8UsF4JDdjcQ3i4=
X-Gm-Gg: AYBFou3pmqaNAeAZP5YEOsMVK2aWrj9LbIGZSoONk8ez+q/GE91/vsmBWjEdLT85qou
	xzwtT0ygPRGafRWJCmF9L8RnyO/kYsj9nye2UNQpTobZ5afYRW5oXVlsceaTpCCcBKIgQPbyfh4
	bniOQOTC+viO0Erlny7eKu/ALTBelF8Ih12FxYEk4tRAfblfkqnuVZTtMGqoOKA43OnGVOi3leH
	NTvMHDuy/O5GmzkuDq2oK3QO5FErn29BuEh9eimyGXKPfL+6oOVG7G77WTN8V9z1r5WgCXmILh3
	q04AA07JLGkqZggkG8CCDgfm598HNmRwRvMJJ3dPbilDtPi3tBKGODmN4NU0wFUgKglFS2eXwGk
	dbi+TAAUFU+n8mG9X11DvKBTJM6ZaDLxxUTYLjQb9lDB2t4s53LLW6ocCD0uZ3RQFqct8wZkZWD
	/s8fwWNkTtIZ7r8IzIPKZZn/Sc90LZ7iJtVUIb25ul0Vv+7jr8X775DMpmX04AKJdR0u1PQ08T5
	3T+2KpYKlj4x7kuKaVucWqnTInvmh5HTA0iQRA0pBtJ6hwVzq2e8IFCDUCUMCderp8Ha4+z2P+k
	W4zlkpK7Yy0+B6DQ9kOYzVT+ESS4
X-Received: by 2002:ac8:5d8b:0:b0:533:9607:f136 with SMTP id d75a77b69052e-533d96a6439mr126598771cf.25.1791088331728;
        Sat, 03 Oct 2026 21:32:11 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d59747sm67134111cf.31.2026.10.03.21.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 21:32:10 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: myungjoo.ham@samsung.com,
	cw00.choi@samsung.com
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ae878000@gmail.com
Subject: [PATCH] extcon: int3496: cancel ID work before releasing dependencies
Date: Sun,  4 Oct 2026 00:32:05 -0400
Message-ID: <20261004043205.1135625-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The managed delayed-work cancellation is registered before the GPIO,
regulator, and extcon resources used by the work. Devres can release
those resources while queued work still runs.

Register work cancellation after its dependencies but before the IRQ
that schedules it. Cleanup then frees the IRQ, cancels the work, and
releases the dependent resources.

The teardown ordering issue was found by static analysis.

Fixes: f94a5becabf4 ("extconn: Clean-up few drivers by using managed work init")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/extcon/extcon-intel-int3496.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index 7d16d5b7d58f..13c585d978f2 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -130,10 +130,6 @@ static int int3496_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data->dev = dev;
-	ret = devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
-	if (ret)
-		return ret;
-
 	data->gpio_usb_id =
 		devm_gpiod_get(dev, "id", GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
 	if (IS_ERR(data->gpio_usb_id)) {
@@ -169,6 +165,10 @@ static int int3496_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = devm_delayed_work_autocancel(dev, &data->work, int3496_do_usb_id);
+	if (ret)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, data->usb_id_irq,
 					NULL, int3496_thread_isr,
 					IRQF_SHARED | IRQF_ONESHOT |
