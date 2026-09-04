Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2CE25D53B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518259; cv=none; b=unPRGVHszTUU1+TJ1EBvw1bf3SVSxnfvdk2z5VFHciYYVzhNGmM2yTFyp0L+BBDcwQjRZEUYtRbLzKi3fGg54i+nB/wZjXTGRmqHscq/E/kEBsW8jV+8YtweYxKTiGQTNFobMYTTsceFU7ZPAgjtYOTqJTnOx8qZbRC3Wa1w7Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518259; c=relaxed/simple;
	bh=eCdrtFx92LOvn3zRMQuQf4je2cLrF15KZh5gW8zQuIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=engVt7x+fLXQZo1x8bminLkAvgbeVgK8Vp9pTH3eS7ECBLIOKTvm9kgi9mW+vI/bUHS3z7QotVhYOYA7Me5l8sP6TmASTF6NbqZjUtILgI59QTvscxdze8KNkCsnLiDBhvXgMGSzxBCRRYqwVl8C/sUeDCPtQ1HyVu+7zNuuctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlYxKtj9; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlYxKtj9"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so679965a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518258; x=1789123058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BZQsFKP4jMyXxxqQrP5SytFPA0wlD3KzFUOMPf1X4dk=;
        b=SlYxKtj94Rab66TfgjWSv/MPtQn2i05vzsOQ6uZOiyHN+oVk7DJH0QGXv/8+P5odLx
         9QPgl3nkGvCTPL9NqvB1MWPOHhAb1fAD7Ol5+fMSMSJjqXCwlasohULQmEpQLBh7G34O
         xFI/P69MFfAToAs4eHJc5eiL288W8Z06rreJyhNDP5uNDuPWrYHTGM+OSjApIFf8NT3Q
         crumnodRjguprXT46p4fh0iZcBAPGtZl/a47meiOdWzDzQ2VTtYuoW/Z80VliWf86N6s
         HuEzsCVl5h3nR3ILxxiMnCOC+mdBPKlsgYGRmYtiZrDu3cH0XkZQwH1auRMH2b01FluZ
         Zj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518258; x=1789123058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZQsFKP4jMyXxxqQrP5SytFPA0wlD3KzFUOMPf1X4dk=;
        b=jS9LlO+LizHjQhsfJSyY9LCBIbvsdSjxSVL02RHZfJWKet0EaYWplczAunFguXg6fK
         ZDhNhQp2OqvO032BW6HRKI+nOzweBjc9XkR1qibT56VINuY7y2EdFNZpi4FztRtR7Tpp
         zJ9t2sjWCX+5GFt2Fm/mkxfoGAL++EemFFbUPno/SJNFQeW2xkrEulwlN4CI3KTb9ew1
         IEbkmsuexeeReGKiHbZcqbaWwkFiwZFV+KBv4HAM3YPV772b3suEbOy4yisUpPCvYQSl
         rAwKA9vIEWqT3FrJyZcmPzLFiBDH+78Hzp7lJqORsSDgxaqJ1mkw/Zrb8P02iRe/avOG
         c2Ng==
X-Gm-Message-State: AFuF++krDGm7U5vvoYTeoKR6xoFaClYI0mu5DO1eb8+va5RndkAxVnGt
	1qIofd89lQVYV5XIwM59B5YdxsH+MWEk60pg3TKORayAFiiSfTrz16AH
X-Gm-Gg: AYBFou1edAIMxKghOwQhwPz4rAzawhGU0xT+2Yn/uPNPbtTGTkM3PPMYEm90Qj6kXds
	7sLahQp/NeYV3ThcXbW23asfBLOCot6exfLdwfpBQ9CDolyX+8uUpxESqT6l/4mUmmgtYZm//4L
	m3bN8oW81SYlwAiIZsHAd1A8CA8n/QrMB3QIJRU8/RaW9yVdIg+R5B0s2ucBma1EJM9VTBrCXwt
	fms+SUByJ8d8hbQiVvuKNgYWcdnBuLkE9CRwtgJl62zlgiTUGGmcs2XUcX3Rbxf9wsS/jRoUXk4
	btpBSX+OljNqJfNWjCVpjGJACwZEdk4IIR86Et4E6HNVScFR816cKhS6DlZGG8z6tul9eoxaRGZ
	o14sb1n6qeP2Nb+LYIo49+YqY1cpxHdnjHP9soIx2xQgPovWTb3kt4iTaLuxLuIC8zCyw2EXxE0
	4Qz/BVD2/Js/VHFFcEqVYuBlRq6Rk44wO7fDmPKdv6lrZnxHyHqYTvhDcgS5mZ7RTlIT3jJxGkR
	FjQqfmzCuJKhZ4=
X-Received: by 2002:a17:90b:17cd:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39b26272b4dmr6804930a91.13.1788518257765;
        Fri, 04 Sep 2026 03:37:37 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm5981325eec.24.2026.09.04.03.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:37:37 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: arm_scmi: fix typo "upto" in comment
Date: Fri,  4 Sep 2026 16:07:31 +0530
Message-ID: <20260904103732.7320-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/firmware/arm_scmi/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index ef29fd223287..fb45b8e6459d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -477,7 +477,7 @@ void *scmi_notification_instance_data_get(const struct scmi_handle *handle)
  *  - exactly 'next_token' may be NOT available so pick xfer_id >= next_token
  *    using find_next_zero_bit() starting from candidate next_token bit
  *
- *  - all tokens ahead upto (MSG_TOKEN_ID_MASK - 1) are used in-flight but we
+ *  - all tokens ahead up to (MSG_TOKEN_ID_MASK - 1) are used in-flight but we
  *    are plenty of free tokens at start, so try a second pass using
  *    find_next_zero_bit() and starting from 0.
  *
-- 
2.48.1

