Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520077;
	b=G1rwwVnxW6qKfZelHPsZzBgkrnLRqbAhBTU8e9nt2XvoQL1dITkAPDrcs3AyibvcmYcj
	 ADuHDz2+x6PO99fTPg9LwQ6QlS20uvLRTo0e6GAMqojn5xUSVbST+Y9nXED+MLru1ittT
	 AelDmD+ahsl+t3h949LF5y/hqTs7iCzK2PVNTwHXWAmDMz/mQtn3WBzTTt9EAguqWIplS
	 4DgoLuYhpPjcqofuULz0b0JSQ1H3MM9kw/rEHOTytpbWdBcyhLG98uda2btPL4MrbcLHh
	 fQtUzEuIib11X42WtHIjA1X8rljypdHH0I9N4g0Tc+hf1eW9Y6qyZBpyJB4RdKbwsGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520077;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kucKXYNu3qEsaEvsrobPFi3mwauwRMH/3o8PeMIZ5kQ=;
	b=xgTxZwB3sGBoeGUKA9i/2PGLWPY1PYtkKiFp5HqjF+792QoiAXD+jDVW0Lm2FEcTqsxy
	 RaqxdHQghj+te79Pzc9zNdYbrwDZNHhxz8HH4ghs6MqV69dklofMQ3fha0PgwRQWjAlYg
	 X7xfaj90/5OaRFr3eJTtevVJWhYafKyB5YyLjIwVlBpvARV7MNNnZfVDnGwqFoM5RWfOG
	 F2uNBud6GJd3uwzefQnJo/R/wIopmyPzhAr/yAlL5B24WRpX3PgZfgszrLIOc2xuie7iC
	 CVWDbMDynT3QqWXcj9TNNR8JoGpdJnqjDzmHJyYnFx4SUyPWocW3xBr2fFvdIKOXeSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b="B9qWj/GX";
	arc=none smtp.remote-ip=79.135.106.118
Received: from mail-106118.protonmail.ch (mail-106118.protonmail.ch [79.135.106.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC414606A31D;
	Tue, 20 Oct 2026 18:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC414606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=B9qWj/GX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792520074; x=1792779274;
	bh=kucKXYNu3qEsaEvsrobPFi3mwauwRMH/3o8PeMIZ5kQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=B9qWj/GXAHyrdsylRuph52A4l/WJbUMQ7OgtIg4yzEgApxigBIil6kmQSLTtIMRrL
	 mnmHPHMXz0yVi8WZAk9wOW3FwuKa3scu1WXU5e9boK9ul4L/OF3n5Ue37+MnaqRWGa
	 kD77MZ+IxZ92fYYAeNW6BSYOSX09FKUXfWYo2KF7cAm2vBmwQFcDbnKInqObjxRnvz
	 ySJcrEnE4iCuWSVnfBYsZCbSbPz6xXnVyhYT7q8e1U6MwnvAGJkcdTabvHrjPamDsA
	 /Z0gixSh4yHoUyMEBJLgTjfbjnYVz5wggNkxUqW4Vk21TiuVtbWfecN8jjSb/oSAV9
	 RQDwZYJdQB1Aw==
Date: Tue, 20 Oct 2026 18:14:26 +0000
To: George Neacsu <geocausa@gmail.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261020181415.70007-1-lsa.uz@pm.me>
In-Reply-To: <20261020181025.8625-1-geocausa@gmail.com>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019162722.25587-3-lsa.uz@pm.me> <179243379000.31842.4735750009847702427@gmail.com> <20261019193402.52923-1-lsa.uz@pm.me> <179247822513.25202.7960395606350309657@gmail.com> <20261020085200.60619-1-lsa.uz@pm.me> <de8c6003-c7b5-40f0-beab-4c3370b98f09@foss.st.com> <20261020142641.24808-1-lsa.uz@pm.me> <20261020181025.8625-1-geocausa@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: ef588eea7d2eed883d8211d7ca2eb68740a46cf7
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

Hi George,

On 20/10/2026 19:10, George Neacsu wrote:
> Sergey, the write can stay or go as you prefer; the Snapdragon model
> does not need it dropped.

Thank you for going back to it, and no need to apologise.

Then v2 keeps the write, as vd55g1 does: the driver does not expose the
status lines, and on IPU7 it makes no difference either way.

Sergey

