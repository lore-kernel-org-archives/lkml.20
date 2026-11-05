Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898085;
	b=AbcJUTG1+krkZUrKUqfP/8hOGJp0L38+SeDtTam3ukTvCn1JE1WuoPwveVZ7km+FRaJ1
	 y644FxVzztjVcFS7Q4Dg0IkRF0YEf+A5XkqpoOGIkqFaNQoF+bUxPf3SPUSEBPIlSXesj
	 2LcZwNlNVm7CinUx5kcFPmVqF2NHvo13jc0EUSLsd7exfoWasfu8q/VjVsPnpeLBFrkzt
	 bos93IE2i06AjNNyEAtwRwzHDGBQVOEYpYwjuFESj63IwJsXdbyumD+TYPXEJG6/C/WCq
	 t2kfxUZbvywmcAQdfMiqIrR1uPoSQBszNyiWts/yFsThAu+gs14jJR7LH/1CcEPUnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1Bj0+K8jV5yl/+WlXVdM+whsRRuk81dsUqfDRXtanZc=;
	b=zdPjsvKxGObhJFH/bl5lmEcz2EJRiGkEseZknJIXf3d76Lku1sYhd6ELgdhsZme9250N
	 wxdy7xUEvg6S9QlHOPgG5JEV7buBzstsxOq+W+0E0AsKdywj1rQb0wvv5AqTGh0vhQH8Z
	 IDlVZQB4C/538fIXP1TLB3MAoDZu1DwAGEaHgupqJcomFflipCILkZxs+Kl/2XmDedb2w
	 fZb7HEcB41qfixpCX3I3Yy+Eh9wySESdibH1N/UNi9q9kLQjZr5fUcNldn1hkM5HcMSyu
	 cgq6kOlxVpkbqeKDka0kYMIBWNRZBRwpL29bhNiiazpRXtzv2dIl10UbHVKAxk/HPjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grsecurity.net;
	spf=pass smtp.mailfrom=opensrcsec.com;
	dkim=pass header.d=grsecurity.net header.i=@grsecurity.net header.a=rsa-sha256 header.s=grsec header.b=lu7Fu7ru;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A23260A262E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A23260A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grsecurity.net header.i=@grsecurity.net header.a=rsa-sha256 header.s=grsec header.b=lu7Fu7ru
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1295677f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1793898083; x=1794502883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Bj0+K8jV5yl/+WlXVdM+whsRRuk81dsUqfDRXtanZc=;
        b=lu7Fu7ruhWk17tVwfHYq+9Cf6MZ+ltAqQ1RSTydkOwv3SypLfT5YWqU9zFrisGAA+i
         OfMDYAd8/AB8TcQ86vZpeTqs4/HmTYNLfULPSIK6KBD2RwvcR+HpwQ957XxcWgkPO0Pj
         7eCpjcNBTxpmFxmcplaLHFrS1dOLi4aowGrydTFin7RbBrS3SPECyvqfVwJcgBBi3chm
         6SnnE/LADV4UziNg3T9+3jOhHTcJSzEowOSyLYQwhP5Y94JvpypyRiLVthpLL6pAanxB
         ra0vhxSivqKBO33DCa3jSTMRvZxLfpMLqrg7AQUfSdrHleLLmmgqqhukfYDn2Mq8fF53
         sTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898083; x=1794502883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Bj0+K8jV5yl/+WlXVdM+whsRRuk81dsUqfDRXtanZc=;
        b=B147FIMvPNNmLEDsptWfISgs7I+EY3aBl7F8aUGdD9RmZ2n3vasO//cr1UAIBu+c51
         kQuJgt/fmqgqZ6tR13eiM8+NMeCfPSJ4uzf3UaBkrED1baGIPDzjbGIKmrDXWlY2yXnW
         NPhlwMqfzotT86n8WjmOFs8PDJffn3KQJis2MP6N9Um99RvC1aqwy7GOgYHFWGbHNtdE
         s3rF9RwTaI5aws1E2oOcrUxWE5wT4YwGAweDQsY64TEuxCxLYjMjLAZzHKAD7T9jAopO
         XWr9OLPwjoO7o8kES48PAFwXFl3CVJ6QzS4NPMSbLKuKXRoT6+zjNmnbqpk1CuZUIuHT
         A32Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXm+o56zLtE3ONTsfIb+JwTk32BUoRE0W+fCP+mnJayMdHjtP00pfg2v6Fmp7svCXRnPyY3ScUA5hhcFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9yo0qUoohtFahgcjn+YekUk2hGycpE87A+d1mRI8avosCDMZ/L
	UTEzMkrRudKzJiotSOcGCmk8w4oA3tAlmoMngsxf5N0pEJDEup6WaA5Rxo+0LtGRRY9428WD2ea
	VO4Q3
X-Gm-Gg: AYBFou1hiHFs6C2SCKvChuPfif4BE400J+tOMaiMIRccsWocO8tFjklpfBOxjjQ7TTA
	svj/hog+9Q47KjzZKXfc2AD8kuTehLQNTKU2ujiGY6wTVDMvnqrp7sgPZcgs4dI3tqtsAz1zReP
	cs1AEd925pgNsNIpO76Y3aTXP11DqlOAwKhY82MCY0fMfb5DHbclTYAe/HrVftlWpwFQo4uHqxf
	NDwtjQMYmn05+x9yHN/RO/+ZOzGwF1CwKsmTeksnpcma/ylQIo6QVOp/HIjO3fvBXUkT3byRlRQ
	xto9G8vnCviyW2dwvjsD+JwSdCAbX0bY/Akw4v0MPW1RbQxuEwrtCSnY9fbnxAgQWQgVbr2VTSF
	eJ31kUaxTpeuiBkojo+pF4OtcE6iIr6WjTc+/Fxzj21NSm05yg5z1rLd6gkIBT9sukMRirNvc/F
	8zICQfql1Big0Dslgj0blm9+NJhhSg+MJNvVI9WNEOrjtluJwP8abthpt+TVQ+roRpIA8bPaL9x
	qNZFX6y4p6TcEb0CHQiYSFVDWe7tbVedIYeSD8MYZu8Ajif60yIAUFosCNXyfp0kBmMhIymbz32
	/kCTdgpIbyDDSU1Nvrw65DOoibBQ463CfEiwYYT9ud0XhBqymD1pFTlgVh1uDx1ECbbERvFJrGL
	l/6OcFCfgu/qwaGQtXKANuet0
X-Received: by 2002:a05:6000:26cb:b0:491:e062:383d with SMTP id ffacd0b85a97d-4928030bd26mr175146f8f.57.1793898083236;
        Thu, 05 Nov 2026 09:01:23 -0800 (PST)
Received: from bell.fritz.box (p200300faaf11b90088550f04e79781cf.dip0.t-ipconnect.de. [2003:fa:af11:b900:8855:f04:e797:81cf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d88e1sm11033465f8f.15.2026.11.05.09.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:01:21 -0800 (PST)
From: Mathias Krause <minipli@grsecurity.net>
To: Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathias Krause <minipli@grsecurity.net>
Subject: [PATCH] HID: Intel-thc-hid: Fix REGMAP dependency
Date: Thu,  5 Nov 2026 18:01:16 +0100
Message-ID: <20261105170116.3193223-1-minipli@grsecurity.net>
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

intel-thc-{dev,dma}.c make use of the regmap API and related data
structures, breaking the build if CONFIG_REGMAP isn't set.

Fix that by forcibly enabling REGMAP when this driver gets build.

Fixes: 1b2d05384c29 ("HID: intel-thc-hid: Add basic THC driver skeleton")
Signed-off-by: Mathias Krause <minipli@grsecurity.net>
---
 drivers/hid/intel-thc-hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
index 9d74e53b8c62..57a1e51cb512 100644
--- a/drivers/hid/intel-thc-hid/Kconfig
+++ b/drivers/hid/intel-thc-hid/Kconfig
@@ -8,6 +8,7 @@ config INTEL_THC_HID
 	tristate "Intel Touch Host Controller"
 	depends on ACPI
 	select SGL_ALLOC
+	select REGMAP
 	help
 	  THC (Touch Host Controller) is the name of the IP block in PCH that
 	  interfaces with Touch Devices (ex: touchscreen, touchpad etc.). It
-- 
2.47.3

