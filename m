Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627218;
	b=XpRRCRU1HgQ1szCoC44vdvpAMGReQFUje4dJHzkrpmMqI8qGDq+PVLvAG6RcaCG7w7s4
	 Pa/tK+JBznF4575BBuD23z4i5EyUxCEOJJpbrh8Ww9geuEvd58MJs7GZRkM1fpkmk5dsP
	 nn7kwuK8xhYCYl+Ok8abxvzYLlVxYgNnsDAljU0JXHZ58a/nnkUwmoc9CBenbVCp+whOI
	 I89C1111jfXe51bAmp/nZ3y0Ebm8/8iwLmz36my9G/eVJvyqW7jnMwkzVIOk4c4RcMn7H
	 lL0h3o1C4sm7ve9ZetZMjifFIGmfMQdp5ucL7FpITgm0RHNJWQrpF1NIxMPdAHx5kGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
	b=JVYuUDIBNmPoqtyhucAGBbusftGXFoKSg71tsRpKOPYmYcKga/Pe/+iiQcos01Lcm1j+
	 Zp4qgmiYIppy1UuYR72fsoNis9YKiXfh4VTht/spjMAyQntnKCFan8UgVEpePrhYaUMhD
	 irviEdyMrB/b0SZVDdMpnKAyK9BAnsZHR45ur8F2dZaCFdZzV+VzOSFyI3/tlGCpKcLNJ
	 EnflsrTcPeB1Fhrpp7F8Xq2jbyPqqRHAd2w6hNCnkVI40aOVmZ0uGN0n7QJiAPCzTicbt
	 P92VMShwUfeegXxfQzaG6lc1AaT7zyN3azKkCXrM3u+9YsnH4SBSniyXdqmUFZmezrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Q6+Shkn/";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35AF606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35AF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q6+Shkn/
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so23277055e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793627216; x=1794232016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
        b=Q6+Shkn/ObJr5jdATQDsyRSPLAb9MySAWl+yJX46CQKajHmZsK/iR0yiIQwuUi8y1J
         9v1QZf3SPv/OiXznYwMqUybwM8VSNfZy96EEl4hAqrzMSwGDlyCLi5unRHhqOymdpMSA
         yC/CjmhNV24dDnOUp7jrBKE1wsR/P6KqoEbo0STcFrMMOM38FZB4kn89Smwww6mXWspa
         8rgzTWjmTWIzabmKmTTBqu3Jig0z76xSvrexbGAZaNosC9cP/MchuajEj9hYb343yGgH
         KSkDgXj2Kb+7dk7qRtR1cUsRy/KLhwlPWtnZG7bHPMSCGjdwZcTgrgHtUiA1m/CgFOBC
         3QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627216; x=1794232016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dubg1gFlwLFjUntHBfFzK7AT4OWC46obGwplwmSB/ss=;
        b=iOLDAx4QuBlf1avqPww/SbmLE2zPreeXOkGzDFtfl+mYy8r01nzM70pueleVmpf5kQ
         gwjpyLDZtsZ/gppJvMBSPcs07wD3xLv0kSx98F9SDt3cMVfcrAmcjy2Fu7Lulmojpxhg
         wpL9zvP4cHKaAC9JOC5DJo3+kKnh3rj14l7FtUckBB0c/nJt1CBdP6v/w45w086Uuq4J
         eDgnvlOSDrALmMHtUftvSOeT/6WNG4YnhraT4jMGXCPfEDDAHDk4OZ0XHiCFVynaG6YA
         BwJzFr7I5edCl6Bd4rTg2+PN5bse542wh43CzDkeFfpiyDiYU/fF4ghvIE/vlURzuPZ4
         /Iug==
X-Forwarded-Encrypted: i=1; AKwUvByqXr+jl9P9+dQG6NAR7mne/Rjx04H1n0TvgaDgLVODgiQa/L9z/pZ71B+u9mbaMyPrKCxUrT+LmJLF2vI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5QqmMUs6EviNfO21vu1bmRiPJC7XJ7Oy+ypyN6UkSWKnLkH8h
	qQCiTbvpfqYyZP7mCbvwre3CJq2qq8sEv0Cyvnw9YlxoBxSRgT78hGo=
X-Gm-Gg: AYBFou33+SDAtRCiHkxYfErxbCd+Gk6dYUerYJv4xGGv3gnC9AF9uiTV3ENYKb8I3Ta
	LFFyNGQgWhIoZ5bWiyr7MPL6Enau4TetQR2OjCDoAIf9cho2R4TClgI69zQ6VPrZ2Bf6cMBh01a
	REnKcPE1cRmKnCOpEmW9jqXeLuASwjVAOoNgpt0FE7HTiQZxcz4bOc7tnZnJxqTx/3oIBq36TQK
	Gc1jqXeouK1ajYFHC8wb6udOqmPsNrglYldChlKFAEtGkJXvI2AIMvHyvnCmiDJYKzTUub44WZu
	PAD46FSvgHpFejdZ3wAB5DNnHDaj4WYpigbIqj1Wp30u8gbFWjiqYOAGGtmjwiqi9TQAPBqCmo6
	7kb7M2gT89mryOf+7BequQLFnqeR8wYbJI6B0NbNb1/rrUSvuyn/dDTeoDl763vmVX5h5PcwEeZ
	kxOy9NZgtnYoApE3NMVHjrMJ1BTFdgk7hY/tkO+FUhyUDuzbjqm+8+2aMKTHEWPXd4GkjTUMj7V
	GJlCitKjKSGg7nvX02pLUZi9oBgqyNw/TQVv8YePEqlxu1lU7cMVqntkKkUfFsvdSOoS2JDoQ==
X-Received: by 2002:a05:600c:1f94:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4ac1548f591mr233240795e9.3.1793627216106;
        Mon, 02 Nov 2026 05:46:56 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm388643405e9.10.2026.11.02.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:46:55 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: jlee@suse.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: marex@denx.de,
	mjg@redhat.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: validate ACPI object type in acer_gsensor_event()
Date: Mon,  2 Nov 2026 13:46:54 +0000
Message-ID: <20261102134654.638644-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

acer_gsensor_event() accesses the ACPI evaluation result as a package
without first verifying the object type.  If the firmware returns a
non-package type, the code reads package.count and package.elements
from the wrong union member, which can cause a NULL pointer
dereference or read from an invalid address.

Add a type check for ACPI_TYPE_PACKAGE before accessing the package
fields, and validate that each element is ACPI_TYPE_INTEGER before
reading integer.value.

Fixes: 1eb3fe1d3b6b ("ACER: Add support for accelerometer sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/platform/x86/acer-wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 61ae622c93d94..72b44f02a992f 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2043,7 +2043,12 @@ static int acer_gsensor_event(void)
 	if (ACPI_FAILURE(status))
 		return -1;
 
-	if (out_obj->package.count != 4)
+	if (out_obj->type != ACPI_TYPE_PACKAGE || out_obj->package.count != 4)
+		return -1;
+
+	if (out_obj->package.elements[0].type != ACPI_TYPE_INTEGER ||
+	    out_obj->package.elements[1].type != ACPI_TYPE_INTEGER ||
+	    out_obj->package.elements[2].type != ACPI_TYPE_INTEGER)
 		return -1;
 
 	input_report_abs(acer_wmi_accel_dev, ABS_X,
-- 
2.47.3

