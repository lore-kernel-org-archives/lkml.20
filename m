Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875324;
	b=EBxjCkNcKO0AOPaeHYznZItkTIixp8Id/LdZrUAJldkBWbNGA4tCucSw9M0R0BYxiDPv
	 ThzseK1dllQ+xXnYOwKdkyzPe/1wWw7QUxrZY2oIHfhErcvc6GOEjvs5/8EiwthSukpqy
	 QHPPbuTZGPANkOE06j7RYm0qjKgWY8eA3zaW5+wn3JitSog4dHX3vo5NYXtsD45mGcS8w
	 0QsYyA/Ha1kRuRSMiuUrnpGmX+AZPq8cC6zfFQJkUHwUmEIkxLoaVjptN/m5LVBT83foC
	 oksE4AnjRXrXOzLRA+/XpHwubuB9bvuMeXy1C9NsYl6+43gnfQS5SJoxW7m0Xf6sjUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ve8WmCW8F4Rw5XzULuSdxjLcAQpU0NBVvl/d4u+KnPs=;
	b=nYiN6aV3tAM6kwWzb/KNgTa+wWjyA4mLeMava/vsGknZUN8JTYVjeg/B6f2RJ1bbyOxk
	 BGObmWnkbj447mO8HL0GmBnuGpCgTSdL8Zddmw9mL3a2jW7+k5+aNS/JIuELW8q2BilMm
	 qaOJGDoeRo093otgZ5XeKX4iwuYDq50GpqSmL2dXQ6WLBr48GnVwMzI4/o1FHuwpBkxr2
	 7Ys6vBHt14WjTNnutnCmHivv2TDNOCrSwkmB/CSY4ePLpE1fdSCITTtSP7UZZjVUkOJRY
	 ffXiCL5PDfSFP2kbhQE556KpH3YqxrQvinu6+p4rItKYO5CGQ5p2xZKxHvJedzjUYMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K0MCJq2/";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456D9606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K0MCJq2/
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1106501f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875323; x=1793480123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ve8WmCW8F4Rw5XzULuSdxjLcAQpU0NBVvl/d4u+KnPs=;
        b=K0MCJq2/or0s7v2cajYcC2plDUEAn1Ls2wm9tPSUUvWHqWvOe4XkO2yECI5t3bZbgf
         Dq4zmbMVpC1vZrhWnQ6Tuow+OhdHM5ExgOD95+F3y/+s6FDY43iu91Ei9Ly384RdLgjy
         Ro7scsjfFb9ljlQG0NvDvGATM3EdKD+QH5GJi+h0/bThDPNP9un/8wEMYuh1jxAwvKhB
         kauemy80VsUMMHiX97iR9Dmym9pQGya9zO/ngXTbEzHVl/g9undO8jaClzAANC8bkeae
         VvHeH7UjqsuBkZbTfcW4TPIxAFvJtAi5MWPmOCv0CqfF5rwRUUxOHpzHBN/RyXO4OhrG
         PRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875323; x=1793480123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ve8WmCW8F4Rw5XzULuSdxjLcAQpU0NBVvl/d4u+KnPs=;
        b=Xbm/+7Zf0KxKRnOAFApoReMvbJ/xelbcVNW6aWswQsHwAF3f8xB1Aor1cImpXRAG2o
         7u4GEe4YxLHCi9N2n7B7zvI+8Cl4IqOMvnvFbuVpc1J4jEeIi7lDnfkHABUjNe3dFC9Z
         w9vA6hGQQ0FsfdFXnXBnzeNgnOBNVnfAG6pcH36GhV1clY/R0w6Z2cABBEXcNVDSXPA0
         6UZEjUPR0soDZ1truvRMWClCDiddliBPPIwAIHgSZEFYSN5jL04vhabw5zECf0w/TVwE
         cgQgN1/RKQRuEf6gINGvdTSJPJ0Hgx74LtIhSOVyIQSNQ3+rQgB1uSwcpd3RLRfAk3d+
         S+YA==
X-Forwarded-Encrypted: i=1; AKwUvBw771vixokIvAAGp4D/x0VfVY3epl1eXf9TbS1rh0TnFoDr2hBiica066AWQm/bCaQhyAyczYaR/h+pFSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIayFN3KPtK1n6vJu398hWlPTGTPI/xdfqV0vBNg3q8HB+oyw+c
	0bOj7REq2p25DLRwhN23uB/Of2C7GB8qZHsZYTrsNnIeYSrZcbjjgtI=
X-Gm-Gg: AYBFou2jl7ghvPTnFELB0AdIqU/v4PtYDQSOwLg3cf05PSHjS0BjhnYR8OHARjJHUQI
	Q+0sNt2opKe3cQXwHqYPzx+6asMi0moKWY/Zmsnk7vFl6559OgvriuL9JqoYw6YvaIPyLuzyEt8
	VDaLrpGMhYBhEhKVxCsyABXuBxexErw/og1v8LVRjw7/2X0wHyw8fBoBd1fJdppoBxWcykKcsx0
	CLw6MDuuf6ePogrjB/wt5oUJwQPOy2SRNJn3f1wySnUhFVBd3EJs/MmlMTgGVC75ylLMtSCiNnv
	g9k5vg4KJU1xEtq7lfYbd+OrxuuKTbRmZmhK1F/Zwr8858rGDOT8/hbqhzF+G69nbg3LKZ6adOL
	VmgMNUQFHrYr7CTcuTeCOLNZ/nRgdGzp5M+j/1Olaz5TYHHJWoMEP7K3rrsFOyyNpZAHktZzpm/
	qtsL9VXvJh+iZvuzxJF7JdFuRyt5YEHWOBxOML5Adqzt2d3FUq0PVNpTaee5hwnxAPtjE2kILMp
	QU9aJTsfQnMKCqN7/jh2aEG5Ena+Lgg9vLT6AwVMmRCrw==
X-Received: by 2002:a05:600c:198e:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4a35ac9d1c2mr50560545e9.6.1792875322481;
        Sat, 24 Oct 2026 13:55:22 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4ba7sm6202889f8f.33.2026.10.24.13.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:55:21 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Anssi Hannula <anssi.hannula@iki.fi>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] platform/x86: hp-wmi: validate WMI return buffer length
Date: Sat, 24 Oct 2026 20:55:19 +0000
Message-ID: <20261024205519.4029617-1-tristmd@gmail.com>
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

hp_wmi_perform_query() casts the WMI return buffer to struct
bios_return without first checking that the buffer is large enough.
If firmware returns a buffer shorter than sizeof(struct bios_return),
the subsequent subtraction on buffer.length underflows, causing
memcpy to copy a near-maximal number of bytes and crash the kernel.

Add a buffer length check before accessing the return data, matching
the validation already present in the sibling hp-bioscfg driver.

Fixes: c3021ea1beee ("hp-wmi: allow setting input and output buffer sizes separately")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 615b4cf6fc451..81c0acc874f8e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -697,6 +697,13 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		goto out_free;
 	}
 
+	if (obj->buffer.length < sizeof(*bios_return)) {
+		pr_warn("query 0x%x returned undersized buffer (%u < %zu)\n",
+			query, obj->buffer.length, sizeof(*bios_return));
+		ret = -EINVAL;
+		goto out_free;
+	}
+
 	bios_return = (struct bios_return *)obj->buffer.pointer;
 	ret = bios_return->return_code;
 
-- 
2.47.3

