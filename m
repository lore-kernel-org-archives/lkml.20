Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687348;
	b=xW77JoGDoPy4SMybhlZs91nrlRL8IN8Kw4qkrxIc/aCN+NCBUpCXC8vhCL96FnDUGqTa
	 8AYTyD+08BRWrxKVKibR2CufI9WZDnBiLJua+4lp/a0IlR+D1vVikwI36ZvfC97Gt9t2c
	 hb6V/HPOjJH7ApKeGRqtIRsyXy2fmWewXEgkurugRKpvjvx+jcqUeq3dIFaCewe0KqE42
	 Zzo547FF6U/7NWvMR+Os8QdTtJFsMLZoOvX47APz6YwfMHjsXhpTN7tONjwuMeGVBlpo8
	 ghnpB0dQeDqMjZaHzDftaBAkX9TZ0iQ5yjiY1aVtSyywltYGWJw+gTtnchF5VrnccpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zblh9RJVoqtDhwxOvvPdwA42GF2EgXCszh/ysjfgfTI=;
	b=owxVQpEIsKJXr4uTNkOOa1KXDAcZOAAKl/OLU1YTphmo6nkTXwM5Br2UPrVVLUTAWlku
	 7EV6wrtMzAuefHOXh7+zMFI7LAzbllXNOTRvHTMARD9ga1emnqByspnYWKQzyga1vY4yy
	 A/t5pV+55P/A2NcCFKVrtMKMNVk1y6p/cJfaBU8vkju5axK+RXX5ZMVvF5zT6qj/hKLvQ
	 ptQ7oNwc2Y9bQu8/bF6d6kF6Xa++jL3DtHaox4fEe3sNv24meH2NR9qHqicAz0mxl9HJy
	 IVWJ27LpEgAG96qKDDxJg0ZBEAoIpUD7vpPpFtfCvCCz46qlT/Ov6LQ2NZ+8LxxCNyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HVUIURyu;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04716606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04716606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HVUIURyu
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e00eee27dso12719f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792687346; x=1793292146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zblh9RJVoqtDhwxOvvPdwA42GF2EgXCszh/ysjfgfTI=;
        b=HVUIURyu90T8GjQn2XXazP7dCqrkiXuYpUxCekjY7600wY09bAmNd4mE46R5Ssogk2
         CFN6+ZBuNhKlfANZH2F9nzhjn71dnyQbdos+w+SU0yfZwElm7P9o1S4gULAkrdjPI7UL
         XTodH5b6q94BoS+3Y98uhDdz7YVJrYmsHiJ7kyb3HN4vfUH8UeiU7tByzCLzy+8ADjRp
         3NZcDrkHTPmVWg7034QG1bqxqVpommIF7hvUmnY9VCBWIPRHvdgdY/cpWD7fMImCMFud
         MnRjBah85GPQEsKA2fKzvsJ9rDigodkvJHh/PImruCVzjkKI9SmsGI1C2TuEdOd/q7oS
         x9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687346; x=1793292146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zblh9RJVoqtDhwxOvvPdwA42GF2EgXCszh/ysjfgfTI=;
        b=v+jqHQ20cW95IszStH2oRbkUW1P67Ty8hgp+WLNCCXw3+vjjKnud3l/8SJvd4lksvt
         jTYn5+6jh0WrPCKPCmuEPCJIX0BGKLRWDONAEaXRoZ9qLG+tlJASPhlRWmcdZJJscWUa
         cEkgoDPl3pRuoKxDPUsJniOb/LQ1zw9TZG0UzEApPgSAloZ4Hz46G4XPwqLtjeR1ndwZ
         GUrKkgy6mZXxMWQryOv1c5p0x14V65n/Sm/zjD2JBK9y+2j8VtDxMtjGTY+1ykRAvTJM
         f6hqPznLH37Z55cB6S1BXY7u6TyewY1mTZnrkE/uuu8cGmAi59PhbbutGi4sesu/DwsD
         gjcg==
X-Forwarded-Encrypted: i=1; AKwUvBylocN7VlMTtrm33FOWHBXwNXiYvl/rNNqLtm3j2I2nxvzMs69MKRVDy25B6z3tt4yvIp9GHwIOeW6pKTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKG8B/esD6eAlqPGK0hLnOVp8Lfbwuw9/TqmgRYyVwGNF5do3xR
	q/Sp6fzUHx97L/x8owOupvjwv1svYRoUi36fRWdMC7l2Xy957pMQUi8q
X-Gm-Gg: AYBFou2vdSD70vNY8UyTRoQQe7QvsSp7DiJ6rujjoVkpj0kyAN3OTVMVkQtH00ZXOjj
	cMrPSFuhWw8+UU7ZWhXa1fW0oppgu1+sKDKJAOrt3G4pgFcfFWVTakkFGhn0VyZZj1kEb8w+Kp+
	R55CJ8bM/r+iphUvS2WadINgn5X1yql8/pRZYUDmQJ+vkPvevpOFG5pDmAsK1yblfuEOyO0IDa+
	BWaskrzw6VMV880TX4RuH9t+9hSN+4PcxIXNLyZQo2g8aeBdpQAXGVpK/ZWt+9mc+sFnACuvw9z
	1LRMRyJbqcuCaNFThO27PSS5gGSMAXxgEU+mp3PCXJ6fa9XMoXiTpjI5QtVdN8iztHRPk59BJ/a
	QoBd+ZoBeG2rfG5MAAL3DaeTmeGwxx+vNosKDMM6U5iiECXH8oLzns62GN44VTfdQlXw+vE2XMN
	5WvfwaSfkEdrLGFso69saiHVs3MqV7UTWGQq5uN1PHcimE89SQK6xyugzOIYweTTK+55IE/aMzc
	sec4Uar/CH1CnbOSUpzyRwomyF6he2GFebeGeF0iZUclQ16ZaYlO25zhUoEfhlN2yKkxqv8SVSl
	QECkhV/tm/bJQsMzOICiFUnUnuQ=
X-Received: by 2002:adf:fc4a:0:b0:48d:fbee:3dec with SMTP id ffacd0b85a97d-48e264c8742mr9406786f8f.29.1792687346264;
        Thu, 22 Oct 2026 09:42:26 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2584c3b0sm15040175f8f.57.2026.10.22.09.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:42:26 -0700 (PDT)
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
Subject: [RFC PATCH 3/4] usb: typec: ucsi: glink: Wake up the system on connector changes
Date: Thu, 22 Oct 2026 19:41:50 +0300
Message-ID: <20261022164151.592-4-tvlad744@gmail.com>
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

The UCSI notifications from PMIC GLINK report connector changes, a USB
cable being plugged in or out for one, and the completion of UCSI
commands. Enable wakeup on the device, so that pmic_glink reports them
as wakeup events: a cable change brings the system out of
suspend-to-idle and aborts a suspend in progress.

The completion of a command arrives only while the command is in
flight, so it can wake up the system only when a suspend has started
in the middle of one.

The same was proposed in [1], with the wakeup event reported from the
callback. pmic_glink reports it now, also for the notifications that
it holds back over system sleep.

Link: https://lore.kernel.org/all/20260722-ucsi_glink_wakeup-v2-1-b43dee56df24@oss.qualcomm.com/ [1]
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
I used an AI assistant (Claude) for the analysis and to draft this
patch and its description; I reviewed the result. The testing is
described in the cover letter.

 drivers/usb/typec/ucsi/ucsi_glink.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 1db0c88d817e..b03320f5a6bb 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/soc/qcom/pdr.h>
 #include <linux/usb/typec_mux.h>
@@ -455,6 +456,11 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
 		ucsi->port_orientation[port] = desc;
 	}
 
+	/* pmic_glink reports the notifications as wakeup events */
+	ret = devm_device_init_wakeup(dev);
+	if (ret)
+		return ret;
+
 	ucsi->client = devm_pmic_glink_client_alloc(dev, PMIC_GLINK_OWNER_USBC,
 						    pmic_glink_ucsi_callback,
 						    pmic_glink_ucsi_pdr_notify,
-- 
2.43.0

