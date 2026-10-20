Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501225;
	b=tcESAhPLaFF6IjN+m99gtndb6yGSM7px4CAHuewehuzl4OL3GZ1c11liABotadQkq2zX
	 2tsCWDi/FGwYHxlrxVgGm4pp9Da+PKZqO1Ip/Prz23ImHIXxOLCnpZnh10lx3W85h3IDg
	 fHmrp31tLUCOVfA56kFlC3ASqo8FUrB6f3Z11SYi7FSWF8fr6Yjbj0b/Ohvhc3khV/dKf
	 MaX8B7aLF8ga08PxSKeEAsBB+SkC0BVigU2tWDdU7hw4A5TWylWlcVDq7BBnGTqQOaQvN
	 1vgXy9sYEOCsVPyrBG1w9DPqSUL9pdI0zoMyjwLZ66oXLJe/enWvnnsGheueDxNSrqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
	b=0isUAaCkUgSEYceePH2IMr0UpTVjXxT3Lo/5ptjcXtNHXVn98a8J5LUgxoDNdwALbJ7u
	 QQZHl5ZATf7RFR6/UyHDppkQeGNkBqlu5Xvm+5X3zu4oXr+QChm9WMPVL177wHRBrt9ho
	 S84O3AMQgRjiSAmSMRy1Mc72P924zQBLeDUVVDSz2HV+YuYM71NDqM5bnFf0bkMrk6Xtl
	 wO1IxBM7iHbtpffYR0o0WhnQzXF3ODIiUJHpAtAwsqseoZo6CjdDHqmjKT4x4vIQ/YlFL
	 H1ChDGoXETdevAf4JyLn6kPrSSeTlwwiizsC6/uLSTJTBNDz0zYK1IPoRD9amTd4IoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0F7Hu65;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554BB60A3811
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 554BB60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E0F7Hu65
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so17354335e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792501223; x=1793106023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
        b=E0F7Hu65seHwVdW+FHp3mVrOVZw/FQgWjo23wNhERvnPDPX5w0fuyS9y/+K/1or6AC
         53UmLLzuXH0GmfEXR0ypuB/t1gOwLzBNFXykNEDkIOlFHgYRlyo2RTqsVEFbUEkAqB7F
         CYjn96br5Iz8K+Wh5YFmSKXZRx+8iEZM7Ix/7zGuz4Sgiyt0Y7EJcYfXE4YF5xLNjbMQ
         zB0jun/WZ8oqFSMDS08LmBk8HmP1Ic8HNig6WgKSs4azQdbVwst7UOv9UzQuc4EenfN/
         2OdjzcTCiwtJBA7qncngxvdJ9kA65aWs+JxwYIH5btwWy8w7w4peSoTcfgnL/Lfb7Z/6
         X5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501223; x=1793106023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AHNUECT+cdB9/Xcll8wi1ywwKoxcpIfCCZDGgRyrUc=;
        b=x8JQCAcM3MJygYamvfaX1NF3ZcoLZsYdwFa9xJXciNd0FPQp6VkidrRnL+W11OImBG
         4laL2+2lElYf6i7geS95sTMYGyAoxjiaukp5KX04V1cuWpRm0raZJ+1tq8Has6j41Tau
         MTPX+dneGinGZX+bnwOSBkh5Z/USat82vWILDuZMnXRG9X+g9uixeotrLuz7DCL9rhNp
         Sn6xEYfq/dzZGec67i0dwq4BYKbWACrYDYiwrmiwJz5NSPOWDSvk4/VKTuALPki9kBhI
         DsmiAYZ1ubOnRoHN4HEBOuUv0RIh/vvKhupo0wt6I0ZP0ikKoY6foWw5PHPsrtCLUWJR
         n74w==
X-Forwarded-Encrypted: i=1; AKwUvBykgXeoDn02SN+cb7xRe7/7g/1OnGuRqFlDoW2fmlc4WJ4cMd3qqmbjyjhpRbvh+xfAERhOKr3Kwd7QuL4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIi2sVICrNVdAn2Z/1CB9n97jrQYhlUjqKI5eLXr5137cxZYQrp
	XmK1pSGz3OGQytrlYzYmzcKtw5lK80ZBCXroGS6FZG5+0ScM6+gCDNYy
X-Gm-Gg: AYBFou2+VVZ8yoBJ1XDuKLQfn+cSeOa47VMfvAEzbD9Ar8VQPb+JDxzXg1gzQCEPE4n
	pvgG/dCEgCdLRy+govqBQ+SGbcz8A/dIlWE6dM1fN73ZuYBKui7ZLcz/bhs98W2cVXRhRCpHyVX
	LzddJVXOEMx1Tfa+FrKW9QSmGKMBgVny9NgoIGbI1c0A1CvzKQs3jQoYaA2QKm7/rIENpYOvthy
	zAHIDbCBSh7khy/nGj01GHylrit8I6vgwM+d2q/VbkZerUVxET5hLLfJAqausJ6WSZ6tULXvZAh
	k3Jvki+Se95j9vFClSuTdq66DoydXCjoJYlNYjS5n/BQJyvW5yGWoA7YBN9CHx+utAlcoxLXOmg
	LKEsESOiDVFc1MqhSXLzFsuELFXd+AJSxMAjOShF7gxvrbgfL2ZFESe35rV3lMyVsQ+eFUjMMkQ
	cFeDdMa3aF496LnWnArWBBLXnwIi25HBXPoL3oaiHf0Tp6vxNeOtZYKB4zTpgC9uAnZxQE1tyXE
	4qfPUQW6reDcjBi4dbMYIj1Z5LFzvfrfTWyCmF9sTyLVASAjOuOECCnk7lMB3v7Qzyvv/dW4Q==
X-Received: by 2002:a05:600c:608e:b0:4a1:e08e:46b5 with SMTP id 5b1f17b1804b1-4a1e08e4871mr164567895e9.16.1792501222390;
        Tue, 20 Oct 2026 06:00:22 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d830e91sm6114754f8f.54.2026.10.20.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:00:21 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Tue, 20 Oct 2026 15:00:14 +0200
Subject: [PATCH v3 3/8] of: property: fw_devlink: Report unsupported
 supplier linking
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-fw-devlink-nexus-ready-v3-3-fd6f1c17e16d@toradex.com>
References: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
In-Reply-To: <20261020-fw-devlink-nexus-ready-v3-0-fd6f1c17e16d@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

OF supplier linking is deliberately disabled on OLPC and Intel CE4100
systems. The add_links operation currently returns zero on these systems,
so callers cannot distinguish unsupported linking from success.

Return -EOPNOTSUPP when supplier linking is unsupported. This allows OF
unit tests to skip link assertions on these systems without exposing the
private platform-support predicate.

The driver core ignores the add_links return value and marks the fwnode
as processed regardless, so its link creation and retry behavior remain
unchanged.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index aa65976739e1..99381c07848d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1708,7 +1708,7 @@ static int of_fwnode_add_links(struct fwnode_handle *fwnode)
 	struct device_node *con_np = to_of_node(fwnode);
 
 	if (!of_is_fwnode_add_links_supported())
-		return 0;
+		return -EOPNOTSUPP;
 
 	if (!con_np)
 		return -EINVAL;

-- 
2.43.0

