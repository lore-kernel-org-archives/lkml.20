Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C96D349CEE;
	Wed, 16 Sep 2026 02:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525297; cv=none; b=fBMDnkuNcGU4DMKOnf7g8+wBgjt1fWy0LrU+sqvQWkaGBM8C88G+8MfeVafY/IZ4b6ST3S7ZNomob+uAE5tO1x1CMcfaPihJi6mdFysVfxIAyawUy6tu0Iqm9kaEbmOePjEP3DU8ffyPWbtyn/9MmArmqbhzxHiwMENxyHciek8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525297; c=relaxed/simple;
	bh=Tra7t3gPfKpvqsHFw7X0zpdqy2tvoklAurggo6kBoGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LGgdaMyv4ONITVkskN/qmWouLXZ+TUGmR5OH5Wo9pxYl3TXnbOjAALgZJn/CnsMau236Z9+ea92fHefJw4hK4PUkiYDZZ5NyeRa/kJKFhUnRsjPAeNT9BROBgWFO/iRkBtfoqhjX+DcZaykowpMkHjyH+2IS17QQf2La4SI/85Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkXwgn5k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkXwgn5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAEA71F00893;
	Wed, 16 Sep 2026 02:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789525293;
	bh=6iZpbiSb4G9jkRUzim4PlL0w2d6FuhKtW16yMIePUAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fkXwgn5kT/wpo4YAVu8dzupK9isF8sj7jvcAxaPFpC3c0r41RXGkAIYO4fiGIGQxi
	 /zMlg5IIlq7sG6WvXcXTrSSoaZrriObn3gMUgjMKmDDGoMImcRZiLjBukExfFtsIS+
	 dbeXvck5IWBDAO+nZYwjpAI8sY2Dp7Hz0RbiBI64Hj0WWSY06f5W+rLlftPw/b3lM5
	 tT+gJIBw18r1hCRWHXzvgodBzjksvuJotopgNHjKpSg8puEcxpwgIF3zDUJXKQX5Se
	 WC3NauaIUgMmSCSbhW3kIRw3QX1WQXOTzgkU2uuxNJDKw/bA1s1wQ0Z8KqlQrMI9p2
	 TVVOdjv+twtPw==
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller driver
Date: Wed, 16 Sep 2026 02:21:27 +0000
Message-ID: <178952516873.3915021.10661869021397268088.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Jun 2026 06:26:11 -0400, Guodong Xu wrote:
> Add a MAINTAINERS entry for the SpacemiT reset controller driver
> (drivers/reset/spacemit/) and its reset-ID header. I intend to
> maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
> that reuse the common code.

Applied, thanks!

[1/1] MAINTAINERS: add entry for SpacemiT reset controller driver
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=bd81fd41a70811d3423f2701e9ce85a003175d7b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
