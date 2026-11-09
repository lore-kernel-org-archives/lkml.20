Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220630;
	b=NjVMSbyv6m5Mz3lupFLrzK+Zn2M98KUXDMfajVU1v7r2+f/C1Aala4IbVneNMbrmsbi1
	 oxcjWgyk1AjVtM7BNPX0Z1L0i+d1u3SgGN9qfI4SHE9rryPn4xD6ydX54anFW5l17zwXz
	 EDpz4KUlR4cP4CcUCdAMrRmY4U/9f7R3zeFNh1UL27ep4GA0X486b9aTvCWAbI8ceZer0
	 WQk0sN8nqZ6BwHG0OZQP6pXLa/vx6pRttnuvopx/s0Bxii95Qf5Z60+iweF7QWZ54PSgF
	 wm1Bmez7T1UJA/NxakAft+kmJZkpBpB0BdM2m1z2z7UVGRqW0zcx/koBfgFNMHPtDlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220630;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=RgiXM5r9puzO2EF/c9LYyxKCbLgzsjgycU7HBuwYv14=;
	b=KxB1a7K+PvPvX29f0B2jxS0wd5u2GgqqrY8k1nWs1mBcBBTPApbxBI0b6LJc9ReyG7Fw
	 L3d6rRmsHZTQ6jRrhEd6I/yeO5DQdjVFGGr5fgM14Do0jBA4m5ocvct7QFTLZCy/1SKPx
	 yfZEE/Jf3OTufdJi9ry7IoTOOB2k6PWFlxNlYgkE1gqMBKGXdR1Qxp/yTqCBs73uEfrvV
	 VAHsD1cm/sJuJvQfLMvw1dfPNpnMjtVnyeholAd6K+kQk+IHLU7uwby/WV5+ZsYUoq526
	 ZyqxVIiZ4fZVLf5YXI524V28zq81cFKkfj+4LtM1JN1mt7qaNoAu14d0EJWcY5COevQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=S7Y1lMou;
	arc=none smtp.remote-ip=109.224.244.121
Received: from mail-244121.protonmail.ch (mail-244121.protonmail.ch [109.224.244.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEB7606A322;
	Mon,  9 Nov 2026 10:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AEB7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=S7Y1lMou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794220623; x=1794479823;
	bh=RgiXM5r9puzO2EF/c9LYyxKCbLgzsjgycU7HBuwYv14=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S7Y1lMouhSsXanUL2M88fpxKKj/V7JtNNiWE2kkXW4PMPlAsxwxXMGp+2EgvSimiX
	 gBjGNl0BWTz9lr2rruucIByBkB9npPaJfR5+lfwZHKoo9sh7D/Ks2V/afRQuqvKS4F
	 jqthYrW3V/dctInVG5X67ZjYit0E+h5vYnhGiSoRIMt2yRkURI2ProyCTP/ou+B958
	 maIADTiGv0o5YjDAYHx4DtdsS3c6mDYPulrEbk6Nc0Ngf4ryeR0seRoDp05yLunwYy
	 8CwB9luL3vn21xlVo/zSEm+ME2WtpvZjEjzIb1MtgTJl5g/iUwVsmZmmJEJlr+h9wr
	 7jW5aM/znH/Kg==
Date: Mon, 09 Nov 2026 10:36:54 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
Message-ID: <20261109103645.32173-1-lsa.uz@pm.me>
In-Reply-To: <66c9105b-4da7-4b57-a0a1-e33c093f1529@foss.st.com>
References: <20261109093353.3757-1-lsa.uz@pm.me> <20261109093353.3757-2-lsa.uz@pm.me> <66c9105b-4da7-4b57-a0a1-e33c093f1529@foss.st.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 7f23696f074205ce908f5e43290b2a74f03e6da2
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

Yes. The single file came from Krzysztof's answer on v1. I offered to
fold the compatible into st,vd55g1.yaml with an if/then for the
link-frequency minimum, and he replied with a link to Peter's 2/7, which
adds the VD55G0 to that binding. His review of that patch asked only to
keep the file name and to move allOf to the bottom, so I read it as one
file for both:
https://lore.kernel.org/all/20261020-cute-peccary-of-attack-2376af@quoll/
https://lore.kernel.org/all/20260903-utopian-vagabond-mamba-44caea@quoll/

I am happy to do either. Once you and the DT maintainers agree, I will
send v4 promptly. For a separate file, it brings back v1's
st,vd55g0.yaml with your Co-developed-by, and its MAINTAINERS line in
2/4.

Sergey

