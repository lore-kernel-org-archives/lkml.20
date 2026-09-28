Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D04946F484
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583676; cv=none; b=a6vt0eUzPHXsX2pyqMJLEQJM6LcNdG3UQ0NjoxP3k0cSVdv8aM1LZ2QAcKvj/X/eiL8iIR5fl+fwhnvuJBHMVUhwtUu7RGCBic8sO9ioRTkI/kMHg+3uqAUFSxK4P5y9I7uTZlakIKGDd0ETgGW1IAi3sfT56QhAGxdzfmIHbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583676; c=relaxed/simple;
	bh=sY+s2SrqCzhVRPqFlGEMJ2bakNnFS59A3kYKuGXDUos=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MocsuAOytz8p5pNSnp3ttqjBC7IHIox+LUMA80JSYiqgiXIhkRwZj5s6IcQkE9oS2duPHU6lIWOvkjz3IsA0c860+LT6kj95zSYBPFer21KfHJLtVQwZEthkIixNFJLHOG3SBZJ6iilcaWjBBzpIxHM/UeOuyl0HT6PwGQZbKWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [120.85.96.244])
	by APP-03 (Coremail) with SMTP id rQCowAD3AD9AI7pqv1UICQ--.246S2;
	Mon, 28 Sep 2026 16:20:17 +0800 (CST)
Message-ID: <7442671c93a4e5d4b2d1f4c377566369ab249f77.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/2] drm/bridge: th1520-dw-hdmi: Two fixes
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Felix Gu <ustc.gu@gmail.com>, Drew Fustini <fustini@kernel.org>, Guo Ren
	 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 28 Sep 2026 16:20:16 +0800
In-Reply-To: <20260321-th1520-v1-0-ec877197770d@gmail.com>
References: <20260321-th1520-v1-0-ec877197770d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:rQCowAD3AD9AI7pqv1UICQ--.246S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY67k0a2IF6F4UM7kC6x804xWl14x267AK
	xVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j
	6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r
	xl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF
	7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r4a6rW5Mx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU87fHUUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-03-21=E5=85=AD=E7=9A=84 03:12 +0800=EF=BC=8CFelix Gu=E5=86=
=99=E9=81=93=EF=BC=9A
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Applied to drm-misc-fixes.

Thanks,
Icenowy

> ---
> Felix Gu (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: th1520-dw-hdmi: Fix error chec=
k on dw_hdmi_probe()
> return value
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/bridge: th1520-dw-hdmi: Fix remove() c=
allback
>=20
> =C2=A0drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
> ---
> base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
> change-id: 20260321-th1520-f4326138c9bf
>=20
> Best regards,

