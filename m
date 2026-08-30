Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E81514F8
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126082; cv=none; b=TVT4XJvtxWXDBRG05SuZjvCzL6Suik68ntX6xQ4/sdbEgz2sx4aNq/8cxlQsUOsRr26yIeOGBIMM46fqmYIdrR4Rf0vNtHcPAgVxfK60/cUYE4VKld3UbbCZQb3q0ksNGKMXY/DTj0lrLDz8h1ahR3XLIDfVdaFJerI053RnGng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126082; c=relaxed/simple;
	bh=jKz2OKgxvSZI/0BWbrps8HMe6WLp1un3inEvVRnvUjs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To; b=o7gSe78UM/nm2/WjpcbjH8eCIoZqaoqZJV2qRtbBR6iybCrM+/tZIqaDpTG3P9Z5RclX6WyAMDbvA7z0oLl0j4bH2oEmQh2X1B+EPIBBY/HGspNNfIVe3wI+jaSvs9kWixUHAD5VNy3XIe+ryuBm5ME6VKe/CUCjxLsR0FahuMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2pAh1E7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2pAh1E7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D30E1F000E9;
	Sun, 30 Aug 2026 21:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788126080;
	bh=C1+zDMG99bMt2xAaxS69HT/hrZ4u2XNu+7HKWqXy5Vs=;
	h=From:Subject:Date:To;
	b=K2pAh1E7wiGe2CxEaRT3Kag6M8nZiJ/IXdW4Yfg7we/dN0hNRWHDSIi2I7WJA02RT
	 0JCD8jTWEjT5sg5y4+bp1HG4VL8oSLL/XwdrEcrr5GwVp38uy+m6eUWOG3AYP56jD1
	 M0EglLdt+OxQgB7xYPLlt72KmEYoTKNX0K4gA6RgtOIc2pzcm4KwuHrfMiGHS6L/eF
	 NNzgAdJQuFbCp7qo5cQbXc9tAV/VqwPYNJL0tHp3IIDY1ktAkrwKJbTl1X/Hd52LYt
	 /n8qE+jCdwxpuMhsIE1JBf6HsM5PM2e5Tr9HTCCELe9vPAfsT9JpgX6sE9R+ivNTHF
	 bhXcsVB27tCIQ==
From: William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH 0/2] counter: Update MAINTAINERS for orphaned Counter
 drivers
Date: Sun, 30 Aug 2026 17:41:12 -0400
Message-Id: <20260830-orphan-counter-drivers-v1-0-3b10ab8b3876@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqFMBDFriKz/gNtRSleRVxofepsWpn6RRDvb
 nGZQHJThgoyddVNilOypFjA/ioK2xhXsMyFyRnXGl8bTroXzyH94wHlWeWEZvZ2cT5ghJ0aKvG
 uWOT6xv3wPC+jdySsaAAAAA==
X-Change-ID: 20260830-orphan-counter-drivers-81f28ceae1b5
To: linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=wbg@kernel.org;
 h=from:subject:message-id; bh=jKz2OKgxvSZI/0BWbrps8HMe6WLp1un3inEvVRnvUjs=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDFlTFjfITKuzvG7BVmDz/qPC9mDB60acleX7ZxR1LLKdZ
 PozomhLRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCR3gkMf+U2OOv/PvVgw/3X
 ffZvvmXY9G25vEb+J5cMk9yFN63xc6cyMrQd17LPj7DUf56zwPvEJwHFW97yAVu9b6vwzYhI/jN
 BmBkA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

The ftm-quaddec and microchip-tcb-capture drivers have been orphaned by
their maintainers. This patch series updates the MAINTAINERS entries for
these drivers to reflect their orphaned status.

Patrick Havelange, the listed maintainer of ftm-quaddec, has indicated a
desire to step down from the role of maintainer. Kamel Bouhara, the
listed maintainer of microchip-tcb-capture, has been unresponsive to
several pings for some time now, so I consider the driver's
maintainership currently abandoned.

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
William Breathitt Gray (2):
      MAINTAINERS: Mark microchip-tcb-capture driver as orphaned
      MAINTAINERS: Mark ftm-quaddec driver as orphaned

 MAINTAINERS | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
---
base-commit: 353b2e09f44a91e64c6b8117df46b6999c52e465
change-id: 20260830-orphan-counter-drivers-81f28ceae1b5

Best regards,
-- 
William Breathitt Gray <wbg@kernel.org>

