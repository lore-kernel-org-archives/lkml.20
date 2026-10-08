Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D9A37C923;
	Thu,  8 Oct 2026 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469436; cv=none; b=Ts1myz2u+yEP4ej58WiW+01JQGrA5hS4/G4bdKOOnI3ixfgkuYFUZi5VADbt8w2YQxAJ51xcsXIUDPgKXiczgGqtO4pTHo241LB2h8mu3KrXQxOyMbztVt6h3O5liqc9nYDzrow4ianlcNJFE6305UXia19H1nydCaeGcgZStfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469436; c=relaxed/simple;
	bh=FH8K5T5iwcMbVb5eFlAnwSPC/DKlcLsYI7mBGzMZKrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okNITYfg7uGFe9pp7eJPjAmQrbrmMC/mm/4+Ok82DdldLk1uKRMF5vDALSZkfU2SYGWH2mG29pAfOzoDWO8b0lcFn/eejY4Goh0KR7mXocAPxz9BLCzvAqH6ix6gOdKTpHfT71elELeaFzasv8Q+7cFv2ixQuiVFU/IEu7Y89Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtGwNC6g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtGwNC6g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FAB1F000FF;
	Thu,  8 Oct 2026 14:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791469435;
	bh=ubJhzmPg2cvyEPgOx3KoWhDFF3XbH8bTIRtTlGN1KxM=;
	h=From:To:Cc:Subject:Date;
	b=gtGwNC6gtXZV8s6YWPlANgjcED2Exy3wN9H51eUBiuoIq23KfiwC43xdj4ypPAUWJ
	 +wJveputhusON/afhp5fcHUAeLM2SihWObAKrbERdBwP5gDWstj7u1trJuUlmaXV97
	 arsdRGYFWj5+ZtFuA5g2PWwmkfUmRkRXS/6xisGo3ADUbUksrqTyJMvm0JLcXeOxeA
	 RlPIoeEwpizs7A9rCYCDcKoo/pkX0Nff0QBEohaELOpsROyCGUbfjAlZHFijQqktBU
	 4FZAZTQEOXpTib3APw/tp9rVp5tS+CG000CHr2X0iNWV7bLjczT+YrtTkGpcBuakIZ
	 /p3B3rxJitQHw==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Please add the kapi tree to linux-next
Date: Thu,  8 Oct 2026 10:23:49 -0400
Message-ID: <20261008142350.3067287-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mark,

Could you please add the following branch to linux-next:

  git://git.kernel.org/pub/scm/linux/kernel/git/sashal/kapi.git spec

It contains the kernel api specification framework which I intend to send to
Linus.

-- 
Thanks,
Sasha
