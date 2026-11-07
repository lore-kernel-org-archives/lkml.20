Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794049607;
	b=Sk4oH4lxKvIqOLhU5iDltGs4JS/Wowou5gYAq8gPBLJYSzSSEcfjWKNqLMyNTAQWecBX
	 d2+ubUWAujieTQD7Tv2zMO6ef3AEyd1PhOMDiLW6GkPYYFjC90HGJUKt7Z/1j1pzOTLWo
	 scRQ6MfHM14pdwRjk2d9WDG0S74pLhg5GgO5xQrokz1aAiGYhGrgCqs81qdz9sA8McRHx
	 kmI3YB5vbPcHGVo2Y5ezb2o8MnCkCwQASjxVtXFBOUt7mpmgb0Cm3a14qGpH3HwXmoXvm
	 FTuDVPrsEnvW2bKjHYulIcggHFm1kmOO93kh897bM2Jbjeu+h3jU6KdszMWuAmkN0LQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049607;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y+sQ2eZ0S1RnaRp2PxJmpWd3yG3Yh98xZ3CH8/UY66c=;
	b=RYDIKK8gIlroqhr6sQeW6bud0rBfwcdU+cyGgCNLdwRZSPaydzxbqJlF/glDBHrHnN6e
	 Tt4pZOQE/Zfp5LsVAapDHJKJZqDjsvM6w+EIYfvMLHabWXAqQoGEodLo9hOfr4PQ+kK4A
	 6XC4Ge2SNla/LcSPJZltR0slDFjsh4dT4HsA5l2QTVxaYjrpYJX8hMF1gHaZ9Kc820C5j
	 rYK63B68vjxB6gZbElXrg3orEp0Pm4MJ+yix3731JXTonIiOAyT+SxkMz45+sz+UYgamF
	 MYrqxLaiu48SzPlaYISZljWcKU8NcwaAKuyDa3IWl5fl315wFcHQpr2yzSZak+HcAEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OfJXhkb7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EE6606A339;
	Sat,  7 Nov 2026 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OfJXhkb7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794049607;
	b=1uvK2HQ7UANHZ4ZXD05Z8fm0zvrI/bvcTKtjOaLzi946ISq0EFIZtZYyJ6L5zCojRkB9
	 A0f1YLcn8Q2WEDiFgaIaofVgnrwkoBSVUZS3t/0PWAD/Ti9bRrYtDOFBMKm6ucv3MoIPt
	 Y7zxHtHffnnhz638N2d2tbVEIamOVkd209NNZ20gML3TCh5krLk2gE/ms4bUVglTorXKX
	 C/2iG1vXgcw9Ruoybr9PYDQ6rc2YAdDWZ3KI28hZRUFFSWGL3YoFJwLUg59d3C63SryGf
	 Zlf2qqE/Bs4tURrCKtMbOIjhsjcqKh4PBRXSLOnULqvY4SNvL3OAvAqhlHAuJgpTrYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794049607;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Y+sQ2eZ0S1RnaRp2PxJmpWd3yG3Yh98xZ3CH8/UY66c=;
	b=BaVcdck8g7wRlJtOXz15a/bfcktWfqQ25w4JJd9lV7CvfsfWlFwgwbkdSlVKl2+brA6S
	 CaDUci7pVcpKR95ezQcSqRY1n77YY8suveyFFpcc08kSsnm/HWV/047pKsvkUvxN0Du60
	 rwIxNPQ1Ki8PMigAsuFFQMbNkjBB8dF0X41PLe4g7tQl1OWeWO9AshW1z5KLzZuC+UKQN
	 IunavXFyF8FtReDd+/h0BbMmnSVzTXd3+1Dn85n+evpdGC1hyEsU+X8rbbjdLErUHdYIY
	 anAWLBr2VpLlCea6NUt19J0dKW2lPqCp62J97G3VW3RaFDbCwtp6vN/fFlxwV9zb26g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 762EF1F008A3;
	Sat,  7 Nov 2026 11:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794049606;
	bh=Y+sQ2eZ0S1RnaRp2PxJmpWd3yG3Yh98xZ3CH8/UY66c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OfJXhkb7kQCkR63Zyyk8hHkSP7isDI6anFPuKYnUsboTvk/dyXSeIqFY+wqEEgfFG
	 XO+VRfeqoNYpmaoonlA5kV8Mi5kmV/FmECRnhqafASx9MPSD+IzQlpzslK63eOTy6+
	 um1Hgg/4hNfDqzp2OggrTb9QIEqBUuCkO2+5QicG0Fey3JmQq3C+mqlkOlH7RAk8zM
	 fcDIOyI31PcViTGs0O2lxzTdAtCS1/IjFF38eMOge2BG50SZj72zPQjgVRO5/ovbSi
	 VjDI+1pzDp3MMNhL/MhS7tdt2kG4wkDbACqXLgWrI+/bNd6WxksaZCxQ0QQUFYDT3E
	 HfYpZ97hcgcIQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE2B047B9E;
	Sat,  7 Nov 2026 11:06:45 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 05:06:44 -0600
Subject: [PATCH 1/2] staging: octeon: avoid void pointer arithmetic in
 ethernet-rx.c
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
Message-Id: <20261107-octeon-rx-fixes-v1-1-f5a21907c8af@gmail.com>
References: <20261107-octeon-rx-fixes-v1-0-f5a21907c8af@gmail.com>
In-Reply-To: <20261107-octeon-rx-fixes-v1-0-f5a21907c8af@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794049605; l=898;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=d07dfZQ1mRZaecgAH10Camw1oIZYGakZzv16T/1D2jw=;
 b=1XkCK8Y3B9ldNTpHNTw4bH2281ZAg8zTtm1mJ65EAFbSp1MT7rg9wRyJf94od5Pyfxc+REaqU
 Lp4ekxMkGMKDd8aazAj21qavKlpd8kj+h/gTZxvmvFK7ZWtkOnACUZy
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Arithmetic on void pointers is a non-standard GCC extension and
triggers -Wpointer-arith warnings. Cast the buffer pointer
returned by cvm_oct_get_buffer_ptr() to u8 * before subtracting
the offset.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 5be43bbf6a1d..b0463759be39 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -243,7 +243,7 @@ static int cvm_oct_poll(struct oct_rx_group *rx_group, int budget)
 			break;
 		}
 		pskb = (struct sk_buff **)
-			(cvm_oct_get_buffer_ptr(work->packet_ptr) -
+			((u8 *)cvm_oct_get_buffer_ptr(work->packet_ptr) -
 			sizeof(void *));
 		prefetch(pskb);
 

-- 
2.56.0


