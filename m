Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3C340960D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789338804; cv=none; b=mZm/W1krE1Rdl6FA6q4JF82yV8lELHZQlNInLODhHZjOrEI48z3s1+hhRO+FUjG3fzMSEXVZtmdyYzgeyKo243K97wzyZQWIuBxzUgp16WwQPUhA1p6GZW9QOn2TnALC7WdglTUd405uau3iFQE0IziDZxg9Ol6szCl/HCEgmPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789338804; c=relaxed/simple;
	bh=eGytTdZXZULcD8tqC1CIcwuk1WfKe2DbR8H4QTvYg9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZF1Ka9CQgr49uL0WiKaVAdihSjds9NAXASczaZRv6VNGgUpuC5eGvOZRmi/C2kul/eg1GkVp2kY/DSZ9MPVHY+gYegWlhg6o6f9yUmLfpZEwqw4fyHewXjF1xa5KlCrmuvoGoBAaX1ljODJCtizmkfeayFDotT9zNPIJXcyJuPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fi3Ba/kT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fi3Ba/kT"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-936623c6dd3so394456285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789338802; x=1789943602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVY8bihuflumLCxMEbX45VPeeuxfSdvnGs8RzNDh+/8=;
        b=fi3Ba/kTP3Wj1IxUR/p7GByFp0qBIXhMhhN/yOrr/j7q0qWmDBmPT18/K5tvZv9JlI
         aFj/S03g6FQmIDAuGaT2+jdMieZ9iFT4uZjR9Uaq+0V5eN4pDoqspIJE55woHv8k6Tr/
         wrjMMJ13dcl27TNfg2IWJH9xdATx4SA/P4Hl6Im5iZ3cDQRFSJ1xiHSlTKQvbwcFZkL4
         0l7IaElExQXDVROrQcGqjHqE7KszQk/66YsXbEgPthl2kGl/+l6yju5A6eFuRBeuHaWm
         mOH6YDeIKKMzwTDU2fRMgQFQYEXuykLjuMoC8TYBRrJQbkhipCvknSpQI67+5N5sDZvr
         RO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789338802; x=1789943602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVY8bihuflumLCxMEbX45VPeeuxfSdvnGs8RzNDh+/8=;
        b=hRzvFQSN1wlmMWlWDUnQI3de+/A660PUZy4Isj0mxAKdV1DrGMlzLZW7HV+ZvzbFul
         XE2jknunYaD7T+GBdn0l/so3qhG0b/BRVdyNU1GGUjDLzmpBGQcwNSDh3VbiOXFxITfX
         4yA5k01GWU/HXrbcF2eIOk1xoY57U9uJaszhp7ZS4UO7AXAYclVpmiK/KHcsNdWJrVUs
         jO2R9paX+ppvM/65rC22q8VKdKgSnZZ0KphF+jtukdwsKFy9ICi6Lj+m9SZHaxQHUD2y
         SJJnue/ZfkQRSeKiwtVCt5omwK8aHYbfzrrkRtULnmTcyvGdqHtaD88J2D//hh3bsdsf
         OuNA==
X-Forwarded-Encrypted: i=1; AKwUvBw8ofOopSAQAb0n3jEnG2LLnngMjKZuYnsfLbglZHIwE+d4Ee0H2ImebEj7hldg5EV0MdnjcEMRn76tk9E=@vger.kernel.org
X-Gm-Message-State: AFuF++lFM5n+pxGXjzCILUYSwnO3CGGRc9M/ZNfvyX8stWix3ir9+t6Z
	FanyLiDsKrbRN4anjiDFjJ/TCSACiW+pKjKpID3l89xen+tT4rtCL+A=
X-Gm-Gg: AYBFou1XyvMI6TbaHnUftzG6hdPYHE/srJklgJNVi2bclo3GWBHLPmaPE6MtxTl0E5v
	YZIHXQicD+AfuoQTBTnNt36QfJ42MQ0riihZ7VVZgwJMzgCnaTG1va4lojamyCRBxMLtnlJWcEI
	W8oWw7leUdw2O+7KiOvI3/1wufl+cMUJt/ZJF5psTdQDJ2BYgITMLrp/kft1UB12Z8GVAQ/2FCd
	vnVWhHSU7iVthlezkxdQTAWT0KAZBTge21rJX5VTV0u6wPvedlpZ7fzqD7V2HiDqgh3YjFlq8tK
	qd23kg8vFPFTqOct743j3/+GKHXDF7PcXu1hHt+15SZ4M8XS55pFsi7G/cIoY/Q22vE9lRAh0Yt
	Y199Ik+RbaMxXT+O6ehZG8zkWyMgnlRHlnMilae7nF8lVXVcsGJ3a66yFsrukWN5AQyadYFMhr7
	9qgYfWGbPMn6MGU0+eQRnlCzx9mrDS4C1U+KResxSBUcjuLsIzOT5/7jqntXdLJvKtWwc/jzG9R
	oqQqMaQsj622oSnkpVvCY5y7h1IGMRmf23OMvbDuXocXac3jZUYFmNww4xy0Mh+mufqVVdgHvuR
	YOe/QkWngwsfRII4dP33plNIn3lyBFpl7w==
X-Received: by 2002:a05:620a:27cd:b0:939:319f:d6e3 with SMTP id af79cd13be357-93a18551fdamr367887285a.5.1789338801620;
        Sun, 13 Sep 2026 15:33:21 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80bfc90sm824019585a.37.2026.09.13.15.33.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:33:20 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: go7007: unregister the I2C adapter on USB probe failure
Date: Sun, 13 Sep 2026 18:33:13 -0400
Message-ID: <20260913223313.90617-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB probe failures after I2C adapter registration free the backing
go7007 structure without unregistering the adapter.

If i2c_adapter_online is set, unregister the adapter before releasing
USB resources so that I2C client removal can still use its callbacks.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 59aea928d57f ("[media] go7007: don't continue if firmware can't be loaded")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Assisted-by: OpenAI:GPT-5.6
---
Validated with an ARM64 W=1 object build and strict checkpatch.
No hardware runtime or probe-failure injection testing was performed.

 drivers/media/usb/go7007/go7007-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/usb/go7007/go7007-usb.c b/drivers/media/usb/go7007/go7007-usb.c
index c0cb92fa6..b2bf24d02 100644
--- a/drivers/media/usb/go7007/go7007-usb.c
+++ b/drivers/media/usb/go7007/go7007-usb.c
@@ -1320,6 +1320,8 @@ static int go7007_usb_probe(struct usb_interface *intf,
 	return 0;
 
 allocfail:
+	if (go->i2c_adapter_online)
+		i2c_del_adapter(&go->i2c_adapter);
 	go7007_usb_release(go);
 	kfree(go);
 	return -ENOMEM;
