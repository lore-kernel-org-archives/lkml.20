Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A80839099B
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 04:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789273122; cv=none; b=klO4HuZOJXrV26yBzXgTIAQ998JdToY3o5bfmfUCjbAI1roinpciAHBEEkygi2qzfZgQnNerB7L5CQ4Ffygsc+btu8qOemN1crTjokOajIoQZijiszuri+EmTVOrRXMQgx2yyg8s4pwA7HvuVmQWCGiC8X9eKIVvd4XmXzpqDsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789273122; c=relaxed/simple;
	bh=KIIwlgtQiPCeDblTe7idpuN5xdTWR3wTnKQTNX2q9PY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gzi9J75erqUrsOxrW4qNDTCo0EMxqrDjcvzwgqKYSLE+tNR4hk6rQGnWgsuwymSLAqf1LuNvzhZD/nTwTvbqeIIbNs0wzKUZiugnikrjnbrklYJwlbTCcPjWm1rbZb2R4ptYpIjDKqd8uql3QWncqRsZ18LISsc8Zr52j8EiyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwioAeQQ; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwioAeQQ"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so14392806d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 21:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789273117; x=1789877917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Cy9tKh8kDj+/dr3iT8f18N8p4TbAne3xHKS21+yoCc=;
        b=YwioAeQQdmz/TxQSxi3uouTkYpJYa31T8UqFnDBkXw04ZCyYq77bUMGli12nOrSfpk
         XnWyuvFJcyBqK6cqeVfyxRIQxQ7Sz2wWxmXoooYMkoeNkehQzyIohjFm9joo8UAJ5vre
         7BaM04DGeNzaWAcKjcKojSKGKHkEzaoJc2VzndRJWGCKRBer6y2xww75HGe3fJMS/eY2
         iw/DqfqMzsMr0KuTK9TcmF/fmHguMsP1ejXidZzO8y1YmLbtPJCYBdAEVMm7FIkzGriK
         0qzDvwG91BK6qKACPYn+x6rWABFNIIr22vhRk2lCnc6s0Um9hzJE8GABOnJVS48yp5BE
         bs5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789273117; x=1789877917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Cy9tKh8kDj+/dr3iT8f18N8p4TbAne3xHKS21+yoCc=;
        b=DUJ9MzkQvM+yCPnZZVtCiWeJ77OBSGXybi8Qm7ZHcgr5RW6JroPk8tmTN0SAWKmpBV
         qHMgGvwCbTIAZTPMfX41YfKdBqYySjxoIBAvHvp+tKJGs2QqDsB7z7YFyPalHQZD1SVJ
         8JZaGe2tpnljdHmZk2D41KjhpnJeOyLh1cPlcDgQ+lUQrHTCS496W+21ef2P41OiIw8S
         W7+7uZHqbWNLbXuEgAbd2k0nY7s4Su5i1PHAbGhYP4PGilSrx5SB05JqI2e83OAkSdYP
         +DeQilL14Kk5JQGyY8hFPIJSGpPOnfhU0zyqCe5YdQrQyyjSvi4lBrn7VyEB5tnXoPlL
         Gctg==
X-Forwarded-Encrypted: i=1; AKwUvByPWiKk2HosNcP8zmVT8BpZ2W+lph+xQX2slh2pOoELqkan1c/ADiVX+X1nOzqUHARevJtoDVy4whQgmsM=@vger.kernel.org
X-Gm-Message-State: AFuF++mcJK+PhAKMmJOiokaruwBYA4npeDmo2AtpzyMGSTQcoU2/XzrF
	dORDC8t/cH1CjGg3ysjyDjJ6wKai22prsN78Uk15sSSg/VfvVe8ni38=
X-Gm-Gg: AYBFou0B/FtBJU4dJRScBWpcwYZLqbTVFwDdesREDE7gvt+xPYNKmDfiq+/8uJYnJrP
	ShW0bHE/+MMWwRk2pck9wkriqr6P8klh/tI33MOCALgUBJcCvr88mNr+74xbEzZa8TqH89GOMSw
	rVrFC88bxgCNdKQQsq9lVATcUv0mWZ4lKsFmIgDkDAW1BvinByTexZ8JCWpMKBq8NGdPUGvNahw
	pv1V70FwZeo55OZmQKlF19wbX+9EdBAKxuzJd0CKyV+/o6+GjKEmxJ4sR2E8ACMIPr9jm4HSjE/
	Yhf3xfijrHw5qEoRn7CDo9e0vJVk0zbRMnvza7Frar68rZbAoCiLFqjN6AmY2UI+VSXZ36w9g47
	S9416gK//qQHZ30NObo7snKmMG42o8spZl3oOup1I3b+zoGf7o+KJw6f7pScvZs+MQyD8ZgJ9Mu
	zJCd0EpQ3lW9Va7ZfLFXgxwYVS0VMbxFnkemdadQt0JnRHyszcIaqsVqFu1V92GZkayorsoDLob
	puwCBKYEGXO7tJmFTUgSkvkeEwrQcRztV2N5PV3cvat1zI+W0QQ/DnluYH12W+oJkC72Q5VWjcq
	/C1U5c+c2Nl65Y43WgKXX510ED8hYoZdLg==
X-Received: by 2002:a05:6214:20ef:b0:910:74ec:8892 with SMTP id 6a1803df08f44-9121d8eb88amr91874446d6.6.1789273117604;
        Sat, 12 Sep 2026 21:18:37 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45adbfsm61735926d6.13.2026.09.12.21.18.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 21:18:36 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: i2c: dw9719: power down on detection errors
Date: Sun, 13 Sep 2026 00:18:28 -0400
Message-ID: <20260913041828.28430-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moving chip detection into dw9719_power_up() introduced direct returns
after the regulator has been enabled. An INFO register read failure or an
unrecognized ID bypasses the power-down path, while probe only cleans up
the media entity and controls after a power-up error.

Route both detection errors through the existing power-down check. Preserve
the read error or -ENXIO and leave the successful power-up and regulator
enable failure paths unchanged.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 2a1551665a85 ("media: dw9719: Add DW9761 support")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/i2c/dw9719.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
index 3b7ba88fd..8a34abe18 100644
--- a/drivers/media/i2c/dw9719.c
+++ b/drivers/media/i2c/dw9719.c
@@ -150,7 +150,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 
 		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
 		if (ret < 0)
-			return ret;
+			goto out;
 
 		switch (val) {
 		case DW9719_ID:
@@ -168,7 +168,8 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		default:
 			dev_err(dw9719->dev,
 				"Error unknown device id 0x%02llx\n", val);
-			return -ENXIO;
+			ret = -ENXIO;
+			goto out;
 		}
 
 props:
@@ -218,6 +219,7 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
 		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
 	}
 
+out:
 	if (ret)
 		dw9719_power_down(dw9719);
 
