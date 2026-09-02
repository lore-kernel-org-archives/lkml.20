Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BDD44BCB4;
	Wed,  2 Sep 2026 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345204; cv=none; b=BHWvOdJjpD+eaOEan2GMgNiDsBrQGc6QPQwGMVIV500/BldzATJrSdsK1usqvRbx98mdLTQJLesujFpWxmBVN2mV7a7ikX790tL1nWhkid+FarOdANwjevCR86wejJzvCe22mLO+DnNRHso69KZtMmKewoPafgD8JvvRHOWXDG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345204; c=relaxed/simple;
	bh=LUPpTVjhMNATNoYjJtAFomng1v0vtAZCGx4TP0Mtof0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hj5hovuReEDpDlOAwJOP9Ux9QTJZ5Pc9TEaCGxWJWA2G08raqgTqJ7NUXc/omYSyeM6JkndfSqilbCbh9+TL5pvNUvcfky6KBa2e3dGqf02SE+fR5KMYoaagG3APesl1nyn9TNtud6jq5u/sTspRFD8HqSvXHT3q+AxCWKmpZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YkTwWnqs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YkTwWnqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788345195;
	bh=LUPpTVjhMNATNoYjJtAFomng1v0vtAZCGx4TP0Mtof0=;
	h=From:Subject:Date:To:Cc:From;
	b=YkTwWnqsUSbd0miUwhniml4yLo4ffmUqWmc9kfUXdghL/6NwjgI/bOKPRbcfSt3IS
	 5/OsHOzDZLF00CxInHn4B5ufrXQqmZmEwsNIZr32pC4j6w0qs0ZLPHrBbeMt1tXVEa
	 tUNWyOLsnnP7RrKG1Aropp9g4noTjengxWpWieZVQW6ZEvZ2GDkUnYBI8tT7RskOwp
	 ZoY8H6GZAU8sT2xMk6WFB/fMpDW/xNYPwcD4IsftqMDi4lYIG9fc6YCBn4wI3G9pFr
	 mE+CRkf5qYE6ib8KtMFOebvdXHHc5TnoOyXLeASg1ADY2lP2ajN3u/0FJFR6kjuRq6
	 bVNqDBmzJoQPQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B02D217E075D;
	Wed, 02 Sep 2026 12:33:14 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Subject: [PATCH 0/3] arm64: dts: mediatek: UFS cleanup adaptation
Date: Wed, 02 Sep 2026 12:32:43 +0200
Message-Id: <20260902-mediatek-ufs-cleanup-dts-v1-0-7876e7a27a9d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WNUQuCMBRG/4rsuRubiUuJ6H+ED9ftWiOdtk0Rx
 P/eUqLH88F3zsI8OUOelcnCHE3Gm95GEIeEqSfaB4HRkVnK05wXXEBH2mCgF4yNB9US2nEAHTz
 kKBuJJxJpkbJ4Hxw1Zt7U92pnR+8xFsI+sho9geq7zoQysTQH+FW+/468x61fJpd/PpxFkW/xS
 QjgoGvNuZQ8ywp+U33bYt07PEbtlVXr+gF4Y99V4QAAAA==
X-Change-ID: 20260901-mediatek-ufs-cleanup-dts-6a7f7a3e1292
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788345194; l=3287;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=LUPpTVjhMNATNoYjJtAFomng1v0vtAZCGx4TP0Mtof0=;
 b=3WUuxfHbNCUGxdqf238kQoAsPiBTcuvipCkrWVesJthvcdrdxp7b1Li35pS5Y0Kdo/e5Gqqnd
 50bpxAn30AuAe7wr5qFfkHRE3nemU9gikfaOjNWhAFy0qpi1Xxj/Vta
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=

This series goal is to adapt the Mediatek UFS dt-bindings changes
done by "MediaTek UFS Cleanup and MT8196 Enablement" series ([1])

The patches were present in the v10 revision of the series ([2])
but it was requested to be sent in a separate series. The first patch
was also modified to add a valid OPP table rather than simply dropping
the freq-table-hz array to fix an issue detected on this patch by
Sashiko ([3]) during [2] review.

The series is based on linux-next kernel tree (tag: next-20260901) and
depend on [1] with v11 or later.

[1]: https://lore.kernel.org/linux-mediatek/20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com/
[2]: https://lore.kernel.org/linux-mediatek/20260730-mt8196-ufs-v10-0-bc5ecef202dc@collabora.com/
[3]: https://sashiko.dev/#/message/20260730-mt8196-ufs-v10-24-bc5ecef202dc%40collabora.com

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Louis-Alexis Eyraud (3):
      arm64: dts: mediatek: mt8195: Align ufshci node to dt-bindings changes
      arm64: dts: mediatek: mt8395-genio-1200-evk-ufs: Complete UFS power supplies
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Complete UFS power supplies

 arch/arm64/boot/dts/mediatek/mt8195.dtsi           | 35 +++++++++++++++-------
 .../dts/mediatek/mt8395-genio-1200-evk-ufs.dts     |  3 ++
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  3 ++
 3 files changed, 30 insertions(+), 11 deletions(-)
---
base-commit: a7957fd910b93155d81edcdd4472551764c8957a
change-id: 20260901-mediatek-ufs-cleanup-dts-6a7f7a3e1292
prerequisite-message-id: <20260901-mt8196-ufs-v11-0-dbd007704490@collabora.com>
prerequisite-patch-id: 841e7d21c8ca7e3f35741279672e23c84db3d165
prerequisite-patch-id: 44f254cfdbb97cdf19ab4c2ab8126a95d6e2b050
prerequisite-patch-id: 5176591d5737581d21ff2d045e8f16c30fb8a39f
prerequisite-patch-id: 54d073543d7687cdc9cea3d91025b2bae3cc8e8f
prerequisite-patch-id: 3c082f576efeaaecae285d6ba734463b39f2a9df
prerequisite-patch-id: abe5e24769fbb4dd6399bb9ac3a6c7c8567fe6ce
prerequisite-patch-id: 1e16da816ec429b5261e5c2145ed11646acec4b7
prerequisite-patch-id: 89e0e053a67aba4c8897110ba32c9ee64acf7dff
prerequisite-patch-id: c968b5646b227ceb339883450a5bba635033cac3
prerequisite-patch-id: a193861af215b41231ff22aac96e3f230881d896
prerequisite-patch-id: 47fd54e3799a18734587ce17776f75c823ca6e23
prerequisite-patch-id: 7bce272ba16fd694baa7e75c3612c48b64b70ed0
prerequisite-patch-id: 2623e1613e37cf92a13f5912053f216897d44e37
prerequisite-patch-id: a27017f12729000629e7397677468ec43d56b488
prerequisite-patch-id: 90be5a4db503b293b6e2aaa11b6626764f74c600
prerequisite-patch-id: 17987efb08b3f7882577822709ddf1b4b0a47f17
prerequisite-patch-id: 3a4a3de5953f1aa5adbe9d4d919d79360408bfcb
prerequisite-patch-id: 8c0177924a6a5ced7d097d1069de693a29bcd7fc
prerequisite-patch-id: 41a2390410768e2331b07b9806ccb7509828e2e5
prerequisite-patch-id: 847e46df5bbd0539b1324d628f601122728e025c
prerequisite-patch-id: e97641f63406d43924af801293e5d24ecd440ba8
prerequisite-patch-id: ce5a76f40d591a54631fc4caebf97bfe49d57ef8
prerequisite-patch-id: 74648a530be0081338cad49722eda0839c363455
prerequisite-patch-id: 44bcb8920c4cb56811943d0d51bf0de9fd363ac7

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

