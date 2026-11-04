Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781532;
	b=Lor+Oqa+4rz72BjKzOwGGqYgSDB8xiUbXW4sUxQkC8yXUyp/hdvT3X+lFe8ARznM1sXU
	 AGBYvdD2O/huLkR4xfbucnw0gp1ItJQn04mCSmyYcCfqdIx8zhkFjCMkhVXx+EqPVqaM9
	 kLWDIFhDrx08/OAUDqULhQS9X0gRF0MOZlHww2GCxrSboSMbYmKDa6Ldh0Kzc6VgRHUG/
	 dvWL6a+jJBwgyyRjHXls6wIxUi3NMcC60HqYGnEs31GEOHJAYLsse4Ua/dyiauH3QcW2l
	 XT0yx3Y+e0zT412U9RiOh9pP1mqXXLhqkGz2lj4FX+1y1717IlD6qAZTA8BjDZ0tLWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781532;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hIMNjHCJ6Epw1gnJ/YZMFqPfCBtYoZg9ZwDQR4d4GN8=;
	b=bw7XyCOdA2o/XlPkE1fjZglJdYAjQaZhTx0f61oYEF2jrMhYyQljNZhm3r7POfCg0P8U
	 G1K5ePV8VFZZab22TSajbZ1GsMopD+FEysET7HXaEvEDLb+XZkQ8BHeZco/3DGKp2N5hh
	 XApsf3+IkgSBIsSf0lN6pGWsVPJowAqrEsJj8LpMt+KYehChq96FXiR161+DgO0ZqbC+1
	 I300kCAq8x2FEmmgG6K78sNdIDxSkf+37KpSbVCmGowGgHU5Sq1s1vSs40WoNJbqlOfgv
	 OHbPuW3ioUS6gxwaHrSHTZHQPDk4toTbgM8y1ytPJZKaevGN/huhawcAk4GcgBkzn+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="BkpBOH/I";
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4798606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4798606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=BkpBOH/I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=BkpBOH/IdPZIkd5X0z9cWfhuRhKZRcC6Zeg2i0N38zmzunPUkj4ggK1zZYiE6mXUTXDRQlO327Tn4
	 SLKx3EZBePV2lIZtdmv8699lsCe7B3w5KzjkuqOPvoe6tH9lQM7iOw/TmmJgEi0E/OOoGVG0p2ivgj
	 ++K/uLvZTyICymwE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36aeaef18c01-67f92;
	Wed, 04 Nov 2026 16:38:49 +0800 (CST)
X-RM-TRANSID:2ee36aeaef18c01-67f92
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100256 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36aeaef174bd-175ce;
	Wed, 04 Nov 2026 16:38:49 +0800 (CST)
X-RM-TRANSID:2ee36aeaef174bd-175ce
From: xujiahao <xujiahao@cmss.chinamobile.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xujiahao <xujiahao@cmss.chinamobile.com>,
	syzbot+8f06445357a052a92657@syzkaller.appspotmail.com
Subject: [PATCH] firmware_loader: don't WARN when usermodehelper is disabled
Date: Wed,  4 Nov 2026 16:38:47 +0800
Message-ID: <20261104083847.517-1-xujiahao@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

fw_load_from_user_helper() warns when usermodehelper_read_trylock()
fails.  That call fails with -EAGAIN only when usermodehelper_disabled
is UMH_DISABLED, which is set by usermodehelper_disable() during system
shutdown: kernel_restart_prepare() and kernel_shutdown_prepare() both
call it right before device_shutdown().

A firmware request that races with system shutdown is an expected
error, not a kernel bug.  The FW_OPT_NOWAIT branch a few lines above
handles the very same condition by returning -EBUSY without warning,
and the failure is already reported through dev_err(), so the WARN adds
nothing but an unusable stack trace.

Drop the WARN_ON() and keep returning the error.

Reported-by: syzbot+8f06445357a052a92657@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8f06445357a052a92657
Signed-off-by: xujiahao <xujiahao@cmss.chinamobile.com>
---
 drivers/base/firmware_loader/fallback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index 00d6b6e..9bdcf9a 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -155,7 +155,7 @@ static int fw_load_from_user_helper(struct firmware *firmware,
 		}
 	} else {
 		ret = usermodehelper_read_trylock();
-		if (WARN_ON(ret)) {
+		if (ret) {
 			dev_err(device, "firmware: %s will not be loaded\n",
 				name);
 			return ret;
-- 
2.43.0



