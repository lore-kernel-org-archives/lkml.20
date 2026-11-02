Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634889;
	b=nj3rxpcZLii+YuY3v2JFtjWlKMBAEo2pivHllpzaZp9sWwSK5XBuxE+BC5GcEAv4zRcV
	 jM5rx7NWMj4UrgUOOO+tD+15oO7SiLyWTzfS251nf+34Z20tjL5B+Ue8treOWDvBmOPKJ
	 u8SuRmZxshN71fxA3zIpwsFeec54iMBFgDwZ15AdNz54di/67RiHBq63pfCDvW6Uc98ig
	 fjfAR6ARih8gVnlRWq3yeFAPaOcB47OVC765h0lzfiT6Jjd9//kubrvLQlycQu2RbbRbr
	 g1KYTLtjLipBG3+gXIltpYa9/gHSmOKv3WoUfSe/nzsOkC8+CdWA1ip40jc1mfq5Fiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yhNqEjK5OD5F9LH0oqPITMrFOIogMdQoBpXA7Ob2Y74=;
	b=gbO56wcUxCYplAeSPb0THqXV77eDR2KsLPE8T6DWQs9Ja5R4ZQx+a9eGOe8pCOXEkkVS
	 eI5vfBQHDSqRnb9TP85gsUgpeOr0oa64epb9+8FdY6rO3uM2B3O+v+N5dTWIvwoS8hEdV
	 2m1bX4C5gR/MMpYXEPM6F2zZwfeB4UrNeOq+2N3TshP8E9yaGMbvV/xXOBhitHMULVOea
	 aux5Xy1+pTem0hvl/YASq++X/2PlQj2aIHqFSnlqLm5bWxJdT9h+LrgCJhAvaxm3FLvSX
	 +sFE455Fsm6hBrHFJfbe9s292v4ZV9kWopyLJhg1GP1nq/5VS298kNsd3rIIb9TcQVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1wfB7H5;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655C7607B477
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 655C7607B477
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i1wfB7H5
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7c3b75caad1so2222102137.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634888; x=1794239688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhNqEjK5OD5F9LH0oqPITMrFOIogMdQoBpXA7Ob2Y74=;
        b=i1wfB7H5dsXJook44yczyB9c17AS9A+4OHgVqD7j3AtgwfmIc3dPAYsjP+XhsgSlpX
         d6NMckGjz7RJgJDBshDuQjKmePxG4YR8p77g9OE+FbyZAXWb2SN1oghg/Ia7uFUvDScg
         mXcVFg5KF0n5ExVl6BqQYFOFEl+j9c2dNJhXtsBOpX/dbDeGU6DJIcq7/va8u4TQ0lbR
         30/+7hHJd3+GUesJ6p7mBGzm0kN9xJDC/dFG8j1mbCtcMfjcMJ71cNY2veEfaDCvbt9Y
         mXptRpEthIUAYjgICtc0dswYnH+zM9tita0D8XRSntVhEZtLW1mhBX7LnRrjHplqjnOn
         W4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634888; x=1794239688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhNqEjK5OD5F9LH0oqPITMrFOIogMdQoBpXA7Ob2Y74=;
        b=m/2r5GIijtwX12KY9FqpMpTTXg1GnXrdEQaLeUBgAz+AkwtwO8QiKKcNWioU0bPj4T
         WCwog3tlLZ8tf04JIxkfbbFS/An5bt6gUNrOe4n6VLGqvliemDeDYTVayK75RlGsBxVx
         jqQOU7yphdd5WTSozwWQFhWRSOEJRTBCnlzV+kys8xfnVRd6a7Yw9Vsefvru09tDBe9W
         m+wSH0foA04bVk3C9fgQmGYS7urwgROBzsFegbD2H4XrpFzn3haAor0Fuk486R78t+lV
         b5kXP5ji4k7IFSjd+2r8dar3bul5Vvnc26rSMxuCsB2BmHVMRz1JBeY3uf14kVeaounv
         tV8A==
X-Forwarded-Encrypted: i=1; AKwUvBwRAf9FoOpmvb2+VrF+qKLSWvEy5m7184CDRBL3La7jnvnFFfLXE2db5GHYX3P9cXpwADjahVNl6eB6vbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bFZrBw2qPmW8zIAPxCIysgLXBHRurGvOKNWE3w0eDBoru9fSl
	IMIFbZTm6kXJr8jMK9yiNy0SKCyqK+XdfS0CiLhM3BD29RlUFPAxYCTdzyZXXWQE
X-Gm-Gg: AYBFou1hp7tyJYK2LjKmJyqNCHXoQEOLhnU2mXWLaceMSZPEHDVyYbQrGBXpMhRXUhe
	UBYsFS9jfI/YN/3vb0KC/1wq2ZCshY2BYLUFMuXcWiHBd/MfgED+bUoRHAbStoXf9z0tsj3OiiC
	w74dHxoXTb6z4RveUt+icFiNkrIPhj3JuJ/aLo++b/b7GFIiyCnPdawxM+MGzjgDzl+kozNx/Gy
	w++jnfFzRSfSOsGlroBawCA90DMYGC7u6/HwqiZeFZkgBw8iqvHM7cKkGj6F/976ZToLUFrZe3b
	Xw6Dff8fQHEqv4AuvnX6lqgFnGz8ClK41Axk07PZPKt43GJIExD0nqjIZCSJCCF/diGMvaHGEGT
	UbHUb3zO7r33I9wYHKYjxyG9DgAEdi/5bJm0bDvTEf9USDj4IPXTI7Oe9I1mSATdhyW5VnxBFSM
	/Ls75lR54PagQwaZyZLoJf/Sg2rqmQKEO/P3i9YKMA0D3bMatTMpB+JFufRIrjjiCSsZLHuYIsy
	9iW9kcye2waqAGvH/efDD2oyfCbmK7NHZ+0MISXFUJf7TY6dHsedFhWCKffetwoe2SQzbcnmMJ8
	Mxe3X2U3z7CyaDSzUii3DdmWI6qdCYENDqFkuO7EO9momGUIeuir6jIoRVZnzs/Cp5BlYF0P4FG
	UCrTB3Cp2w/ibv5cnhag23Ng0RJJ9GS+1GGJPepIIbXQ=
X-Received: by 2002:a05:6102:c4a:b0:7cc:828b:4216 with SMTP id ada2fe7eead31-7d072cf3169mr4449450137.29.1793634888361;
        Mon, 02 Nov 2026 07:54:48 -0800 (PST)
Received: from hp-omnibook (p4ff30cbc.dip0.t-ipconnect.de. [79.243.12.188])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d077393404sm10195755137.2.2026.11.02.07.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:54:45 -0800 (PST)
From: Sergei Volkov <taranarmo@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergei Volkov <taranarmo@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OmniBook 7 14-fr0xxx to charge_behaviour quirks
Date: Mon,  2 Nov 2026 15:34:38 +0100
Message-ID: <20261102155409.3061761-1-taranarmo@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the hp-wmi charge_behaviour quirk table with the HP OmniBook 7
14-fr0xxx (board 8E3B). The machine exposes battery charge mode control
through the same GBCO/SBCO WMI command 0x2b path as the Spectre 8C15/8C17
boards: inhibit-charge stops charging on AC, force-discharge discharges
on AC, and auto restores charging. As on other HP designs, the firmware
retains the mode across reboot, which the existing setup seed already
handles.

The extension is only registered after a successful GBCO read at probe,
so boards without the interface are unaffected by the new quirk.

Tested on HP OmniBook 7 14-fr0xxx (BIOS 94.19, board 8E3B):
inhibit-charge stops charging on AC and auto restores charging, and a
userspace 80 % hysteresis policy on top of charge_behaviour holds the
battery between 75 % and 80 % while plugged in.

Signed-off-by: Sergei Volkov <taranarmo@gmail.com>
---
Based on git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git for-next

 drivers/platform/x86/hp/hp-wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833a..ea510696c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -634,6 +634,13 @@ static const struct dmi_system_id hp_wmi_charge_control_quirks[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "8C15"),
 		},
 	},
+	{
+		/* HP OmniBook 7 14-fr0xxx */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8E3B"),
+		},
+	},
 	{}
 };
 #endif
-- 
2.56.0

