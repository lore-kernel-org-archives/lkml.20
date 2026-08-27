Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A929C46985A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787848293; cv=none; b=I0yXDbK/cTecxOdGrgAItwT/cPJEEbAeweGEthdOGEwT8Jrv3h7WaE86RaTgyFL9VFJl1EoSCY7Q4/nqnv5NDUN5vNiDrIDlzmgmCBN17K1CgDTFNN5EqakVPL7AbYFxSyYJ8eJqzMqG6qL7LnN8eoXAGm+GD1Tu6SP9Z2uZhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787848293; c=relaxed/simple;
	bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DgBGIKiBcXPRjM0rzQu7xtkjn32BiYKtzVgIR02rRiLALv6aCy8FFnAPYO6Cyk3/aP8hHld4+uZzaDukX4e3NLuVWnVqGLKpq1Dh7Q1rz9ROzcKY3IXl0pSE/mbRaXgt2/SO9w341qlW9DwILbxE6tnQvpRqBzOoMJ5xNoYxE/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c/gNs+DZ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c/gNs+DZ"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so928022a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787848289; x=1788453089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=;
        b=c/gNs+DZCqF393qMSHQDbBHFQ6qj4HyUZvCFMoe0Wn9x757vkPySXb0+Gear7MS1Nq
         q/aBzjoCIUvFAVaO6gNYmL5+a06sB5zTfLxPhMJwi0E2t/zQvS/VKiwJvhONds/SUryr
         6OxJjtkIGWPpP6q1bai5ubrx6twuGWqDziPKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848289; x=1788453089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcKZ3uCSxaYzrbAxVt2stjR9PoVzqelhi/qCqZ0scZ4=;
        b=RGVUpOW/T17dp1DPKguX/tjE3/MRZ4dyqVuOmkD3uL+OcV+xqHcb62xaprr/csSp2C
         soEdgoDfHGef5Ee6IUs1rnf3a6YqigJRaSpuwB/gXuPZcRGKqSxS9rb1nv8YLKw75lHD
         65vD7fEACsEtJJRJeAkcVHaTv66MabT9bNmtXcQ/1k8AmAJMiQF3dcuh2S1Pt/A+aEKO
         l38ui1UCNIkANfpDaUUkCyCf1lYkXuPRdwff7+oUDuqKN4Vx8+eXQxqfFFFZTqC/jvgC
         iceVQng3ku2H9pca4Rduxo6F3gvjrWDOgRNZtKIQGhhpp9E+CpaigIQkdVOFlbp6vv42
         zDYA==
X-Forwarded-Encrypted: i=1; AHgh+RqAXZIEyorQ3gTPC+OWCTbLwLgJEWMoiTf6qwRksjRgSaMNLMxLIH2PgPvMrWxgoekc4WMTM4mLF8/juNk=@vger.kernel.org
X-Gm-Message-State: AFuF++nykfO2DW/Fm+t+WR3dry7gCs1D1oPMbIdZqtg25HczG2O0xrTg
	R57OTrXfQ6aSafw62XeDilRSbm+916vTTD/lVE2+0nztKv5zfYbZfvGrAwGqeklEpQtprnnQrEW
	PUbSqU6A3
X-Gm-Gg: AR+sD11iEaSmU5uIBDvzKfU4t2NoD5Ykq2unDumXU9v5RZ0T6QEWAAv2H+nU1cUteW6
	q1DCue4XDupFYkNceqirU5SvYkQdZ753oh99LVFTnrvKBPEjetkprs83JYD/3O1h9Wcmhnj0i9k
	/+Ggz/ANu8zRLGFWcgiDx2uZE+P0DMVuwTkIFsTDrALD9Sge03fg4VhjVVykti3qvqPsaXJHWkD
	b+5YvWC/pJQk/nkWjKIEbZanuETOKVVKoHIyiMPkMtn1RcZ4b3peYeAR2W1baqp9FkMOFgpKNnu
	aYMjCiLnixqTaLPqy7VNxXUmcKDDHSgWEmRt9T/V9EgsdNp1OfDihxIVCBHueLGumviDdfp/mEg
	4hH7nDVnQqrcmqTKUOA8BWE53r4k2ECvb5/HvkupOFWKK1rXESNsGeg9NyODZ5Vug9JyPygTKR0
	0gV9rZxPvWmcye/jcy8c4eEgfQ3TUJFSZVo+jMU6rJQGDYSP+Hpgyb5elPFJRgza3Ia56t6wcOf
	+xNKwZ00bTNMpncTZaJS+xaggema8lDrEXCow==
X-Received: by 2002:a05:6402:f0a:b0:6a5:f4ed:7760 with SMTP id 4fb4d7f45d1cf-6a5f4ed77aemr5301251a12.4.1787848289518;
        Thu, 27 Aug 2026 09:31:29 -0700 (PDT)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de5f7bb8sm6724645a12.0.2026.08.27.09.31.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:31:28 -0700 (PDT)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1670dad7a8so4694466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RorQgHuI/Rwc1q7XP0K/IkPPvsY3EK+hIQQZDfsrmxXzDhUvbtOtnfjiilYCfovQZ81Jjo1uGgkcAq5pXI=@vger.kernel.org
X-Received: by 2002:a5d:64c2:0:b0:482:e10e:58df with SMTP id
 ffacd0b85a97d-482e26d51e8mr23348728f8f.21.1787847829596; Thu, 27 Aug 2026
 09:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Aug 2026 09:23:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
X-Gm-Features: AcwNN1Uxl8vA8-7oT2LAyO-KpGAM6LbpIr9SieIL_bb_C2KnJR44V7-XxhJsCE0
Message-ID: <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select DRM_PANEL_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Pin-yen Lin <treapking@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver uses the drm_panel_bridge API and not the drm_panel API so it
> should select DRM_PANEL_BRIDGE and not DRM_PANEL.

Which exact "drm_panel_bridge" API does it use? I don't see any...
Certainly it's highly likely that the next bridge in the chain is a
panel, but there are no API calls that I see. Maybe the scripts got
confused because the variable name didn't get updated in commit
5486eac81004 ("drm/bridge: parade-ps8640: switch to
devm_drm_of_get_bridge") ?

-Doug
