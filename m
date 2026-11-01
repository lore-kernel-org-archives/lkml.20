Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793542293;
	b=3nTc47q5C3bbgdOD542YZvouhbWONfQmXYvpRavKN5mqM5Y5IYyo1svUkEDJDmoF2T9Z
	 oTM3GDfcrsDzXhUliYiBSC+8splSv9lzu8kMjfAgGI4yTRV6nUiDlZomj8ns5uwwU2dEO
	 /WUQQiXkenX+ofDdalmoMC5y8bweTH+6vyg1mFhCESXnIASo1rzQgVWs/Q+ooQak4loqG
	 zIVYwQWyBg7bIr6lgyKDN5ZwXnVywTX4gU63ZTANhBe52NLS2i7/QnfqqcGooLU9TDbdi
	 wtlBvnk1r+csiRYpyvu7F0jWqfZB+V6fkQxVt8oJlAjy22NMpEJj4KNT5uJhWJlCWFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793542293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Lf2IY9CPStJRtoAVxvMXDd9Gx0hZEzwqPvxs4IZKEKw=;
	b=VflPt8hfQBZp4iQ2atjuUtv8ISvmTSeibuFfMmhAOxDgf+5Iw8uyVSsULOjqMCRsRi10
	 SOnccQY96xj5nm/4IJxvhKkhkMyo/gVQKTaShnWR0LbvU7aGnROqmjmH5gS4cdAyrS5yG
	 w03bT2M4D46zoVwY3OME6xLeQIEFGXE+aHd9tK/Q3jQteCQ9KcYQwCoXGXZIGdOsDyBtF
	 1aVYnBm7ArSLFdJStciEnIBEfWQ4XY7TfUTb6yN/r1hg+2jj7H3tIOIskCHg7Dz8UGWJe
	 fMlVRecW4vjEatQqQsCNe/VYHxqCCAg5aHmELTmSTzf6xLN38VIhStbmEkWubhFNZoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPQA8Ajs;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63FF606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E63FF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPQA8Ajs
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1154225f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793542291; x=1794147091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lf2IY9CPStJRtoAVxvMXDd9Gx0hZEzwqPvxs4IZKEKw=;
        b=EPQA8Ajs270CR8a8KLPsyogLcGMSnmgUEh5Bo2ESxnWxEpBbeKQADCFaQkGwsIrYLH
         akc1919nqdCac+uVvQSSjE76owBjFPJhKBiZmkDentGYv0Xg+WX01Wc4HiT4Gupzr0PE
         JlqkEfEXQZEkc7AH06yMSQFxXMICOU/NpEi/ReF7zIAd65KGDKUJqAcudn8P2HTpnoJx
         8PGpwRRhfIQ8C++xpiVGlFrGgE/LXsUPZOiS8wOPPG1o6V3Yzg7NcJn0KUnN7fGeBnZ7
         4921vUgbLZF8K0uS4e1DUO+4rv8lBd8n107DSTrVC8zc1W/OJDrlQNNbgaavg8IUAvu6
         podA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793542291; x=1794147091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lf2IY9CPStJRtoAVxvMXDd9Gx0hZEzwqPvxs4IZKEKw=;
        b=AII075YLKadSM/dvZ50jE8qBXSc5V3XCsOaCCissD9Mf2Yb6tsBQpm7XGa/m+2Fhyt
         Z2cewAMfQYlIN2ygFGsyV72lBBdYhTwyxlxwtUXDhZT1hYMwLgbQ/QiGNof3o4/xZMGq
         DLNsSkdNdhxHD1u5FIEZ26jQYoRRpZBgX0VIU9dPr/an0NVUjBXLyFfzwussZeHRfv7W
         M4BWvP8AWp0L3Gx3LnPD149lA+B7qHq00LWNYuptytl4+Q9SZtn+ejcywXfjAhMSi48A
         1JXx9hxaNsZzVs42I3xq0XGJsy3WjN9HCEgMzV0hKg4ahpdYaZbewtR+P6SQhsnSMgo5
         2QpA==
X-Gm-Message-State: APuU4Z/uI7wCigrV6IjUGGW4PgTBPPgbPhY9AFb3k4eArOCMz7uzN7Me
	AAkh8+LINZVudYmAv2e84S+4CcVpXdB9D5MLUxyJutGFuu5a4Dalm1MN7CYyHg==
X-Gm-Gg: AYBFou1ynOJrj2EUvWgTB+mqkYanYO88N9T7U+/UU8z5GkoJpcXiABmNUs3Q3QO70DN
	FD7BVjvFBXYWbawrPFzDXb2git2rjPf/KdBQBZ9yIkGb9Nu0OWgPNpQ3CIzLPmcnPFH9GxWOxqD
	aLbga1h0A45BCj+w986S4ovrFep/xNAAXSOMYmqxpggKKGCl57tLGYuonlbrAFUETc/U1/PKEP9
	XMcRhWAUhhS/P9AakPcExG4Qx0sgUQgaFw5kkBFFKLok8zyAZi2/6khs0vv61/dY6aFU11dwMB7
	YlqP5CxRq6wKoZv92SAm5H9gcdWjsVHs3Z0HKtPq/OjUDFw/cP+oNqH2slW43ZVw6YUsjK2FUvS
	b9RkzEJws2Z1Yr4d5jU1wjdxd77CtEJRM9qYDs14vQ1Td4CZBb9GM3E/xkmWhgFjnkFRYxOsatf
	jGrRDrhfRK7q/HDITbMDPzdFTpKunMo5KLl1M8ATRsnInLRnpQ869Yrv7/DAtGl3f4hgQYeDFUY
	EUN7m75CckEsvpvU0VEtlkQCIGcNGfe89KXnfD0rOmUxyi/jSrZplD14vXW5NS3O8CYMPXFGtUI
	cy2rDXJT0w08t9cblZFl8fZSfSP1S6U4rw==
X-Received: by 2002:adf:f00f:0:b0:48e:6625:4190 with SMTP id ffacd0b85a97d-48e662541a3mr17297175f8f.7.1793542291134;
        Sun, 01 Nov 2026 06:11:31 -0800 (PST)
Received: from thinkpad.lan ([2a06:c701:4773:6f00:8082:5d3e:cfad:9743])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba5dc2sm13821575f8f.54.2026.11.01.06.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:11:30 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] clockevents: Match the CPU when unbinding devices via sysfs
Date: Sun,  1 Nov 2026 16:11:20 +0200
Message-ID: <20261101141120.367124-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Clockevent devices belonging to different CPUs can share the same
name. The sysfs unbind handler selects the first matching name from
the global device list, which can cause a request for one CPU to
unbind another CPU's device or incorrectly return -EBUSY.

Check the device's CPU mask when selecting the clockevent to unbind
so that the request targets a device eligible for the specified CPU.

Fixes: 03e13cf5ee60 ("clockevents: Implement unbind functionality")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/time/clockevents.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/clockevents.c b/kernel/time/clockevents.c
index 62ad7c000386..05e9d966b024 100644
--- a/kernel/time/clockevents.c
+++ b/kernel/time/clockevents.c
@@ -756,7 +756,8 @@ static ssize_t unbind_device_store(struct device *dev,
 	mutex_lock(&clockevents_mutex);
 	raw_spin_lock_irq(&clockevents_lock);
 	list_for_each_entry(iter, &clockevent_devices, list) {
-		if (!strcmp(iter->name, name)) {
+		if (!strcmp(iter->name, name) &&
+		    cpumask_test_cpu(dev->id, iter->cpumask)) {
 			ret = __clockevents_try_unbind(iter, dev->id);
 			ce = iter;
 			break;

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.53.0

