Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91AE343885
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363635; cv=none; b=peIRX1vDHNB/HIHxxf0aK56pNCmPyXmCGlLzdA5+3oECopdfwVGaOQdHECjkxMoGAMr9RiApkuxfxJdm41pg62K6FPm9IY95Npz0y6tD3MPjMQb2IEtVEO2/meUG5unAhHT5XU3xhaW+0TNYjW6Cb/qzvJ2e6xpayNNNvk172Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363635; c=relaxed/simple;
	bh=j6r1yM0Nj2g7ZVK6IoYOqBzm9qH0abhm+U7Ll+RV5so=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IngljFi/PoRf0xNDqp6y54icPW09dmSTOyjA+ncSX+j/IdwjAufIe+/V1gNJoeClCSne7eMycllyEc8jUVr2xAlFGSgQJZ8Ln8kG4asu0hKHfWX74PF7MYaw/2VQIWO7LAG2u/8wwfksN8VdaMGsr9/IAD+A9eCqGk2vKn9RB5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SF5xvDTN; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SF5xvDTN"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15756f82e8aso1381878c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363632; x=1792968432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SRaL3m+hn3zzK9EEds28lDnI6OFgmnj9tIFxBXhk9kw=;
        b=SF5xvDTNo+3n+HfbuJxjOMILj8uf6e09EpbK4CuDoHWrBrTm7ccWV6RZ5dH1w0xBDe
         zCOyYjEo9Tz7xgedOtmCzJQulLXTVBoUaG50/t3USPbWL8wg+53AGgEvbNWYj6j4YQb3
         aRE3ouVzH9M+uEAABBFwqQ2nCg9Nt7JFnSwPj5CDM8p7rzZuSzGpZwVrdR5wLOGHNj9l
         t/AplPLN0K0JPhxeUs6jZsj7EKnmNT0DTfC12Jr+tnnRTBeJwUp5EFEaIyiaPQqy2r0Q
         Z1iSDej8wvEtq5IZ/JtNq1fWOPy5oDOyZoGFFVXGKGPb716PcoS0NJBSRAyvEEz8/nht
         rA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363632; x=1792968432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRaL3m+hn3zzK9EEds28lDnI6OFgmnj9tIFxBXhk9kw=;
        b=fhBmzs5wrYoazh2Rqs/iQdvBIlQGHDztEyDX0yzk7JW94FymoQ98rtSqLL64l7KeJJ
         BfqgfZkFRaX/Cp/gHM93p2p1yHuey8gJTzCLdSI9GeDpElKw9vOpTGXjnpgksz4Fep3U
         RGEh+TvmicfO6gjsl0hnuZZaIfhwn+6/CKSCvMnamE2WXlmVqaiSRAA7kJ4AYR88i2Y8
         kSN4lghEAvtd+hoehvpFc1/kYeScNxps9KAT2S2dpulXs4f1i74skKUR+C2S+iUIZjFk
         kEBJr3JDB2cPgE4TQd1sVGnagumawBnAb4MVr4EzqsozMj+Mh9JHPdEbozIFr2JAOuEH
         6ONA==
X-Forwarded-Encrypted: i=1; AKwUvBw8Y1eMxFrLRgPocBcM2VKC0i7qDH1K0RvGvY7N/QxSFDcXBtD0bxclOrdNXRhIVNbwSkBvSkb5h32SBK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9aPL9BUt5BGqgRfNu1YIJYfBbPCzHzIB2uOXzA/OUL7sui9hT
	Snez2KacMp2pGKODXl40x8+PU+PEXzDK756BYLA8FWnz3Gfl9WkD8a7d
X-Gm-Gg: AYBFou3oeBDd3mZyle3xIAoUBqx8tIC4G9rVh7haqBlnKheRZTYyEb/I6Dgk2zDzmj9
	a0z0K8hYYKPwqCCJKG+NdCRY938x23r/QS6+h1K8z/1g7CguDOLEzZXQq3ElWAsQJ08f1aS7ahW
	+9BrHOa8K2lIJMCORbFdvW/aiFGlIBJTwNO4bky2pqpWxU/A59egL4kWxZU7YMhC72Np+ZzaY5t
	tFfl4zcC5VxrC9jK+87AGXTYl6l9rQ17Qi9FWu7mqW3o8pBgurH1IP8e1xo2nRk7B1zVe/yuhsP
	BjOEGEbTz/IQoM1aPNhkkPz6aptTwE7HpSbsUngW1A6XVw/DvxP0WsdzajRzxOw2H4NUAOpykMV
	9nKrjq0F9eVy28CZ+YYLp3tb77e5H6bD5urpp3V6yqcNG8iGmV0NmqoPrgTjXiTE9NeuFl1g59J
	QH1rxEB8+d2gvmYwdm5SiMNXTinr4FZThB9cUDNg/vU+u6+DSCP3HocF7PIV+cIxJCzoszggm+2
	pbt37jpXFMI/5UjFdg+E+JezXTFH+hEVyT6f9+ZTbc=
X-Received: by 2002:a05:7022:438d:b0:143:1bb1:3305 with SMTP id a92af1059eb24-1825b20a2ddmr17210769c88.22.1792363631761;
        Sun, 18 Oct 2026 15:47:11 -0700 (PDT)
Received: from siegeengine2 (c-73-158-156-210.hsd1.ca.comcast.net. [73.158.156.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a02b8sm29221886eec.17.2026.10.18.15.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:47:11 -0700 (PDT)
From: Mark Pariente <markpariente@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Pariente <markpariente@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] HID: logitech-dj: Re-announce connected devices on reset-resume
Date: Sun, 18 Oct 2026 15:46:27 -0700
Message-ID: <20261018224627.60328-1-markpariente@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a receiver is reset on resume, for example because a USB KVM switch
moved it to another host while the system was suspended, its paired
devices may have reconnected to it while the host was not listening.
The connection notification the receiver queued for the host is lost
in the USB reset, so hid-logitech-hidpp never re-runs its connect
handling for the device.

Devices drop host-configured state when they reconnect, so whatever
hidpp configured on connect is silently lost. The most visible case is
HID++ 2.0 hi-res scrolling: the mouse reverts to low-resolution wheel
reports while hidpp keeps scaling them by the hi-res multiplier, so
scrolling becomes extremely slow (1/15 of the normal speed on an MX
Master 3) until the receiver is replugged or the mouse power cycled.

logi_dj_reset_resume() only switches the receiver back to DJ mode. Also
ask the receiver to re-announce its connected devices with the HID++
"fake device arrival" request, which is already used to query paired
devices on non-DJ receivers, and which Solaar sends to all receivers on
startup. The resulting connect notifications are forwarded to the
existing child devices, whose drivers then reconfigure them.

Reproduced with an MX Master 3 on a Unifying receiver (046d:c52b)
behind a USB KVM switch: suspend, switch the KVM away and back, move
the mouse while the host is still suspended, then resume. Without this
change the wheel stays in low-res mode with the hi-res multiplier
applied; with it, hidpp re-enables hi-res scrolling after resume.

Fixes: 534a7b8e10ec ("HID: Add full support for Logitech Unifying receivers")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=203421
Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/528
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Mark Pariente <markpariente@gmail.com>
---
Tested on Fedora's 7.2.11 kernel, with this change applied to the v7.2
driver and loaded as an out-of-tree module. Only tested with a Unifying
receiver (046d:c52b) and an MX Master 3; Lightspeed, Nano and 27 MHz
receivers were not tested. Investigation, patch and changelog were
drafted with an LLM coding assistant, then reviewed and tested by me.

 drivers/hid/hid-logitech-dj.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 6e8db01d27ec..cdb20fdc7b21 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -2010,6 +2010,16 @@ static int logi_dj_reset_resume(struct hid_device *hdev)
 		return 0;
 
 	logi_dj_recv_switch_to_dj_mode(djrcv_dev, 0);
+
+	/*
+	 * Paired devices may have reconnected and lost their configuration
+	 * (e.g. hi-res scrolling) while the receiver was unpowered or switched
+	 * away by a KVM. Have the receiver re-announce connected devices so
+	 * the child drivers run their connect handling again.
+	 */
+	if (djrcv_dev->dj_mode && logi_dj_recv_query_hidpp_devices(djrcv_dev))
+		hid_err(hdev, "%s: failed to query connected devices\n", __func__);
+
 	return 0;
 }
 

base-commit: ae6927c533a4454570950125ca8ba909c45f20f9
-- 
2.56.0

