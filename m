Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1C471CE2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190925; cv=none; b=D/eH1BEgtPaqMnU5mWk5JbF5lrJScaABWdE7enTsnsXpEyvashmePLRo2OnxjGY0wzhldZ0zKrR7EGf0+/5wRw+XFQZV4T0IppeIHt+ZvOg7Lez5sKu1HOyDBnwl2aDF9hoFEhK4pnpneVEF7LbBY54ktoxQNXFvgu4bImiMzOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190925; c=relaxed/simple;
	bh=m/nmGoRtIqubxQfOUHezH0/02hIqusNx1rSVN//wVHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=higGmLOUL4RHEstAmmCCZuARHLPeue4ZPl4uLfs5/O+z9UWMPH4QCfUvqxDwhH90Db55ltD+VLkrRAabOCSrSw1B2M1b1NGgdvyRlhFXS7dQtmXEUUyEbboniMD4BhkCti7mlUfx9u5VWwPDl0A0naUMTlZJn7z6EdD0oj76WFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=nAWoBpeZ; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="nAWoBpeZ"
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5542A3F60D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788190914;
	bh=hTGVz/KajS5V31QIqGkSFaGqj1Av1QbPqyAWIWp1oOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=nAWoBpeZb2yp6P3bbP0mE2XvimHa03Clw4jcRiry9K6DdFQgI/jXr4vXuQ47kGLPy
	 2Aw8RJ28ltLXUVJaSoy0CTQktM7x+XDFYRjhrHYA0+F/x9JqzMEjnUPY4cDCbAmpPT
	 ARDywYihNY6/T+6yu0AMj37uKuNei1SitkJO4hLL5DofKWWlUOk9wHTnU+WVoUifSD
	 LbaHGlnX8j3MhFuuRlCCLc237t4Rel/vON4C86zOTOpNFEqT/VdqJj5NtqDfog+pqN
	 zftukyfL7LJf4+LRRoJedEefprbPb8SEam395hjDXO+zt/MZ+b0G48gLlwMrwWW4+V
	 CIIV7gNcH217NS8q0tqxWNV6vy4dRbXDko/Xrf5N/1CsDj7Hp1dVVqihOXcMq+fZh2
	 efLlUsC3PSG10NKznC6Q6CM644fAVkdjiUE6/sXNHzZptgWBVhxOCvUJPcaCp50Irs
	 OvFSxH1VCG1dXj72J5sM0KHm5IiR2cu20rAH/q4zYmsDrYsB6/O1kuEkvJgHbOS/10
	 mUEgzRPJznLKEWDgQDrbL4XpUuShwsmPIehXsglHNSlboYpGbai9OMyD+UW3j4yLaP
	 6iNcDUpF+97SauLP0aAwYtd5W4qQ5VM/WeQP7sEtx3GuTfqHCjFL7JxhGPC0PP7Q4G
	 dwK+vl1m/DidKX9Cuma2fgpw=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d292eac1so3126102a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190912; x=1788795712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTGVz/KajS5V31QIqGkSFaGqj1Av1QbPqyAWIWp1oOo=;
        b=PuTUH3Hc/7J4UDJelxo/+YvbmNbbCbDKbRxtI7YW6usqaOfVWZwHEAoBnwxRiZT3Bu
         MQEyMhRAlcZ26wrPjD7DmtVHaWaDM/M1Pi6HJXwgKEPrOukFN64dhyob8hn72Rn5Kyqt
         HgKPvPuKIanhh4l+Y9xG8DshXb2Ut7i4Bg6kUuodaS1GMrIYSdWlCdvITRENm7AGme7P
         PBkWFdd/wT+ZgwS+ARbNU70TXpdl2B4BP93kVroZt8hquOhTB1URrBggbhcypptHRGX6
         xPdC4CRCMJLVfaVZLqX9cmamUMJFmDF/0gjb93WyYNxEvADbiGmLcqI+0nDLKixmkDWv
         aXuQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO0adaQAwdbKYxlgArioePyLfHM/9yg4AjhCTaR7q7SFx+6iN5+CtpB/W9J0xvNpshnzvK5nGRePrQOXc=@vger.kernel.org
X-Gm-Message-State: AFuF++ku+5ZxyKI2IQh50A+NYXtq5XdfsKr8kVBn2QfgpdZrhgqPiSvk
	1yoAKL+lKohGfbbB3Iw1cu3EROdUB6gak3FTdFINh4JnldNpoL2iWb+HW/PctjmI+c2xxaPLDWU
	nA0N1vPjT0ybs6z/ump4H5Ci7RRBmOUdPowsNHK/VQAeNv4holQePhGxPSzZsEnp+EXXaHAgMHJ
	+bilNeHQ==
X-Gm-Gg: AYBFou3wiE4x5OcaZ5frxczB8L0aj7yp/7wa1kvkSWV65QCmqOW03q6wjVrfEdm1VV1
	89CN7PLLKHrvcmpMIlYz6bAfjEEa6CeqC2tUNYOKrq4yDdT/f7WIHP2GC65kXFDZX2ykTVx5YO9
	mBNwo06SGy9ioVOvtW2WEDzxvtjsxjH98U6eZfEHhdrgyj48Z1OJafq9QgLxIKPIZQnlFqblkYM
	ieUqquWludiFhSKFYn2R55RYEkFF3ZXtcFQmqFM/q9U6TDF5lbKt/x56nIF0zdEm5KPTKAvutFj
	o3kh1vXJT20oozejGkSMzoje6ivlesh92X7Vn9tcG+uuAQWIQBusfyzhsMAttp6iM5KVLK9Tves
	eWlNurkSIamKYMiGdY/i8F/pBhU8GZiO+BY/KZHctVtmE8M0NMUhvWg==
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr2255762a91.14.1788190912289;
        Mon, 31 Aug 2026 08:41:52 -0700 (PDT)
X-Received: by 2002:a17:90a:d887:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39907e0f87bmr2255684a91.14.1788190911820;
        Mon, 31 Aug 2026 08:41:51 -0700 (PDT)
Received: from resolute-linux.lxd (211-75-139-218.hinet-ip.hinet.net. [211.75.139.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d62b807sm36228a91.16.2026.08.31.08.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:41:50 -0700 (PDT)
From: Aristo Chen <aristo.chen@canonical.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aristo Chen <aristo.chen@canonical.com>
Subject: [PATCH v1 0/3] usb: gadget: fix WebUSB landing page handling
Date: Mon, 31 Aug 2026 15:39:36 +0000
Message-ID: <20260831154139.55811-1-aristo.chen@canonical.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes for the WebUSB landing page path, found while reading
webusb_landingPage_store() and the descriptor emission that consumes
what it stores.  The first two are bugs, the third is the cleanup that
made the second one easier to see.

Patch 1 stores the landing page without a NUL terminator when the URL
is exactly WEBUSB_URL_RAW_MAX_LENGTH bytes, because the buffer is sized
to hold the longest legal URL and nothing more.  webusb_landingPage_show()
then reads past the end of that array.  It currently stops in the zeroed
padding before the next member, so nothing is disclosed, but the
terminator that ought to stop it is simply absent.  A 260 byte URL is
legitimate, since after the "https://" prefix is stripped it is exactly
a 255 byte descriptor, so the buffer gains a byte for the terminator
rather than the limit losing one.

Patch 2 fixes the emission side.  The strnlen() bound subtracts the
descriptor header from a field that already excludes it, and the host's
w_length is folded into the URL length, which conflates how much URL
there is, how large the descriptor is, and how many bytes were asked
for.  The result is a URL copy bounded by the request rather than by
URL[], a u8 bLength that wraps for w_length 256..259, a bLength that
describes the transfer instead of the descriptor, and a reply longer
than the data stage for w_length below 3.  Computing the URL length
once and clamping only the reply removes all four.

Patch 3 drops a dead store in webusb_landingPage_store() and renames the
variable to what it actually holds.  No functional change.

The two fixes are independent; patch 2 is correct with or without patch
1 applied.  Only patch 3 depends on ordering, and it is last.

I do not have a WebUSB host handy, so the descriptor arithmetic in patch
2 was checked by transcribing the before and after logic into userspace
and sweeping every (URL, w_length) pair up to USB_COMP_EP0_BUFSIZ: no
copy past URL[], no bLength wrap, no reply exceeding w_length, and
bLength always equal to the true descriptor size.  The store side was
modelled the same way, with the existing behaviour first read off the
webusb/landingPage attribute of a running kernel so the model could be
checked against it: patch 3 changes nothing observable, and patch 1
changes nothing but the terminator.

Aristo Chen (3):
  usb: gadget: configfs: fix WebUSB landing page missing NUL terminator
  usb: gadget: composite: fix WebUSB URL descriptor length handling
  usb: gadget: configfs: drop dead store in webusb_landingPage_store()

 drivers/usb/gadget/composite.c | 33 ++++++++++++++++++---------------
 drivers/usb/gadget/configfs.c  | 22 ++++++++++------------
 include/linux/usb/composite.h  |  2 +-
 include/linux/usb/webusb.h     |  5 ++++-
 4 files changed, 33 insertions(+), 29 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

