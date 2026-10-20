Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540327;
	b=fXUrsRRzIEhKCYTBuvI/twDU7hOwFPsu+/GvXaruUA97iZfRY7Tz0cXjHVDHk9LK/hAc
	 VrS7/eaZvZ4MBRezH5+6I4n4Lu7GrpOFDwrx/nFS+FiAcpkURQosAM7eZQO43iUHMCyR3
	 hRzlTKmI8FtJJyN5so5kIMOEcpf4xUlgvhyH7Hi/Kdl0Wn9L0vsbWMCD7T5E1vrcO+7Hz
	 /8JFWm4jE/0y/YkMj4Kj+4wqxczd4RCITERRYsQy9FNdYUL1EQMf53aqtBR8XKXEiX4Hm
	 yZIfHMgpdee/MiX+FkGuNNv35o1I//sgPlShRDi3/gHu48/j/OUrKNo4tZdGjFZf1mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s0EDmxFaEkL/j8eAXne0uZ63W5PYdrf9Cumh97hbnw4=;
	b=haNjZWjMJn7O6TTTJkiqjNhrKuggYGUZJNr8s0GOjhxq7Jjj12+kaRDrPxmYfCR5EF75
	 aNhU6BUM5zYZM9XlpPf0aUOtErihnroZ47+WLyLx4UR+oAJkxEZGFIPZu1qt4/b98vF4y
	 rXD19KLmJJ54emZ4bocVAnMwhYxarI2lnUtqChLk9Nxs0J9wZpt0kAsTZTsJJxhsi9vZy
	 Thzke05ASYDgk1Tvvr8U7YyxFI0YgN3sYC0qbYa8i+svFAeJYz0Br0Qs7nFOK4RDPVZqf
	 9QqRngxXXvesU17O/FaoHDrVj4kieTjsX8WG6WEDOCI59uPertXnA/fuF3l+07XC7hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a6jDOqWB;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7F606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB7F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a6jDOqWB
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso42313e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540326; x=1793145126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0EDmxFaEkL/j8eAXne0uZ63W5PYdrf9Cumh97hbnw4=;
        b=a6jDOqWBsZ3WJxxs7GoVS+nO9gT7sBzwMzsfWYjsLb05yjKdBKUmWDQrPG8LPdoj4d
         RLq0vZRuehpW5Geugsc/u9APfQuWGNWLI7Gc2yumYFvBTZQnoMsUqsGuumKPTZEDNuFN
         mnygSBJpjedrhIee++C0SZNqBFbrtB7p58Jt08emlnASiOtkHW5PFUhn+x353eFq1Tg1
         tSeqx+6a9lV+qkhLceblKgZVCw1MGNQ7Px3dYD1s8255JGwNhW7VCjUaY6IBtSG8rWMe
         CnjXTU8VMQXfvvQNn4170ROWa3VHnMv/DmzLvCbtZXW0Z2p7b92iR65UcoXu5Ic5WpzE
         CCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540326; x=1793145126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0EDmxFaEkL/j8eAXne0uZ63W5PYdrf9Cumh97hbnw4=;
        b=LqQrUghTPyUGAdfEZJXBJJqBdhKFJ9C97Eo6kseqV6CcD85RMpBcs1DwAakbJt8mAO
         lLbTydzfvyVomTZyqrTi6oAyNwZMO1vTucqnDI4QvXV9spved1Q8dZ3s1GbSv4+iaSbV
         F+0/3tgp50kIrJCw7aFWzSP+do0TE0QhC5XUGfnf5TRDx8qRl7BmzMHwq5k8hAjWcr+P
         lCsFql9F55xTRnYVm3SqXd1REvFL5bQ7WTN/MD8kw+s+VJsejk5gpeMK0P76N7lhsp1T
         Pokd0Hk4beAA3gmfoB/qvgFp5LbVZOGXSqUh+DP/Ai62rEaq2w+BkhIe5tHUQStT6CcX
         n6Hw==
X-Gm-Message-State: AFq9FYIHEe7+7TyllX3JqM0/XI18bMkI4fbdlN1Z2F/Z82zbm2gDW0wg
	VZUeeOmVR+JxGLhW8ERJ+XUzdC1Tc+rchBWNb5xq9+fpXV5hkANgWAb2
X-Gm-Gg: AYBFou3coUams1ntaVnRlTC6kYdPp8UAbu9jC+ySMUXFXvE/6+1kvF0VDKfr1UF6OYM
	NIyWXVChrJjqplwlHX6bLT1R5TRVduSLz6tmWqTe74NqR/h30rq3FF0fU6MZgZoWNLjzk+kJfJw
	ap/JokBM3HYDIsC4kp5aOt2IPdTRANJ9pq3HX8ITds/ak4JUOAKneEy3DVic2jgikYJshAoekRJ
	1Nyt0dxfydagQCSzVRMmjJR4CP4gctFuFY5lPRfTzkVXmQsRv3AyafjQEXGBWGsKwr2hPKAAIlt
	q3Bgo1SV44Lwn+ggoDU50UdoXimjt7BK357Y37Nmqgb5R9n0KDXzkSfpuJ3LXEzCD/MTjfwhf/9
	FlAy4zkhc4mYSMG73haas+wuVXZgQWQWXtWFxIgdg3NPF+szkALVL0RnpubxtDP7zKiUWklGC7U
	S5p9Ta24N7WGIWumTaYnR5Uh1sjZEyNUq+rgMTkCwylFbFxA4MtaabIXWyE+Rp/5q0O8W4XepXS
	eDav52GmI5t3IxWXjx8fT+jEAwtQudBGsuTWdc=
X-Received: by 2002:a05:6123:22:b0:5ea:c120:4514 with SMTP id 71dfb90a1353d-5eaebe26980mr100730e0c.15.1792540326370;
        Tue, 20 Oct 2026 16:52:06 -0700 (PDT)
Received: from tutebook.tail57d09c.ts.net ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983a9aesm1172772e0c.16.2026.10.20.16.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:52:05 -0700 (PDT)
From: TuteMthCD <matias.civadda2342001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	chris@miget.com,
	TuteMthCD <matias.civadda2342001@gmail.com>
Subject: [PATCH v3 2/2] platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling
Date: Tue, 20 Oct 2026 20:49:27 -0300
Message-ID: <20261020234927.121570-3-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
References: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
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

The TIMI Redmi Book Pro 14 2022 (TM2107) stores the MIFS WMI return
code at the end of the response and uses different profile values:
0 for performance, 1 for balanced and 2 for low power.

Add a DMI entry using the existing quirks infrastructure to select
the correct response layout and profile mapping.

Skip the adapter-type query on this model to allow performance mode
with its USB-C charger, while retaining the external-power check.

Tested profile switching on physical TM2107 hardware.

Assisted-by: LLM
Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 522b38e9755e..8c1ec6f1166c 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -116,7 +116,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2107_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   2 },
+	{ PLATFORM_PROFILE_BALANCED,    1 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0 },
+};
+
+static const struct bitland_mifs_quirks tm2107_quirks = {
+	.profile_entries = tm2107_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2107_profile_entries),
+	.return_code_at_end = true,
+	.skip_ac_type_check = true,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
+		},
+		.driver_data = (void *)&tm2107_quirks,
+	},
 	{}
 };
 
-- 
2.56.0

