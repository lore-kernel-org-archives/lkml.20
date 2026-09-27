Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63F53BFE3E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545883; cv=none; b=p5agKC7pVCuN8QPahaobQt8/ebGhJXrfOe+9SO7XMhew66WsHi2tvkL+6bgdpQOj74NA1mDJTI/QszyNEZhTJj/EHzY2mjcqn+gt57Bze8yOQI2t1siwOHBqFKDSSAsgv5l0dJgMvgPGVWpao8LAoDenCZH//XlLHSBmUatdzAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545883; c=relaxed/simple;
	bh=hONP6h2Dmk7VWcv73LcPm/NCq43dBIy1EVpthORM5as=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tGESwgO+p2+7/wSILLcuYenSocPb88iE2o2w6WmPUINeUMYBAtHCbSQiglzV/mhu8Flq1e3keeb+b01PiUhhdj2HnNj03xSIcjm6cuGm4UOPSohIYhASL5hq16ibQ9JWB9+Tzk2xC1f3P/PhfqsUJjqxthlJnIcLKhpvZIg1mqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNn+mB6S; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNn+mB6S"
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-93c67dc38f4so53959785a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790545880; x=1791150680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjhkUG2TWCQLwM9KlXgPf4oUMSLjrl82Y/zKIRl4hi8=;
        b=LNn+mB6SCCGbcc6GwWtRvoCmLfnbZdqSdjtRfT9uOUr5JXE+3JM9I9px1cUa8p2RLK
         9oogTq+phr1ei0I5xIqACC9wayUfvWAcliTR6kxDUiGGfk0p2fBuKPr8Vkz5TuadXdPp
         6XHCpHTYu7Pf2JIQfT/ew4Fo6UQZABk+F+wYNBr1suEadtMrP7nClPvMUdtWnSJ2lIuB
         wgCDMg6OxH2RcwyOcLVIxVCHLtfCkmFaZBeCClo7X8ha0Mi6e7WyCAldvNDBR0+7bqHG
         vIrwjVPgYQmJE3cQU4qWwZWPVvZwIwu/VMqmENgW3KgUryRlRy7Ixdl+EtgNnmgZpge7
         ePlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790545880; x=1791150680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjhkUG2TWCQLwM9KlXgPf4oUMSLjrl82Y/zKIRl4hi8=;
        b=jHprYR7UtfwHEV3vu+4Vkig10UY8NOGGbmUUz2xK52EoFYQvTHF/2nCkrogWCS9def
         +BD5NGL/8eyi3L0rJuFkp8gOYg3ZBXmrVaedBbPmDHTTbbkJEndE3WjJBKCTGsIu65WJ
         0XVyLWwYo26Horq3wGlR2/qq6p7OBpeKOU9rp6Phs+YkIHIB/U58JX67UtqpQfUGBzXo
         mQRW03V7ax9IH9LSzQyvn9rGnzU4OaRunpw15PJtAKnF8j7KnPSbOv4L8eskS32quh7+
         ni2rQIwtqRQCGAZrjx0g5YDRGQvVhLMu9e6HWFNjboYftHxgUSJyzrHVMu1vFw+iLYTS
         WRDA==
X-Forwarded-Encrypted: i=1; AKwUvByc6BBVK4ZHDp5bGFHyJTiaIwc3Z/F8EB6SPIXJexEcshKGPnmwiK7+6lUel2LB/8Wia/N2dkRLrD+eSJE=@vger.kernel.org
X-Gm-Message-State: AFuF++krmNPRWZAR7ehyX5sMoU7C1IrwDUA2Vk+NuU8oPgdENHPAnAv8
	Txg94hRsCIBWVjOn14JIR0TS18qy0vjjwbYljSnlMhESmGTn2R6HIp4Y
X-Gm-Gg: AYBFou0M/82S7CbNSodnocON0VWQ6kzRKko9czFeMIgBnfvBXk5IbCrt4wiGLq2nMzm
	tct6LmdR4EWQeBOeLg24CAFD+HRhKBS2LT6vkfjqzE9yqjROyB4Nyp1pezfN4VUboXlveP/tjjx
	BxFzom4559aIyykrTB1E1bhszfnxX1pS3+LvhuUUGBylqOktQ+68PU99NX5YL56TfJMcU1LcpKO
	sVudlAnhGsTxBX/8FsGSsNWjhJPUSbfk99zz8IGCi0kXW0GVY6sfX2u3o1f4VwE3N5mF1YX19Z6
	hv2DsRu5Y/1yu+Y55jSJwxli5d85Q0peQYiU0Ks31bD2drTHKFFy4zbcwqHyhrMEZHBnCI0mfaY
	L6UdxjmHAXzXxoSsZVfjh3Ld3m+xzqTsVzQBIDv4zr++dcpKPYwDgfvHd/UZ2x3C1uGddWS5/PJ
	rjqcikXXJ03Rnp/GDJ+wSq2rH8loewLk2bF8e0Rh7OZP7Apmh3kEj8E57X13ifAxFVUH6KlBgku
	lxxYL6dtyiGqNapt9psmPpDYtplJzcnpoKLzxvUJJYXsH8z
X-Received: by 2002:a05:620a:6189:b0:93c:6079:bd38 with SMTP id af79cd13be357-93c6079ce59mr805549585a.23.1790545879710;
        Sun, 27 Sep 2026 14:51:19 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.192.206])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c574e5b8fsm462403585a.0.2026.09.27.14.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:51:19 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saranya Gopal <saranya.gopal@intel.com>,
	Rajaram Regupathy <rajaram.regupathy@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seungjin Bae <eeodqql09@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: limit the PDO count to the number of PDOs requested
Date: Sun, 27 Sep 2026 17:49:05 -0400
Message-ID: <20260927214904.447250-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Seungjin Bae <eeodqql09@gmail.com>

In ucsi_get_pdos(), the number of PDOs is derived from the data length
reported in the CCI register, which is provided by the PPM firmware.

The function requests at most UCSI_MAX_PDOS PDOs on the first read and
PDO_MAX_OBJECTS - UCSI_MAX_PDOS on the second, and ucsi_send_command()
only copies that many bytes into the buffer. However, the returned
length is taken from the 8 bit CCI data length field and is not bounded
by the size of the request.

If a malicious PPM reports a larger length, e.g. 0xFF, each
read is counted as 63 PDOs and ucsi_get_pdos() returns up to 126, beyond
PDO_MAX_OBJECTS and the number of PDOs actually read.

ucsi_get_src_pdos() stores this value in con->num_pdos, and
ucsi_psy_get_voltage_max() and ucsi_psy_get_current_max() use it to
index con->src_pdos[con->num_pdos - 1], resulting in an out-of-bounds
read. This happens without any userspace action, since
ucsi_get_src_pdos() calls ucsi_port_psy_changed() and the resulting
uevent reads every property.

Fix this by limiting the count of each read to the number of PDOs
requested, so that the returned value always matches the buffer
contents and never exceeds PDO_MAX_OBJECTS.

Fixes: b04e1747fbcc ("usb: typec: ucsi: Register USB Power Delivery Capabilities")
Cc: stable@vger.kernel.org
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index bef3f9b71d71..639f99f49ff9 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -898,7 +898,8 @@ static int ucsi_get_pdos(struct ucsi_connector *con, enum typec_role role,
 	if (ret < 0)
 		return ret;
 
-	num_pdos = ret / sizeof(u32); /* number of bytes to 32-bit PDOs */
+	/* The PPM may report more data than was requested */
+	num_pdos = min_t(u8, ret / sizeof(u32), UCSI_MAX_PDOS);
 	if (num_pdos < UCSI_MAX_PDOS)
 		return num_pdos;
 
@@ -908,7 +909,8 @@ static int ucsi_get_pdos(struct ucsi_connector *con, enum typec_role role,
 	if (ret < 0)
 		return ret;
 
-	return ret / sizeof(u32) + num_pdos;
+	return min_t(u8, ret / sizeof(u32),
+		     PDO_MAX_OBJECTS - UCSI_MAX_PDOS) + num_pdos;
 }
 
 static int ucsi_get_src_pdos(struct ucsi_connector *con)
-- 
2.43.0

