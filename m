Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243137;
	b=Wa5Jzg8irMpTLRLuMxyCJ/cxiAJxyI+ezzGqfjALLDb8o9tK1taf1VxN1aZ184sV2SxW
	 /c7j7wiAlcdOJB6PFNrC/PrLEixuYNA7q+6jvr2DSxQIh8VV7JhpKA02avM1ebe0vdm4Y
	 oLjqrOS5RkGNhQkgn4wzrK7Xl3q3AMfDfJDZn3dJq+LIcU04MVlGYB/QUvFfrNTuKgR6P
	 sMcXO8c8tsdZYqEJojCFAZrEXSUz71GVKguZo8ZnZKFYjwD4eHbhq0sHKGVXvarAfvVLa
	 q5lhdfRAPNpR8kLv9qxNUzQqOnCfsnMaLJ7FTUixf5vupVCuFdLdTsfPkAzJLnvaAdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pd5Wjo4IJ/GK6HgEtpBX9p1EqEJyWK+lBQtVn6hbD7g=;
	b=rhGuptaXtKGSAuKNzlQxE7AO94StV0kLOxe6bNgRAfWt+Xdzb6G2+zj/sOH39T1XptRK
	 aOMTwHUJbNX4RVwCCdFN960M36I/C5m048tTNt7mSn76TgxQwG48G72Oh6WfX9niF8lwx
	 h9OIWAYCDZR7f7jYp3TkCzwiKJpV/6RdREOwuGKVWmwH6fMQjfo39fIp/Q7XzGHfCvelQ
	 7p7qqjxt8vTp4k5b7pXHF64bg27BdIrTBIeATy5xbNwzvg6PFKLfJNYQelXS4fjpan7fo
	 lxarQCa8/mF5csleuHKsXm82xCA0IPxFf97vLfroZNAwnVWEaK/Ombbv0bCXk+FCZmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KhroH+wz;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3258260A2637
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3258260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KhroH+wz
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso1664052c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243136; x=1794847936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pd5Wjo4IJ/GK6HgEtpBX9p1EqEJyWK+lBQtVn6hbD7g=;
        b=KhroH+wzyyb+/rtmaqKeQ2eGtpKy82zqqH0rUO6mQ1Bze1z2wlYHHR0KQKd6h5qaXu
         j6agKJKh7qMRp4sb7TN84N/IJI1mZqsWzrdmGlQ7p+/VByfv2BLEZYsJKe9cLS4H+tCb
         lQcObnPSeaGJ/LImud5VeFYYoeOBYn6vOnPz/A1CnNmnas9fhD7mgNKH7ba25I5s9RZZ
         FtzQ4BWsP3o8+LP9ElTmipqafoF0L5hHLSYw8muI5T+EFAo4rGL0gtQiWhmZRnf7uULt
         XTJJn8QrMz9ZnnAWOJtLVIE6jACRyHubOSBf372MnoZntPUNs2IJzJGVaAjOLmcxnVMR
         sTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243136; x=1794847936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pd5Wjo4IJ/GK6HgEtpBX9p1EqEJyWK+lBQtVn6hbD7g=;
        b=vpdj0mck8I09eupQWKxUafIghDHA1ShZdThJivYt7zD4RGMc1DzeODqnAfU+/Kry8r
         ktM29BEYUuf76ZrxoLMi6tuM8w1gMU2tfMLb9J2MGTqiO69iuaW6L1ySuNR2v7GjG9oP
         RnNXXIbkYh7YKk/I3KBz0KcFFAzsqrp6eLwO2cpwAHVBONKzkT0RokJ88OY7LF8lesPW
         H+PwSNjbWrRiICw5zFzwzvD4+piucTg5cdBXqsb68N0bWww49YD66F+HksrAvBk2r9l+
         W73bWIzTOr/QnKRNzCVA+tFgLBEuG+YtEhZTqsSGm8jgPeRC2BRP+n2voRGpNlvB+s5H
         ezQg==
X-Forwarded-Encrypted: i=1; AL+hErGx3llAqAlDaakQOQJoLsKsUhY8yG/GXp+IC/NTGfL+3RGHpbIscdZEUypoZQGWBxAqaU57jJ70NqLAZzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/p4HKOoYNdi8Be8WDStrITSacAfNCqZtpXakSUnNP4NpKzRkK9
	h/zKu9kP8/DTf4238nJhY94pitmeFA6hj+aEneoX3Ies3hOasrXeDQRr
X-Gm-Gg: AYBFou1rqo+eibwcd5lU36bNSpzzdeO9jDrgquSRDcaOYms0OIX9h5HdWD40E/nlFEK
	NGy3iv/Dh/r6JwH0ukGUrZF1GqYAFFm2R2WjiO2ll4CvDsPpkR+5dc3YxrpYA4uUMBM7+SLfO1Y
	sHr8AXcyMGLfCvJwVjyM5j3SvpfbUuV+k+SRX2JJAZu3uC5XPYT3Kb3PyCbdhAMIeCgvM2/p7y2
	zH6LK4WCHNz/hA/xZXQqt1jBpDyr/z6FylbdX44kT5Uc28SdrosiiwsgXBVgMmzmFSI/quBERHW
	60PC3fW7vh1EAeYdSWWOuu0nCSYyJw/BDxaG5CbuGSRfPreZYAI3wcXw+FTt9LdfJpYI7UaGbwH
	JUkf1e9875Y5G7sdVvnfUbnXz6XofiGjnMnj4jy2KrDYa95kfk+t+/ifq5wmN4+LzWmrLtIwvx7
	WbJDShL8uBG+UCppywZNgu9Nl+SnoyMtArGgRHocBwzKj+qoNreXjJeYCdDXUpzAsGMSF3wkYMX
	tqB+MSUtGoLMx6fbrmie+ypGrhkYczze+zBPcyt8aC16O9hF4wLIgaWHpQ+SLSs339wUSYGnG98
	zlpyyahmpqmTyrarGzpc6CpvGHsD/VFtkKg54JGBrmyK0cEV56dXugL6JPvmIRByhqlUNep3zn+
	jFyA7Lh0hWdlsHjJT01xQ5a0h9WyX/Os1q9zTr2pxImvOQjCJl3O51QIaILDhiQE/wa6yfjZRJ/
	BBnBPwzBJY9L0DhrrdXwOvJXTDbOpQ+s2Lj8zHExUhwQ==
X-Received: by 2002:a05:7022:28a:b0:1a3:87c8:7efc with SMTP id a92af1059eb24-1b3b605185emr5274c88.39.1794243136209;
        Mon, 09 Nov 2026 08:52:16 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm307041c88.3.2026.11.09.08.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:52:15 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 1/2] iio: proximity: sx9310: reject out-of-range hardware gain values
Date: Mon,  9 Nov 2026 22:21:52 +0530
Message-ID: <20261109165200.305266-2-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261109165200.305266-1-kapoorarnav43@gmail.com>
References: <20261109165200.305266-1-kapoorarnav43@gmail.com>
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

sx9310_write_gain() passes the value from userspace to ilog2() and then
FIELD_PREP() into a 2-bit gain field without checking it, so some
values silently program a gain unrelated to the one requested, and the
write still reports success:

  - 16 and larger wrap around in the 2-bit field, e.g. 16 sets a gain
    of 1 and 32 a gain of 2;
  - 0 and negative values set the maximum gain of 8, because ilog2(0)
    is -1 and a negative int becomes a large unsigned value.

Return -EINVAL for values <= 0 and for values whose ilog2() does not
fit in the gain field. Values between the supported gains of 1, 2, 4
and 8 are still rounded down, as before, and the gain read back
reflects what was applied.

Fixes: 227c83faa2f8 ("iio: sx9310: Support hardware gain factor")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9310.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 2585b9c6fb69..9177d6d4a0a1 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -665,16 +665,23 @@ static int sx9310_write_gain(struct sx_common_data *data,
 {
 	unsigned int gain, mask;
 
+	if (val <= 0)
+		return -EINVAL;
+
 	gain = ilog2(val);
 
 	switch (chan->channel) {
 	case 0:
 	case 3:
+		if (!FIELD_FIT(SX9310_REG_PROX_CTRL3_GAIN0_MASK, gain))
+			return -EINVAL;
 		mask = SX9310_REG_PROX_CTRL3_GAIN0_MASK;
 		gain = FIELD_PREP(SX9310_REG_PROX_CTRL3_GAIN0_MASK, gain);
 		break;
 	case 1:
 	case 2:
+		if (!FIELD_FIT(SX9310_REG_PROX_CTRL3_GAIN12_MASK, gain))
+			return -EINVAL;
 		mask = SX9310_REG_PROX_CTRL3_GAIN12_MASK;
 		gain = FIELD_PREP(SX9310_REG_PROX_CTRL3_GAIN12_MASK, gain);
 		break;
-- 
2.53.0

