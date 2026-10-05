Received: from mail-yx2-f11.google.com (mail-yx2-f11.google.com [74.125.224.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198F01DFFB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 04:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791173754; cv=none; b=SgIkgZJa4StYu67aacv0i2C3q+U1QdNN0UPiGQRQtHaz5kC7POlLihanMkHWDP1voSwbTLO68bWmbdf8eZfGP3NG0Nrk1qkocCNqlz9ITBuLseJrMiWyP32F+UkzoiH6FRDR7DZnAAYjjVGfh27FTZE3cEvAjSTy34X8HvkLHik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791173754; c=relaxed/simple;
	bh=Ol495Yd1bB9OG/RIDv/QVy7GjKIVdA/eEWiihj9bEt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYvjEfDICNsi2Xi9CF6pF2WOlrAOYDzVXFiTJ6bXgvrwiI5kF6UyQphtCl0rzd6X5Q88kxa/AUqsufNFwc+VanHKvM+YExvrwAK2eoBRQTt3Mcxw/Tc16J4nNT8k/XV60FhXz89QEC0bi3bd0AjoI4r27WaMyAuXOqOFxF+X10c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sHONQFvq; arc=none smtp.client-ip=74.125.224.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sHONQFvq"
Received: by mail-yx2-f11.google.com with SMTP id 956f58d0204a3-66c70f9ad8aso543710d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 21:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791173751; x=1791778551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WffhMcSo+8l7cweCHxFJooIzIC81MEZIr3lUnbAuzfw=;
        b=sHONQFvqA4JbN6SEh+mjlVXd6UjxGIfQHrjLTrwz1yarsJRkkbOijbPJaOERGOHxp6
         eWvbHTYzkN8EPKeDOhg2rawdCjLgf+s4hBHG0Jmb1Qqo/4HHs6s8bpBHMX7tkt23rR9V
         7Axo0AV356PdvBMH01RmctS02ueQZVQD7uFs+tcV9PzBVFlNyWvbtZSPFmYi0+JCs+Mu
         KtX9NuCQ2Z8ew3nw2b5vLNVreZzoAaR9hhRJ+hdaPSKQTbgzHzwQjZHqjKUhEUg75uiQ
         h/ZF/ynb5Fm0gpng77WfAcJTj2fqNPifeRH/16SkM6/futENkNHTefFzl7ZWO623JC+I
         PnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791173751; x=1791778551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WffhMcSo+8l7cweCHxFJooIzIC81MEZIr3lUnbAuzfw=;
        b=Fp1QUZ0shTHcjP899giKEhHZoD2RFYkoa8D7PQTt07nQcfXgzrytLTRCqwPJ64oYGE
         g+gDgEkJ83rRvVTcHOY0+x4zH9z4f4WNFNfwFgbdEobHpsXjXwLh2B8vYru+eQ5e4WNR
         c94eA0VC7o12qTsPXLJGhTg3naOhP5WlMvOU4sPLq8tIpxgazmv0mPw1JqDyoWy/Vy9S
         wwmKDyse3EkTImR3k/2MVoZLrgKPOiNR4dP2wGTWdIJHqoiNNQRcfSpDQ0s3A07Tg2CT
         hHsDN1BzPWuQx+OC2MCdS2tlFdZ40BfA19swuwJXz0ftJslBN4NMlw4XP/uA053L+0za
         gAGg==
X-Forwarded-Encrypted: i=1; AKwUvBw3mEYOl3U9YPDrOEfm82uhDQy7I7Olkzz+92JUx0sdOqtEBN3p1d+0cd6x3f13KVCAOKV7YKpYF5ESOFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1VIQ4P8HV1Y3e7RB8P3pss3rPC3obXaBCYW4/JN4P2xFS01Jl
	gCRs6uXTKYhzitErImRmWmhvGqserZTrlM6P0aJk6Oy2VedoWQoKB1UpWe77tvA1nDemAQ==
X-Gm-Gg: AYBFou3hGabqYjvqhRthWOBoKycBsKjlycUw4CBh4i4BcbwcIWUA4mZbJzKBCqJF0XZ
	Q0cxvV2l3k651Iwt2UR/tJt9Il198gT2kUM4t0jAT/ZjFq0hrAZ2sHdBhjNED1RUVvafuSTjdRt
	3c4auhKPDVome8VD1MCMwboLOIGFz9mhxJun7O2E8EVVva3RywQN3huSPTMWmKpP8TbVV3PPGF/
	ldIkoFRYO7wfHUKaweJwcN0q6tRyowd+dQeEPWjFhNKCX/DDXaXBfTO3YOMAdXiGZZoVWn7UQ1R
	FUcsd3Gxu+TbbjzmhHDUAqxAGGBxByJk2gP8yIb5devmH5d2SLhWZ+6C5XO4KcMj4GWse7ZHpAK
	FaPeOrIAzgtP1fjidR5Iz0RHVHDHSYktcO5LDRAj9xR8uvASHnRuP69QPC6tk6RKsdbrqlUo14p
	FTQMwIy8M3+mNuqzptTsUZfDMoNWKZ2seSwkEZXBAqhrW58Y++xd26L2F48qEx+qVYEv0oh3na2
	vcmq1KkRRRwPP+CBJg4eIbuQGQsbuZMRcSepM+okV9V959nCNSI
X-Received: by 2002:a53:b64a:0:b0:671:5818:1591 with SMTP id 956f58d0204a3-677abff80f1mr3069658d50.20.1791173751046;
        Sun, 04 Oct 2026 21:15:51 -0700 (PDT)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:edd1:61d6:442f:e3ff])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1bf368esm2205213d50.20.2026.10.04.21.15.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 21:15:50 -0700 (PDT)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oliver@neukum.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net] net: usb: cdc_ncm: reject short GET_NTB_PARAMETERS responses
Date: Mon,  5 Oct 2026 00:15:25 -0400
Message-ID: <20261005041525.49111-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbnet_read_cmd() returns the number of bytes read on success, which may
be smaller than the requested size. cdc_ncm_init() calls it and only
checks for negative return values, allowing initialization to continue
with an incomplete NTB parameter response.

The context is allocated and zero-initialized by kzalloc_obj() in
cdc_ncm_bind_common(). Bytes missing from a short response therefore
remain zero and may be interpreted as device-provided parameters.

Require the return value to equal sizeof(ctx->ncm_parm), consistent with
the existing exact-length check for GET_MAX_DATAGRAM_SIZE in
cdc_ncm_set_dgram_size().

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/net/usb/cdc_ncm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 35db38cb3e4a..66f40f0d9c27 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -524,7 +524,7 @@ static int cdc_ncm_init(struct usbnet *dev)
 			      |USB_RECIP_INTERFACE,
 			      0, iface_no, &ctx->ncm_parm,
 			      sizeof(ctx->ncm_parm));
-	if (err < 0) {
+	if (err != sizeof(ctx->ncm_parm)) {
 		dev_err(&dev->intf->dev, "failed GET_NTB_PARAMETERS\n");
 		return err; /* GET_NTB_PARAMETERS is required */
 	}

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.54.0 (Apple Git-157)

