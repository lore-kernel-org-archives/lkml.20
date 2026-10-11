Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC900371889
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694325; cv=none; b=CnbDnIRP9Pb7d3Xl7LqEksx7Ka/oQ06800qpBrbwHmrbnV/c5F+qKWMVObl9J8EQsM8kV8eBnczJcOeMLDCZtJq4rBQYgFVD/a3ep4lNQtB4I3I7cr3LPL7Bed2FrhRwij3xHtaaDqq2/kydgOB9PpgWi+PS9z+Wc8x7cfMJRTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694325; c=relaxed/simple;
	bh=4lfV7+sqzyweAXYe880vnuGKWpBB5jmGdvI8y+TeBCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTmB0JNZSqF/lFkTQPnu8vzy2RY3+nh+scBYja2FrEDHTRGOOx7g5vqWsGf56CFcFsdVKR8GFzaozu9Cq9cAnwQ/7g3sp+cdFC1YnQl/H1OMWdHAVqcQsEmLjDHWZgpDpSr4q222Z+5oS3KJnbB3a5AWNySd4JACetWnMNiO4mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmLzTy5C; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmLzTy5C"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33c2520ad38so2053259eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791694318; x=1792299118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/+m3dioEgJeXpogr386BWGDMeXCqTiF+8xcjGlIA8mg=;
        b=dmLzTy5CHZCDuTBE2Yd0eB1IgYME80rWOMB1tPc1gF8lfJ/CNcHKirDNyAXsnCNBES
         kMPzAyoldun353uao73HtY8/8wieuI/zxU8px6L4E5lulTUAdolcQteO2tDrJPClHDXJ
         fydYFdifcb/XNI3J/ABMhVo/BU9MhIDO5rb181OsNa8tZUs6yE4dT1uIXOKiFm5jrML+
         3l7E9h8nBrMsPTHv5beCz0ogOoX6qIpp/Ym0PzOrju85EDqPfR04HXKg3s7oOkqXM+uF
         17bfZyaUVgyAdtC9VkFsWosu32OAeQz6rmV0Xak4Wiu/vSoe1WySYxxFIqEOncM7vRZH
         Rkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791694318; x=1792299118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+m3dioEgJeXpogr386BWGDMeXCqTiF+8xcjGlIA8mg=;
        b=I/q5arNTKJH1GVQu2P/oV6JVypZA2zLOJ/pa9A1jVTrcKI6nP1K+YAMN4DPenFtCW/
         3CjX+Ka+15WmNioVAi7CetU3gVhSpFyOUVpMc8eyPBF9BN6mFZQgKOsmtX1kXxiidYI8
         CFoETMacFG6/4oVW7r/Rn5qyQiMTTJHnva7n7gYPkjXGgJlo2WSEetHnhkLbWrMCUO9i
         JhecjLMUckPUx9/0jw1ga1sDwiHs2AR2BXbFF0ZUa1XsBUnbmfkUYM1Y+8htPzVwl2Aw
         VKpIsoENNMfR4TKeYQHYxPICxRfCl6DGr+sVmDEemjuh+pErhtsT4AGFVdREKk63IWHP
         DjnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2XhIyp3RnnaGTLBk52uxf/AXR6gZOiCMJ7IL7kvLQmSXjXyKQj3pnPXSs7J5b5zwKoDWrMQWl3aYmbJ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvAxUSbPgGqsIMOu6I1DNQSNQSXCOLQf6iffukNdWDjGZsxic7
	a4P5eomJnB0HrG4JDX9ZmPEJrknP8oLz8Os+xAZxMbBoK/s9GvZYAYAA
X-Gm-Gg: AYBFou3oVPcRlGgNkESh0RmSNnK+F+Pnq3YDPxqm7uDHJlQs/JzLvWHyEZa0+tQT2JO
	cc2uzo4TdyEGlkhbl7IuCJtnXUBRDNXnGZOHA2TKvEkmOkvtU3Ca2Z7fs3C3dDDCzyrkdxru1Hg
	U3SSPfdAWpOa6kIaTNGyuBOB+tzPiQTEwf8oPkgpuxgnwe035lntNccf2r7JkudgA2SmeLI/mc6
	8qa9hWHLDVbl/8OuqpBOUYpby//msUkH1PfqaR2oB2sjqUpBIhMti+DeOyUwtY0f2kW9aVYeFsd
	38Pnch9xj6HpXqq9hweZgEAm9VVrsDv3697FGzcil5Gx0wtzIeUrKOR0EEhLIK14fu85hArBoFq
	i+uEH1i2HSBG+tip+0NBOSa9Npou9TsF0VtDWZgiK5SyG/tVx9i4p2AVD/CBcCd/y3RvTyEnlg4
	G+2UCuQBm4R4k8SF9sNMqww+k7Hx2O82zoUti5ty8OY+7dhjkvNc2T4G56AJSgrZf3nsz1kCdme
	S1tXDXodUkIcB00dscxSf1mw0dyLr6tKCq3uxVVlmwls7joFQk1c1/DyuZeKXU97nxHshesL739
	TZLik4VVkWSxuewQdlunMwk0jYd8hQ==
X-Received: by 2002:a05:701b:4212:20b0:168:e942:4e62 with SMTP id a92af1059eb24-16a61789c56mr8352937c88.40.1791694317514;
        Sat, 10 Oct 2026 21:51:57 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm35733139c88.13.2026.10.10.21.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:51:57 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rodrigo Alencar <rodrigo.alencar@analog.com>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: dac: ad5686: fix channels member name in kernel-doc
Date: Sun, 11 Oct 2026 10:21:47 +0530
Message-ID: <20261011045149.353929-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for struct ad5686_chip_info describes a member called
@channel, but the member is named channels. W=1 builds report:

  Warning: drivers/iio/dac/ad5686.h:95 struct member 'channels' not
  described in 'ad5686_chip_info'
  Warning: drivers/iio/dac/ad5686.h:95 Excess struct member 'channel'
  description in 'ad5686_chip_info'

Rename the entry to match the struct member.

Fixes: 0357e488b825 ("iio:dac:ad5686: Refactor the driver")
Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Comment-only change, checked with scripts/kernel-doc -Wall.

 drivers/iio/dac/ad5686.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5686.h b/drivers/iio/dac/ad5686.h
index 482bc70515f7..4f2ac1e96643 100644
--- a/drivers/iio/dac/ad5686.h
+++ b/drivers/iio/dac/ad5686.h
@@ -85,7 +85,7 @@ struct ad5686_bus_ops {
  * struct ad5686_chip_info - chip specific information
  * @int_vref_mv:	the internal reference voltage
  * @num_channels:	number of channels
- * @channel:		channel specification
+ * @channels:		channel specification
  * @regmap_type:	register map layout variant
  */
 struct ad5686_chip_info {
-- 
2.53.0

