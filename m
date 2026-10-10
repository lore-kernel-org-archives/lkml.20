Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A72257855
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791598817; cv=none; b=abK4o+4kO1A+wGNh97bKm6Bjel+x436mJ527KxehM8jh1RVEhyQlOwicmibzwhtQo0rwAVxPlJDeVb9KGGdn8NGAGkdt1wIuo6H/+teh9fEtR728nb4dVNRxVmE41kUQ/J+yrhQyNRahT/7RhWuFrT1O7mbZnmlEWnhPQOYwwEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791598817; c=relaxed/simple;
	bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMuxHe9RgLV8U2Oaqq9wrmHm13UPSgBw0dxwYRpspmQXGzM0M87VB86PwL94zRlKx2/bZ0kuCzM+UzxJrwzE2aXREPlzgOBRWjVxV62shvCJHHpiZyFcZzSTycb4IcWMXY50ELYVUr0mudk6XcRKGTlvVGAIIHLlEC3DnxHInoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bedSKEcd; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bedSKEcd"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-878b44611ffso157405b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791598816; x=1792203616; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=bedSKEcdonktUwUOm6kGJgnOp1+atn9lWPkJm+9A54WEWeLJq2NfbMTh3fMmTqhWG8
         1ATBLPRzno7UPJUAdmSOVqNTlvxwXqsRQ8NX4tLN1zO/1Sxgnf+qAlMJYFIuPSLphXbX
         WVrNgv/hyIGWKw0KjB/Ck90NEgloNgeJNTVocHjOLCz+s7NWAVrBR36YHCVdECO2oBrs
         7552wICnjntsQukPvk+cpGcKljXeJvIr7MflJ/uh9KamJQizF98pvdUu247rphjHMfUJ
         +RTGwyw1P5U/GBlUqRMB9bao4YEmQaQ/07AJwDq683jWmnuuoz80faxx1uBQ2mvozT85
         AYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791598816; x=1792203616;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6k3H1zrHC0y59ZJNOmBXXRBubqCqLl8VbW5eWttYaOE=;
        b=q++WlMjfJMt3OILzQBqRJcRJZPScDJhGi+1lCwk1u+aUp8HVlvbrD85a+Gsqy/S9i+
         RK8Ww+OE7bjp7GXcQwCFIBr8bUcIsGM6IjL2ZRNrWwllwjCeTGEe0hIUtpYQ+nSlNwTM
         YFe/C3tdyBAAEwwb0I1lN9zgl0e+8a4hYTsbazSl9wIZWL6tUbEyHDiKa1HCPsVeBK8C
         pYWLSdZscyzOQlaVAS/0pmLIoLVVJ9S2Zihtx8QCQZNJrM42CwrTsmI3n/gHWKHqO6/I
         riqOvmgzYkGWLzbJIfU6+XN3yp/j3Q7LC9Xq6r3ZQGTz0fncViWs031qr9HRiKD+yfmm
         d6eQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/aOG9bWqGGwtjVGUMdJOkZIdvbW22GQNFqOGIw2l3equ4hyRyn9I3I3MqnxtKM/2yAHkJ7oYwGzrXWNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcLi6D+jCNlkF3PcVCCNLnAvwavoeGIy0Mbi9urQOzMpHgZ0ZJ
	l61Dp+ATy5Kz1qrZy0kp3f+ch3vesczMAc0xnU7nsWq4UUgzNT/c3lug
X-Gm-Gg: AYBFou0jPhDTfwC45nDGhItioblqVKqtnarI6gVrCavPrpAm8Ufxz1IFZF4Xxi0Kkfu
	p/Al+AGpaqt9KhoQC4O2B1X7A0rh8TDh8H3By2n9MDBnKTx92clIAIEnveelJMGA6lLpC+UHKPt
	VuF+qYzI78Wp2z4zcRnjiSvcuf7UHxbffBPnfhn0VXf2mpds8x0Y52/05PKYVIowQas2H6DLNLQ
	HC1VlNNBjm/PV6S/QCS2OL6yJw8K/BOM7dX1+bhbnOZHZvDW2BMTF032i9E2a4jMmvk1xlhPR1R
	MFje4PglwjpX/6hT2r3kXgnGLSNcp4aqqodTlrjQs4n5f9rdJ4xVchMfByQAc55rxObCNXdWPuH
	KeJ1LTU6eUsNa3vbJvCWLD7PEL9k/qYEQihQ/4kJ9Q/ENn0qojg1Aud2I78q1NWFjv88EO/qcJn
	jFPPrFYOvpZCufl4xywiz7/fCH3LQF360fDln4pWe32FizQvadqZBGWalErkuL74uE086SCitCK
	2/WNaTOwmvFa1OxUl7zfi4lWTrZaxjFbHH6f0RuC2uMLxWQ1Bj/KVXYPPQeIn1TPX4K3cXyy++K
	w/LZnn2uqwDxaMdpAswn3+ycN+6NspNan3C3gz2qADO4w+dPT0g=
X-Received: by 2002:a05:6a21:4eaa:b0:3da:b8b4:91d7 with SMTP id adf61e73a8af0-3e16bab5c23mr3009407637.2.1791598815958;
        Fri, 09 Oct 2026 19:20:15 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c479c2cdsm1804113b3a.55.2026.10.09.19.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:20:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject:
 Re: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip power
 supplies
Date: Sat, 10 Oct 2026 12:20:04 +1000
Message-ID: <WT25lTvHQhioJE_CrUW6Dw@gmail.com>
In-Reply-To: <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
 <20261009-memorable-acoustic-dalmatian-03e22a@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:10:01=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:29PM +1000, James Calligeros wrote:
> > Some integrators do not expose the power rails connected to the codec
> > in a way that can be expressed in the Devicetree. Do not require them
> > to be specified on such platforms.
>=20
> I don't understand how these cannot be expressed in Devicetree. What are
> we missing?

On Apple devices, the regulator(s) driving these pins are completely opaque.
They are not exposed via the Apple Devicetree or any other discoverable
interface, and they are not controllable. As far as we can tell, the pins in
question are powered whenever the machine is powered on.


