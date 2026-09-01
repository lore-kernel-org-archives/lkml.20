Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724973D9527
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266307; cv=none; b=t9GFMhS61qiz88nl/NYGSiX/q0f12/HENIWENlgUM7IBNan70uJN1Fc979U6X5LaFCBN7XXVE+SOfcWD4nluFfRvXJaAFTKI5RpZbTaX4NrMBqtwcLxH2FLMoLuyK8wz5S/34VwS4magcmSp8daHSYt5aa6Nz3oqe083osVY5Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266307; c=relaxed/simple;
	bh=vruKC89nk4zaiMLwDl5SIvX2XA+mwQsDJ/NYJL65OA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwrJGZ9l51dXz/CUlbDfyKO+qhiJAoS7cJ98Vajc9isfw6m2P90DtAnSi9N3o5KvbVImypWwaNiWZvOunw8yLIMTzxSrPyaWjnX8Q95Kg/Z6W4uogBzXpGHdtJTcLO5JSHwmzmKYgVGm+//gVX1J3H6EsltRXMAa44bjm/W6r0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CB9W0V8X; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB9W0V8X"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4996c452e95so2662165e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266303; x=1788871103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLf1s6Y9d7Zvfbu7ZXvz8xHKdpLKgc9er+6NC48ncbQ=;
        b=CB9W0V8XPQNZh91DkGEmr2Kwe2SiTiapgsmSACd5fEi1sk1RJBzfxpKEMnp4LwitS6
         KsCs3TK8Gbrzar4xfltug4vhmxip9xnxq2i2/dX/NlUNfMD1DfwnmNSN3sT5aT8iRnQ1
         rySrt4L3fLC3yQabKDGQe5t6a72wwbGoajyi0oqpKRxof7SMnondmF3tNcBDA0IbGOS9
         DOIAnVdViGo8UeY1hYLrvZJu5MMnEVquYf/iOMFBLULRuACWo0O3KN1gKJLzLnhAMjHr
         8rJ8c3e0cP9mRXuS7rKLZue+FKdXEGApkk/rZIrB7bOH/7MpWfrlRNPIe8D75ehZQ4N9
         OFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266303; x=1788871103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLf1s6Y9d7Zvfbu7ZXvz8xHKdpLKgc9er+6NC48ncbQ=;
        b=AMMTBlut+E9AO7r4RMA/nwHTolSP6xQUkFTh3uFaNFToqad5xHh0sdlB7tSQBuFpoh
         YH8C05pROaSC6SU7doSND6y1viIl858MaNWgb3XWuZQXJMpqlfXRLfpiw9gUj7bB1tZr
         e1D/2QntPmHKKDRbviC8u6s8xfTWUNg3vJ8YnvsFpOjQca963UyULXLPCrlguGp1OBad
         qNbcojEivzdHLE2KdNDMwAawJZD831QMBQkTAPeFMMlu3L+cFfoHPkb5Nvhf2ayM6fwC
         jBHz9ehbkLcgEIG/lSBLDR+SMggNLqi9UO7ej8jYYAPLE4Waw97XG4G+bJsOdCF6C4cp
         BBkA==
X-Forwarded-Encrypted: i=1; AHgh+RrZevfkgM81T6+xkmZdybeA7U09yD2JqNVghITnEdTnhmK7ImXbCv/H+hUiEhALzUwdWMuvrtoskdZt4dU=@vger.kernel.org
X-Gm-Message-State: AFuF++l5dYeTn5mudtFHeblWviX5Kuigd/RADBS3+n1l/DKhunHl97Dp
	oB1bIxtfu9dhp9npqfet3gMnlMwQgMqNIAKOmXSuXgQQd99G1GlyiiJG
X-Gm-Gg: AR+sD10delXATBKiovpLX/UPewMqEjI5E/NAXqBFcHFfQHxCLAwY8IyHfTEeaZx0Izt
	iHxPf+vo+XixXDtU+VgFc97vS9sizf3guvwqP3OKY6hg3GJMeupNiznOT+jaoHJynyP3rkIo0mt
	8jr/vT9mqAJAIe6I3s6FRLDu6FsNx2sWqKUIBZzOL3TsNp18IMnSZepfyK9jUcNtedzHa1VLEa/
	vqp//x+RcMwLBNqrp5uWHMNeC4ne1i+gDgrkaGq2TgmwofrkwGYs4DtoJ9Lgi0tl4mF/NDv9eXe
	YMUQgtnC6cDH9c42ct7c3sn5wJLsVXAFiatW4ZXerbqswLniFMhLxRsMyQyEPog66hSGXOHejrK
	SLbpKelq3ZF5BDZ0DKcUQ/6OWotsub89i4YA2+aDkRdVJUBDBnzP6DYo1lTdKWfj5G1LUuSDQsY
	WLNkV95f2D9vTCAAdQoOOrWLQ9HwA8JQlRpwLl7dT5miZ1RbYm6Z0bOh3Few8SsDW3oD1wTjxqu
	4U82Nn1VIdo3e9kB2T2e318x0+qX+Nv2CYeQOzKg3Hrret5ZFeQJnFFerm+QnDBIQu0JFRt9xt4
	ioIUWGApaj7LorGLDI3CUjLC
X-Received: by 2002:a05:600c:3511:b0:49b:916a:e553 with SMTP id 5b1f17b1804b1-49b91bd790cmr275499345e9.0.1788266303178;
        Tue, 01 Sep 2026 05:38:23 -0700 (PDT)
Received: from pop-os.. (98.102.222.87.dynamic.jazztel.es. [87.222.102.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1025asm63961915e9.6.2026.09.01.05.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:38:21 -0700 (PDT)
From: Miguel Garcia <miguelgarciaroman8@gmail.com>
To: netdev@vger.kernel.org
Cc: Miguel Garcia <miguelgarciaroman8@gmail.com>,
	andrew@lunn.ch,
	jacob.e.keller@intel.com,
	syzbot+372a7d84708b07f64d9b@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Subject: [PATCH net v3] devlink: use direct firmware requests for flash updates
Date: Tue,  1 Sep 2026 14:38:19 +0200
Message-ID: <20260901123819.2035064-1-miguelgarciaroman8@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830111700.1799255-1-miguelgarciaroman8@gmail.com>
References: <20260830111700.1799255-1-miguelgarciaroman8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

request_firmware() may enter the sysfs fallback and call
try_to_freeze(). Devlink invokes it while holding the instance lock,
causing syzbot to report:

  WARNING: syz-executor/... still has locks held!

Firmware flash requests already name a file provided by userspace.
Use request_firmware_direct() in both flash update paths so a missing
file fails immediately instead of entering the sysfs fallback. This
keeps the normal devlink locking intact.

On systems with CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y, devlink flash
can no longer obtain a missing image through that fallback. Callers still
receive the existing error result, and netlink users retain the extack
message.

Fixes: b44cfd4f5b91 ("devlink: move request_firmware out of driver")
Reported-by: syzbot+372a7d84708b07f64d9b@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=372a7d84708b07f64d9b
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Miguel Garcia <miguelgarciaroman8@gmail.com>
---
Changes in v3:
- Use request_firmware_direct() instead of dropping the devlink instance
  lock, as suggested by Jakub Kicinski.
- Document the resulting sysfs fallback behavior.
- Rebase onto net/main at bc93419130bb.

Changes in v2:
- Cc Jacob Keller, author of b44cfd4f5b91, as requested by Andrew Lunn.
- Keep only b44cfd4f5b91 as the Fixes tag; ed539ba614a0 provides the
  registration check but did not introduce the locking bug.

v2: https://lore.kernel.org/r/20260830111700.1799255-1-miguelgarciaroman8@gmail.com
v1: https://lore.kernel.org/r/20260829142525.3900565-1-miguelgarciaroman8@gmail.com

 net/devlink/dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/devlink/dev.c b/net/devlink/dev.c
index 55959b0ff..b85bb02a9 100644
--- a/net/devlink/dev.c
+++ b/net/devlink/dev.c
@@ -1169,7 +1169,7 @@ int devlink_nl_flash_update_doit(struct sk_buff *skb, struct genl_info *info)
 
 	nla_file_name = info->attrs[DEVLINK_ATTR_FLASH_UPDATE_FILE_NAME];
 	file_name = nla_data(nla_file_name);
-	ret = request_firmware(&params.fw, file_name, devlink->dev);
+	ret = request_firmware_direct(&params.fw, file_name, devlink->dev);
 	if (ret) {
 		NL_SET_ERR_MSG_ATTR(info->extack, nla_file_name,
 				    "failed to locate the requested firmware file");
@@ -1245,7 +1245,7 @@ int devlink_compat_flash_update(struct devlink *devlink, const char *file_name)
 		goto out_unlock;
 	}
 
-	ret = request_firmware(&params.fw, file_name, devlink->dev);
+	ret = request_firmware_direct(&params.fw, file_name, devlink->dev);
 	if (ret)
 		goto out_unlock;
 
-- 
2.43.0
