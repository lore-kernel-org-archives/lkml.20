Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0003AE1BC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477927; cv=none; b=mFIth1gS3VFHafwlFeLvMEzTO2DFSzm9OVEDmzRfep5vsi8Av+Bybd9v52ndGfI2uO0d0tKw3aMV4M6F6aqzkc6YFLQ5XLCNM5TvfRzGsIWhcIhzfjn7E4/7OnsprFJZas1PCDRXbXp8atWSHoEVRKNiHP5ly0JCa8pr6RtHVIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477927; c=relaxed/simple;
	bh=6vHugKiEKGcwnRO8JqioN3GgMgDjgFR2oYBYqnuobxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PPGUeBQy97lDkPyiUYxs8tN9Zx+bkZ5ZKhZb10DPvGMk/wEnAWvfomia3F4hEYBrXIvXe1tkLYrQ/iQH3vnJRfvl+5tzi77eP6+k30w0YvkdkdDTfkdF0mhLtKVbRmW5Y3VqzvvUF/oPYFBRF3F4SxQ99XBClniixnu9GEI+eEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnMopyZZ; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnMopyZZ"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-47b47de8b4cso1783455fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477925; x=1792082725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J4HNamgC8b7ssWnbv8gI67ZFZzOI8WJzyoF80mMtg9o=;
        b=mnMopyZZdTrvPc7NBs4hmEOKpJy4/e1Aj5kEbVWkHgWTFN72QnIN9WfUzNE1Rz0T+r
         dHB29DHbKVAVhyK6auVCjeAJ4bggmSk3NRU8wd0QT/90PgZdKnuEaBpJDjFq0jKiBFEJ
         JAEFYXzGVhAC9l5zQwvafyhUiZ7+oSgBaIyja5h8BpL46/Qg1w7MKIrCTmz7xWdRFCWd
         JDL35XrAFkl+ep2ra7pDyIDECHmu1nAb2chqdVXBYQKSJa1nm5FprQmPd/NM49CdQ7e7
         O475o8oax3SAtUdD7+X5zTy51wfzuwkaRUXL2Zdo1Rwx79XFSMip8f5UGSnK8xQJIhTa
         OvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477925; x=1792082725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4HNamgC8b7ssWnbv8gI67ZFZzOI8WJzyoF80mMtg9o=;
        b=VvMSZm7A0IKS21fXVx4+NeiqKMf26ceQEHNRVlQPqIb5V4LGSnc9OYzxezfweebRMA
         rjc2mS0h03Wk+RAFagaftVY94/psZH6OVzg+sI0PAOBAivadaak/1a2f6/3bZcYD7LCH
         qh/q+8rLKcAIIY4NHhmLZQyu5dibfqNH4lTGjlLYVHUmDhczPbTtVLctK5vqk2ISZQ9i
         7Wnwd+JZX7GqXq8DX+oNP7l+sufsNJmI+Ul3dW3RzsIer23j50ErZbXbdzWQliTbNRU/
         L/YB48m9kX0dUK8X52vsetDUrhDgzs6U3Cny6Pa7q9BIrjStlTrTlwm6hoekxj6GQBY/
         8o1g==
X-Forwarded-Encrypted: i=1; AKwUvBwES6TvwvNKFKSm4aiHjySOa4HVeT3PkZH7U9szpRymFZEcX//LAkK0QWEyACPox8nZ7JB/ePLOsXCMQF8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDyrUHOTZCRnnKqro7ce5BvuOzxZYDZu0s7SuSopHY0KKWEckq
	klA4SlJ0WvCZuBkOV/IMQwjWhObev2ay/GO+Vcp+pte6MLR9mzSSc5gMGYuv3w==
X-Gm-Gg: AYBFou2N/GfKfyCzxUnBT/VTYvtSgOX4kQVRzajt+ESi+RhVfcRr+kLxx0ZFWtGldmF
	dMibVblKR1f/ClJ7T3soA9gPqDgEune5GmfTY9BlL0qrfqvI+jAuRTEzdRbbqEbPNbF0u9AGi+A
	NvbJiL4CQx1CRrQbeKDi8E6QgALfrpJIsJvummSUmuJI9rsj76JavXdsx7tNkKQIxtE0Ax4PxOy
	mzNXPXmoA1WyxDBmkybcID812aL+gOBUX1cxz4rLLatjZnTGBGxJ5POpLH25X5GomKEaklzbk3P
	D4aPXQUSqwxZbCu79Cx44ZfTfvIBFkyFTOwvB6ulCjvjZbJa8Cb+nSc5LMxk3tZ2eBDve+lk7qg
	80YgR8x1klNLlXJMhv+Ul0dLuQyrs007DF2fsBqxLFBA/VqZW+zX0nrpUkeWYJaaURaXC1W98vD
	Z53iPghPjapG12gQrbAdY7xjQbIIkBWQ0FEUZetZKJkKJGdbpvln6iuvbSqDsnhurEJAHsqIDAs
	HDDlyMB88+D
X-Received: by 2002:a05:6870:d60a:b0:493:186e:b51 with SMTP id 586e51a60fabf-4a25946b44cmr5252971fac.20.1791477924946;
        Thu, 08 Oct 2026 09:45:24 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a274af62c9sm3037754fac.4.2026.10.08.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:45:24 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: julianbraha@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kconfig: fix infinite loop in conf_choice() when no choice value is visible
Date: Thu,  8 Oct 2026 11:45:21 -0500
Message-Id: <20261008164521.3684735-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a choice is visible but none of its choice values is, conf_choice()
counts cnt == 0 visible values and finds no default. When the choice has
to be asked, e.g. because a new symbol was added to the same menu
(oldconfig, syncconfig) or because stdin is at EOF (oldaskconfig), the
loop that maps the answer to a menu entry never finds one and the
while (1) loop repeats forever, printing "choice[1-0?]: 0" each time.

This happens in the tree for s390 when the compiler supports none of the
-march=z* options (e.g. a non-s390 host compiler), so that all values of
the "Processor type" choice are invisible:

  $ make ARCH=s390 defconfig
  $ sed -i '/^CONFIG_NR_CPUS=/d' .config
  $ make ARCH=s390 oldconfig     # hangs

Before the removal of tristate choice support, conf_choice() returned
early in this case. Do the same when there is no visible choice value.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: fde192511bdb ("kconfig: remove tristate choice support")
Assisted-by: Claude:claude-opus-5-5 libFuzzer
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005202451.3461265-1-lzsx618@gmail.com

 scripts/kconfig/conf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index ca6d9d7359..31c6fd25e6 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -483,6 +483,9 @@ static void conf_choice(struct menu *menu)
 			}
 			printf("\n");
 		}
+		/* Nothing to ask if none of the choice values is visible. */
+		if (!cnt)
+			return;
 		printf("%*schoice", indent - 1, "");
 		if (cnt == 1) {
 			printf("[1]: 1\n");
-- 
2.34.1

