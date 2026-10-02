Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE6A3F54D9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968526; cv=none; b=K77N/lyJTcX7/nO0ngpAFoPmgQtGgAgqGljn8sqvENRXucc3TSyk0M30hRPkSvk60asA/dHIX2lts939PxjCh2c8H9luFniWIZ+SfphlJcs3f3Q+sEKM4Bl8YJ3HpnKiykEAk0R9abgq3DXM36pHHyc1zNWVzPVp5L/0NZmKyNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968526; c=relaxed/simple;
	bh=0v6EsoR5T+lucdH/eGhXBeOr7Ze3sxH1Mqvmwg12+vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egmkr1y6X+ioCvpSMDXA6O8JlQZnZMxcAJyJn0xKJobHUi/TZYCxHOjbREagsZOEUV+Mactyhzqk2RY1PzYLE7gVkR04VaZRRvjDoj9irqPgygBUXY2UBUuv+3sKeYfaWDs5v6CNTqfPRtIiAUgOMCF6QBxQ9vBuaLyGbbYut/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F73AVCVu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F73AVCVu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffde3cec6so1326555e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 12:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968523; x=1791573323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z3J1wTRaL7AOg2V1HNOvyAPEeXuGFQq5prc0aUbI2M=;
        b=F73AVCVu+7ekD5xjlNRVXCf/At7gGzEk2sS8qEW27lgLP+Lepaf4HMCowjrl31qP15
         pPLDpPn2uaEt9l7MzvjsbfThWNQYq8FX9BUUffTeL3544vNN6hv8QP29Tmb8eAMWrjXi
         Ozd40c7GpMdsujsUeACMXZunzO24m1+au59VeY/ZcjSqv/5hy9FDMfy7+nHHMrFhHK7I
         yk7TpXtJxsH963KGgZEfLa5JUUDLu89WhBLGD2Of8ytq9zAL3oPFSA7drpqQ4edm9c42
         g4J8H/CuAlBt/Cd4x0upT8qrQdrGsFpABAaMeXtogh9FuMNBtTs+qWU4zdCUBbBmEsB5
         U4Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968523; x=1791573323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Z3J1wTRaL7AOg2V1HNOvyAPEeXuGFQq5prc0aUbI2M=;
        b=0DX7jBklsFQSBA4RYjNkZapHZzyEtI/d5KaPRKm4wYUftT2MC83QrOVYpdBgz3WBnU
         AldauD97o962f8WTHc5bmIBKwqJEOLOc9Ri6ZqJdwYvmWBuqP8Yf6SAC5ERb7JUloODL
         EYGVSRPgZjVrfWci1hvEhRnCnx+bFi+SvVPMtbGphgWbSzvYHYTYD2NbqedEouCLH2xi
         wFMatcoEpSqZiidp+eqW6lQAwDprLwf/iQee+ed23Q4My70GopABybnc+Wc94as/saQy
         8FIlrpU4GnxoStMjjcgtPtj2WU3q3ONl2zRSqsnpuqxt5mZPZiAOW2ruRL/GMliHwKjJ
         Mgdg==
X-Forwarded-Encrypted: i=1; AKwUvBxGF5qpXwC3JZtpoVfvFr0dmD2T+MmHpp4zgQom7i8VZubKYFih4s/GD5KO6Hi53GcCJK8w4ewVawFfOCw=@vger.kernel.org
X-Gm-Message-State: AFuF++nR6uGzDJ/2ZoMRASdZM0N7hcY4EkPS2lxMSyJtUXr/kVJMNGqy
	CRXncbQhSbXZCO/LRo1OY4CHjLyhooBLvGBiISxvqiKKhhpZkCg2ywpf
X-Gm-Gg: AYBFou1tUajfp8edDG+okyVDieSclL2ad7qtR5sg3nLhLLbQgqB2/INXGmhWvyXw/+I
	bhu5n6TeG1L777Ht5SeUaYEBjA8mhl2VES9pDdjL+yw8qLOXR6fIuGrCreQRfKmsVP4e86nCMqm
	A1fwso5qRqv+hyGC5r+9G+POphzyoS6Kt1kocem7RwDPd+XoPsMzFPwls6vf+KKjEyXZasT4HNi
	Dict7jwC4RFbhN4WW2nlMxXomkKrXizWZKoX8vuWHKL5cXVeoer/MJVRMELeR3ebvlPK5HFtyuL
	TyYGDCY80Liv2TTYHmEIcF99fizGm2nqgcQ8Fvug8KT0M4Hoj3a2DXVdsIDaGjRUI9RWiNpqpMd
	LewHnIOZt79PvYWfyML9H51fuo9p7BAFJasVRCFdMNY1JyLAghBuPm/0xKz3w4jcz0r8SgJ7zco
	ThuLBdeZ35I6CS7+Sa6arMWBvjy6lNHjwBT/g2a9IgTeFqSiLarWjw01CaNpjzkOn8uI78JpyCn
	8a/J86ZJm1G10afykiesM0QVQpIbanG9aE2hhA7tGeVqm1teSQf
X-Received: by 2002:a05:600c:3b01:b0:49f:dd9f:6038 with SMTP id 5b1f17b1804b1-4a027573634mr54711305e9.25.1790968523131;
        Fri, 02 Oct 2026 12:15:23 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:15:22 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 9/9] platform/x86: hp-bioscfg: fix oops on short integer attribute buffer
Date: Sat,  3 Oct 2026 00:14:34 +0500
Message-ID: <20261002191434.58529-10-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002191434.58529-1-meatuni001@gmail.com>
References: <20261002191434.58529-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_populate_integer_elements_from_buffer() ignores the return value of
hp_get_string_from_buffer(). When fewer than 2 bytes are left in the
buffer, dst_size is 0, kcalloc() returns ZERO_SIZE_PTR and
hp_get_string_from_buffer() fails without writing to it, so
kstrtoint() faults on address 0x10.

Return the error instead.

Compile tested only.

Fixes: 6f2c06d5a467 ("platform/x86: hp-bioscfg: int-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v4:
 - New patch

 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
index a27907066..14317b7fd 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
@@ -331,7 +331,12 @@ static int hp_populate_integer_elements_from_buffer(u8 *buffer_ptr, u32 *buffer_
 	// VALUE:
 	integer_data->current_value = 0;
 
-	hp_get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+	ret = hp_get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+	if (ret < 0) {
+		kfree(dst);
+		return ret;
+	}
+
 	ret = kstrtoint(dst, 10, &integer_data->current_value);
 	if (ret)
 		pr_warn("Unable to convert string to integer: %s\n", dst);
-- 
2.43.0

