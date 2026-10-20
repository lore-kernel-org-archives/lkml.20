Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506418;
	b=QoBBqxvXsz1FHe9WH9tYRebnvJfRtEefgHOzvv3LEru1Fq/ANM+pWlHyWIfZw1AKD0Vy
	 g4pFwy+DF0bu90rKGPipRhP/VohJrscZBqsFI9nJSW89qMenregSoQP/ZDSZy47spdB72
	 O56GzYDlfgH3a4syi90jUsGUh9f/YVCFppWqI6tEpYdmBt9FayqdksUd/GoVMfM9EzJSG
	 vCg3GkzqntXM0i4W3aGh3kifVdN4AXS+wJjmykHDXxvJrBz85bDb1VsKsgwrEsHs4aux8
	 KoxwrDD2ON0Jcsgl/N8j3vuimv12sbWOPuqJjTXpymGL8VdNX6UsnzHdX4q6rn5nz/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506418;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+g08uAhXqYKhCa3FdEX1OoM2Qo5+lDEhNVXKFxBV9mM=;
	b=GeTeNR0sKGJm6t5NFpod3a7p+BMjXYoke/Vyjz3F/Zvh4LgICEsLKqLWcR2v2el6itff
	 GAkQxt89BFWnYqI6IVO7tUqG/WudEbu13Asz7f6epn2wgiB4Obz8qpWt+IUZh7ifPX62o
	 kpLS9cLSa+Sk37Q9KU+OxEN9n4SPnO/IsmiEwY5Ngh2GuikzK2iWP0NSlSoI3L7lmGVMm
	 DWE4LE9cPQ71b+kfukXQoO1ZYitlD9yWtDaLXLzPBdafNOV9gmyDD2pFwizRKndjOI9Mr
	 QMSkSHW1Sxby71DCnJiB3lIezlPnjGzbCjqh56F23FM49oDqaD2fvmBZrWDnzEv8YlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=XbvtxDrq;
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB8606A31F;
	Tue, 20 Oct 2026 14:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EB8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=XbvtxDrq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792506414; x=1792765614;
	bh=+g08uAhXqYKhCa3FdEX1OoM2Qo5+lDEhNVXKFxBV9mM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XbvtxDrqduWmmBoKEMRi+kVEBP7YU8OeKKcMw0y0o83IGG13MSLea8Fgbn/k5VG9C
	 4sDRuq30IQKTj2BTPNZ2xA85951V8DNxN3DIBjKkn5DNykCtA/oXo+FQSlPhcOSued
	 j761N1o+fWrU6OsqcYlSPGlaImf0fUuB7y/dGFjZbwkreSeEwdEA9D5TNaz/gqt5CV
	 YDcu3/vfNhZvvd+In5jvZ2C23ho6E4z4KeG/sKhy9/mMCyh+eZ6K8R4De34mTyNv/g
	 MyeuTrzQQwipckeMSSAT+1IOV9t5HKCfGHgc1NYsJfpyi+OTagxpXQelGb1iJeGkZo
	 NO7FnxjV377zg==
Date: Tue, 20 Oct 2026 14:26:49 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261020142641.24808-1-lsa.uz@pm.me>
In-Reply-To: <de8c6003-c7b5-40f0-beab-4c3370b98f09@foss.st.com>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me> <179247822513.25202.7960395606350309657@gmail.com> <20261020085200.60619-1-lsa.uz@pm.me> <de8c6003-c7b5-40f0-beab-4c3370b98f09@foss.st.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 85762cc40d38bca2648fe6e637be1ef3cf0e2070
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Benjamin,

On 20/10/2026 14:25, Benjamin Mugnier wrote:
> I guess there could be an issue on the receiver side ? Maybe your
> receiver is ignoring data types and completes the frame with ISL data,
> effectively filling up the DMA ?

Not on the Intel model: IPU7 drops them, as you expect. With 0x0329 at
1, the test-pattern frames match those at 0 with no shift, and the top
rows hold image data, not the embedded lines.

On the Snapdragon model it runs the other way: George's stream stops
with the status lines off and runs with them on, and on 16/10 his
vd55g1 build streamed with them off. So I agree the register itself
should not matter there; something else in v1 probably does, and George
can narrow it down on CAMSS better than I can. v2 leaves the register at
its default, which changes nothing on IPU7.

Sergey

