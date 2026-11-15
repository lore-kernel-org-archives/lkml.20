Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725108;
	b=f/5ytkuRW44sxWhLx5zBQzxEjCEuIHvZeom4MF5vD4qNACQMEnm6WXTmePqjbmiJu7lh
	 OpAxyFFbChznwGL3izhndPD4ieEa3mPA6g8Iba431zRbLX1MA9P9PifaluE7UD5JOmh1D
	 ASkuFUvaCwnSPXGK+m7vMlCR1hy3Tn0zXj05jc108SZ+x2Ry2FRDlcGbEcMiCq0BINmV3
	 FrKK+c/Jp+HEr62wxdImqqMcQptHdyG5+9GdDkDVb8r7Rezc6w839cCtMYpYZFgyjDHAf
	 nmNT0eCS8Pm5hWW6dWUPvk+4P/DKOuvjIMuKSeG3wcTDnwK+GCG5abiIQ2Y07PwW4OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=BonwvJOwzyfOZwsDa4VZnjPDHnDoIEr1GLr5/tnXVZY=;
	b=c9McISrLj/gcIDzjvQL7LgDMAuy+stZu5Kh/tmYsAr66OVuPmC4H8SwkdLhWAtkuoXpj
	 66suUXB5XdBplnTn4Q44T1RPTl/aDS6s+Zrx9WgU+fA0wh5NGqYRfqeNwSeJQ858CqBmC
	 KNBeeZ8siwpGf6J/GGQNNNYkKesITRB/1WYXCecdNkvolgN5qXaR+T0oOGIH7/XkAT+JK
	 rFaNfThmyO41CAapGnriWUKxUOoPmB+9qrR9kU946LgIfJtdbx1MJKY/5l1WVdETs/Zhv
	 WGpOXPkAbtjRa79131LqxNXLgQ6uRtOBk4Up6GfCfsWaPDw+kmd/kwxlMpHHe2wilPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGIHftSJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB11D606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB11D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGIHftSJ
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-55d2d380f6aso5667441cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794725106; cv=none;
        d=google.com; s=arc-20260327;
        b=HDKH4IXDlRoBpamhHLYMpxZ4w7Qi71g3mIAeVBfxUX8t+wB5EI4+uOx+E0gxn8XhZ8
         wLFileuacojolc0lLl+ebcphavO8XC/BJrygiXXTDqrsudsaatyiIR3nQt7gpYbrahA9
         Q6dDDBROuHO4Zs7UQNNNK9cTefgIA8xhoN4dAr297a0QLA9fKk9KlbHSbuHfU9l6U70O
         vktgzy/Ij7Aij/vvA+Yk31jTQtaZeINhYgRndIzSRbOvq4H8Nc/iyIpfWjGd0Bi7eUsA
         5RSfaypUqFjz0yE1Pn6nTnuDCMiUiCkm/DTYkT4QVW5FKwz0p7JRyhxhT4U7Iq1sW1gn
         4UXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=BonwvJOwzyfOZwsDa4VZnjPDHnDoIEr1GLr5/tnXVZY=;
        fh=emwgfnWhPZZb7AawLA2UbsVoMjnjKoIL7RZBq6ROoiE=;
        b=jOpxDYUSEMEbSn8ieJqnPI1OlVyxLkKaWegvGngLHBg4L94kMPesOF2aXFO6/T6S9y
         G0R4Yp/Gg96ctOTJUB2gp8JOBlE9WNfDU0kQxFeYPfFoCcV3f06JlonTNP6wrX2/4Z/C
         aSCINtgiQfawZqM/DvNlY+QLF3qURvkMaW0WrlAZflk65LlbnMP/ljJTjelk/eLqXakU
         eOj46BGLjJyfKQ5MhWJ+/b3m/g6PkQP8Jv5HtZrMy6rF/sVdQvqFQlZP02Ws6g12hCJa
         hZbw6KjnSiVqEvRI/RDvWZNpeevSgf+5xgKEYANes/xr3gdiUcE4m1oZsEsf+mVDEVWC
         Od+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794725106; x=1795329906; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BonwvJOwzyfOZwsDa4VZnjPDHnDoIEr1GLr5/tnXVZY=;
        b=VGIHftSJRHfvG6n9bf+7VEQQuC0INqamCJ+ouB5b88iNNMSohXjAIpMM/NORzzJ2Cr
         vzIW+D45OCYSxO0k1qchzUsWyU0SXPJaBjekD2njLVJdhhT98HpR/BIUk42bJO7GXT0H
         FtsKPVtflmVlG4tUnycDOdV9xaO/h2DmQ3B7dXCtlctSTZshCcsx6yWqOdIJie212lNH
         hN8caKxMcXHQEZCEsFFexjqdl9eSbZNcsmuW/7TLEsybR6aa2rI7TQJ6VdB9ncdQRIH3
         moe7FuEKEY9bGzcBRVRO4o6sqxZRofvq8lEbiEPSrsAux5yImWrRSXbzuZBTv86AxC4m
         q0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794725106; x=1795329906;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BonwvJOwzyfOZwsDa4VZnjPDHnDoIEr1GLr5/tnXVZY=;
        b=vXMdckmGSqgX/PPhTgvO9htu8DtVySjiTfv836B8vHSpun+cUoSQIYFvFtK+ej6gC+
         fNkbCVp8uEE6I3lmcPYa2fw8DeXK7T5v+LXgJEYoAgwgBr1dZ07sLY6BKaqFqCV0P448
         ka80Rqf67A8yQKyye1Q16MAh5nJy8TwRzmqs9Xn7NrDxBBGhBGRmYO4KlxiBc0H1HLo5
         ORSNYZlTzc96luq5zCOVDBmFpinp0GqjzGxS4cjNTfq2WLGksF68m2OG7qB3uHJYxOdU
         BbGP0TWsaz2vE4mDvf3Pfw29sJTAjlkOuSFu3T6lJ3ez+16wdnL+o4dczkqsJb/fo4KI
         8duA==
X-Forwarded-Encrypted: i=1; AL+hErFHHe2dXPEQbxbbLT6u059HBy3pmNTuZ8G+8LloLnslID1MrqyTxjpga+FiWdwKn2ChDM34x+xLqfa1g24=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BFPW5ptbaO/Uf3eu+xCBYWtF3L3XVfxg8NINTVRXCsxnKT/oI
	o24n+aA8pM0SxKwP0sN+BUmpcw80ZCt7qWwMVYQyjTUlnuz24b+F8gLYgcpm4C1jJZ2Y0E4NVrl
	trAld5Hp//7sI0COaUp7AqlyNvphVHu8=
X-Gm-Gg: AYBFou1BiigBCzFpO0kR6ec5eQgCQ6iBh1ZSqEyAN07qaLTgwSpxXZT29wK2VzTY8PH
	WrqoZOGIjdhGvJNGuZKQMlauPuvNcsEbpjXMZNaxh46F8n1UoXT7Z+p1Mv8ny2FsLdcS26t80NY
	CP0Ua9xW/KLsTdOxPEmrkZ0KWOF3w+q5qlJcejxHte3CQhszen4VLj9xKIsO3pVITCDXNe66eWB
	Qi1e6fyBONx7v3VuvMYFMKHgDyhZHyGPCJauvGHN1+oxxoOo7U6CDbgMftN4OIrccMsf3d5b3gs
	kwn53CIH0bpznu7D3kBdqhXDgWpQ1pANytO+NOMsAMX9MCmzBlOCenUDR4tpMsQEsRVe2Db2JNT
	r8LwqCHhqhR9aNzs3VCQfPQXb7M4aYtaK86+4qv/Iv8BZE007LztZg6wR0Loda3SKJSWt
X-Received: by 2002:a05:622a:307:b0:535:1f7a:e29c with SMTP id
 d75a77b69052e-55ac7d51618mr121069271cf.37.1794725106624; Sat, 14 Nov 2026
 22:45:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Alex Guo <alexguo1023@gmail.com>
Date: Sun, 15 Nov 2026 14:44:54 +0800
X-Gm-Features: AclHuK815p78pa1VLVdaryG8ubT2Fe63Q2Vuh_MREkJ7uBfmIhWNdCuxkpU-f9M
Message-ID: <CAAi4Z-eivBb9rX=xOwm9EcXBaM2T693r6FJ5649B=QxVEE_T4g@mail.gmail.com>
Subject: [PATCH] drm/kmb: Release the DSI device lookup reference
To: anitha.chrisanthus@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

of_find_device_by_node() takes a reference to the DSI platform device in
kmb_probe(). A failed probe leaves that reference behind. Each retry
while waiting for the bridge can take another reference.

Tie the lookup reference to the display device's managed resources. Drop
it on probe failure or driver removal. The separate references taken by
the DSI initialization code are outside the scope of this change.

A similar issue was fixed in commit 7c6daeaf0a72
("pinctrl: nomadik: fix possible object reference leak").

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
Build-tested the affected driver object with Clang 18 for arm64.
No hardware test was performed.

 drivers/gpu/drm/kmb/kmb_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..f6d02893035d 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -477,6 +477,11 @@ static void kmb_remove(struct platform_device *pdev)
        drm_atomic_helper_shutdown(drm);
 }

+static void kmb_put_dsi_device(void *data)
+{
+       put_device(data);
+}
+
 static int kmb_probe(struct platform_device *pdev)
 {
        struct device *dev = get_device(&pdev->dev);
@@ -515,6 +520,11 @@ static int kmb_probe(struct platform_device *pdev)

        of_node_put(dsi_in);
        of_node_put(dsi_node);
+
+       ret = devm_add_action_or_reset(dev, kmb_put_dsi_device, &dsi_pdev->dev);
+       if (ret)
+               return ret;
+
        ret = kmb_dsi_host_bridge_init(get_device(&dsi_pdev->dev));

        if (ret == -EPROBE_DEFER) {
--
2.43.0
