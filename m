Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEAAB54CF52
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923689; cv=none; b=DmCMRMhCB3wmErLOzav/fLsPPyfuk/lu97AFCHyJasSW462/cwfwESAcqcuZ81g+FMNbHrHgpFcEz31HYZcPoatMA8g7noD4L5CsEBsR95v8xpHfztyF6jneXetULoAffOSn9UGgV9+6LLp5Lw72xLiSwadnWI7BWkxGKc1Qeew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923689; c=relaxed/simple;
	bh=Ap/LGDRwVP+vYdrKZpkQ/+Ws1O22Lfey84MH9upBAkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=brzuVrWrUjy2FY3+debBEHuGhKSveO6j1KAQRZ48eiO0cO8DDnL+rKTnzGXStypcT72YP0VtGMdun5EEaSySw+uhBxqPQ1wP0fEegn3NLIjN6YBkjt3M6qlRod2zW/J0PsXAzXBIiiIqLeDO0jhNmGmqDqUMSiPZOMqKo6NXNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nu6g4BeI; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nu6g4BeI"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b1ab02ba4dso4348072a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791923685; x=1792528485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRyXOA+JX7lgigl5HRlTXnjpTB1Jlu2dYiEEb0X10kw=;
        b=Nu6g4BeIR/6yz9vWcJIJZQ4oIUnLD3d3hZ11DBqxXQX4aDy6bjQ1PJCXQznx/Ekp0e
         SYH2ehInTb+4MPjCOtVc4I26WVmFbNEC3ajNVIlQLfwl6QyYQ/8sV4SZUeK8YuGh58y1
         0cac9I2Bw+nZQbIVCUl6RVKU2JiOSQ/m50UF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923685; x=1792528485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRyXOA+JX7lgigl5HRlTXnjpTB1Jlu2dYiEEb0X10kw=;
        b=qbyCtNiSx+wUwe6GNXCNX8C0woeDeE7PhnNaEWmoxL90SBebmjFo0m5xopqIaeY3W+
         c90xguDqDDAdrzPt5YGXvo/WBCbaTqVXprXTGJOlkkwzhTSJDdkA162otTfjI7nsGMS3
         xOdQuhlJOjgWVq4wuShgWJWy5g2IIkn5bFk8P75N38T2S3xc2nN+WP3pfObZCpc6yaKM
         9e6Ph01O6bPL3SdSYKN4ZskxiIHqS0nv7IZ7lR5Ud/umcCPOAysGxLEfZ+yqDrFta57x
         cHm69vuvfK5bYIdpJeZhgiRkAGY5srj/gWP/K+uO+OICbtwadBCLMByF7SkH5rN2Lz3O
         fO0w==
X-Forwarded-Encrypted: i=1; AKwUvBzBddTOJ/cWYM98bxund/Zq2QdEVVnF+7Q2F8m6LODFEvTjnn6+aAMArkQ2IJX3n5KeRq6pyjE0ui+3hwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf7LXZpoAXgVxxfZ3hpOPd845W8c9uWJtgyXJxTTic9Bn2OOpF
	EJB7QDkc6JxWbfrmBpMS0qVTS77LMAmL/8dEaYWkCi36H/r60zOOYJV/1zQtj0Lt5gf1T1D5bm4
	r4xvavA==
X-Gm-Gg: AYBFou1a8N7dyzDbGyEIwsXwLHMag8vdQrl/sjMvb/jvvbTIHsm0KMEzalr7IeGkG1f
	pGC4q/JV23Lp4m50KiT2O+zwmyaoDg6pzgF80DR2XEoxxui8sYgynAHiw2mkRNIqYoMegS6k9/s
	jGuHBNUOvsAPVQq8GSGiQ/8LNLqC6Chd61wUhR6oR04r09S7S3FX+ZugXr/sQ/h+9gW962H7dBE
	AZ6yvZ+LLE+guzCRRLM7GgCXYvhyIzOvhKtitlqUdbum5G7bS9V7zEppZ3hF8EBsXW3PHcznwsi
	b54+y94/kKZEsuOOVugDIHbjCSYtjMvs9xOukGHKfX3YsBMVWDzqI0llhP4cyNlaRj9GNOK8OUJ
	bmKjqCql8pEu0MYBUvv5rwrysgU9t1+Ley5OCXGDz+vhfa2DKzqMN95wSrG0qBlJZXuSynGduvB
	SBr4cgEHZ1sPLC+kfhk0sACKqu+IdkFtjO9mFRcLBufLGaOLLE+R1N6mfh8N7EtW/xMfC0APLpw
	ZytFanfJ3FjKleCT4eeBNdSx5hNpjcysb+V4g==
X-Received: by 2002:a05:6402:454a:b0:6b1:d894:3e8f with SMTP id 4fb4d7f45d1cf-6b1d8945137mr3506097a12.4.1791923684939;
        Tue, 13 Oct 2026 13:34:44 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203762b3esm292522a12.2.2026.10.13.13.34.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:34:44 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c4d870d54so2111663f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:34:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzIVBgQnHtwQFETxoF5O/EutLMey28aT+CMMHHGuzM6i3T//kPpnm3iMsgejH0j0ze/PxMGSA72ihjahE=@vger.kernel.org
X-Received: by 2002:a5d:5d09:0:b0:482:fd9c:3740 with SMTP id
 ffacd0b85a97d-48dbaae8af0mr23584550f8f.22.1791923681866; Tue, 13 Oct 2026
 13:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-panel-edp-add-auo-v1-1-c04bfe6cd9ba@canonical.com>
In-Reply-To: <20261013-panel-edp-add-auo-v1-1-c04bfe6cd9ba@canonical.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Oct 2026 13:34:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdYtt9Mbuf6iiLAcanP03q08mp4CsYr5OjBZsVaZtQ0A@mail.gmail.com>
X-Gm-Features: AclHuK-L4h7J7FdW0srYMBeoFtuGBdzje0hch3mXxOZFm9S4lHHCQE5Jh0nhQro
Message-ID: <CAD=FV=UdYtt9Mbuf6iiLAcanP03q08mp4CsYr5OjBZsVaZtQ0A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add AUO 0x0db3 panel
To: juerg.haefliger@canonical.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 13, 2026 at 8:57=E2=80=AFAM Juerg Haefliger via B4 Relay
<devnull+juerg.haefliger.canonical.com@kernel.org> wrote:
>
> From: Juerg Haefliger <juerg.haefliger@canonical.com>
>
> Add an entry for the AUO 0x0db3 eDP panel used in the HP EliteBook 6 G1q.
>
> The EDID does not contain a product name descriptor nor detailed timings,
> so list as "Unknown" and use the standard AUO power sequence delay which
> works fine.
>
> FWIW, this is likely a panel from the B140UAN series.
>
> Raw EDID:
>
> 00 ff ff ff ff ff ff 00 06 af b3 0d 01 01 00 00
> 1b 22 01 04 a5 1e 13 78 03 f4 75 91 56 58 93 2a
> 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 0e 3d 80 a4 70 b0 32 40 30 20
> 35 00 2d bc 10 00 00 18 b4 28 80 a4 70 b0 32 40
> 30 20 35 00 2d bc 10 00 00 18 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
> 00 10 3c ff 0f 3c 96 0d 0c 1e 96 00 00 20 01 e8
>
> 70 20 79 02 00 22 00 14 8b 62 02 85 7f 07 a3 00
> 2f 80 1f 00 af 04 31 00 02 00 04 00 25 01 09 8b
> 62 02 8b 62 02 28 3c 80 2b 00 0c 27 00 28 3b 00
> 00 27 00 28 3b 00 00 81 00 15 74 1a 00 00 03 01
> 28 3c 00 00 53 51 53 51 3c 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 8e 90
>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 2b455369ed70..6fb60b2b8894 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1958,6 +1958,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x0290, &delay_200_500_e50, "B140X=
TN07.5"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x04a4, &delay_200_500_e50, "B122U=
AN01.0"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x0ba4, &delay_200_500_e50, "B140Q=
AX01.H"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x0db3, &delay_200_500_e50, "Unkno=
wn"),

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next.

[1/1] drm/panel-edp: Add AUO 0x0db3 panel
      commit: 34081b8bbbbfb9adbe04f764f718de04df23a84a
