Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F8748EC69
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 22:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994328; cv=none; b=gB2A5r9EF883NcuQ5m7XJY/W0lTYGCIjqbdIEpIerL+UXKwZEgHKnjycujTcR3kig8ySDlauPhCE1C6tIAauXs8QYlMS13aXthcYZ+2P9jSNP7NgP/ay+C6E8+2dQKierFgDCvrMggntf1Dk48rYq9WBZlq7dwoVsc+QOXczkHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994328; c=relaxed/simple;
	bh=w61WNGoIZA/H9B+0UvBqxIy2Jaep+YUPmNtGA17Z5/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpZEWdVpcjc7KIpcibRC5XTsz5OKrVRESuWRspvHc79NltIdvTFITwvgsq9VRj0Y/3fW9dhdYkxc+JHF8vgV/8MXi0gB80T9ZqAaL959Y1GQCt8Mnn6QM0aLNJ2K10HSylNcPA6MB+RvnkyXUARI/BQ4G5DMRGGcsSkhaOsYD5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MeBpc7kw; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MeBpc7kw"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53091987029so33801361cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788994311; x=1789599111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v83isyAjdugdAGxxYVFRPX3ygevFsOMhNoKrO0tFt3Q=;
        b=MeBpc7kwl8MqLB5z6n5iVHzQx1veQ4IM9toLUmhGA9TK0cfX3xwiLG1duwcROB5WWV
         3t8SJ1UpJGFjz0VXzPg6jTVGK1wTgmj+j4POwyViHI4ijP2CcjiAtIP7SorPKiZ0mCDc
         6BET0Oc74wQmklv7fW3R53fsvaveV+uTIKhv8oVG6vD/2+vJBWtn9sOCfFbqcR6ts3de
         P//tvGElRAsCY/BjUMQ0hU0RH9M5EO0CMWccNDF6r4pj9gaNBMPec1sGRSe94TWO03IJ
         +U9OLQCSDRovEQ10YsM31o0Y7NNJ+/60enrsA/x2UIeDAkJ/1b56aIuKG1aDF9ta43TD
         x0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994311; x=1789599111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v83isyAjdugdAGxxYVFRPX3ygevFsOMhNoKrO0tFt3Q=;
        b=Bbq2TFpXlTzRUsvBOlUC05TjkEUSgFIs0Jx/74ifVf3HNyTkDdFBbKbnzY1KtWcQEy
         7lfBo6Ci/T2rCNs8BOUB4DzMTV3uzJvxWR9Fhw4kXhUIhMTuLGYllcQneGcCKTvkFmZc
         SK94ig0dGE5BI5iWStJBxZf8U5rFWWn8GNdFyZfcS+QpNwWEbRoGv+tKY/e/4HmyID3k
         Nmd5eGgMnThXBcoYLdMgNwDBqQOl1nnl2gaj7bxmN/Dp8qGjyTAOjBz3fWBfEhbtIxgh
         4cR9a3Yij0zhCGBbHN/ynrv5badJbAB2UQlBmqtbmTtF1OFlvpL5XIZhYEnnLQufVL8g
         92ZQ==
X-Gm-Message-State: AFuF++lHo2RFSQuwzhpkCdBKOwUpRJUNYzdhSm1RcOMyP6Z6qED2+sQ5
	r5pRiclGRj8JBtNxHVpXIxLMS3rlaqMlhudq6JbeE0zEv5k+NsMvbWczgeicBnL5Z9o=
X-Gm-Gg: AYBFou0YwIi7O0LSOeb7dzp03eE2uwvX167eULGz1ocSM+PYRmLhK4JrDaC+4RJZcv5
	gKgyjgvsKU6aPnELP6pt29WvK6Gsn1plBQqYZsGtLZHb+4RDXmhCMgrPZ3U2lgDFKQM5vn+78fn
	D6Sc6zmkcEu+M657ju5WsYY1TpSsV+2HiceNmQCHoDoTZTBODFE77pJjdbpaxHeARmuI/SqzUiA
	Ix1ERfx5UZz6P3WTO1+Xo4CuciBsfSmo4OlUBtK5dx/l63l0DXt2iQOjdl8uxpBNrYikizH1v/Q
	PK5mp68/iOhrFPWPAuuNiZT9tmPTCGZhv5JKNwLviIFSu6xz7qdAGmvw/gexQuAtd8AF2cX+Ia5
	xQPLZmDhwLhRRnyKRGnz6VFSvlr+D2WXQLgkxYlxsdiC3coR8N8+1S8XEY1Af/fy9RiLiyglHkz
	cnDvsfcsaqO6y0hjm7TLYZEJxKsE+v8aaOln6g6BgqVFK2wvo2dXb3Q35WN6dy44jnwfamsDQ2E
	iPRPXFiXC8LTsPxz5llRKsMvBPjGuvM3AeV4iA2LlnjyV606drZ4ds2YD4+
X-Received: by 2002:a05:622a:90a:b0:52e:1e5:4754 with SMTP id d75a77b69052e-53054944d66mr394518201cf.24.1788994311148;
        Wed, 09 Sep 2026 15:51:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm59976696d6.20.2026.09.09.15.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:51:49 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	alexandre.belloni@bootlin.com,
	rui.zhang@intel.com,
	stable@vger.kernel.org,
	"Gregory Price (Meta)" <gourry@gourry.net>
Subject: [PATCH 1/2] rtc: cmos: Disable ACPI RTC event before handling it
Date: Wed,  9 Sep 2026 18:51:31 -0400
Message-ID: <20260909225132.1392883-2-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909225132.1392883-1-gourry@gourry.net>
References: <20260909225132.1392883-1-gourry@gourry.net>
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
Assisted-by: LLM
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/rtc/rtc-cmos.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-cmos.c b/drivers/rtc/rtc-cmos.c
index f89ab58f5048a..462799667aa18 100644
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
2.53.0-Meta

