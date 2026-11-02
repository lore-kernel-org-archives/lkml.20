Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627260;
	b=hT8pyAt05f++Ugj9lf2FiD8nWgU7E71fHwMCwXuAt19ug5ScYyTwN/6acQPEFN7X3sAr
	 IgP4oiE4VcydPqa7cCeUAvlN3Ju51NyNMaq1DLtBvaVAotiupAGQ4MNx8Pq8n6Usy9Wc6
	 cBDr4jv7N2AoXcbCu4Yj4YEeUBVygjlWs36fORAYFsEGp1VWOPaZ94ISogvdgJ20p5LLj
	 9FJ8vfxAbgHGAdnyceh+bdd3PsKlLJOW4eoM61BmXlmZ4e7K0k+86FtM6NHajSVZ3T3rk
	 RJG8r0oiJt/iJSjfMgKBKyP4Tm+yDkavl0xYGNoMI8AGTaoOqpiKc3jcJJg4qunlJZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627260;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=OccrwNXmTztM7f3vQzcA99RTcoFNxa5Xwnf00g1h9eU=;
	b=OjpE48SuXAKpK7ig6xhl4TQFYhG/GqCGGECZpGavs/3ASXkOc70ZMMM2v9YpnFDY45+g
	 QwgtWkeKIkrsNuLsI+GjbaOlyGYxanSVMZsXGDO8lsiFPQX7ETY4dbcMYHnvCr4clh/1r
	 Ktq1EmUv67bTsjIfioxR8R4RGke/Ve1OspjsjSUMo8kYcoxsSvbyipVcZTRCjTzfQOwu+
	 w3dHxDNRvAG+S9xxQu2jxUGv1EMNuqOgFrnHNab0mE9h0JeDP7Q0DKD7sWOuo7gg3ITlE
	 PEl0qgwGVewSTs79cquX+RfW+Vkoc4/OVKlBx5eH0247nltI9VPK1SlBEL/k0g/NwCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65518606A324;
	Mon,  2 Nov 2026 13:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65518606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-03 (Coremail) with SMTP id rQCowAAnNJVvlOhqcL8wAA--.27568S2;
	Mon, 02 Nov 2026 21:47:27 +0800 (CST)
Message-ID: <e42ca3c8b36b28a855e4d9be25f7ab22ac6a14c6.camel@iscas.ac.cn>
Subject: Re: [PATCH 0/4] drm/panel: ili9881c: add support for Mingjun
 MJ070BI30IA2
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jessica Zhang	 <jesszhan0024@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Han Gao <gaohan@iscas.ac.cn>
Date: Mon, 02 Nov 2026 21:47:27 +0800
In-Reply-To: <179362684913.3310106.12917918779608270334.b4-ty@b4>
References: <20261030-mj070bi30ia2-v1-0-a0f65b65c290@iscas.ac.cn>
	 <179362684913.3310106.12917918779608270334.b4-ty@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowAAnNJVvlOhqcL8wAA--.27568S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryUtrWrWFy5Kw4rJw1UWrg_yoW8AryfpF
	Z7Ka43JFWDJrs5Ca4DXr1xJFyrW3yrZw1fArn8J3WkA3yDWFnYq3ySvw4Y9w17urs7Cr12
	qFn5Xr1v93WDu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jeoGQUUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-11-02=E4=B8=80=E7=9A=84 14:40 +0100=EF=BC=8CNeil Armstrong=
=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>=20
> On Fri, 30 Oct 2026 13:44:11 +0800, Icenowy Zheng wrote:
> > Mingjun MJ070BI30IA2 is a LCD panel used by the Lichee Console 4A
> > device, with a initialization sequence matching other ILI9881C
> > sequences.
> >=20
> > In addition to the normal binding + sequence panel adding part,
> > this
> > patchset contains one extra patch trying to address a hardware
> > quirk of
> > Lichee Console 4A -- the panel could never be really powered off /
> > reseted in hardware (the reset pin isn't wired to the mainboard,
> > and the
> > panel is powered with a always-on regulator).
> >=20
> > [...]
>=20
> Thanks, Applied to
> https://gitlab.freedesktop.org/drm/misc/kernel.git=C2=A0(drm-misc-next)
>=20
> [1/4] dt-bindings: vendor-prefixes: add Shenzhen Mingjun
> Optoelectronics
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f423a211f99ca820c=
2c99a84a3418aa505d6dd02
> [2/4] dt-bindings: ili9881c: add compatible string for Mingjun
> MJ070BI30IA2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ea74b623855291e60=
835c0f7fa7a29673332ad41
> [3/4] drm/panel: ilitek-ili9881c: add Mingjun MJ070BI30IA2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (no commit info)
> [4/4] drm/panel: ilitek-ili9881c: do a soft reset in unprepare

Ah, the 4th patch is now found to be only needed because of the
initialization sequence error found by Sashiko in the 3rd one.

With the initialization sequence fixed by comparing to other panels,
this patch would be unnecessary and panel sleep mode is now safe w/o
software reset.

Should I send a revert when sending the sequence fix?

Thanks,
Icenowy

> callback
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (no commit info)

