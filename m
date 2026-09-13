Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985392FF672
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332052; cv=none; b=C3dkvwlXbB+sxYrTDWCpW0tcUI60JXv1VeNzZ1Tpwz3ww5fHZeRx5369Tm2s8W4BLRyKyy/x+VE+D/oSlXG6ya71G7Lkc/Wrayi7nuI4lnwl8Qhs6tZzCD8JWfIAgeI5iJXGmzxIojVfKVUlQPXLCOfQI6pRKRgTPjsEnxhIK9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332052; c=relaxed/simple;
	bh=9foP9rHIso+yrh+AnWJbgJEpeUKiqbmmhaOFdx2M8Rk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fsfCZ0RsU8wNqK5kNWJyOPRhpr6u/ZpWyjGxLIm7Y2DFsyx5+vqL728kvpJeJ1Cct+hRJ+WKi2Exo/Hjfe0qFJAQowK9cVgXwTi1FxcRfZQRrP7xoOosocRJay92H8xCFP+9U79BXQukXVPDRVyUf8BTs2hren5aR8QtNhdMUCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=nL6S+nb+; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="nL6S+nb+"
Received: by dvalin.narfation.org (Postfix) id A1A7320494;
	Sun, 13 Sep 2026 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1789332042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zOivew53lYQimag25k053P+EGewrJVVN5pwPAic17W8=;
	b=nL6S+nb+fUmyRyHdw8cG7JrsO+RGb5a3Cu7uTS8aHwKBfFQUhD1i4AtRSWLvNQuuy4V5mw
	qv1l4O52+WvpRITmboURKy3xjNFeR8ozogKCMqmq7Feya5+AeN2P2uzlyzUV+CjY+xyU47
	w3MyOBLu+IjV0xPHVHlrch1iOTrkH9g=
From: Sven Eckelmann <sven@narfation.org>
To: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com, 
 Deepanshu Kartikey <kartikey406@gmail.com>
Cc: b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org, 
 syzbot+a079f084653164a652d1@syzkaller.appspotmail.com
In-Reply-To: <20260913031906.14809-1-kartikey406@gmail.com>
References: <20260913031906.14809-1-kartikey406@gmail.com>
Subject: Re: [PATCH] batman-adv: avoid WARN_ON for orig_ifinfo allocation
 failure
Message-Id: <178933202450.57204.5532409907448313172.b4-ty@b4>
Date: Sun, 13 Sep 2026 22:40:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=331; i=sven@narfation.org;
 h=from:subject:message-id; bh=eYsNVsNB9+bsKCx0GV0fy9SH21fqFrQU7cvFVnwiqy0=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDFnLuVx49/Md39MUp7360LFf0r1CMqaes+8U7GYVWfftR
 a63c8f+jlIWBjEuBlkxRZY9V/LPb2Z/K/952sejMHNYmUCGMHBxCsBEMpcwMqxa8nKrmbxMiFHT
 /hmBfqGV59dkS263uGGe1vClUzLXlYXhD0+nkuKO7gqfmAtzGk1tuHa1nH0d92+SyOlMu8rfM5Z
 WcgIA
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF


On Sun, 13 Sep 2026 08:49:06 +0530, Deepanshu Kartikey wrote:
> batman-adv: avoid WARN_ON for orig_ifinfo allocation failure

Applied, thanks!

[1/1] batman-adv: avoid WARN_ON for orig_ifinfo allocation failure
      https://git.open-mesh.org/batadv/c/abfe281aeab4

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>

