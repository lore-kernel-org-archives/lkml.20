Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9BC386C08
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 21:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788643510; cv=none; b=O3uY8yWLxyEJFVNGYIouz7h5Du3WxcZ8E3415qmvy4B1yxsMWNPW88KoK56W9Y+krJDYBr3xUId/vRT8IJ7duWOo/Tg7QNGpxEjxfX/zDtO2M60fSKA2QhhCdfa48PK0Gb5g8fjiwtFJFgIad3TwacrTRcUn0GiBBDxUdM6E/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788643510; c=relaxed/simple;
	bh=KFl3QjXpv9nhIG/x1LKrR7qfShkCbnA79NvK9lgP9SI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qFxOHg3n1+qMK5p3dkg/fiBje1ln2bYBCxKRnkn/F4G0hycjTXFFQSSENpzvkSeTWbzY23LxO0CuUMmZ0BBWHG1aeYp1TciDcfjrDnJiEnvWSBXIJ1zGiyi8fUq5fWKcCWWlOiBksCpFSEbsBUyKUupY34n6yy0vRhXW7LeB+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rVVBS8pC; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=S/GNNVv3; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rVVBS8pC";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="S/GNNVv3"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788643484; bh=KFl3QjXpv9nhIG/x1LKrR7q
	fShkCbnA79NvK9lgP9SI=; b=rVVBS8pCF5TgA/tIQI4tMoyw2lrSpHy9pfYUPtYPOICATgtV9l
	KMAEPX3TvEY8vSail5LTpzyb0np4+VQ5c5OKg8Mwm6tqPd/0pf+AfVeQ1hstJzCiyBORyjpRF6Z
	qxMVcgk2KaLrApk2JKH3TvMrQnYy5YprShZnJ9sHYrUlUiP6UfzWrmjLMzgow1wq3prCqMPlYpz
	lFA2wykvzbOlzrBbSkgEpfgJibH60DQ0aTRjJkw8rLlBLDt5ATQqLrSZGwWglUQXDaBAIPy4nUp
	9BQ9AVVhrmqWSu9OCye1xnqztTJf3WFTQ3tqyxh1PY46/CpcVi2rI3yFecOCY3XMlug==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788643484; bh=KFl3QjXpv9nhIG/x1LKrR7q
	fShkCbnA79NvK9lgP9SI=; b=S/GNNVv3L/Mpw1YritDEgMZ7mmPQzD7OBmVoFH8rEduX1HLqyw
	cgBAvQRdYjfwKIsFhIuz3HvHyqjNyXC0kgBA==;
Date: Sat, 05 Sep 2026 22:24:42 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Thomas Gleixner <tglx@linutronix.de>, liushugao@xiaomi.com
CC: daniel.lezcano@linaro.org, frederic@kernel.org, isaacmanjarres@google.com,
 lingyue@xiaomi.com, linux-kernel@vger.kernel.org, weipengliang@xiaomi.com,
 wengjinfei@xiaomi.com, xiongliang@xiaomi.com, zhangjiawei8@xiaomi.com,
 zhukaiqian@xiaomi.com
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=3A_=5BExternal_Ma?=
 =?UTF-8?Q?il=5D=5BPATCH=5D_tick/broa?=
 =?UTF-8?Q?dcast=3A_Plug_clockevents_replacement_race?=
In-Reply-To: <87h5k34cob.ffs@fw13>
References: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org> <87h5k34cob.ffs@fw13>
Message-ID: <4FDB69E5-7DEE-43CE-A66A-23A2D8DC987C@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 5 September 2026 22:21:24 BST, Thomas Gleixner <tglx@linutronix.de>
wrote:
>On Thu, Sep 03 2026 at 16:12, Bradley Morgan wrote:
>> Hi, I have a pixel 7, if I could be asked to backport this, then I'll be
>> happy to, for the fix, add:
>>
>> Reviewed-by: Bradley Morgan <brads@mainlining.org>
>
>It would be helpful to respond to the actual patch and not to some
>arbitrary reply. That way you might avoid your tags to be overseen by
>tools.
>
Sorry my mail client sometimes glitches,

+Remove anna-maria, she's on leave, and she sends OOO email.

Thanks,
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
