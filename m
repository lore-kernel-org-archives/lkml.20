Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F94AA593;
	Thu, 17 Sep 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636804; cv=none; b=rB+nM3eCIBDRMLkKw/Uug2nGaehVSW1dIA84eirY/L1bkY+F/QqzeLt1RcajiC3QaztPQOhVe2iFXgcC0BPrzvdgUxq/n+Mkt9155t9QXG50HYDJny9eLCSBchNp7kMQTvcifvp57WRwiK/oKtG8OyjbNHLxI0pmo2N57k5kL0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636804; c=relaxed/simple;
	bh=uiSe+PK8k7wF+gD+xbbiCi3lCO7Clh0lFN1pD9yJEA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3j1h4C3oD1HagXD3LXAaODLp/pbVduOeS/XUq3Hom5hDu9/1NI39SJ7QJpkGkp+JHtO9KTjvg6gwILjKBWOqSULHPrUsRn8X5HqEDxmNhYkziNAh3idDUhdtQ3M3yX3AftRHM8gyWgUZqy3wRY4c2XycdgnV0eG87mEZ2eUjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkIvi0ez; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkIvi0ez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C4A1F00893;
	Thu, 17 Sep 2026 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789636803;
	bh=FQ84VD9RxytPSBiLULZYuCI9BKhrLHxgdihM9MRlics=;
	h=From:To:Cc:Subject:Date;
	b=AkIvi0ezfjQRB1M35UMnXES9WwhCb+5oKFsgtNC7jdjdqY4OG62KjGvinW6vd94CN
	 2Y47pREPys9sk+P1/xZ78co58mBhso1hUu1W3WelZZqZCp1r3WST3XdT3OqRpRk5km
	 BbjCDssHe+mascUDch1+S7SH4MPpafXNCH+JK3ZTIMmGRu8TDcc/4Y4Sp/F2q0sbSG
	 UcJ9Sw6WOrCHCdXfxE5PMQSVFW/dwiizc61W0haMfFKztB/3ZuRk7WbgG/AmcJ8Ima
	 bnEPIuGjiBZJvffeISaIf8B1855geoUnVUEk0F5FLiyTAT8wx/bbh6E8hldkwuIkQ7
	 LTArNTkwmWNmA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x78Hg-00000006QPo-3Thp;
	Thu, 17 Sep 2026 11:20:00 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] USB: core: amend usb_get_from_anchor() kernel-doc
Date: Thu, 17 Sep 2026 11:19:24 +0200
Message-ID: <20260917091924.1531457-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amend the usb_get_from_anchor() kernel-doc to clarify that the
unanchored URB is returned with a reference held.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/core/urb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index c06b44ca507b..19e2c21420b8 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -951,8 +951,8 @@ EXPORT_SYMBOL_GPL(usb_wait_anchor_empty_timeout);
  * usb_get_from_anchor - get an anchor's oldest urb
  * @anchor: the anchor whose urb you want
  *
- * This will take the oldest urb from an anchor,
- * unanchor and return it
+ * This will take the oldest urb from an anchor, unanchor and return it with
+ * a reference held.
  *
  * Return: The oldest urb from @anchor, or %NULL if @anchor has no
  * urbs associated with it.
-- 
2.55.0

