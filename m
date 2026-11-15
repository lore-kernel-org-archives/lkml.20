Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785456;
	b=S9/6PFwlLNbHR7+vj1ZLvNkxYWql8PYHh2KfMKZ+CWCyQiXbZlmCaC8vvI9aIaGkYwrj
	 7kczUu+fmK8YnvmUzJ6Eobf0dYJz4iT43nUpv2Ot0t7duRubBQFNstfa8X3eH7KGrUMeP
	 4UYaNSHD+ZK0jjQiM0P6KuwRG8vjweZwlpP5pua4aQBAUVBKB+BNPGzu3C6LrgOUK3+vD
	 qs6a6vEJMLef29TLvLI/qrA0zMygN8zYGO0il8aw6MLKqNj/IIXatIVmq2AC5/isfyE1h
	 msHf4+mVmEVuTh84QojEYih0T/2PPZ+rNZeWn1YAeJtOW3bHZo6sDf0GHLC5Mc/tl0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZSTZnzB+/goUmQY4uXfHNp+kvqr8HTYl/TLMJ0sOAss=;
	b=q3YDLwTtsu30LI8+9kjvg/FcQimWfwNb3z/Yd0PTmWST28Lf62bQVPWEM+y1KKjIZZEE
	 wIAtEnStVZ6PQ8GV4fdHS7O7CzWm7+PtEf17M8T4BabL6NnceLfN3VRv+Vn060UYUwimO
	 Hb02Mh3wAYD+aH3VF6hUvuWajMTCEUsFeAx/sAvi9Jhk5FSuOYATTcppRIBzqdkNF0rsd
	 8A1Dgeg6EkTf6A4rRKsIhoNN4uMXypmZj1DjV+e57pFi5vwgLhye1b9LqP3yG1gOS5z59
	 xUUpWPi6hlyeuQeKdkVLvgDMDPMe+F1nwZGgQewjYgMCUWmsjCtJ9IOLm/U1LAoO4Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNVDzV2y;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD4606A338
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33CD4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fNVDzV2y
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-49465892f7bso2365845f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794785454; x=1795390254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSTZnzB+/goUmQY4uXfHNp+kvqr8HTYl/TLMJ0sOAss=;
        b=fNVDzV2yhbI5v+oAvz+8NTQSoWex0VwqDLorwGjYQuhEoceRB7X0SQpW60GNb+jDPw
         wnVmMISErQ0itZ9IhpAqKXbQ+r2mmOSzsEqEkcNAMkRpWqokgxPbqMXETN1MnOZpmBNf
         PtlupY5ZZtW8jDj+b7E6ufidhR+MltZknhrFT8tl7FKbbPiGBqJnCwPEApDQO3vaj4TN
         PgXOeCGhEuxDEM1y49UFqNFS18rXc3XmPqAdUBJd8ZNPmdhdtVJHPQzTMmYrvgEB3Pkv
         ktSl9mhdzy0/p6oJASOBrkXimL8OA1vQbGkhJa7nMVBqbugLvdbqafEKIVec2q3AtkE7
         Ky+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785454; x=1795390254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSTZnzB+/goUmQY4uXfHNp+kvqr8HTYl/TLMJ0sOAss=;
        b=u3/Hm6F6pQFZp5N0nS2c4c21NbjOiNkPSa01GDz6tWhQ+VQEBecBneXaXQD5DqDLgX
         KwFQdbSeyLdYEDiM+UFCVeV2olI0jlZymMROrlwHsrqChiQfu85Wt7F9l1Ct2sV0vu4Y
         yZcck+PeBSIsVo8IzernAenrpTq9gUK1E8vkxUmrcQDdvry7j3MNCD3I18RtDD0XJl9s
         sFqDtbBiKvdXs/NxiZbO/kCL6KIQoOdC1drlRlhbI3UdjD4lzz8ZNIswbyXQEEDEjd4I
         cyjBr3ncWSvLN7Y9t1xR82JTbJZ9dCJyF+VHpdFKUdnc+9mi3JwpGB8xZ5TF1toN+l5n
         24Ug==
X-Forwarded-Encrypted: i=1; AL+hErGW71RHCUWku8v9BlshrE77AJuLzxXS+qiZuU9EZ9OWWk0Kqi94+qvu9Llan+/4Uq63gfnR6B4gH+ti6I4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NenuuBBl55v0fmz1RyBNzgGS/20sRT1rrd7Uot7zYS1khY7t3
	reQU7VTZZhrM7MzDvFVEH8x3CGGaf22K5yyA11AjCHlR8JO1W3m47Y7v
X-Gm-Gg: AYBFou2iOoQ5J1gdfJdSpClC6p+FZMpnfXJt5yv5NfhBjVXe1wpMhIy76yO3lQ/4YcP
	AuZQKj3LqEdwyOd4Mslk7fysFRhNy3LW4bpxujmo2kW6HYueEo7KS32zr6VkYieIZE5Vf+d06R/
	FSKctCLJDD6T8Do4/Un6ZMYbeLT4tZafezkTy8JXdUvt5Ju8IeCK3jrSZy/yvbhnEewnuv2rR06
	mQy0hUgC4OKc4i+UHGdLSqu33IdixPFNI91vpadiZ+Nn8/W/vBDpbc0ymu4jNAQhuOSNcCIMmtt
	+v0xXDWzRt0KYVIx9MkDchULKPXTHTtNUy51mTLwoUzGbhuPvVRBs9Jeaq4xaBxMOqueOl9+utn
	+mGxEHKgfbPH26YDGP5ha/cqYJ+crttRRqVevAfmk36N2IQ0OoVympg4WzWiRMm5AykrCnDW0yo
	NcN41dlEPxQ1otmCsb8U0HyZ1MgwiTvrZcqA2uAz28JXZVIhn9/O72Ik4wDtcDe/OSeJqNzSvA0
	Jv4I2rHmKYaiCCBimduXTYG0CSVnghvEDMaOVsT84yQpe2F5HvfEvHZdWU69yXolDlswXIqcIW9
	6GMMudODbzAePatw5+xwoQvKZLvM0MAQx/5iMaBbN9KLbVG/+GhpE/ESPcLiKUAVmC9w+VafNFL
	m
X-Received: by 2002:a05:6000:992:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-49c71e3db14mr17535675f8f.33.1794785453654;
        Sun, 15 Nov 2026 15:30:53 -0800 (PST)
Received: from DOLFIUS (46.85-87-100.dynamic.clientes.euskaltel.es. [85.87.100.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6d079a2asm16787373f8f.16.2026.11.15.15.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:30:53 -0800 (PST)
From: Adolfo Morales Tena <spidermanadolfo@gmail.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	Vijendar.Mukunda@amd.com
Cc: venkataprasad.potturu@amd.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	Adolfo Morales Tena <spidermanadolfo@gmail.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ
Date: Mon, 16 Nov 2026 00:29:42 +0100
Message-ID: <20261115232942.5820-1-spidermanadolfo@gmail.com>
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

The GIGABYTE EAGLE 9MJ has a digital microphone connected to the
ACP6x PDM controller, but it is not listed in the quirk table. As a
result the machine driver does not register the sound card and the
internal microphone is unusable.

Add a DMI entry to enable the DMIC. With it, the acp6x card is
registered and the internal microphone records correctly. The kernel
log shows:

  acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI

Signed-off-by: Adolfo Morales Tena <spidermanadolfo@gmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index e14c73e7e..f636b5ba5 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -969,6 +969,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A16 FA607NUQ"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "GIGABYTE EAGLE 9MJ"),
+		}
+	},
 	{}
 };
 
-- 
2.56.0

