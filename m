Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806636;
	b=2QzuX+trm2EuljRRqLbshsbDRyxj24lORp0WzN6RRpzSe/GXeye65yr9/LTjKy0hbEf0
	 cMQMH9Nvgc9tcI+34n+3M4cZ9Cm+dA9iSlvqR1+PaEo8ZBU0knWklUW+6iea9TJf/msrv
	 /o2VLMujX1WqhSkgx2pQWwlFktAXfHw8o1CmGkB3I4dX/0ECHWQSYFOJobhPyoeMRUDwH
	 99lzecfP/hYN277JCEs4vKmxoYOYmqiNrCtbTBdgIJ5z7hptWOMY1emTPpJLRlGxv8B+b
	 bUWybSWgFuxiWzt1dQXlS+EVyp18gqStKyULOj9F5Tpc3fj4Kcu5lartLmzrtl+IpBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=b5Xv067oos1jGzjyu5wVHc8D051G+eVLX06OP2CtX4E=;
	b=yd2IR9YDKpB2VXRr2aoWQoq6i9Q5l4wvFksbBAqx0qbF7B3Qbfcvju+KPmIzws6C5/F+
	 7qqT26C+EMByoIYZAYzsHdJKXVaHJVASoljzn+fMKH819wc9OiMBA5EWmeiThzA96cSpB
	 34k51lArBxCyZHr7WHqg1ervfvXLF2qPYA+Z9Z15O2IZm17IFbV0HOin/iCRahwIko6wA
	 9NIRfxeD20UfsjKSlGIDWcMlI4AhEt3+p84CEXpEfisOLI34ExwfzqXW5L5KNA4Fn74h1
	 AZ6p2aPWcPpWsU810x5B1s6NBDH1Pzk1qUuCdAFT/zG+LLE8ouaRJeoZhgrsdXMHQEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AA16082BCC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3AA16082BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c1d337d8so210644f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793806624; x=1794411424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5Xv067oos1jGzjyu5wVHc8D051G+eVLX06OP2CtX4E=;
        b=hSKe0MCNdD3N0D7ycBGn2V16jSlUy3tTVOfGms0GiwmG6sGkd2zApTDUKiz44ewBBk
         9M0lTl9wI0unWUs96ubF9kJR2TjLjQRG064jbETEF2DeCTkunSL6OAMZt5E8Aws+c7bV
         vAON/k1yy7pcOB0nX6b8f2msBQ8+EkGI+RPsVcszGmqS01lx4Rx6HnDPDN4n02uyXZYZ
         1ZTq1aSMdz0g0WTE8qVNSXtdnTx03ryz1tSNbbmNN+l4eZiUugQQ6HHl2c6agzFKF97+
         I6Nnpnlrkuy9SRH4QXTpJFkhPO/RKZoFF111LZQivWvNDDCLzB24avF29y+dB99rpDTj
         wsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806624; x=1794411424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5Xv067oos1jGzjyu5wVHc8D051G+eVLX06OP2CtX4E=;
        b=yn6XzN3dYX7Nf15lg0vO5X2EACo0Qpg8WMfLx7+d7nm1zOa9dhMSN8+i1lFmh4MOU8
         0FU3Y0f013GjysSwLdAl9vq1ZJdFuS9no2rDGdfYyl5uRJieFgnw7v+0pplAFeTjz+w4
         ZqAS8t1igFY8+7tcZrgE7NxQUc3AS783zRterBNiJnQ+xrRjpMIq+mtTqEalt3uNG0Ee
         Z9robidXqsATgMwvcdnHpySfhPl1LemMLmRc066krYpSW4iotluaaMmGAXygpjTseLPg
         mse20S4LFDwAfjlPFbNgDt/TJ0n7zB1zFkFiCeU1a8W5FI+NoEo0O6sHtCZ/9Sl4Oud7
         brRA==
X-Forwarded-Encrypted: i=1; AKwUvBwGzIIA5oAnEY/g7bNf+OoD5c7goPNZxwYKtgz85V8E5dP8ZHhzqF9JoWbmoOFKF+5fypBBOtleYfCYYaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+51qMdVIMuuG5Ng8umEqEcAmrt3FOJZ/y1W1SD8BOpq1IKdOJj
	tnAQ24TprHL+giWOFwLzPzV89W1IwWLF0rbPFrpReAD3GZRWSpQv/o2SJRREVRJ8Sf4=
X-Gm-Gg: AYBFou26g8KMFDC+1TebtWl7edYreOu+EDoHSDtFv/hQ/oiIYhLZyqQ06LnXLArh3mV
	d6MWfzt9AIJUqKk9DVFPDLDlr6v/iE0Eme2PtFhPAPcktxIay8cHRFvwUrMFaHZ88gltZHhiM7x
	Xh8d2tNlTncKTyLCjJdLJsju3gW11o74JYUG2RmqhD4gmftKilaH/4//mfDY6wWLWvg6rNJWxHi
	L2DxEFC/6FLeTQvW5duS2pzqlno+ykvKXwLytC0FVC9ytWxxKO2vdqPPakajU/L1ARUAu2PA3a6
	G6hK+VXasQnFuSjEiUHjnhIlNt7jYYIB0hchvEDGkEg+epM1f1ZTKmqSwfRAO6aeyxlN5UNSQGb
	CUYu6kQBZo7JEHgMTYTnQmB4jBzh10pA6ey8orlqOhTRnJWJSlV+rNwg7pzRqIgaq6NfzsNPznw
	hxjHXTV2wZfOZzvoBzQck6B+bvSQa2Oke8+9SMP3y3U3DCAen0jpA226EgbxduZa6x14mTcRaWg
	CvmZjItkAi6fdqFTkTexOlNDckVqaarhN+f51/v/2jM708RPsX0O1PCCZPLxVxN8TKESdpPV695
	rrsK8HI6bNi4NWKUZzWCOsGxwOagWVdQ
X-Received: by 2002:a05:600c:1f93:b0:4a5:87b3:ddc1 with SMTP id 5b1f17b1804b1-4ac180f1ec7mr391198955e9.13.1793806624486;
        Wed, 04 Nov 2026 07:37:04 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43d4c9d4csm82566395e9.12.2026.11.04.07.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:04 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 04 Nov 2026 15:36:40 +0000
Subject: [PATCH v2 9/9] coresight: etm3x: Prohibit modifying seq_curr_state
 while session is enabled
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
Message-Id: <20261104-james-cs-sashiko-easy-fixes-1-v2-9-410c03941267@linaro.org>
References: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
In-Reply-To: <20261104-james-cs-sashiko-easy-fixes-1-v2-0-410c03941267@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

When a sysfs session is disabled, seq_curr_state is read back from the
hardware into sysfs_config, overwriting any value written while the
session was enabled. Return -EBUSY in that case.

Do the mode check and the write under drvdata->spinlock. etm_enable_sysfs()
takes the mode before copying sysfs_config to curr_config under the same
lock, so either the new value is included in the copy, or the store sees
that the session is enabled. etm_disable_sysfs() does the read back before
releasing the mode, so a store can't succeed until it's done.

Fixes: a939fc5a71ad ("coresight-etm: add CoreSight ETM/PTM driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-d70beb3d-d997-429d-9828-d396e1bbfbb5
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index d185fb8270e1..08c10fd146d5 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -1014,6 +1014,11 @@ static ssize_t seq_curr_state_store(struct device *dev,
 	if (val > ETM_SEQ_STATE_MAX_VAL)
 		return -EINVAL;
 
+	guard(spinlock)(&drvdata->spinlock);
+	if (IS_ERR_OR_NULL(drvdata->csdev) ||
+	    coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
+		return -EBUSY;
+
 	sysfs_config->seq_curr_state = val;
 
 	return size;

-- 
2.43.0

