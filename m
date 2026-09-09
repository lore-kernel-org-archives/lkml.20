Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EBF5650F2;
	Wed,  9 Sep 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962507; cv=none; b=Uu5MCUVfVV44Le4wgESw9NciV/4ksR/q2QU3zVv9USvBj+yCBE5PI3QjGgDn0WOhBRlxWJADRBMFDlR3WbkRw7x+h/hsUk3QK5+hkQFL4z5l1AgSwSpQ1gJji+SVK8ikKwXYTuuuyBUK7S60gFufCihBnl6ofBRuFAKQxIvylVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962507; c=relaxed/simple;
	bh=gwWmA0E7brVISjdpEHUjQHcyJR3cd5d1paK3b97neIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5tWuR3Q1ltIoRIGZrhrDvjwGWmq/bGSYiHJsMDDURqh0oV+FPY+m50erOHOfJ/ZuqLKpwyFg/MuFwK5XCFKo+azIh0PWHJdMD8l9mUl2eshZNtwEO7aJJgM8QYtNj6B6LUC2ZzZBkxe9KoWgFxqOVD+V5sqb6A0bJzL+T8DeQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EYtbLRQH; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mD2ckWMl; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EYtbLRQH";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mD2ckWMl"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hg2Y32PlJz8tyG;
	Wed, 09 Sep 2026 16:01:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T8h/MeAVXy5CPTjg2CpsfFB5ilTJUszKTSM5Irdm990=;
	b=EYtbLRQHkVXmZypw+yYVTlurxjwMrC7b2un7AHOH1bMGlZ+sw7aRwkuFWKaD+prU43v/nT
	y4CCX6knMAyJRt8SY3J/r8M6Eu7EQralnVVAuy0qJja4hkPfmcSjfB0UP0tqAmiqttnLBl
	mZBQBtb9RE9NdQ4+YYEzFGryiDtv0EURTAWpxUjOFfZJURkL79IZfMGkNThnXLq4LFTpc8
	8ZJB5Sd5yPsQY+mf72Zjhk943s+vVPXHPtsmkhId97Dk1zhfDRy3tde9Y8Yahk+RxNcFK+
	hOh+VRS0EoVFyiLx0syF4oK6ES6Tmo4Wq51eobIkZX6SAe3DkrjcWIP5pDWc3A==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788962501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T8h/MeAVXy5CPTjg2CpsfFB5ilTJUszKTSM5Irdm990=;
	b=mD2ckWMlRMxNgP4SZ+W6ZIEM/1jlUyhph+qQ3ahFrZQ5AwzHjQENuZZ35EDhufv6fRZsum
	xvk2IDxvNQZtWKq6Q9eNJ9J/FuLKG286AYeYiOPzTuqBNwt90CSz6kg0UHPTPehjeTX5OB
	J5s9llH26PvB5ppRvFVt090RxUsD1o9+eJUiLD+O/nAm7g3/LuMxIWatYKxUo2/NSDgARb
	UKheCVBV3g56AwKpX7RUJ2+vltYYKnPP+IHDgm3WlBY1g5C3t4LiR1tsWCJGXw58UDETz0
	fpMnuIPqFMC/kfyB1O5LJEYV/iSOTThLQPpYOOV4Bch6ZGIHoKCnA2MmMYoKUw==
To: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-um@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: UML: user_mode_linux_howto_v2: Fix bracket
Date: Wed,  9 Sep 2026 16:00:50 +0200
Message-ID: <20260909140051.1365758-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8ah7dt5ei3ykct7czue5for3cmi9kw6a
X-MBO-RS-ID: d9c2cc3d4cfab22ef5c

Add missing ')'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
index 9224bea5e..13acac1c1 100644
--- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
+++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
@@ -580,7 +580,7 @@ https://github.com/virtualsquare/sshlirp
    ``vec0:transport=vde,vnl=vxvde://234.0.0.1``
 
 connect to a local area cloud (all the UML nodes using the same
-multicast address running on hosts in the same multicast domain (LAN)
+multicast address) running on hosts in the same multicast domain (LAN)
 will be automagically connected together to a virtual LAN.
 
 ***********
-- 
2.54.0

