Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4131F4A43EB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001275; cv=none; b=NNdFogNxd5+TGDJ958VXpVulUeQBg37K55rjTOv5Vfqt84ZNjAGGVjHM3z0klbC3HoVx2QG5LZuXABrYn4Mxt69CBjF8JRFAbLOECUZuG7tkPxaAurMHZSryZPChLrtStUFMvPGE+FNfwP0wBb8iQU3wkArfqPqKEWuuqEsRTwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001275; c=relaxed/simple;
	bh=AlTk06HzLBHHE5X5apCoXfFR9gCpau/oSF99eQyifQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JHWWQq7e9wGNFtoWFdvXyhCTFFYzmkEKmMUk9h6whtihuto1nfJOTKnCNX/AruclK97lVwQuhqoUDXIOKGUwgwVQfbuje3wT1GiL11z9Ut7OL/lqN/8iC4cB3iXU5KN5FjiSsyZH9BBLV2Z+kyP5VRUrZF9Q+fIAGrCUotZiqZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NEOdHQsc; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NEOdHQsc"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e21a5408so22621241fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790001272; x=1790606072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=up7la13N5P698qqLdVjKevYqSqg9Pb2eoFO9uiD7Mlg=;
        b=NEOdHQsc/PX87hReIguePCpUO9xiGcppARF3q6B8+n3Lfkztusy+KjvicwX73WlJgs
         8tEUaiR1f9vUBKSsE/bgDznoNku8dgpMdr0X95y5jbwwPa2rqNHkjrswd+crwBxXaSFN
         uho6/4FATiqLM+aNejBaZh3s2yc5oKVSQYxXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001272; x=1790606072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=up7la13N5P698qqLdVjKevYqSqg9Pb2eoFO9uiD7Mlg=;
        b=KUe+KdOGJ/JB6RYgBCPJU8hmrT5ik3vJ0QQ2Cr8O5/paOIXp1Gk+A8WCq0zGP0qWxy
         iTeoqqqvQebRDadYCJ63ZOOEBznUtBTp0AVm78e9XsS08/SuQiQwemwhluDLrnHEN/HQ
         aS5nQNup+MWwYCxfyUxRNduq9vrBn7HtaGmWplxIQZuxqp6AOrT5XAsTX7/9BI4gsHXx
         Tr7F244LONXlWulrvEL3m2XKCf0E8juMo/ku+LBbnbg3VEz56YcofUKQMtF/WQ3KwhXL
         BnG4XMNXkv+NZaf4o4RrPh6PQpD4LD4I/4blKE/LWHlW2TCia3O+k7aKmawty+9oWX6K
         cAqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxckAjQFwoweRrXvckSqkiUD5hJhXpwBvf8mWotEFzwbsJ7W0wNgxNU9e/KS9eQLjH+SoMyNTXaZ25dXf8=@vger.kernel.org
X-Gm-Message-State: AFuF++m3Ulq/Kz37pbHEUJWu3tQ4zu2X0XEtpCqtoXA9BhSyRqYHOr0y
	vU3p/WxJG62vFZlDqKXQevyWE9XIcPak/hT9Z7Og5XmDKPajDvGHI7Wlo3SRymE3UM2AJ7mipkj
	Y8Wj+Nw==
X-Gm-Gg: AYBFou0chIo1eZv6LunSL+qrBRPgDaGZwnJAtKB6R/QBzAO4d1M8X3AU8BTZgQCvniS
	bOHJ0l2vat9e8k9byp4KC9I247o5ZIWbcyB4JaRmysyNQKOkWP8q9hzYAljU7Uy8AwjVlSNTcXH
	LTW8OlTNlsiV8dGLPrdYIB2b/zN1tpkyTW0/hvdRJFj/B1PSPFZHpEeip6YGYgu3onP0hEhlK+K
	qzUdZm9jZdbLCkQfZF9BeljoNY0attUKQmGUukg4wqXKI1O8Trz2xoJIfuul+uFYnUaLx+P6JfT
	uXLc+/KjtkZzTY8tCstQrD7WiMMxVWex2NpaF7qlQztRC0timSD8JsM1lKqRyAMdDENeqpJZ1gq
	scH1Ou1FsO9pjLW3OZOB9DkL5dl3tBKWaFBeImE306Vd5+K2bN0VK5pUKwEIxafcf2XHibrmmKL
	iEdzkdlThp3CKtAdyV72gIUbkyqY4JXLCmPKBNxgHd91gCrlJ6Pw8uFnqGzn5r24MaktGlfXueL
	5jAOc5pY2VRbdDn+w5WKWFTXoWGKlAr7cBftmI=
X-Received: by 2002:a2e:be2b:0:b0:3a1:9562:732 with SMTP id 38308e7fff4ca-3a5fbe36d93mr25085711fa.1.1790001271938;
        Mon, 21 Sep 2026 07:34:31 -0700 (PDT)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com. [74.125.229.204])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm13611261fa.30.2026.09.21.07.34.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 07:34:28 -0700 (PDT)
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso5044016e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:34:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAb43tIhSgpv28IZ9Qb2zOJdur8nYFl/H2WJ9tiWocG5NqcO5aTQ47fNz+Tor/uoYTgVk4NDrUQJo1BXo=@vger.kernel.org
X-Received: by 2002:a05:6512:33c6:b0:5b6:177f:b86e with SMTP id
 2adb3069b0e04-5b8c18055camr3271431e87.19.1790001266246; Mon, 21 Sep 2026
 07:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com> <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 21 Sep 2026 07:34:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V1wkKjXi06HDKtmCZfBSF-mrUphFSUHZHz182Lv55GGw@mail.gmail.com>
X-Gm-Features: AcwNN1XkYY9zKiJQugffglLcLBvktTTAOkyuKYc5ncbh4pswEfbFSP6yXWFImyw
Message-ID: <CAD=FV=V1wkKjXi06HDKtmCZfBSF-mrUphFSUHZHz182Lv55GGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 18, 2026 at 5:05=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> The panel identifies as CSW 0x1465 over eDP AUX and is not in
> edp_panels[] today, so probe falls back to conservative timings.
>
> EDID, read over the panel's DP AUX DDC bus:
>
>   00 ff ff ff ff ff ff 00 0e 77 65 14 00 00 00 00
>   00 23 01 04 a5 1e 13 78 07 37 3a a3 55 4d 9c 25
>   0c 50 55 00 00 00 01 01 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
>   66 00 2d bc 10 00 00 18 00 00 00 fd 00 1e 3c 4a
>   4a 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
>   53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fc
>   00 4d 4e 45 30 30 37 51 42 31 2d 31 0a 20 01 6a
>
>   70 20 79 02 00 20 00 0c 40 8b f6 65 14 00 00 00
>   00 00 19 00 21 00 1d c8 0b 5d 07 80 07 b0 04 00
>   3d 7a 54 cc 94 99 66 52 0f 02 35 54 00 80 00 80
>   00 80 12 78 26 00 09 02 00 00 00 00 00 01 00 00
>   22 00 14 0f 5a 02 05 7f 07 9f 00 2f 00 1f 00 af
>   04 22 00 05 00 05 00 81 00 15 74 1a 00 00 03 51
>   1e 3c 00 00 00 00 00 00 3c 00 00 00 00 8d 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 90
>
>   Manufacturer: CSW
>   Model: 0x1465
>   Made in: 2025
>   Display Product Name: 'MNE007QB1-1'
>   ASCII String: 'CSOT T3'
>   DTD 1: 1920x1200 60.006199 Hz 16:10 (302 mm x 189 mm)
>
> Datasheet was not available, so timings are not datasheet-derived.
> The delay_200_500_e50 preset matches the sibling CSOT MNE007QB/QS
> entries already in the file.
>
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Pushed to drm-misc-next:

[2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
      commit: 8a43738e56d9eb76a573cabab4c9c0e73eab23b2
