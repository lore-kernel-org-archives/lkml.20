Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823103;
	b=B3Mk5GCFQ0sU2tXwD/Q0th39/BHhKpyRU7IzO0UTjBlWmGfc6B4r8rNc4lU6yFgWnjKp
	 7aQz7WfZiWzabkub2o6i+LQsNXiiZImZu5XWUGQ9yFnnl026u06Pt+7Y2KxYb9oqmqO3W
	 VE9urc4ewru/xpIFxpk/4TgKKRXQhSbQpwBSdjDpPV993G48Ki1lIqjYFxUwC/1fgsmsM
	 DHPolgZ5qMXE8opCbGJBTIbbNG8cRQwirs4beOTKBiDN/S+y2nbm+PGuO9osjpo2n4zGd
	 0k8sQ0UAJIqQZS0qtb3l/B57c9022VTGVninvL08D6P3HQiDJw6NY8ih9HvRfVgVSfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=;
	b=YMU9UIl3b8NQIFTJnSSHY1esgei90QNY4mm6A8BQDaNfoCcV9CcFfKZrjyGvb4D8plGj
	 UhGA5gw9XDo67pLud9SLUZdiiho0S50Q/E1uc8u+Zp91ukvz++xXlzuxNH8aP+QXc4a7/
	 8CcVTlXSNb+b8ddSfwjjdJBHOYcXddandjiSizMfKerO8p0znBD8GWPBRtbAK5fO2xjop
	 C0v3Seu/+w7gPo2fzzevDkYQPU5u1xYs8fG2ODw3+VZcDMpbHe9uu/9JC2CMJKN4x4qtq
	 1FlKdt538KmRg/Di+DugbMNApFz51sEo3pHOyZGVbKA1TwzYhr3ehCtbSvY8zdrJVAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9bDlyFv;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE3F606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FE3F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9bDlyFv
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so34577725e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794823102; x=1795427902; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=;
        b=R9bDlyFvVr0S4yMshgYnycii6CBT5Zvs6pnEe98MdhHkMGIBb39vwWS9x8wTIZjPPZ
         fRvzjBiWuzuQJ5uG8SNRNjkSIOeQT+H1rqYVW+YXbf+C0jHrPtPM3JOXY3KYNjdhUN14
         KUD0JqAFnDh8EPcXFC4Xa043JM7tMq1VwdvTFEcC1YtOgmoFGE1WlUllJXqpwM7jIEYc
         4sCDpV2iNjKih2iRfbfx0QMq5c5qn3DliQ2Cx81JomfYOa3VaBKgH2yqdSKElb2F5XB5
         +Jd0zOou5xhgnSYnrZLzww6IR+q/+cSTUfJkwAfthznbtWObTTPK1iqcCGYR3l7ygAnz
         QR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823102; x=1795427902;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IKEWtPTLjM1XYaZ0STp/scHGqJtVbGIZgdMjNsrQOo=;
        b=oWZ08eunCkU1tGafNzFbCAcbAwh/xUF35AoLi0O3QE79XVibeDvksLfD63Hjy6hkb1
         G2ripOkCky4UrBN2N032sQxyQt1vS13jh7JShAA7RdQkqTzIC8JLyK+2Wx8QYO/VAw3q
         uZ6OUdr/tFrL+ezF117r54kyjCBWXnbjoo+GWcPrPSXW1a/awbECxIcfoitr9hLjxMSg
         nv6KEa4XbDZfGGW74Mf5FB1UFhJfQ+6CJr8RzaxWBorgEUEQQKMfOP+eYaBKHUB6swGO
         e1XNSUUovwpXDQdUwn5NsHoiiDh0WIjyWf68jGsnh+0XJLbjW7qRg887IiY8DMTQTxzu
         D/IQ==
X-Forwarded-Encrypted: i=1; AL+hErH/EVwAlcMcnY56HwZ/eYR8kipVgZTspnJW5DDAvXmz801B0I0fifjPicm1lEBWCa8fhH1t4yr4vi+z54k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+82xU05vvNcR891HGRizDLLUr5QcxyflIL4ji4+yYeZ0QJFDwe
	Kw8o72zX4kcNHZ5Jq7OgtGysv+OkcBov/FwZSsrGcsDFRG1XuputkhtL
X-Gm-Gg: AYBFou3YDYcebsk800C38rzmZuSZL1EhF76zI/CufAj6AL/c4PHnM3o2lisUT4fS5Jq
	W5e3PWpaQ2VohrKTcpCAxKu8jfntwj7mY8Hex0FJvn5eoIanKwX+vNtsuojsWs1m1O8rXIVv06t
	BEis4Ebm6U5dqh7F1ahG/781Nv0GsmSAR4duW3BtkAMyoKvhdxPrKxj/Kk5T5tyqAoEAZwWyw1V
	wCVp7n+Zb4u1vgKQ7UoLF71VzLy2bJrpE8f/SEkj4tZ2Paeo+vMChWT51uQEJvI6M++pPwxtsUK
	ei7PXxdzxA988wTfmFzsRkQ916IEnb4P2YN281PUyuiNCcWaNhasB+IVulyMoa3SJc0i/fZEXfZ
	jH6jQAoAgZ9wp0wC4vU7qZnCWcqm5UsMaoCE2nBOVjntKFKKCrtl5d2obtVG8pN8SEmMEfLV7qc
	JSXzDYXiZazTMzGo2l7w0oO0ipE7fSed0vtIjhNZQbgavQjLpwM83pQOLav9DIZuORrsLpV1jNs
	1wrA1uQhvtorH1ac/Wgg6kZLB0c1ubUUreK2nKb7dVruX/zZA5kqeZCnCmXVPCi0mThsDap1oA7
	ldff7ptKySD2NmESYfxYO3cWzH3L3mjuu5HJ3Vj6LYFopKVhNN1vHA8xYlZpbqju7rsrKoD4
X-Received: by 2002:a05:600c:8483:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb605d90f1mr145813425e9.32.1794823101861;
        Mon, 16 Nov 2026 01:58:21 -0800 (PST)
Received: from ?IPv6:2001:8a0:c4c6:f00:1399:6f7e:7235:850f? ([2001:8a0:c4c6:f00:1399:6f7e:7235:850f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm112615705e9.1.2026.11.16.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:58:19 -0800 (PST)
Message-ID: <4c5562a2d384fc530be2773a49b7380f3b009e61.camel@gmail.com>
Subject: Re: [PATCH v1 0/2] dt-bindings: display: panel: Add LG LP156WF1
 dual-LVDS panel
From: Vitor Soares <ivitro@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang	
 <jesszhan0024@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nishanth Menon	
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo	
 <kristo@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, Lad
 Prabhakar	 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding	
 <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Nov 2026 09:58:17 +0000
In-Reply-To: <20260529110518.624454-4-ivitro@gmail.com>
References: <20260529110518.624454-4-ivitro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi all,

On Fri, 2026-05-29 at 12:05 +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>=20
> Add support for the LG LP156WF1 15.6" Full-HD dual-link LVDS panel and
> a Verdin AM62 overlay for using it through the Verdin Development Board
> with the Verdin AM62 Mezzanine LVDS interface.
>=20
> This is a follow-up to an earlier attempt [1], where panel-lvds.yaml
> was incorrectly extended to describe dual-link panels. Back in 2023,
> when a generic dual-channel LVDS binding was proposed, Rob Herring [2]
> pointed out that dual-link panels should follow the existing
> advantech,idk-2121wr pattern instead of introducing a new generic
> compatible.
>=20
> Following that approach, this series adds a dedicated binding for
> lg,lp156wf1, with the dual-link LVDS ports described by
> lvds-dual-ports.yaml, and excludes it from the generic panel-lvds
> schema selection.
> The second patch adds the Verdin AM62 overlay for the LG LP156WF1 panel
> on the Mezzanine LVDS connector.
>=20
> This series should be applied on top of [3] to avoid conflicts in the TI
> device-tree Makefile with the other overlay additions.
>=20
> [1] https://lore.kernel.org/all/20260521150038.103538-17-ivitro@gmail.com=
/
> [2] https://lore.kernel.org/all/20230130170441.GA2796575-robh@kernel.org/
> [3] https://lore.kernel.org/all/20260522161105.277519-13-ivitro@gmail.com=
/
>=20
> Vitor Soares (2):
>   dt-bindings: display: panel: Add LG LP156WF1
>   arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS
>     panel
>=20
>  .../bindings/display/panel/lg,lp156wf1.yaml   | 105 ++++++++++++++
>  .../bindings/display/panel/panel-lvds.yaml    |   1 +
>  arch/arm64/boot/dts/ti/Makefile               |   5 +
>  ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 131 ++++++++++++++++++
>  4 files changed, 242 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp=
156wf1.yaml
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-=
lvds-lg-lp156wf1.dtso

Gentle ping on this series. The binding has a Reviewed-by from Conor,
and as far as I can see nothing is pending on my side.

Let me know if a rebase or a resend would help.

Thanks,
Vitor
