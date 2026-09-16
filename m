Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAE150EBFF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569421; cv=none; b=VTdwvMvp6MiP6R6OkIoOxZQvUNlF0aIZeHqKlpy9XRPufwQchQslxdfPzjWCO8GxiWxYmx9zQymYHtxYdYwE8X6TALez5abqIBLcKC8nOymjs5rEGWQfZyVvWVP7IX9EyTqT0vPrEycSHWMJkO8cpldilHjIbXNkHSgtbwSZr0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569421; c=relaxed/simple;
	bh=b97ne6nhN+rwutKANWXyAqfnCEh//QNELGpWYJAeRek=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h6G2WGV+bX91QL3uxtDVOM7aAXN681/9LEKtkG6XRig3GVfaPR+g4Dq3a7WHd1UZWIKvez9JFqgT6jZqVAy9gFTZZiPFsy5m65x8OsH9X7Ixm/hwyLgg6HVmx+r0R8wdHGGM4USuBTKkOlNd7uGgQt2vY8rA1UrUk0fsPaJCr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hs8avZ2c; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hs8avZ2c"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16cd1so960397e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569418; x=1790174218; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=udZdmuYZstjfDlOUfIxWazXEs+olz7lSp9cpBoqmYNw=;
        b=hs8avZ2cUyjawgHu+wG6f4A4pDbUkx6t9pjD+kMtLbMipGOvohnJaBApIYoKjYA3Ru
         UlpP2bAGfCSYet/oOr0AAsSMrfmDuoy8BQ+zcvYPdhItGi2hrakD9noAXuV8pXogbswR
         uT0SEZnVKW1hR17T9ACxExqZXGZLzvSVLAmzu3PwTBw8LCuhAgeVk4cd6+uochzApUL6
         psYFs2Fvx/fX0zEjbezYOeGPqx8w+/IgBzQwgdE1oKcir3iyUVa86S1SkEO39sHJ3NQw
         LXG/G4PcXS/12FwsZk0atNW1J47D74lLlJhyGamoqL9sV9vCSUKMi2Xq30JgVrgIijin
         Og6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569418; x=1790174218;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=udZdmuYZstjfDlOUfIxWazXEs+olz7lSp9cpBoqmYNw=;
        b=l8U9bl8lfQCgAchgOnvLF6GPHEil+olTDHdfc0eSAXdf7MmA0ODYaFQm8IsRhmKcC4
         ZmT0z8QtJ5BKQCu60RIxwlJxYqZ+xjJqFSietj90xNqTkl5oG6SqCeOT7iWHq8fgKJF+
         4yNZOY3VVG2Xsg5okQq/njDjNb+Zxm2E1QwAJTK2R0gdhyA+gukXVa8bL4HbFEXXJnn0
         OXKqZfDwANX/2i09ZUz879X1fD2vYSzxLbjFHwPyRW9GIZiOJOUUw+tGuZd/pWtIuDUV
         vThHM0DGamFNDRkPHlFbdJsimze4vk67AeRBQM6k8ObE/BLFq7yAO1TCKbK8vcxG1DN2
         xWNw==
X-Forwarded-Encrypted: i=1; AKwUvBw9NxVqkxWsE972ZxkF9yR1FvYDQj9Cfnl5mkUd/DbSQ8ccw3ETnBwF/mYwPGug9gxBPy44ms8jykIJfHA=@vger.kernel.org
X-Gm-Message-State: AFuF++nFlqSTuoud7iMzgcl+Z9ArYxYTS+WkXWGJGKDn3izZMpavSIZL
	IgXsA5sfcYKrDZxpEL+0/cpVqsA6YQnl/AInvZItWSP0KnzgreG6iMQ=
X-Gm-Gg: AYBFou0/iwSp5yv7nOKQ7ZqOIuWO6lJM7lCUsz8aDcEdjhfmpzGeOXDw1Kx93zKqSFq
	MPzwfbVivgdSj8DkBpE1N3Tb3DQZyXAGDG4yUlYb7Rg+39alprgFq6uuezqbHY22+RmjZqIINO7
	plbYUqGn6bSR/Y51VNREdrdutxmrzXV82ormCiErM3VLLfrKsQ0a/+1nctme989QjHLYym0Vlc5
	+ss9JzFys/oz6nZQ3TxkTAlIlMGItMlV8Z16MH301NvTExmh4Yf3Fs81ZEsPTkAwtWbxP8jGVdE
	JcmwmDGdrGfFfD/4qtr+i3JvNSHmhcHKIi8EuWQs256Ljat5pHArZkDuUPG3ZvPGcixd2aCcS2h
	8f3CV95os/gc1TgXOkn6wu3jlAE9EZDHHJ63dUviv0epjmEkhabZN6Oadli//voFNOK9if2W7vm
	YXk/maWG+Y7NhFOS9IiX6GrUXbgjU0tUeXhN6Ctyr/XvizywHPLIFq03MTMxdP/Dqq3qmwQR/rh
	h6xG6r+7H0DoTV2TEYWtHKN
X-Received: by 2002:a05:6512:15a3:b0:5b6:1a7c:fd82 with SMTP id 2adb3069b0e04-5b8b6652840mr832742e87.40.1789569417297;
        Wed, 16 Sep 2026 07:36:57 -0700 (PDT)
Received: from [127.0.0.1] (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57c3d46sm978675e87.19.2026.09.16.07.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:36:57 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
Subject: [PATCH v6 0/4] mfd: intel-lpss: Clean up and modernize DebugFS
 usage
Date: Wed, 16 Sep 2026 19:36:38 +0500
Message-Id: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHapqmoC/4XOTW7CMBAF4Ksgr2vk8R9xV70H6sJ2ZoKlkKAYo
 lYod+/AKgJUlu9J8725iopTwSo+N1cx4VxqGQcO/mMj8iEOHcrSchZaaa8CGFmGM/ayP9UqW0y
 XjqpEIuMa1YIOTvDhaUIqP3d0/835UOp5nH7vGzPc2n+5GSTIxpickieiHL66Yyz9No9HceNm/
 Z7QTESIliK5nL15JMx7wjABqUGdgFQI+pGwa8K+JCwTClOjMe4y4NMXbk34l4RjgseDI2es8rs
 1sSzLH25I+SjAAQAA
X-Change-ID: 20260913-intel-lpss-debugfs-eff3580d1295
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maria Lisina <sekoohaka.sarisan@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=sekoohaka.sarisan@gmail.com; h=from:subject:message-id;
 bh=b97ne6nhN+rwutKANWXyAqfnCEh//QNELGpWYJAeRek=;
 b=owEBbQKS/ZANAwAKARPrfuqZo5+iAcsmYgBqqqmHBCfjZAaIA4SzJMoWSnG83WfdJZnciwpqu
 K0t3Eh2rxCJAjMEAAEKAB0WIQQ8HZKKOdqg5DRiM0sT637qmaOfogUCaqqphwAKCRAT637qmaOf
 okBhD/49kjJF9RwBA9tZs5HafTCdhYaTPsadml8l3G1KqZ+H8eWrLdlTmu4vv/nZ3bshhGCdJuj
 ADX3iraFBVOKj/WLyq+ueUeQe7s77gi0q/zs8kAshR2Pf4Gt5AZD+cqZZTV/se+fRumNBo0y72g
 0nDQnu8zZ7O+U8QuMWgs8bA656Quzij8mAE0wTJDPOTZNOzzxyM7/XOgebunL5mGVzGfeczNX2s
 HBzVfjtBc0c8yoqq8nxnteOKiLurGx9BadLpYp0s5NPZ9LBAoCuydq2evJuJ+Ku8MQYxwcoVB44
 qVPVn5t/pt4dZZnXFDP7oIrBae3YuwefBKG6vUO5w4w0apnHmwT3VLh5pkFAsaSFxYVB0oFHG96
 BUOy3KZGACXfAFTeXbLoSM1dQ5zaF53bUciWUxL+yoQfpSTPYIHK99d/1G+NEkGPXk5CTG6svDP
 BiTkfDz5DPUWZUNU8ZoVQPLRfu8H3WVjEijPqVCf8P9SnOargRKwm3KtPcIH1TBWrg9SMts4QC7
 6jlYZ0JbaTiJs4wOR9yEGCeQeNcf9868TaDG0nTvqNxydiWWn9WWPxk7KlCMfYXqLS1dE9lADGR
 5z4A2gm6gn7SYyD/NcxnwFIkHx83oiDO0ND9+wH7lI3undFR/AC0bLB+PKiJTTpGD8rfsXdFn4d
 3bMKV6XEElbF9DA==
X-Developer-Key: i=sekoohaka.sarisan@gmail.com; a=openpgp;
 fpr=3C1D928A39DAA0E43462334B13EB7EEA99A39FA2

This series cleans up DebugFS code, modernizes it by replacing
obsoleted macros and removes redundant error checking.

Signed-off-by: Maria Lisina <sekoohaka.sarisan@gmail.com>
---
Changes in v6:
- Split each logical change into an individual patch.
- Link to v5: https://lore.kernel.org/r/20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com

Changes in v5:
- Changed the goal of the patch to DebugFS modernization.
- Refactored intel_lpss_debugfs_add() into a void function.
- Removed deprecated macros and functions.
- Removed dmesg message completely.
- Link to v4: https://lore.kernel.org/r/20260914-intel-lpss-debugfs-v4-1-0eb82ea7c1e3@gmail.com

Changes in v4:
- Keep the dmesg messages, instead check whether DebugFS is initialized
- Link to v3: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v3-1-1b8e2b1f0992@gmail.com

Changes in v3:
- Fixed commit name and description.
- Link to v2: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v2-1-a1a4faf5cc63@gmail.com

Changes in v2:
- Fixed function name in comment section.
- Link to v1: https://lore.kernel.org/r/20260913-intel-lpss-debugfs-v1-1-833cbb6fffc9@gmail.com

---
Maria Lisina (4):
      mfd: intel-lpss: Remove redundant DebugFS error check
      mfd: intel-lpss: Use plain octal values for file permissions
      mfd: intel-lpss: Remove extra DebugFS dentry
      mfd: intel-lpss: Switch to debugfs_remove()

 drivers/mfd/intel-lpss.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)
---
base-commit: 2f0c1cf72f4682178506f513bbf015e591b1aa4a
change-id: 20260913-intel-lpss-debugfs-eff3580d1295

Best regards,
-- 
Maria Lisina <sekoohaka.sarisan@gmail.com>

