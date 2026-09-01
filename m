Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C8B43B3E5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277851; cv=none; b=qz0aaOTQCCV918kyb0YCDOYRmYKlqBUA3pfWn1tGzsHeg1KiOEj9LDXtyJSgV999nkx0497t71RxVZ0H6VYeU7prJSMxEjmWWHUL9KjITINzj5SEo9Xztf3MXFkNB58Wlkil0c//OOz7IW0/8LiopAq9l+bLln5IB1EKNUsICSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277851; c=relaxed/simple;
	bh=sIycX/93dP8h/wj5U80nNU52ZrbLgXUgk65pU9prnfM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QBkTOE6PdUrtxAtxX/Uz1/n43CmVVkTtg++x0STFjONfWczsOrR1IDfSL7EMOB5WWyKH8q0wzQ58lRPcZNfQXGKPY0VSbQUsj5DenNcBNFMySOvV3Gr8Qob4bIdvIItaGJS2LdUysB2INavVf0V2Nl6Da6seA5rGGUBKZdqwmJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzjziOOM; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzjziOOM"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so8784781fa.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277848; x=1788882648; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sIycX/93dP8h/wj5U80nNU52ZrbLgXUgk65pU9prnfM=;
        b=lzjziOOM/JUAWWFNVGP2oDOmNl1YRC/Y3UNPV1AHvvXu0unuk+HkblyDqojoDEwxL3
         8QLQuAm0fbyg37LKNKBrrmze6cLBP4VHDdWUR5SAN3ZQ816pwWp+NvRG4mfks2NnT4or
         kUF1YKa9CamDmL85Fo2s7kTo8V+J/I+3QtIew7q+fFt+1+hIVJwZVTeQxMSEekrrNi2+
         PqkNbwsCLE9h9qNt4zeZ+HGHMG2lk82sUVrTrbg/Mxx5cEiHWw4c1dGNblGDuTyMebIe
         jpgBSYzi8Gg0xhxIiqv0weX0/aG7AjE0mpWBAath5DdTL/jAH/C0aV9whu86eI+1Ekpi
         Swgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277848; x=1788882648;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sIycX/93dP8h/wj5U80nNU52ZrbLgXUgk65pU9prnfM=;
        b=c85mpKRMBSlrlNPjGnap8OVH2CLljqCrzCOfEtE9oLbCqhKRS0KsbSlwnMYyVv4lCB
         FmkhnC8zxLCfne6c/nYsoyQ68jyOyu1sesNGrKwJkrStqNV7ReOIsNfuLGqLyLw6I2lp
         8yxaEOLcTbUuuLoiTQOb2mhaNR+cyWhPvRL+hAta6K1sq8bjgoWA16eePOEFQKkqoQRA
         oce0q9Qk/2Ier5uGR0p7w84ZbEYoH3E7HwZBiZtSAJk2cvF6Po5QUjiDdVvANvfXg3kA
         rxf2svPV1mHzV1YkAV0Ua6lOGSxg/Gb+hpv+d0w6bhyIY/R7hX1X7fnXFe2kEt1fKw4p
         sztA==
X-Forwarded-Encrypted: i=1; AKwUvBxbyjb7mOehJf46cUyrBgVLKElKcB0ZvCCnkBWn3aw4SRq5BVkI4ttA/R4S1BI7agkh5vMt5fntIsog9zc=@vger.kernel.org
X-Gm-Message-State: AFuF++mB9lXl/ean924eUFX59oBKK/0QmZYQrV6CegBRNFUQ8s3QZy4a
	Wv4WgbQNVDR9wygQJXyjR9dm1c/imba8EtFppxEdOI8GlB3dGfU89u+4
X-Gm-Gg: AYBFou0dsm774tfUB9Fi1T/0uLZAwJExxLTwuDjk5+SQ8wZCbuo1fq5VNqZsVpKr5Pc
	vLNokohHA7vbuIW8gQ+mbWuEmny1gI2+RaGmq3yRxbuuN+f0lw5rJKVwUkVWNNPeIFpTMvW5AB/
	jRHdo/Jo32Jqyjq6xTi9By34kwL5ZR7ixAgGoi32rkPJLUs8oUoKsUWOFGU0tHKEYNPe2oTJQOG
	r9kVMUiilEbgSqSmVwId6rAzBZq9fFs4GiuYuCMBTbGuj9Sk8tfO3fOAszdVGn+gaJX7oz6UdD+
	jaks3xiUuf/4HZ2YeX/Xgzb5xjl4kHkgOflONInL6wRQHWoCVWMWTnSk9nFs4zRHyFqLOMT+MYg
	yFceRtXp1MK7Ho/lYP7k9Am7qnnKhqxKRMMdDHRGKusjml9Q2w/5FWPM+TJh6FSeetk8zbI8u5I
	n2mfPFvstXdRsStG6Ba3siwiib5VQD1YAF491RZXRRpe7ha5dTM+aVNbmmbZLS4CeNOC+mPj/Ju
	WD6d8nVh+PtH0sGWA==
X-Received: by 2002:a05:651c:2117:b0:3a3:4526:e8f4 with SMTP id 38308e7fff4ca-3a345270387mr8689181fa.6.1788277847338;
        Tue, 01 Sep 2026 08:50:47 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad010efsm326091fa.21.2026.09.01.08.50.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:50:46 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: Compute ACR CTS for unlisted TMDS
 rates
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <apbgp2h_tSZQzbdV@venus>
Date: Tue, 1 Sep 2026 19:50:28 +0400
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Douglas Anderson <dianders@chromium.org>,
 Andy Yan <andy.yan@rock-chips.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1035B0DB-D4B0-4E24-A23B-48854B49A3FA@gmail.com>
References: <20260901112541.84588-1-christianshewitt@gmail.com>
 <apbgp2h_tSZQzbdV@venus>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)

> On 1 Sep 2026, at 6:28=E2=80=AFpm, Sebastian Reichel =
<sebastian.reichel@collabora.com> wrote:
>=20
> Hi,
>=20
> On Tue, Sep 01, 2026 at 11:25:41AM +0000, Christian Hewitt wrote:
>> common_tmds_cts_table[] holds only six TMDS character rates (25.175,
>> 25.2, 27, 54, 74.25 and 148.5 MHz), so dw_hdmi_qp_find_cts() returns =
0
>> for everything else. dw_hdmi_qp_set_cts_n() then clears the CTS =
override
>> enable and programs a value of 0, leaving the sink with no CTS to
>> regenerate the audio clock from.
>>=20
>> Any deep colour link falls into this gap: a 10 bpc RK3576 HDMI output
>> runs at 185625000 Hz (148.5 MHz * 1.25), which is absent from both
>> tables. N is computed dynamically and comes out correct at 6144, but
>> AUDPKT_ACR_CONTROL1 reads back as 0.
>>=20
>> Give CTS the same dynamic fallback that N already has, using the =
formula
>> from the Audio chapter of the HDMI specification, and drop the =
-ENOENT
>> returned into an unsigned int for the unlisted sample rates.
>>=20
>> Fixes: fd0141d1a8a2a ("drm/bridge: synopsys: Add audio support for =
dw-hdmi-qp")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>> This was found after testing unrelated patches from DetlevC that =
rename
>> the RK audio cards to see the impact in Kodi. RK3588 had audio =
output,
>> while RK3576 did not. I'd not used an RK3576 board for a while so =
tasked
>> Claude to help triage the problem, and this was the finding. The =
problem
>> appears to have been exposed since Kodi reworked plane selection =
logic
>> and support for 10bpc planes; earlier Kodi/LibreELEC images were =
using
>> 8bpc planes thus avoiding the problem.
>=20
> You are looking for this series:
>=20
> =
https://lore.kernel.org/linux-rockchip/86fcf349-0a7a-4618-9001-612371b0f71=
b@symple.nz/

Ahh, I missed that. I have now tested that patch (and will reply
to it with a TB) so please ignore this patch. Thanks!

Christian

