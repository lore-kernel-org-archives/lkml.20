Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792896528;
	b=I4OqMvA++RTzqTu/RCwGRvWJBzp/zfdFbAdNQW9NLGl55x/DGKAI3pluIdGHbrV1bPc7
	 qJRwbXYyJKpVu7YrBBgQJjA94CLyguLPtXq5Bc6ppASyj2lcz22WPNRIdFNsIQ08tHxuA
	 uQbiT8sQTAqXEosqpSU4ruD6wnHixeURXWluZm4dg7N25mYOEiATPBN1SSRqEPQVuw+Qb
	 oRG/3ryKh5gflH0LLkXII845iCOrMwphCL/eKrOJglth/HrtQELbLtOiitui/8uAg5R4J
	 zoyP64zGNbZCxJr58dzqLEaXK4pUrMqnUp+eDblOOhKAlSCCsiGxveN4pDsE6Fdbqag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792896528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=zUKQcLBNuUzfdigPpCeMKgQJglhu7H0OTyY8O85pHlA=;
	b=OTAnK75PwCE5AuaOl6hv5OVGinJHS/7pw/rpYuAyONzkUNrOnQxuMQ1VxNXzX4bjYlOo
	 dHYWLiNt7Yv4hF2j9AVVkM0G/EVquXAOsTl54PnPzLgXe04XLEEMEYDot4SCeCe7+qFSI
	 d2vQL4Ri5zT2g9LLYViA5TKq93r5pIacFTkt2KqN7/l6kt42IW/tv6zapC7m2wOGBeoXJ
	 bChfYBtGrBHO8qYxdrs2ryDc10h0mFdkjl+lYDE9ddEbwvQ/8W3sTWTarvsfgpXzMp/8z
	 CEdoi5yZeXL467ICBpbcDNr0QIL2GB32VCaVuS5sw0Sz8sJA7394MdZhSJEQZltBvnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BnZdFL02;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBEA606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 02:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DBEA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BnZdFL02
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-156cbe59622so1277103c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 19:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792896527; x=1793501327; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zUKQcLBNuUzfdigPpCeMKgQJglhu7H0OTyY8O85pHlA=;
        b=BnZdFL02ObgqDdlRhZQVGeDOr1hl5bQP9RSCGMuwGhcWXvjsvfQYDrj4Wf5qsZVtKh
         JQnQODsdbE3HCc9RLQwb8IeYH5EU0Tb8v8PDXsVtXh9DbxKkEd8/NP1ZJNfsT+F/SUij
         ugaMNlo5N9Kwqhfz/8O4RQNlBNNk2Dg7f1KyRuS62mV46ZHB5WNFwNBR3GYD3/DLzRue
         tct6QOYLVfYERH51QLZAZTmGuZwrbIAzMjtSOqKuzdZtKGEjXUNP7xQC7v2cvVYDV6u2
         6aVciLAG/ooH6QwJDJqHo2G04nyKzPj69t99i3U0TjdkfAmpXc5aaRGwrGjQdkz+7XrU
         OQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792896527; x=1793501327;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zUKQcLBNuUzfdigPpCeMKgQJglhu7H0OTyY8O85pHlA=;
        b=Nzx+tD28vHFwpZ/xcMebtREyJr5dzQnEktqO5U2RMtf7y2jTtpmyQbgTUkAiciHqWx
         cKhDYin2Yhs+Hx7l/jHicrTmejhzXGVbHIxhhGiwy3H9+7/fiQvjhCS+SEgB8nrxr8bB
         vG1LH2D82znbkNd3G0xjMrNMWsJR6rYsBJNhoApI/acd4GFx8JVBrXug0fVB8lMOKblH
         GKOCblcxV5ZZ0Evt6+OIUuBF9IZjESGX1nAgzWud3IuODhs4oh9jAh4qoKzuTKHrygXv
         fOomRm5Ad9vkZEGNlkYM+DmPEyRgwJdqTzBWsThsAUTLwjlQGmyaZbagRJYdmxMZGeed
         CHRg==
X-Forwarded-Encrypted: i=1; AKwUvByGp3PZDT4FNdaRFKWiiYUCcreK+sy65+D5RvwsxdyZKcxohV7k/u3qb/mLHzL4HZn+AbEtntcUM1ayKlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLME3e9qSYATz/BpGKp62dOjo713/Aut4mDijE1nfoQtNSTgDpB
	E0mqLVrPBnAt/bRx+C0uQBFUPKS9i1IMoUkl09BJflFsU9vlKVyIO989
X-Gm-Gg: AYBFou3BQ6pQgl4eYB38I8RA8W3e7/DsfK0UyFpVD6QznsO/T8Utv+B0lxXp9TGJKjo
	U6VBp8o1oI89HLGYlJUyLonZDDmEonSLXmsUzmd2YTdr3qPH582SVCjjfPqjXZVC/MNfgAvXVOp
	uYX53it3gRM0bNYjuago3zVDLW2uv6yMUofjeMkmQ8i663H0Bt4OAuBjRT1aQbRv02RS+Z6NTeY
	Jn/fauMj41lbUcULGeDrNEUx8QSNyrm9zpQJcUiGa0HvH5Dq2xXRR0n6c3Fs7D9k26is2NRdmXo
	stxfX8m1pPB+tNepqf8a9zJaoB0Ls27P/4lfE2tseCO3dRuxQnm/AzWLSktPxupQNGvEEqnxYm8
	wXgAwpGY0t5/GQ89yg+KkcKtjxGDd9e3HPTooNK0fc0WZD1oPD8Bi4T69Opceq7EHq/1ihLI/mx
	oBwpTSiP/K8Syo+K59fG23Uhqv4UrQsHBCmSgzxkXBGTGnt/sSKw46ufi2+QYOG2XvX6UBmEOvk
	iA77JQzcEjhNXIDJLjsXsUi02uyUcbBYUolCZ8A5fEp7lU753BRHUqtGmeFG/FnXojBby5dWOg+
	4sWQW4Gs1aoQcS5+58lwyKLJWh5+nHtHP+D9vhIuepg=
X-Received: by 2002:a05:701b:2414:b0:14c:d84c:7182 with SMTP id a92af1059eb24-199356256c7mr3987099c88.22.1792896526990;
        Sat, 24 Oct 2026 19:48:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2e32479sm10521272c88.21.2026.10.24.19.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 19:48:46 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH 0/8] i2c: convert i2c_smbus_read_block_data() users to pass
 buffer length
Date: Sat, 24 Oct 2026 19:48:40 -0700
Message-Id: <20261024-i2c-smbus-read-block-data-v1-0-19bb97467982@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAhu3WoC/yXMTQ6CQAxA4auQrm0yFDDqVQyL6UzB+gNkCsSEc
 HdHXX6L9zYwSSoGl2KDJKuajkNGeSgg3PzQC2rMBnJ0LB0RKgW0Fy+GSXxEfo7hgdHPHtnVVdM
 4Pp3rCnI/Jen0/Xtf279t4buE+TuEff8AdQ4tLn0AAAA=
X-Change-ID: 20261022-i2c-smbus-read-block-data-b043550b8943
To: Mika Westerberg <westeri@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, 
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Convert callers of i2c_smbus_read_block_data() across input, ACPI,
IPMI, platform, and power supply drivers to pass destination buffer
sizes, adopting the 4-argument form introduced in commit 68f382641f8c
("i2c: smbus: make i2c_smbus_read_block_data() safer").

Because the prerequisite commit 68f382641f8c is in mainline now,
subsystem maintainers are encouraged to pick up their respective
patches directly into their trees.

The hwmon subsystem conversions will be sent out in a separate series.

In cyapa_gen3 and rmi_smbus, passing the requested chunk size bounds
the transfer and avoids potential out-of-bounds writes when reading
blocks smaller than the SMBus maximum of 32 bytes.

In vexia_atla10_ec, the redundant intermediate bounce buffer and
memcpy() are removed so the response is read directly into the caller
buffer.

Additional conversions update callers in ipmi_ssif, i2c-core-acpi,
elan_i2c_smbus, and sbs-battery to provide explicit buffer lengths,
and update the prototype in Documentation/i2c/writing-clients.rst.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
Dmitry Torokhov (8):
      i2c: acpi: use 4-argument i2c_smbus_read_block_data()
      i2c: docs: update i2c_smbus_read_block_data() prototype in writing-clients
      Input: cyapa - use 4-argument i2c_smbus_read_block_data()
      Input: elan_i2c - use 4-argument i2c_smbus_read_block_data()
      Input: synaptics-rmi4 - use 4-argument i2c_smbus_read_block_data()
      ipmi: ssif: use 4-argument i2c_smbus_read_block_data()
      platform/x86: x86-android-tablets: use 4-argument i2c_smbus_read_block_data()
      power: supply: sbs-battery: use 4-argument i2c_smbus_read_block_data()

 Documentation/i2c/writing-clients.rst              |  2 +-
 drivers/char/ipmi/ipmi_ssif.c                      | 39 ++++++++++++----------
 drivers/i2c/i2c-core-acpi.c                        |  2 +-
 drivers/input/mouse/cyapa_gen3.c                   |  8 +++--
 drivers/input/mouse/elan_i2c_smbus.c               | 36 ++++++++++++--------
 drivers/input/rmi4/rmi_smbus.c                     |  4 +--
 .../x86/x86-android-tablets/vexia_atla10_ec.c      |  4 +--
 drivers/power/supply/sbs-battery.c                 |  8 +++--
 8 files changed, 60 insertions(+), 43 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261022-i2c-smbus-read-block-data-b043550b8943

Thanks.

-- 
Dmitry

