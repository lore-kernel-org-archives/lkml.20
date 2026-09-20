Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1C53C4557
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789886602; cv=none; b=fArM7CfX3xeQ133k/dg21m1vLdv753tg7YoCcj4NJgkTdv9FjkQIw5CKCgMdS8JOVJtsJqhTWKZ19O1heqQMYIynxMfJhC1OXXpyIywAuDUFAPi0ryAMBibbqNQt6ylVfPPrA1/L2Ffs7hXLJIiwqHpVwmizftLfwMeup+5Oa3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789886602; c=relaxed/simple;
	bh=hidNTZSs7z/gGn59DIcGBVed8XhsSLKf2vOVFuyd/LY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UbBvm04Y6dWShQEISTGzNN+VWj3CalzXHWRpNMJyoAPFkiW01FUrs42MFlyMJZXYhl4gYRaCBbQMAuIAl6iabgeME/AniVNL48buWm/d4R64Va9ODEM8sa9Ikiy4LRsmjFzTcLPFd4OKA5Yi8u6aBn5kaYPkjGeuoyD0bIhnzOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=vzz0AJbg; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="vzz0AJbg"
Received: by dvalin.narfation.org (Postfix) id BF3BC200E4;
	Sun, 20 Sep 2026 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1789886592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AmfOpn0VWWy3Tsnz0UM5QQh4OihdaMTq/EtZTTj9KQk=;
	b=vzz0AJbgAhUeDHqksixpZnVxz6A1xpmFfdyx4PqbuDFvOBRhvFV0AxdRDMMvOIODVcDoc5
	7+2UNPMtmqhR6kCg6oDNgBpGabJfaupatXPRgKH88b/6fi9U5n6211Na0q/Kf6DmK2IM1l
	SmhRXiGdbUvI9vFX0w17bZHl2Y5Ug04=
From: Sven Eckelmann <sven@narfation.org>
To: Marek Lindner <marek.lindner@mailbox.org>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Antonio Quartulli <antonio@mandelbit.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 b.a.t.m.a.n@lists.open-mesh.org
In-Reply-To: <20260920022722.3145774-1-peng.fan@oss.nxp.com>
References: <20260920022722.3145774-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] batman-adv: use assign_bit() where applicable
Message-Id: <178988658272.12473.15213520390601170124.b4-ty@b4>
Date: Sun, 20 Sep 2026 08:43:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=297; i=sven@narfation.org;
 h=from:subject:message-id; bh=xDxiweT7X4s66vbzudAwklUnEm4le5OIOMnHIbcdNTA=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDFnrG6oPPsn9LBgg+P5I4uIvKQz7VN9dcNz5+9HuB1/st
 Tsyi3bM6ShlYRDjYpAVU2TZcyX//Gb2t/Kfp308CjOHlQlkCAMXpwBMxOYfwx8uyShWX+ZDYuEp
 UkeSPRQZ+Owfu69+e4Dvh3r7KgX+R5cZGaZpBzluOb130xMLqRfRJ4PUBG5WW/Gu3htv6t/0/eW
 qWZwA
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF


On Sun, 20 Sep 2026 10:27:21 +0800, Peng Fan (OSS) wrote:
> batman-adv: use assign_bit() where applicable

Applied, thanks!

[1/1] batman-adv: use assign_bit() where applicable
      https://git.open-mesh.org/batadv/c/5afe6b0d034e

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>

