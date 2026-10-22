Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792646835;
	b=e8FfZg8Hbv3CJqjgqg/9hCs1x5I98gxTIVP/s+nRjsKG++2FNGjLyu93s9ipQ4ZVhD9/
	 EeJIfjtmneLymvRDxIMKOLzO+r9VCH4Xce8RMnUgqV6U4s9JDlbHnGVTB7LT+12IhTPgA
	 +OSkiMhW3ZKeCPY0GsQ1IvHh3/FG6yeAVHYQwPH41Opshw5JpoHlOtbliEgzU13FJ/9ZR
	 H5psYAIjuiWrLdMN00YQTlt3uGB4fMSs/pc0IAU+fR5tQ4VODe3Ppci8/TXOT4+1V/Dis
	 /rTewyBj1dVQpawn7lAIhBch83JF8OrVbhvHWJnvp4DEaNsz/HYdSeMQlcsIUqfxY+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646835;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aJhSp5FQgDQDLiRKd4qpwkqXiFacPMHlJzlZVfDeqvg=;
	b=nQDuvsKkLzrg0grwKoPW/alRThvldL85uvvY2h3B5LO33ZRBjPhMHlZoFE2YpoggMoIX
	 /M3wnSslnXa+hTX/J0Oj5+KnGyD0yffBxEbO6zQoYxn+VyJ1sXmYvta9jJYCD/IRVIzDV
	 M6T9e6JQHs3s4Tp/r0owlpBVWSbp7yTzxL3qNoXiTUZqg9XWPK8X0Gv5+4NSpkiiJOYlW
	 aJmXJ/Htg7IkvKn2K3wVB50H2sAJqF1520T5M3dqmRQGslydBaxh3v2r05bUx/JMtHFHX
	 sYMkvtaMMD7dcvBXlRMT6pYBfqZQhLc5dms7Db+2qNUEuurqAzap1MTyRD9kNx/G/JQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=erOZXdar;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38756606A31A;
	Thu, 22 Oct 2026 05:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=erOZXdar
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792646834;
	b=14SjCSBg2m+a6emjQ5IiA/PfRQvTEAcwPIVDQUhQp5DbEjdAKW/MR2loxysd3nMPhera
	 +Zae5x0VE4NGWiZOJxH5B/QTWfLZAcRmf8kKcZa/QrHAQNE4f5G3aT50b+i+0eRAUhVfM
	 2xZDzk4DXtcY9WecjfcCbNrYtrb7C/vm5RsQgFPdGY4TpORHVivptvxHsXSv7evjII7Xy
	 2fFoMa3zH+odUYRoxMocJqylm+i8FATZEPPTbIfHTtY8rEDDL0P85uaruR6KCl5/drWuo
	 dXtKDtTYZZ4w40e0YlEvfSo+AUqJhAWAK0cMAzpxuOZc48sDzVS+wvT0tsmeGj+/VgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792646834;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aJhSp5FQgDQDLiRKd4qpwkqXiFacPMHlJzlZVfDeqvg=;
	b=pj1Mdue1krE6TPI6PXIKtiz91+sEubM5lu6sbP+zLSovP+FQX0bUp8qISb6lRjGsI6Vq
	 R4LCkSqSl6re4boMk9HZexsbvBabQH4/f07gP7XKRmVpQkZQb/BX54Hr/SaajFYdz7Nww
	 FyLkJJSpdX+iUXkptgkNgwX2se8ieQylwW7V+OL63Dlk642zx5vzMZNzQTGmvVRCMZnzH
	 ja0c2FFqgV/Ihm2Zs3GzhUT9XAKAafoEfTKDWHISj22mOA29g6hCla5Bg4AHYuY31zZMV
	 I76QJbHy14mhEb8fyEBqyx11niKBAlo9FdYwNeiFH4wLd7CIGUcoHgpOFEuqGfjRzEw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB18C1F000C2;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792646834;
	bh=aJhSp5FQgDQDLiRKd4qpwkqXiFacPMHlJzlZVfDeqvg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=erOZXdarjU7UXewRLGyVa4HXBWWvFOTUgo7HPqkDVfD6XYKvCV1X8KBypfUbda/lF
	 sQtRildmZqpudgHYF3oLRV/xIE0lFNMQ6FRHeHu9qzcxQ66lyaZCypXz6sg+aoi7nd
	 j5cLtJ05Vfb9NLNxK1JGaZJjbJXqTao94R0Cf3TGzIlR6uRS/M6S1NchQ4mQUzY+H6
	 XxQ20RmgcHZNhaVUmzJWvkIopV9PfOg69WBlaNQYS3zHDC+UMSVlXk/WucZSYrmhgq
	 Bws78IcFuOiofiOXwZA9xksDU6pgQFYpfP58Fwtky0JB+Z5XfqUDvknqIDXDhxU11L
	 xB6MsAFsnC0/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 48493434E5;
	Thu, 22 Oct 2026 05:27:13 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Thu, 22 Oct 2026 13:27:00 +0800
Subject: [PATCH v12 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
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
Message-Id: <20261022-b4-s4-vdec-upstream-v12-2-616240978792@amlogic.com>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
In-Reply-To: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792646831; l=711;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=wZ/Fw+jH+tOBVIXbBc8zSjH7Kx36sATJ09qPRAeyKKk=;
 b=W+y4VY/oZ+d/v2st9z7kzOz8+zDimrATVD4uEFbPvPFcmKfAdJL+iPdXjmOr4VKVIwdS/Lf5+
 ORYnYIWBfJKAmpkXJSHaI4FBTDE62ksaJrcEDB2XOXbVvCWStqunkfH
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
Content-Transfer-Encoding: 7bit

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..887caa5c625d 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -48,6 +48,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
 		CMD(SM_A1_PWRC_SET,		0x82000093),
 		CMD(SM_A1_PWRC_GET,		0x82000095),
+		CMD(SM_LOAD_VIDEO_FW,		0xb200000f),
 		{ /* sentinel */ },
 	},
 };

-- 
2.42.0


