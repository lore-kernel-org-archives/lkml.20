Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6444639D6EC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789083361; cv=none; b=HCGhjyqloOoWdfgqAlDaGnTIbmaCF1lAtL/roD5Efr2J5P8FTuLuUmbMH3slZB0l+PLXBlreiVe+bcmd0gdOqpvWxJhoPVpPLwZZx25+itPd6fJQP7h0uKwK8bXZLUWdTbW8SzngQHwSheGkpsza4/6Gexjs+2Uyc0ghxlSK07E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789083361; c=relaxed/simple;
	bh=+HKSqS7cIb57NuFxVyCGGHw3CGX6MedxvTwAXB3aruY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qZKesN52wQCJaXx8+N9Gq7bqVPg3ajwj4S05m4jpe/SH9RjuZKCg/K1iBVuT17MUwkqcgpIGgoeATFlXlW7xNlmE4fT6UvxlsOw54s0IhLgLUpSgkAxjv43SHWbBaIlWLAuZKxXOxW+tO8XWBb0I3JMZl29itbk486hTCQ4ufGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nDC2B/du; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nDC2B/du"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso466962a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789083359; x=1789688159; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AU2Dj008QjxxNszWxSoESh/TxmP0j+xMdx3/UcdzlLY=;
        b=nDC2B/dun/DUTHkAaBrNR7oQe/Lljir/Vit9AIMwLdGM+MnT2I6Nj35CevkQv1apKp
         SxTZOoV2Yy2OoZ9BouJXMH7RYNfuVNFF8NC/HEkKEzOZBUnfXEhyqVeCCDrPXi5D1PN4
         OjcM09ApTJGqQhislLL+AyaBtYY5ncPIov5NPU7HRNvWRcdjoXAZEaSY4XmXhA+CIiRq
         t3ZenG/oSpzTn6n3yQp7BSQDXR07a1G1fQdPJD7di681C+DLJkQLYC8cUMaUxhISRfHt
         saKvDVwbwMhxhQnsB8BfCc1UVyZgJxGxWTpUk3VsqFjMvTwr22lo/AEa3O72JR9YPu4G
         4Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789083359; x=1789688159;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AU2Dj008QjxxNszWxSoESh/TxmP0j+xMdx3/UcdzlLY=;
        b=BNWqNgBb00BGBP3z7CPuU/ovLF1/DYaI7ual9QYCgr+3OAjFeil5QxZgLH6nRKat97
         w22Qqr9HzXfx8XJZfCnBmXxKCDcJ5Au4AievnElv0eRtjoK+vqcwMu4LI6P4mjb/+Akq
         vlkq26SOS7Bgbxu+52zOHWH1lznldyQOFsGznpHvQKnYTHvsvIamX4rJjDTCVRgwPu9x
         JwlKMLikswNwRy/1cktYaVjlPnk/9DXNwcGPwZM28cyeHX7B1odXrxbe6D2zbVnfIqhs
         0fjL2CWGl8JcX49VeAOBFtQSoosoYmDPFxGgAeOWSQd/VW3KyXp4f5LZ8r9ptGVoDJYk
         TQCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAiCZugud3R9XcEbJt8T1LAv0IV9wgCzDsVMoLQuFrfDL41IPNzwzoegjvSdxu/mbMJ8ybtsYDYF5ukRE=@vger.kernel.org
X-Gm-Message-State: AFuF++mArKsRg9a0snS7kFBL4V9IGPem01n1j30vHbUV+VVsOOw0Ts0W
	73AHfrPgd9svXYvL6vZNwdnPh4cWcHFSXF6GYmVWJx/3HdwEycbb8Beeu9NwgU86CayFDt41Lqb
	1WZrG3A==
X-Received: from dydc26.prod.google.com ([2002:a05:7300:311a:b0:315:bf25:ce14])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a0a:b0:3c3:a3f4:5485
 with SMTP id adf61e73a8af0-3daed0feedamr2308211637.6.1789083358392; Thu, 10
 Sep 2026 16:35:58 -0700 (PDT)
Date: Thu, 10 Sep 2026 23:35:51 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260910233553.3477055-1-jthies@google.com>
Subject: [PATCH v1 0/2] Cleanup UCSI DisplayPort OOB fix
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Recently I sent 
https://patch.msgid.link/20260825234545.2076049-1-jthies@google.com 
to prevent an OOB array index in the UCSI displayport driver. This
merged to 7.3-rc2 but did not include feedback from reviewers in a
v2 version of the patch here
https://lore.kernel.org/all/20260904234401.2339633-1-jthies@google.com/

This series reverts the v1 version of the patch merged to 7.3-rc2
then applies the fix including reviewer feedback. Because this
series is cleaning up the previous change, and not needed to prevent
the OOB access, I've removed the CC stable and Fixes tag from the
displayport driver update.

Let mw know if you have any questions/concerns.

Jameson Thies (2):
  Revert "usb: typec: ucsi: displayport: Fix OOB altmode array index"
  usb: typec: ucsi: displayport: Check CAM to fix OOB altmode array
    index

 drivers/usb/typec/ucsi/displayport.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)


base-commit: 34c9c5517033a74039a54dfab24e7bf767a4e0e4
-- 
2.55.0.1007.g17ff1f9808-goog

