Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119414;
	b=p+7koFcp4TrMlHIeUTKykD6mgp394NSmKtP/1b/seYQizq73U9Qocg7TmF8TOf9fGPTA
	 EO3SECnNuYDl8a2o9152ofm2ytbDFdP188DB12W6RV9HbkV8oTgwnh+9ESoGu4OIzT1eJ
	 s35/djhvOO3yyDbDeST2nynbUfkXdx0BhrX1do6x4Rg/FRhAx+SWcQTcmeUdaskpzpe7J
	 cH/bjZgG5BdAHxZMFAn2AgaC8iWNHaUoxJxBZXIDqLLOqHg5cS6+ebhnM9Fa7JgWLc0ql
	 2tvTV9ALY1FW0MDX9UiMwi6xnocg+qHLPMHdJjeNn9mTW3U2vUflkBf2xIWY8ThweVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119414;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qe1UCqyjny6q7djwxrzXnybIwg9PnzO0428rmPVjPYo=;
	b=oU/d8luSTwENtMdYuro9epsBk2HAT1V75+fGSvNPt8KblOLl2xYuFdV3Ic3lSedVsNdM
	 lAbJoq7l1oy98feBCRO994MuaqIP7dQDaQad0uda39NH4LXmWpctyvvDugLmTbfedwE2a
	 tHrV2xuE+AyiBFjZaFRJNlxtorDkdO8N5Adt5XHOvGztsHo9Jtr1CG8QI597+jFC+6TeE
	 k177chByX2O4VlzaBUhKdmb8TOZNBXu5AKu6JRGmWypJUMG9Uy6c936seZE2K2ZfPAPK2
	 +CH8lmwxgNQBWkOSP7hyjSHVQuOM17x8Lu/23whQCxEkgm28wxoOnGpotSWpGFJInIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=b8RrbSzs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19420606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=b8RrbSzs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AEC1F01825;
	Tue, 27 Oct 2026 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793119413;
	bh=qe1UCqyjny6q7djwxrzXnybIwg9PnzO0428rmPVjPYo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=b8RrbSzselfKRKSJnfDbWhV7xq+KkRaiExNaccZntp+zpD6b1IDwAqduZkiI5ShF+
	 sthkE5Eel58p6+4Ab+VMABXgZJ5k40KiIK5kdtdAyQ/WKUbIddnXcyQGHzaEZ25MQ5
	 HBLn0kQ23gJYnKWSUnFz5UNDpXAYSTcGrPfURo7U=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:43:28 +0100
Subject: [PATCH 1/5] comedi: fix endless recursion in comedi_event()
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
Message-Id: <20261027-llm-char-misc-comedi-v1-1-1899771ee15b@linuxfoundation.org>
References: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-comedi-v1-0-1899771ee15b@linuxfoundation.org>
To: Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Frank Mori Hess <fmhess@users.sourceforge.net>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=T5ntRAaX/vFF1QduVzLptbaXr5FZTmoiO6ypKloQG4I=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPrmwM3XdI9u1DZsX7PpXb8u6eZL1oFC+6/6h5uKDnV
 e/aCv7nHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRgAkMCxqWMezeVOogNCc1
 MvDC8iv/Z8fwmTAsaG4KemGtNIm3vXD6vud393bpzFQQAQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

When comedi_event() was split into a wrapper which takes a reference on
the running command and _comedi_event(), which does the work, the wrapper
ended up calling itself:

	if (comedi_get_is_subdevice_running(s)) {
		comedi_event(dev, s);
		comedi_put_is_subdevice_running(s);
	}

As long as the command is running every level takes another reference
and recurses, until the stack is used up.

Most drivers go through comedi_handle_events(), which calls
_comedi_event(). usbdux, usbduxfast and usbduxsigma cannot use that and
call comedi_event() from their URB completion handlers, i.e. for every
completed URB of a running acquisition.

Fixes: 51495254fda4 ("comedi: Use reference count for asynchronous command functions")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/comedi/comedi_fops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index 05d14839c5a6..68eddf853465 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -3495,7 +3495,7 @@ void _comedi_event(struct comedi_device *dev, struct comedi_subdevice *s)
 void comedi_event(struct comedi_device *dev, struct comedi_subdevice *s)
 {
 	if (comedi_get_is_subdevice_running(s)) {
-		comedi_event(dev, s);
+		_comedi_event(dev, s);
 		comedi_put_is_subdevice_running(s);
 	}
 }

-- 
2.56.0

