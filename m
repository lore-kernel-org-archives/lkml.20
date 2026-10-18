Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9EB3E3D80
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792366045; cv=none; b=NN9glh3rrD6Uz6dJ2IQ0lKDFayfqSNLFHBbpsdb7ZEBGlDJ4Vx3eg8C7Op7OPeAZw34w5uoU/qoC9m4XE3zPIpl8+DFdLh/A/NPvqEyjkbTB5gDMGyWK4FMAvttBuRL23DzMyPk+g2naXnHg7MRxiwKz7vQlg4/zRo6aZF4zDx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792366045; c=relaxed/simple;
	bh=msWSNku5OlvN9yv4YElxcsCldoxv5uxWn4tihBzqttA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDVWhmO5pAihUmB1oPFMrpeLyOzI3l9qMaV6r/iqh1ZTc0NJ86cDE+zl3CoUXMI/9jCH2R2yIapbnUYFak6Jwzmgse4racCDxJ2nmz+uvqSTAOVjkk7LSpd/qIAKxxrd9GfllBAtE9jBLA9ytnLdBM2XIlSa0L4BzgZ6CsHNLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7fp7/PM; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7fp7/PM"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso2903780eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792366044; x=1792970844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWVaE8AeAPWzwHM66+gk5xCbOk1oz8k7V+7bfxLXR7E=;
        b=a7fp7/PMW7dyJJaLc3CeyMOrSriumvyDYjJW9EUgLorAR1rm7Ur3Utr8rTz5X1up0t
         Pu/O/06VINamH2dsz70P2j6pecyQUI1Q6eP0kUnVdC4w0lrLM9WxWberGxYCkVbOQjEo
         0pGyVh1N65cWJDB5c3eqYGDFiyr1nlmwJ8kBG5R9rWBhr0uLenQx5pGCadU7cAGfw4bI
         BJ7fvq5XuqnfNqqOG76dMX+4IOXr7u4acA4syrsIgbYOHlt5jSLKYlx2LvdZDnuyUvbg
         X8LzzPiFOhxbGaJb2R+ifQBSm3mvyf5eL4BuAUI0m7ZzGRhJLvJzLhUyi8u4cgnNScqn
         Im3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792366044; x=1792970844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWVaE8AeAPWzwHM66+gk5xCbOk1oz8k7V+7bfxLXR7E=;
        b=pnO9qRo1KFf8aXDaAHTG0OBYoFNtd/0Oq1hnV1hooYd4e0FK15fust8KE3PmOkYZ7z
         EA6beoiwesRUhgn0OFLIyw4qf5mIXePyRXHf+GtnwdhzJqj10NsIOV2fHE/X2zX7vRct
         4bwIaEoCULpiLCyVeU3MwwGqbyQyIxuUg72GTRih4rLB4cCMalf62SKWOTfDy7CCQVdG
         q1+hoZNEWBdwimAQW3e423J9biwKfcOIIcNa+Htp7KlDB6BJ7j4w42ia62bZWCsDidRg
         FnfrWbOPK+eDFnXKiiBr4UpG7KKENTvSclVt08mWeA8n6M5jlovzp3d0KepsR6znZOfq
         xlSw==
X-Forwarded-Encrypted: i=1; AKwUvBwdbUJCxoDKBDPg+oLi81VDahMUQhZREzapJ4VXO6hQUg8c4BizGUCFPr3BxuVd/L7BwkSL1QX7RPtbQdQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTp3ql3KEYVuukVS6NDhcVQ7ykglOP3tBxoivZW42xya9FTyOi
	0Fq3ml8vCfX0Fjm0OOvK0T9fl0Gb/Eggtc/LbaME0Iof+s505QPryabuTUXOfYbe
X-Gm-Gg: AYBFou0BAeiziTdMKrIXwNP2wn4MLin120xeXrt3fXoc4OEtOZmLa7H7jtCCJgWOU2J
	n9ARNSG9ybc+3QFZlq7lzXLC9Imjw1YQxXO9etbwgD0PdZk/4W6SWePQQcvokTIB6XLiuDkeiC8
	xIdUQzGmM+HH9NpgH7xvMYxSvYb70uV4Kivhqu1m479PgMcKXKgH8sdm3Pf5RSKeZt+IFe+wad7
	VWBNVmd42QduMdGMUXymiK+6tongRwZFtHh8H4eLlxa39iyCVg902CE0PYMcpnr4fwFrL8fZBwR
	hfgeMrrYqok3R6p89wsp/dakPLLKYOMtayYsAkWevnAFYWFwcbq2X7ML9+k4vz1ScYv9D01q3ww
	soHXAal07DzpkuLIzOKYRj2sRyr+eHuGQQXEJMeSWw1GJJ0h6Hg8+db4uO+l3DfH2F0kKL/EdmH
	CDaRHzBNn8FsdyikL9JugYJSADgv7mP/nZs2i3OAZHFK9IVcp5ROr7XFK5ac6QpSLRbuzmROIDY
	UGG1Hf5NVGTNiYO198x+r64WczMqntmt+R+OEYtTLo=
X-Received: by 2002:a05:7300:7aa4:b0:35e:43fa:eea3 with SMTP id 5a478bee46e88-361a137072dmr9070108eec.8.1792366043791;
        Sun, 18 Oct 2026 16:27:23 -0700 (PDT)
Received: from siegeengine2 (c-73-158-156-210.hsd1.ca.comcast.net. [73.158.156.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm25571908eec.9.2026.10.18.16.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:27:23 -0700 (PDT)
From: Mark Pariente <markpariente@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Mark Pariente <markpariente@gmail.com>
Subject: [PATCH v2 1/2] HID: logitech-dj: Don't add Unifying devices from HID++ notifications
Date: Sun, 18 Oct 2026 16:26:53 -0700
Message-ID: <20261018232654.70571-2-markpariente@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018232654.70571-1-markpariente@gmail.com>
References: <20261018224627.60328-1-markpariente@gmail.com>
 <20261018232654.70571-1-markpariente@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unifying receivers (recvr_type_dj) announce paired devices through DJ
"device paired" notifications, which carry the full bitmask of reports
the device supports. Before commit 74808f9115ce ("HID: logitech-dj: add
support for non unifying receivers"), HID++ reports for a slot without
a known device were dropped. That commit made HID++ 0x41 "device
connected" notifications for such slots create the device instead, so
that non-DJ receivers, which do not send DJ pairing notifications, can
be supported. This also applies to Unifying receivers.

For Unifying receivers this produces a broken device. The HID++
notification only identifies the device type, and
logi_hidpp_dev_conn_notif_equad() only sets reports for keyboards and
mice. Unifying trackballs, touchpads, numpads and presenters get an
empty report descriptor, so no driver can bind to them, and keyboards
with a built-in touchpad such as the K400 lose their mouse reports.
Since the slot is then populated, the correct DJ pairing notification
for it is ignored until the receiver is unplugged.

This happens whenever such a notification arrives for a slot the driver
does not know about yet, for example after the receiver was probed
while a KVM switch had focus on another host, or after a device was
paired while the receiver was switched away. HID++ connect
notifications are sent when a device reconnects, and when userspace
(e.g. Solaar on startup) asks the receiver to re-announce its devices.

On Unifying receivers, queue the unknown-device work instead, which
enumerates the paired devices through DJ notifications.

Fixes: 74808f9115ce ("HID: logitech-dj: add support for non unifying receivers")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Mark Pariente <markpariente@gmail.com>
---
 drivers/hid/hid-logitech-dj.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 6e8db01d27ec..383c762c503f 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1766,7 +1766,13 @@ static int logi_dj_hidpp_event(struct hid_device *hdev,
 	if (dj_dev) {
 		logi_dj_recv_forward_report(dj_dev, data, size);
 	} else {
-		if (hidpp_report->sub_id == REPORT_TYPE_NOTIF_DEVICE_CONNECTED)
+		/*
+		 * DJ receivers announce devices through DJ pairing
+		 * notifications, which carry the full list of supported
+		 * reports, so query those instead.
+		 */
+		if (djrcv_dev->type != recvr_type_dj &&
+		    hidpp_report->sub_id == REPORT_TYPE_NOTIF_DEVICE_CONNECTED)
 			logi_hidpp_recv_queue_notif(hdev, hidpp_report);
 		else
 			logi_dj_recv_queue_unknown_work(djrcv_dev);
-- 
2.56.0

