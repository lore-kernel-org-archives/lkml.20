Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD4849504A;
	Thu,  8 Oct 2026 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463314; cv=none; b=KpZGLbyFJwL+uKlA6BbtZVmaT7XK0a2SYtlC8HqOyxWc6uGis5wFjO+fxoWqzQGscJwOq+BWbOLRvPRL3cMT9gUAiSmxilWYY9c8nYTJzo1oitFgOIvOl8tEZ4QCyRD5GwrqLTTx+VfF22iJ0zMSAKaMFVNT/LQ+RENjG2Plhe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463314; c=relaxed/simple;
	bh=OCqotSuxZr4Z730QVjyzGOGwqUGbZBIZ6YprAybunpQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MM06hoMNunyjkvxeARAh00xpXcb9gcnxsdYgA0SpTmYg6IFbTDolYaHthCNKTnZdB06Tfgjl8ekG62InIe4Q80/qJ0qgNLn834FOifH/yk5bPDn0cavVdYgL25NMN4gPnvVJYCMIbCbnQJwmqNSq9YNDsaph+O5SCTjYqidLdOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzHTdVt5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzHTdVt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1E31F000FF;
	Thu,  8 Oct 2026 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791463313;
	bh=Dlc101BIDIaplGW4R5sZhxWAgvCKBBbu6YHcPII3Cyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hzHTdVt5cRYPI1jiwTeMeNTgipFnFFjXXqoujPi+ltqfbIm2PlqBaXKc/15S0iZbG
	 CCdO7ssUJvgochr/CM8/D59+IldL/WfPdBx78DCOz36bLYAqcoZlJ7/aCe6E5RRM7V
	 PrUFdmZhCoaXKt2gnl5Gb47tYVTc2K761gdu4wh30+dLFTVhSkmZdLK8fNgi+pVqo0
	 VNnjOw8VFIMWTEYAw682fj5nrpOKXEjmQNtwnFCMzTqzvzDWGZpqDXe4tVsfO5/vTH
	 9wRzyuBPXce6Y1VwQWlF0DsNpkn0jdmLPDm2AJvceSeTS8MrIe42wQ4mXdXJ7Y/elY
	 v7YMasOPoJPzw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261005152633.25339-1-jszhang@kernel.org>
References: <20261005152633.25339-1-jszhang@kernel.org>
Subject: Re: [PATCH v2] regulator: dt-bindings: sy8827n: support standard
 properties
Message-Id: <179145483318.2423942.13643555045309047556.b4-ty@b4>
Date: Thu, 08 Oct 2026 12:20:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OCqotSuxZr4Z730QVjyzGOGwqUGbZBIZ6YprAybunpQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKO93dvv5/9r6/14dJppzkEe9r3tnBUnyv65vRZSHFWJ
 1Ng6pZDHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZgIQyTD/4pm0ePp845PmSew
 JdNIcH59XECDtr7sjXJB1qvdXeKXjRgZrn9ZNIvlXFPk0tf+VtUPJBbxzIjdxiq85eaH0EzDwj2
 NLAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 05 Oct 2026 23:26:33 +0800, Jisheng Zhang wrote:
> regulator: dt-bindings: sy8827n: support standard properties

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.4

Thanks!

[1/1] regulator: dt-bindings: sy8827n: support standard properties
      https://git.kernel.org/broonie/regulator/c/e46eeb24d707

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

