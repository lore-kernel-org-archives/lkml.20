Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3557980C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965125; cv=none; b=C8bv84IX7E9GfX4D/XIJWOsLFa78ab+8XdMOaR42Qbv1LoUAqkViHbcsgtFHxLnJ0qSa9hjyVwFhGGj7jIgA1wyT97aXBDjyVkUMqKj5uefZHSXymkkU1vVeq0HnLPS99dqynKNSZRzvfKwdsf5a2hM4zyATbL0+IZ0jg+ddkvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965125; c=relaxed/simple;
	bh=qgX3F3/chBJajEYG6ONnqTkx0UeYX0YlLIoI1meGgyw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=W4swOIAoqbs8ygw0FUz2bFXHDCf7kpPnN40sMkuo+eIo//vlK2DvoZZ9qSgnUz8WbqXyPhhHyZthLFvtfgdGBubwSKZ1lPo8aqewrT+0hC1iw5+LRaEpuUcY+V6z5e5vTowft3xWlLaXQuRUjPEvyhvtWrKkWlKKuIUEel4J2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rwXItU7p; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eQ332XR5; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rwXItU7p";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eQ332XR5"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788965108; bh=Wm2geJlbtGbU92IZqu+eW8m
	0JT5CwaWOaBBT2z+SwHo=; b=rwXItU7pH72zB0D/BX831s78+axJv8WNyiUVJbPbmr+v+ca0iv
	Kp3yNZgIdQmLiSgld1J/BCxtgtSxeME+4jWvWsc9e+X4IlgoXcgBhQXU+cL0tnlaoTVAd4ySEQx
	i06xtXV6G0oYdk8QxofW096Z4J8JSwmJ8AVo36GkwYATG7j61Vm7Eda4NVACexD0LtomlsW1hIF
	8Qq9kgOD9J7SY4OkqP1fCO/pUHVqnpqCZ/khJ5czQdZGWVCIOj1eQuNERQYnx+nwDZzz7NkdSzB
	kGVG3vBcyQzKTifgKzF1Bzg9+xptPOAkeXlbv680MmFQ/89BcTeW460/mE65Mjpbpmw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788965108; bh=Wm2geJlbtGbU92IZqu+eW8m
	0JT5CwaWOaBBT2z+SwHo=; b=eQ332XR52iPJulGnX5vlJ+6ddc6RAyiihpHC5U83VmpXXhWnrn
	P9cvLPGuSD7cYw9NHLY7KpxQ8o5zk6ULRXAA==;
Date: Wed, 09 Sep 2026 15:45:06 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>,
 Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <aqEhTIPqoKj98TRS@J2N7QTR9R3>
References: <20260825205839.14571-1-brads@mainlining.org> <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com> <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org> <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com> <aplRx8f5NprO9dSU@willie-the-truck_quarantine> <aqEhTIPqoKj98TRS@J2N7QTR9R3>
Message-ID: <CEB74969-03F2-4F98-8FFB-625A39EEAE7D@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 9 September 2026 10:05:16 BST, Mark Rutland <mark.rutland@arm.com>
wrote:
>Hi Will,
>
>On Thu, Sep 03, 2026 at 11:53:59AM +0100, Will Deacon wrote:
>> it's worth noting that Bradley's patch _does_ fix one of the
>> hibernation problems and has been tested by Vladimir:
>> 
>> https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/
>> 
>> I would prefer to take your complete set of patches, but if you don't
>> want that then should I just take the above for now? Prior to this
>> series, there has been no activity for nearly two years on your branch,
>> so I'd prefer to get _something_ in, even if it only fixes some of the
>> problems.
>
>Sorry for the delay.
>
>I'd prefer if you picked up Bradley's single patch for now. I'll follow
>up with a respin of the rest of the cleanup and fixes shortly.

Oh, so I didn't need to do all that? Urgh..

>
>Could you add a note to the commit message as to how Vladimir was able
>to trigger a hang with CONFIG_PAGE_POISONING=y and page_poison=on? It's
>helpful for anyone testing a backport, etc.
>
>With that:
>
>Acked-by: Mark Rutland <mark.rutland@arm.com>
>
>For context, when I originally wrote my patches, I hadn't managed to
>trigger failures at top level without additional hacks, and so this
>hadn't been a high priority. Given that Vladimir can trigger this
>specific issue with existing options, it makes sense to pick that up.
>
>I had a vague recollection that this specific fix lead to a secondary
>issue, but digging through my notes I can't see what that would have
>been, and I suspect I had just gotten confused w.r.t. what KVM was
>doing. If I find there was a real secondary issue I'll follow up with a
>fix .
>
>Thanks,
>Mark.

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
