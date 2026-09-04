Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC5D30F547
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530586; cv=none; b=srfImL5fHLH7b+Rne9RY0A+WlVzXcr8slcJ/MQm0gF+QIZA3LAJkUMGtdmCQbqGtm2veGIsk2RXTymP2idJSA3UsJFyPaxkxA/ICQhZBJV5UsWEa6uyYThW+JTqTrrYvWrIdcrH8wHUogLiMzLOTy/6S0gkeauBECk3Uli/56GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530586; c=relaxed/simple;
	bh=cvGxjeTlRtS1bdiaFN24FBWy3uwd8OQ0PMG2HoN5DaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWX11f3YWjpXNpkPu3LIonOJ/B9TQIL0ibOU9jtTSqdUvWmpzfV6EfGD+e2Qhi3OLkiGkpFJ2vAYfYLL3Dqjn81RkWX9kiQ3xYECbQY2z2P/WZrfqIZtk/KaW7d9UYcQkTDhdlb5uj5WEDimg5Banu3sKiUcpJ6MPOx20xR0ZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bHYmDzQh; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHYmDzQh"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-866e57f63a3so12026957b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530584; x=1789135384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1TWz/3wXzPTj1hxKdPuFCpOrgwLZcNeAFcFrJwfmyI=;
        b=bHYmDzQhxunuq5imLAy97e9u+fl/Y5mM1J6yVz4aJ5X31KHCQBDog6Raah/SK4ceYu
         tppPtFrXlP57bjPq9kYAZ3IlwKo9iArg6+sSvA2CirbabduH3c/epBGlPWFC07KXl4zL
         d433QpTdSZNEKhxop5r3KALfBfJ2WAyzta0WSlkQxYStR9Vweg+dv9SykAtxrzfPmL+E
         kGiatzVAXd151DN+KAs+LWFnJpTJvQhcL8tnLG+RpIi2EMv1i0AxvKu58+FDmIKqtgwz
         MzfQRcQFvsREwnq8F9xTiHhpfyVpEDdYN3f/aTjrqMVzIR9VrEGN2lWquLxPWMp7gcW2
         KDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530584; x=1789135384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1TWz/3wXzPTj1hxKdPuFCpOrgwLZcNeAFcFrJwfmyI=;
        b=nxXms0K8LI4/OrVQ6vvRAxU7dkhj0a7gFc/eHDqYLCVa1YUZ4ZH6056jCoHHtbUP/Z
         VKlvUJgBNa7JZuXsSa0xoBU+DaJwnzus/DGCYmkjIJ9N6npIHlnLEtqjiUs+kUe8B9GV
         swOvJF1k+uTK3oGTO252UCDI/nSVgA+cp/TbwhzXzbXIs8XhhFmGkV6Ir0htNcs2exb/
         cofoDRWglZIoYScXZM+PSh/9sxYCkOVtiLtJgJhf/3J1OJf+bfccPtuuIT5TfuoE1uoB
         s0Ukmt0FaVm9KH3uLyNyZ93Tx7VkkcIG3x0ufZGuNfyxPlXGCUIirIl9/8QkW2nG3Zxu
         OvUA==
X-Forwarded-Encrypted: i=1; AKwUvBwbkD7+mJzUJOCkhHDMm5fhmRGRjy1LF5j2dgDie8e92cAKZwDIwLKIcQg65JUn/WYOxuKTXS7QKbtBxEE=@vger.kernel.org
X-Gm-Message-State: AFuF++lV+BnHat/Y/wcC7WpOWMPw+adKAb6Sq9UBNgL0unRhto0vZclP
	eRki7K4GW4I4kD9GS+z4Ehg47IqbI3u2ay7Na1AjfDgVQiJL16JjdE8w
X-Gm-Gg: AYBFou2XRTxtnaUVjDBEYxC+mSgQvdOhnFgoQFr+SQYfWQBJALbPBNnfIt9RPn3PeTQ
	866FcB0i/v0RYY26QXxDsBqpU9t2fRiVJP+73szPeT86hEo9eJIBPuf6W7WyqtfZI09MwpEpMVh
	3CUep/t1U/LIrSdi5RVfKu0aAibDkKh4NkYJzkNL5Az9bGW2Bmq+6mbQo4/UR5vA4a5Ht6vukwT
	LIdwZXD0MVmUUld8L1hlSFVCFsMzt3DS4Yuk+BX7tPVb3kC5vtVeneZpNqomB214YRQ6h6v7Ulw
	zsDOKC2erCzSqujkHkLi2SyWUudW3/QQPjXaoPNf6AATmTUr5NRoQOmRXG/Z9O+kIQ2KAqhZJdt
	OuFxDbOOI9cG/tLD4Q2NK+Dr4XUQz/+ctKSgAgGxuPKNH8plY5mbdOl4aqGK+HdIEz17nHszhiZ
	6jlMrgCtboo8+q/XUZvjsGMcmvF/Ls31pJCOCE5DVQlJ1qJkowRmmHrv6x2B8i5bK08azF9/akZ
	NYfZpIOXNLsQwYi/L36TVNfcws=
X-Received: by 2002:a05:690c:a1ce:b0:873:5ddf:d879 with SMTP id 00721157ae682-8735ddfda51mr3006527b3.68.1788530583624;
        Fri, 04 Sep 2026 07:03:03 -0700 (PDT)
Received: from dave-desktop.lan (modemcable053.177-58-74.mc.videotron.ca. [74.58.177.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149ebe7d6sm18527947b3.19.2026.09.04.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:03:03 -0700 (PDT)
From: David Collin <davidcollin899@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Collin <davidcollin899@gmail.com>
Subject: [PATCH] usb: dwc3: host: fix props[] overflow and dangling xhci pointer on error
Date: Fri,  4 Sep 2026 10:02:58 -0400
Message-ID: <20260904140258.154204-1-davidcollin899@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

props[] is sized for exactly the number of properties dwc3_host_init()
can populate, leaving no slot for the NULL terminator
property_entries_dup() requires when usb3_lpm_capable,
usb2_lpm_disable, and the <=3.00a PED quirk are all true. Size props[]
for one more slot.

This also clears dwc->xhci on the error path and adds a NULL check in
dwc3_host_exit(), since a failed dwc3_host_init() otherwise leaves a
dangling pointer that dwc3_host_exit() dereferences unconditionally on
removal/shutdown.

Fixes: 8da7644493b4 ("usb: dwc3: Specify maximum number of XHCI interrupters")

Signed-off-by: David Collin <davidcollin899@gmail.com>
---
 drivers/usb/dwc3/host.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b..cd1e5204a 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[6];
+	struct property_entry	props[7];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	int			prop_idx = 0;
@@ -219,12 +219,16 @@ int dwc3_host_init(struct dwc3 *dwc)
 	return 0;
 err:
 	platform_device_put(xhci);
+	dwc->xhci = NULL;
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dwc3_host_init);
 
 void dwc3_host_exit(struct dwc3 *dwc)
 {
+	if (!dwc->xhci)
+		return;
+
 	if (dwc->sys_wakeup)
 		device_init_wakeup(&dwc->xhci->dev, false);
 
-- 
2.55.0

