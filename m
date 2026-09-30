Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C6E41F379
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797081; cv=none; b=L5uiFqMEAdcq8OcwySFmv3rTz0QlRJhUOLqU7pAFjtXFjQCTht5kr7lrxwsS6vbGdYKGGXRlmAt6j6igdfj7RD2zP78hoCLT5vAw+ThuCDTzb6XUCVfBZvZZb5zeRZ4oKpdFQSnZimvtH33JVWpS+pLCuRvf0yrvgLpY6VoR9sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797081; c=relaxed/simple;
	bh=7UO/Qdo7R67hQk5z1GlG12dvtgsF1F7tVE2joftpjRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ao8IeWWJCKfeebzsK/kxqI21akX6D5S/ynaKv/ybpnZcNUpxoZVven/lYs7A3wQJChBCDjaBhOw8g9dnsR5FOtIgrS1YTvhVoPZ3qet8Bs5K6oEu5l5pnsjYS5h9MK8Oyg49fNT2VTusMvBfQknegQQEcFFnhsasdLN1iSsJl04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BseNpMSw; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BseNpMSw"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so6541417eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790797079; x=1791401879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rVuWcz5sCe1pqCK43i5kCMQ+Y9geilt7Ru4TUzBHuA8=;
        b=BseNpMSw163TAjDn1Qfam1SwTo71JYA51ePcIZjEqKTUNfJFBLdb+XLSuy0Q7w+weW
         mDdLnYj1fh9U1DzIP14NlTYTO9ga1mFtE6jfGSd6Q4hBhrmynWpZEvsA55Unosci8U3z
         m8Dz5mRcMwOY3dcR99un86CktUmvD++ZMyEXEO0Naoa4LfcZxieVg6So7a+IxY4WlG4Q
         vJsSQibaJ8wObyQgM9+TbeDl3VK/uvNgjV/GTdXLBZOZcD4VZCacOEBPO8pa8pHtx8lY
         EywUbxLyqZt0skgZmos6EY/L7hx6UqGndEHY+sQ4hNKQy5lpdZIObxKqt+TmMlhbBgrT
         SvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797079; x=1791401879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rVuWcz5sCe1pqCK43i5kCMQ+Y9geilt7Ru4TUzBHuA8=;
        b=Ny+ZYilxq/Ru0bGTUcalt66jCP7jNSW7cVUHowjqM2nhcLuBBwsZr486kjYLoJikAd
         HPN8mNr40ULC70sxlK97PunFnDy4TC0Pn6b8ISRcCe9DTRPuYyZNuw0TEd2OIqczgGZT
         xx3nNSDvdY1rYXNsctJyqowZOq972So/nivxlphSgnaOv+MTyg0qKydhpUnvE5r3M6dv
         747ws7C49r+opzqK6HjmypLeC6qBun5+y2B2AEXhPtEaP0GKjzszkn9egrbg7kmq7eGD
         j6rxQeh8Dh8vtyf7sATzoulU/8qPTh6ykh7kjokXjZUvwpLT6k8FExnNrz/z2O3JZcHa
         vcQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuqE9VrR7ygZaEz8VkkJKbUsauGeI/sOOGXQR+xGmKnGiqa0KyLAX2vyMEjaTkKo+C/tvhHbWe59HWG5o=@vger.kernel.org
X-Gm-Message-State: AFuF++mdzKKbvKkkLxyvNAW6qnqwXPFEWfJHL7DVad3UJeN8LK/0jRBJ
	aQ7RpxSYO1N1kMLh3WubzsT7Hq0Q160JqNeO8+jvJ098wv5okKvLTasamaQSQ3M1
X-Gm-Gg: AYBFou3XsQ/IxmWWcs74v6kZzTI+5hidboRgMZuKDJcis1h2H45nfilq67yKInErq/Z
	YdoIYfGXnMCjdBTaSYEwSphB42GXqa8Rc+OSo6OtYvxtpyN2ENxijeQVsRsWdVT2rS+IQ5Sfx3l
	kfxD3Zjw1cvj457qrkN5Y3ONRbsRb8leDXqY67CYVrGXJeC5lBVkBy29wIFwJkKOx6hNRoQUsCE
	kgrhkfaucw6DRZHwzGzQVlky2hp3vbZx9mN8wAit7uyeRThZ/I0e4LHNWxwbONcb1G+VtuDV+uJ
	CYdqNZjPB7aiKEKl0t/BmcPTEgVtLnjLp38r24m7+82Y2fom8IaH8NnOAT7PEMECkcPGamQJWc2
	2/28KmCzEnDQ0pMk+1MWlw0VhK//gQNHu6sMoce9qyLtKvWqyyKbiLf9nmvfuWtErP4vCnhporz
	mIjiqzZXPOZ657/YeLRJL7jgm6vO9X2lXfg2RXEuk5aKln9olUmK09Pr93GtAXpGXmO0wj5xEK+
	trEyj8drIYO4xbaHNOZqrplIxgJCEUT+NtqKyAp
X-Received: by 2002:a05:7300:8185:b0:34b:7e89:99d with SMTP id 5a478bee46e88-34ce130f8c0mr3999019eec.36.1790797078621;
        Wed, 30 Sep 2026 12:37:58 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b9ef:3916:2e49:feb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db0c8cfd9sm1129185eec.1.2026.09.30.12.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 12:37:57 -0700 (PDT)
Date: Wed, 30 Sep 2026 12:37:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ali Ahmet =?utf-8?B?TWVtacWf?= <aliamemis@disroot.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hansg@kernel.org>, 
	Nitin Joshi <nitjoshi@gmail.com>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use input_device_enabled()
Message-ID: <ar1iwx_390hWw_e7@google.com>
References: <anK1j7hbMyFHGBUS@google.com>
 <178947195441.31094.9793704324340226838.b4-ty@b4>
 <20260930075829.53484-1-aliamemis@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260930075829.53484-1-aliamemis@disroot.org>

On Wed, Sep 30, 2026 at 10:58:29AM +0300, Ali Ahmet Memiş wrote:
> On Tue, Sep 15, 2026 at 02:32:34PM +0300, Ilpo Järvinen wrote:
> > [1/1] platform/x86: thinkpad_acpi: Use input_device_enabled()
> >       commit: be0048786d53375fa4eace15cfdf65593956a1a2
> 
> This hangs on module load for me. hotkey_inputdev_open() gets
> called from input_open_device() with dev->mutex already held, so the
> new lock in hotkey_poll_setup() deadlocks:
> 
>   INFO: task insmod:28182 is blocked on a mutex likely owned by task insmod:28182.
>    hotkey_poll_setup+0x50/0x140 [thinkpad_acpi]
>    hotkey_inputdev_open+0x36/0x50 [thinkpad_acpi]
>    input_open_device+0x9d/0x130
>    kbd_connect+0x8f/0xb0
> 
> I guess hotkey_inputdev_close() has the same issue. This was
> next-20260929's thinkpad_acpi.c built against 7.1.11.

Hmm, indeed. I wonder if below will fox this for you.

-- 
Dmitry

platform/x86: thinkpad_acpi: fix deadlock in hotkey input open/close

Commit d6479c25ecef ("platform/x86: thinkpad_acpi: Use
input_device_enabled()") changed hotkey_poll_setup() to acquire
tpacpi_inputdev->mutex and call input_device_enabled(tpacpi_inputdev).

However, the input core already holds dev->mutex when invoking a
device's open() and close() callbacks. Because hotkey_inputdev_open()
and hotkey_inputdev_close() call into hotkey_poll_setup(), attempting to
acquire tpacpi_inputdev->mutex again results in an immediate
self-deadlock.

Additionally, locking tpacpi_inputdev->mutex inside hotkey_poll_setup()
while holding hotkey_mutex introduces an ABBA lock ordering inversion
with hotkey_inputdev_open() and hotkey_inputdev_close(), which acquire
hotkey_mutex while holding tpacpi_inputdev->mutex. Finally,
input_inhibit_device() calls dev->close() before setting dev->inhibited,
so input_device_enabled() still returns true inside
hotkey_inputdev_close().

Track whether the input device is active in a driver-local boolean
protected by hotkey_mutex instead of locking tpacpi_inputdev->mutex and
querying input_device_enabled().

Fixes: d6479c25ecef ("platform/x86: thinkpad_acpi: Use input_device_enabled()")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1225b01ed14d..40e9763a12f8 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -1887,6 +1887,7 @@ static u32 hotkey_reserved_mask;	/* events better left disabled */
 static u32 hotkey_driver_mask;		/* events needed by the driver */
 static u32 hotkey_user_mask;		/* events visible to userspace */
 static u32 hotkey_acpi_mask;		/* events enabled in firmware */
+static bool hotkey_input_enabled;
 
 static bool tpacpi_driver_event(const unsigned int hkey_event);
 static void hotkey_poll_setup(const bool may_warn);
@@ -2544,10 +2545,8 @@ static void hotkey_poll_setup(const bool may_warn)
 
 	lockdep_assert_held(&hotkey_mutex);
 
-	guard(mutex)(&tpacpi_inputdev->mutex);
 	if (hotkey_poll_freq > 0 &&
-	    (poll_driver_mask ||
-	     (poll_user_mask && input_device_enabled(tpacpi_inputdev)))) {
+	    (poll_driver_mask || (poll_user_mask && hotkey_input_enabled))) {
 		if (!tpacpi_hotkey_task) {
 			tpacpi_hotkey_task = kthread_run(hotkey_kthread,
 					NULL, TPACPI_NVRAM_KTHREAD_NAME);
@@ -2602,7 +2601,10 @@ static int hotkey_inputdev_open(struct input_dev *dev)
 	switch (tpacpi_lifecycle) {
 	case TPACPI_LIFE_INIT:
 	case TPACPI_LIFE_RUNNING:
-		hotkey_poll_setup_safe(false);
+		scoped_guard(mutex, &hotkey_mutex) {
+			hotkey_input_enabled = true;
+			hotkey_poll_setup(false);
+		}
 		return 0;
 	case TPACPI_LIFE_EXITING:
 		return -EBUSY;
@@ -2615,10 +2617,14 @@ static int hotkey_inputdev_open(struct input_dev *dev)
 
 static void hotkey_inputdev_close(struct input_dev *dev)
 {
+	guard(mutex)(&hotkey_mutex);
+
+	hotkey_input_enabled = false;
+
 	/* disable hotkey polling when possible */
 	if (tpacpi_lifecycle != TPACPI_LIFE_EXITING &&
 	    !(hotkey_source_mask & hotkey_driver_mask))
-		hotkey_poll_setup_safe(false);
+		hotkey_poll_setup(false);
 }
 
 /* sysfs hotkey enable ------------------------------------------------- */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

