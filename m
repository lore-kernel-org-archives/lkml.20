Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936383;
	b=KH+C3pRPrG01ifb8UorarxaDT9RSqOx9n5yx/+Vq9jSwQRn4X42MniYJOMOv8bnOYMZ0
	 MN9yaeAN2S1Gtf5D2LAxaw7K3OM9y3Mg23VmD2b+k2cZE6RAHe42zolA6Xd+ttQ0i1CVF
	 6xakjN+vCCh1bXKu14VjSrf/9kykVYxPB5n7KMge+HS944KrGXEI9gDMq22CuTeZdS9MR
	 0F7UZHb84HjDV9UIDkihP4LQ0JLT7LKQQ6yK9R2wRVV5gNI4KCtrn3KJMOBJeKWjv2NWR
	 tFjTPBID90epXlAiTQ5SX8pqXmWIVmXiNEMrr6WucvU3EEAT0gLTp4Q+Ut1Nr1l5MIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=M+o9+9qekLBCMmwzgiZ85/sw7Z0aupiEWaDsdwZ/4vM=;
	b=5tBFpqXncmXkfSqU5vVnJCZ7SqbxlG5y9mg6fmkgqHGGR3S6iNTSHaElRG1lgMlZ/ndU
	 8p4z8taCLTllAeJ/63TZbHlA/Gruh6V5zl1OldSm3jfuIrsQUSQp7BimQfiKuMSU76njn
	 1w+vOQ3RMM1dZXaUQ5n3nu0wWAGuXwF0wA6tCOHquRpXBzsX2ILEjfXNZ6QyAWcCcUPQi
	 dw3ITJReL2gInNXGTS8CZDRaZSEqRt0iRnUDF36/0r+ontepokRaUKLDxw+5p9qcv6Pds
	 F0xVkr6ESRImvQ0wfMkCAyrevbY9KIVyIgfn+eS9MeGdfHvCsTUarhG0dDzd+X0mZ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrpOdjQX;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DFC606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lrpOdjQX
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a8cc11ac42so99443c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936382; x=1795541182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M+o9+9qekLBCMmwzgiZ85/sw7Z0aupiEWaDsdwZ/4vM=;
        b=lrpOdjQXBkqUxxULtoY/C0zWkzRPNV8v9WPWwkie6mJNfrRKPe79e6wA0+DFLUp8LZ
         yZjaOYS1qN1PdIHncPT3qqkwux8/LI/qM8Gg6HtuASnXYKBNJW3yQ3EQmVj7iFuNDfIe
         drj+2qZIrdViGVUXMrYdejHOi8go7g1A+ZdU0YsODa59s0SLJGRfpiPrjBuxyp34fIIL
         bbXR1b+a6jvF9VmwEjYzEwKKI/u46m7fbo0P6KejAbPBvUv2Nnnj/6BcPsn0FR0eH4mS
         mIxcDKI/4xQCMdje79OxI1SBfxZvY7PlLXwwjLA20wHJ2n4Ti279uOC6z86M+427Ib0e
         MAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936382; x=1795541182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M+o9+9qekLBCMmwzgiZ85/sw7Z0aupiEWaDsdwZ/4vM=;
        b=HQXcxgXi1GaYjxhdidurIFt7dW2ppa2RN6gRan11Xo7c8IvYV9Y999u+0IMOoSHGqP
         cXofW8Lp2BUxGuMSW0UMfL0sON/uKUICUk4cCuBO/lqDaTTqnfcTmYkpmHMf1gh1aRAw
         hCyNZd3DmIEbzYaKgX68Uvt9n1rU7ladWbN3m91bpyWA79SJTQWL7sQYyFRzDiVcfIR+
         6Itz92Tr76XT+RYvHzODbNDJVUOQtVXtDB48Z5Ebd4S9eZh2yxnTTXFCI6lKpwMvLoMH
         GFNtxF7POxeyX86HH04OlkckkJO72Bl/VSEGIRy0RXyua9Fl9och5TjH7NZ5aXR2K/lV
         m7Gw==
X-Forwarded-Encrypted: i=1; AL+hErE2QNnMYFNv79SoTi9WQBiwuPnHuDbHAX1h4vdHUuaOQgN1K0JtfiywlB5cjctnaBrIrWV2IZyFGW76sRg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MuEWVCULKnRkywNDpCsPcORIhg8c5/l0IHdZwkFWvpglNmM33
	UBcPBkHNuxg7jUUNNrNt46piLmGuaMLpYaqz1XglFXhcapaA+n/JhOHP
X-Gm-Gg: AYBFou14mdP/r48sIzNz2gbay8OAoZgtb6qRk1yHqSMOxhZh5tmg/T1lVgd5VcCHT4k
	cQzHc71B1dWUPM3WGN9Fiw5gMV1c3o7rUWMlPZ2phulQ7UzVgU82ZOJv7LEm4ddm0MBInlmKz9q
	wfqNhuXs3xnayiDsHYg9C8t+WVOo59ClF/mp2B7OhxqCDVX5WChGGxO2r8ohoqy94srLOBQ5xle
	1uK1zcB9N3klMrmzT5aEjE9MFfR1VLF9ClfNPvKqFfP4G9Z3CoweDvLpm3aDmwiKWlDCQ6NxFAb
	XQVCYy6yt5cTf3j03R7z3iaRNH7GvmnLEmn6KFkmvx1TE0xRDU3c2uQwT1OsFKrdPMZvCqZKKvn
	Na0er+lLJays3V0vabvYr5XmX6ui1xym7B6o85JQI71qiB47oQBqhq5wXY6e+Zy0p6RQvobxnOK
	kHdGo4AHIop5w3SFqlXP1Z3/NN3K2lOU8yCVumKvTlv9NuDAZNmLwUuTr1cg5BUbsmXyYOpVdgw
	bVYWLk8fp/1G18WuO7w1Ak4WdijksZDRp1DpLZ9KY26xd58zAxSczoDuXP5dbH01hk4GNIMh4X8
	UKqujRxEvH77+m1EaTpgauH2KNFfn4km2lZzR8vxv5z5Ly8Kl4MET4XD2CH2nGXzIeOqJKGePg5
	NrwUydiH3BnLFWh1bXzplutpLP296y1P87cd7B3Bq6M//vkfvwN5c38H1DBqkyRoVFJJdM/rSOL
	EAacWA3p9YWGJp/XKVWQh8l5gJPfPWMvbPH2nR2WfvCcQ=
X-Received: by 2002:a05:7022:7e82:b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b543c23b8amr254647c88.5.1794936381830;
        Tue, 17 Nov 2026 09:26:21 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm14263079c88.0.2026.11.17.09.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:26:21 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>,
	Daniel Campello <campello@chromium.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 0/2] Semtech SX9xxx: add a reviewer entry and binding maintainer
Date: Tue, 17 Nov 2026 22:56:07 +0530
Message-ID: <20261117172612.25535-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add a MAINTAINERS reviewer entry for the Semtech SX9310, SX9324, SX9360
and SX9500 proximity drivers, and add myself to the maintainers of their
DT bindings.

Jonathan agreed to a reviewer-only entry here:
https://lore.kernel.org/all/20261117031830.69ac22f5@jic23-hlaptop/

Changes in v3:
- Patch 2: replace the Link: tag and the reference to it with a
  Suggested-by: tag (Andy)
- Patch 2: drop the L: line, the IIO subsystem entry already provides
  linux-iio for these files (Andy)
- Patch 2: drop the DT binding F: lines, patch 1 already lists me in
  the maintainers: field of the bindings (Andy)

v2: https://lore.kernel.org/all/20261117110939.214932-1-kapoorarnav43@gmail.com/
v1: https://lore.kernel.org/all/20261117094737.15253-1-kapoorarnav43@gmail.com/

Arnav Kapoor (2):
  dt-bindings: iio: proximity: semtech: add myself as maintainer
  MAINTAINERS: add a reviewer entry for the Semtech SX9xxx proximity
    drivers

 .../devicetree/bindings/iio/proximity/semtech,sx9310.yaml | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9324.yaml | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9360.yaml | 1 +
 .../devicetree/bindings/iio/proximity/semtech,sx9500.yaml | 1 +
 MAINTAINERS                                               | 8 ++++++++
 5 files changed, 12 insertions(+)


base-commit: 20ce8ef9c9e04cd6c5ae0422e251a9b5936c6b7c
-- 
2.53.0

