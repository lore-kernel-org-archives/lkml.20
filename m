Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954435632BD
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792085449; cv=none; b=NVhFnafYYQXb2utj8PKZN5aOMnIkNfK+ywV2mzYlZs83v/0LddpUqFOmBtXvCD8FKLRd0lIpjAuygEujHnHbrkfffRZZW2mQZgyIQpaBjwaWSkdvijRuXX48v9J4Q4ktBkmJNw9o+6PFD3iVhDQW5XqsP0xW96AkXuyFtUFAGrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792085449; c=relaxed/simple;
	bh=9g9zSq074iPd7lmg87fsZCRtxqvQNuxb1lPXVSTpQjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2aNuDPJCBO/dZM4DGagc6tBZSN91GUBjCSCPJgD0J2g9i/QX8QqV7Adu7DJ5kbxL/SvGwQA+0JG3X2IMpiot3mcfurn2rVRxXjzvPOdivuf3/sibvowHHrznysOcGSaAfPHbrDljJjzZ08J1FdbjYvEjOql+eXpGa6A6scO4PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mpy/S1Hd; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mpy/S1Hd"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e706a6ba9so705526185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792085440; x=1792690240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NYdLOSjrNOs+xotfPTGhWGTNQmq7/MP7sLOby3eu2kk=;
        b=mpy/S1HdS9xrCkKQCXlvabsfjOdtGZIKXRuKOyy/eEUJFm1IjYzL3QdQ1qgFhDTM1m
         ajdFWvnZ33Am2nuDKYISqzSewbbYIUI/BbrB3GbxLGGclpBPzcB5D4hZRzrI4peLwv8O
         CR57msEQ29Sksmz60azbaperTi/6+zeXU/he1BkcOExXWNxdfZUe0oNHjgnuMTg/MFOS
         2fVqXRUUgWk3kYO1vmMfcV5sRztLYOvCB9v86sfBjyK08oK0aIUMThQE/GLjJSPPKDBc
         Cm02Dpyr4qmcvBMGdfaEBSYg62vF8vk8g6G4D8GoUyDrHHvXQcbFxM0yVGtYLsePGATP
         m7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792085440; x=1792690240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NYdLOSjrNOs+xotfPTGhWGTNQmq7/MP7sLOby3eu2kk=;
        b=G2m3XPjag8/W9nVoy+JS1y16n7zrOa01pQmHKbtSRyEwNu9rgOUbhky8mOPYVfdtMl
         WsLhUV9WTHN/hIV/qCt8oCxs/DUXqKQxQ5cYwFuubfNSV7esyzE+nVphrlUuQ9Izfzz3
         RmFqcqBCagqkGJElGoVzOD3Cb95OMKTbWQ6mieP+e41bhEnSK/bY+G36Gu5fE/c55eC6
         udFUmwzdH+I0wGJOjHOHSBbbRYIMTar5qhyavG7h+qYs9Z5v8q5zK8WwXrar+vFj2QDj
         ZbCG8H1etOESspS5ujpMpUF9f/JmM5O4DC7u5WI5oqPjYskefuIDWvapXkcKTAxaWPdM
         rTHw==
X-Forwarded-Encrypted: i=1; AKwUvBw8WrTgTned56TaNMau/oWrsInuncvfI1V8LWJlTDU98MMYhXjECh+q5485T/KXO1gRlavngR9uHCUwN2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY6KusZwi7ZGUVAPlI86NyWvpf+qSnLFkM0OXfv36/HxjkRjo6
	s0LoyFwKbyyAwrgdFe9JCTllBwPbWPP9nmUKwvY9nQd28b5Uf5I+iYSggL2TGvXxg2U=
X-Gm-Gg: AYBFou3KLHcL19F/uzYp6By7mhqb9tJxAk0vODadqNqAU/ljGPSaIoUbzeBZaa2IpS3
	7N/CoIhpssVchp/ddI4bjLVUGla+M6lJrhUz+ui5G2zl8FwHU5QcAVaaTllj3WKAXzDY2RnhaK9
	KwGtv+VeP9ITBGEXrV/uDLFpZjHkC5cD0D+0O7tABk5ycGE8nyl1UoFWdgXd2eTICTYLxO+ouwC
	VEIeT7NVt5Eck1bNhu67cNLC20fbK7W/ld/11neNLmwLFW5xQ88MXYBe0MW/2KRbO63uTWw2dpx
	hUAEA+tECv70FFT4jKleXOrSnYFPJ7skpK+waqOiKJGe1QbI5gm1nL7wNsp0aydDMRJsngc1Rv+
	n8BGLZUHfmXe1RJXYIPsi1XgkgQQNVoSO6uqoFIk3zfW//1cm127Ir3et8YEz9e9Q22jYCf01eJ
	wgARAJao2Ar7ZK6wR/c7dhtlXpvgpzLIFy8gEMbqaSr9/P+02YrayC6ohpa+2bhP+nisrfD1OZm
	OWxH2gB1NHRV1Mvcih03EkEoWLbr0Yt5DGilP1bHmWyoi/j6DyYb7Xcvfw1
X-Received: by 2002:a05:620a:2781:b0:93c:5951:38e9 with SMTP id af79cd13be357-93ebd28cae1mr3125418185a.52.1792085440261;
        Thu, 15 Oct 2026 10:30:40 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50095bbsm825062485a.9.2026.10.15.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:30:39 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-rtc@vger.kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	alexandre.belloni@bootlin.com,
	rui.zhang@intel.com,
	stable@vger.kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [RESEND PATCH 1/2] rtc: cmos: Disable ACPI RTC event before handling it
Date: Thu, 15 Oct 2026 13:30:28 -0400
Message-ID: <20261015173029.3091872-2-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015173029.3091872-1-gourry@gourry.net>
References: <20261015173029.3091872-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users of RTC_UIE_ON can stop receiving update interrupts when rtc-cmos
handles alarms through ACPI. In one 50-run test, 40 runs passed and 10
timed out after receiving between one and four of five expected events.

The ACPI ff_rt_clk counter stopped at 218, exactly matching the number
of events delivered to userspace, and reported:

    218     STS disabled     unmasked

rtc_handler() runs in the threaded ACPI SCI handler and calls
cmos_interrupt(), which schedules rtc->irqwork. The work can run before
rtc_handler() returns:

    ACPI SCI thread          rtc->irqwork

    cmos_interrupt()
      schedule_work()
                             __rtc_set_alarm()
                               rtc_wake_on()
    acpi_clear_event()
    acpi_disable_event()

The SCI thread then disables the event that the worker enabled for the
next alarm. That alarm sets its status while delivery remains disabled,
so no update interrupt reaches userspace.

Clear and disable the current ACPI RTC event before cmos_interrupt()
schedules the work. The worker can then enable the next event without
the handler undoing it. With this ordering, 150 runs delivered all 750
events without a stall.

Fixes: 311ee9c151ad ("rtc: cmos: allow using ACPI for RTC alarm instead of HPET")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/rtc/rtc-cmos.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index fa04ece151b8..fe514b1aa343 100644
--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -758,7 +758,9 @@ static u32 rtc_handler(void *context)
 	unsigned char rtc_intr;
 	unsigned long flags;
 
-
+	/* Quiesce this event before rtc->irqwork can arm the next one. */
+	acpi_clear_event(ACPI_EVENT_RTC);
+	acpi_disable_event(ACPI_EVENT_RTC, 0);
 	/*
 	 * Always update rtc irq when ACPI is used as RTC Alarm.
 	 * Or else, ACPI SCI is enabled during suspend/resume only,
@@ -781,8 +783,6 @@ static u32 rtc_handler(void *context)
 	}
 
 	pm_wakeup_hard_event(dev);
-	acpi_clear_event(ACPI_EVENT_RTC);
-	acpi_disable_event(ACPI_EVENT_RTC, 0);
 	return ACPI_INTERRUPT_HANDLED;
 }
 
-- 
2.56.0

