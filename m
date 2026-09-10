Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A149B1EF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053074; cv=none; b=paIKvP2+zppk1BBVlxYrnb+VNuEIjbXr85eEtGhJdkYY41jSpTYokA5K9QEqbm5UauTC4gCKI2O31oyVoOlrTmeJyH18acDxbfdkL5hbYjSfbnPn4e1jSZghNU5t/6NdcCxsrNHoPEf5EIwIHs/vOZhYFi3Xzy85vwAArHAiPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053074; c=relaxed/simple;
	bh=Pix0x7ZA+vLQwBfkt3zx1HIIBxzWAfp+J7S35JuyRFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLU9tlFtDuxBrFkyK0O2fJFEZSoweNf2vs/XVtr6L+/cN8uTGXHtKub23r3aL4Np1pe5Lvl8yPvkAqcQWqXXWLfxWvGQLLoPxOWFrSoXXXNbw5qSSwe/jg3Egusvo/zpCVNiIYqR1ik5wQFSgeWCLKwNwgkJYsIgq8oqwg7YnoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enneoEoM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enneoEoM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49d05d51553so46696235e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789053064; x=1789657864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9LDATQNDM7sK4CtXsRLQsYMPm6MmFZyIYEO/4FzPzE=;
        b=enneoEoM/ynB6cNTGNTpmswZReM3TfImTw56Mh7kMfc5q7F453Fz6UMJdjO+hQvjAH
         DpjI78LpBiiEQHXKgvz/sONBU1uIAfKfVZ5WQw0QXJcUOSGRA91ReeOXwAmwrbvtWHUS
         Zi9Cxl+X9lmgNZeTFxvfeOxzlyTNGIAI1/hT0GnbGCeXqvuPhv/MuewWhbnv5TrzvMq1
         8gtGKJYEdz1XUScOEwPrP/YEGLjCoecIOL5Yf/EFFU+dbdCXvnx+oTTwObCAGG5n2vce
         q/glHskX2ptgBZAgZqxCtwz5XBuIlmHIHcqAJM2agXxspHU0TuaqHoLjr2w2xt/ao42j
         PsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789053064; x=1789657864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9LDATQNDM7sK4CtXsRLQsYMPm6MmFZyIYEO/4FzPzE=;
        b=Ujvv5/mz5NW7iS0fEZSec0qYZVolMkjt/a0bfGbvTNs25wg1VE+URTqTHnLuWJfb4Q
         zSiMXjQChaWPpxUX89xfVKaulx0Gb+ir5AdBNAj6LXcwihevHVjNGRPkJ7oMXUtjgwOo
         /qA/QNKKUDJYLf58+HfrAQNi0cK5yXvaKRlQ16W6edSbVIaExbGKrd7lPl3MATQ+BDWW
         jEHPARRQlLFoa/4kv380HrUCE/3EVy4iqGyzj62R7TGWFaIo8++EdyuCwwyE8nhwb+g8
         rwmgvKGGe4asRSG2dW1HA1ZX/JcjLJmTfP/DeKCr7DADHbBtMHQobylifwv+RHGxxnNV
         OnLw==
X-Forwarded-Encrypted: i=1; AKwUvBxXm19iI6QRg7BNieAR1gplWqW3gt5G7vGXHExF788Ri/BWOlwIwFBrRjPXbZzR9IZKeUwm/Rg/g6mRdwo=@vger.kernel.org
X-Gm-Message-State: AFuF++kK2tXAJvknLeVFzu/Dw9UqdfX25UvPmuG9cWU9dMNYeQV+g75e
	25pnCdVCmixzeBZX0KpNEDADC2mS7dZ73aWRRcJk2ofADrlywarwkGAW
X-Gm-Gg: AYBFou3VayC7hpofyKbN/htGGoeYRACrYv+u9BU6RrPeNFqTU/VCGdU+SIk0ZQEf68M
	tC0CluwDJNn/UZbDyMT2yVYU+rXKatn7AZiIMApVVNH0fq86T++fdeA92mZZmUwx1l1c4lmHzIu
	KucjsoHZ1JD8godo6bAe3uM2fEss9qijsiBvDo1yFruvElJl0b9sl3xKHW4yijmawyPj5+Eup1p
	DwcTDZ1T8DqaqqFCd4zVgOzO30PoiRXU9EDWbKIdCRv8hJZgsN4GSH7NweTd4RQCy4Zo0LItzEc
	bR00CE32BkAyXzSChdpEVvUDKWlvv9/9gEE05/raSM8FalQDxle72EUv7bmV6osZ1FbfkvT6FJh
	gphFXKSzzkCF7p4kFEqiVdsC6xJZ0DyZW3GdxytWvyIGDe+V+iqj8MQ36tvf/2MZwZWoxXQd2Y4
	+kSmmjW6s2HgQsWGVj62wh0nlJmNbG+PGX4DVWyNlEoNZCptSt6sOxntWGU/9VdZ3174Zbg/EJH
	TuRmnAufY2PYtGDMcrEhjoruSDgKSiQ7MF1wYk=
X-Received: by 2002:a05:600c:c3cc:10b0:49d:1d6a:4cfb with SMTP id 5b1f17b1804b1-49d1d6a4d7emr116017625e9.1.1789053064225;
        Thu, 10 Sep 2026 08:11:04 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-70-91.net.vodafone.it. [31.26.70.91])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d1fd532dcsm123568545e9.1.2026.09.10.08.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:11:03 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Bernhard Seibold <mail@bernhard-seibold.de>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: lenovo: stop the hardware before the per-model teardown
Date: Thu, 10 Sep 2026 17:10:50 +0200
Message-ID: <20260910151051.12975-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910151051.12975-1-okerixx@gmail.com>
References: <20260910151051.12975-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lenovo_remove() runs the per-model teardown first and calls hid_hw_stop()
last.  For the ThinkPad 10 Ultrabook Keyboard and the X1/X12/X13 Tablet
keyboards that teardown ends in cancel_work_sync(&data->fn_lock_sync_work),
but the hardware is still delivering events at that point, and
lenovo_event_tp10ubkbd() re-queues that work on every Fn-Esc press.  A
press landing after the cancel leaves the work pending when remove()
returns; devres then frees the drvdata and the work runs on freed memory.

Stop the hardware first so no event can arrive once the teardown starts.
The LED-off writes issued by led_classdev_unregister() after the stop are
harmless: usbhid sets HID_DISCONNECTED in usbhid_stop() and
__usbhid_submit_report() drops the request on it, and the raw_request path
used by the tablet keyboards is a plain synchronous control transfer.

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Link: https://lore.kernel.org/all/20260910064345.9BF1E1F000FF@smtp.kernel.org/
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 617bba6..ff7c5ef 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -1498,6 +1498,8 @@ static void lenovo_remove_tp10ubkbd(struct hid_device *hdev)
 
 static void lenovo_remove(struct hid_device *hdev)
 {
+	hid_hw_stop(hdev);
+
 	switch (hdev->product) {
 	case USB_DEVICE_ID_LENOVO_TPKBD:
 		lenovo_remove_tpkbd(hdev);
@@ -1518,8 +1520,6 @@ static void lenovo_remove(struct hid_device *hdev)
 		lenovo_remove_tp10ubkbd(hdev);
 		break;
 	}
-
-	hid_hw_stop(hdev);
 }
 
 static int lenovo_input_configured(struct hid_device *hdev,
-- 
2.55.0

