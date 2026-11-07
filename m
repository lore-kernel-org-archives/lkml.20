Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052299;
	b=v83KEnF0S5WrsIZCTHun6d8+D5r93q4R95CokdCuqxiR2ga5poZ81Wj2kRcJmC7y7SNm
	 n8gGs1J16hgKegv4B9eCdQs4BqGf5kwaqSmDSCF8g0majMX1mej30kfGs9xpStIG1D7Ps
	 i8mWySmNqa3LlG2/h2eMeXDPP4Krq/ObmzWkPTayBWJ2wbj5kqdXFppxo/Z9E46IwywPa
	 n49f9k/zcrmz1q2R1aRk4n1B7JVxwZQqpu8FF6seLgHX55Xr70VFgNRQxf9RFnDHLOniV
	 nzG+4iXOQzqJWZxotf6QJgyeoh4EJ1PlrMMmAgN/qB8Ojcb/2pZ4tMkaY7qPp2y5u7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=vscODVKj34IeVCNhPoKwkhTf+mChKcSqgYLrWqreGBog+ACl3hRggDvo94YjeDpeJ+OB
	 nvkIqynYkL9HRIuAjOMqzV6AQ+hUkNXRp2PNdTjoICfFZtY9nrqGuFYFC3Jl4OFGftipS
	 hkj3pi+JvnaZeT5OXF0AbPyEN8kQekwZv0nYSCTG4YQcHhLBMTQK7JnNhigdbj20LSZbV
	 vtkAhpfPd0IBsNebwZPebUER50g+IZ4SDHTzVKnB8Y2LSj+P3Q7uC7HAPmk+t1XjckxrQ
	 xcCaJ+lbK6Ri8ha/WSnAOKI5HyDL8Nzm1UyZZbdHLQc4fod8DvDvRgA6Ak7DDsQjxyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XPPdzCdg;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B5C606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B5C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XPPdzCdg
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3704d30b84fso1159623eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052299; x=1794657099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=XPPdzCdg4rd+Hd+hTQAnGhkbLeNkK7JIBtOq3oqxwvLzzdOM56U+i4rS08P6yTDqg8
         lX2XJes7S5ddqe2pC2gUZMNJLOfQzCJr9uaLHuuX1H0yge5EoC8Y1kZ0GB9Aq6rukyuv
         7DYM0y1NDojOJJytdsZMQMfzvWP/UavWnCt4UpIwgw4u2SlGyuThYGpCpCPHThkbdmqa
         LdTWIYY6qU4XO1S5NiQQr6JbckIDS7vS+C2D3nZUr+LfZWPZgmhLPFT8zJokLZU2tW74
         pNNVZWhgdQN+kSHfyraZCKlVF8z99K4miFLx8S/H2773mWjddKcVi7rw8xLwfJtpOEWI
         ChKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052299; x=1794657099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=POv6dcM+0FPFSAPmVVnMo0+pxeslgvAc/usLIF/pdDk1gB9FYmW+kPp5ah8IirWDfy
         2LHqpkJAH+kZq0/6yAGhMYbiG0cHb6OyIsqsm0b7WVf21VeSr/A0gT2X75srRJvpR8sZ
         XOVnGoe20TUzD1i0ac8qXElvb2JPikbgqgnPojGKA87+VmNAoGnFC7TlrUXIhY8Me4mT
         Z3LVW7aY8WKX5/DnLGUN2w+66ug1ClvhUhS+kIfn3S9BaF0OfvN6Mz8ZlMW+jV3AuG6P
         MPMx1OKnSeqyfJ5D6REP8tLqJtZ82sb+eySaMJq4+daTErn3xfkVodcgMNkv0OQQqhDj
         +RMQ==
X-Gm-Message-State: APuU4Z/RC1lj2EgbQPMDIfGlpkRnuwe/4XDgQPaZIISEGFeXfUxtPotw
	UYgbSPDEYTFS46Z1di7FHn79IuWdbhGJHhnvyt485EpTMW16i3elWJoV
X-Gm-Gg: AYBFou1bCSVmUfwjH4jDocL5/RHj6BSExZhKw0OefBVKZfudsIn71Fl9hQaaBCLNnVv
	kREBZ4oZK1tDmJ4CQ7chsGJ8MNPDAv+SgIqQvXJ/4lk9onGVJdrO7K99tul2sUwhmgh/07Qr7Pv
	Gx6TpXMSajQuoZacjsRcsOBXZ26ldVefQpAOzVxq5bxxWF/ZTCWC/lojhn7tS0WA2nLOw4eHbG7
	/MNHFZYV0oN2mD5hm6rvJJqfLkSySPpaOjwFpqsGlIjBuuwZfgqg4QnjBtV89hIWheNap3bypcq
	0eElKYZP+vFceUaK0MB34SzazMQjFx2XKpzJIbtZyBFPfayXxg0bzk4xBN4TIQRW15Gfg+85Vgd
	nixy1hralvDIcQv8uaRvGyk/kKS/jUCOM1c32drdulIjfaeKXvdYgajJ1vIBT0jWWLl8PF++P4C
	d2V17U3LwN2ucdzsXpnVnpM1NModv8pSMNhG5+gDkaF82+5anxp9YWsd6PCvmRR+7GaUUVTaVEn
	7HBlDEZImNh63po3GA76eVgqFwKOhF2yFyfFxZ0BYk9koov4lw7VEW0CSwWlJhpHFBFinD560DJ
	SxmCzc2CuHTUT8np+DNkQJ2mGSVZvodzG+Go9qt3EeY3r9aXG/af
X-Received: by 2002:a05:7301:fd06:b0:36e:16d6:f45 with SMTP id 5a478bee46e88-36f758318dcmr7145822eec.23.1794052298596;
        Sat, 07 Nov 2026 03:51:38 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm25945225eec.15.2026.11.07.03.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:51:38 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Trim whitespace from sysfs input
Date: Sat,  7 Nov 2026 11:51:14 +0000
Message-ID: <20261107115114.2638-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87h5htypvw.wl-tiwai@suse.de>
References: <87h5htypvw.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
