Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346D3B2FE4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370170; cv=none; b=nKCv27iOOUhDEIFZqn/JCvfpKH0s3D2xPRc+L2/6LtyBZBSpxVqQP9wFGDG1j/YQCotpcFXWGFAsOI2WZKJxhKfNBmlsNJVsp4bNxXJSwEUl/twLr/V2QbZM069XrE2+hfG2R8V3jfbKAKxcIBKGj0j3Cz0pm1Ojy3KWMlj2mMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370170; c=relaxed/simple;
	bh=jSJaAsJ9GUyAudepjyD7M4Zr0u8277gmamjboG8joAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZONM4IZE75ccTBGbdtnHnwxZPVF/iWVzLhi2xLx2JV6NDSfawuhpVC62yMHFzdnG5grkirer4AMwbdppbciKlENFWyJTj1tEf0R34BeF8DDELRr13acsssKkzsc8xV0y5CJvUGm8TPV7kU1o6SZh7gDqrlIflPr4AJjnazlG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpGMclOI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpGMclOI"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48702adb1c9so218230f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370166; x=1789974966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK5GX+kDbjRMghqOTfEiEdFRpT8/kc5WErzxR+yMM5U=;
        b=FpGMclOI19dPPZv1kWaTpRxsS5VBFWflm8+HHxcXvQcZpAbWvPtF5m4k6UtKfjuxQf
         azw+kTgb1ig1kL5hZMhmNhiH6WCCMbwA4Yep6h+pXqBM5WFEe/dTmLkuhC35mRtDJD76
         V2ok9/BdUdkgu685BhxMwqCkrwOUTcdKgHiLneW1w347HptgWgJalTXt70hP/CziDOUr
         7Y1sXxwQIGN0jm1UsrPwclAbGKX3+pZyDMKAWqhWJM5F2riZciDl9aYcXNI1M60OgjK1
         Cx75BO8KJ2v8srgKIICFFJtNJLxt2sDZ7ptCKsb48YWWZKVl3nVwCAVhAxG8W9ZtRNEf
         cnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370166; x=1789974966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK5GX+kDbjRMghqOTfEiEdFRpT8/kc5WErzxR+yMM5U=;
        b=Sl4Wo8J9rMo55lOf/mQR0CMxSi48Mbu+FfKI//Xsee0gmwv3TGSYSEzjnIgg+99Z4E
         BFxm2GA81424dFHWRvKevDcoinjuYDPAoJXwXVa/0wRbZAhug6Dwneo1wf5CfXXNyuGr
         ZvMzkMalG1QCefXkO6K4iq4iLxkcS6+izi5e4RIUtIT3YXUA8hBFCPDRQp7808HUEw/W
         /tLuuYQwoi21WAVLMl6xKumvsUaGGljjJu98E915Ab+sLMnubWtNtdvzhZoUiBK8fYWd
         IKAVkxOb0sQ14m+6DaMXQOPX6flOIekrlca37YOh2847uXS9pbT4DqKvFT6FN+AxV1qJ
         dWaA==
X-Forwarded-Encrypted: i=1; AKwUvBxpCoivXuw81p2Eq0CFahjSMF4ybQC4M2JwT3Akw5IvdrAF2DO8i3pWvLzKt06RAJQXzPzTz4/FYWAa3OU=@vger.kernel.org
X-Gm-Message-State: AFuF++kggVazH6LQfk0ruAwcc2KeuepDaEhLJ+2pHIWZfRBsrQ9AQ+5G
	H2WGyvaTFBuqup99V0TqKi6vm0fe0/2ylYHUydoDmcKDVUgfhrRtMxJi
X-Gm-Gg: AYBFou0lAAD5YBIx63LySmdmwgQFabKYRcnorA7G75pkduDIGv/Fk8isCMDKcaxSK0Y
	LMdBUaBMaH/pkozsP12HAa9UXZd7omUSwIV/DAe4LXKXAr2FaDnsHXUCaux1y/rrTEZgn7VjVDP
	wVgvB20pb3JrIfi74S5OBLyQIfREmLxyu3SCQkVZkqnCPLMCLWqpRlEJau4hfCIvg7YnNoDLnei
	a49jLYMsz/5PVVR6xtRUXuE9/SQcN7/kbmnUeyicAcJkBtFlLCIB4ykzJBHsaLjD6VMxFK+pTtB
	jK0db1Pikk98U3IY6+CF5tOxHSaK7JY4aAh9KE9HjRvu55JcDIUJM7h23QS2gBROgO/+thLP0Wo
	I8HRjICW6mLOkkLmOAX6zyQrK0YqP0+q9Wduxn1UE0bnV/oV6WqWBz9yYSkSP0rEgVFV+tFZ2yU
	Xa39gexGdVHCrRJsCQOVtfUuryH+UwQW92Dr/2MoqvPCLW6pDI0F/HvFwd3qmboI3jxlPbtQHgk
	COBQuD2n1JuaaT8o3IFQPRnED1LkR7+QIhxrNcboajd76lbE/A=
X-Received: by 2002:a05:6000:288f:b0:487:402:6cfc with SMTP id ffacd0b85a97d-48704026de1mr23621f8f.4.1789370166042;
        Mon, 14 Sep 2026 00:16:06 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm25161082f8f.29.2026.09.14.00.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:16:04 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next v14 2/4] ptp: ocp: fix dpll cleanup on probe error
Date: Mon, 14 Sep 2026 10:15:53 +0300
Message-ID: <20260914071555.11684-3-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260914071555.11684-1-maimon.sagi@gmail.com>
References: <20260914071555.11684-1-maimon.sagi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two problems on the dpll error paths in ptp_ocp_probe().

dpll_device_register() takes a second reference and stores bp as the
registration private data, and only dpll_device_unregister() drops it.
out_dpll dropped bp->tracker but never unregistered, so a dpll_pin_get()
or dpll_pin_register() failure left the device registered and visible to
userspace with a priv pointer into the storage devlink_free() releases a
few lines later, as well as leaking the registration object.

A failing dpll_device_register() jumped to the same label as the failing
dpll_device_get(), so the reference taken by dpll_device_get() was never
dropped either.  Give that case its own label.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 401b04f12d2b..f4299878c27c 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5124,7 +5124,7 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	err = dpll_device_register(bp->dpll, DPLL_TYPE_PPS, &dpll_ops, bp);
 	if (err)
-		goto out_devlink;
+		goto out_dpll_put;
 
 	for (i = 0; i < OCP_SMA_NUM; i++) {
 		bp->sma[i].dpll_pin = dpll_pin_get(clkid, i, THIS_MODULE,
@@ -5150,6 +5150,12 @@ ptp_ocp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		dpll_pin_unregister(bp->dpll, bp->sma[i].dpll_pin, &dpll_pins_ops, &bp->sma[i]);
 		dpll_pin_put(bp->sma[i].dpll_pin, &bp->sma[i].tracker);
 	}
+	/* dpll_device_register() takes a second reference and stores bp; only
+	 * dpll_device_unregister() drops it.  Without this the device stays
+	 * visible with a priv pointer into storage devlink_free() will release.
+	 */
+	dpll_device_unregister(bp->dpll, &dpll_ops, bp);
+out_dpll_put:
 	dpll_device_put(bp->dpll, &bp->tracker);
 out_devlink:
 	devlink_unregister(devlink);
-- 
2.47.0

