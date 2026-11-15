Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794781806;
	b=wY66bedCfB66ekCOA2CKqSaVecNEO4TjtzE9/G1izCJBWQZMOG/XkabhtFa3F+FCapR8
	 SVqhf8Nftx1ulAishpRcLoj66VUWho0ug+MkBpXax8UsTKOb7+J4cOjz7xCfi0v41xWk2
	 OJrBedaLB2ciH+I4S2eY2UP7ECiw1htUB9qr9Zjx0uKVUWolC7vyrCJ28lot5ghvnrJNu
	 DEKPROj8mG/0hfBqpsx9AgY6QSWHhVUGuZKdJGSrXX3DKMwJjkYVm17/hJYK1NG3qjsq+
	 JU304xRGgnEnOOCXNZhOIATat3Cs3dWtEjeE6+V/18CvvF8ssvtBcTaBrfrXJfUa3Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781806;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=wl+4Tz8A0GGe1CXQyGwndmidqOtappn2vfXIYFkPz9w=;
	b=RMqMNXgwWVNyUAqS+8UAV21DQDQFgSwQNtgYaGqgBdHfyObPy59EIcGzPDSEMptsAkfT
	 HyGKdfDZESMOjMKLlOvlYGAdsL3ITk6jjFVvlPWgexdfHxpge/wpXM8GP+73ViUaxz6pI
	 yURBTa/bh94FDaOAW+4ciLuh4uwiH2lUvHNY1UcvvMND/TuYvOZvcZNuu7ZG6WTzJQCtm
	 SxkIYGATpPtNeHZ606DAAfFKmYnOHgzAaQWo+atvS1JsG3FTP/jzIWTYVDo7d7uKsddbJ
	 zVFoVwE+7w+4nqoYM5KF2BTlTIZz7AjN/pgIOwuCRDi1osz+nADUmbc97vccLgsiERg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgi850dJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E43606A329;
	Sun, 15 Nov 2026 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dgi850dJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781806;
	b=EVVoVBBJtCskQoQYrIoq2UfMHL9WWm6qiZdEldl5Y3WEq4YohLwuCB6i1FNN4SM5OqbM
	 Q2WJZ4M0EfnQY7Ez1gv11FvOTIFVyu0rVVR758K3RaQZdQ/12QQ5VAvVWAH9H3wStc9IF
	 1bAXWKeLLPcpcZz0Uv3HZxgcvm2j4eakSmxA21CepbHaeKE56HFk6hI3KbJWZOL+CrV4N
	 vnDcFp/8lZuL4UYl9mtKLggqa8oLPulg6nA8rE0L8Dap976rH3rrGsL/cTPjfvm0X5mQ6
	 Hc9A3iFFfqK/2Bk/YpEl+EqqRg3hyg0qidKJlq9+Lz1l4/Igd19LGVYLemLX70gNDiQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781806;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=wl+4Tz8A0GGe1CXQyGwndmidqOtappn2vfXIYFkPz9w=;
	b=U0XlaS4yiwjPUtSKzkgfXJq6qS1ytMxPXlewwk3Cw8Vspu5LfrGN0OhLdYY4QaQSI5x0
	 jGhTI9cjxIiMI7/2dKgGjVfFnkn5UhWcZ+ikXrv7h75n5xGChaCZ7KgcheFj4sIOAwpGq
	 OYY3IcrZyygJd6RR8OM6C+YsuPXuy+/3G7NnwyhkWp7XCVRWBDzi2cdbrbLPvYFqUJcWn
	 flMM9y6b9L6w4gDBIatN9k/sz4k6bL1Fv5EFOoQIGggCvZ4pmnRxIF6WDNYZlm3QPhgUo
	 GCCq1XqgLmwSWmR84aAkBrZlxGGpYMKCvf0WZ3hqQmS/6xFm2FWvslevTp3q8DE2tRw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5E5F1F000C5;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781806;
	bh=wl+4Tz8A0GGe1CXQyGwndmidqOtappn2vfXIYFkPz9w=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Dgi850dJX1otjviqGes3svHYWT5Zqn4d4HKpHoiCUNIguRniaqm2anOabhfINEo+v
	 c4n1aw4VnSq5Bu/+JX4UCuWSc9PlglQJhCyCuAnPaFh0Df1K80JTGMKMQmrnopAeR9
	 +bXlaLQEpo+YUke83RM4bm/8cg1gl8CElvevWqGXYF21a/hTSe4wdh0V2YV5jeXLkT
	 FZ+SPhXRGD0iTFDumCWbOa65EZxa67GvnGYMH8y8eJy8huPrcZjs16oqJysAmZCLS0
	 Af0J3MJxrlYY8SzfGF/U69FoO7Vw/ClBbC3L+zoZb9NOKIa3hKPs/tk0KeW41mo2lX
	 kRIyfad8C9Cow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 471994A220;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH 0/7] arm64: dts: amlogic: Fix dtc warnings with W=1
Date: Sun, 15 Nov 2026 23:29:35 +0100
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8y+moC/yXMywrCMBCF4Vcps3agCVWxryIuJskYp9i0ZHoRS
 t/dWJcfnPNvoJyFFdpqg8yLqAypwJwq8C9KkVFCMdjaXowxZ3zKB6l/D1E8hglXyklSVLx6R5Y
 adrfQQHmPmcv0KN8ff+vsOvbTLwf7/gWbLGOhewAAAA==
X-Change-ID: 20261115-fix-amlogic-dt-warnings-7cba2a4eb9d4
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1829;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=fJbFmYVki+HyXICr6npVABZfI45eU0/vUz5bVXUuFtM=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9YvoyjJUmvJU9cSilvftfhdY49Ty5vLINazp032/d5Tc
 Y5CKnUdpSwMYlwMsmKKLP1zLU+8u3z0zNc96ikwc1iZQIYwcHEKwESkHjL84TumxJK1bbb403c3
 0zUEigP4xSp0T9kl3Dq3Zvu3/nN9howMD/O9a0986b2Wrh+2w25x3YMpdzginn9MWh+ZxNl24l0
 7LwA=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

Building the Amlogic device trees with W=1 CHECK_DTBS=y currently
produces several dtc warnings, all related to the same pattern:

  Warning (unit_address_vs_reg): /soc/bus@.../pinctrl@XXXX: node has a
  unit name, but no reg or ranges property
  Warning (simple_bus_reg): /soc/bus@.../pinctrl@XXXX: missing or
  empty reg/ranges property

The pinctrl nodes use an empty "ranges;" while having a unit address.

With this series applied, the Amlogic DTBs build without any warning
with:

  make ARCH=arm64 W=1 CHECK_DTBS=y amlogic/

Boot tested on Khadas VIM1 (GXL) and Khadas VIM4 (T7)

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (7):
      arm64: dts: amlogic: t7: Add ranges to periphs pinctrl node
      arm64: dts: amlogic: a1: Add ranges to periphs pinctrl node
      arm64: dts: amlogic: axg: Add ranges to periphs pinctrl node
      arm64: dts: amlogic: g12: Add ranges to periphs pinctrl node
      arm64: dts: amlogic: gxbb: Add ranges to periphs pinctrl node
      arm64: dts: amlogic: gxl: Add ranges to periphs pinctrl node
      arm64: dts: amlogic: s4: Add ranges to periphs pinctrl node

 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 5 +++--
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++----
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi       | 5 +++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi        | 5 +++--
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi         | 2 +-
 7 files changed, 14 insertions(+), 13 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261115-fix-amlogic-dt-warnings-7cba2a4eb9d4

Best regards,
--  
Ronald Claveau <linux-kernel-dev@aliel.fr>


