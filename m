Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794248578;
	b=IhEwiSYp4vdpQiqSPMDcAEaDXOUvf8kalfC+y64bLjcZVThEAlP5X/7Jr9nHbT8rJjiR
	 CxAarJGEpMJs2YPz8m81oeS0yDuzulPOyGe2WiJCUC5GcgsUyrlKAvFdNxZWxT5587M7E
	 cqE2PGRRP05MdyoCm6JBjbGlBUttEIGEmtlCTEZITwRy769OuzZu8lPAz097BIb5gR4Ja
	 5AjyultQ/XZnbrwbvs2VTeGL1rZh5dbk13O+vmsPJl3pyME3vHW4itiLWkMcJEVQ9+TSA
	 leBbn7WvmHy/36+eMiAlteaP2zwkiV7JGX/Gzg/jrDDPi73oBylwqvs8svZ7IZs/lDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248578;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uZu7fiMnXKTWVc6zzvXagJPskitiQrL3yrjioSUHgP8=;
	b=fITL6rK7wh5EkLeLhOL6MhEwQQyhtma6tBiRvhR3j6i3ifqMLEhRp5Ws75/at/aDooUS
	 wE9jeWqa0VQ8veUt8zpe1iwwkib71NWvR2sKBflM+W61Rk4iJFbL+rGfdZhImS3/frkVX
	 o+hj1lJKWqkVwOfnH1D1fnAC1n6GTNiSdNnHsm874R0UYYqB9kJKtYF4LS6tdabS/lM6z
	 fYaKFjmHZ2MJUCtbWXkS2JWbLWlEBW+gKeAtBUJh2o93YV98XoRXdSDpAWoIRbufqUEOi
	 WYsQ/VHACCmmkG+69zekbOvKzn7GiQzz80g1WFvCa2+o5410Rck58ASj410jsyb4ugw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKsyUyPZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29871606A326;
	Mon,  9 Nov 2026 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKsyUyPZ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794248578;
	b=OGvu1DxVDavXA/SPMeWRC7S2CPcyR9EBcu/YEIAN6/vV1zd1+Dp7+0CjPfX9ydWHvsBr
	 Fvj6Ahjy23LkMAcU86fbPUxLyw88e9FM2/keUQwiaeDpiKNbhsMcAcyYBQfWSVlwRrHvs
	 3+Os8GLS/79+guNQJwnE9C01nHHUOzByXhPQf166bM+9bpJ1Ji5mDYhJ5RPVfYeShzd6V
	 vVX16rBPAJJoKEbtihLk4/YinPNdXy4S+NWodtRtTdKtxYRQNEJnai07xa1b/Vdg5+hKC
	 A0nHxCXTPW8enKYdGgIShaggGSKzIOA9f1HE3YfipmEdTLY9y2mb5FlOBbkWBfbw4/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794248578;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=uZu7fiMnXKTWVc6zzvXagJPskitiQrL3yrjioSUHgP8=;
	b=k5v2VAveS9ZYPNrLXQEjXfYxzbPoTImJvRIXmWL33oM5jNAjjfNkLwMCRx8YWCpVuGOV
	 OBl2tDFB6hq1LuSDtvVKSpDqSNBemZFwyyveFe9xjLI3+bJSFmEENfsolBVzdoAJvKupK
	 5XLzqQUNam9J01WPOPAudI+mYHk1ZUiSTjBRVq+4pva+tVASdqT1NP4KF5eYwpVgEK7xI
	 dDCTECHflaMuNbiB3RDxGM9P+uSDv4CW0OH/jIXEiSBvCsUDE7sGkRXVqnu5P6AoB2hrE
	 Dsm8+m515UpNs97obUZ2/mZVr9p8N9IXOmOUIusiMWqIEGWYlx2FGMHUU5wE5CLLVQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6A70F1F008A3;
	Mon,  9 Nov 2026 18:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794248578;
	bh=uZu7fiMnXKTWVc6zzvXagJPskitiQrL3yrjioSUHgP8=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=dKsyUyPZ9bR8jj2mIJyrm4l0dDM2E+/0b5eN+nAf3Fq5y5ACT6QXfklPlaqK4j/do
	 hVJNNF1mBkl17lPvZ8MZ6wsW3p0gH1+V4rnBALdcNpOxHzatTLyRh46RWcHHYonWmW
	 SECRF+XWTU8JDy/c6V+8icWXEP3OL5yzs+nzyyxB0iWgZM6thjp/7PPwYHPcwVgK/e
	 2hwP6NOt0cVuPTbxppVxm6RxT0byi5xh36gdbaKf36jpCjpbrs2wkHAV9C+ox1NQXW
	 sbHCSiURumkAXqqkwCv5H0RhZIGxp/6926a5VVqE2gd1SkD0/pmJv3BFxs1CKXF1eD
	 1ks73jJNjr+NA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE573485B2;
	Mon,  9 Nov 2026 18:22:56 +0000 (UTC)
From: Brian Ellis via B4 Relay <devnull+brianellis.gotenna.com@kernel.org>
Date: Mon, 09 Nov 2026 11:22:57 -0700
Subject: [PATCH] usb: ulpi: warn when a PHY with no DT node cannot be read
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
Message-Id: <20261109-ulpi-warn-unidentified-phy-v1-1-64537f455dd8@gotenna.com>
X-B4-Tracking: v=1; b=H4sIAIAP8moC/x3MQQqDMBAF0KvIrDtgokjjVUoXYib6oYwhqbYi3
 t3g8m3eQVkSJFNfHZRkQ8aiBeZR0TgPOgnDF5OtbWdM7Xj9RPBvSMqrwot+ESCe47zzc3Stt9I
 2wTgqQUwS8L/z1/s8L9VeJTpsAAAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Ellis <brianellis@gotenna.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794248576; l=3957;
 i=brianellis@gotenna.com; s=20260910; h=from:subject:message-id;
 bh=sscEEhH87QAvvEcPEryzTnpnZF0PX9iRncrq3sU3Y20=;
 b=I0MGMqjf1Gn5H4rXazQv8NRzmLpcuqiZ3wLtwT42iSm5FxysSlfQwWyvi2OW+ugKOno8MBwjJ
 BHufruxBfMZCLMZ7zYgU4Ic1ZaK1wLoxoJClFuC36tS7PNFnu/pAAbE
X-Developer-Key: i=brianellis@gotenna.com; a=ed25519;
 pk=JciDR8ctfMqvKeRCDP8VPwNLUDULxCAqDum6H+/ByBY=
X-Endpoint-Received: by B4 Relay for brianellis@gotenna.com/20260910 with
 auth_id=1022
X-Original-From: Brian Ellis <brianellis@gotenna.com>
Reply-To: brianellis@gotenna.com
Content-Transfer-Encoding: 7bit

From: Brian Ellis <brianellis@gotenna.com>

ulpi_read_id() checks that the PHY's registers can be reached by writing
ULPI_SCRATCH and reading it back.  If the write fails or the value does
not come back, it falls back to OF matching and returns success, with
nothing logged and ulpi->id left at 0000:0000.

Commit ef6a7bcfb01c ("usb: ulpi: Support device discovery via DT") added
that fallback for PHYs described in DT, which may not be powered yet when
the ID is read.  For a PHY with no DT node it does nothing:
of_request_module() returns -ENODEV for a NULL node, and ulpi_match() can
only match a zero vendor ID through OF.  The PHY is never identified and
nothing says why, so code that keys off ulpi->id, such as dwc3's USB3340
detection, silently does not apply.

Commit 8a7b31d545d3 ("usb: ulpi: defer ulpi_register on ulpi_read_id
timeout") made the failed write an error for this reason.  It was
reverted by commit b659b613cea2 ("Revert "usb: ulpi: defer
ulpi_register on ulpi_read_id timeout"") because QEMU's Zynq machines,
where this write times out, then could not boot from USB.  So keep the
behaviour and only report it.

We hit this on a ZynqMP board whose USB3340 takes its PLL supply from
VBUS, so its ULPI clock only runs with a cable attached.  Booted without
one, the scratch write times out, the PHY reads as 0000:0000, and dwc3
never enables the USB3340 transceiver delay, all without a message.

Warn when register access fails and there is no DT node to fall back on.
PHYs described in DT, and PHYs whose registers work but report no vendor
ID, stay silent as before.

Signed-off-by: Brian Ellis <brianellis@gotenna.com>
---
How this was tested: the failure was observed on our board, on AMD's
6.6-based vendor kernel, where an earlier version of this patch warned on
every fallback and printed

  dwc3 fe200000.usb: ULPI id read failed or unavailable (0000:0000); relying on OF match

on a boot without a cable.  That version would also have warned for
DT-described PHYs and for PHYs with no vendor ID, which is why it was
narrowed to this one.  This version has not been run on hardware.  On
usb-next it is compile-tested only (x86_64 allmodconfig, W=1, no
warnings).

On QEMU's Zynq machines, where the scratch write times out (see
b659b613cea2), this prints one line at boot.  That is accurate there too:
the PHY is not identified.

Tool use: an LLM coding assistant (Claude) helped investigate this, wrote
the code change, and drafted this changelog and these notes.  The
observation above was made on our hardware.
---
 drivers/usb/common/ulpi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/common/ulpi.c b/drivers/usb/common/ulpi.c
index dec4baca1c..9d94d51726 100644
--- a/drivers/usb/common/ulpi.c
+++ b/drivers/usb/common/ulpi.c
@@ -209,14 +209,14 @@ static int ulpi_read_id(struct ulpi *ulpi)
 	/* Test the interface */
 	ret = ulpi_write(ulpi, ULPI_SCRATCH, 0xaa);
 	if (ret < 0)
-		goto err;
+		goto err_access;
 
 	ret = ulpi_read(ulpi, ULPI_SCRATCH);
 	if (ret < 0)
 		return ret;
 
 	if (ret != 0xaa)
-		goto err;
+		goto err_access;
 
 	ulpi->id.vendor = ulpi_read(ulpi, ULPI_VENDOR_ID_LOW);
 	ulpi->id.vendor |= ulpi_read(ulpi, ULPI_VENDOR_ID_HIGH) << 8;
@@ -230,6 +230,13 @@ static int ulpi_read_id(struct ulpi *ulpi)
 
 	request_module("ulpi:v%04xp%04x", ulpi->id.vendor, ulpi->id.product);
 	return 0;
+err_access:
+	/*
+	 * A PHY described in DT may not be powered yet and is matched via OF
+	 * instead.  Without a DT node nothing else can identify it, so say so.
+	 */
+	if (!ulpi->dev.of_node)
+		dev_warn(&ulpi->dev, "PHY registers not accessible, PHY not identified\n");
 err:
 	of_request_module(ulpi->dev.of_node);
 	return 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-ulpi-warn-unidentified-phy-8c94d2e43f19

Best regards,
-- 
Brian Ellis <brianellis@gotenna.com>


