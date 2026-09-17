Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26241AAE28
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789615214; cv=none; b=UiR6VzJ1gcV9xXcpyCHH+m2fuQFCgKBoFMEnnyb9iNihVvtnTa3hoykMmDuSqqenEJmNaeLvozNqSWnJDFMl7c4hGwpqFHA/eRefJqYdwSmBCN0sdGnArgVPfPOz1kImcpJlekEuIZizdShzhuh2vW23AquIBrpmjDgnguQ05A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789615214; c=relaxed/simple;
	bh=+Zoa3hTlhW97Z1Fdg8ZXaa7K5K4U5NJd2vwJcnpqcyo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PyMZ5FXe1JwnigGXOKM4SLLOHOQAljh4ICemIsriIWVh3vgx7/WDPh24a/NPJBEEX39zBNT3pBjwcEengmqE8hK9HDzHlS0vhjpNFO+fONr2JjVGzbrYtwJQ9odlkxUjxQ3pjv+Yv/SQQxHjIcT1l5oVeHH7SXpYBiIqXiJpQWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0oZMwBr; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0oZMwBr"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so803050a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789615211; x=1790220011; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eG+4OkgZdOu4T7Ozr6+fDvucorju2O2n5bdII7mZ0hM=;
        b=Q0oZMwBrt6+mTdXK7NJ0Q+MAna0X1PAdoTmUWnfDw1C/T2rRx5FjqEXbKWqM84IURb
         pv7UiDO1PywwKgewU2ZCVN9ZSUTiA3NDEruH9P3rxciYXHu4p5zQrHB2J5/iZAK7I3q9
         n05n5vgO3kL4YpouqOqAwg7fU/iqX2vmaWH5ZzgSgO0QqCJcxASoQfOCIepF1oyqlrCA
         G9ytI0Wxc+GEQMakOBDsq23YTPXGca6IWtZpGuwQQXnYARVvTw6AtYuFcbLhJ+YKrzS4
         bcpKoGxO/h/69p90hlXYw+0w8eBbAN5fAfA/WJ031lES9rzHfocYfO+6dnjPuu5lttlW
         KFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789615211; x=1790220011;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eG+4OkgZdOu4T7Ozr6+fDvucorju2O2n5bdII7mZ0hM=;
        b=nx9HQFzO2Omnd7NEqLoznglMGshzAAdjSqaDhB/Q/HDdkiuCa2UojvFNQ74Ccz+KQL
         I6wU0fpJELk/9R93VxkczczcuMOts0IJMbsD1WdVUrv6+cQfGCkvjEt7SRuw61Ez4BK+
         gn7Z6BFoYCHpGddVPQ+Ez/ZP95T3fEUHP+UanJatWHfgq2sbEd8L+4LD3f8iTNEFol3N
         cY7i2+sdiYbC2lcWQnBkXKqBX94RpYzUI1jz47HbYhfdHATv7bVUHP6LxV2rLLnOwIR7
         mFm9jQIChDrg44YC14uGmX4ceeia0NXsBbNZM6ax9EKEkPg5LC2EF9JDqSnUNP8+zNpX
         A73g==
X-Forwarded-Encrypted: i=1; AKwUvBxHUYbTwcCL5IE4wnjEIH/Fj5u2oejWixiMYRxFgAjitYXUvcMr9orde/6I/nr6UkYl7oopak4YoQ8Mwc4=@vger.kernel.org
X-Gm-Message-State: AFuF++muz62mo4WUG8FJSgAVlS2suWGHB9j4inuRWiwiHnkwkS0vrdqj
	wpxWS9R6WJ65qFNRUh49npTo6QzCIPmT59ctXZX14uOEpHFMLB8lXa6hRNbs1t67FYT0XU9Yue5
	803HhMA==
X-Received: from dly18-n2.prod.google.com ([2002:a05:701b:2052:20b0:144:c095:7c1b])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:582b:b0:39e:f1:b2de
 with SMTP id 98e67ed59e1d1-39e1e4c54fcmr12016131a91.20.1789615210639; Wed, 16
 Sep 2026 20:20:10 -0700 (PDT)
Date: Thu, 17 Sep 2026 03:20:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260917032008.1701888-1-jthies@google.com>
Subject: [PATCH v2] usb: typec: ucsi: displayport: Current CAM OOB index fixup
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Update ucsi_displayport_enter() to return invalid error when the PPM
reports an current alternate mode greater than or equal to
UCSI_MAX_ALTMODES. While here, remove 0xff current cam assignment on
failed GET_CURRENT_CAM response.

Fixes: 04cec690b1fd ("usb: typec: ucsi: displayport: Fix OOB altmode array index")
Cc: stable@vger.kernel.org
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Jameson Thies <jthies@google.com>
---
Changes in v2
- added fixes tag and CC stable

Original patch didn't incorporate reviewer feedback. This is a fixup
to be amended to:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=04cec690b1fd9d1c4c314b91a10d8c68a3acfe18

 drivers/usb/typec/ucsi/displayport.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8d2032d0762c..572da7bbd29c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -71,11 +71,14 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	if (ret < 0) {
 		if (ucsi->version > 0x0100)
 			goto err_unlock;
-		cur = 0xff;
 	}
 
-	if (cur < UCSI_MAX_ALTMODES) {
-		ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+	if (cur != 0xff) {
+		if (cur < UCSI_MAX_ALTMODES)
+			ret = dp->con->port_altmode[cur] == alt ? 0 : -EBUSY;
+		else
+			ret = -EINVAL;
+
 		goto err_unlock;
 	}
 

base-commit: 600334ef2f29b975485ce062a81fcfa00bd3ef45
-- 
2.55.0.1082.g2b9226bbc0-goog

