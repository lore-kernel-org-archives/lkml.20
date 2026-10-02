Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA70E47252A;
	Fri,  2 Oct 2026 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790933737; cv=none; b=IPF8pd63d9zC2rrloiao8SUd6cWaKQS3KHTNPdPZmlsOrRnBVWsc0lyEtmowFHik2t/8IZti0dI7ESIyIMF3KmiV7mTN4no+I6XHH0mGAINauZWAUVFtQ5Tk+XsTLpI092mh5eN2ytQu2NsS+byGVDISrPz+x6SqsiFXoKbiIVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790933737; c=relaxed/simple;
	bh=LpYvzdoI+v3hP2QfjXBG+s6avTxCp0utyl7YsTTTCBQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SFqU6Zw2RJihcFu3G21mIW8PfbX5OfHve2q9onuYpHhkyVSiYV94z/kNEw+7y925MvaVDBiP5ErqpgPnJrFiaulbulmyWbVPGrbQ2/NK3F6H+6CMyZwiS7+XJBGn3xAFzs/WUlXNUUaMLf9DoZL1B49N5mUmfK3MqVAYHBttqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=kcXQcjSP; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="kcXQcjSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790933718; x=1791192918;
	bh=O1HxbaRc8z3eMAf1ryP97Ibc+/kv+GDzTxEzG30WsQw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kcXQcjSPEwpzLDlR6bVUHUZJkEUbv1XIu4HbJlwm8TiXj5Pk5dq7+svhMpAWxJMNA
	 KEVlDORu33BNKut4RU1EG6m7zR+t129KCigJQ5DD8cEv6KMT0r6bq1bRLb0j++TG2w
	 rem0jLjtvZNbHp6WDVopHU4dlEMTwqWaPI7aLjqDKlLr4HDmiCmlj4tdSy0eH/tyY/
	 VXCBPACOa77f23qsjiGM5TwfS96WidA2+34aDtOpZbZiYrV09WDLYngfMjlvReYHjb
	 YjGWCGVhS10vXwsL3fZoSGBeSk1i0cbLb3IgYVwKDxBGg8judugmNagKOVioqYX7qe
	 8HMTtF0hSCCng==
Date: Fri, 02 Oct 2026 09:35:14 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: ov13858: cap analogue gain at 15.5x
Message-ID: <20261002093507.43584-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 00f8d8cb4d36879944596efd0be92ed5a98371d6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The analogue gain control is advertised up to 0x1fff, but the gain only
follows it up to 0x7c0. Measured on raw Bayer at fixed exposure, on a
Surface Pro 11:

  register   requested   measured
      1984       15.5x      14.23x
      2047      15.99x      13.71x
      2048         16x       7.54x
      8191         64x      14.28x

At 0x800 the gain halves, and above it the gain repeats values from below
0x800, so an auto exposure loop that raises the gain can get less signal
back. Cap the control at 0x7c0, as ov13b10 and ov08x40 do.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
v2:
 - Commit message shortened.
 - Assisted-by added, per Documentation/process/coding-assistants.rst.

The code is v1's, byte for byte. Tested on a Surface Pro 11 with
libcamera's software ISP: image quality is unchanged, since 0x7c0 and
0x1fff reach about the same gain.

v1: https://lore.kernel.org/all/20260831180746.68878-1-lsa.uz@pm.me/

 drivers/media/i2c/ov13858.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index de2b79a9a0e..27273d589cb 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -63,7 +63,7 @@
 /* Analog gain control */
 #define OV13858_REG_ANALOG_GAIN=09=090x3508
 #define OV13858_ANA_GAIN_MIN=09=090
-#define OV13858_ANA_GAIN_MAX=09=090x1fff
+#define OV13858_ANA_GAIN_MAX=09=090x07c0
 #define OV13858_ANA_GAIN_STEP=09=091
 #define OV13858_ANA_GAIN_DEFAULT=090x80
=20
--=20
2.54.0 (Apple Git-157)


