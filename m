Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794067986;
	b=Q3TvzFAOOUFjkV6v5AgOt9BtpXGt+y718aMTVUEIiY1GKyHTPh8C86dTZ+Mvu+AGkXgu
	 AAkricKMpXyXxLL3RpuWsXCNsi7s6nDG9SlmxoNXrXkdT3gaqNvPd2hQ+7zMMGt9f/1tk
	 aixzMPsPSF1ATi0JAVaQfQGJvb1G82uOJ/wZiIKKK5qfGUrT9WYYrXHFnDvm9f1KWD3lP
	 WlvcgzeYoNaSSCrbisp9QvFsWoed4ljFvf326VairffERyvSCzZEaDxsUmlhrBgFBv8Uf
	 l7C/CL7eON2Y+luSmNbNJgezOCiMbiIC326qL3V2n1SjUrba3/ySJbLK5uLriv0oamg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794067986;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pdG9+w0MOc8yUlaCyokbXaD1pAnFmRfTrOZLZCjfP/4=;
	b=xtjjOGcDr1Uu3svRwkHfO0jccOEuQrbegSGVvHi62nzhCe7XkxRftcA/SfEdtZ/Eqbda
	 eq9g0hibnXvSOZizcbXjvCLbnPfGbzewMvrbILOtG1uaNrMFSxv3JtQ4pimSqnB9wdxx+
	 T907aGX54V+bJ0CTuYpafGlXL/ewTdb2wItjOk30U15yvedUNxOfncPyOIrmbVdSccGGj
	 1LXSQWq90/T/na6jqAlJBxd/kq2xSRLBwbfp3vivJ+IIauKRXoXUhrT5mQi1iE8PqRWfP
	 Tp/T5qS3aMaU4bAv62qhmlY8O2dkWKa1Qd/P5GRvhZxehSmfuPFUvJNNgceXhv8A2mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z99EQxYr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E5A606AC04;
	Sat,  7 Nov 2026 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z99EQxYr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09C61F008A7;
	Sat,  7 Nov 2026 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794067986;
	bh=pdG9+w0MOc8yUlaCyokbXaD1pAnFmRfTrOZLZCjfP/4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Z99EQxYrycUoPCuM1IsQe9tJkCN2D5CV8ni6KhKiNkKyGTRPfFYcNKznv7N0TlEWL
	 GSuVFNbhNdL0Y05iuMow4uLxLp/Olm2e2k9eryOrIcdLU0wiUCusINA+gfHxCZqS9q
	 DlOXSECwm5rKLqzgFY5ieamxnKl6jRfl/hM4IE6eiVY/JIjXRqIJ8zC3pdSMMzTyUV
	 28mn1PfCKRyTLbNyL91eu86THlo5J+nOApyk2qCgUIBhcwX0Zq/MYBUVFad7gYj4Qz
	 Z6MDZM02NVXomr+/fBRrcEj1Pu4WODWIT5PBcoUCx2vhVxF8DETYeUGXcIrXoAmiyF
	 jg3MvxfyvT15Q==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 9FD002B73E61;
	Sat, 07 Nov 2026 16:13:03 +0000 (GMT)
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
Subject: Re: [PATCH 0/3] ASoC: mediatek: fix AFE IRQ registration and
 removal ordering
From: Mark Brown <broonie@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ijae Kim <ae878000@gmail.com>
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
Date: Sat, 07 Nov 2026 16:13:01 +0000
Message-Id: <179406798190.3424803.7064068903462702662.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=396; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8Nn3Pa/63F6/6Qms1FObd9lhdC+Vb1g3xLoE+sQ899M=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLe+/FPimdvYtzxdq5VB8/KLR3TZ//snvHwzGbXJ5mh5
 TKpKy6t7yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEzr9k+F9gk+z/S894h3RH
 aubn8hXCU/pDSrlbTnxQ33BmUtHhZZIM/533uueyzLFau+Sc8aRNV3lXzdtXnJD8hsdQu+SfTEH
 POSYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The AFE IRQ handlers access regmap and PCM state. Register each handler
> after its inputs exist and release it before the final remove callback
> or managed component teardown releases those inputs. The mt8186 patch
> also balances IRQ wake settings on probe failure and removal.

This doesn't apply against current code, please check and resend.

-- 
Mark Brown <broonie@kernel.org>
