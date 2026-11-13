Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555410;
	b=e/xProyY3MGrEbwMJq3qFIcUxbmQvs0ARSSNMU11fiuDRzWvTdNAavnRQmUIbzO1ug4t
	 +DgVekOM607QwyljcsPHrDCVHuA655sXzytoffh/5cl7ymMVxSYDoPKv2CMRNfBjmjTrx
	 2kAwJ+h11/b120dxCQPJHekIB8+4TCo+Dh8zd6REl3anq4yRCVNIIgYjLWpjG9NR7uCnN
	 piyWarrJi1uB99sd2jJfScZdI+0kwHwrxtixWh9R8Ee1VZ0znbCi0r2q8fzs13V8yIstd
	 /tn8M9dL+e62bEERBLuYYEYxUcrcmD3EUojjYgO2698WT7WYPiGCsa9CRZMhYUVm76Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555410;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kvL7LISW/1hXrYXeyGM8qT4qenPvB8Dmix98oXakbm4=;
	b=KKwGNvWGRDdlqXIao27BpmcvBwB3KkSwC1YZp35mpOqX7dDUg7W4uPs9p85vcxecDz97
	 +MjVxLcRxV19UyGt4HAtNaDiCnTH9V50KI1kPKMKoul2mzvDQ3IaToJnRWltaqcqdyqI7
	 jEx9dxMONY0GqiRDD0FK7ximlzAwmu7Kfnuh5sHfLpSvYQqro2+KxD8Msbihvx0x98xdl
	 pHBLXBzPI7hP77prEdp9xczqZeEMy0B06JFm7n/s4CdN4Hfwul9Lv5jlUQQ3RS1phW56f
	 dqoPybPuaNrWXyuR0+sKgM1Ja9zNbfzy1x2vZ1mOmDDudv85fiWMMMk9tznP9I2QxAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E3606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE6E3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so293304a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555409; x=1795160209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvL7LISW/1hXrYXeyGM8qT4qenPvB8Dmix98oXakbm4=;
        b=ZhV1ol/LgyuuMYN2pskgkdPg0TVaxbeJJCX3nvyGxPUoTxgsTB3t0US4v3atKFgpCk
         0WgYAGSdeo7BkwCFjNT3C/zI73dJwp0jwScfju708gXVk838HWytGLDBXAC6LcZNBln9
         Dgf1i9qFCcLdfQ9hODOCqZZ4TOqKDX6kmH4fhLsUJyaQqRPD7uU/gBhhRLS5ssZ9Zqmq
         9prHX0nEqqDRvp4zpxRp+KxFuv4u2Dt+WUoApRw/sLl7UCzMc95hrpsyldnPKU9UlhGC
         B/aU3Y+YUbnN+pOtylE0xcQEE1PhgbbdU/IrbUmxgWA/yHmipSNaDy/nbGvDpdK/fQ9T
         wqew==
X-Gm-Message-State: APuU4Z8Vq4I4G8N3A0uMPfryCt5iOCc0JQdf4z3lnCUWK5tDUYNrtp/6
	DP3TEtBbTvI/f9kLGh66OtfTeixntVaFGAFEuh0DvrHtgn7OE6QjV7lS
X-Gm-Gg: AYBFou2yvCHWLNA21egCB5mDmXu6Vb+sK88pHmIwguRm1qy3ObA9WH0cxnSjvJ5u5RZ
	aF7GvjhQL5QfouB7nVPjDcyKWO1xUAJp3mjieSPbPqUZsvmcfyYmBMJ902NeX6UYEI4Ngs1E18K
	1cFv+PeKs5Xhfbuepx1sbfjftnVCLT7hifbowoafH2jo4jI3xPXTlAughAHaF+RI99QrckSMQYr
	3w2lvhc1TkBwR7Dd43O0DPx52ziROoKsE5pHGwNOz1Wqd0PhHXsxxnmluVUmowoMNfgNBgJktbA
	pHFylxxRKyGDu98/3YV/mAIUaDzhce4YaCbVIL8SQQ/SXZpnzS8TzeayDjnwGVBh+KnAJAQKIYA
	uFYoV9iGOk6Zl9rrZATvrOgWB2vp46NsuYUPBtOyzmtxHJ2WDTVxyKbC6+16ScTdZzF7XTs5iJO
	Y9yUBH3SvVEFFyzk0l+4fqm99NK+ADi7RaUS4pzXloSt+eHq6u99XqXgXrBGV429rrp2TOy6ZrG
	DYjbyj2LBJ/98oUajORtgdtkbNwXByBila3CCJwTHhjDTwCPbKa5ih9CogOJOvYxLUnwUJ8xgbE
	4n4LpiOdFuYHtfzwgGyzNrkZCAYg7tfGSt6OF/pEUmKZ6g==
X-Received: by 2002:a17:90b:3f46:b0:3b1:8301:95c0 with SMTP id 98e67ed59e1d1-3b1b0b95db4mr1239712a91.61.1794555408847;
        Thu, 12 Nov 2026 23:36:48 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm3205009a91.4.2026.11.12.23.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:36:48 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	usb-storage@lists.one-eyed-alien.net,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Liu Qi <liuqi@longcheer.com>,
	stable@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v5 0/2] usb-storage: bound the ene_ub6250 probe-time card-type query
Date: Fri, 13 Nov 2026 15:36:36 +0800
Message-Id: <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
References: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is v5 of the fix for the ene_ub6250 card-type probe hang.  Changes
since v4, following Alan's review:

 - Split the series: the transport helper comes first, the driver change
   second.
 - Drop the shared 10-second budget.  Each transfer now gets the full
   timeout; a timeout at any stage fails the query immediately and the
   query is bounded to about 50 seconds at most (five transfers),
   without the remaining-time bookkeeping.
 - Shorten the comment above ENE_PROBE_TIMEOUT, as the reasoning is in
   ene_ub6250_init().
 - Drop the unused initializer of the bulk pipe variable.

The transport helper is recorded as a stable prerequisite, so the
dependency is available when the fix is backported.

The forward declaration of ene_ub6250_init() is still needed: the
unusual-device table is generated by including unusual_ene_ub6250.h
before the function definition and takes its address, so removing the
declaration breaks the build ("'ene_ub6250_init' undeclared here").
realtek_cr.c uses the same declaration for init_realtek_cr().

Testing: with the syzbot C reproducer, the unpatched kernel blocks in
the probe for more than 143 seconds and the shutdown hangs; with the fix
the probe fails after about 10 seconds with -EIO, before the SCSI host
and the scan work exist, and the system shuts down cleanly.

Hongyu Xie (2):
  usb-storage: add usb_stor_bulk_transfer_buf_timeout()
  usb-storage: ene_ub6250: don't let the card-type probe hang forever

 drivers/usb/storage/ene_ub6250.c         | 110 +++++++++++++++--------
 drivers/usb/storage/transport.c          |  31 +++++--
 drivers/usb/storage/transport.h          |   5 ++
 drivers/usb/storage/unusual_ene_ub6250.h |   2 +-
 4 files changed, 102 insertions(+), 46 deletions(-)

-- 
2.25.1

