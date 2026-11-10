Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285023;
	b=rsftoMtOg/bXaNUxkaVQ4wYQ+aZAxvGam+fIljPIOoI5pVFJmyXoFeVygJVkD//uREZ5
	 EyOIXuDUgqczkYYu2Kgzs1b0iHxA0qHCPQ7MWN0lmysY1A847DrL9q++3ecmJ1J/b3MTb
	 puWDtoaA/Iaw3F+ZamchOb/ldSUZOFxRprLR/trMkRh9ecm3AJHHRbL7o6AilCi7DedNJ
	 2ip9o5sW6ZwTB7m96JtWfBdniCvRjMh1bdEFP/+QL63ZLJ7rbIKribiB9gNFiz6LaFcPW
	 0BlOEKZ0jnRrhwY4XaluRB/2LiAzHGRMbBRzvjm9Qc3JqKUIoK+0CwvuawojIJcnIzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gK3Zj5SmalpyUjC8K4zZ6GNOQeTZ+/I1kE1Ho+gmUJM=;
	b=0J7hbbM2H7n6wiEFawb+4JaoJFp+6SUBpsDq6gM8iTbjS9Sy450xib68c33isHWNLqkb
	 6tvKBIsldA/BwVppB11jL9Wosgw14KPaxwlA32uUAjcBBSxYKuNxHRhmkJTPCTIthLWAY
	 WbR3tWUlTomV6SYVAEVIrBQYPbDM1GO9V2J8V8p7qie0Qn+NpKzhESQRvwgt7inmGhs7F
	 K7uCDHe0phlNHjEoIsQV6FdtpYOFiKocJKjIf/d9sArfa7xYLV/ZyqfA+zDY+nm7BdH34
	 yp+UxGiaOvXE+ob509zsqLwJzPhLs2m+wAL0DQvCySDAbL07z0/iJva4tyrTdYstWPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vz0trkts;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B6860A2609
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18B6860A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vz0trkts
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91c1f548f87so21776556d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794285022; x=1794889822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gK3Zj5SmalpyUjC8K4zZ6GNOQeTZ+/I1kE1Ho+gmUJM=;
        b=vz0trktsq1aT9H/o832KAsK8TjpLXaB37e3Tbl5/h5ULmGLqz9U8OnzqTvfOMAXJpe
         aDmTxinoNBcv4jZMDsh1Ckzrxl2/Mz2/f13oLekQXxqgrwgZWsq6dSK2aIGcnxNUXCxh
         +PStX9QgrLyg85NMBP4C7yCwZ13POsurl1BPs+mI5WDaX/qfXccrc34aTDqsnF477jN2
         HIAgNkOveiV2sH+19CXrR0NjOfRqLbkSNynCSP3tZu47BZxV9FAh3mvzA/IAhn00z5Tm
         8RqVZUAOOX6UY5FdQMBYxHbNzB7hRlvIgSWlqoxv84CGMZ4NaWhAFVJLZGtQKpbRJBcs
         hXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794285022; x=1794889822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gK3Zj5SmalpyUjC8K4zZ6GNOQeTZ+/I1kE1Ho+gmUJM=;
        b=C2I+tKJxo8o/thsQuBkbDD3oUWgcXsE9eU6XW9eVgYnFYNkgDfb3wL/1AU87wFxsB4
         paOtwtlymxppc8PSG1/mHbPE/1hDWeTgsVUo69SDRefEMTRYPimB1cqIral22TvQE1Vg
         fJwRMQhNZtiUCwddmT3Iib2UvbSKIhvOxUvPBeHDmvl78wNlnNy+LcrUZ5dKTbwtNAnn
         0JeWMA8E5gN0ftDgBVW3o1nu+4NP9gO8zRuLAq7HOEY+H+FnQQIBjzSnETxGVQhh0h1y
         Sj4Qg/+V4BHiXcToQ8LwwZScwyQdmWhSGkwVtnrc3G1kLaMLiq5QV9jTb/UVNXFIO7d+
         ceqw==
X-Forwarded-Encrypted: i=1; AL+hErGjlUlxgip4NaL9hFOYyd7U8TX1rLZzqdlxCkCiydquzsm8rmNxDiUvVJiraZkqWSiadsL/JEifykRlMgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QKsEJZikmVYMQGg6iBaGuNRCTSj9QZlLYCWqLCKJvBuXCcNHL
	Ozw1IIsA0VIHNwjTTxAkV6pPR+BzT+CkwjfvFTKkI09ZHHekUxGQ3zxoW/7V
X-Gm-Gg: AYBFou0/ZHOvqtspeo2Tk5ItZMKKNGC+A0rfXKQy0l4AxOAraehjG09vu4voABmU+O/
	bOXM2SOzJ/Ufcdwy07wm1MxXT1amksqfTU9kqMR5ij+4WAbMuaG75zWdKg+tRO4p4LEcy6m6yBV
	dw+SzzvhWuZh2hnJLd7x0i245OFui6y/FWuUGvgBmPjA9B6onDaDYWCfnxd9mYuvFtmGrt06E9t
	pb0lFhrVbSk1gRCiMShfcVnOk0vfETfOXXaOP1U3uB8NU/uBoGTmJTV8c2wM+6BvSww/nCvA5Jo
	yASzAW2KZmEiUyHkVvKf4Dj8W3J6qGJ3OchbmoBrc33EBhhLWbUhHVHqAPczWJLj/DS3PsqfuZR
	QU2+Xi+s4utH+l4SFDxx1S9SUtiQnsGzV/D5jtznR24logQjxr4J/MWoyfLX17nNnAdj7osLX7X
	YzfX3ZHwFvaPIj3h0vPaCbiwP0yqv5nVyHKfKVXFA0yT3+0+scd89V7/FNwXhWuXPl01/SVzxyy
	jPH/KfnekEsdHlGTxe1WOzMfj/cb7fJ6LUieVK40PV2UQ/P+OhjKhfR7fNsX50VP1tveKBfzGL3
	MGTlvmIlxAXx9HfcEFh8oEzHZ58WwERCrLSuI9g7S++mc4ZkSSGmuPdqYPVseL7NwHolep/hazn
	64ApElvLS7ImuDQx5MemVGX76tjFS4ihfD2A6KazWlz3mf1A6f4o5StgOgZYPD7LWMQ==
X-Received: by 2002:ad4:574d:0:b0:91e:a16d:7a30 with SMTP id 6a1803df08f44-91eef808c9emr28829176d6.21.1794285022140;
        Mon, 09 Nov 2026 20:30:22 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef05493desm12012326d6.45.2026.11.09.20.30.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:30:21 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] memstick: rtsx_usb_ms: disable poll_card work on removal
Date: Mon,  9 Nov 2026 23:30:20 -0500
Message-ID: <20261110043020.57040-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
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

rtsx_usb_ms_drv_remove() sets host->eject and cancels poll_card, but a
concurrent rtsx_usb_ms_set_param() that already read eject as false
can queue the work after the cancel. Its callers, memstick_check() and
ms_block error recovery, are stopped only by the later
memstick_remove_host(). The delayed work can therefore run after
memstick_free_host() frees the host.

Use disable_delayed_work_sync() to drain the work and reject later
queueing. Probe initializes fresh work on rebind.

Found by a static analysis tool under development.

Fixes: 4676741a3464 ("memstick: rtsx_usb_ms: Fix slab-use-after-free in rtsx_usb_ms_drv_remove")
Cc: stable@vger.kernel.org # v6.10+
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---

diff --git a/drivers/memstick/host/rtsx_usb_ms.c b/drivers/memstick/host/rtsx_usb_ms.c
index d5b3a96fc609..85a681e4664b 100644
--- a/drivers/memstick/host/rtsx_usb_ms.c
+++ b/drivers/memstick/host/rtsx_usb_ms.c
@@ -820,7 +820,7 @@ static void rtsx_usb_ms_drv_remove(struct platform_device *pdev)
 	host->eject = true;
 	msh->removing = true;
 	flush_work(&host->handle_req);
-	cancel_delayed_work_sync(&host->poll_card);
+	disable_delayed_work_sync(&host->poll_card);
 
 	/* Balance possible unbalanced usage count
 	 * e.g. unconditional module removal

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
-- 
2.43.0

