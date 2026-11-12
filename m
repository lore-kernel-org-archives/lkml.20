Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510216;
	b=aGiGfLbT8T/7InYK9TWJda7nLoVAiKXycY3QAnzCNFN3Fc58zoaxpz7wQ6oUi+LLpdJy
	 3eMfLcROnvaELu9gCIafxqmfo56JqfZ89TTdNh2kepqOe7baa1HozzXHcgfTKe+ZybZ6D
	 vGULZokeIvlsA5qol/rxBrmKZfavh/Ti80sJrSE7giXjAD3lWn+GUGktMlfMQ3pk548JI
	 JyNoNdiG9BgF6s7cJpvjtoW7b0m1QpaMR108LNeHC9884gSQkK7xjo6Ye9ulKeTiW5OyS
	 /Q1C+4ozfTqLT5k8te3Y4ILloXb16TsMY0Olku1CiF7kLAZ4uFEbwzjN3/W3epwaqsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z0LqVPtG90eWIMD2SZHKU3bFXknR8F28KDHs5gdoi8g=;
	b=5tp8Ap08dCaHP5xfWv0xKMYtcx11JLJsBUd8hZUmmt+sxD7EomEZdKwSSu13zlmgqTEV
	 xK7Uz56C3vo0PtmZ4CH7w2e37rPP5ZTe5ZMe6PtAQz0z+/ZCz0Nn5IQiAqH4GTcn2Iwvq
	 xV270BDYKSmQ9CTooVyV/933j/dDJWgsQI9WHukQ9QfAhskiJhRD96CQO/fmluqpan1E6
	 AZtyDSuNcXDRpKnAgpnmzgANZHozshAj4tgMeW1c/IHkMtGNUTCdIT5MxztuAK/GpDH83
	 4hxQQ9hdwlLEdk05JMneKO5sQtTPqlvCUTHZDfn4BQk/o22ymFgXFCw1Fk/rboPMSIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m4hzJDBO;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4B9606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=m4hzJDBO
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be47aa555cso145770e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794510214; x=1795115014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z0LqVPtG90eWIMD2SZHKU3bFXknR8F28KDHs5gdoi8g=;
        b=m4hzJDBOEZtbwArcdROpXjN2CkQW7r25/lWSPLng+/829MlHZBwKBwWAl3un+k8S9X
         SizeCBqoXUkHBrl4mLeOtWCYwWMGxgjbxtRSReEPJxmEVu5c4a0Fq5urqpOqneeMM6Ld
         Ikxv6nqTwq4EOLozqtjM1tjftALu0vKY0BoDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510214; x=1795115014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0LqVPtG90eWIMD2SZHKU3bFXknR8F28KDHs5gdoi8g=;
        b=Bw6agpeWsAmn5P0zMdGt/FI2j3Q4gYNaECpoIukQaAI4dMF+90bu/MQi2hUIgUUkBX
         hmx0PRKO/LFK4T1ibH0THaT2KDWELpWmcdd7lZ6FVTRFOpXcEgCIOq61AzyA3SSCtZzB
         Cj0oT/cjbvmiIPl9fHz766F5R9H32tjy+IZhPk/6ENIuTIwoMt2x5Oy2kj9v/9QbOhg3
         93Ig5pZ1belpcyObQSgjIRGFdo0JreRxy/oTtDF7kvKbrohcjL14mLANQmcChVll3nQw
         LSYtRdR259kIcsVlz64/r30mzd0YGZNEEhoDqupnIu1qMRdapgXRotX/3gV8u7G+DiIF
         J6FA==
X-Forwarded-Encrypted: i=1; AL+hErHt3jjx1a/D9tI40GwMtFoMA9gSUgur0PQtGEWilHrd5U0Q77Y2UFrxqa6F6JduvKeQR4zNwf1AjSoXeVo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YdrCdlkjEE+VSFStidwtwCgdj1RybSg1dtNLb6BmoM/U0SnGy
	HTTjkLOx9eJjyl6YnJTdlDBPldOCwVbcuPkLcaEamLZO+c8T2PrlJiyKlhdz5e6OpltpOoiEwIv
	3tBjGsQ==
X-Gm-Gg: AYBFou3q9Wydx3EMsOu3MahKj3yhhc5waJEVJ1sSDL/L5NBQhG41iYR6mQJhmNETQo7
	8Ay8+8OuZCJf/f/PqI5Lwmi7Ej/A11/a9YIZOBgPFR5xU2xt9l4PgxLjrGATEQMxZJjbzEk+x8f
	KzVGXpi40ZXV211QpQ1ontfoLRQqgipFSjtRAGJvhLXS5/FKkbS4QafHAdACdD6en7aqPJ0gneJ
	oM18psG8ZhYJDDrx1e2jlXFWyIX1USVfN/fIaF6as9WggQXzPXluBEazVvciRRSCph2OnYlxWPW
	jbxgdBSNn6ExhJKxfb/bIC2MdeJqjqEPsbu55Pi+GoU4Ox42z/ac1kV5cRtyzcQuLxnYqqayJ0l
	/zODs5BooUnc2rc0JTmpR2RqXSYl4McRb/JYkR88PGzu2nMyAWQOh1EYJLq/iNFe8Km1u2mv1wa
	QN6+s8hSjGefnIBsOX56UUoKuX1V0MvLZEDfs35HYhf3SYQGuFrdWaJMyGASXy/1Syo2NnrfJ94
	E3h0V8yLbloep2QqbBQhV6/zYxtI2igM5SqUCtezX7iJdnP12GmwkMPy2Amhu4Z5pBUlQJKmwRW
	cUmoyAICO1ESOZ4htqkSm612b/APgat860v5XY3LIpV5SVJxe+mN40a0v3RAyc58nvLwZ04KGnb
	Y2AUqeAawSJQ9Mg==
X-Received: by 2002:a05:6512:1114:b0:5c1:598b:62e8 with SMTP id 2adb3069b0e04-5c170a159b0mr88310e87.56.1794510214319;
        Thu, 12 Nov 2026 11:03:34 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9f7esm23683e87.12.2026.11.12.11.03.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 11:03:34 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so110993e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:03:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG41NDYI2IQ/H5WDnPWrduKUMdz0sLRKxz5TJ1TWjBP4adgeA9fkyAkyxX0NFO3W0ALqkZj/FuiweuK0Qw=@vger.kernel.org
X-Received: by 2002:a05:600c:1c18:b0:4a7:9044:a87 with SMTP id
 5b1f17b1804b1-4bb55ac0e34mr2161075e9.27.1794509892596; Thu, 12 Nov 2026
 10:58:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261006231900.3230373-1-briannorris@chromium.org> <20261006161337.2.If1822f9a34be06cf5939be44ac6465c543087c75@changeid>
In-Reply-To: <20261006161337.2.If1822f9a34be06cf5939be44ac6465c543087c75@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Nov 2026 10:58:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VbcYGJP6ag_pxwNB3s2iedeF8rey9QUZo3B2YQm25diw@mail.gmail.com>
X-Gm-Features: AclHuK_PiPmNrCWJDrFpHZHvHvTj2hKqQgB_JTPOXCKXOf56_rtdlcICXQ5xuAY
Message-ID: <CAD=FV=VbcYGJP6ag_pxwNB3s2iedeF8rey9QUZo3B2YQm25diw@mail.gmail.com>
Subject: Re: [PATCH 02/13] drm: Discard pm_runtime_put_autosuspend() return values
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	Ulf Hansson <ulfh@kernel.org>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Melissa Wen <mwen@igalia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 6, 2026 at 4:19=E2=80=AFPM Brian Norris <briannorris@chromium.o=
rg> wrote:
>
> Several DRM drivers use or propagate the pm_runtime_put_autosuspend()
> return value, which is not particularly useful.
>
> Returning an error code from pm_runtime_put_autosuspend() merely means
> that it has not queued up a timer or work item to check whether or not
> the device can be suspended and there are many perfectly valid
> situations in which that can happen, like after writing "on" to the
> device's runtime PM "control" attribute in sysfs for one example.
>
> For this reason, modify these drivers to simply discard the
> pm_runtime_put_autosuspend() return value, and change the return type of
> v3d_pm_runtime_put() (whose return value is never used) to void.  Also
> drop the redundant pm_runtime_mark_last_busy() calls right before
> pm_runtime_put_autosuspend().
>
> This will facilitate a planned change of the
> pm_runtime_put_autosuspend() return type to void in the future, similar
> to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
> type to void").
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> This patch is independent of the rest of the series, except for the end
> (changing the return type). I expect it can be applied by individual
> maintainers, and we pick up the end once the dust is settled.
>
>  drivers/gpu/drm/panel/panel-simple.c | 8 +-------
>  drivers/gpu/drm/tidss/tidss_drv.c    | 7 +------
>  drivers/gpu/drm/v3d/v3d_drv.h        | 4 ++--
>  3 files changed, 4 insertions(+), 15 deletions(-)

FWIW, the hunk against tidss_drv.c goes away on the top of
drm-misc-next, since it's 100% identical to what landed in commit
2cc797f73768 ("drm/tidss: Drop WARN_ON() from tidss_runtime_put()").

The changes to the other two files look fine to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next.

[02/13] drm: Discard pm_runtime_put_autosuspend() return values
        commit: c88084027d0e922dd925b96e5a0d184ba04a8f43

-Doug
