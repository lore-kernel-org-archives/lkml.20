Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777E4409623
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414617; cv=none; b=RUdeFnLyLTB1QfzOaNWPW3CdJLbWa6FqH+p3WZxJvRKDCM92pYLaN+WGai+PxPrxXOtcaO3ribojPe8HRuoKagnFBZzr+1kW9+Fj7fjkpdkSixx85F8yj6TZ1mrCvvIfCWk1Tu6dElgPl0gmddd1zDWn2LTi80Z79Rx43jWsLkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414617; c=relaxed/simple;
	bh=V+hQCe8wq71h7sYDfEQ0xdrVW9SKws0wJ1GVDHpJzKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1VEpNyWb5y3NE3lwYKrXIdhV0xsndWWlLzO7ruk4gojI+kD/4cNRF+uNo9eOio9uRUmhanC9U6qslpHQn54yayEST3f+WzJiPo7/wXidpcvTYI4tQZu8kaumxoTkH8kpOnEBMKF+0EPG3cygai2ILqRiNX+5gqCm0ZJBY20ayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McrAUsEE; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McrAUsEE"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-157fe9d771bso644552c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414615; x=1793019415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhYB8OWrSiu0aZgB/NBRTuM36QWQSaDbi30LsYAq7Sk=;
        b=McrAUsEEZsjE1h+1TSURutzqrPb1Nxu0xCJX0yX43mGeooWfBnwyADj1yZ95O291ei
         s53s9Zj1h3pCwY6GNvWwlGdOfJKwpBT1gXX4I0uSJWgysPaUILN3UfzlbHjofHdMi+Np
         v+sn6WLtturBMcfApi59CtfF0x3Vi+gQXt10Fem7aG52nVDNIpQrQ8LfibZLLwtK24su
         jmLW5SA5uovE1n3rfIKVOOYRxHBtalxYGjxg1Sl+Rmhrn/kEc18iwS04bv2aFFK+pKJx
         IRTBaTui9Dtrb5bqNkQBrEdYX7fnMCgpVklQWWn4suvZZb9t7NE4YHiTc1Q2Wk1hMi8+
         kp/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414615; x=1793019415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhYB8OWrSiu0aZgB/NBRTuM36QWQSaDbi30LsYAq7Sk=;
        b=0lp3csNAKpzJDwBktC99aGfy/cOER9d6KiUAtmkH6Ac29lP3MLrr/imMxohBeImJ2c
         wYqdQzT5J9zMyd/gEmxtKkZ8VjLsiug7up97sjf/FqpYgaEJ7IjdXpGgTkuSqWtkkuKg
         gOJDR2p6gq8bUafi3VOWix+AH7k/nNgnozRVV1PkbWU/HYFLJ3DDnEfYYFaewacTCzGF
         wcxfXMwS3tDwn5LKocz7oIIGtey93Fh2qOgPh0Yi4gje8CfUfZCnJIDEhqts8qVzqop3
         5NP5i/BduRuRIMrcAsX6EUqnRuG39ODcCQF0v5n0uhzd6tHRx1InC9iV4cTAr/0YSV4d
         S3yA==
X-Forwarded-Encrypted: i=1; AKwUvByk5HbeHXHaM9qpj/YwVia/xnRHcwr97PyzEzdoMh60pxTUElUThGhXP4dvVyJfT/OXpLDKa+zOEn6wnjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ2egBBzYvYAidToxKlT+U/b7ldrSFP9MRPiy7c0jdDbU163hL
	gqYvd9EII++4WVwsKY3sFE+VPxr5U7c/u/6wlRxU1p8AnIDEYenud6ec
X-Gm-Gg: AYBFou1HFpzxIp81ipmWNaNp24Ngsh8Wx5e+55LhxtuU1kq1XE3fU2wKJiAg3nrjhOH
	Q5fzizCdDpm/eG5X8/7kT3G8WRD3uC2a+8tv4cSFGl9BUV6svua+x3lyHJE5J3e60Hhouyhut1B
	xnNYeDS632jEyULIGctR30ScOFQADQTdogSurRFlBxLdJbC0EDbRhxOZSa8v2mmoqs1Z03GoV0q
	ij+pk9QSREwhmEcH91Cvr4iz/8ZxFKWEfxUHjxN5XLmsIBs9CDNQugeQHcpGXOl0pxWacPb/Zms
	Y0BvKeGb3V1Hy521n87Rk8CZS9oT8n47pOTdjS8iQeR3xftbZrZB9K/PjP7fDFA24yXgT14bwTR
	yKbCLu0W7TIk8sRlFjX4eFsrNdDobA4QWxA40B2vNmfFk4LdamriTyrKFuoTLr7b06/GhLdJQEF
	pFHW1S3ZLSOe1WNgMULduRsWHM5etzYdj6Syi/AVsc1k+gxcI044FAUa6Uscpmu8To2mwPWw==
X-Received: by 2002:a05:7022:e805:b0:163:c5eb:d42f with SMTP id a92af1059eb24-1850c223261mr12318990c88.5.1792414615120;
        Mon, 19 Oct 2026 05:56:55 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac1:7a80:50::3cf:67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831ba424a6sm28830212c88.17.2026.10.19.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:56:54 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: [PATCH v3] greybus: operation: close the race between completion and arming the timer
Date: Mon, 19 Oct 2026 19:56:49 +0700
Message-ID: <20261019125649.20657-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <atXCd0ywMCTDi_5J@hovoldconsulting.com>
References: <atXCd0ywMCTDi_5J@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_operation_request_send() sends the request message and only then arms
the operation timer. The host driver can complete the operation before
add_timer() runs, e.g. when the transfer fails right away. The completion
work then calls timer_delete_sync() on a timer that is not armed yet,
the synchronous caller returns and drops the last reference, and the
operation is freed while the timer is pending:

  ODEBUG: free active (active state 0) object type: timer_list
          hint: gb_operation_timeout+0x0/0xc0
  WARNING: lib/debugobjects.c:629 at debug_print_object+0x198/0x2b0
   kmem_cache_free+0xfd/0x6d0
   gb_operation_sync_timeout+0x1c7/0x270
   gb_svc_process_deferred_request+0x5f3/0x1150

Keep sending the request first, so a request that is cancelled or times
out is always one that has been submitted. Instead, hold an extra
reference until the timer is armed, and delete the timer again if the
operation has completed by then, since the completion work could not
have seen it.

Fixes: dbec27298b0d ("staging: greybus: operation: add generic timeout support")
Cc: stable@vger.kernel.org
Reported-by: syzbot+a2e50fb40695811c2dab@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Changes in v3 (after Johan's review):
- Do not reorder send and add_timer, so a cancelled or timed-out request
  has always been submitted. Hold an extra reference until the timer is
  armed and delete the timer if the operation already completed.
- Retested with the syzbot C reproducer in QEMU (DEBUG_OBJECTS_TIMERS):
  5 ODEBUG warnings per run before, none in 3/3 runs after.
- v1/v2 armed the timer before sending the message and are dropped.

 drivers/greybus/operation.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..f3a65e693133 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -766,18 +766,28 @@ int gb_operation_request_send(struct gb_operation *operation,
 	if (ret)
 		goto err_put;
 
+	/* The completion can drop the other references before the timer is armed. */
+	gb_operation_get(operation);
+
 	ret = gb_message_send(operation->request, gfp);
 	if (ret)
-		goto err_put_active;
+		goto err_put_send;
 
 	if (timeout) {
 		operation->timer.expires = jiffies + msecs_to_jiffies(timeout);
 		add_timer(&operation->timer);
+
+		/* A completion that already ran did not see the timer. */
+		smp_mb();
+		if (READ_ONCE(operation->errno) != -EINPROGRESS)
+			timer_delete_sync(&operation->timer);
 	}
+	gb_operation_put(operation);
 
 	return 0;
 
-err_put_active:
+err_put_send:
+	gb_operation_put(operation);
 	gb_operation_put_active(operation);
 err_put:
 	gb_operation_put(operation);
-- 
2.43.0

