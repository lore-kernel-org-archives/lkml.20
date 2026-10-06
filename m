Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35463B71B3;
	Tue,  6 Oct 2026 18:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311784; cv=none; b=EaL9ts9Z1PBIakLcWbxKQKXai6XzshvEhG4S9yeCMpClJjOyNjMHuYKirrVj6nEZqSihCNSO4xxamSPtC/uzKqzdjgG2NDtbetOMfAqD70VfWkE2jBjHjnKS5jtxWc8k+rBvEy8VqwXCJfvj7AB5Jg3lnx6yIsYaNWjQu8qCzmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311784; c=relaxed/simple;
	bh=2GM8TEv8McI2+PRk3oG83nTLrFB6aiAxdh5+TsWF4oQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n1teAdtet+r540vSrP1CHd30usuIzXv2oC4G36nL/qFJLN0fXvPIjm7KxFoCWoEZuR18BtEXHL+iMoBER1Tq+s0xIWtw3gFG/zlxRYuvgALuMrbB8oKanxRSYvTuXlmExrMbOBhwMo6j+sdHFfJ4x80EpxujklhGOciPt4mUbAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=kF5BEVw2; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="kF5BEVw2"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id D4F523D81665;
	Tue,  6 Oct 2026 14:36:15 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 5Z34JawlgyAj; Tue,  6 Oct 2026 14:36:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 08DBB3D81826;
	Tue,  6 Oct 2026 14:36:15 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 08DBB3D81826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1791311775; bh=a9RPQL6d8AbfrHO3aTH2bTI5fw1IZlpNrG5pUuZwUqU=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=kF5BEVw2gVngOMRucBIa+mLhtFeriyYgNlHUJcPN3FSZm7w89Xqo/SCJ1XNvNJz6y
	 rPCYEpnXZCzXNiX+AKDpWSj0px1wBNwbhvfqWO5VzM6PTF5RDykT9wxesWFrYbIzpH
	 XWEvwBCyIakIiLgx03rKNGU5g6AAfXq+qe/TBiKzoJn34Jctb57+RQ38jHvGpuJBcu
	 WBeIxwfbGSFt74iCBlYX9HCID5ubcjDehcQdSoUk6gOrXCl0xiZWRra/TcQXdYx74R
	 gql/KPaJbh2bhWgiyIsoGp6k3yux5Pb3fM0XSiu6dq72/6zFw7M894lJeDpBfxBDne
	 Pt+vuhOUV5X2A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id RrlqKPBuLamJ; Tue,  6 Oct 2026 14:36:14 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 976283D81665;
	Tue,  6 Oct 2026 14:36:14 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH 0/2] drm/panel: ilitek-ili9881c: add support for DCLTek DT300249
Date: Tue,  6 Oct 2026 14:34:53 -0400
Message-Id: <20261006183455.2350966-1-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series adds support for the DCLTek DT300249 5.5-inch MIPI DSI
panel based on the Ilitek ILI9881C controller.

It documents the new compatible string in the binding and adds the
panel descriptor with its initialization sequence to the driver.

Marc-Olivier Champagne (2):
  dt-bindings: display: panel: add compatible for DCLTek 300249 5.5in
    panel
  drm/panel: ilitek-ili9881c: Add DCLTek 300249 5.5in display

 .../display/panel/ilitek,ili9881c.yaml        |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 216 ++++++++++++++++++
 2 files changed, 217 insertions(+)


base-commit: 54e61ea6c492d69a1717018826d8340810c812eb
--=20
2.34.1

