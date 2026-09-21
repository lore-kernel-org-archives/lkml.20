Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8331F986
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025505; cv=none; b=nrczmwY4wxh15Nl2gnL4kc+GMJJKls3M5yoVT0ecRwClZlr9APLXs38TFI7Uc6nAByKX1PwyuWkRFydXOAnPNuYSpFGTgSvTvIrhTHxiOofUt1LEhubN01KopIq1a7lWh063iCqtzVoqqoWXUTDqSad9utWVcv1iUAfbAYRhtkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025505; c=relaxed/simple;
	bh=lqlaVLAdW3RusXi9hr8ji68teprPCl9yDGSlYkQhc7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/QREUHMFJdzbYuFB/y/YwvpOhJaLCwiHhqLxkC8PxhY5I4AMGD0hnGTepNQKnCx1WHka0YnFdpaz0jN5iD27DdkyPlYWWA+sEUAwoWlNhZiziYANh26OSYfjJxusRKZbQ9oJmGg9oKanlaC99aEG4qsidgbcYXuuP14cH9EWIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=g1NDhf6d; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="g1NDhf6d"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76ec395so29167351cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790025502; x=1790630302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fy12LLLF40JV1TUAxtDh7xlRrhTU4s9UAumnOpBUKSE=;
        b=g1NDhf6dGT/rTB6MRGPoggkStgjruchPcoRn/WCwWcfWgY7REGSgBS1Xtgmu1mClww
         Tx+ia4tp1581hx5482HuUPVg01YidckG4lsBrgkDg7mdwZeWXVSWZFU0F6iRoxeXsVAh
         dRjGSY+m/c9G4RtAT6loabacmrogILZ+KkL+bUcOnuOwGKImFGQdWGOuDGS8X4thM6OE
         DDEkcVvFonDlKyoKx1KGVQKeBeQh4CHDNvkQ672zNWlh3VgvE2oJWuRlP7WM3dtoAfxv
         AUlHuDPKNI+CiGGUVbW2t5HcUfjfaxkL1AFXR88qr2X9qtacKEaHqSpWLWXnLRXYWRfr
         zHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025502; x=1790630302;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fy12LLLF40JV1TUAxtDh7xlRrhTU4s9UAumnOpBUKSE=;
        b=hHFEFHs+Tq9C2ebmD5kF6BLevZHlmTVQFNQ7ydu/+lpDm8232OkuuqP25IMIB1EhDm
         v9W2/u4/RqFH9ulVXLsj3NcIetV+pEONR3uHdTllYeiqpyyBlUioxywH5smOVap/wr9m
         rf6n3jUo5MSLp+wNikJFJgMB45VcZeT/I4jxbPDnv/oy46m8A6wvnL4e9K+Yrxhq9ncO
         tR8Sooy2rUW8V+r7SzRUW3tkq/DTa1rStQ6hmNn/SGHLvB1QESGh4l9L0Nqy7ABHNvJC
         0lGPH3YklsLQxiM8KgmF+9xN+N+sx660FGBcIK+NjUD2/OG5hcDfkEoZCdqG4wxa1QsQ
         3uYg==
X-Forwarded-Encrypted: i=1; AKwUvBxYZxavpPetarqubg1fS3gpJCyZCIaa6R1XM1wUwPUDssVGgNs1e0uP8+Xi92BPOXcRm+TeheolMzoMArA=@vger.kernel.org
X-Gm-Message-State: AFuF++krtLMOY1dVVfqUFUCiIVsynhX/3hciDpKfhSlu+mXhMU3+sp51
	zJMB3Lazza9Y7Ii94ANRbRVxrgUCve2MLUp9xypoQ3XoXetSW7m467aCx4CV5uezNLWXszN7c3U
	Z8C8IEtYXP8R5n2LvLibChGudTDfAMQIvEDFFnQGTU7hE34chzEovy0CmDdA=
X-Gm-Gg: AYBFou0/0QlYpgzFjcCMeR8TEBQveXTzWD6daBMq7iSl6VB6g+9ryCsd1lihSeZ+wgX
	zczjTDsf5FefRvnljBD7FjohqKu3m3CJ1kAWEZnghDtl0XRuXP9mHlh97hvk8AQREPGdRkvWmQV
	mIkY+FDZyV2I9QA/d2dIQqzwroorRwbdUU3+5UHD5a+Z2K4+hVDs42DA26Nq+S9F7720DYOcYyd
	MV14eQsScFB4aWxpmpypF3b/N5BEKRXOX93mj3UOt22YJUnxBq73VYpNFOK+blJOemTwr21sQVc
	RXWRKzUnWKoeDDnvasSevncRewyUKjEm4Mtno1FibekAYSvx8DQGN1EqeYCfy7FnYimpvXb1CGy
	xtpl/R7wfvtAYqi3xrxg4l22NZbt0jQqSvKIUMV1jD2O4coXfhmH2MmiBhrY/gLn0A4FC/kuj/W
	C+j0srDY9uDzhI5MIDzBrd14lAC6yUXtE8/XD11u3+3YIZjPxEoPdw1axzUdcUMCI=
X-Received: by 2002:a05:622a:120e:b0:530:f39f:bdd6 with SMTP id d75a77b69052e-532d8e654d5mr27042791cf.54.1790025502461;
        Mon, 21 Sep 2026 14:18:22 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532df63ab0dsm267121cf.26.2026.09.21.14.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:18:21 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	Sean Anderson <sanderson@brivo.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	driver-core@lists.linux.dev
Subject: [PATCH 3/4] firmware_loader: Return status from request_firmware_nowait_cancel
Date: Mon, 21 Sep 2026 17:18:13 -0400
Message-ID: <20260921211817.2432341-4-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921211817.2432341-1-sanderson@brivo.com>
References: <20260921211817.2432341-1-sanderson@brivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

request_firmware_nowait_cancel only cancels the most-recent matching
firmware request. If the callback creates additional requests then there
can be multiple requests in-flight (the original request and the
(pending) additional request). If we try to cancel the request at that
point, the original request may still be running. Add a status return
from request_firmware_nowait_cancel so we can tell if there may still be
additional requests we need to cancel.

Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/base/firmware_loader/main.c | 11 ++++++++---
 include/linux/firmware.h            |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea8317..ea475aa48a316 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1290,11 +1290,15 @@ EXPORT_SYMBOL_GPL(firmware_request_nowait_nowarn);
  * Cancel a pending request_firmware_nowait() request for @device, @context
  * and @cont. If the associated work has already started, this function waits
  * until the callback has returned. If the callback has already completed, this
- * function does nothing.
+ * function does nothing. This function may need to be called multiple times if
+ * the callback makes additional firmware requests.
  *
  * This function may sleep.
+ *
+ * Return: %true if a request was canceled, or %false if no requests matched
+ *         @device and @context.
  */
-void request_firmware_nowait_cancel(struct device *device, void *context,
+bool request_firmware_nowait_cancel(struct device *device, void *context,
 				    void (*cont)(const struct firmware *fw,
 						 void *context))
 {
@@ -1313,9 +1317,10 @@ void request_firmware_nowait_cancel(struct device *device, void *context,
 	spin_unlock_irq(&firmware_work_lock);
 
 	if (!fw_work)
-		return;
+		return false;
 	cancel_work_sync(&fw_work->work);
 	firmware_work_free(fw_work);
+	return true;
 }
 EXPORT_SYMBOL_GPL(request_firmware_nowait_cancel);
 
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index 0fa3b027f02f1..46c34ad0067e7 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -110,7 +110,7 @@ int request_firmware_nowait(
 	struct module *module, bool uevent,
 	const char *name, struct device *device, gfp_t gfp, void *context,
 	void (*cont)(const struct firmware *fw, void *context));
-void request_firmware_nowait_cancel(struct device *device, void *context,
+bool request_firmware_nowait_cancel(struct device *device, void *context,
 				    void (*cont)(const struct firmware *fw,
 						 void *context));
 int request_firmware_direct(const struct firmware **fw, const char *name,
-- 
2.53.0

