Received: from mail-106104.protonmail.ch (mail-106104.protonmail.ch [79.135.106.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494A4485CE8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134991; cv=none; b=p1PXF9ekC2gzTc9JhuIc4pkQAPl5CdOnQbAbJGvkFFsk8BGetFYsbpU+6RBGyGpZf1abXsb/36GjeV6kPqcd6SEYocvRWa+nbOFuxm727ipE4Cq9wmqs117r8Gc90JdExK/KWCq00Rimjsje2z5XEZcCW3nSPMOO6TU3QBLWEqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134991; c=relaxed/simple;
	bh=k1+0j7J5ZpJI6TOnTARAeIZd9s6jvK/5CqiSBqtUMYY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G7Bz6tyobzhkPoOcozU7CJ898t1SEjgKi5E+SExnzdPaZGHjy9lL9zb+0Oc6MSnAqUNbzPxWndkLTbDhCHp+Zk0iiC+jSL6grrp1I7vl687vZPnWF7UkWj74iLn2QCmWoHKgQWIg03YnxF1o86Uk5yJ/wL9nQcCq8aUJ/PeuWcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=dunsq/Mn; arc=none smtp.client-ip=79.135.106.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="dunsq/Mn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789134978; x=1789394178;
	bh=k1+0j7J5ZpJI6TOnTARAeIZd9s6jvK/5CqiSBqtUMYY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dunsq/Mn8xVosr7i3Y5QIn191VbPt7R79Cappcalygd+G7f51hFCKhxQWEByVDQqk
	 C9XOJy8FZl6sYjILcuYr+HTp7BOs5wFPA46v7KDKurzuk5QYVtXQO2SAiuDy0FI3CO
	 UJt0DuaFfYsmMXTCdwREaOC1cbSA/EkcPZ00IUTduD9ZClDHkRmeP6LnD+b7vgHJu0
	 7GjHtg85uUGYEuVyAFiflj6uh8ZOplCoztxe8I13crWSAGGHBT8ib7ngbRydLKw482
	 PZ0hhSEvpkGw7FJ2rV7JP4vwsNw5YpK3i2SOdbz6EwOFOE3Je+lKMKc8aIC13mya0M
	 K//TgZR4CT71Q==
Date: Fri, 11 Sep 2026 13:56:12 +0000
To: Conor Dooley <conor@kernel.org>
From: =?utf-8?Q?Juan_Carlos_Guti=C3=A9rrez?= <jcarlosgl96@proton.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
Message-ID: <bZv581NjWaZxsz6ThV-eRGTh4T_Cs4KEkXCXp0A_nsjcF7A7LCkChZVBb4--RIFJO1NvhHiSqT9aoVj42MsvzSMzqkkPTqbW3nRcZMH8UgI=@proton.me>
In-Reply-To: <20260907-stock-eggplant-d03a9df18a22@spud>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me> <20260906-b4-spc-glee-a64-v1-v1-1-621df2155e31@proton.me> <20260907-stock-eggplant-d03a9df18a22@spud>
Feedback-ID: 47397442:user:proton
X-Pm-Message-ID: 2a1c6f3511eb1443dbd2e5cb49c9d77de84032c9
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Conor,

Thanks for the review. I have changed the vendor prefix to onspc and
updated the board compatible accordingly in v2, which I have just sent:

https://lore.kernel.org/all/20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@p=
roton.me/

Best regards,
Juan Carlos

