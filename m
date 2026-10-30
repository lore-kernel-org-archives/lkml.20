Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348612;
	b=OgqIXkcyPG+X+LWvnUwQ3XeP8LKYtgv7ATJRl3d3IkYEayz/RzigJyM7meDskrRB+srN
	 wBdoLvVikGZFvAHJ3p9ohKT92cnvrNdHRF2n3r2kSOMGyLWfK4oDr2a5cC8NPwf2+ae/X
	 MRDqjLS1zjcPqEWR7zd1vafsp5paDfaBJs4dFefxFrP1WVFhbWpSYwLpvskV+yQhJ3hBx
	 xU/hFz17FtIdnUdGpPju0mYvD+BhGKlzVARZevF/a1XNT2NdAJKqzMHXjhNQrmp2Q3WiN
	 OeoizxXZbRayi7Veo+IiVzq3qCYH5aXCvT9MQm3LqWIvLyJOcrBeqjMFVubHRcnSpzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=twpZcGMX1zP2ESKIoukSbNlyKJlNlpD1PLJh3BmJrA4=;
	b=dK27b3hICSA7Us8G8wZUP3XQl9p9keWqmaWnhAREJEebUP0so2TWzZS4WuPqL9HVBQgZ
	 WGyICFg1N42nrZfcE/Lt5AQQEkd3LAdbAzDiV7LOClVCGSpq4jtrOgir+r+zABFB0GdqF
	 7jp4NUWZ2Y8qeqzBbpgXAUW8PkwzulYOFT7tcIsdo8cnSciPINyqJivqzasr98iLxW9+h
	 g7CelGIaXgb/aOIgNBX4tcL76sonOEQogEDsq2brrQcFI54GWI/9PgQMVDRCrrO2QxyTh
	 iZk9jdOyDneOalo/jd+dBjaYDF6IssYgp2NXxkDqFCGeiaQSTExGzg5l5YSl4FdcY9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jvdpfnp2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E31606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E31606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jvdpfnp2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso731101eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348611; x=1793953411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=twpZcGMX1zP2ESKIoukSbNlyKJlNlpD1PLJh3BmJrA4=;
        b=Jvdpfnp2rAepggoglivU8Jj0dXbrYENF5bizpKkTx2fylTJnf5OhFzBCorBiqjdLqQ
         QQ/AXI/YLOKk9lPR998N9OXo8EFXYumRO3sc+VUST1ZLAXAE5JIMkTa/A9QHWN22fPEx
         lkljwWYLW1KhIwzYdPi+AT2+RVqzhABJU4sJOy6ZvEmCl5pl9b2BzRQy8nZ5Q13VEF1C
         F5ZPbt0A9z4TnJ/Or9S1KHgydaorfYFAgoJ9fx5A9ESODWkTa0it8p2TL879IzqhZCw2
         j//RvctB8Hwo9QXQeNGc3YAaK29+Gl5uItnQhjLV4aun+9hL7AdEoJDuZbpRWvcwZqYD
         nhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348611; x=1793953411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twpZcGMX1zP2ESKIoukSbNlyKJlNlpD1PLJh3BmJrA4=;
        b=aANkdT7ESPMHrqvAuUmW+SSmawJ9QlT6Lf7oxan4i+QxKQsGozYUnovyVM8saV9HAg
         SnJpEkY81JSA4UCy4NkgTzttfGLeEminA5FqyTEHUbtFJEtC/0aFGdAOc3szsqGJbLKL
         uGgJvoA7TOGU/MQ7/t8S1QLmn/pN6XhfIgTT8tc4Nl+tvdadz5MZYjQ4SiIxvzinXw2a
         FXfD6HVSLydYNxT3OjucGZedLVKt6FPcmAEMutISdpaz8zIVJN8QuSuY0Am+X5oBwlaW
         8Nx9oBi+wTNAdmhautDBszIeJhuDmLEiAP6gHWjmsUFPapMG5px1DmHqk7tGSfPiDm1x
         43QQ==
X-Forwarded-Encrypted: i=1; AKwUvBy80KZH66Cloizqv2G+3Nd7pvMPZkGhINplf7/prdnZ2s/TOyHyC8cSNon07h2MzWUfxT6eeCiof0kSSqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBuqYiTkKYrz55uTLLNuYyrF/krh7GlkSbUFLn/L/QZGHl6frv
	YaJ15tJleFBNRHiP0ZEjUiLbVoNXwgrgc9cOP+J2oIuV5VmRr5ZXv7I4
X-Gm-Gg: AYBFou36DjIpG7+4aUe3rnbjCb3cFn6CT+u0KpNtkFKq2GJB3+IfzYoa0NwCRWZsERE
	Nzn5wodgHQGEQ/kmfO8UHZ358lBI+CDKECuOZgVQ4JAzmhVAMMC09WsKImJAzywdkftnKGAg6+v
	V4az4mbX9ZQi4MXIEqSwDPPRY0qvqmnGQb6XS6DI5M101beTvZc2kOFCnOEWytn24AgTTo7DYLI
	kQQGo9EV4qoebLs1X23E2qSCHPLy9JvgP0RA3RCH2Wne3snPzwnCPhtDfaBML0GqZn5AxnGno6f
	80igg6TY83N8z59F8zFTw1zJ9BowsbU59cPXykn40gTNzJ0AtB4DcK8b1le9HWWlhsteu8sxDTP
	Mk1EtgSSJZhUkSFLK+dKsIWydGqpZ2qbUj1Fpb5bbN1zMnEZdVo5NpEvRW2e6QDerzIIY9dyueL
	DzP/CttIY78FfYdHuIt0Ob/qDQ2AhegXpNZfD+0NI5YtQnlU4t2hPVbWRDRr/RlyRx9UREubxsa
	n5ga1varxpqQIU/Q2ZgueAqmj8gZ6iygmI7QDGxw4of+UCffJhBZxOostgn8Y9BCMqOBZ8dTdNC
	vYHQNupq3LSqjQo7SHQjJS/9BnLKtccwwc2J+dJ1sJMSQzBuoo2ozc6rMMc8J8cidg==
X-Received: by 2002:a05:7301:3a95:b0:36a:12c4:8bdd with SMTP id 5a478bee46e88-36a42389979mr3233844eec.21.1793348611213;
        Fri, 30 Oct 2026 01:23:31 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:30 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 0/8] platform/x86: intel: switch remaining mutex_init() to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:54 +0530
Message-ID: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Convert the remaining mutex_init() calls under drivers/platform/x86/intel/
to devm_mutex_init() so the mutex lifecycle is managed by devres.  This
removes the need for manual mutex_destroy() calls and fixes several
drivers that were missing mutex_destroy() on the teardown path entirely.

Each patch converts one driver and is independent of the others.

Build-tested on x86_64 with all eight drivers compiled in.

Chitransh Mandhaniya (8):
  platform/x86: isst_if_mmio: switch to devm_mutex_init()
  platform/x86: isst_if_mbox_pci: switch to devm_mutex_init()
  platform/x86: pmt_crashlog: switch to devm_mutex_init()
  platform/x86: crystal_cove_charger: switch to devm_mutex_init()
  platform/x86: telemetry/pltdrv: switch to devm_mutex_init()
  platform/x86: ishtp_eclite: switch to devm_mutex_init()
  platform/x86: punit_ipc: switch to devm_mutex_init()
  platform/x86: sdsi: switch to devm_mutex_init()

 drivers/platform/x86/intel/crystal_cove_charger.c    |  4 +++-
 drivers/platform/x86/intel/ishtp_eclite.c            |  4 +++-
 drivers/platform/x86/intel/pmt/crashlog.c            |  6 ++++--
 drivers/platform/x86/intel/punit_ipc.c               |  4 +++-
 drivers/platform/x86/intel/sdsi.c                    |  4 +++-
 .../x86/intel/speed_select_if/isst_if_mbox_pci.c     | 12 ++++--------
 .../x86/intel/speed_select_if/isst_if_mmio.c         | 11 ++++-------
 drivers/platform/x86/intel/telemetry/pltdrv.c        |  8 ++++++--
 8 files changed, 30 insertions(+), 23 deletions(-)

-- 
2.43.0

