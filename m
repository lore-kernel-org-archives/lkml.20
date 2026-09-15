Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498D93CB91C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437930; cv=none; b=GuM6TgHXyY0P8rc/7dQFKt8k6mFKIaceMJx145r9g+BVD6C021OdElNFsb13ktAhuX96Cf/bKn2MO1Rw9vTLAIAAHdomQoXu8SkL6YJ6sTnZ3/mpJiqfysyrHRyaV0B8aqH/ujhnVhhT2r+KreDU14ZibQXhB+T6ltudOjx0bDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437930; c=relaxed/simple;
	bh=toGVihiKQWI3brdkbe26S6tXSUBzjalKtQseTywVV2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EdDTEZhV974UJ/mWJRWkCJlRVNyodgYF6CW3To0mss//g9u65YDAwtvsiUOZzUh6fsF68dVFloNjIY7XHRWHkBSbEXg9pcP9iYaFVum9rCdbiww8Ki9Oj9vejkQB5gy7BM9axNQOZxUvMopSZ5akB/voWzLPpX/UIH8R1VZC318=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti+heQr/; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti+heQr/"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7981646dcd1so729068137.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789437928; x=1790042728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5CrPwqMTvBIo1H9wqlWbS8N0rGTeQYGG+qkc5z9ajs=;
        b=Ti+heQr/CpJRRi4t0iyqyC2cTrIhA/p6iogGALm/mcC6zO2F+c+zGulzIlUD2tjUvq
         GaPvB/AlZO683PD5MY+8H8GWIvjyKv5g2tO/VglN5HWVeRx1GNH0f+JGVELFxNnAJdmG
         RIzNfDomnhW3jiW0Vl5hwlgF6/rC67hbdJLwj0Z/VSQXInBaccXsXJs4J0vl7pD7i3lo
         7WYkDZCXiAWmrkGZf3V8QK2miBA74x5YQEhRYy9MS4ixilX+DizkOzn7eMEPyupKWbFv
         v5OwBHH8QX5m/lsNEFwONSSvue0ncJlrXid2r6RT5xlGm/gfhkVGhhlrZrbQsGs7Qifi
         PWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437928; x=1790042728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5CrPwqMTvBIo1H9wqlWbS8N0rGTeQYGG+qkc5z9ajs=;
        b=nJ0UHMSd60HFPq5vHMD0sBp2oo3WD1RfmaaZPA4dVPNN8XGWF9Ps/VJVgKKnmZ6cWI
         mZNV+ZZHJbxxD+GmA3J18mhNuTTemq4nTYA1RR7cbb6EmEECZsd2AS2kia/CEy4EBoR8
         x1KBMunEfhXkFuQpvNu+GuLWPjDg6foCXzJVGXM/OHLPv/J5ndaedTo8yhhLj+MRkACA
         dHh8oastSoCbfv0dSlkyMeoO7k4j2eu+h69HsWtJ+voug1B9vOjDwvgabURAuZ3QwXQj
         5h3q6DBQ22H4M4e8T9XtMapHCZ9eXqTCiuIk4aoc0AkVeTYTAnjxPKVcAxMsybLfLC/T
         IKbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcswDyZeymxT3NtZJ5CupHFeOPNIBvkJGb8jIqHCSxGJmhEoulOqeCbITyx6dNTxbkeK4RM6zP54g5eaA=@vger.kernel.org
X-Gm-Message-State: AFuF++k9Fkbkk+20MS1VO8uNb88UPjCYDQiw1rb+j5OGH7PQGd4eGJ4x
	qnJlqlOj6bbn9nZoMpLProCtmLCHrCGtqevXnYzb1G6omnYAFDAieQZE
X-Gm-Gg: AYBFou2eSkyNGLuCL22VgW1ctvisGG8ZlGJTeyl/aksFLHMB2pMZcjcMjem25B+X3zk
	DyoAg6CTt/E4KTAnw1BuVipalqZNZZSyy5eLPF/a7HJntxNXmIbeD8W8dzSQIsg4N0XaHjI3UEv
	PCwJCIlT14D+i+GF/JBlw/nEEltjHY5kwphuwiSuHBujWCR2EAVRwjpqzri2dvfS50CTggr+Dh0
	OQhBNXll0y6T616h+URRLFv0nSC/BObmcN9ZlvqolikYMcaL9nXVtRvKifUYybyJ8j89J0opn7B
	8l0n/lo5ow7o/4LKi2E0HDuzYQppjR3AeH1jBhIO3OWgu7IjrYniAy0y+XaYwh6q20UnDDFyFYV
	6eAIe7koojIJniklDn7+eg8EL+4j+meNhq9xxEx0W6Lhs1LXRbGeW/GJttKoh6HSvgDg3dsWb8W
	yte5lQLMjyFk+arG6hoakWUxUzH/8u1xVAwXzFqIODd1nni3YCDeOdRto+RiPTeRhI7Mm8Z1FNZ
	MKmQ1NU/hjBWu9nmdpF+6mnnVgXLStYYoMlexikP0Ls
X-Received: by 2002:a05:6102:c01:b0:78d:31e7:e02 with SMTP id ada2fe7eead31-79b5d1cc89cmr4840004137.4.1789437927829;
        Mon, 14 Sep 2026 19:05:27 -0700 (PDT)
Received: from dani-ThinkPad-L440.. (host179.190-30-68.telecom.net.ar. [190.30.68.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982ba1789b8sm13201793241.13.2026.09.14.19.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:05:27 -0700 (PDT)
From: Daniel Salmun <salmundani@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Salmun <salmundani@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting on ThinkPad L440
Date: Mon, 14 Sep 2026 23:05:03 -0300
Message-Id: <20260915020503.18987-1-salmundani@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The L440 (BIOS J4ET93WW) reports its fan as stopped: /proc/acpi/ibm/fan
shows "status: disabled" and "speed: 0", and hwmon fan1_input is 0 under
any load. EC registers 0x2F and 0x84/0x85 always read 0 on this model.

The EC uses the 0x93/0x95 layout handled by TPACPI_FAN_NS. 0x93 reads 4
(FAN_NS_CTRL_STATUS) and 0x95 goes from 255 at idle to about 111 at full
speed. The DSDT has no fan methods.

Add model ID "J4" to fan_quirk_table. The fan then reads about 1900 RPM
at idle and 2900 RPM under load.

Tested on a ThinkPad L440 20ASS20200 with BIOS J4ET93WW and EC J4HT30WW.

Link: https://github.com/lm-sensors/lm-sensors/issues/510
Signed-off-by: Daniel Salmun <salmundani@gmail.com>
---
Manual fan control works on this EC (0x93 = 0x14, target written to
0x94) but is not part of this patch.

I have not checked FAN_RPM_CAL_CONST against a real tachometer. With it
the range is 1927-4428 RPM, which fits the 5 V blower in this machine.

The L540 uses the same EC firmware and probably needs the same entry,
but I don't have one to check its model ID.

 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1661f070c..c63e54eaa 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -8846,6 +8846,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
 	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
 	TPACPI_Q_LNV('H', '3', TPACPI_FAN_NS),		/* Edge E330 */
+	TPACPI_Q_LNV('J', '4', TPACPI_FAN_NS),		/* L440 */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
 	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.34.1

