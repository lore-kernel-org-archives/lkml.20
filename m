Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303104;
	b=azv04qtc7B79F43ehQtyHczdJfYQbFAN7+SjWYU5RWyFa4j3LDDYAjx4eyhYUaq7IHQD
	 gJJmnudpYuGnkQOWmfwgQtVjBiPBpdtikdcIGTbz8fYypf8i4Yw7Qy22YmI/rsG1THEMx
	 NWvOeRI8B+AHFmTk/tl96Ox1wsTJNa0mNNJVeg3K29rXhl5AWw/4QvCks4iE5372gMeW4
	 oup7ZOOO0xx8Lo33Dl0QPtllmhjLN6x00iKQ6mrQOdGt1TgJtbt1XRzE0LKv85kti1+/E
	 kToMPpHj+zDVMcFMAVjrbXGgziDcF/Y5bZjEyMLkLYzjzFzdh/VMHoZ/BqZn/qYaKng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=70d5HP/NDskHf8kArC44fYJ/2R1MLgLSjk60RYC7GPQ=;
	b=b+rF+Vrx+IAfN0aIH/H5g04VDwKclbCKyMqJqIBXWX82Dkm2enXtIDb2qSAu2wlw+D3P
	 dBcpjqJVJzcLAfVlgvU00sLbgLfGSaXwDJkQo7fghkJDHrJKFSAROhMqg06YJQCEJjxsD
	 N2R3bvX9LQFTetGYVrXnzibwsce7LSYKQLofBuE2X3enbG4qSuvSykNena4FUL1XEEPUT
	 8ntIVE3YrvVMA+3Gtb62qYOqcRC2f2FOwFSFzLuy49qcQ5Y+2ryIaVX9C8jEGtsaX0DxY
	 IQOVxVVvWCVvY3ArOdU/rXnzs6VQ1I0+ZQLm1rb5z2UIRoqNyeQZ1gwtFZ1FEvaUckg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6VpWtDm;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD2606CF8B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABD2606CF8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m6VpWtDm
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-372bdb942dbso2424816eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303103; x=1794907903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=70d5HP/NDskHf8kArC44fYJ/2R1MLgLSjk60RYC7GPQ=;
        b=m6VpWtDmn0Dldk5emvFKnESyohulG8uw0ZwPMGdM/9S9v9cGrlFeN9gVlckf0Mv0qd
         3fEteFvJtcrNghTloBDMtkBU/VUpnBYwWJGrWgbJ0TaRfH1Gh067jvJyvnab4B+wgVrs
         59hh1V5259n5V2cFrmtphIhIRlYE7Ju3zRc+8t9Sy3bmJzvV6sEoFD3SH9SROk5LFspc
         qIRJ4gTKCCniqI0K3QDpfIEI87CwGTcMfHt8fp+LwWdqE+Ip5GlYa+1E6hy1pFyOGnfE
         VUwYg7oOCMTKdy4QI6YD6tLww1NgQkM2GoW7dN5f8M0DqdEBrD9z/jv8huYgv9A/vJbT
         Nm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303103; x=1794907903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70d5HP/NDskHf8kArC44fYJ/2R1MLgLSjk60RYC7GPQ=;
        b=uh4gRGNW0Mqw5m6M6/kw5lCZ+uujC1592VbeUPtOzGTIFDh8XuaDqoWfynoMPMG1/h
         m+xhfk6IAQurpEQXN5Z1WXLYtdXU+LtX1mUKDvrYLfpd80ksqrsHIzY6GWUjkmcauFN3
         U3b+0kQop+ctPvpCHV+BoELkJivhhFH78nQDJyHK1mpqMpwzNKhkUUHOleCKk+JcTZRH
         VJeEOMuI1ZPOo/Tl7t6iHezs2+e/JKL0C7N8vOp08DHbXTtTwU/vOwyHI6dy/AL4QrKS
         OfH9RNclaJNvzMjEKwADOKYnhZSYIRRG+k/CJR1g4Wd+dnrkOqPxvicOZ1BuJpmipeB7
         lguw==
X-Forwarded-Encrypted: i=1; AL+hErGmUWB7wl2pvzlSSmQ+X/ZBr1G7Y6SulerKPVUJAqFyNxrgSLkT6x4RCBto9mrqLNdznJdS5X4fPus85xE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Pe+FTi3VyXY110m+dEOeD+HzEahIJxR1qSlI6NcROxzcT9ChX
	1982TX4vvSoOoLCdrUnMqyUtSFWlr6OG1IMNOP/0AM8Yc/UBEWuZjrob
X-Gm-Gg: AYBFou0PplPs1UQ4qVIgSyu6FP69KHlvdKgoR4QONa7RW346WdvKZgesTmG8mAh5WUW
	a1mVv223eAvNQldhJCi/HmTZipb7PMSUsReNcHidKAOflC5TU0mS16CcZlthjdqY6JiJWRgHeN7
	/amxI/167hupnNp/XilSBxCuHlcDBME/my+B2Wu24HcU7X41HPHX4ZZwzC5yXol3bC06wIV3RoB
	JcYv4xr3JCAOSPIhHex+6FDH3y7YdgE/8unNc/n4VjTyPtsJeFgfVnHZIsv5ISAX9HreOcBeYUa
	vkq5tqMizHFByngn9sjrNV3jfaNoanqb/L9zuMH/vowCRSZMN3xWoS5P+EeW+/sBN0oSLvWKcFc
	qpkdFpwBM1HA+OO6kKyqy7INpuyCzFVX9GWp5CpkfuyC1tq1b4vAIX5LNmKzYKK2U9K7EvS9IRn
	YCpWYukvJncBpADzzeGpN+CFGVAJQORlglpGeYOmioqJ/IdFV0lGqVtWJx24LR6KfKCehfq3ius
	JVWj9S1IZsUNqdut3ygKKNhxdgKce22NcX0nmXsAvgvENKBmNwAdBoP5cqSp59zP1j3ZAxuZbp8
	DXRYW6GNJ/qUXZewxi5hrxZp4Ps9/wxfphcUwAr3uRjXPDPs7BQXtNLpTYk=
X-Received: by 2002:a05:7300:da01:b0:351:29c8:643 with SMTP id 5a478bee46e88-3751f46823emr2583654eec.18.1794303103003;
        Tue, 10 Nov 2026 01:31:43 -0800 (PST)
Received: from homik.search.charter.net ([2603:8002:ad40:56f0:140f:bba5:1d89:57e3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe3261csm4840148eec.4.2026.11.10.01.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:31:42 -0800 (PST)
From: Mariia Nikitash <nikitash.mariiaw@gmail.com>
To: mkp@kernel.org
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	morbo@google.com,
	justinstitt@google.com,
	kees@kernel.org,
	linux-hardening@vger.kernel.org,
	Mariia Nikitash <nikitash.mariiaw@gmail.com>
Subject: [PATCH] scsi: target: iscsi: Replace strlcat() with snprintf()
Date: Tue, 10 Nov 2026 01:31:37 -0800
Message-ID: <20261110093137.37744-1-nikitash.mariiaw@gmail.com>
X-Mailer: git-send-email 2.43.0
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

In preparation for removing the deprecated strlcat() API[1], replace
the strlcat() call with snprintf() to construct the AuthMethod value
directly from param->value.

Since buf1 contains unmodified copy of param->value, formatting
original value and suffix together preserves the NUL-terminated
output, including partial or omitted ",None" suffixes when the
256-byte buffer is too small.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Mariia Nikitash <nikitash.mariiaw@gmail.com>
---
 drivers/target/iscsi/iscsi_target_tpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/target/iscsi/iscsi_target_tpg.c b/drivers/target/iscsi/iscsi_target_tpg.c
index 99772364c88e..aad82a37538f 100644
--- a/drivers/target/iscsi/iscsi_target_tpg.c
+++ b/drivers/target/iscsi/iscsi_target_tpg.c
@@ -624,7 +624,7 @@ int iscsit_ta_authentication(struct iscsi_portal_group *tpg, u32 authentication)
 		none = strstr(buf1, NONE);
 		if (none)
 			goto out;
-		strlcat(buf1, "," NONE, sizeof(buf1));
+		snprintf(buf1, sizeof(buf1), "%s," NONE, param->value);
 		if (iscsi_update_param_value(param, buf1) < 0)
 			return -EINVAL;
 	}
-- 
2.43.0

