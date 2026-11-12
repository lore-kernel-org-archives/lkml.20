Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.213
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794452469;
	b=qhcBlgFmIUTsEeSukcttjhYeqF8gOl0D2/m9SmdK64gjldZEPcGKSJiuLn+xicNIGW0V
	 67bg2vd5mw+eLnbu/5dVXKAKZh3ZkRqKd4naI6A0fRGMDNIoNMy0oaD0ps0A28nXZLsm0
	 IvwsDY54o33b72BrdTY0nMF5Wm1ft8/5pWz0o/hPVMAgGDuAAQjtLKwJwNYmhEDo7phY+
	 MYlOfP3ik3nlKNtSYIEjwClyxGWbh7eHIpWL9BVwusO5VeqT6o+BjhA2gBnwK1kwbd0w0
	 z/UhoOcusATqs7eCfJjGUfEl8uDTdUKpkrUxltKAU8SiS3Jt9fM6lRIeifTEyMECNVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794452469;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=O5nA+1q2Ly7KhI+4W5hR1wKCh5D14tqesJy35vJZ96Q=;
	b=qssHFfjeUeweTDJSrm4tfM1W/reEPc+r8I1gVDvcnKveRDH2EETU2Hxl4eUzbnwCwXp6
	 zReVtD7Oz3DeELUhEpgWJSntaqWGHloPzcFX1OYgGpER0LMmteP49OiS8tDJEKdiOYppa
	 NPhTm4/AVZQXHBwdvXbhLkTrq4Os6BSdiTeZTbrNCRDQ11d6n2sNJxhDDme+qagClDrsv
	 kt6I0lcqJs2U0ZHa4MLc3O7dMjvifIwJNRXHrWJVYjYDJA009FawRN7OuTXTLjZBKQ6Ed
	 XK25NzHfq4Jm9nOyiWCi8XTUXdBCia+yVCXnRMLjpdIQJCualf+2/No3Ix9YNLd9GzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n3+AZmDG;
	arc=none smtp.remote-ip=91.218.175.213
Received: from mta0.migadu.com (out-213.mta0.migadu.com [91.218.175.213])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8430E606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:01:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8430E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n3+AZmDG
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xQOp8E3Q1twQQOr51+f1UmfFBIcTlFk6WwjvK1VznqY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794452466; v=1; x=1795057266;
 b=n3+AZmDGrPe9wqCDjY2sfFAF8k4F15byuD2zxgVOoRDjUEYA17IrTLrSqFQ8ihwwtCQ5IN8l
 CMurPCIVadZWv7NcSy7CW1g9gtA5q3fVEP07dKjClWxt4qnmFAyzEERapYYjiJviY69hUOS/9X1
 ql80AXKd2vFTPbfYlHn9nldY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c51555cf0ba76343;
	Thu, 12 Nov 2026 03:01:06 +0000
X-Mizu-Trace-ID: c51555cf0ba76343
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH 0/2] block: make rewriting the current I/O scheduler cheap
 again
Date: Wed, 11 Nov 2026 22:00:57 -0500
Message-Id: <20261111-bug-block-elevator-unchanged-v1-0-583198bd4e21@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOkr9WoC/yWMQQqEMAwAvyI5b8BWqOJXxENtogallVZFEP9uc
 ec2MMwNiaNwgra4IfIpSYLPon4FuNn6iVEoO+hSG5XB4ZhwWINbkFc+7R4iHv6fElrjSFNtFFU
 N5MUWeZTr23f987xKlWWZbgAAAA==
To: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>, 
 Ming Lei <tom.leiming@gmail.com>, Nilay Shroff <nilay@linux.ibm.com>, 
 Hannes Reinecke <hare@suse.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

Writing the scheduler a queue already uses to queue/scheduler takes
about 10 ms and freezes the queue, which stalls I/O on live disks every
time a udev rule or tuning tool sets the scheduler unconditionally.

Patch 1 stops requesting a "none-iosched" module on every write of
"none". Patch 2 returns before freezing the queue when the elevator
wouldn't change.

On a null_blk disk (median of 20 writes, all kernels measured in the
same run):

  operation                   base (ms)  patch 1 (ms)  patch 1+2 (ms)
  none -> none                    13.09          9.06            0.08
  mq-deadline -> mq-deadline       9.19          9.14            0.08
  mq-deadline -> none             12.00          7.96            7.97

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
Qiliang Yuan (2):
      block: don't request a module for the none elevator
      block: return early when the elevator doesn't change

 block/elevator.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)
---
base-commit: 79eb6679ef6a0d5ea68da53a8321fb1dc72299b9
change-id: 20261111-bug-block-elevator-unchanged-a6cd2d761d38

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

