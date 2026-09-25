Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2B4582E7;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322451; cv=none; b=b/Ri7iyfHTnO/k3oiiRpgc7cB2Ah4SDDz8p0I3KCIBKTXwgMWnTrK8D8G24Vil4DFLaiFndNFQAooQNW8Eimy9vfPhHQ6AOA+kLLt0ZCLQZW5w6Jpo+NFt9drxcVHnxWae5t8H6P64Xsrt1KnahzEEFY0J3BAKR8aoI6z2dPzq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322451; c=relaxed/simple;
	bh=0RxTci400abtv1CmfPdCaZw84TP5Ofx2vovmIeotYPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ul74Y0dhpoBXyS6/fu3g+QBkFKlm1VxNDFNYnPugdHvRPgsOeBcEk81SUpvbA0T7C2KPUcknXIy9RA4zHIYyQA2LGrcJnqGew8mbYQpQ6TJnxLaBMHGKlETvUVhVxwHioaK2CjgErlTSuLTgrc1ylq49TP2PQrwVagdmO+5/o+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdvw1G/W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdvw1G/W"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD34BC2BCB8;
	Fri, 25 Sep 2026 07:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790322450;
	bh=0RxTci400abtv1CmfPdCaZw84TP5Ofx2vovmIeotYPM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=gdvw1G/WgVrDK4rTivVYrXzXVmBUvG7nyPgN3niOTnBLBCzxtF59NPBiA3cBkWhWh
	 h9FKfD2Osep/Fg7XIVfcz2Xi8+ZqCnUHkjisjcuY/ubY3mXaiGnhzmbefV8qdXRgHu
	 lsYNAUGwT1sPzCuogYu+tLortLC7X7lKmxZGWJBEKlhLrJi6zMd0PKtNdQKyHxyQvg
	 QMV7GJMaFJfHXrU+LubPg9UeGbnYjvymHLRVcl6ylwNkPJ2ELeC/VU4Ow2n4C9y2Su
	 kjQCaZMd+AGcQG4K9ZMPqtQLWHRqABa2oe1GWEmIT2dw5KMljooGmrEewDYCW70Uht
	 Nf3W0TH2UbS0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADBAC98321;
	Fri, 25 Sep 2026 07:47:30 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH 0/6] ASoC: codecs: aw88166: fixes and cleanup
Date: Fri, 25 Sep 2026 02:47:28 -0500
Message-Id: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNT3cRyCwtDMzPd5JzUxLzSAt0U00RDE8OkVDNTw0QloK6CotS0zAq
 widGxtbUAALq53GEAAAA=
X-Change-ID: 20260925-aw88166-cleanup-d5a141be651a
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790322449; l=1072;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=0RxTci400abtv1CmfPdCaZw84TP5Ofx2vovmIeotYPM=;
 b=QVqL9uBRySW7DG2p7F1ZQuAaIqSz46jW3yk6SYfLw4PR2akQAJUMyybk4PfkVBjMAPqXkKdfy
 xc4E0NO5BciCUwOa7lFaUmycDNGv8sJ66KwyXULzv23BGPbIKonSn90
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

The driver was merged in a very downstream-centric manner. This series
copies the changes from Val Packetts series [0] cleaning up the aw88261
driver. This makes the driver notably more usable on the AYN and Retroid
Pocket QCS8550 devices, as well as the AYN Odin 3.

[0] https://lore.kernel.org/linux-sound/20260529200550.529719-1-val@packett.cool/

---
Aaron Kling (6):
      ASoC: codecs: aw88166: support changing sample rate and bit width
      ASoC: codecs: aw88166: add TDM support
      ASoC: codecs: aw88166: reduce log spam
      ASoC: codecs: aw88166: remove fade in/out on start/stop
      ASoC: codecs: aw88166: remove async start
      ASoC: codecs: aw88166: make volume control usable

 sound/soc/codecs/aw88166.c | 590 +++++++++++++++++++++++++--------------------
 sound/soc/codecs/aw88166.h | 180 +++++++++++++-
 2 files changed, 501 insertions(+), 269 deletions(-)
---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260925-aw88166-cleanup-d5a141be651a

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


