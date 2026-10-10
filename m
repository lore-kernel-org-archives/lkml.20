Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76782BEC3F
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791639410; cv=none; b=eaIRt3lbxaLnPPxSJyS808PIULzFEAB8kYDvQNsZreMFbhsQssHz1tO9dHG2H5IRttfW189ur5nyZVLGbwpMFurhIPdTHuSb+Mcp5zRDrlaiFttBYb2AwJCrROM98YORBFbKjqxWP8IYViDDaTQWXMzlHUwnnqTH7+lce/OKbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791639410; c=relaxed/simple;
	bh=6KiHYHjMov1ukebyP/sqOh57olhCUUUkOaT24ZnjflY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PxjoeC9B2PvzeIeO3+NFVxrtjnZyvL2Z4qn5apBrW/nNzE5Mbqljgl7Hue4NCDItHDFUMJYBtKSNFPhlGoDDN/b/S0e1GhhdzLPsenuHtfmtOl4jgEX/t0mkoAsZWTEw/AMLWzJy3SmBSl+iBi6Kwthhm7OD7RzMMb9CNlWZmtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-imam.nu; spf=pass smtp.mailfrom=bit-imam.nu; dkim=pass (2048-bit key) header.d=bit-imam.nu header.i=@bit-imam.nu header.b=MOVgI6CY; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bit-imam.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bit-imam.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bit-imam.nu header.i=@bit-imam.nu header.b="MOVgI6CY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bit-imam.nu
	; s=ds202606; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=W5OCsN0cyT9Apx8rkzX/txBY3io7nJkPUXgz3Oqwtfs=; b=MOVgI6CYokR63Jlzeedsc8Pib+
	2RiuNBzzIiwGhuXP464VdQNWXI9MNQSPXln2gO/UQjq8qfRccCL4PIHoea63ya3ILBHIK+RUya3pn
	7+7HbziuCCS3ufdVmOAonoXcqqP7fyLNc+z6q86E/rT+5k7RkITV/HIRFTnvkJ9vi3IoS84+/bStT
	XalQDY4rXPmhzD+/5X4SFzCJ92yI72B8GJigLJgrwpB14IIwwG2DpkzK6yXvQO4qj6HHd1UkJSmk/
	ydzf//sUAaMrAO6mzbIKyZJEmkiGJjhkQtGIVPJwjyUP0zVcyYDwQ56erUue87OaHU3pOTYKXHze1
	nDRbQ18w==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xFXFh-005AKF-Dp
	for linux-kernel@vger.kernel.org;
	Sat, 10 Oct 2026 15:36:41 +0200
Message-ID: <620a39f8-6858-4e72-9961-64489bfca912@bit-imam.nu>
Date: Sat, 10 Oct 2026 15:36:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bit-imam.nu>
Subject: Hacker, Bit'er in one: Qufi, ITx, all of related system work in one.
 (cont. Fair Pay Philosophy, Low Jitter)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I have unified the concepts Hacker and Bit'er into Qufi, nearly a 
standard term in philosophy,  becoming fully this.

And ITx is all related system work in one.

Islamophobes will reject, and be given Windows, Graphics Card, and Bloat.

Open Source will be fair pay, FIR as IIR no-gfx-card, and Fit.
Ultimately winning all.

My research: https://bit-imam.nu/

Serenity!
