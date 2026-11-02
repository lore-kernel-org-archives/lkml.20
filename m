Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598952;
	b=FP10/X3V/HCKo0cjG1MUDXShhwPb8eu/7TxWk6Ly9zKrm87Gv/57LmGOWMlJbUfCTpn8
	 DTNTkHSPKPwjL80+aE7rg8QH3tJn/ACxLaanT/TJUs/4RS+pklV844cSV0PfSA7R+Lo5L
	 Qd2tVbxKfR2qFbqQ3iFRMT2K+n19tWOq5W6ITTiHJPZ6B6zlPy9585uHI/EqyxIaVcW+H
	 5chySVfIztPTHJ+hxrdBmCg8d3ZVYZc9hzp6VjAPk+xgTkgylSCcR0WT2TRyvXIX0UNG5
	 4HAl/1QftscEOFQ3GGVzE7oxeB7q4+JJv8uRVkt8ya0kuDHyJAZP3uChvFP0N61oloQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598952;
	h=DMARC-Filter:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ciM2I2wkZl1oX4w78OPb/19iInwr0wlYqa6jXlljPx4=;
	b=Tw0fD2veV89mVPlszNEmXrsO6H/UJkIQ9KIhSkZ+kAx8/3x35AVxPp73D95S6+LQi+Lc
	 cm3tKHXrVTF/hn9oKFASkggbhUPdTXoY9HnnKwTrOR4za1vDunuwYHBSeMYFDUsF/2J0n
	 +C+yb7+L+J/jeJ2/zcaf5qajLTGO77dj/D/ekmA+2CDnvBr/Ro7PGuCqs+hDJj+aDawVI
	 Dy+RUsWLWIrBnbqtm9/kN603yuFUbSa5vyTht0AvQRMQn2DMNY/FRJDMcO+onHjp+B1qH
	 MUFGKxdFI+HPbm4m0tx4ZY4kpnYoqT70RXfl+/iweqoE/3C/8g7Xz2Wa0mHzeJJIVXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=weissschuh.net;
	spf=pass smtp.mailfrom=weissschuh.net;
	dkim=pass header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=C+1dM5Dv;
	arc=none smtp.remote-ip=159.69.126.157
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90412606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90412606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=C+1dM5Dv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1793598949;
	bh=R1Aw+Fy3JMYyoQOxO1Y5V6KYH8YwadiOJeU5pn39VjE=;
	h=From:Date:Subject:To:Cc:From;
	b=C+1dM5Dv6U9ffvfXwL9sxeM9ePULzJUV+CFK0x3AptPeCalTKuTFMvRJyd79Oz4Pf
	 WstXVKN1QbV1Kd30HxD1gV5FIGfrhd3B3KQ4SXKJPIl6/8yQN7PuXtx5il2aN3OuK0
	 tjDuXQBmkhdpqZoQcCNJkJBZnq6VpMRVra7nV+/w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Nov 2026 03:19:59 +0000
Subject: [PATCH] selftests/nolibc: don't download GCC toolchain for
 clang-only architectures
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-nolibc-gcc-download-v1-1-17704b116c83@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDtgAhr0KuIiTkYdkUSSagvi3
 Y3t8i3+PyFxFE7QFidEPiRJ8BnqVQDN1k+M4rJBl7pWqtTowyoD4USELnz8GqxDQ0a7sTJNrSz
 kcos8yvd37fq/0z4sTO9nBdd1AyV218l3AAAA
X-Change-ID: 20261102-nolibc-gcc-download-7c72df57961a
To: Willy Tarreau <w@1wt.eu>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793589603; l=1100;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=R1Aw+Fy3JMYyoQOxO1Y5V6KYH8YwadiOJeU5pn39VjE=;
 b=6+A2SK9fborNV8RyIiuhzb8dc5Rv7x7kQ6z9ueNkvLfcYhZcz0y/U0lNSKcH4iqrMJ6FIlcNn
 VhSrrtjo0B7Ai4TPsYingWof2095WdpUkZ/J/vZZrOsC4B7fQNwsTxB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If no GCC toolchain exists the download will fail.

Fixes: 4b4f56583850 ("selftests/nolibc: prepare for clang-only architectures")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/nolibc/run-tests.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/nolibc/run-tests.sh b/tools/testing/selftests/nolibc/run-tests.sh
index 2844fed26df1..cc91b8656b20 100755
--- a/tools/testing/selftests/nolibc/run-tests.sh
+++ b/tools/testing/selftests/nolibc/run-tests.sh
@@ -144,6 +144,9 @@ need_gcc() {
 download_crosstool() {
 	arch="$(crosstool_arch "$1")"
 	abi="$(crosstool_abi "$1")"
+	gcc="$(need_gcc "$1")"
+
+	[ -z "$gcc" ] && return
 
 	archive_name="${hostarch}-gcc-${crosstool_version}-nolibc-${arch}-${abi}.tar.gz"
 	url="https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/${hostarch}/${crosstool_version}/${archive_name}"

---
base-commit: 228a318052869ab08f01f53b5cedfae0e930f6dd
change-id: 20261102-nolibc-gcc-download-7c72df57961a

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

