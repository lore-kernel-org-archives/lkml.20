Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E98374E40;
	Tue, 15 Sep 2026 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464817; cv=none; b=JNXunOzXtlTckH3ZQx2Fko0vl/Fb2ZSYC+CHbJHZ+3J4IWAxmBXAU8tKBtrPWRA6MjrcZngPOhaZlGv7iD4O0cvOWUvNlTdovdDuUcIErElUtnnLLYZlL1O0mnCfUMVdhEulqKfF6h8V63oXaj5UZIaMacdJAtWu+aGztn66Bao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464817; c=relaxed/simple;
	bh=hXSEs7BTDlc8dKDKpzIizZkxrmFqMoEY8BMFcJ/xLxg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HLqKhq1sXZZxbgcmfX/TPFqqYDRSdk4gzR9q7CHuSSAAROyztmUgwyTGI+1xVE9Yq4bMURQ/mrv+dhKEq364nybM8UCAY6Xsf+iBt+Ooxl/WPNvg87WDSCZqVemcf2993u1brgStlLnqyHf+cj41P2A91qpr9IgKsT+a4T1lSgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wY1y8xTa; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wY1y8xTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789464799; x=1789723999;
	bh=hXSEs7BTDlc8dKDKpzIizZkxrmFqMoEY8BMFcJ/xLxg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=wY1y8xTaVY9o71t68zZ8xxpnHJIDVB1JeESHBv+1cj7WISv5xrNPHU/dzNiNh6mI8
	 xtxbiTfFHVa7DJUXy5Ueyoex/ntihHchoHtjhDuihhcHlboLrbQnD5DAXiK/2jn0Us
	 ayWGOvjJNWs4OHILwjPVjXAmxgfK/9HnvzivI9seOo/T8tPB/Oe/zUDmXcMlwR6HI3
	 Qu/DN+XQoTr8bFHzKSJTuULS0SNgscpwOf1HZuirbSnVqbJs8UMRxnsTME3p/iieFB
	 U9ZxR1Z5qpEBA7eL5iio25/sYPfWF+4aLMvasr+m0hhY4Em5u405/lCMmh0f4rwSaI
	 3oiMy5SbdVyOQ==
Date: Tue, 15 Sep 2026 09:33:14 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpu: arm,mali-utgard: add mt6572
Message-ID: <qhCDchmGeChGRGsaz37FafYzJowgCzD3tkhtgZCAmpTdTZ7MloVCm3SgJPxz6_rJZJ_HIxpwgQZibP1bkX2tRz-XkcPVwznUO7issd2PYmI=@protonmail.com>
In-Reply-To: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com>
References: <20260810-6572-dt-mali-v1-1-fb908627bf23@protonmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 45b726ba5dba26f46e8487dde82dbede2970503f
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Angelo,

Could you take a look at this patch? That's a one line change with a new
compatible string for mt6572 GPU.

Thanks,
Roman
