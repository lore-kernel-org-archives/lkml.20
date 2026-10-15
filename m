Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC2640B11C;
	Thu, 15 Oct 2026 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792099510; cv=none; b=SQL1L8J4JS8COVNHngKLeo3/yIYqSUPRQEstPhjj+VnTbbwoLhUS0iuC0DI212+SMHYvS9dvShCFS8rqKrZE755uOVI2VLw6096j2eSlzCh5YenXyU9BEtejy8NhBOsXpqc1lPbuEhHaJGW4K4cyyK4Cb8kqQTQtVUkB8BiehZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792099510; c=relaxed/simple;
	bh=G4nqkJOii/sb8Gx48Kl0y0+8s9n+ILtszIr0sz0W3RU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aYfWjI1pEqt0FoO6SWiBCXP5cVc9SIOeKU7iOW2S0cyZ8JRQbR9gmGxuGxGBpNzlTIjjGiGJIagiAhXtut1ct0MgaITA7mqQ9eeJS6kUsnMONupagA/MCen4Hpjgzy5j4biaq9Xc4p6CeV9hsbPwaPp79KmbelVEXoo3QXOBFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=macm/rt0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="macm/rt0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8069C2BCC7;
	Thu, 15 Oct 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792099509;
	bh=G4nqkJOii/sb8Gx48Kl0y0+8s9n+ILtszIr0sz0W3RU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=macm/rt0lqdz30wSmfeNsFFAtcTxpPHIWfhC8bbtLDpbETqqUyuITb9dr/k4kNYLx
	 dkL9Nd3sOKQhf5Qjuwdl6QxFgWVvTyfFrbLc+HJWiQtLhDKhEZ+IfqaEnlqCdG2iU/
	 YhdXVjDPk7WPIwxdM1MgNvuAm7r8BX+ZUkFUGfJ36xmevhGcB69gvCh/f3SuJesr30
	 jlmN5oGxxtjbcAFZZ3o4YWUUCP4YZ7vEdkaMUJ4fMnVNEKf7p95ySXeElINlOg4HlI
	 oWTrTOQbe0UzU0VEpaIlQZ5iEQ/l/kgCiuScSjnZV+FWXVwx9P7qBsN8YmMh9LrR6R
	 cKdQSbUmOMVrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4190CCA464;
	Thu, 15 Oct 2026 21:25:09 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Subject: [PATCH RFC 0/2] media: imx681: C-PHY for the Surface Pro 11
 (Snapdragon)
Date: Thu, 15 Oct 2026 22:25:08 +0100
Message-Id: <20261015-imx681-x1e-v1-0-fd22f5f3b0c5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0NT3czcCjMLQ90Kw1RdC2PzlBSzJBNTU1MTJaCGgqLUtMwKsGHRSkF
 uzkqxtbUAkZ1H1GEAAAA=
X-Change-ID: 20261015-imx681-x1e-837dd6b45554
To: Sergey Lebedev <lsa.uz@pm.me>, 
 Andre Gilerson <andre.gilerson@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 German Pablo Lindo <germanpapulindez@gmail.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792099508; l=2483;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=G4nqkJOii/sb8Gx48Kl0y0+8s9n+ILtszIr0sz0W3RU=;
 b=s3lDmA184mSmymy0PfaWSgMMGJ+jPUrcdEU8ST0pZHRLwF0eis97B1ezMsm0vpXzSzub9Zw0j
 4I/dmDnAxlaBILMAWt4PPka9V41FLXp/5HNSExaTEyshr1KA1umWR7W
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

Hi Sergey, Andre,

The Snapdragon X Elite Surface Pro 11 (X1E80100) has the same IMX681 as its
user-facing camera, but wired to the Qualcomm CAMSS over one MIPI C-PHY
trio instead of two D-PHY lanes. These two patches, on top of your v8, are
all your driver needs for it: the endpoint picks the bus, and only the
signalling mode, the lane mode and the output PLL multiplier depend on it.
The mode, the video timing PLL and the 720 MHz pixel rate stay as they are;
Windows on the Snapdragon model programs the same video timing, and its
line and frame lengths come to 720 MHz at 30 fps as well, which agrees
with your measurement.

They apply on top of v8:
https://lore.kernel.org/all/20261002082537.74084-1-lsa.uz@pm.me/

Tested on the Surface Pro 11 (X1E80100) with an out-of-tree CAMSS that
receives C-PHY on CSIPHY2, capturing raw frames through CSID1 and an RDI
interface:
- probe with the endpoint on one C-PHY trio at a 1.2 GHz link frequency
  (2.4 Gsym/s, half the symbol rate by the V4L2 convention);
- 3844x2640 at 29.99 fps;
- the colour-bar test pattern arrives intact;
- a scene captures, and VBLANK still sets the frame rate (8.19 fps at
  9000 lines);
- the binding accepts one trio with bus-type 1 and two lanes without a
  bus-type, and rejects one D-PHY lane or two C-PHY trios.

Not tested: the D-PHY path on the Intel model. It now also writes
CSI_LANE_MODE = 1 (two lanes), which it did not write before. German, if
you have a moment to run v8 with these two on top, that would settle it.

How would you like to take this? I am happy for you to fold the two into
your next version, or to resend them as follow-ups once v8 is merged,
whichever is easier for you and for Sakari.

The board side, the device tree for the Surface Pro 11 cameras, depends on
Bryan's x1e80100 camera DT and CSI2 PHY series and on C-PHY support for
X1E in the PHY driver, so I will send it separately once those settle.

Thanks for the driver,
George

---
George Neacsu (2):
      dt-bindings: media: sony,imx681: Allow a C-PHY bus
      media: i2c: imx681: Add C-PHY support

 .../devicetree/bindings/media/i2c/sony,imx681.yaml | 26 +++++-
 drivers/media/i2c/imx681.c                         | 95 ++++++++++++++++------
 2 files changed, 93 insertions(+), 28 deletions(-)
---
base-commit: 07ec64fc237bfa815b380cc4e0c8b7d01ee11681
change-id: 20261015-imx681-x1e-837dd6b45554

Best regards,
-- 
George Neacsu <geocausa@gmail.com>


