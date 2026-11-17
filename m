Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794878498;
	b=JwDDfGkSdKNxO7XeZVVu98Swyb2G6lgG4Q/KGBTB1XQP0wL4dCQe1TklULQM2E2iX+4G
	 HEeTsAk6RmjVhS6peESbNH5xP0aropMbK8B8Rp14UcTlIpkCVyBCsyWH36nlvyf6UdgLZ
	 z9wgcoDi00ePXX7F1h1oaPMfNLn3qDHqPV3YFu5lcxdOPCcM4+ZLzDFXw0LFeB6dJmgid
	 yzh7tzWa/ixB/J7m+C/aAJfwQi2Yi89/faV+smHGz1XmEykykKXvWueCNJPncl7fRUwOE
	 WLLLnXk4IyFZIyO0P43v29jkNoqg+ab11eFdESGkH3+1MV5KY282d2HyE24GVCQBWDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878498;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=27pg7QSeKC7eNF31UfV6oNEJuE81OXkGgDiSCoSCGao=;
	b=LfhwpATa3f1UiZYnFC0fsGVwOvPXkanVlrf0PoN6I6WeRBu1r/+HvHdgXIaaHi/fdLqk
	 FnpDfUUuSXIafIeP2GAsnCJ0SXXv4UWhJPbxBpZf68bDT6MCoRExBpPbkW9gHf8BZEevd
	 0Ja3Oaywq6m3SqpELQhNyp+9eUxGR399Q4MFtzFu/ezWrAgRdR4pX2Efv0xMwNr3xkHgv
	 AsEjgynZ7zJcaAI6qI8aAzQC9JrthicEygACiH83kbFE1A/2vR7zEKCpgXKEIh3C2BFA7
	 wd4GXfw3NtkrOF8mc7Y9kBbmaJ483sI5WZMzVu6Lx9GcFU33lwqAjaKNypi+i6E9GWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AxuJBLAX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3276606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AxuJBLAX
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794878497;
	b=eLfC/vGP/XSkygCC5eeFRTHWSThvGAPyL3obddO+wPsNMQFEOebuyk7wGiarwrkD+48T
	 /9Fdcyy1BHW9AhYmLDQrrJKlZfurx4a0CNOoiorY1cVO3pOqkkENGo2g/aViF5G3uKNbm
	 KtgL5AmAxU/tDWGeV8tMCogOYqe6DyY1YelSFlpluKVRVdhuFTASPXif8cM45ocwY6Om8
	 ITGSS9DSAXr98MIUkvHZEq3X3fwOEc/qiW+7ol2KDEBaXu/Ze8y+zMyi4+RhRfhmOg15i
	 aezMJXeLJn/myvX4LQ5IEzvhGZ7drcozKFTg6IsciDuudq7N4gKyHXw1EimK4hn0Rmw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794878497;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=27pg7QSeKC7eNF31UfV6oNEJuE81OXkGgDiSCoSCGao=;
	b=AGLPYwrRyrT3r5hFRQENA/iiUumdYKj6S91yRTtBn4c7V3WkBmdNRmteELF8MmlzWSVC
	 EqGy6BI6lKf9DM5ftu1lWmUS8f2n1ETxlt7/dVAIsXEN1Y+p0MUiFAAqtr4xxmkR72PBI
	 RbZYr9/K57aUrQDKDvNVRMfh1dx9BRDJ2Td0hebujFHMLOw2NwxBIxTbsBZcJ3RbMEwbA
	 xkY4FZuT/gzDSy8hOjYg2BRxV1W3gIyC1qEVIHyXZy3mpYds+3ub4lOKh+rYFroVXdlBz
	 udMAA8Qxa8/0B4GQo2YSh+/xuT9c8TNeMQrcImr49Ik2RwX1Smm0ZmcS1cV8l0FNbBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EEFC1F000C5;
	Tue, 17 Nov 2026 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794878497;
	bh=27pg7QSeKC7eNF31UfV6oNEJuE81OXkGgDiSCoSCGao=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=AxuJBLAXr3vnE8vDlcHPzJlVZxj9YRKjPkKAYpRa2+yIMrVi2zmTRs/mBIfpOl/Xh
	 4G5R+8bfvGAgDyHyV16aY8J7Y0Ms5X6pl1NkA6gnt1zWu0s0NEbj8/VXmRcuTxCE1D
	 sfnHm761HO3dq7QBbZL5geE4CODEhv+MTeucdp4pgEK+VWVBLtoFFY8RH+LVBFsoQo
	 SQgheGNmfn98XPLAZZt7dNVGKLs596IJ3l3KjWzW4JtntBqtLYW3lzE++gHQCHukQ0
	 9hSd5T2Gn0dFXtHuYFr74RnIH3HPfOns/z4aa6CACi4shFvknPgsbXfI5nxGntSQZV
	 Jls/2iheOaBHg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F35C54A664;
	Tue, 17 Nov 2026 01:21:35 +0000 (UTC)
From: Sidharth Saha via B4 Relay <devnull+ssaha2000.gmail.com@kernel.org>
Subject: [PATCH 0/5] drm/vkms: Add KUnit tests for packed RGB format
 conversions
Date: Mon, 16 Nov 2026 18:21:31 -0700
Message-Id: <20261116-rgb565-test-v1-0-27f49c1aa694@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrJuQGIxGSuk9iouoEw1UbTOxF
 MS7N9Xl/+B9GxAGjwR1tkHAjye/zCnkJYNutPOAzPepIRe5llJqFoa20AWLSJGpvnKmU51pFUJ
 6vAI6/z20R3N2wPea0HiOMCGRPdA6u/5NYfJKiEIJyZUuTVkyySYbR1yJW/uc0Pf27mfHVxcG4
 m24QbPvP3gk8zC3AAAA
X-Change-ID: 20261116-rgb565-test-3d8f9c3c9b3e
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sidharth Saha <40047656+Sidharth-Saha@users.noreply.github.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794878495; l=2121;
 i=ssaha2000@gmail.com; s=20261116; h=from:subject:message-id;
 bh=4R4U0RGMTz3P5bOW6oCa+DKZ3/UIMcCejyTU2U2foww=;
 b=LO61FrvPo0vRuzmFSmVKabjZJxKkkU+DVF8WiR5UIvSO1/KF8brdQcBDPG4My8/LGs9VNR5Uw
 w1x1GBdIaHPDkFdlmKJH/vGtwIZNWfA+Yz/JTFc69uuhJ7Q7xd8FBuG
X-Developer-Key: i=ssaha2000@gmail.com; a=ed25519;
 pk=wMWW9xOklVZkO7Yh4yIXvhVVRs/3ROsqgjTt8XBGybI=
X-Endpoint-Received: by B4 Relay for ssaha2000@gmail.com/20261116 with
 auth_id=1541
X-Original-From: Sidharth Saha <ssaha2000@gmail.com>
Reply-To: ssaha2000@gmail.com

This series adds KUnit tests for the pixel format conversions touched
by Matheus's series "drm/vkms: support more formats and fix RGB565
regression" [1], which it depends on.

The RGB565 writeback rounding fix in [1] restores a fix that was lost
once before in a refactor. These tests are meant to keep it, and the new
RGB332, BGR233 and BGR565 conversions, from regressing.

Each test is table-driven, with expected values computed by hand. With
[1] applied, all cases pass. Without it, the tests for the new formats
don't build, the RGB565 writeback rounding cases fail, and the
RGB565/BGR565 read cases pass unchanged.

Matheus offered to include these in a v2 of [1] if one is needed;
otherwise they can be applied on top of it.

[1] https://lore.kernel.org/dri-devel/20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br/

Signed-off-by: Sidharth Saha <40047656+Sidharth-Saha@users.noreply.github.com>
---
Sidharth Saha (5):
      drm/vkms: Add KUnit test for RGB565 writeback conversion
      drm/vkms: Add KUnit test for BGR565 writeback conversion
      drm/vkms: Add KUnit tests for RGB332 and BGR233 read conversion
      drm/vkms: Add KUnit tests for RGB332 and BGR233 writeback conversion
      drm/vkms: Add KUnit tests for RGB565 and BGR565 read conversion

 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 202 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.c           |  24 ++-
 drivers/gpu/drm/vkms/vkms_formats.h           |  10 ++
 3 files changed, 228 insertions(+), 8 deletions(-)
---
base-commit: 66c571876c4634dc3258a75a6d49bd7e88ffcb35
change-id: 20261116-rgb565-test-3d8f9c3c9b3e
prerequisite-message-id: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br>
prerequisite-patch-id: 62056d93696db239d59a0ca486a7fba3f5ee204d
prerequisite-patch-id: a909d90a401095b0ad014f44f08b8c76563262b8
prerequisite-patch-id: 713b5a5532b2ec31d360132496e6f9980b91a16a
prerequisite-patch-id: fa0fda9d178c4b5a65d984a672f47ec90b86ea2a
prerequisite-patch-id: 8e173c420969c0943d31eec819288d9df4d39b5f

Best regards,
--  
Sidharth Saha <ssaha2000@gmail.com>


