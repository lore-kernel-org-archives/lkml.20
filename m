Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80EB935C6B6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.77.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788022190; cv=none; b=kJfYP5rqUSHNTfGlSitg+Xnn16xpFfHXKIqsvSu3D1a28qYg0KUW3T1pqQx2/FnJbd+N6QajzJaIXNqTXXksML9Al1W3DSxbXgfrg4zXHWl7brnsnaMLsjf+nHgCDrTw00oywWnv/Tj8Qz1TvDPrvSwvHrMk+OiGcfftNOZx1PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788022190; c=relaxed/simple;
	bh=88Tvt14j/PBzQktSgAwjl/vIHMlPe6nvOzRpz4jg/dA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nfAXzkgwCQ5PJ0Du7Ih2Al67Zjltf+p2cQf9/X8GBAjKdZFDmaYlC34YEVCxSkk1Sulqj3Q4r/X6NiyVZavtbOitFAnxQvIf7WGqJyYT6QowXCX1yMTVVcqurMbMqsfqnWxiyCLROqdeyMdHHrq1ItWRLG4J+muOYRCBdKl+hXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=g/FKDJcD; dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b=g/FKDJcD; arc=none smtp.client-ip=140.77.166.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.ens-lyon.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="g/FKDJcD";
	dkim=pass (2048-bit key) header.d=ens-lyon.org header.i=@ens-lyon.org header.b="g/FKDJcD"
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 57305A03D3;
	Sat, 29 Aug 2026 18:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1788022186; bh=88Tvt14j/PBzQktSgAwjl/vIHMlPe6nvOzRpz4jg/dA=;
	h=From:To:Cc:Subject:Date:From;
	b=g/FKDJcDtiZvo7bj8pjamtBqwx7z0BGK4HIlvHwLF1438Qv9lq2qS4zKeOy8jwfYk
	 WY9yldk7QOZKO/7yPnI5zte2jgAvK8vXK5R5jexMInMK7fqCg4bbx1ILtwA0kQm3EF
	 J6K8s6S9aEsO9fb8NE6EvKuki2YvxalwxVFXRa/p5nSteFNtQif/4mqFmwsgjwamt8
	 U5poQzw6ztL72IYoTlBlN1BmMEeETM56AqiFPR6ISvYIDhMyDjgPu9zuRbcngyypRV
	 AHqnuxT4Yg9M9vtmfCy74upICoIwkIqBqrCLVy+ib6hjDSC7LAqOLZzc/vnYtUvcm3
	 lL2KE2KG5j5tw==
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fn4GmJbmDoY; Sat, 29 Aug 2026 18:49:46 +0200 (CEST)
Received: from end (aamiens-653-1-40-48.w83-192.abo.wanadoo.fr [83.192.199.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1DBD4A035B;
	Sat, 29 Aug 2026 18:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ens-lyon.org; s=dkim;
	t=1788022186; bh=88Tvt14j/PBzQktSgAwjl/vIHMlPe6nvOzRpz4jg/dA=;
	h=From:To:Cc:Subject:Date:From;
	b=g/FKDJcDtiZvo7bj8pjamtBqwx7z0BGK4HIlvHwLF1438Qv9lq2qS4zKeOy8jwfYk
	 WY9yldk7QOZKO/7yPnI5zte2jgAvK8vXK5R5jexMInMK7fqCg4bbx1ILtwA0kQm3EF
	 J6K8s6S9aEsO9fb8NE6EvKuki2YvxalwxVFXRa/p5nSteFNtQif/4mqFmwsgjwamt8
	 U5poQzw6ztL72IYoTlBlN1BmMEeETM56AqiFPR6ISvYIDhMyDjgPu9zuRbcngyypRV
	 AHqnuxT4Yg9M9vtmfCy74upICoIwkIqBqrCLVy+ib6hjDSC7LAqOLZzc/vnYtUvcm3
	 lL2KE2KG5j5tw==
Received: from samy by end with local (Exim 4.100-RC3)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1x0MFV-0000000BI8T-2RRK;
	Sat, 29 Aug 2026 18:49:45 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: gregkh@linuxfoundation.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	linux-kernel@vger.kernel.org,
	kirk@reisers.ca,
	w.d.hubbs@gmail.com
Subject: [PATCH 0/2] speakup updates
Date: Sat, 29 Aug 2026 18:49:43 +0200
Message-ID: <20260829164945.2691317-1-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This update include a minor deprecation fix and a NULL-dereference fix.

Samuel

Ajith P V (1):
  accessibility: speakup: refactor deprecated strcpy

Samuel Thibault (1):
  Fix NULL pointer dereference on VT switch + selection

 drivers/accessibility/speakup/selection.c   | 6 ++++++
 drivers/accessibility/speakup/varhandlers.c | 5 +++--
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.47.3

