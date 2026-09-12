Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E04360EF7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789194181; cv=none; b=jzKsbdyqsEBKZkaHZJVZSlANgkZARr+apmH2WxFBqjW8bcvMQ4HfFm2vCDTsUBUB+VuU4cOTg8jnWXn0ayVKusTpltlyRkdkhWA/wBi2hc5G+wP3O8JvmfQB0DRl5bsav2ol2+QiyYzrj+0rhy6ZjMqmtwQnbUHd0rjifL1sFUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789194181; c=relaxed/simple;
	bh=Eo0mHBRWqGbjHPOtw+RoepOiHqUltsjCs3L6erZNzys=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YfXxwWGjJD9RhdQ+9zu6w2hon/LsPSx223ZEkwQckRJKLmcZyPQwWEA8p/uwWKPntZcnaPkejs+diqyz6wEqI0vhnkLBHOnJVJpdmBETwSy3lhtKGJuW8/E32BB0vr+i1iQncQagvLowVV/OMrVybpadbzycLM4wgVzp3whLjRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M33aO+uX; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M33aO+uX"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so122850f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789194178; x=1789798978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXZuoWLz+daoVkVjYqrR1OWv4fzrVeC6Qw0y82I4Cug=;
        b=M33aO+uXXMQExhaPIFws41UHmEtvRXNKOzL8JVlDBNY5bYpHXES9BcGmYNvV4MXgd+
         Bep0lR40Sylq54gEusPJsA0QM33fSz4sAFWQDkJbcP6EGOAphDgBMwmlygMhljMfpQ28
         HvFe4fbNHL+Hril6R6ESWIn1v93iwfLlYIKlX1qbRJdAdbJ0KAbvbejQ+bzXXgt3XJ+m
         pe/CvPLat7jgw22PRxHaVOBeCPnbeBgXC3RpFPcYytOLH47EWtf3+9DalXIDfpgKWdsI
         5bUiDEHm2KpmBFfZhbvsnDVrjQdLt2K8gkj6iMhqFJraiUCz4H2msTG0FKumdVbk4qes
         OuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789194178; x=1789798978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXZuoWLz+daoVkVjYqrR1OWv4fzrVeC6Qw0y82I4Cug=;
        b=hdvl0xEmiyACnjKB6HwmZv9FoikLWPfUPAlQeSPUiXHRo5aFfjqKXQwL0NW58+ZQ9V
         Y9I/9Bt9kDhMI3BBaw1m2AGosBBT2OoiIa5C8eLk5mUgj2uXgeZXqhejRnkvq6jPyWZ4
         QQApxjkIFdJIvMExHHAUWK9yHDvyjQcE84hAfN057cS8QRjeTAPy7DTnYVunW3+tX6I6
         mJYQqtXMlUp+6r9sJnIbS1FQjjJrtqP9ebzvcaN7GtS1Be5dYyCuYWBWWd0QpbTjB8VD
         62SpXHrbsxIg8xwL5M7GyBn6KC+h2rLPbETvoDGp8e3/f9JrwWkYUOuWTYMhis5j3mzm
         /x7w==
X-Forwarded-Encrypted: i=1; AKwUvBz65FJNCwOCDwfZEgoNBMZQUZmK25xx+hkfwYU0lR/dT7BROBWBMtuSez1kjWlAzdq6wMNlgif9LfyUH8c=@vger.kernel.org
X-Gm-Message-State: AFuF++nAY5JH69GDimWUETO79epyaGuOtNzB7gxRho9cetW7C0SE32TN
	BTDHn/rUsiKbqVGoD6BNKrPJg/STu3IkIatPNe/vIm+unh1kRAvCJddq
X-Gm-Gg: AYBFou31uWlMMWNXjL7i1YucaBZhoRagSsj7lcT/nOHnxq51EIfdUkx/bD2DN8WpXIw
	Dnp8Rwgq3w6/IbdS/Z87kNqRi7kp8OW0GSG5r9d5ePxeH3OThxcIM96rUakfUtP8ntTZDUuI7fk
	S0m2yNgg4Ss2vTauT4p4lcAh/AjA0+zqIaxRMSiP3MbsEiVXZVP5HXBWeCTnhEV6qjcaN1WO15d
	AULnyEtbRl+RuGZqWdUS0S8n2wr9HqUbGq2ROZnY6DArReqkqwbFZ/DfMtUcH3IDuJfYE61XAJn
	/2UePVdW/ZozKRqyS2zm1RyckPjLuR3kD5hOxGISG2gwdG6Mu0xSOa+Kx3ozJqka9tnmu/BArVX
	3hOFnI8PQ3eEMOvIfjzne/fVUp/VGcMHn4pESVCg7lB4X8vNnW7POEYra/CX/jt7ITxhHt88seB
	gD84QTfKkTWhRwIAx5z+7jG32WLH78SOWmrTfZDFAoCL2XTFX5HwjemdUJrTznAKxZ4EQQm8j96
	Frj8zgBvENZ7hCghJqjwnNELm9EA38S4CiMxRx034A0B7XpLQYaYb85tgOkLSjzbxEx+unIai+C
	zy1hyM5DLn1/WhnKgHNazX5FQqAFSOVd63hUOZ3YJtXt2TFEdDaKnbAdaw5PRyAW3SyE2C4p8Zs
	1DeVIz4PxKs5E
X-Received: by 2002:a05:6000:41cf:b0:481:5167:abda with SMTP id ffacd0b85a97d-486f6bd8afdmr1548275f8f.9.1789194177611;
        Fri, 11 Sep 2026 23:22:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e74esm10929336f8f.25.2026.09.11.23.22.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 23:22:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: ti-soc-thermal: Fix the return value in ti_bandgap_get_sensor_data() kernel-doc
Date: Sat, 12 Sep 2026 08:22:52 +0200
Message-Id: <20260912062252.42762-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti_bandgap_get_sensor_data() returns an ERR_PTR() if the bandgap
instance or sensor ID is invalid. Otherwise it returns the stored sensor
data, which can be NULL if no data has been set or the stored value has
been cleared.

This mismatch was already present in omap_bandgap_get_sensor_data() when
the driver was introduced in staging.

Document the validation errors while retaining NULL as a possible stored
value.

Fixes: 8feaf0ce1a04 ("staging: OMAP4+: thermal: introduce bandgap temperature sensor")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/thermal/ti-soc-thermal/ti-bandgap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
index ba43399d0b384cf86d12642cc184c5f14066f431..2e8fe7daedb80b7ca4a24f2c89fc5ef44a0a9ebb 100644
--- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
+++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
@@ -576,7 +576,8 @@ int ti_bandgap_set_sensor_data(struct ti_bandgap *bgp, int id, void *data)
  * @bgp: pointer to bandgap instance
  * @id: sensor id
  *
- * Return: data stored by set function with sensor id on success or NULL
+ * Return: the stored sensor data, which may be %NULL, or an ERR_PTR()
+ * if @bgp or @id is invalid.
  */
 void *ti_bandgap_get_sensor_data(struct ti_bandgap *bgp, int id)
 {
-- 
2.39.5 (Apple Git-154)

