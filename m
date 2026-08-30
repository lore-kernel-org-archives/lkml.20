Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763753BB109
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101845; cv=none; b=iqoszm0Ec0xX4Hai5PhpCLyMNFw2nfaBN+4e9/6UbHe7xOenyVhbOhU2233nGi4k9qlDX4Hhn1zhDNT9fP6tjPh3366nMX5pIWjWzoWewd83gE2oeYD8YnvlQBgT5hRRuNxUqbhhnHbBS+YOhrzibF9zo9Kh0LbLLAKiFeosrlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101845; c=relaxed/simple;
	bh=0zLjl9mkMBOOhDmSCV77z2Ywd7ode1Ah9a1MkAcZ/OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxCkrcPvZJGg21XEp/L9Uoix9/A6RDEBTjl0sKFaRZWe1N9DuxtwodWrBgJQPN+Z3Hqnj1IIWJWRyYamyTig7zG0JSL08sK/Hi2NaQ7LbJ1/bMJ0SmNlg7HmFawTXjLvUUujobw5+eveeKrKj1BMpF/QU552fa3d9fK6Q1URC3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVhvKLDN; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVhvKLDN"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso2257450a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788101844; x=1788706644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FijoARYQvxvOMp0D7nTD2Ip0kQ4rcp88ZBCNLuIH6S8=;
        b=hVhvKLDNRy/VjcsHchtrd6t0TtSQdeZPHA4DSF0cA9jmskQpjky6jIupP9L1P6XqpL
         nrEsAKgsru+Um9y25X0Npox2+WKsOWzRbF11VUpXaBS7VN+UjwziY2M27zL7WkQYCXWQ
         Vzf7DNO/brQ7wC152WjOnRTaFW3C3AtwEpScJUlPdvQAoYN9w95h831XrjmhdKodgAdM
         k1+KwkdD63ngxaViccSzhWnhF6GUp0yMbWwzN9VzHAqFlir7omzPvJfFz50bdEYvNXyp
         2hR4YO5BSTsoy5f4oAI8Pni9C4aoCWrMSt+wZo49iQpOvRN81SKzPOrkLkiTizPDoINK
         q7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101844; x=1788706644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FijoARYQvxvOMp0D7nTD2Ip0kQ4rcp88ZBCNLuIH6S8=;
        b=UjW5z5phMGXuHCgPKpVXxiKivwircee0wVg0fwKL+F5Bpf+hi85neVCuYp7l9cVDsN
         2LjPmz6p5wSBVmyE3zDlbC70K3CknTGVDmf7Yf20UVDkyeX7cEIPbcA2ufIM0U1vBH1K
         tVNkR05FfD+0Roxem3yr044724+9uH5IPO3AFHKSDm07lIaGMo+fzRrRxbHwpbhz2l32
         7/mGUaTHc5HZffZmlKXjCMhdZo+tqITCi5YT5YUyTlD5GUS2xdrx4gpqb/w5sxmHkl6M
         bqEnh828LV3d5Udzs+R1MymThBz7eJvSjSEIAoOnkm214BGJDu7Fp9cR16G9wKCvr60V
         f67w==
X-Forwarded-Encrypted: i=1; AHgh+RoNkVck4QskeJeDA/ZhDNN1V8LdlKRr3avb76ssLMwrNcMKoBSBeXfWedBdwOJBSo0/5MCeIYHQJTLs7J4=@vger.kernel.org
X-Gm-Message-State: AFuF++lp8qlXI10t8IxFqK7YW3GqnPE4ocREEj9bSu0jyNswW/uQY5TJ
	XQGCdaKzy/D/cdWCRBnqNRICoxtc8R3BvsDV8Yfkm/Ol956FR+A+RtdP
X-Gm-Gg: AR+sD13nxN6dWETJVg6HjEFJe/BUu9fY4C4v7vt2RsPKVPOqIVZJTyaOk1H6mad0loX
	t1yzIcwpuDTSZXt58vKxY8YaiSjYfK+g8Tt7U1vzzR7aheqTw180vbBF71NS4DSYkkBoZxgjsVB
	4vDKkANe40zI388s8XC/SVDibF5LjWJRxdUfOZdNpY7+sDxBI3vMjDNSoInk9U8JxkUaw/tZWe1
	qOHunape81lzWep7C1ungP05cofWkjQa2eXHeYglTh1bCQwKY8+1xEZM1MTLbGKYdOKUf5ltycN
	mt2WvMtNXgR9jw1oBg1H+Ral7U6DzTzR+X5z+0blMNsIVM1Kp0cg4C6xZIRz6trOF3hsz1X9JxT
	qdELXaCeHQF3oANHrXX3tbFWulPxuiz6MEQsGxnrBC8gCoR1y72SWYX0E3FRV/r0L6GNa4Bv/Z6
	sB5xmsg4C5n1Yr2E/lw0A8M2OgBK1Aja+xsHHJjwcv/f39ZbD1HbiXppWaqiLogClgEqrMVMetN
	n06QeiP0PozpXsbEN0=
X-Received: by 2002:a05:6300:6d84:10b0:3d5:3420:8d73 with SMTP id adf61e73a8af0-3d53420a6f4mr4844618637.17.1788101843292;
        Sun, 30 Aug 2026 07:57:23 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm23198024eec.15.2026.08.30.07.57.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 07:57:22 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] HID: hid-lenovo-go: reject unknown calibration action
Date: Sun, 30 Aug 2026 20:26:57 +0530
Message-ID: <c9b58da2e4247e179647c5eb902b93a33a37488a.1788096668.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788096666.git.mradityadash@gmail.com>
References: <cover.1788096666.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calibration action table includes 'unknown' at index zero. The options
attribute skips that entry and lists only 'start' and 'stop', but the
store searches the full table. Writing 'unknown' therefore sends a request
without an action byte.

Reject CAL_UNKNOWN before building the request. Leave Start and Stop
unchanged.

Fixes: 995887a10da1 ("HID: hid-lenovo-go: Add Calibration Settings")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index c7a2e621a4ad..a4231d188b7a 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -1419,6 +1419,8 @@ static ssize_t calibrate_config_store(struct device *dev,
 	ret = sysfs_match_string(cal_enabled_text, buf);
 	if (ret < 0)
 		return ret;
+	if (ret == CAL_UNKNOWN)
+		return -EINVAL;
 
 	val = ret;
 	if (!val)
-- 
2.55.0

