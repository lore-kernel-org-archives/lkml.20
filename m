Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794516790;
	b=bUtPVXW3XIGrD8+WGGa7iXkjo4AoVTTWM8nWcdy1LRjDbVK6YHpso4DiTplWoFwf8Sdj
	 ztcCI3B+3gzd/+ndPaZv0tsxe2UBLucdBYQx6ZKc4zATWm8HdILY9Pr3ngjx/NX7eVz1o
	 3Or0JSdaOM/G5qtXwQ3OIpXvGlEiiaq8D1cqL17p/TQsoekiC61lweQnblEcDvgKvEXcQ
	 A/1T+Nw8FdUeAFqiPKgYS8WhMtugjpCFtaFUKpRt3nUPQTIXdaQ0IesOFd9sfp1TW5ao0
	 6EJzb2STZZT47g96iwiULhHXi7k0RxVovn9xdvAQmPso+SApqFjLl0KbM5WinulOqQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794516790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
	b=x7nrG4T6RIS6QkfOxqZTBD5WZCYp3fyOAeWOfvqfEG3AFdch+QeZoXShEYn3SyhrDt58
	 DaoGnjZd6Z4Kvf/xEqZywSl4KZI1pYfKA23iKw8M99UEtOQvAkdjyRcYVBFFht35l5wlN
	 v+WChAOaA4/SK6wAf0oBsWoENVuuYJwO9Q+ep4ZCKH4uzOMGsor7Rl93a/s/ecUIhNTg1
	 YUIgHMbr8yAivT3yxfeMIHhRHqpTnxULAAx02FKRCGY9Emw7W3woKeGSGkn/Vb63Qrn9m
	 +1JMSJiai+VP7qcm9Qho3Jv1u1mR4aDMBsGlVpRTZ0QH7f2Cpz4baGla5+zsafIz6cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vn9YweDi;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FDE606A886
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FDE606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vn9YweDi
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so3724205e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516789; x=1795121589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=vn9YweDiGhIeE6mbW/jaZV9o5u3ztkuGnLjpgiNN/1vSBr7T5va4X3zGLyjfVUDk7a
         +acRnj+YpG3cX714MaKMBgkoZ5yVJpbsMnzfI2JeOXez2OPX6QaDzZ9WE1RznQFbdBZi
         SbScTMl6QQ1Vj4Al37FJkQ3vlSoGQ8Fb4FlrdczmcCeKr6n8PLWQWgUKeOdm6HyyiaM/
         RVzw4bJ4HPCz9MAesg0hueAARijHEfDiOKPS/YO1Sr4z0h1iqtcZ2av1/FwIjjxJAkLy
         rBXNQIA7JuSU5PPbde2cTbs1TdKzhOKoQVAfysNwX6O8WJATwV3mIVCwPrEfwT1xv7ri
         RuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516789; x=1795121589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=Ry1nrHMWlM6Ah4xwxwoF04BlXF1uJC5qFULSgxOXicDNw/SubhjFSKLCswbLMH67YO
         H1PiWx9Dm/I1ovjU4Cx6AqjyPMOSByt6A7B8uvbbKQPWnboYfBu4onpNCDGtlfwmR+82
         MUa6gSDjn38CgDHcqcgUiD8mM5dcmLPcX/QIWs7TJ8D/tBTBsh1+u6GF/ep6sxqmiYL4
         DEQ7m5uMMJpS7/eFKnd1E1NQxiKC0O91ghuOjaRxAArj87ar3toxvCdZSegUgeEPu/5U
         lK4iLRoX+TuTRnP138g6zO2PAO1W+S61n1+0FyMpCR5Y2xoPZE97g3l/KzIqY6MCtvhe
         sHfw==
X-Forwarded-Encrypted: i=1; AL+hErG07ccbYy69dRl3D2oIubCrjT9j2e81SYMsoKEQ7Udoxbz5xk8O8temj45h4jj3XpNKt1eLWFJIq6rxWMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xCfZj5wuqNzcAroI5238NBW0C8j1ZS8+eCRZBT76EQPHNCMvU
	ZyOlKXXL96f6En2UaeCRSuDYsb9MWx6OC7sGWEhvlh2Kq5eMDKxGkA7Y
X-Gm-Gg: AYBFou3EXmMbiyVmQp6QaDvPHO1NWoHi0ktsMgsvJ2Qufo/DFqK8jCe7Lt9GMGv0AFu
	0CRdQMEun5/Qkzy3JR1Zr4GOrlL0M5upTVrV23lggf2i5F1MgawXBw5N+JHw6AvvgRYpnO4gunE
	EskYkNYTDr8FSU0fcoc+JEXzw+sTQ6Z6lYUcGmDmynv1lUtJ2x4o8EXWm71TezM/KCmuQJWyztk
	IMNIePEVgtAC3Gp8ewPmFI83uyc7nrAtwJM4d37ON9/MmShRF2jUjorXpsvAO4+P/zFQylkptEo
	Umpbx+P3ij+yXCCLok4+SPB7lQgUtKxkXoPABJp9vxRHmO9mENzoRwrNaDXPzbU5wLY0NR2T79+
	cYLM7EbuXEFSu84gLUAdKmGxjzW/Rc+t2MIsrqypc4ldxsvsEQqh1MBzRBis+Zkbm4qtk1OeqOF
	W6RjQUh/kfcgPHJZU2QZqAPLiSbt7s5F36O6TPfjoxUG9Vf/6t3d7gtyX+/Fv4Mj6DXzIQGy0pl
	wPL8YMYgTZ1pu8twIvCOyRNH17/sTXVCvikSrw0e6E1I6uhFNqjwyF08fJvQHULomWLDWgDH6tg
	+dmDTgGDdypv3PN9eHSOXsCSU7x80DUsp+ITxoejIwvTRH/jYGgL4dWH+IhZ1fM=
X-Received: by 2002:a05:600c:1f96:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4bb55a4ea81mr7826645e9.14.1794516788712;
        Thu, 12 Nov 2026 12:53:08 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae501bsm8695655e9.10.2026.11.12.12.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:53:08 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Thu, 12 Nov 2026 20:52:28 +0000
Message-ID: <20261112205228.42630-3-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112205228.42630-1-pmazzini@gmail.com>
References: <20261112205228.42630-1-pmazzini@gmail.com>
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

The SY7636A is no longer bound through an MFD.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ed588add8d31..f02b5605e533 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -239,7 +239,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0

