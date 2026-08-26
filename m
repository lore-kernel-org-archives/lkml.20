Received: from mailscanner06.zoner.fi (mailscanner06.zoner.fi [5.44.246.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99B471263
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.44.246.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787767997; cv=none; b=cE0+o6IhgCwMx4XX32/vNHpzWSEkvOuBKVzkymdynfu7Wsr5jKtC4hR/U4yZ6bQulFYGpgyzwrhObO8SiUreetn8iVf5SGROFfSXNGQbIS9B39qKVHnbgp89Lem7lpZ9etHDqfKGK8g2PIthQnf8QaIBamglAvARQp1m3HJsqx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787767997; c=relaxed/simple;
	bh=X65nSEuskTGTsSHnWxkCOIVOUsoPIOxiAuJP9kzUgVY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IiyMd8BFT+AYoGkUgYqX0qOwnZoUtfQzD+9pD6TunvU6D45ucfyrlZdo33InhAbl2c8doqe4bGRXofzgKYqxH/p4m07cL6+SsUHa6bWyFNwnPRVUdYLlJ+GiVuUXfgDJy3rV44+8W2CrZshT+LVxAImRwm/8yhTHfszPzV/9FCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tukaani.org; spf=pass smtp.mailfrom=tukaani.org; dkim=pass (2048-bit key) header.d=tukaani.org header.i=@tukaani.org header.b=NomjpxoH; arc=none smtp.client-ip=5.44.246.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tukaani.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tukaani.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tukaani.org header.i=@tukaani.org header.b="NomjpxoH"
Received: from www25.zoner.fi (www25.zoner.fi [84.34.147.45])
	by mailscanner06.zoner.fi (Postfix) with ESMTPS id 541F9210CA;
	Wed, 26 Aug 2026 21:04:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tukaani.org
	; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description; bh=0HdJu75N6+GHN1fOYHeYzpliVPotgV/zGFR14ymSyd4=; b=Nomjp
	xoHiAaBZTjyVPMc/EfE99ClF/fuuJhvXrT8RFIlP3TJ0Je9YhegBJWucPBn03bQ5eOAOodbArDWLx
	Of3/yBKLmeQY/kRQcNXuriOLXQZMf9En8ZCtdfsC5qT2VPfLzxe/5fRVw8ENg4T/bZZ8P2zgcFnIy
	Jqu2kyxXds0oXyghRgsS9jHMSZwrYAaBTtQhRPnkR49IkIPEVJlQowpRlLI47G4NU1i+kdjnFfEdP
	d3OJLFVqipzHDXA+T6cBjM3zAVEWFozBtj2nYGBGsshVlokwu5pF09t/XsumdyTj0WRZZxihsJo73
	e6C5+GIe75ZDMNfgR9VLq6CjRQ1yA==;
Received: from mail.zoner.fi ([84.34.147.244])
	by www25.zoner.fi with esmtp (Exim 4.99.5)
	(envelope-from <lasse.collin@tukaani.org>)
	id 1wzHzE-00000006iBp-3Xt7;
	Wed, 26 Aug 2026 21:04:45 +0300
Date: Wed, 26 Aug 2026 21:04:40 +0300
From: Lasse Collin <lasse.collin@tukaani.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib: decompress_unxz: fix memory leak of 'in' buffer in
 single-call mode
Message-ID: <20260826210440.66213ad7.lasse.collin@tukaani.org>
In-Reply-To: <20260825230852.00121856.lasse.collin@tukaani.org>
References: <20260825191333.34276-1-skunkolee@gmail.com>
	<20260825230852.00121856.lasse.collin@tukaani.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

The diff is good, but I would like a different commit message because
there was no bug. I wrote a suggestion below. If you think it's OK,
please submit v2 with the same diff and the new commit message to
Andrew Morton. Thanks!

----%<----
lib: decompress_unxz: Make it obvious that there is no memory leak

Calling __decompress() or unxz() with fill == NULL && flush == NULL &&
in == NULL is invalid, thus there were no memory leaks even though it
might have looked like that. Move the conditional free() calls so that
it's obvious that there are no leaks.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=207113
Link: https://lore.kernel.org/lkml/20241006072542.66442-2-t.v.s10123@gmail.com/T/
Link: https://lore.kernel.org/lkml/20260825191333.34276-1-skunkolee@gmail.com/T/
Reviewed-by: Lasse Collin <lasse.collin@tukaani.org>
----%<----

-- 
Lasse Collin
