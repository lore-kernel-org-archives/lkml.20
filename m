Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380207;
	b=sm6vhtWXzu0+WGwxWRfI5qsMRHk4StwDSzSWNv4ljR0X/Xn0TudTygfLfBCL22ppLJ7f
	 5VmUI6awTgGupfJhHXV8h/F/jQ1mhQMDyPj7ARsX0Ij9CWVlyBECNwwE+m8LyFDTtJitf
	 H85AUgShHtZnY9izgGKYPG8PC3bV8YIuLEqBwXndttxGsXzHDcT/RYA3Fd40IrX6wa8n9
	 h/MsxLWjnE7nlapfJp5kr1g8Ey8y0WLETcHFuaPlOblw8Knj1UHoh6eHnO6Eu+d37FeGT
	 W17FmvpZ+vMv5SovjrFwEgkeWMKQdVPy1ldfOLs6/65cgEby0aT4CofssVyMS0XFSDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=V0SudJReUigpH9kPPiuUeay8kYja2Ksn/VXL40qXqEQ=;
	b=SMJ+O64MyhuRoG5JoFhQ37laR20hCaEt2M9FGIcY2jcdY2GQ6O3I/Ap7ypwU47fSGh+h
	 TNDkD8oUyX+IAqkKBiUgMLI3IEoyi0aqZUhTn0BpgxnOLmkXa5t87HgwqY2eMHxkjMfBM
	 //1HrVJwg1476MXwbiU4Y1WnesX/EDm/h/RjM09lcMH0NSgJcAyjqSKLWPpB/sMgzfB30
	 xXbQ2j6erWC+CD2qJ7vgcHfLQAuS3I4TszFi+fty8e5mVq4zMZAJ8H51i4/Cggea9Rwiz
	 0Clq/P+k5Z5/L49zeEbrIjq9KuFe2vAb7hjYsHTd+ylhX+aYPu/rAlVKsIDcblq6RCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nksu4jHp;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538D0606C961
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 538D0606C961
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nksu4jHp
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so3679484c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380206; x=1794985006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0SudJReUigpH9kPPiuUeay8kYja2Ksn/VXL40qXqEQ=;
        b=nksu4jHpcfAOaUPAVzxMc0QPljS/0Fqs6XLSRw1eRCpkzQs0UC8pbStG7BXBxjZtZH
         TwdUecsQRvfFl1MmDG3lcmjb8WqBvxWlgJsEzdIZQKDSiYX415zZS3KInSvqsG/2h7mk
         zLSuXp0WyLzwemADh1gyL5tpydKh4v0oTfDrxNw4qhgJQ93FJQIjFT4TAG1k5uQNs296
         i1R+wWKNo9JD6XFhOiBNcej3RhF29pLmda3sLfowdY41qCSfGl+yQXWb9+OpOzxyUxu6
         q6gcUuyHW1FRDqV7uHKSID0yACzyGbxeR/kVrDjqyNfWqZuyt4jQOLrdyb0hazuI2NUe
         jMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380206; x=1794985006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0SudJReUigpH9kPPiuUeay8kYja2Ksn/VXL40qXqEQ=;
        b=DCFpLlyLTFYH6+RtZqRfGKrxP/2tifvH3r8hj/vpn45P85yGB2xq8jsvUuXWR1ftf+
         3PmEiw7KaSMZkaboZ78NfvVGVon1eOC6BKIP2U2LvPLiVQgfvf5ff5593ozZqEkC+He4
         CfE/AW1LzkxECXsSlH65Ihc8uOgOBEy0xdyemfwz0aiFWWDLrJYXWA+VSfZTcGkTZ4d1
         HEFfwLdygIiJrIhj+cQLNl7sztP0kwsu7b04d8BlOPDllGv3gcKBDKyTNHunf3rAIqrQ
         7YTlWzUINSBsVqHxnySQDuEZJNBaTb2ZU7vErYF4LlSHpYiSncbjj4+j7ORzQqDdMl1u
         YAjQ==
X-Forwarded-Encrypted: i=1; AL+hErEG32nrgUGiBjjeQ/RhxVv9ck5rIiB/zgFJLAEg56OnNWms/uXJq81zYMgYL/BInFMxAKtseJ/gXiRbMVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/23qa2EeYvT8gvV3dcCqF1IXQO9kUhC+ROMeMqnBlZpAqcYFTw
	S9f+SIpdbWr7dMc1EAs/E1SsaDyUwauJBCL9FKwgQaKhUUETiS1CBRZE
X-Gm-Gg: AYBFou18+RbZxZlRvdCzqbfwoLd+2OmL4lZc+mtwcn9fe86+qQAI+U73i5f0EyDfHvs
	RWnpiQQ1T257gT78rRXJFuaxfPnpdHMfU+Htcy+s6a7EoIuktvKo2ydwLKZaBq+FzbMhW7IMJn7
	bU4zds/tZBFWib1MWLJjA0cmyMTzoDVVNuO/Eb9M/DujqIT5n4XbIcNT7uM2IwDZ+aFemilrCa3
	B399ysEJw9o1vnsxrkVx6ol2a3QeSU/2QwW7C/xQ9FeR0R13Cars42++QOSejGOBGiap4tTCDU7
	t/+od8ylHz8PBqU5sjz1tnGo96mlE7yLYoV6GJ21dX/yh0W6l3rNvLDfOO32d2OmxNEGG6Mmfy9
	x3Fwb5E+DBT14Z8yVkNwt4GiJzlm8W1Go9WxAGPN8YTfBOMqxMyK3PXn3I7jP/yYtNXnCDACIos
	aMiIfQlnw8VS1WS/lFza1QuTC4sQxk2DuRkfMQNShY1pN0qqzf+/4rpY+nTbTbaB99dPvGLI6N0
	cvcaLZ2x/3YIiUaeSwrTO7cg6Xz4CO0WbxOudSDrXAt7qqdcXM5fIYV0fb050tJPq7limJd1vej
	B7SBfBZSBegLmSvdIEcKamcYh4g4Et/UoDlr4qwjQbgNbJRt+izwoOKJmvb/NOpmQcjjl5ULzjL
	YggjGHjz0s2hCAJE7Sw==
X-Received: by 2002:a05:701b:454b:20b0:1b3:8814:8383 with SMTP id a92af1059eb24-1b3c033442fmr1588819c88.9.1794380206269;
        Tue, 10 Nov 2026 22:56:46 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:45 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:13 -0800
Subject: [PATCH v2 15/33] HID: logitech-hidpp: keep connect work disabled
 until hid_connect() completes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-hid-logitech-hidpp-v2-15-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

During probe, initial feature discovery and device queries run with
device I/O active before hid_connect() exports input and hidraw
interfaces. An unsolicited wireless connect notification (0x41)
received during this window queues connect work (hidpp_connect_event),
which can run while hid_device_io_stop() has paused transport or race
with hid_connect().

Keep connect work disabled from initialization until after hid_connect()
has finished and device I/O is restarted, ensuring that connect work
only executes after interfaces are fully established.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index fb9ad4cfc583..15fe9dcbca6c 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4768,6 +4768,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	INIT_WORK(&hidpp->work, hidpp_connect_event);
+	disable_work(&hidpp->work);
 	INIT_WORK(&hidpp->reset_hi_res_work, hidpp_reset_hi_res_handler);
 	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
@@ -4819,6 +4820,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	/* Check for connected devices now that incoming packets will not be disabled again */
 	hid_device_io_start(hdev);
+	enable_work(&hidpp->work);
 	schedule_work(&hidpp->work);
 	flush_work(&hidpp->work);
 

-- 
2.56.0.542.g3ef89b7020-goog

