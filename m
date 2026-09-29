Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64023D8900
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790694189; cv=none; b=rFnc4+agZGc9u411VjM6bwUdde/eBmq9N9tXcdz35MXHA4QbtTwXGYpvW+FA/xe1fCo8xbczMUkXt81oeVLi/Z7VWvrhVLUaunLEOu/utJQGIJyYo1VoH/U/9E0nmbHATNgSG0+jJBHT36PNwA2wPCTUjofrbUhFV7CEAM4Ct0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790694189; c=relaxed/simple;
	bh=42nYDcBAxNvHgQbbkGEcmz3UGXdz42wPE9jsdKzwvQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=doVH9aVcavAwJXxBhMTKMKOWk1fP18oj5YnIzlz1kr8I1chHDt485QvnRgZb/sqbGHL/rJDtHnOoeCkrpkQ4aPgUsZ5WZ1F1j1QKNfSaNw9ny2mdHzmgjfkM+vmMmBh2QD+EFfo9JyNfSOUqBKKekpy9UrT3+9Ii9ZbATUa0hr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkUugni2; arc=none smtp.client-ip=74.125.224.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkUugni2"
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-66c70f7a790so1287894d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790694170; x=1791298970; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=VkUugni2dtbQEFvl+TjO9L+KNki9LnrUJCSDua1akT5O7nzQuKzKGDA2qzL4X4UKF5
         tcVQBLV/o7U0BwgC7tCcanBeFPrQHaX8nH31FSFTJb1KiY93uqlakWBtsHrzZ3vHx5gW
         g9fQGaRt9MkJMo/SvB6/R73yukwMNcIOPLvgOWFoceDMZRwaPZL0OniJ77W2qIBtPeWH
         KX/yZSQLlGiAv6okH3cAxwR1dhD2FKzzcqRLHyeizrKHpnO76zV3aOUOKllDg2r7VwWe
         D0Nj6RnmRqb5R+H0/hkspJCynmP24lu7fqOg2IsI79lmEZV1r/CxzqND8uLM+TIbDgvb
         GzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790694170; x=1791298970;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=49UzIiAo0VYsR6EXPEJbJmUgWYtE+uEvjPXao/cXtos=;
        b=GImXXdoMzH+fblGQQRJdJh6WeEv4s8rAnsvfdDIGxFvpEmWxNGqgYDu2REt9f/nEOt
         SKCd7M13xuLxtdHur028kmeUOUO4t2wbTOfoiqXzRZvCSI8RTI/B8Yz7rkutS8XGGUuv
         Ep3ZNDY5719lzyEh2JM06RdTBbmbsT2DCdkpD7+VSlzKbJLTcOPwpswZJcDC6fptsbu+
         uHP3RE5oE05MsbIq8QNMAF87NBBc6eyY0NO0+Y0zDnVoW4d0g5byQCUg8RI4us8al/K7
         ODNFvRimBXTGZ1pudjyvKgWLy5zBKYGRaGskV6377TivuZWFTnlwrIDaAv0l7/i5YBKE
         Hjlw==
X-Forwarded-Encrypted: i=1; AKwUvBxiZlZT9zxKSupg6buPrt+ZvIUYobIix4C/mwPr/GFBkwEiUTdjtwqexl8FeeKSeNR/aoSyiqBIC6hRdao=@vger.kernel.org
X-Gm-Message-State: AFq9FYJL61lmJzRg43LurcGelvVraJpFTsWQOnm+mDmWGFAZPHQ4HhX3
	ztLEfqY/8EL/RjipMJN3GjZcKALuq10kUaX4seKGVDVGrgU70CGjWOCP
X-Gm-Gg: AYBFou1GvkQLAewSAM0dzxI/09sai521CCpD0nWhA/roTXgrYrqunMc+9NECiBRTvDh
	3WSSdoPRATkPBo/IODnML6uHdlj271b3QBBFZYCuo1JgEjwrRoA4kazpQ2uU1RW0MBUhvCagj1H
	/y+oyUPxgdYr+Yfo5jewfIOV8RS0w2bm7dlB3BB45DpkulGZ9ieKhAsNIAtut/lpnq2ieIq4Q6R
	L11CgIEjv2uOFbpLfsxYHERoyPHzull/3GDP29lCLFmAiKyFrxVW5NPqAClwaqMXuyVJi5I5wDd
	ODbVgWedgHUknfI8TWknKrQejHd5EhYroIEBG8OqqKKDOpfzMYv/q1su93Q7Yca/oAMIVZ5+zLL
	Mm8hUTFDkAwQ7MnnZYmzd3RDuSRRjTxbqAYoJb7PRW3ClWBNGv53ELXWbC1+tpoxphTkFd/4kos
	rE1j03/9CRuGrktGx58aG0v4ISu0i/DimuJ8CfmkEqORrmD2QA7Z9UuV8rFWLOF8cnow==
X-Received: by 2002:a05:690e:13c9:b0:673:7f0e:a8cb with SMTP id 956f58d0204a3-6737f0eaf3fmr5413546d50.44.1790694168952;
        Tue, 29 Sep 2026 08:02:48 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-675b7702a45sm83523d50.17.2026.09.29.08.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:02:47 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 29 Sep 2026 10:02:39 -0500
Subject: [PATCH RESEND] usb: mtu3: fix system suspend in gadget mode after
 soft disconnect
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-v1-1-a0ac3b6b2b62@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Fei Shao <fshao@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790694166; l=3537;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=42nYDcBAxNvHgQbbkGEcmz3UGXdz42wPE9jsdKzwvQo=;
 b=YbK3YF9A+aOB+Hm/xh8seZ0DcpGlIq2W0mafFoTLR2ixWJCnN6pznBz15u5t2oiwnrPpwG3qt
 SbDI0QLbGgzCeZQpKyx1EqiIMShHI0oFXGn17wHB/0m8DdbmGIZwk4a
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

ssusb_gadget_suspend() removes the D+ pullup for system suspend by calling
mtu3_dev_on_off(mtu, 0) directly. That writes the hardware SOFT_CONN bit
but leaves mtu->softconnect alone, deliberately: ssusb_gadget_resume()
needs it to decide whether to pull up again.

wait_for_ip_sleep() then asks ssusb_gadget_ip_sleep_check() whether the IP
can sleep, and that function tests mtu->softconnect -- the gadget's intent
rather than the state of the pin. So it answers "pulled up, the IP can
sleep" for a device that was just disconnected, and the poll for
SSUSB_IP_SLEEP_STS runs to its 100 ms timeout:

  mtu3 11271000.usb: gadget (high-speed) pullup D-
  mtu3 11271000.usb: ip sleep failed!!!
  mtu3 11271000.usb: gadget (high-speed) pullup D+
  mtu3 11271000.usb: PM: dpm_run_callback(): mtu3_suspend returns -16
  PM: Some devices failed to suspend, or early wake event detected

and the suspend fails. The rule the hardware follows is stated in that
same function: the IP cannot sleep while D+ is not pulled up.

On an MT8173 tablet (Amazon Fire HD 10 2017, dr_mode = "peripheral") this
makes system suspend impossible whenever VBUS is present, which on a board
whose only USB port is also its charging input means whenever it is
charging. Unbinding the UDC, which clears mtu->softconnect through
mtu3_gadget_pullup() and so makes the check agree with the pin again, is
enough to let the same suspend succeed with the driver still bound and the
charger still attached:

  gadget bound   (softconnect=1): suspend returns -16, "ip sleep failed!!!"
  gadget unbound (softconnect=0): suspend completes, 20 s of 20 s

So record what mtu3_dev_on_off() actually wrote and test that instead.
Runtime suspend is unaffected: it does not soft disconnect, so the pullup
is still set and the IP-sleep poll is still performed.

Fixes: e69027c25361 ("usb: mtu3: allow system suspend during active gadget connection")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3.h      | 1 +
 drivers/usb/mtu3/mtu3_core.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..7f4fb87d8438 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -361,6 +361,7 @@ struct mtu3 {
 	unsigned is_self_powered:1;
 	unsigned test_mode:1;
 	unsigned softconnect:1;
+	unsigned pullup:1;
 	unsigned u1_enable:1;
 	unsigned u2_enable:1;
 	unsigned u3_capable:1;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..5ce61240194f 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -346,6 +346,7 @@ void mtu3_dev_on_off(struct mtu3 *mtu, int is_on)
 	else
 		mtu3_hs_softconn_set(mtu, is_on);
 
+	mtu->pullup = !!is_on;
 	dev_info(mtu->dev, "gadget (%s) pullup D%s\n",
 		usb_speed_string(mtu->speed), is_on ? "+" : "-");
 }
@@ -1023,7 +1024,7 @@ bool ssusb_gadget_ip_sleep_check(struct ssusb_mtk *ssusb)
 		return true;
 
 	/* device is started and pullup D+, ip can sleep */
-	if (mtu->is_active && mtu->softconnect)
+	if (mtu->is_active && mtu->pullup)
 		return true;
 
 	/* ip can't sleep if not pullup D+ when support device mode */

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260908-rbrue-suez-upstreaming-mtu3-fix-suspend-usb-gadget-mode-c69c5104b25b

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

