Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573570;
	b=G5OKu6IIJkkqKhoFIgRVuveghTfsQI5vkKWw7Bf0NQ5C649/5W9NMU9cdmqrXaEXPe4T
	 dWT0Ay/dONnNM5ZpcZEm5QpxPoehx4fNvTquI5HkTSC8Jq/2vSE17cd2X7r7H07w0lz8z
	 iVjytW280pamIfQES75+iN23I/43qx+Bj8kNr45rmJQub0yrSlsv30pEUHh7+1p1L28yA
	 cpfhOSkOvKy64dB2XD0/En48Pwy+G1rEBJ+f6x4Dl1V7rLVy81qKsmzmVSXIql32uqV0F
	 IEfgIy7KLOdTnCYa2e/3TEe6LInn7swxzh/HjkIFs2w2ZTfpnpNs6+d70Blpuvih5jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573570;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=xO+SlNr5VR5FPJUZivBHkoRlgX7C+y7cd5KZTooj1TU=;
	b=VayBtjhN7/Km8iqO8BGXQLUad3E+kjJHRCC6bKK9sET5Eyv0cgkpZx4bhUf9G5nU6Gsa
	 avNWyxVJobNNal0aXcKl3gmcvy3XKyJk80v1dqwFDab4+6eJz5sIum6726sditjLgjFIP
	 Oj3YAr6WZ6FHaD8vnrPxCcpA1r/HmHBkpqyrRymiFzF4cH96WSOPOyUb3wyv2Ozy0NkX4
	 zzlIoRUakZyZ1bKEIMw+cqU4XT8F1ia1GQ3BHhQVZin4IIeuN5lD/cxxB+FkZCVmXq+hs
	 8wWSlTXlaV4HKanEmBkA88C1thm9fUCl1Ba6hPFLuiVv9as8bZwL8l+VqjiYzGQZuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KDy47WBT;
	arc=none smtp.remote-ip=109.224.244.16
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6F606A31B;
	Wed, 21 Oct 2026 09:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B6F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=KDy47WBT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792573567; x=1792832767;
	bh=xO+SlNr5VR5FPJUZivBHkoRlgX7C+y7cd5KZTooj1TU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=KDy47WBT7hhvun0u0FCIMhzCARBZEidsJoNBwRzdHv/5Ax7FpwFjDGOyaPMn5FbXd
	 JUz+k8ynNy2vv+EpdLcxU8scuwaAuyEd6xSeaFKqqFvWJMH5ex77SJvrsI+kd3V2dJ
	 5XXavjZA0XLQByINAq5hqnExCiYAt2YkaOF6wikPcmAnOWsrJnxXE80dutCGKDArLE
	 /Y49uXw1ZnUE/f1xQQeWNjrR/cACGteJsai5BjiVF5iSKIxkJF5q7B3XXBzw506zK7
	 qWqqwHiuc26XhQ4rI8ptuh/1Si0xAd1B8hMLHONmgis9nfq4MRSQ+g3XHWG9gDzJAb
	 jQuPfuGbEc95Q==
Date: Wed, 21 Oct 2026 09:06:01 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, George Neacsu <geocausa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: Add ST VD55G0 global shutter sensor driver
Message-ID: <20261021090552.46789-1-lsa.uz@pm.me>
In-Reply-To: <0cc7330c-d563-41bd-b3d1-992f60ae32f2@foss.st.com>
References: <20261019162722.25587-1-lsa.uz@pm.me> <20261019193402.52923-1-lsa.uz@pm.me> <179247822513.25202.7960395606350309657@gmail.com> <20261020085200.60619-1-lsa.uz@pm.me> <de8c6003-c7b5-40f0-beab-4c3370b98f09@foss.st.com> <20261020142641.24808-1-lsa.uz@pm.me> <20261020181025.8625-1-geocausa@gmail.com> <20261020181415.70007-1-lsa.uz@pm.me> <0cc7330c-d563-41bd-b3d1-992f60ae32f2@foss.st.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5a194d521410570634a99fd238ce12a84d135ae5
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

On 21/10/2026 11:02, Benjamin Mugnier wrote:
> Could we keep it disabled instead ? I'm afraid some receiver could
> catch all data types and therefore messing up the frame. Better safe
> than sorry.

Yes, that is what v2 does: the write that stays is ISL_ENABLE =3D 0, so
the status lines stay off, as in v1. I should have said "disabled"
rather than "keeps the write".

> I should update vd55g1 too.

vd55g1 already turns them off: vd55g1_enable_streams() writes 0 to
VD55G1_REG_ISL_ENABLE at each stream start, in media next.

Sergey

