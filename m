Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639231;
	b=CGK9O0VhAoPd9WbCAmBLW7U5vJ8MvD0jMWWeGb6u2pV8dWMSl2pLwLEiVWQwETa5hq9A
	 q+SMP9xicDr7wq5pWa4EJ+MCX/4x8+tyhySErWkX9ROjj2Es0HcIrTVkr8UiZMlapVQul
	 WtbxziqbIgZgdZ9zjRgYS8BOcc7ywsW50F2belAk+Fnlof+IoGfOCGcyRiZM5Y6InbYkT
	 ctDFZtTLZewNeRg06T8qxvee0woMSlqY8uqfLhvXqyf1L1RIiABLk2Z/rwFTvxukW0SLj
	 2cIqfQgLJMOeKHHZaZ/APqvG3um9JeQkyzZ8HRgFFP/MeLtCD3FlUHXT3aYs2sgGgPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639231;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UACIuM1v+TEq6JBhJhkYZUgaTCYZckjcSOJTWF3plik=;
	b=saS11evBdtyQmPknCxsPeaW9WRGBByXCOhfmeiPnPH1i3r/6oCTe5+YdN45wXjZ1CRlG
	 M+gi8vKaFJKvLwL10r1znLZ4O9XNHowfeFUGh7HtQ2yPT8QC1mdksiCnXoWJuFgk+2K3k
	 67g2ShPyYRTaHuwaYNTxbXzZiXReLx4LtMoBBZlVt2fcpEU7JmELq5BAIUGI7Zf6UhiH2
	 uBREj2M/UNP/+u9y5drPTKpKQXauLOjkmg3+b+DUENMQ/xD5DWyhScqq+IFMOy5+raZKx
	 N44kVInVMOicPcJe8R9dm/4tsOVK1yUZfJyKvcPm86Puz1Hs2wCdObrCBSTpN4Afs2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gvGQypzv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB53606A913;
	Mon,  2 Nov 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gvGQypzv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBC81F00A16;
	Mon,  2 Nov 2026 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793639225;
	bh=UACIuM1v+TEq6JBhJhkYZUgaTCYZckjcSOJTWF3plik=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=gvGQypzvGFvNzQMmGlAnQYl4Dr2pVCqPpwMRLwPsE5rBUR+/0JMixhdtgzZkZDf4O
	 Gdl58F+gltZY0exxv7NjjZn7JoW5lH6yQM+FYh33WL/lccUsavFq0erGkvh1WQ+Xhl
	 O3WEVZ4I3FdEv72pnEb4iNYstxsbFEUdu84q93Y2SSDwh7O6/ROZ3bkmV/8b70uXph
	 cmm/Veml/e4EQYVxoTvUcuCXdknLUFh1zAnd6TJnGy5t5u0SlfyfOo8okpO8wb2XBQ
	 nsBXEjq6ecQqg+ekaLUBmWonod7XvfDtpjLFBOXttTpz4Ghk2vkag1s3cXzGnMHmdM
	 qItPC4hhv/+PA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id BC29123924B7;
	Mon, 02 Nov 2026 17:07:03 +0000 (GMT)
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
Subject: Re: [PATCH 2/3] ASoC: cs42l43: Factor out decimator startup data
 to an array
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20261102155440.3995136-3-ckeepax@opensource.cirrus.com>
References: <20261102155440.3995136-1-ckeepax@opensource.cirrus.com>
 <20261102155440.3995136-3-ckeepax@opensource.cirrus.com>
Date: Mon, 02 Nov 2026 17:07:01 +0000
Message-Id: <179363922126.2092401.9329874548747405139.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=378; i=broonie@kernel.org;
 h=from:subject:message-id; bh=g8sIS2slfonCKWazYk40mVF7NrCH7QWO0saayIrGghQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeHDYPX92578Wv3bnzzmdL/rVi4WFguRwUtdbqPNvC6
 ZK7tPh0O0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARD1tGhi836pYzhlTPNSs8
 1LsyM4fzba2l8Up3i/gTpev8dtkW3GBk+PZcZ5pU15pDXnu+n3NWURTWUVJ89r/SNfTg7XVz5/1
 KYgcA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Rather than large switches factor out an array with all the data
> necessary for the decimator startup. This makes the code slightly more
> readable and prepares for some incoming improvements.

> +struct decim_info cs42l43_decim_info[] = {
> +	{

> +struct decim_info cs42l43b_decim_info[] = {
> +	{

These could be static.

-- 
Mark Brown <broonie@kernel.org>
