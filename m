Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD67D5226AC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068628; cv=none; b=n+6xEWv1pABfpy6QhO5P/z14sBOtIjvwGxwPiLS/vbCbb71bw/eEq/6PLqUoQx16KaYrIuTKFAJWnwE437xHBB6ynR3cKhUDdbBfO22JHhlS72krem0bF9VSIqlhwEe5gksGdHtaBLz6mm8JdgDfiOB16PBzIgAREXXpcHV8qfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068628; c=relaxed/simple;
	bh=vLkp7CnrKfl1dEHGT8RtciddFshZjtcg5UAArZDgK7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aTN3HokEDIv0SCieK9rHzxQckZBYfKmzCI02zrbz7C7KwwqqWB1KEDjN+wCjuruHhLCMbuwJO6vZNnNxDw/5vgvZr4Ksdar2B53yfyKIPaLeNshVcf1MMF+sL4lAmGvVWxc9f5HOy4Z7msMxc5IPyrK7ZVdvDXPQoqWB3kx2dT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=gMEPEmug; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="gMEPEmug"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso9212988eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1792068626; x=1792673426; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=keTa3jZbkpCAH7JHtH8sV3LYGMY6X3FohOSa8WF+qeg=;
        b=gMEPEmugERMbdQO6g1m5+hsEBaIKqm37RuS05QVdiY/tw6TF/1o3++dzMCiRiXjCVQ
         yqMZwkbd+6a23Orvnyu4RWjW466e8qNT14SGpaunKnCWJntYkbExCZlBYP0ILuIwbBQ/
         d/wlDaz4jEG1wNZ5cYzPR9hKL9nX4OOJQCC1UZK4tfjYmko5GHI2hqciRTRkZsoHE1Mc
         VIgpmON5A8Z0zJk56qKb0cGWX8laQwisuSPkrrqTJya10cTD5gE5078oTrtKH3cQNXjA
         pNT9LC+DJBHsGtbfMPXEAlfefDiX8f7u0lEiIhKNo+CilQSSliES2+CsZH1ux6rUYx3Y
         RQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792068626; x=1792673426;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=keTa3jZbkpCAH7JHtH8sV3LYGMY6X3FohOSa8WF+qeg=;
        b=1hUcZ1Gk4GcdBKqk8wW+ffEpK33DWfdDWlHjzr56CZt9H4v/U5OZ5zOhgNGnvbn5hI
         48EngrqjSBIBwvfLFi9Ha58LdESahBSJkq2/WjUivVOmPWTbnU31A6PK+n4GaJ6ChT/e
         sVtdabV60Ea6XAQqO1bUBoifIzFKNHWgwcEvLHpfM2rJZY4tG952JTNE2Qwo9OmeVRDh
         SAdW6SNKDOdrfE0lcQUuSWH5BjW9VuJ2TEgdAYoRDrUsXlfM5RW8Aicz+BPBAr1OmvAO
         dTsqkKCEuCKtDUI1kRvITYirCAvZDG9ckpGGK55VYOD8sbm+db3M7dD+AhUNM99aA8hh
         aVxw==
X-Forwarded-Encrypted: i=1; AKwUvBzU2FJaAq6+Ftb+l3HAozE5DBvY2mBFnIJBp2jCGnf6CgZf4qRfXhxOcFojrtJl4M+DMjm6N54WO7wReQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGKgSdx8HMvhfl0ABdJ6SuwKoPEgJBdGmDXfTDAIJF1/K5byR/
	G4iTkZB4ywV4rXDSP7ti4EtSi9OZjfPdul+7PHd6Lc7JNsY7zkXyWiXbwUpHhhnWw/B+OwBJPtC
	gZnoFWWM=
X-Gm-Gg: AYBFou0GB94RXAq5iBW7Shceptu6GIuFaOFumXB0GvVpf6BPzx2lUy84OxngmiHKacc
	8EvX6ac/f6fziMcEBmuve3RlwSmGoM0JnkQPPpvk54HvMKZ54H8xICT25eTVpeCjPd9/1aHsCiF
	l+SKgG+iNBuXlFTlHFtfYaP9feanDOBv/2kmem/TM0aeAna7XNSukFJEcDda/DdA1nyvU3dX8Bd
	/Qhulfg+FYYO4hAgY+QpemC9SME87nvOoG0JHQqWJ7h92Ao/LDsvfajKuZiqG7U9VJFQEMocRYl
	79YdtSc5v9sfn6qjpzmmXYZg9mUiJNAN3+AIqDmGWm5MPBhW488TFuOzbK+EWX/DIMvdniUAX1r
	12YuA8qxtiy2Owu3MKjAwrJvijvP98HTtiSx4cZR+C4PEm5/Gzxuj/RPQsdrny/hP8yeWTbmbaD
	Y9dpMj4ki6zPcDjenJ75H5vW124k+ZcIa3y9FF3eaVF7AUluFVh0+7Ig9RdMTurtjdepx5LK25W
	4wcywFjYWjvjtaS
X-Received: by 2002:a05:7022:5f04:b0:17d:961d:7db0 with SMTP id a92af1059eb24-17d961d7e11mr5695442c88.28.1792068625670;
        Thu, 15 Oct 2026 05:50:25 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:efe0:7af6:c627:5f7f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm54602983c88.19.2026.10.15.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:50:25 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 15 Oct 2026 13:50:18 +0100
Subject: [PATCH] leds: nic78bx: Use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-acpi-leds-v1-1-81ac99b105e7@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QpFQBRG4VfRvjY1M2FO51XkgvFj64RmIyXvb
 g6XX63WSYLAEPomJwXsLDxPESZNyA/11ENxG01W28Jok6vaL6x+aEVp5zqXI/tYOIr9EtDx8bz
 K6rVszQi//gd0XTeQI5kCbQAAAA==
X-Change-ID: 20261015-acpi-leds-077f75e482e7
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792068623; l=2393;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=vLkp7CnrKfl1dEHGT8RtciddFshZjtcg5UAArZDgK7s=;
 b=VpHQcFjgGl/s94WgtEQN/3l7VvDhkmuP3BgqZ+1g31WYFr8ZJ2/Glqm8dWYh0zImRyV1hrG39
 5JyH37lZrZHDO3hn7jdeE2S7N2xf5cYCvhUoHn+p6K5/KIupDbHPSNs
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member (does not apply to this tree)

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/leds/leds-nic78bx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index 5e3098e1e1ad..d0f80aa3cf47 100644
--- a/drivers/leds/leds-nic78bx.c
+++ b/drivers/leds/leds-nic78bx.c
@@ -188,7 +188,7 @@ static int nic78bx_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id led_device_ids[] = {
-	{ "NIC78B3" },
+	{ .id = "NIC78B3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, led_device_ids);

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261015-acpi-leds-077f75e482e7

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

