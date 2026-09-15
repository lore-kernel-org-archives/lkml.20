Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00EC368D4A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459549; cv=none; b=maoLO2IYQvP85MMRzoHSvIQlsPTtUVcTQlvzEYNyCwAOTlJQ7VPy2BovqwBxrwWkL7DhRr02W/3KsngpqI6wB9mLgHTE40aH31wSd9ped0ooyJz6oQwEQ1TODgdSWqfL71245fleKCcQkXV9lxKx2yEjI1HvSIn2yH/nt7ZtP7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459549; c=relaxed/simple;
	bh=5IK3FxgV24djvTZ27qsfexgDP3v5xGlhYgnjilnpCzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZ5jSkQKQolh9xveS/rzWb/LP/zm1yJM/6sfAONxOqmysSg2q1H01wigulKezK9S949Q8IEqgC6/8JBNry2uqm7NZDEWEUj3EHyCrJwL67zH7wkGnIgLXExvNexXxHYKndvGnY+pFc//39UtRfTptr3pWBwTvDYP17oDBXYMGIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ3qn34/; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ3qn34/"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a2ffee6so1197041b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459543; x=1790064343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8y3BbK3AOzFDW1qQRhNYfeabqJLNEeHv6A39ZBXCEoc=;
        b=ZZ3qn34/kQzlTzanorqJ45WsrkRzTbjvGHfKd2UbCsW+Jrc2WkAXs769J+K0EH+arq
         7QL0ou2fnxU84TlV59LMLSt9L10+uqYLy43+AysPOkdpOxXx5tA+SL1ESWHEPpBRCeQd
         qfiUO/GVGxJW2nfovupLrTl4C1t5j/bf5qasIh4AFaZs2U/vWK0x2tItwJsr+dJYJaZY
         nQmW5tLbUOlX6YirPaYManQnzx7lxhfu5pYRqDXcKiIo0Y8ibrQK/nGi+1vtPoinbBOQ
         0GdHXlfvjSN5bmMFgeLzqHWDe1p3s88EtyZdC2L0Gef/9i89FO3REgC9YVXlodar3itq
         oPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459543; x=1790064343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8y3BbK3AOzFDW1qQRhNYfeabqJLNEeHv6A39ZBXCEoc=;
        b=K+5OFXOaUNj15ipGLTS22DPCNOckx80L8quZCxJosnPN9crGxCb1ABbWgtzZoCoKwb
         +wGQmudU6CWrYmVLPhr+/YRBsO2PnZi0kT8RmEiukVIA4WEIVDiQjnATUgyiMaEqFoc9
         DyxoJWRYmUGBzJTtFSX2tYfvB6z56VkT8117al4K5ofvfH3YEsPrMslvmgeqKZc2YLjy
         06gBLv1rAMHjL2F058UCILdVIShpiHF3lgmB2v+DQ5aQ8o8fILUYLb1dZSRnknAQxe4J
         1lRurEB+XcPFa2GJzL2aLgeZhYkv3JCoSxlqP7m7G8u4oNm6kClcbvSSL6wvQwrBKqH1
         vCKg==
X-Forwarded-Encrypted: i=1; AKwUvBxVnoVfxN6A6H+k1W0XyasY7j1cxmYj1E7B0QArTe980jpznmzv9YFFcOhluGCr3y9Og+xhzIiqK59HJJo=@vger.kernel.org
X-Gm-Message-State: AFuF++kNUxKLT113D8rurDEXUuNmzudDPwMtKzOsaKY3B6X80j7knxSC
	ynGSmG5fvrET8i/YgNVXhw29MnMiIVE6Sxxh+QV9/8SvBWUz9tOCp6Kt
X-Gm-Gg: AYBFou0VZ76APKddj41p7flwuyhHSBIlBy+7o9yetHQ9WmnCqnr10tICPyz+59sgaJE
	jHINjbmbJTOgDoH8lAyRBgtLGzn27DYsCWN02qLhBQ97JQxCx5OfzQbRtTmJdoSsIXUZDXz6rom
	2Qg3ZwofQFnOQHgVR0rhDGVLy15n7InOYdAE5tWMgmoZgPd3A+OAdYZScsBDcwTenuQT/4sPnUI
	LmtMls0lBptEr6bVtNjZi5JMnt3jK4jjrstH2LmM/jZNZ3CI84UEV+oiNrdC2QDJ0oiYcW0FNKc
	R0x94OKMw0t/CNafKr+NvMqlF4rqNpLhc95SGv5b9weZ0J5LmJnJapBgQPKyGXU5k2lKs4KefgL
	hVA+DWkMoyx5NGshikOaR67aJMKJM1+5UnKWk/yFQNplqX/pUR5bcLeGDjMKpDqforp3h/OQ5tb
	YdYut1dD6y/P2otymZ88MQQodGNXTEj6j1SP9evXe00FAHNBzk7ptfwVsf4+FWHt5XBXZhm9TKJ
	vWSVkc=
X-Received: by 2002:a05:6820:198b:b0:6c2:10e7:e044 with SMTP id 006d021491bc7-6c54214b2c9mr3748286eaf.64.1789459543377;
        Tue, 15 Sep 2026 01:05:43 -0700 (PDT)
Received: from user.. ([2405:201:c052:b00b:2d66:72bd:41df:2efc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33be92873b7sm3615552eec.21.2026.09.15.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:42 -0700 (PDT)
From: pavankumaryalagada@gmail.com
To: gregkh@linuxfoundation.org
Cc: michael.christie@oracle.com,
	nab@linux-iscsi.org,
	mkp@kernel.org,
	leitao@debian.org,
	skhan@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_tcm: avoid NULL dereference in usbg_make_tpg()
Date: Tue, 15 Sep 2026 13:35:23 +0530
Message-ID: <20260915080523.15979-1-pavankumaryalagada@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

usbg_make_tpg() can race with creation of USB gadget function
instance. tcm_alloc_inst() adds the function instance to
tpg_instances before configfs links the item to its parent group.

As a result, usbg_make_tpg() can find the instance while its
ci_group is still NULL. Passing this item to
configfs_depend_item_unlocked() then causes a NULL pointer
dereference.

Verify that ci_group is set before calling configfs_depend_item_unlocked()
and fail TPG creation if the item has not been linked yet.

keep this validation in f_tcm instead of changing the configfs API to
accept unlinked items.

Reported-by: syzbot+a9efa71b884a23e74153@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a9efa71b884a23e74153
Fixes: 4bb8548df632 ("usb: gadget: f_tcm: add configfs support")
Cc: stable@vger.kernel.org
Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
---
Changes in v2:
 - Move the NULL check from configfs to f_tcm.
 - Restore configfs_depend_item_unlocked() to its original behaviour

v1: https://lore.kernel.org/all/20260914094426.25595-1-pavankumaryalagada@gmail.com/T/
---
 drivers/usb/gadget/function/f_tcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a..2c2cf1164edf 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1682,6 +1682,9 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 		if (!try_module_get(opts->dependent))
 			goto unlock_inst;
 	} else {
+		if (!READ_ONCE(opts->func_inst.group.cg_item.ci_group))
+			goto unlock_inst;
+
 		/*
 		 * configfs_depend_item_unlocked() may acquire the configfs
 		 * root inode lock when the target belongs to a different
-- 
2.43.0

