Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178873BED7B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161844; cv=none; b=VBJBiqLAEfUp/pKpONldjJkf6Qwf8MHdRWwbv0AuU/YIcBKpooA8Wm2FH7VoWwuVJ3AprhomxXl7pIeiXCWnzUHZA4OgoQ8Vshe/hbvTVojkZOYFQopoWkTdO/sRcDMRXinR45fN7T/CF91X8PWSUYP7+iOV1ohLii0ZaTGug8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161844; c=relaxed/simple;
	bh=MybcKbRn8vPMw2FdR6CSR6v2UiBpWU9l819wTpv9Aes=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=KEqBhU2fEkn+ipbnnK0+O8gFkVsAvZv/1Y5fs8XIGNMRW70ckwW8csnMh147Eop5SQZEY5icR0wxxzUkdDO6MEu/5akHDDCQDLKFRf/9l3iCsGVEQ0lu32rO2XB5fn7QAFz//csE4PrKgUb4b188f6s8UIBMK2CHR9gmhkWYLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqOrzr4l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqOrzr4l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807FF1F000E9;
	Mon, 31 Aug 2026 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788161842;
	bh=/6u4YzIWHtkU9ystADvq+TmxhJSTLpTiJEvlTgSovaM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=VqOrzr4lVKwvi7loVALD5Yfb8E0qq5ydMfagKPHGBuRO3dKFmEPHrVj68msnHSn5a
	 fUhddW4gGfUW9LLRl5dzELOMWH9UeSAzwM2O0fwgaCbwGua3I2PcJhjoQmLlqaS8MO
	 OVz940K7kiEmo9w2qroqB40NwT3boLxS2bge2tGDQrHoUXG91qnqJXOf7rYBQ46UQN
	 Kw4sqFw00LvJuLn83zvoya6C7c3i4q5TV7ID2UN24CotYHdp/YHR1y0i6+pZT973qz
	 wTUdcVZaEhxYKaa/65lxsUDaVu33FGedjqD5BfF+w6cOPN/PZWz5tWBcb3TTiJiZVi
	 AU5BjR50LutQQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/mm_init: remove zone_absent_pages_in_node()
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org
In-Reply-To: <20260827144151.486192-1-ekffu200098@gmail.com>
References: <20260827144151.486192-1-ekffu200098@gmail.com>
Date: Mon, 31 Aug 2026 10:37:17 +0300
Message-Id: <178816183737.3691663.7482057515031348878.b4-review@b4>
X-Mailer: b4 0.17-dev

> zone_absent_pages_in_node() returns 0 when the zone is empty and
> otherwise calls __absent_pages_in_range(), which already returns 0 for
> an empty range.

Right, but it loops over memblock memory for an empty zone to get that 0

-- 
Sincerely yours,
Mike.

