Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690359;
	b=bChfUc8bNHcW6E9B4k4yiSDAoZIeAfemST3DY1n2sD9vw9LP6ISRN3/4rOWXRmZi6+IO
	 SMBUQk16bSIecOlqhulsXWfF627y+CShaOPCZvL53dBqSxgMVEFUspPwJaa+wCjmQHfZo
	 a7dL7Tz8GuoSlTF218yWR2gy0OPfuR7FctHVetgJIN9mxsb3+n4zpc7BCXBE+czxaaGJi
	 0SFNIbZns9II9QFmF4j2dr59OmMQLshUML0XjG9btbugWD1rSsP1lgh9NV6N5DlencuRo
	 2ap3oF4LM+yeumAe1dw9sVR7CRjLnh3AxK/Vk/6FcRYC97dXs7F/7KHam4cOF++6YhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5TTK5L3C72RVXuyCfPoL1KiCUuBlYM9fSsQ+OoWqJh0=;
	b=owcxF162p/E7sTSG6VDuc3FMpVLQSDfeCzalqstOzu1yYUuiPV86XDTgEpRFzoAElbAK
	 UFtzutti2lfyLn6FTvC0mFPlh8RailyqH4x2QQ82zPTZjEb4KWhKqt9hKsygh/5vJznHG
	 si1RWK9pDG97s6qrjVhFUeaZrwVOYMm3EpUrOjDBf0MIPuvlV3DgN0RaupGB5rbJntKkn
	 FR8Fp47ELItIXHs6kNKjjpUTrV+8vLZIG1eo2fSdqmkp4xSptvUvs4UDTj8BNaCal9QcU
	 guaYqVFUHvWmQmm7WSv1NxuNQd1SqmdNhHhPEM1YPX7Li746Gbnb0mus7W4zNptMojQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eeCmVCgM;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D358A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D358A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eeCmVCgM
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso279105e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792690357; x=1793295157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TTK5L3C72RVXuyCfPoL1KiCUuBlYM9fSsQ+OoWqJh0=;
        b=eeCmVCgMegRCMD7vOlGg+I+VL7pQWFbhxv3PU5KxF6XDa0o7ajmM/7XY1L43p9HS5+
         itOL5APh7mnHzuXNFok96uju1BIDvogoYxKs+LNEoP0KzZqKpZB2h4aJiZfAoVBC9rXI
         OXBa64Ghjhyr3+zpRWSioZQBJ0F4UnFDPvOW8xL1I0c88FZETbuvhll6WKwGvxuDYd/q
         NjLKXl/YgtmD82fvvGg/sJb4Rb4nlhHaEawHymhU3n5L5dc4+7NXPF/gaQzxtJS1htSz
         38lzO8YmLXH2ksX3fpjcSb2gD+VyGT3rVqk4P5zdk3C8pUXkvGTDCmhsvkyUpHkOLD95
         0LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690357; x=1793295157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TTK5L3C72RVXuyCfPoL1KiCUuBlYM9fSsQ+OoWqJh0=;
        b=Zfk+dzTsi1OU/uDnnY3Z8HZDVKW9rm8eHMl3BnDUxnjHaHPrsgviAafkdEmlNnjrDT
         6vhq6uaiMHxAMMUlvEsSXZyxImiinX086rWafAkqGetd+0tI+sOMrL7GERmDs31Vht64
         sln0aiTXj96EcwevHa88pwiQrAqrL+wwFH4tgKLidteT47kZiwD2KXacQYIfUF7lZ+UH
         /8duRkZgnihtIbR6q6d770ONpB+WWhCi4uW/EANVr+ykpb1TdW3k2FTYnAEgp8yFXoQe
         MVsuWFPfgmdBkhEuu39D7YCRcX34gYNLnTwAXQwI9hXqnbQSEP/dEMMY49+yZQNdLcgB
         ZYxw==
X-Forwarded-Encrypted: i=1; AKwUvBxFdyy8sONHWLvPel7uP2sYZLjEgFj7SPQGbY1VpKqMgfidu/b3wTgDtuhFBrtRAbCrvxKeD2lI1va7IyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+phIWuGc7oi2BjTZTn9XYM+1kAR8GEmKbHNunO644q5ZwpUKc
	ycFcy4dGRJfd1Rx07Rs9nR/5zlJD3N96R5+rwwM/5EscY3PBmuzEnv2q
X-Gm-Gg: AYBFou3wqJQ1/7oWSSLkn9ec9OlUSj9hZ3tiVn6udj9HDqbjzCW15jrhzym8MqFHYFF
	LRYX0vDaQKGXzfW73UP1oQFfvyNkUwQs3giZQa3PyOPYDREcDdpOFIjCj5c9huBAvBt/dKqfFvt
	zKOFT/UjlVHloQ2oxXaCNzkCsqULQB0Fl/0bDTAlipPN3r8cmhTfWZiZhAVDt3d/iC/Df187CrL
	sLk0t/X1F9Uzd1SF/xXjVaLa05RD12M+mZZb0hcnm7LRNCSS6B/cb3cYq5jefdLuqQXL39bjeKQ
	of4CKLsih/V7BzCwMRi9m+7UXjWfT+WvhHCV7aZYUju0xB2jhXDMx/xEOeIZ32B812RhrrjPUR7
	xmFNKYmQ4tXh0CmaCk4F45szKw5GBRfO68To+1P9JcdcXiTMVedbYW2W49+2FdVeWHrIK55LuEr
	cpUfjoCwgSOjEBKHxLxIJhfMssMIB8ICVR0JxKhGyGzHGmS3sAAtC9Mf++h2Emi4vBZIOeKHYJI
	fdN0bKh1Aanr+YtG/0EkAXoyubH6HPf5eIe57XbsV1hFPzLcFmoiU63C5XhWB9ZzHRHDOctBfEF
	92Hxs3o=
X-Received: by 2002:a05:600c:8b78:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4a20cbec0d1mr26844975e9.23.1792690357003;
        Thu, 22 Oct 2026 10:32:37 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0d4sm13857279f8f.13.2026.10.22.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:32:36 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Joonhoe Kim <26rote@gmail.com>,
	Daniel J Blueman <daniel@quora.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [RFC PATCH 4/4] power: supply: qcom_battmgr: Allow charger changes to wake up the system
Date: Thu, 22 Oct 2026 20:32:24 +0300
Message-ID: <20261022173225.58-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261022164151.592-1-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
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

The battery manager notifies about changes of the battery state, many
of which arrive while the system is asleep, and about changes of the
USB and wireless charger properties, a charger being plugged in or out
for one. Only the latter can be worth a wakeup, to show the new
charging state for example.

Make the device wakeup capable, and set a wakeup filter that lets
pmic_glink report only the charger notifications as wakeup events.
Leave wakeup disabled, so that nothing changes by default: whether a
charger change should wake up the system is up to user space, through
power/wakeup.

Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result. The testing is
described in the cover letter.

 drivers/power/supply/qcom_battmgr.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 636d6f6acecc..7a783a3a320d 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -10,6 +10,7 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of_device.h>
+#include <linux/pm_wakeup.h>
 #include <linux/power_supply.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
@@ -1596,6 +1597,20 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 	complete(&battmgr->ack);
 }
 
+static bool qcom_battmgr_is_charger_notification(const void *data, size_t len, void *priv)
+{
+	const struct qcom_battmgr_message *msg = data;
+	unsigned int notification;
+
+	if (le32_to_cpu(msg->hdr.opcode) != BATTMGR_NOTIFICATION ||
+	    len != sizeof(msg->hdr) + sizeof(msg->notification))
+		return false;
+
+	notification = le32_to_cpu(msg->notification) & 0xff;
+
+	return notification == NOTIF_USB_PROPERTY || notification == NOTIF_WLS_PROPERTY;
+}
+
 static void qcom_battmgr_callback(const void *data, size_t len, void *priv)
 {
 	const struct pmic_glink_hdr *hdr = data;
@@ -1750,6 +1765,10 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	if (IS_ERR(battmgr->client))
 		return PTR_ERR(battmgr->client);
 
+	device_set_wakeup_capable(dev, true);
+	pmic_glink_client_set_wakeup_filter(battmgr->client,
+					    qcom_battmgr_is_charger_notification);
+
 	pmic_glink_client_register(battmgr->client);
 
 	return 0;
-- 
2.43.0

