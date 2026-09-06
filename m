Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086DA3D1AA6;
	Sun,  6 Sep 2026 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700754; cv=none; b=PFtNeVw10Cmc6O1vbvoBcVNsL9HjL/X4JfIaAJQpA0nI4ko38ya1VsS+cUiMccUkVxsPJR1O1GMORhmhrMiTdySTlNJPQkCex4yLTEy+VeP0Lqycwfld+SWNrDwf6jkB1zAvMv5lCQOOxydT3kS6/zyHVIUzf3Dqo+wsZliCr1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700754; c=relaxed/simple;
	bh=gbjy5RTDqdhCv6DILtDb7fYiIvaobCHJMRXApRCH1z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LQ7goMnmXPmKV0ynlKkJ233eRVqlEuCBw3d1cDmOAosKS20X4KJgz90GayHwVkUF3JuavBAEr8y9NyEh2casU+J70G8/KNlkorQU6JWmyh970H4DmmORZ3h0JOn8j5a1C5oKAr97+a4dFl7JbhNvZa2mWg5atJX/7QU2PonON2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8wA+Ii1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8wA+Ii1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD763C2BCFD;
	Sun,  6 Sep 2026 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788700753;
	bh=gbjy5RTDqdhCv6DILtDb7fYiIvaobCHJMRXApRCH1z0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=G8wA+Ii1SqM5ZEW9lgftcqJknYH9oOoIarL4SI7aYBCJFGXzJ4r7FVjNBK2iXniLf
	 5eq0F8FmXN+55mllFo+OzDf2LMy/Zs86vmBSDipa7wYLJpDHKek1Z3HaLhhOsrdctH
	 g/EFbOyMLSpNNUrZO0qbMEVZV2oMUcSGY5kaiXh/gRjXFp5AaMg8PbkA0RDtMpjcm/
	 v3g31HzvsdQGXW9f1u+jWkdhZLrOx9cioz7ymE3d5lYbWnwOCeoECD2relGMcdq/Cv
	 G02tlnWbR11oPLsHWOQ+vcqpvTcec2+pgze1gW7vVCRl/eloKFd5VS8XFj5wwazkFg
	 OW82qW69EDvfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878F5C79FA0;
	Sun,  6 Sep 2026 13:19:13 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 06 Sep 2026 15:19:03 +0200
Subject: [PATCH 2/3] drm/panel: ebbg-ft8719: Fix the MODULE_LICENSE()
 string
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-ebbg-ft8719-fixups-v1-2-4e846510cad1@ixit.cz>
References: <20260906-ebbg-ft8719-fixups-v1-0-4e846510cad1@ixit.cz>
In-Reply-To: <20260906-ebbg-ft8719-fixups-v1-0-4e846510cad1@ixit.cz>
To: Joel Selvaraj <jo@jsfamily.in>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 Linus Walleij <linusw@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1192; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=K+6x5A7ftBFeZ8okSqt/u0WpvagsMUKZ/4i4XfBmirE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqnWhQKxw/18Yi3JTzGNeX5AKT86t+qacac3fYZ
 YrXf92tobCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCap1oUAAKCRBgAj/E00kg
 cqHbEACUzO5xpCO6DJHKL+wZE4cGM0+6FVzSI2CJiTlBmx7ivsSVlVTUm9VzMpRoGmMoPmep8mx
 jk+g02tU1yTP1uoMxWxLsN1BGU6v42Yelh3j3h8t0T/Cwi/HsYSuZXE07fG9EErm1QZoe/lugHI
 jf8WfnXlQy/2rcadTEYH5huYkCyFmQ6dHZ4kt2LBidufQ+P603p8b+tqX5IfkN/Zl2ZMJReyPev
 2D1RgK3VGbH0euiZXZPh9ukLP/kM5fVzAaYfbVGzNP5Hm7Tj5GL18ZUtMuPsgfToPSxwHIgagYR
 COdrUowbB7a6aJHZ92j1b7G9bSz2UODSzPys2c02J705RWqU0/lCfQBL2wuvlO4hMVN79yAsHW+
 jsynWFbsb0gWjkn6HLi3AEVGLtIQULjbCiQp7JIdcaRGput6HEp8+si02v8OJVGmR0d+mYHpFpt
 eqyvezPNajC2GDVPFTNCPFpNy6VnZn0AcsYKs86cR4Xv6Vt8IzF/zyVceSHZ1Hf7gUs6cTUUuSI
 Vpuj2srixPiX/6oWFubE0N1BzhClsJ7sTIgnmYGIbn7iNGPyk3qoPPwvjNPURDlgsFLOdZPboup
 7fFgqJ2duCnQZApnt+1sfIzL67YANFVfiMn/pkWq54ohlBO8JwUD2kRn0ttMWBMJVKZsPA/CFC4
 zNaES1kh101L4AQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Replace the bogus "GPL v2" with "GPL" as MODULE_LICNSE() string. The
value does not declare the module's exact license, but only lets the
module loader test whether the module is Free Software or not.

See commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs.
"GPL v2" bogosity") in the details of the issue. The fix is to use
"GPL" for all modules under any variant of the GPL.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
index 1ab09c50a6306..14982263a94f1 100644
--- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
+++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
@@ -241,9 +241,9 @@ static struct mipi_dsi_driver ebbg_ft8719_driver = {
 		.name = "panel-ebbg-ft8719",
 		.of_match_table = ebbg_ft8719_of_match,
 	},
 };
 module_mipi_dsi_driver(ebbg_ft8719_driver);
 
 MODULE_AUTHOR("Joel Selvaraj <jo@jsfamily.in>");
 MODULE_DESCRIPTION("DRM driver for EBBG FT8719 video dsi panel");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");

-- 
2.55.0


