Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F8490C17;
	Wed,  2 Sep 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353716; cv=none; b=UncjQ3fkaj2XnWGBWd1T8miK84XVA8PZvMSYnTmxR5eUQMTFfsydFP6OaTqcTX9JoP6cfMVl5QkWwgNu0xFhnToA4rCZ7P3cs9MFYP03F6jUt/URGV1hRsyEIS6d6uMWfQ5TImjZ9v03Efysi2svmb6RZGQP/ALI2Zke/5pR+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353716; c=relaxed/simple;
	bh=nWmYeRZEtJ9jeqDn41EJ4ZFYU/6YXIf3RAQRWl0kvE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GW1WSzUHQZepq47uTfuVWFgJoDgUlSeCZrxSYQxGbrtpR99KzM28fgTFhNQfGY0Veh0tP31CL7elV3ybAYTeEx9aeP8iHN6Ro1XnraJ/ogvWPpyJiW5liNUeTGE4S8FsvBRhQetMe7s/7AUVp/6MHIMZkgqcyqx5/0l8Q+6I7xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Jkbk5bYQ; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Tb8LAlJy; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Jkbk5bYQ";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Tb8LAlJy"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hZjPW64fZzMlKW;
	Wed, 02 Sep 2026 14:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788353711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RnLJ9lWFDFYGAcAUAvszeV0gIPvWJfhdBr2yKVqkags=;
	b=Jkbk5bYQud5OZzL99pDOMy1Qls2QrEcvidr1NorizUguUPubvhbBVsEZZecJtj99Jne1Fs
	ou6Icqc6s5CaeDKVOIDriUS/WGKJshr2rA2ThPTmve1z+pnwUYMzuSS2ticDKwcV+sLxpM
	5os0Jr81fnnT2w2vJdM/GjjDcNyvM6UVa4CmV+6E2MSoErpZotr0+IHqBWTdKx9yHFp4HF
	+F45UlOR3E4YtXrjUAQyU0WknArfNntTkKSpt2YL+Gs5LeK3ez/trN6o7j1Nnjrg7CExKO
	lOWmUkS8r2AUcKIWzkf0ZRjr21cNI6RvLCsufENTg7Y6SzPl9NWExamVXAU70A==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788353710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RnLJ9lWFDFYGAcAUAvszeV0gIPvWJfhdBr2yKVqkags=;
	b=Tb8LAlJynT3up3BdoGKV1dVPntTJVpYTXFmYNASjaDxqt23cULDwUAOaHDvLzPbQe9GUVU
	vg+dqFfZOya2VhQsosbU6AbCX0L85g8aB4vuieN4rroDvt31ostGwNcx9fZ9ut2nmfesHA
	wCD5l4MUQGl6LgRCj6fyJCXGweFVzBGWX5kV+YkkhRS83NW8MGh5IhGc3WmL7Acf6fAYtv
	ZDb0wnCtTKe4yNN6WkVBR9Ap34vYTheVnhSYpx+AQ/mGHgjjSpoLuUHBiFisGCm6L+6uRd
	eYtQuDbFze/K/c9bQD7TY+k3VG8Q+1XLdko+YOPCH6STA0aoL4KAex0pYc7m8A==
To: Phillip Potter <phil@philpotter.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cdrom: fix brackets
Date: Wed,  2 Sep 2026 14:54:30 +0200
Message-ID: <20260902125431.696887-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 31zkymtngd1jxmm4fksdtshts488h8uj
X-MBO-RS-ID: 587556d542be33bf042

From: Manuel Ebner <manuelebner@mailbox.org>

Fix missing ')' and add '()' to function.

Fixes: e327cfcb2542 ("docs: cdrom-standard.tex: convert from LaTeX to ReST")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/cdrom/cdrom-standard.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/cdrom/cdrom-standard.rst b/Documentation/cdrom/cdrom-standard.rst
index b97a4e9b9bd3..b6dde1d1eaaa 100644
--- a/Documentation/cdrom/cdrom-standard.rst
+++ b/Documentation/cdrom/cdrom-standard.rst
@@ -1014,7 +1014,7 @@ How to update your driver
   just calls to the routines you adapted in the previous step.
 - You may remove all remaining memory checking code in the
   *audio_ioctl()* function that deals with audio commands (these are
-  listed in the second part of cdrom_ioctl_. There is no
+  listed in the second part of cdrom_ioctl()). There is no
   need for memory allocation either, so most *case*s in the *switch*
   statement look similar to::
 
-- 
2.54.0

