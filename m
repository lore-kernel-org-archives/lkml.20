Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE0F415F0B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152724; cv=none; b=kLcE1JOS5m2/HEchLZa81reXEGFYiNiAsa0irwGDbVDBDl/jt9u36VLj/AU7R6Ttkx3Ibajg0mfmIxuqf+Vc6FO5dHv1QKf2j/cCQsJbuYjttgWuBoH983z0qwTFO92JIuByRluDovFCvMGoWm7wN2VomXtig/j8aK9fBK4KqOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152724; c=relaxed/simple;
	bh=j0E9slfjlQutlT6Rmi1TRe1co8dcfLW5noTfuk2g2T0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzP8gNY21iDr10IZfxKstI7CtkG6UroDqflIGcm0NP5Oj7NiAGdadhg/efHuwVVNb/+Aul1ISB/i1zL2V2fZs2nnuWczt6cjXsJ3e9g3+tXSQT6dpH1std3iBt4Cw8jCr6HSvhZQpeLekV4M06oPb4CzGx3FHarIxGbU1BsY0DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx8ysRbf; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx8ysRbf"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so380831a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152717; x=1790757517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IX4TEagbPQFXdBfnOIheUTG+gtBUa9fq/Un7VWSnr+0=;
        b=Cx8ysRbfrxnCBY5+B/XrzoK05UtRyDDq1w0m/0WZyFqU0zIBJDCFIUNZ4M3enV3fbp
         jn1lAk6Edc/q6ruU/aOI87lucPU6wSPRN//6xtoaNwrhcxDcIREC/Lr+wU20FHW0zCeq
         62ZVv70NI7MOwCxmP67YqCPd0RJzF45NN1vaL6oxpRvjz9TQLIxtCs5UbfeloLc88hdh
         gj8wDzMKduxpUW1ed7XXO0LSgROgooUOHR71Y9NA5qA1NlKZMUiLkLlrXxZXqSbAomcE
         zkfPWSspXUZBCZXFoFAjSCIAsLuYZoZVsxIdEbh3tKhkZ4Ywn6DuKcMzYAIbUqG+76Oz
         MxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152717; x=1790757517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IX4TEagbPQFXdBfnOIheUTG+gtBUa9fq/Un7VWSnr+0=;
        b=bb2xDxsnIQR3yRHG7LaWdsjIi1iZEZ1Tm2SErhJLoRg9CKNtCcwyIjYVx4rgaJNba+
         8Ezoi3y4CdsVxFaUU1/qoK2GDshDtH/hrUJrKsOm6fDVElMXVqeFZFuu5RoJPCvdeO5+
         ounWs1AkZrr9F0chtTFLPRQDt9I/NGz3RsG8V03D82fTlFILAzknfJHCTOjOf/Rjbi47
         U2Yvq6bI4wTwOhU6/Gb2qnx7yn+iWKEbc+GfY+53YaMj9ChbEG2U9x6DqPo0WALW6Rnd
         Qlq8SrCRXQ/lKm50oQDnbt4+aob1RRwh6JXwpbUVDJdbIOk+S3N7MeeGCws4AuHpvk9D
         BkGw==
X-Forwarded-Encrypted: i=1; AKwUvBynF37oc0a9YEZn2OYiKOWmHsmvZHfGUNrJ9Onbcs55Mk3rFdBsy3V1PBaRjpnW8hJcR5+1tUdqdpHr6O8=@vger.kernel.org
X-Gm-Message-State: AFuF++k514i8AF+ToB8xwNumTH+x6HdgwUdkPnnAwSEbp8vB8hvJej2j
	FlVI4J2VbWP/ez/8lK8PtlnW1IzlD3lm4VSOZ8D0AhHpUD0WrXeWagqn
X-Gm-Gg: AYBFou3lDfCzxoIxqFQHD0Vbd/9CeEtr+j0XBALvH0waLfUDKVvzuQf+OJJqn+SzyLs
	7s0b642NDQOcgKgIv/uO3aVkiFEZ37qvxChf2XRM6iATegP9RcoPWpaJHEmATrP7OegVkey1sgI
	texfAJdfS1WE8jUM14/27nkwyRheYYJdtr8soYeIpVi4HdqaokH9CO7MC1MtCzycAu42Gel35vC
	tW+fMk0tXIKO6cN1qwhSsqnlgklglnwcEx9yCcMuZl6Fae1z4ogw1v35ZsHgX8ZBDh6aTSTzMOH
	MgBzHRkIAc6o5flgmrrDro1BDIBM931b0YGJkoxAxpMsAK4+8Y9fD+bFZKYgAOuT8jTcKXXqi+e
	2jbliSenaGQJT9/pXIuyEhHPaHOhKAXo8ZDbiinNGUyeDR6U6c5qxBj9sy+tJpJuTOgdH8KfdIz
	hXr/iwjTG4voO5qtYbyxt6YKwWQ3DGL162OG3BooxPfqCY9YAqKyh2JmS5OEMXWG2gV6VUqyqfR
	QYI3vL92byxBEWhZ8Rvcuklg0T/g/o+FW4RLLH+GdP8Va+1/rd1SDJsid1cvxjwfmxZwcu2Dvvy
	sQ==
X-Received: by 2002:a17:90a:fc4b:b0:39e:6c69:776e with SMTP id 98e67ed59e1d1-3a07e69606amr1458680a91.23.1790152716997;
        Wed, 23 Sep 2026 01:38:36 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf23desm3793463a91.10.2026.09.23.01.38.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:38:36 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: core: Fix unlocked hcd->status_urb access in usb_hcd_poll_rh_status()
Date: Wed, 23 Sep 2026 16:38:28 +0800
Message-ID: <20260923083828.64925-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hcd_poll_rh_status() tests hcd->status_urb without holding
hcd_root_hub_lock, while rh_queue_status() and the completion path inside
usb_hcd_poll_rh_status() itself update that field under the lock.

Take hcd_root_hub_lock around the early bail-out check so that the read is
serialized with the writers.

Fixes: d5926ae7a827 ("[PATCH] usbcore support for root-hub IRQ instead of polling")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/usb/core/hcd.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -727,8 +727,13 @@ void usb_hcd_poll_rh_status(struct usb_hcd *hcd)
 
 	if (unlikely(!hcd->rh_pollable))
 		return;
-	if (!hcd->uses_new_polling && !hcd->status_urb)
+
+	spin_lock_irqsave(&hcd_root_hub_lock, flags);
+	if (!hcd->uses_new_polling && !hcd->status_urb) {
+		spin_unlock_irqrestore(&hcd_root_hub_lock, flags);
 		return;
+	}
+	spin_unlock_irqrestore(&hcd_root_hub_lock, flags);
 
 	length = hcd->driver->hub_status_data(hcd, buffer);
 	if (length > 0) {
-- 
2.43.0

