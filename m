Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16421525A92
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064124; cv=none; b=X+/L9D5dCAR/SFZ2N/2hGZysPVm+VsDXXl6RinWoYq+fVpjRQvnuFA55AF5ZrpII7GdVNB75/Q8r4DikxHsPRY6xF8EjnY4DyBY9v4jllZJ7ShMDmYDIIZ2V5g4kztEBaG/TsWLuz6ZcrlL6U3lw7qjw5Ni6gW4F3g275r/JzF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064124; c=relaxed/simple;
	bh=2W7J4uciibwZjfedWf0nIKQ9arloV2QAqcu52OEo04Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TN2DfFS1D1xKrJvTNZrOQf1ZM7qbwtU8spLs4lVMLVVVIYeom3/G01U1cXdo7w/5+hZF9nWVjKF+1ZULnc0z35UscH7QlyvQpvwirA2vhnqn0J233d+Y55nPmnzB0O01MnlSeYezH0WGRJbsxFaBiXDG3poYLh/aDu3OOf71wmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQL9e2fF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQL9e2fF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso2575385e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064099; x=1790668899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cUwmXn/jLJ9RJT7pjA9WmiefPpGzIu17sEQJkrs8eXE=;
        b=mQL9e2fFJlcQaP2tWvPb5kX3i+wpKhtOghrA46WaLa6ivFGLYNN++cw/uNYWHvMBaB
         BHDMyhMWJS33O0Dh81XRhtzn1njUWH+lb1S8pftaQ8lPnvR8zAAu29VNIHadYI61lbh1
         Upgu859BD2nQuRnzcwP6cXJDxz8b1OhIhYCi/SbTij9O/zLL2Hs81uTt6+SMnWnRR5C/
         kG/SRoHBVkk5Br/KWuasLGfIV9xckgFFkc3TSm8gVFGtck8Maq+G0hGBdTXOR/CEp03p
         mKZ3iMqXx1bt7RZ/pTrycxWcQO+7IhKm7KXx3gYIxzMtk+qpDk0xPvHSqRF5ykQEbT32
         qtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064099; x=1790668899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cUwmXn/jLJ9RJT7pjA9WmiefPpGzIu17sEQJkrs8eXE=;
        b=eKhnh3PADltOjcFYgHEvrCE0ip8GKD7ooSiNsplBt35a45Ffl8tnY1Uuw8wPWAXg92
         7B6zPATDeGPdHOUSG+3nEpI0o/d1NnxYkXjBHgOp1OpxJAESOUgLF2hJ/o8S4K88a3vD
         TFv9DVpZclBgTmfJiO05J+ZjwTT1zIJTY7q2j4QyCDHdkYxovU5mOg/PD/5vglcecpLj
         z+ShZWBnnCUreJATzoM1BGCSjY7vu5iSQordcdV11HdEWn4wMPOmXqsq/NloiZROGdn1
         KAXXGV3FZs7qUGia5YiEc/WNttENjVocLiVBiaHLk6kN6SRWLx2BXMDC5fpYOT5ZMtKc
         Uxng==
X-Forwarded-Encrypted: i=1; AKwUvBzHQV3DAF6ihgypTgjnmh7pZ9OA0khDg3IRkQ0UVxmP8ekfGsN2U3xyN8+YKn5Qr01YovEmtTfHiWsMg0g=@vger.kernel.org
X-Gm-Message-State: AFuF++nGjrH4PxJRfAnVZqvTQvm7C+4aReqsFCzm3bzGdnLBVqtaudF9
	3lvdRbO+aOaG4Z8nAUH/WCosxGi9OoGtvR1Rppp50TxQl3f25yTyLsEn
X-Gm-Gg: AYBFou3Hf2F0Xi5BLispKqVdD8hK2udR3IQWep6bX61LZ/msooZI0nRpws1Imt/skpm
	uaCqiHFcBWGYN7nxinFV8fluYZg7ScrzigvI/l2hya1hzGvg4PEK7qWmz59q7QIjDxhM2X3BnQX
	DUBBEegU2MR+zWtTGtNlLf/iZW71AUwE8OpFu/RCnTRBSQJAuswwQ0xxCmDnx00e+FSrL7k7xh6
	IkgMMOKeGP4CO87TE9h1eKWGy42irHKHv+v9N21BKCNJN8SGfBezTt6tealELXgVWW8n4Lg8GZB
	EdqTzAKy5BG0WQ/gYCwSiKvqiZGf25GUmdUBnkldbdlAQCsBv68XeMEhc7/BAmhCJtc688KCoxx
	JVzU8z4bTliw/Sq/dA+az6y/7fyTZQa/S6skF6JPEzh5OBcfDxcb4abCNFfc2xtF6zqzQoeyuKf
	ZV8UX1O5s5pugZdNodTqewNJ4QZFx+1JH30CyqUzMRYzFyV7grZ4QM95Ffub3AUkJSjqnzidfc8
	im+Dk8GHcz5lcywjpxpAJk5X6IAz20EWBPq6lFEgoIqx+r1ltpQTVraZfu9vMBsrfREsQ4PuseR
	Q4w=
X-Received: by 2002:a05:600c:a00a:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49fc7b83237mr163730805e9.0.1790064099450;
        Tue, 22 Sep 2026 01:01:39 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B80530056971C6280202175.dsl.pool.telekom.hu. [2001:4c4e:1b80:5300:5697:1c62:8020:2175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf97e2sm18248625e9.2.2026.09.22.01.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:01:39 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v2 10/11] accel/rocket: register a devfreq cooling device
Date: Tue, 22 Sep 2026 10:01:13 +0200
Message-ID: <20260922080114.44662-11-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260922080114.44662-1-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With devfreq driving the NPU clock, a thermal zone can now throttle the NPU
by capping that clock. Register the cooling device so a devicetree can bind
it to a zone.

The _em variant is used, not because there is an energy model today but so
that there will be one the day a power coefficient for this NPU is
measured. There is none now: the NPU core nodes carry no
dynamic-power-coefficient, Rockchip does not publish one, and a made-up
number would be worse than no number. devfreq_cooling_em_register() logs
the missing model at debug level and registers the cooling device anyway,
so what this gets today is step-wise throttling with no power model for the
IPA governor to use. Measuring the coefficient is follow-up work.

Registration is allowed to fail. A kernel built without DEVFREQ_THERMAL
gets a stub that returns an error, and losing throttling is not a reason to
refuse to drive the NPU at all, so the failure is logged and probe carries
on. The cooling device is unregistered by hand before the devfreq device it
is attached to goes away.

Assisted-by: LLM sparse checkpatch
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
v2: wording only, for the shared table.

 drivers/accel/rocket/rocket_devfreq.c | 25 +++++++++++++++++++++++++
 drivers/accel/rocket/rocket_devfreq.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/accel/rocket/rocket_devfreq.c b/drivers/accel/rocket/rocket_devfreq.c
index 871fa370eb432..c81887734de77 100644
--- a/drivers/accel/rocket/rocket_devfreq.c
+++ b/drivers/accel/rocket/rocket_devfreq.c
@@ -3,6 +3,7 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
+#include <linux/devfreq_cooling.h>
 #include <linux/ktime.h>
 #include <linux/minmax.h>
 #include <linux/of.h>
@@ -446,6 +447,25 @@ int rocket_devfreq_init(struct rocket_device *rdev)
 		goto err_remove_table;
 	}
 
+	/*
+	 * Thermal throttling is optional, so a kernel built without
+	 * DEVFREQ_THERMAL keeps a working NPU rather than a failed probe.
+	 *
+	 * The _em variant is used so that the driver is ready for an energy
+	 * model the day a power coefficient for this NPU is measured. There is
+	 * none today: the NPU core nodes have no dynamic-power-coefficient,
+	 * the vendor does not publish one, and inventing a number would be
+	 * worse than having none. Without it the EM registration inside is
+	 * skipped and throttling is step-wise, with no power model for IPA to
+	 * use.
+	 */
+	rdevfreq->cooling = devfreq_cooling_em_register(rdevfreq->devfreq, NULL);
+	if (IS_ERR(rdevfreq->cooling)) {
+		dev_info(dev, "no devfreq cooling device (%pe), NPU will not be throttled\n",
+			 rdevfreq->cooling);
+		rdevfreq->cooling = NULL;
+	}
+
 	return 0;
 
 err_remove_table:
@@ -468,6 +488,11 @@ void rocket_devfreq_fini(struct rocket_device *rdev)
 
 	dev = rdevfreq->owner->dev;
 
+	if (rdevfreq->cooling) {
+		devfreq_cooling_unregister(rdevfreq->cooling);
+		rdevfreq->cooling = NULL;
+	}
+
 	devfreq_remove_device(rdevfreq->devfreq);
 	rdevfreq->devfreq = NULL;
 
diff --git a/drivers/accel/rocket/rocket_devfreq.h b/drivers/accel/rocket/rocket_devfreq.h
index 65a9de6d37389..26a3749078b9f 100644
--- a/drivers/accel/rocket/rocket_devfreq.h
+++ b/drivers/accel/rocket/rocket_devfreq.h
@@ -10,9 +10,11 @@
 
 struct rocket_core;
 struct rocket_device;
+struct thermal_cooling_device;
 
 struct rocket_devfreq {
 	struct devfreq *devfreq;
+	struct thermal_cooling_device *cooling;
 	struct devfreq_simple_ondemand_data gov_data;
 
 	/*
-- 
2.43.0

