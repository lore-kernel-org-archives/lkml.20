Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169471;
	b=zaBBlaMh+LqGZsP+c0WDyVm06DppKsgFGMwyfW9eONapXTicuBqij/83x2GSUkLqBP0L
	 D7hoQusiEujvW3SuKxV1BmhlQrU0Dk/r8Nc3+Cd2kYYF/5vTw+ed427ytJXne75saUywp
	 t3KSlr6rxulw5+DZ7TUTP0kQktNZaR7Z2ohWy44jQk1SkMQhAYYwittASUBy58grvSEie
	 eGaN67Bb8sKu4voJ4/8giAAmQyjziFjuSKU5ClBxuJTGdLJRB0CRCCnOZSZOA1jKMmZzS
	 9wa9oTv0+YdGEGIn3Vk9aCLWrkigWhvM0TJTEVzsR2N+csSrqsMSEXVu2FcJQWgJeWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yd1i8T7pIntVZJ31nzcBs7WiIHb7EaXsGePDKYx+yO8=;
	b=CYpESfAu3tauSk9HsskDgJRrSyGjMd/05wgnAaeko+WxNE9TeK++1LnBvB1M4FwkuwJM
	 /dKPm8KmTjsHKnNKaHxzCDO+PptqAF2JUk7xyL6d0q5faXCP7AdjFu54O5iHGLIzQoEnN
	 6oZnHmRS17BLgKWB7RNOnDQV4pckfSl2tO8BIN5G8Ng2BgAcRKOoiIRCUyxMTLOKFUlDy
	 emJ7gDPcmy5Lmyy+OuuD19HkwxROB/MoM91MOLFC7Fbba8rcMY4RqDfwQLQUiXuz+zDWl
	 0lZXLKbqdpb4eRjgj+Jv7OdTqLYKBK2KoccCt3MSrvlSt4nZF6oleaUlMjkOlFgf7nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcUfQlhU;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05151607BB10
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05151607BB10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcUfQlhU
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-490a0e72588so122612f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169469; x=1794774269; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd1i8T7pIntVZJ31nzcBs7WiIHb7EaXsGePDKYx+yO8=;
        b=PcUfQlhUtvaRsFTLRsqKJqdPGliYsS1h+9Q9ClaS6fmq4X6n4IscQPk8z5emkmEMjs
         KhB2fyfywVKjAIrPUdCAOpmQ4JVRXMSY2UAh6/sOQxZj3SMUhJG40LZSAApbBP/m7eey
         cW0m9tUWQUJDfhr/8oIS2dW2uowHP3Cq4X3+JQNJ+36bNCyNW+jrmsxTIUtpsQlDb1sQ
         ho0ZLoN+SQx5iLpi7Bk3VNAmC4vflTWCNUMVkX8I/+lXmlhEMS3diBVR9UJczycK6Uyj
         v2oPfx3y3rui+1jcIrPZXrLJnKF0JGzVvBy+fdnmwXWA0Cfj5+map7AZGobP4vW74zo/
         zIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169469; x=1794774269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yd1i8T7pIntVZJ31nzcBs7WiIHb7EaXsGePDKYx+yO8=;
        b=BAGe9sG6eTpF+HViWftgtyUSXCnTjGcycfIuLp/xit+J57d5jJ6b/8W3PPKUXfmM/w
         qTKu6tKHKXWSjZ8/DyOlMnx9PjXBYrJGeTFF1kJLUZKfbcgF2+MSzPZLsigMvI+xHrB9
         a05m96vcZaUkPG6VLBYCpKbbSN5UM3Vh5k0BRjBV6vJJf54E+YFrfG6/mphOIrw17xsk
         WSpMFi3rwg6HtS9LFPdD7+AkyK/5y6Yizm2f/fnqsBvKJdRIUbY8RqqUB2vxrrSXbCrg
         eWMkkdpb319UlYtwWPXT77meVnfnLuKMew6+4XwSAt/SgSRaIT8qS+wivch2L1sqnYeS
         OLhw==
X-Forwarded-Encrypted: i=1; AL+hErEu0v87Q4r6fVW0DfUizjGMZu19tM1C3Scze4A3U8S1g4ILYYZSm8ecXLQyFh13feJIdLzKHx8EZULJZYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6uvcDfcDZAmQvHRW2ep/5uPh8OF3pYMQFb4Fnb2iwURIqCSOO
	crDMvS/fbyNdqFC8ZxmC3QUlGoT3iDa6jqRdCo2c0d0fkqyy3PxNaTcj
X-Gm-Gg: AYBFou0/GH3irkV+p9ccAIK6yDFCLkqYORFywdd10TL24mI7hV6G9mKtmDit9CTfy90
	HKvUitnpEQGbwkgQWRPcZBO4tbzHkgPklJe3uxmN/AOcVDtUNKha4MVhw+OdvGRhbtupeJu603p
	UxtUiKaTQ+bxl+r5ctcR1HNVDjJCR4lLajkmUHMRdUj2p0qRpJeuZc6ENppx0+yBSUIGMh/QMeK
	jCiWwrNkcvPMPwVkNQl75HP5hZMoxiV//oPLtioz9r5d9/CniQ1NcyYDabQlIoQJaR/+Vvbd9yx
	d0/1Ea2jJBiqa0Qs9Te3aByh7Pn0SJ5yy3tWCjVnM8VOJXivUM0NC7yFeeHw6KIxkDGGnhm46t1
	Zk1Op5nJGd2ObaEbB0BRG918+G/i41YKpqxMWh5ZJbHzZqU0h37BPPgdZNlTHas1nKeT0Gt63s3
	DWlLev/V75Y2e+d9pWBIz8YEYaTCS+TQjEenccT7HMHIcIZx+5VmnV2EOCZ0mw+0rG8qkuaOAuP
	ZmYFrpwdZbdtG5Y51XLi/FsddOb5Wp4AHr3QiRnpiKpAEsKd7h/bwd4jabkQSwNqtHIJC41IMJT
	ilm/V3PixxCeRlz2wjrIT8Az9edBOwZdYiNL9vUKxwOFWmeyWMFNhw==
X-Received: by 2002:a05:6000:4b04:b0:491:286f:8e6d with SMTP id ffacd0b85a97d-49584e3e29emr4241250f8f.30.1794169469381;
        Sun, 08 Nov 2026 12:24:29 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959765218asm5986727f8f.42.2026.11.08.12.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:29 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Sun, 08 Nov 2026 21:23:51 +0100
Subject: [PATCH v2 4/4] landlock: Clarify implicit handling of
 LANDLOCK_ACCESS_FS_REFER
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-4-2b405fc1b3aa@gmail.com>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
In-Reply-To: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

The LANDLOCK_ACCESS_FS_REFER right is handled implicitly in a ruleset,
but only if any other filesystem access right is declared as handled
in the given ruleset.

The old documentation was still a remnant from the times when
filesystem access rights were the only access rights that existed in
Landlock, but it became misleading when we introduced additional types
of access rights.

Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 include/uapi/linux/landlock.h | 17 +++++++++--------
 security/landlock/access.h    |  9 +++++----
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index 24510e5d8479..7e38b9d1bf12 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -22,10 +22,10 @@
  * enacted.  Vice versa, access rights that are not specifically listed here are
  * not going to be denied by this ruleset when it is enacted.
  *
- * For historical reasons, the %LANDLOCK_ACCESS_FS_REFER right is always denied
- * by default, even when its bit is not set in @handled_access_fs.  In order to
- * add new rules with this access right, the bit must still be set explicitly
- * (cf. `Filesystem flags`_).
+ * For historical reasons, as soon as any filesystem access right is handled in
+ * @handled_access_fs, the %LANDLOCK_ACCESS_FS_REFER right is always denied as
+ * well.  In order to add new rules with this access right, the bit must still
+ * be set explicitly (cf. `Filesystem flags`_).
  *
  * The explicit listing of *handled access rights* is required for backwards
  * compatibility reasons.  In most use cases, processes that use Landlock will
@@ -462,10 +462,11 @@ struct landlock_capability_attr {
  *   This access right is available since the second version of the Landlock
  *   ABI.
  *
- *   This is the only access right which is denied by default by any ruleset,
- *   even if the right is not specified as handled at ruleset creation time.
- *   The only way to make a ruleset grant this right is to explicitly allow it
- *   for a specific directory by adding a matching rule to the ruleset.
+ *   This is the only access right which is denied by default by any ruleset
+ *   that handles filesystem access rights, even if the right is not specified
+ *   as handled at ruleset creation time.  The only way to make a ruleset grant
+ *   this right is to explicitly allow it for a specific directory by adding a
+ *   matching rule to the ruleset.
  *
  *   In particular, when using the first Landlock ABI version, Landlock will
  *   always deny attempts to reparent files between different directories.
diff --git a/security/landlock/access.h b/security/landlock/access.h
index f9eaa2f53686..c4a81f7dadeb 100644
--- a/security/landlock/access.h
+++ b/security/landlock/access.h
@@ -18,10 +18,11 @@
 #include "limits.h"
 
 /*
- * All access rights that are denied by default whether they are handled or not
- * by a ruleset/layer.  This must be ORed with the .handled field of all
- * domain->layers[] entries when we need to get the absolute handled access
- * masks, see landlock_upgrade_handled_layer_config().
+ * All filesystem access rights that are denied by default as soon as any other
+ * filesystem access right is handled, even if the access right is not
+ * explicitly declared to be handled itself.  This must be ORed with the
+ * .handled field of all domain->layers[] entries when we need to get the
+ * absolute handled access masks, see landlock_upgrade_handled_layer_config().
  */
 /* clang-format off */
 #define _LANDLOCK_ACCESS_FS_INITIALLY_DENIED ( \

-- 
2.56.0

