Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512588;
	b=xytydlt176n1MSEKzIIAEYdgsFP32nTTnTjrlMgGGzB7Op6DcDwPFMXk+T6wUUq+W9rc
	 lKL9wct5itZrbHu975mrxyaDU60CTYjVeTX7XcaBFcD2pRafAWwCR99VW2xBdcayfeL4r
	 CbFlW5w7kVDNUH6OEuzSrGBvw7ojh4gqyET9XfgsEJ8IHoPI0s0sLuOvyQE/nBf1DX+fc
	 oqCXeK45YGgxSE+H2coJ9ToNfwNvHqXxP//IhzeUlOv3u8kpBgf89BWy+lxUdDuoGxjN6
	 2kyPDsdbAW1z71zuqAyHnky9zrXiZ/IKSN3zu58d4seSUl1tuGs9AwJhEFfPdZrmdEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DJGF1ENXz7WHGgtPE7LBzn5FS5QXMa/W4WvKNc538zI=;
	b=K1Pkkny1m5IEVSAT5v8OL595zqwuP4sweKYWLTx5C24gBQrlwGbQ+UFSNYeYD5CG2xF5
	 RT/5AJ0953QlvvslVcQaOKTfDmTW8f0VFRrv+Wfy3KHxmbj17mtnKMN44lAYCtPRjuA/z
	 l3gROnRARbSs0srBMpN/pwNuE25ciOqRjRurFI4+2olfje2+5HAhN0zbhTQZVwPnmhUmz
	 d9biTgDQC/V+BZxl9royCOOIKc48gqZuPPuvBmMrAAe89WdHQTTasmMtWgsKjZoc/2BWM
	 ggZU44/Gi7melvUdAc0ZkxUOzcoIRS/H7BmKNhVI0jrvTe1WwXLLHIfBO/HmKY53hKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YzNWUTLE;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F99606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F99606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YzNWUTLE
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd60d155070so1532925a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512587; x=1793117387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJGF1ENXz7WHGgtPE7LBzn5FS5QXMa/W4WvKNc538zI=;
        b=YzNWUTLEQxZMo6pKMot5ZCJr9/GVVKDE7+0WSB8xM7HnO8wEuipdfWoksR/65/B8rA
         4k06ygSt31Mdr06/c+iE3Cj0+QSat5PaBn0f48+yy4oc3pmmg0qpVyl0wCTNiGWBG6re
         YnT4G7QyP0y5XDuCKAsiUrpKsdFz4fvya1xeR13fpjB5o0yO3R0nXanZT8/VZCSv9sPM
         ICtQzZPqN0dL/ccUTWwHT25QXb7V6hd9Bu2cb2E4qvtasJBDY8TNKaZmQjbF+9wQEe6f
         h9FQmmfdgtoLgfR2rjZLqEJejZ4fHNh7bySHZLaGsEUlrdpcsNh0SIFeaX4MIfh5jBPp
         n+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512587; x=1793117387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJGF1ENXz7WHGgtPE7LBzn5FS5QXMa/W4WvKNc538zI=;
        b=wui49s5VyzLFwihwOI6khNgQ2lOs/sUro+8R7usmzDK/i9uXOAFScqsxf1GsjtFld/
         9zWiedXeC7aWPuYdnJ1DVsy0n5K9dgJVTnrQPVnfGPd4kI7MZqLPKeBO95SJoFfE0z+L
         h8u9LbuUwOjh5FTY3oMsKXXts5LA7Da10+Dv/en+hQDqco62ab8CVzQLxQhK99e4uif8
         Xz9LYG/w0jE41Q2py5obmSPm4ccXWqMAnxYxU5v7FnG2o6kWeTnNlXFhoJdnFX4c/O1s
         PfSmltStyMYxqFudOrQwfGmDTu6rwGyCIFzZgbRSg77vqVMgliEiDBllcW19qjoqiVY/
         Uueg==
X-Forwarded-Encrypted: i=1; AKwUvBwQbtNL2BDiuv1CgsGN77MiMsGyKCMugx4vq7I1x2KTFqaOVXp25uJsR8n9akPcIXOwkvBBXeKNFGNA6g8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeefQO+/V034ISE1bhUSCqVzXkkN9X/DHCLWINxvpFrUeE1Rq1
	LB+ume+pogXHnA9LOyf1Spy1pb5hX1VvYS+gB+ag/LU0yIVrVv/Y5Tmk
X-Gm-Gg: AYBFou0OqXxVrQDBy6deR/a489I7GIGlpt6wzA6azcteo9ATFo4vczZf1IASt1ooICe
	bjurGabZWvirj5T4Y/IEJoNw/7yknLFd+7Zr0/qxNNJu5/i5QICPnXe4GWvz4AxpdyvgYKOtRnQ
	llLAOTn+D5ewXzY54WxHen6OhWSzdXrjwZPBDItTP0WDYBQcrAbKfOlzqUN1siW2lv7mMb8ml69
	7LALR8Q3WPHYsp5SGnj9nNwYthbe2VGAhqPdE85GvNAU+1muTQTMLzmuqphS+QSiVOxVcZZ9zRw
	MfbouzkgozGqSuufe7hIun2GGfkFuE1tQyg4T4WVcI+rIlJbKEaKOcd0Dsq495M/NzOGuLphN3Y
	AlU7M0q2gb+/6WdLFRRR7yltj1kfqrWmti+cliD94DPc988R4Dt/f+6h5ICWqg6it45vd3Kgy9K
	8xDMEB2RqGcGra5cggPd0s6Xt+CsZbozoAQBTKbUUsrDbv69HEVVRo/2sdblebcJ8j+vEyj93BZ
	Fz9j1n1oATIRcAD9jAO5MiB7kSQW2+NjvUncSrx6o/kqr/Pxq29jwQNBexVe7tUe8acHluAUA==
X-Received: by 2002:a17:90b:2811:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3acef6681dbmr9749041a91.67.1792512586951;
        Tue, 20 Oct 2026 09:09:46 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd403c212sm8456516a91.4.2026.10.20.09.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:09:45 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: mail@mariuszachmann.de,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] hwmon: (corsair-cpro) Cache fan target only after a successful command
Date: Wed, 21 Oct 2026 01:09:41 +0900
Message-ID: <20261020160941.36787-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_target() updates the cached fan target before sending the command.
If the command fails, subsequent fanN_target reads report the failed
request instead of the previous value. For example, after successfully
setting 1200 RPM, a rejected request for 1800 RPM returns an error but
leaves fanN_target reporting 1800. A failed request also replaces
-ENODATA when no target has been successfully set.

Update the target cache under the existing mutex only after
send_usb_cmd() succeeds, as set_pwm() already does when invalidating
the target. Preserve the previous cached value and return the original
error on failure.

Fixes: 40c3a4454225 ("hwmon: add Corsair Commander Pro driver")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU with an emulated HID transport through the
actual corsair-cpro driver and hwmon sysfs. Set fan1_target to 1200,
then reject the next 1800 request with -EIO before applying it.
Before the fix, the write fails but readback returns 1800; with the
fix, readback remains 1200. No physical hardware was tested.

 drivers/hwmon/corsair-cpro.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index c09645152613..f9e8b7a0d70a 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -214,10 +214,11 @@ static int set_target(struct ccp_device *ccp, int channel, long val)
 	int ret;
 
 	val = clamp_val(val, 0, 0xFFFF);
-	ccp->target[channel] = val;
 
 	mutex_lock(&ccp->mutex);
 	ret = send_usb_cmd(ccp, CTL_SET_FAN_TARGET, channel, val >> 8, val);
+	if (!ret)
+		ccp->target[channel] = val;
 
 	mutex_unlock(&ccp->mutex);
 	return ret;

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

