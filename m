Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9F3AAF76
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462978; cv=none; b=ghbTgVn3auJTC+eV4Wornu3DZsRAph25UId6uCROYuQrehBFS+lFzsH9+ZtponE7NS3eblKGfGmsT5OnXqMzS8kXvD9qaVfu0tWSjmJ6d3uslQaAeIlC5Zu9j8vxYr+Bjt0SW8XBXhFE6qT+PFGTZLKfGEvGXS+/Cb+0CmtXBIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462978; c=relaxed/simple;
	bh=WHzBXw3Vfp/jx3HNdEqzwg/ei+fttabtBIAcfjiy6Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aa8YP562NS2MU6an/K3nsJ5S5nkbKj0RDigUQ39tPNqFxUSnltCgA0zFGFq/+mSmIZ7kAMsgt5ZWa7qpKEFevqrFStmeg/p6QoLDYpktOdtNa2sQr9a+12AwBpK7TGiCVKxDuH8C3Mhc+YZs4vxaKjAVKujjnYxK/sz9NxpTjWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfK7t6Sq; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfK7t6Sq"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so7550466b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462975; x=1790067775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=;
        b=AfK7t6SqrhvJNGvaT5XeMxcFQ7vRkJOrN8YQ1NATGlhuZ5sBt2jPARvZe6RNeka2At
         29/6fWT/Wr02orRNuebvHyZMyz/WynCUvdLyteq2rCn4e0lfB7Yj9I7bm3qHZmckoeXc
         +5AEZvMmwr0xjhndzUZeHYM8KwfsXqDsaRehdoJoDYBn10h1wYCHG9Wl9EiYtx37spn7
         ZkO1y4Rs3+0UiCH7taognZx1+sbF1UEgIryTredC0xTaFXEBPaNkp5WoaopnBPZEgM4r
         /J/KRVAk7UaPbpgS4fhFen9rEP1i/S2tLd0lQ2/Db1Z/QwlAga3MPaHXUOTLT4t6ZuMA
         iO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462975; x=1790067775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chLjM5CTnb50HHVQx65I0WAjKAwm9kU8MWpPfnwKwJY=;
        b=Vg3dPvCjJ9WKF0ncINF71kASo15ZqVvQnVua2hfU6IsNiuHYGibiq+BP3dZpY3X8NP
         6QDRRxi3E6bYAc0s+Nk8E3CEZTIVx+wi9UbLvd0mi49ptGrJmt/9U1nJxNvg9m9zGY55
         YWGF1AcA4t8GQruCmUnImwgQURz6ILStZJGz5XKRlci7Runr09UJwBO4KFqLSesBNNW+
         FFziUxPjTAvdXuCT6161747jVaGiwgNYcRFvFshV3ge7ksFJpcbdZK19gGVZAzPA+nBn
         QcW536qs5N9aoS9VpGZMXMM6IktXLFSKv+U0MF0GW4dMsHARaLrBFvqv22dWEF08+lFU
         J6Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxSARZL5OE+t8CnbhfMBhMrlo4IOoCqKPwk1a0b8sJuhnU6v0OhZ8l+osD9fu8ZO7O6sfAqqcwFGbjIzAs=@vger.kernel.org
X-Gm-Message-State: AFuF++nG+kFMS9xd5GFtOvHHZxMHugIckTO8YgzCwG/f6p2x3LnBI5ip
	HJR6XGhooVTcZqckACo3SvxPqeJjfcND+MLuQ/H85Mx/E608gZsVI2Bvwl73qyEbxdwsLg==
X-Gm-Gg: AYBFou1tgdg5xawkTQIzPczT9Y3y617uL09UktOAduljICwt2TfCR5eG96CMtpiJEsc
	YKUh7K2lVl3ljSESS6UGgslFpQOqL8ZLd4Rq1J7R5/wYBLdgsT72CjMjgF7u/Py2D7pPgKOTpTE
	6BVd3EDg2o3syH1ufWxUqn4NH9CPYrgneerWnhdeU1f1JFyIA84pYgwvFn4iSHr5zpM3hQ0JmHS
	5cIPQkr+bGaDD8t4gbUkXVQ87RhAylVadWvzU5pXcye/ObATylxOpuoUe6tb4+ucfjRzQNj4IyM
	0VRUCzjd3vnTezTlCtCYlc04v/1KFI7aX2Cp9lH4Q6UX9iiDQPkap0q7M5F+Fbfhb7WInCJU3se
	zjTXoF1AGj9c+h75+qxAe9SLqyU9eh6hoOQMh3yWXaGIs7LJWRLql/RIMkb3sX6URnVWq7crJdf
	xasnB5UUO2ry1tf2j7ST9cF5HhnG8VPEqqXTg3odSke+4jPoooUbTlGYI5zPjCIjT6SIVpZPIbW
	AqqJh+FbEL6hgvC95W5msgGAoOM4nVqcWuCszaJvTgHIF4GdRftBSlDD3uyBrcjIJ9iWh4Wiwcm
	z/ZnFhs6Z5fGd4cSEsf/MSYPrVIl1aachP9Edq/pN5MKbY1QBT7OgjjX0PqQ9aS0+1ggx9VquHW
	jFZHycdCwIFaj7nAl2Ed/BjMNXCGKyJ1OCaamOzPzbp6fesYF4oDpsiAWiYTPuLSA4se0lIqFrx
	nyuVJLLh6wIII1RF0ADMtatAJ9ic3xOkoAHpgDLiFm1WbTo8Oo8A0Hsrvi5MaRa9axJWYU7sJxk
	8LFyh8hUEw=
X-Received: by 2002:a17:907:948c:b0:c29:49fd:c98 with SMTP id a640c23a62f3a-c29d7926fbfmr13664366b.32.1789462974448;
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:54 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 1/6] usb: core: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:18 +0000
Message-ID: <20260915090223.1346-2-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fail label in usb_new_device() disables pm_runtime on failure, but
doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: fcc4a01eb866 ("USB: use the runtime-PM autosuspend implementation")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/core/hub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 3345b3298daf..dec6d5c49759 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2745,6 +2745,7 @@ int usb_new_device(struct usb_device *udev)
 fail:
 	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
 	pm_runtime_disable(&udev->dev);
+	pm_runtime_dont_use_autosuspend(&udev->dev);
 	pm_runtime_set_suspended(&udev->dev);
 	return err;
 }
-- 
2.47.3

