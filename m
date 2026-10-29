Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793313226;
	b=i530asXJak2ryTeJ6JtLGI0Bzu59Gb/ZcElBsVSpytwB/w7VrJLaIPH2poCvP9HsJNGX
	 MA4D/KgFjNSJbUFRC/3a0IcTZeZ6dWllOxGLBxCc9p7SRkN8lE4LEpBcwLQpeoPb8RmBt
	 tMTnSXkd8KMgrhgSxa0h7rsIGzAtcLT4NNCgqc0dGm17Z8zmDsaL/3R8PXuz0hJnpUSez
	 ePzYkpdOGxt9R7XfVpLCAlJ61NiByJ/lNNnwZbWM740ARownctvMK7BVcgwmsY58lrG9l
	 1I5EqDYbtwbZ4lrdb8BxW1RcQoHDbW9vD+0vSRr/xYGTnhoj6uu0HaTBwFHdwacCFRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793313226;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=/DDRfMOuTRtg2YLg5xA4AAUbkoVMF1o1B6Hot0iCio8=;
	b=0wXzymDy40yAOg8mxHnaqQizXofu/BR0iBbfn6zhAaG1zZ1Qf81/hw7YrCGR8VPVeYCO
	 mau0f6NXYfdpOFbYX3gxfNpGKcL8NS6ZB+YqTluWze4fB8r7eMd0dop6ffm5MNgXn5Zf2
	 7JvDBYKHFI1ukx6klbqFzv1J3/Pp9WkIa7u07Aylr+pqqgKqyYbfG87kUdeLjPWQaiIRk
	 px1wGGguV4cSJVDv5jOVDt7Fqd23+SVKa/AV/fHc1u9A0v1/nR0Rg5+96IPgVsKj8cLWO
	 DyRS/jBRcUiohlHsf8X/lQQJsteTXzs7cPpzQDSJ2dyYfdzE7V6kvfqPvI5rA1Rn/0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=X5sbn4ej;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B18C606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B18C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=X5sbn4ej
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793313223; x=1793572423;
	bh=/DDRfMOuTRtg2YLg5xA4AAUbkoVMF1o1B6Hot0iCio8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=X5sbn4ejMUk4B+gqBfQqaJnCLJ59zkwA49LPVrhAkD77l9ov9Bq+MSaUhHCZAuzdU
	 jbPyt9p6XNJq3K6GD5UdwrpX+19gOSD+kTUWYMEoGbQXZGOLXt6Fd6VROHlFRPi7qo
	 Gxo0qyEQJpCXnJwhvYTO0aMZgLyj2nheKC0cuMjcHVkg5lDSM1FntJefpcE2yx9zbG
	 h+yAmp4TDVZu827ys98cIi9BLdtgDazPnKNd8GLDYfdc+QKumz+0uWIianS7WVLJZH
	 7W7J8zIolcuY9/r5vc+ZH8qs0YuhBF6vZhn6ZzY+02iOEL0l+yFAb4hGRPFF+6z2fh
	 lU6rr5cVBWu4w==
Date: Thu, 29 Oct 2026 22:33:40 +0000
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/5] Enable some more hardware on the Nothing Phone (3a)
Message-ID: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1b879897af5045c17c9f979b0612e79e8a687d23
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series enables UFS, Bluetooth, Wi-Fi, IPA, and the display panel
for the Nothing Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (5):
      arm64: dts: qcom: milos-nothing-asteroids: Enable UFS
      arm64: dts: qcom: milos-nothing-asteroids: Enable Bluetooth
      arm64: dts: qcom: milos-nothing-asteroids: Enable WiFi
      arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
      arm64: dts: qcom: milos-nothing-asteroids: Enable panel

 .../boot/dts/qcom/milos-nothing-asteroids.dts      | 314 +++++++++++++++++=
++++
 1 file changed, 314 insertions(+)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261029-asteroids-dts-updates-ce3d00b4f844

Best regards,
-- =20
Alexander Koskovich <akoskovich@pm.me>


