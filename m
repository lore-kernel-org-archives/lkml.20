Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794138543;
	b=NYKItP3BUSKp8KcjZ6Xzb48zQ54EIza5plX52czOf6TKI/2g7BHQA2phHZH5XMqnwrZp
	 k8c8kBF6jyDLE3pDMluvdh+PaPW4fDZwLkE3o53y5tFBk7O0JAkKdqmsdjBRhc60+cz23
	 VGnrzjWpUJ6hJMZkzAB+xU4rtXllT3oEMshwzBIrj8MDVYjRgbBgiyo+uEsQ0aih7iI/9
	 41xeI1bj6fvsVU7IlWjo72+ygfaX+o+uXqbmcaXVhESZZYbxCXYEBpA7jJEWcloMn/tu3
	 wjqdWDaEKf0yKUATSO+wlHCzBiCzrdhg+LsS8Snql/ffYkBB75dvqHLAnmUn9+vabAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138543;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ynID4k2pCOB0b2/csxbYKul3BDekmqX8aGtMTBsU8gE=;
	b=VAJuB+B49iA9GNf79TyaAGh3ZjxqzCLac76M1auPHp+kFOEzI50XB6nG1FKXSyCym9Ce
	 iar9gPdJRuxhaGcX70mUbG0j3+nn9GHBEfrHafYoxIK2dHH5CXPzwNloGg/1IHKBw+9Gc
	 6VksOHLPr/yUby5zmDE/h7e/TVySSzJQK35MOK7dUX0XghdnTRh3xTRbFIzPh12I6rKlp
	 kVSOIe+QX6pMZXrDJST94op9DTRBnn8xUqMzN7Ch4yeKqI55Xi+5tcF2a6cfD373bQrum
	 uZiuQ2XjbBwhANaU5kyAk/y/JBNS8oF4baMzV7FEBsm+71XSeVDhGtiuUYuHfoCM/mw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LmP5587I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEF1606A322;
	Sun,  8 Nov 2026 11:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LmP5587I
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794138543;
	b=OcNLZ8HJgF2rBXpRoYFlzsindFiCvgeJvJd3nYFQABw4QzIkSxm7NDRtiVj45oTMpiZb
	 taXiLN1h/3vTrJTyr6btRd26fOKZqgR8SHUhyERRLV3ua5kpLqRaYU9t99jWhu/yFFdNa
	 Vk2ivp6Gp4BTeob7jCJhwy/OxdJAQmolhwZ/pfI9tgcC6bYypwS+40Z3oagvcvO0mYelJ
	 +Q8s2Ut0IkozoAbrU97d9/lp7VNDAiskmVI9I0PeXL3jzy2zp7q/WLEkFfxoxEa4QXw5p
	 RJBVehtQyae6gqOxZ9qmH1dqq7iR/lXeOPX8+yGFY0SHV/R2SdYxnh+RRBpb5Tj3Zdg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794138543;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ynID4k2pCOB0b2/csxbYKul3BDekmqX8aGtMTBsU8gE=;
	b=RhvJ3++UvTDsZFXUkRI4er+XxjeqolgDKVamTpINmhp+Aij/hFCB6hKAi6k33FnJy4pI
	 Usbc5JbIQvzSi8H6rvZ+jlOqw8GceKGGfPEWaAVykCOWPtA4pLYD8o6rBWain78YG/1SW
	 NW3ej1GW/88u9tkVR/uExZKtITbK2NynGD61KF7SlB7xgAK78KCpcUrX8Kzvz1EFQvon8
	 U7Ypx8kp1nfF9zG1u4Z1Kb0vDRFekspr7h65qBl6gwLWfAEhHn/rjxs+GjJAn+xeJ2nNk
	 yfi2lKN63Y9w0/XOcxnAxsnmJzfqwwxkNtjE6L1Mv9TSBsMyVBsqsjbQo68uDwhh5SQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DC331F0089F;
	Sun,  8 Nov 2026 11:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794138542;
	bh=ynID4k2pCOB0b2/csxbYKul3BDekmqX8aGtMTBsU8gE=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LmP5587IeyXa6DyDC7OWPI9cJdpihtq32MsSrWLDewqL0/rE7009XtUpe3vzMMCWp
	 Y5aGSEWyOe2cmP6MZNTsBco1qnjvA4QMMUAVfpjXAZpYY16GLfbbvwnlyep/Rb07CT
	 0WIEFw7lV3hdyPI3Gog4pmsY3QAM9MGobqEN5Z4AGw0HFM8O0DAIziqOV0KEOGeOvt
	 VWAe5z2b7256vg+w67jtf1koAXkTVksqrfC1C2ITPsbO5bTdGDqosuSbX7mhIn8jsM
	 isWxrATo269j19pDAlU8/EHBAfE+5kyP1HGfkOfODYoYhFbXbe41Mro6L1KvZl4vNA
	 XNZTAOjCf6eIw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 701BC47F1D;
	Sun,  8 Nov 2026 11:49:01 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Subject: [PATCH 0/3] Subject: [PATCH 0/3] staging: octeon: Fix
 initialization pathways, parsing, and modernize statistics
Date: Sun, 08 Nov 2026 05:48:59 -0600
Message-Id: <20261108-octeon-init-pipeline-v1-v1-0-eb2c6c956279@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMBBF0V+RWXfARCu2v1K6KOmzfSCTkIgI4
 r8bXJ7FvbsUZKLIs9klY2VhtAp3ayT8P/aD8lstvvWDc+2oMSyIpjQumpgw06CrU/g7wtBP/QO
 d1DplTNyu8+t9HCedG/ndaQAAAA==
X-Change-ID: 20261108-octeon-init-pipeline-v1-e25ec64f49e3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794138540; l=1714;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=w+LxKXpc5/OueBx6E2vSnL8lEwk3W2G5TdRTpGXBCVA=;
 b=4IlX1Expen/V/qIyYipHD40SSx4qgmLDskV1to9gu6SYOp5F7ytQkD9/mHgUh8iHz41vEYbh4
 w4V7QgSZJsOA60hYXKFZtCkYWrEZrkuymcg41qrzlL/gtDrBeYbFbOX
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com

This series resolves critical initialization issues, structural edge cases 
in string tokenization, and infrastructure modernizations within the core 
ethernet interface logic of the Cavium Octeon staging driver (ethernet.c).

1. Fix a missing hardware resource cleanup step in the cvm_oct_probe() error 
   handling path by ensuring cvmx_pko_disable() is invoked dynamically prior 
   to device detachment.
2. Replace an unsafe prefix-matching strstr() evaluation within the 
   pow_send_list check with accurate comma-separated tokenization using 
   strsep() and strict strcmp() checking.
3. Migrate the legacy 32-bit ndo_get_stats net_device_ops callback to the 
   modern 64-bit ndo_get_stats64 atomic interface infrastructure to prevent 
   counter wrap-around bugs on SMP platforms.

Oscar Alejandro Sánchez Lucero (3):
  staging: octeon: disable PKO before device removal in probe error path
  staging: octeon: match exact interface names in pow_send_list
  staging: octeon: convert from ndo_get_stats to ndo_get_stats64

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
Oscar Alejandro Sánchez Lucero (3):
      staging: octeon: disable PKO before device removal in probe error path
      staging: octeon: convert from ndo_get_stats to ndo_get_stats64
      staging: octeon: match exact interface names in pow_send_list

 drivers/staging/octeon/ethernet.c | 55 +++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 19 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261108-octeon-init-pipeline-v1-e25ec64f49e3

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>


