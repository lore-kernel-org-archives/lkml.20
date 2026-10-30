Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351881;
	b=SROL41Np74gKQLNLvfp5/YOCpWIDrjs8V7iGZ75osCO9y6yHjMy4xfBRTqabpP5bA2Ew
	 xfeOa617GhMevBolJqzkBiqfAfeIq09ES7aRsUtW16l/mPVlh/ts1chgP4PpDR3pN4u5M
	 J9cOZFQ9Lb1cwPga1Ozja2THjlpaHcBXxTQg0P7967Ika/IprjO8i+VvkyPr9FEh79uPI
	 EQvy1IiqYhhyYn7wfDjBbQQfx5+yMhzJw67BI8nlWZXtWUQSvHJc4+GxJzVvBqYaHtjTb
	 U4fTOD5c5JLwQ2FoP5pmrdaXCy8CUH5mqaDHJ4l6T09NzM2337tklkcvgOgjSMos8oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351881;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=HmQXP6gzBGluuaBJcSrqbODuk2l6xoC3Nu7Ij2eiUxc=;
	b=IDK3ww8nFYR3ilH0KWdWgoyrGSK44S/k3xTww9BfKQGFPdKpiG87kfAS8B2s4M/MZ0XF
	 n0ihdN2qk5Co2Wzannnkh0KPlbkFdECAZe32Txw87GcdM3gnUAlKNmSu/etyJFaBJzaaI
	 wsGfsez82ugJwUO47HlHvaXgNaZiaFG5PMjL/mJ9t5ewTagBRdrlsuCkiieH5FyOl6P4S
	 GE2yYFmQaM1EuaKZzneydvfiOzhpAPdOR2j3RJkpisDntXMVb5VmpUZv7vDRwGHJcDHFA
	 0wNXmv6YvpR5Wo/QWklbafvWDDxJGOSHcpus7jbmD2KOzaJh7h9fph0KYtYRLM164Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=narfation.org;
	spf=pass smtp.mailfrom=narfation.org;
	dkim=pass header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=iQV88Kd5;
	arc=none smtp.remote-ip=213.160.73.56
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 3E3B2606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E3B2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=narfation.org header.i=@narfation.org header.a=rsa-sha256 header.s=20121 header.b=iQV88Kd5
Received: by dvalin.narfation.org (Postfix) id 2E2BC1FF7B;
	Fri, 30 Oct 2026 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1793351879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HmQXP6gzBGluuaBJcSrqbODuk2l6xoC3Nu7Ij2eiUxc=;
	b=iQV88Kd5x3Gh8mrDdTDvRVUuGFJ9F9Fs+InmShzfW4YwDZXvL0dMII87kkv43vDBSEVvtr
	S+uV0iMUO69AOnvS4Bsu5LD9cijeGI2i5r0nvW7XUhdWyzEFY6C7cG2knWdSiWbJeavNmb
	xIfCzWhZ4jQv9qU1nPR2XJd3GB/pcws=
From: Sven Eckelmann <sven@narfation.org>
To: b.a.t.m.a.n@lists.open-mesh.org, Kyle Zeng <kylebot@openai.com>
Cc: Marek Lindner <marek.lindner@mailbox.org>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Antonio Quartulli <antonio@mandelbit.com>, linux-kernel@vger.kernel.org, 
 outbounddisclosures@openai.com
In-Reply-To: <20261030042146.73797-1-kylebot@openai.com>
References: <20261030042146.73797-1-kylebot@openai.com>
Subject: Re: [PATCH] batman-adv: mcast: validate tracker padding before
 forwarding
Message-Id: <179335159629.2015734.12351778845482914326.b4-ty@b4>
Date: Fri, 30 Oct 2026 10:13:16 +0100
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=sven@narfation.org;
 h=from:subject:message-id; bh=VCz6BsN4NIu5OO60GpB6VBIoiCYJ/C2oF5GKMYuBNQI=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDFlPEo6I1PX9LEisLgnznlssHbojUHVPTAhr/rT+i7JWa
 z/5NP3vKGVhEONikBVTZNlzJf/8Zva38p+nfTwKM4eVCWQIAxenAExk2y+GfwbMxe+3xp7wMLFy
 UX1w5P2idqa+q/1B656G7tCOLvh4/iTDf/fNrG/y7/9Jz0x4ud+hKrTj34S78xueaZ7pdencw9M
 qyQ0A
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF


On Thu, 29 Oct 2026 21:21:46 -0700, Kyle Zeng wrote:
> batman-adv: mcast: validate tracker padding before forwarding

Applied, thanks!

[1/1] batman-adv: mcast: validate tracker padding before forwarding
      https://git.open-mesh.org/batadv/c/ea01fff30f63

Just two minor nitpicks:

Please add 'batadv' to the subject prefix '[PATCH batadv]' to make it more
clear what tree is the target. In this case, it was clear because this (single)
patch series only went to the linux-kernel and the b.a.t.m.a.n mailing list.
And no one picks patches from the former.

The other one: d89e1d186ec9271bf78e62771779e9fc03bf0fc3 is here the base
commit. But it is not even in our tree. Please try to use a recent version of
the target tree to make sure that it applies cleanly and that you are actually
testing against the correct source code. The other patch which came in today
had for example conflicts. Yours luckily not.

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>

