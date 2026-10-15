Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C1F29B8E1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024926; cv=none; b=Lo1L/Q/+w1BaGZi6zxPD8Bm46XdTbiJLCzGLg4/dPoa6PgIRpimbUr1RYD458PSQoE17Sn+bqwcqqjHAlkMtV0JLkqnQM5dxkC1SZUxVbh320tRUDTTkNsUmwfC/oRIH0QVE6qL10Qu6GLdD15bPrKAH+NMzRU8jNv/IzYW7zDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024926; c=relaxed/simple;
	bh=BF1Y3/556CLUCbcA6x5oq9iYNfwxTBVRPqEYblUZpSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UkKNSpy+u5b6e+FT423pC+oY49HQnsT4cB4haTzKHwsGIgbH0lbw6LRTwEWx/GXrY2HkdvY4is/0RYVKCVlIn05orV3Sedd9K0TwYH2YWwXUGemoBd4ql4psir+3quQwnadt3kx15EswtRjAoZyh6ib2d/yjl32PjnU9UtX7NsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psspP2Hj; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psspP2Hj"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917c04630c2so59398616d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024924; x=1792629724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OENt6rekm3+B+eT8GskTniTAOyO03tZDBwcBOw+E9Ek=;
        b=psspP2HjM4v8eFoxIkU7aqpfcU/XDvm4CF/JEsZHwGlvWoeqjkG/mnNgq/QVnmqdRL
         qS7RDAn6+eUfRykImRJl5gewjPd//johLN8np1HQbLCJviO368XdNkRCc2OPIosKyT2C
         scWUTR1SMZKUwxlR2QdXGexpI4bQs9xAmQ/wGAWNs+fssu1zpOV0EHv+/hv28SvtJ2k6
         aT4hz5Uhqfjl4mAKYSrkK9tFN6iyG/vedKJabZ4sgTu6GiYRMykMus/Ok+6ITiMFAeOS
         53LKFaEelL+WLdWEV+LeFGmfHi3h7YMviWQEchgBjSA4ue5gIDABKYctkaLV5Kwat0Hi
         LbIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024924; x=1792629724;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OENt6rekm3+B+eT8GskTniTAOyO03tZDBwcBOw+E9Ek=;
        b=02gPusRWe89KElppLuEG0HyeK9RIDZkm6X/xlvqOTVVKXQzSswvGHYcLTHxV+CTerQ
         yTg/9cqobdGsdXB43T1DNm3QQdtiCS5zJ2knJ3+M5muSMJdknSIgmsyEEpr1s9npsjt+
         FXNINRrbDjJO1fsoXWkXZKs8gKlvswgDjZAW2P/0D2HTt2cnxYlYAaeuK5wpXZ5nBXNe
         9xHDkXjnL5POUiDp8RnDphxJoFrSfubl+CdruVKxgphsr0oO2dZ7uhxZXP4awVevF5e7
         +v3Cli0mtQ3GMu5GVIHNyLh3I8i22x1gx7ogmE6uBWMJCi5IJ4j/85+5fjQulWDkvTWH
         JDLA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ8fpnSK4uTLCIPSd7kVVamczxVFOwidf33l6BQNymSvYwT7twKHAc0pqTTi5ra9dC3t5S43eZhusl8lE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlB+c32FXdeQEFrM7lrf+YxedeALepGzznWZP3AI3OJOI3nPKX
	fTHPo8bJADFcy/Zvf6ga+t/g4/Q88+Wsjg71UbWJ44O9Ad6/E/eCFOw=
X-Gm-Gg: AYBFou0AcqZkJM3jaDl1QpEflk4bgE3N/im3aAPbph6OlCszlg5BCYwaHRg2bO2FkG8
	ihT2cBd4KTjVLTsUiXKJ7YZ4RyaBKTdNsLq5dFCARLTHrP8vCgUgAUqq1OlXD9WI/oQ1rNfUYr1
	Isgv1gLGMRvVZf6AJtdBB+kNIzroQkodDyb/99/hZl1uDUT3dzXoHHOmPjaadUJVwI0Jlp1NQ3Q
	4l5vqpC1TWl4QFkecPBpj7cNWmzzviJi16gE/IAnsseTwrELEHWqeWUA8fk0NNEzYZPjMBPho1g
	E6vD1fkUFYxodolA/HQaFzMzILFOgzAaZPgQU6mXCkNmVSpVDAf8WzJJUSIN0d00HFKgA6oCtAJ
	xL0I42b8+IPpUaDeEin5JFKkdPPIZP7fNMX5GW7n+r0pOyhYPyxNutwbeDLOkD5MAZZzsxmp6L3
	0E6n4WcVKGbLtjKOaEpjFMzB5XNsliyog9am0wvvxUC7CXFzrfMzCbgdHWbZh5tGdxjz8fDbn7l
	E96LuF3k6OTxX6ph55evKx/0VwrIR4JJtYyvS9RfQYe053LQlcpS2X0WWdvHM4kFo/Vjl58MUDJ
	m3plBsk=
X-Received: by 2002:a05:6214:5d08:b0:917:a256:c151 with SMTP id 6a1803df08f44-91b557c63f4mr343104726d6.45.1792024923994;
        Wed, 14 Oct 2026 17:42:03 -0700 (PDT)
Received: from gmail.com ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b7b31esm66811476d6.26.2026.10.14.17.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 17:42:03 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ae878000@gmail.com,
	jacopo.mondi+renesas@ideasonboard.com,
	sakari.ailus@linux.intel.com
Subject: [PATCH v2 1/2] media: rcar-isp: distinguish absent cores from registration failures
Date: Wed, 14 Oct 2026 20:41:58 -0400
Message-ID: <20261015004159.2202899-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015004159.2202899-1-mhun512@gmail.com>
References: <20261015004159.2202899-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

risp_core_probe() clears core->base when resource setup fails. Once
resource setup has succeeded, it leaves core->base set while unwinding
errors from the remaining registration steps, including destruction of
core->rpp and release of the VSPX device reference.

risp_probe() treats every -ENODEV from risp_core_probe() as an absent
optional core. If a later registration step returns that error, the
parent probe can continue and subsequently call risp_core_remove() on
resources that have already been released.

Only accept -ENODEV as an absent core when core->base is NULL. Otherwise,
propagate the error through the parent probe's subdevice cleanup. This
also keeps failures from the later IRQ request in the following patch
from being mistaken for an absent core.

This issue was identified during our ongoing research while reviewing
kernel code.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Split the -ENODEV handling out of the IRQ lifetime fix, as requested
  by Niklas Soderlund.

v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

 drivers/media/platform/renesas/rcar-isp/csisp.c | 2 ++
 1 file changed, 2 insertions(+)
diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
index 53ce47020d170454b3d208bce7f4d6aad76764d3..73bf7e42bad2ac1ec2493cd8ec81003cce05a3dd 100644
--- a/drivers/media/platform/renesas/rcar-isp/csisp.c
+++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
@@ -563,6 +563,8 @@ static int risp_probe(struct platform_device *pdev)
 		isp->subdev.internal_ops = &risp_cs_internal_ops;
 		break;
 	case -ENODEV:
+		if (isp->core.base)
+			goto error_subdev;
 		/* The device don't have an ISP core, that is OK. */
 		ret = 0;
 		break;
