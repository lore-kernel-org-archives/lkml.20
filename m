Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205467;
	b=Udxt17MvAYXwCmevHaiHbuieOPqqAiR5NfH2WldNoMRl1WCAmGWxlUcF/Q8nw77fgJx8
	 oV1FTs1E+EdskP+uHhOfxWBVG7OuHj1QHdEoCpiZ8YXFkM20CF+TcBHRK4ck81kLaLFV1
	 uua8LMZsgRbV71rUEWWjSLBgWDklR1+K/onYT8xNPOLcmzUM6e8txfsT1jXKY8vKuXFqQ
	 81W8LmoHmMs+zZMf+wXm8AHrEyFh2dELcvKYtrTHzhGPhR20XIo3xE8mUP8SMelLzib6Z
	 MxsODUjDf/EUo3AIYTDIh7BK8G5o+mo/nmaF+RsEwP9ecGfzborUvc2rYorV4MMneWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=bf6VlzqIelltC4HInAeut/3dEsLUfeHdqWRYHEEbfmc=;
	b=tfILr0J6uRlsmJJ5TD3VbUAvI/iPm6mHGCYshS1/F2Z2U+EIGGksTzT6HM4cUS+YxsSK
	 8zS2eDu/c98lE+dr3fzfY0MMpn8Yalchts+6NtlD0C9Qp9DBiaWVfCoYmXelGRXKg84f2
	 hYxwTP171RJ1F3vWFjNXmqKwem1Aq/TpyPTPK8PVz1zuZpB4t8SL1CHZtuE+MrRa4oD5Y
	 L2zB3sxeBp+hvNKcXRObjiDhNVwjMq0C5ofLL8DzekQaarBQl08Ss+Nter/cJdB5iALNT
	 H639hh/iCD7F1eGNSoy6vBGj/6ZNyYBYu1m8xQ3zCsPRzU8mvs85rlJUUob5ipTLqYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WjwTuJwE;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528C360A2625
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 528C360A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WjwTuJwE
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso185979766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793205466; x=1793810266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bf6VlzqIelltC4HInAeut/3dEsLUfeHdqWRYHEEbfmc=;
        b=WjwTuJwE2vrKaUjNPBtnngQrdZAiaESwPqXRow72lBFPhVkFZyUYI2XEFtwNLdJQjA
         WJkxqDEhtr7Hf2n35+ZbpAl+CovawMe3hARvkBQ87MvtUKKGs4NUv4rewW7YSIxaPoQ/
         PUOLmldsXE2ntRdDrEK+SZA8gF2+q4OSqUlqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793205466; x=1793810266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bf6VlzqIelltC4HInAeut/3dEsLUfeHdqWRYHEEbfmc=;
        b=2cNjYziGXE2h4k9ja6PVkPYcqGBbc4sxjyLqXZdIKd5M+rgVJEtpnNNmM7StPUAlkf
         I/v0v7sSvPHvx1QbzMiFHjzcPrX4EB72G+CRL/7YbxKoz/3wxf3DGAc59yzKksQqb/09
         xbGto703ByheDp5c4j96bNi/nf9zt/MjRwlOgmP+PTANbLB58yJcBcbko+HfGi3B5mSW
         scvwC7Wt06dfzt4AQtPTHadttLUjRoaxrIx7FrfVRlSOXGwovIEaU5g5siM7mnKbhyYP
         gWrq8DdhSk5J8T0GC6OR8NcHvV2a8dicsMyJh6r26p/UngpwpvUCx4vjAp/TshOu/rzH
         oFBQ==
X-Gm-Message-State: AFq9FYK/IC+yWItE8FS2tWjERxNh1gPL5Y/qVgsJqRGCrkFFEmyDnKev
	cVO/yevDyF5VoRG1FwSVLCodph2WvN5NMeLAnXCXXCQpB/vjwuvKdliDcRtYrAdca4bK6ngbZJF
	ix8MXug==
X-Gm-Gg: AYBFou1o444VMOXp+VTIdHwm1twQsLZg3XDyD1f0OiRqokit6v+38A3qlLhSWbRzB39
	WqEoEXASKUyNsSv83KIpDzFaulnBdBQSUKrrWuYys7IL+MS6hvTdzU7rpErcJduxBzD3az+3bTQ
	vMeQBRunWwZb3gAfgxrAUOz+3OcokIR+6A/cFO4EpM2Gti79YqJPUJy7fkkNwlrdsrUU0CYm6VT
	4LUZuTXgz0772cQTNqiqCHX26HdYE/As5ZWfumX3CfFTYzt0nl6HWL5rDBr7xYmzBZ9Fb0o1SZu
	kBC+abOWd4fnMwBBSgs3AaEUuB1oooEnnNQfX2nOMb6oqtZeEEe71EAvQFSw84GhcEU7LaoAB18
	bLCfW8gyrT5Z86jB3x9BlE3c2PwxrQYOHRnugtbWx/vLo/h17NdOEgnieaQbyoXFQfGY2A3/q0y
	pyazWCk43GHAwR6DwASLhlJ92KIguokkuoG5CFW+aUo8Yq1XD2nz8nA785hdsCzIYazXe7KnDTc
	19SoYUKF5/mjGzKOi9OhQweRDpLwrzYV2CgkWh7hqFcRnZ1+kaSD9OZSVjpgxcYq1xr5pSVAqJ4
	yN2BfTzq/pqs0ZjhrntyRwoi4EoPwNEywxpjlHwVua8ql6Q1omaKSQ5Mp4w8GG+wvvatvQ==
X-Received: by 2002:a17:907:6eaa:b0:c41:c718:f5c5 with SMTP id a640c23a62f3a-c49bdec8204mr219300466b.13.1793205465623;
        Wed, 28 Oct 2026 09:37:45 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd6573dfsm625890566b.52.2026.10.28.09.37.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 09:37:45 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so753045f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:37:44 -0700 (PDT)
X-Received: by 2002:a5d:5f43:0:b0:48d:f14a:9177 with SMTP id
 ffacd0b85a97d-48e5d5b838cmr7401457f8f.56.1793205462358; Wed, 28 Oct 2026
 09:37:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028080153.91945-1-terry_hsiao@compal.corp-partner.google.com>
In-Reply-To: <20261028080153.91945-1-terry_hsiao@compal.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 09:37:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UTJx=Y0cj8Snhej4opuVdZtBbKgk0pi8VJap=mOSfo6w@mail.gmail.com>
X-Gm-Features: AclHuK8Rw9AaJVpQvgc6dBg2SyVzJC8J7fFPOQkaqeSrUGkiELb89y4WGXE1g4w
Message-ID: <CAD=FV=UTJx=Y0cj8Snhej4opuVdZtBbKgk0pi8VJap=mOSfo6w@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add BOE NV116WH2-M32 V8.0, PNB601LS1-3 HW:1.2
To: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 28, 2026 at 1:02=E2=80=AFAM Terry Hsiao
<terry_hsiao@compal.corp-partner.google.com> wrote:
>
> The raw EDID:
>
> BOE NV116WH2-M32 V8.0
> 00 ff ff ff ff ff ff 00 09 e5 10 39 00 00 00 00
> 27 24 01 04 95 1a 0e 78 03 0b 55 9a 5f 58 95 28
> 1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 96 1d 56 c8 50 00 26 30 30 20
> 36 00 00 90 10 00 00 1a b9 13 56 c8 50 00 26 30
> 30 20 36 00 00 90 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0d 40 ff 0a 3c 7d 0f 0c 17 7d 00 00 00 00 c0
>
> PNB601LS1-3 HW:1.2
> 00 ff ff ff ff ff ff 00 0e 77 10 11 01 ff 00 00
> 13 24 01 04 a5 1a 0e 78 03 a1 35 9b 5e 58 91 25
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 09 1e 56 dc 50 00 28 30 30 20
> 36 00 00 90 10 00 00 1a 06 14 56 dc 50 00 28 30
> 30 20 36 00 00 90 10 00 00 1a 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 0c 3d ff 0c 3c 7d 0e 0b 17 7d 00 00 00 00 fe
>
> Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/panel-edp: Add BOE NV116WH2-M32 V8.0, PNB601LS1-3 HW:1.2
      commit: 21803a577cc692d01307102799f795a606871212
