Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AC63EDAB8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518498; cv=none; b=SGjpxodh5h9PzaT1by8JHYvq4oQ/HYpHYJ6B5e99UNpqZftl7x0XXbMyxdCZ77EL21HqN761a7CuoPDtWGnQq8wpcItus20G5uXj3bzyN2AC7vEL8Q90IF+oODd51c+HoeRF8uGUzGulQerAGVrqCib4uH48xwcyQcutLO7esFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518498; c=relaxed/simple;
	bh=8CyIpSUtW5EYdUq8Tz9rhZO3NPcSKXUpmOzEcYadyYM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D8VHlQX6Akj3Frna/OebLLV/gf1xuBhb8PPv6yX4b1l8GtpXJFtPmw/B4N/BjB7BcgFFjqyYF0a7R2wGpYt65/6KtrxPRzAakwvAJiyONqyo1uoTez+SAhoGxMb7bmr9XVQadBqk6rDW554PhlOANHVQF6kR+iID7crK03Dp0LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=AvPZFyKw; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="AvPZFyKw"
Received: by dvalin.narfation.org (Postfix) id 24B2D202F3;
	Sun, 27 Sep 2026 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1790518494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EzcO6WM2z4y/JhOjZDRBSmhARn259FsRxPqV1J4V2gg=;
	b=AvPZFyKwJLD/y8CPtj5j0j7qqgvRwdkYYdBDbvwfHh+9JcmLhMm24TC+FhAPGEVz63WpUV
	x4Zb+IWBHdQ884wKZfQTQDv+fiplh11GCwPGneKlo+YVvDi6WaZZKtVLEWF/3wdedhff8Q
	I9Cg/P7uekdAUzA5VxkmleW/cT9pYxk=
From: Sven Eckelmann <sven@narfation.org>
To: Marek Lindner <marek.lindner@mailbox.org>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Antonio Quartulli <antonio@mandelbit.com>, 
 Chengfeng Ye <nicoyip.dev@gmail.com>
Cc: b.a.t.m.a.n@lists.open-mesh.org, 
 =?utf-8?q?Linus_L=C3=BCssing?= <linus.luessing@c0d3.blue>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260927101624.3812927-1-nicoyip.dev@gmail.com>
References: <20260927101624.3812927-1-nicoyip.dev@gmail.com>
Subject: Re: [PATCH v2] batman-adv: Close OGM aggregation before
 transmission
Message-Id: <179051846810.161654.4949360252053674460.b4-ty@b4>
Date: Sun, 27 Sep 2026 16:14:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=311; i=sven@narfation.org;
 h=from:subject:message-id; bh=EDVFnN9pEiku9y9JdkPvVGcfHCnHE5m/l20yN5lDlbo=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDFk7VW4qcAVyBj9w3hJdOWX1yQuJj63THjL+dji2o3/P9
 Nt+xrKrO0pZGMS4GGTFFFn2XMk/v5n9rfznaR+PwsxhZQIZwsDFKQATaVdnZPgntvHuqoye67bF
 WS6HW7kecVy0b62e2e0WZ2haPvP3I16G/wUXf01aG2exvJdJ/UCm+vuDS6ZNnSW6ac6ZJ1EnD93
 kecAJAA==
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF


On Sun, 27 Sep 2026 18:16:24 +0800, Chengfeng Ye wrote:
> batman-adv: Close OGM aggregation before transmission

Applied, thanks!

[1/1] batman-adv: Close OGM aggregation before transmission
      https://git.open-mesh.org/batadv/c/c31a4d235404

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>

