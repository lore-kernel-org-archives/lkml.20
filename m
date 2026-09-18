Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1BF3E315C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700518; cv=none; b=sIbPPSYpqvLebJ+dNPDzm/4utV0auJRzZf7yi7gY63RLD1zv6BknPpgQLi3/VtzNlwULGhxVMfoIkNP5yDr5e94VsLDtGFyNlCYI8vZ8VnPpufo9WNbDy+pe0BRRGxq/2+q9AG+rYbidOW5GdK08Sg/jcvwXyOR7nJeB6OyGEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700518; c=relaxed/simple;
	bh=HlGrFMsRs0IybKeXdKiG9q5NJ5arwAx2J4jsvINPDaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PtDvTjZP8Jwg/mQhPnqfTkbv/s/hyuEy2rmz7FRfK3K24AdKy/qnnsgKpqGRn42bocVFzyeyRISRg9tmlPCgLr/4oWzTjS6C4+VLcwqtQZ6kW5luF9aFaqO6gqNe7gsfJOHyG0bQ99B2OyBnUp5e1oEz11QBYJPuv+R5L5t1VMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DRkiIS+1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DRkiIS+1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db710396ffso11323635ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700511; x=1790305311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=DRkiIS+1AA1E2XXOJGwHEWECM9r16Zcs/SY7sOH7qpRyMQgZn9wowaUdo6Z4v2jRVB
         8ClCAeoZX1X23Iva2i6zy00DeEXVXFz3JyCnCUShTbbjEEg8p3nBPlOMdO4KL8de0oCJ
         vswx3kNwfUuLRhsoY8S9hYhD/BS3v02JLxdoBuklZbutVFGJtKMpIXUT8vax6VeFH7CV
         IXW/2B8JVjXqs5RTTHTwc4O2xOa9y+sruLg9nZDW16m35EWZjvLtPJw8rkXPi/DcK2CX
         xZcJCz8m4NV9OWgfo1Z67O55FLEc5q7jGRJIS/B6dwAmzJXWIaHEMmI3tQ74YX5T0/Kw
         Pg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700511; x=1790305311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPg1uLKI5p/H7J2E4b3w0DPqeVInWxkk5y+GYwVR13I=;
        b=loyiBYTAwsNfsKa21Q/Vv7wvl0Rf7J7HZnTYgbIBCtIm50pYF6YHrVXiaEryuBw+pC
         vdxp2R7N8owoL2hTOsXOKWqokTbwoZHveW59zKJBoOoEo2RIcNHtVscqP70Xf8bH6MuR
         KWvxkmO//0jqBhA20Fo2hVRA4I4guCguNuUdoPH2yaW0Co0S6LHXyg4Zdc3vzYrF/+x5
         9F+a8euS3RgkoF6WAbRKvlEHdtmyE256/q6E519ap4CwTmc4EEc/jJUlO/AczGJigy3b
         ZEc25vWWk07VN/RDoME0NOcpEc76ovTsThK6Y+kjsQx4t5ZWTbJrxxHz93N3wh/uytk/
         n9ow==
X-Forwarded-Encrypted: i=1; AKwUvByBW56nznxOrN5tKUXh+yZNywFhGDJ9YjJ0ftzAkPoYgz/HIQF4X+CbHvfJ7NM76L8TWtQ4dtKbWboS8a4=@vger.kernel.org
X-Gm-Message-State: AFuF++nK8EqJ7EjMHOlmb/pKGK23gFs2x7zOUKMWsRpk2zID1zh0DGm7
	Fk2g6GvJIC9kkxSeA4+8Pt4fRuu24HqubSkQ5AGG4620ZQzl3Ft5Jbg0
X-Gm-Gg: AYBFou28UucuCVawk13fFo29MG2rWadGhApPbFJUj4iSWGjjFa3TuC6RwGE1Yd6QIOF
	4er/DCuyoD7BqUNgUydN8QvqTVYfuZ7PrXaHkhZ10d/Rg9ep+GnQTL2chFBzohaV8vU3uOEqA5w
	9rxhnCUDQGaWqJlxQALgv3/iFNgAgPS2FPt3pY1FBZWadaI169GNYKojUtjYT0Fztd1dHMK35ZC
	CyUSSKhky04xfdSoL1MPzJf9DE/fOrDtHqP+JF/JdgYNEvGjF3lKpd+0LEf3QDZJKI7V0dBBsVo
	F6xmP4c4tCKzREFCq8zfvvMGaMuNQFB4OJ90B0Npu+RGeu6OW3J+Y49NymOQJWSBUBu3PHPA7xT
	uIank4G2/bDsyIfG4B2R7p165RJT0NLndB7IB1gAAAbB4MWlf4k/F6QWyafTn4/Xrnh1Y/IZnCL
	8azNwIMizTExT+RLBAyB8AYsdqjVN1aXDGW1Vvm5QqL5p8rO+vmqD7kFKUKQhC8D4LKicasmDWQ
	VdwjPuQtsbRkA+oDNqsWDSWKcKJRVvXpbX7/zpl9P1wcZa+J7+gmvN4LHIjvwK2f7uzsupO1g==
X-Received: by 2002:a17:90b:3f0d:b0:39e:2c5c:a689 with SMTP id 98e67ed59e1d1-39e361ab7dbmr7741778a91.30.1789700511242;
        Thu, 17 Sep 2026 20:01:51 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:50 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 5/7] drm/verisilicon: add DCUltraLite chip identity to HWDB
Date: Fri, 18 Sep 2026 11:01:23 +0800
Message-ID: <20260918030125.315978-6-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 chip contains a DCUltraLite display controller with
model number 0x0 (sic, the model name contains no number either),
revision 0x5560 and customer ID 0x305.  It has a similar register map
with DC8000, only one display output and only 32x32 cursor supported.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_hwdb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 91524d16f7785..7d630a667a3f0 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -129,6 +129,16 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.max_cursor_size = 64,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = 0x0,		/* DCUltraLite */
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.generation = VSDC_GEN_DC8000,
+		.display_count = 1,
+		.max_cursor_size = 32,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
-- 
2.43.0

