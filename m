Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2E4A260F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 21:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789682205; cv=pass; b=YbjPwv7M/ekHkjg+XIN+WQlBzIqa3Bl15TwakMV35McoY4F3qqdLUHA6F31FNyJacB1rmSkx8DzcnhDZE/dwo8cMcvFGsHsdx7FxhBinNZWdZjUWWCVg/kVpBkUOoqbKxg5Gj2VeY0OSWnfaSHbqvdmxgvIu4MCH32GOgZVEVTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789682205; c=relaxed/simple;
	bh=Kd9IbiYvK3D8UfksPw65v59514bF7J01K+ZWXEIa2r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPO61K/v21/wyJCswOx8LQyK6Uz8gnuPU4l4jYfCanQjHggxA3Q3uAohKCLkqwH9ypJfPuhpc897aCbL+iNBFh2FVXxmBONkN7yE7MklQ8I7C5/ZLgaZ4PPLyZlmRKgu3TwV0HwzK4/LmuWqnoLjap/IWOffzxqdIWcxXpijumc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnMFOzi7; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnMFOzi7"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466ccde2b71so133121fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789682202; cv=none;
        d=google.com; s=arc-20260327;
        b=bUpRT/LsH+phYFjll39e084/OcaQZqdn4kwL2OkeqeasLspAsSi0FE9hDlIucl1wiJ
         KsQVuirZzye2I5NwEEFQ9C612gwvLbiGHR4POZ1JLm7ZRBfEiszvhcoSgqpabjdulSgD
         oAuphL0ChZ9cHVcKxc8cAoKHAIoPSTeknDdbk2j7/q30KP8vi4QLi80U+yt/+hstzIou
         YY9EzOsigaS112+ZacHRHaWy9ZLdHHVZZAqKg5d+MYU1oLKh//8zwNnMpgalDDaeCyKo
         w4KmdN1jJqahO0zPE20/n3osIlMqYhHbh+qc4LOaPJFX1j96b2uP01KE8VOleGUgFh4e
         CHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=er5a82jOE/dMjvQLmdh6qXHLj1Ar/Uat8F/LKGOIt+k=;
        fh=Et/5LvQkaumOVDVN+cwK5HKYmCTuLQhLPYqIt/vLgzI=;
        b=qdeAlLO1tXuCe+QoxQQUYOHMZFGxyE7xIGwDygX3jSPy9P3f2+x8aXeBRwL19srV3e
         gfyjHetSnWFh4iGdXhTHfD56SNPwc3qfQ+428b4EbB6aPNCgGMYYhjA35+DlgsDCiiV9
         JVCnH9xSqd1WZ5ZAIPqsxUuynYEaWDs9sv+2KIn6yM4uyquKOnloEluRE+iF7u2NxT3t
         pe5BMeX29sNDzkUxbmvpuHL3I82fv+DjIcSIqaw8rZOv29gQxvUYyBEZyLu8Uwjm9wzQ
         gUi3xdTcea6WMg8B5TCoXrBXuPO58ksFXso9T8ZdE/xU00w8bGI0fR7fXMsdgwsOj4jz
         UW0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789682202; x=1790287002; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=er5a82jOE/dMjvQLmdh6qXHLj1Ar/Uat8F/LKGOIt+k=;
        b=HnMFOzi7k1SEuo/vfTMghp8MCcehs6umUqDfl5wHHna7kd3cLh3YzmI8l7yXffj0zJ
         2IMMQoJhIzvZUY4TwalLBWn/7HXFc/DVQis01KIFWtlO/1M+tXnh3arEnpL7XuJ9GlRR
         cFfHwxjS25GM6LuNZ/holVm9tmdEAdPrqMgCPqDLugRmebwcbh+Yr/wt9txzX2mUjQX8
         yFf0rppHgSjvkBKOoizCY3IP4SCog+Z6eYihOZTX/JGamIhv4JpZOx6M3U+2T756YR1o
         Vr/75JEtaE2BSr4V0ZC/NgJLrhg0ya/qXlMa/Bk96kSGE7Fz+Spo/FTZQj+LPqwYL9g7
         GGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682202; x=1790287002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er5a82jOE/dMjvQLmdh6qXHLj1Ar/Uat8F/LKGOIt+k=;
        b=XlE1z6skHHzwRgHDr6DCFJ/1SOccayELSCYzKrEzxTUqHnZBVoohiIkBZ7Bd1i3TRf
         umYa15IxN2VQj+kdmocA45lLr2hZ1AOltt51jDANNM/gfJOn+sttik02GVjo3pNDZmWO
         RcyrUWN2znpn5U4aHrpwBqU0DLOrD32k5XX6XSpeAQYDFMnDWa18j6PLSE6nBft34g+m
         QnAT2bqrNqpCvwyxKHPPWhmeRB7gOQkaBKmlBjTwuIvVlki/+44V6m79yPI79oRmz+s4
         0Zm3fuaBHj8gDkJ5Ezv+ZjCZRkhuChtGJSnBTTI3/p1PQBDWFhwdsRfWJp+m8beKV4+P
         9egw==
X-Forwarded-Encrypted: i=1; AKwUvBz21Gio++dqURWyLQCCjj1MCx1/Q9STulXMUIgwQxqzOBKyORMGBv5p2YHafC9VrfxyYeBk1pH5zrTZ5E0=@vger.kernel.org
X-Gm-Message-State: AFuF++m9X2btxyoGh4sNiWHyqMUGdAUPg+lUsNmBnzUNBK5xjIV62Lk+
	d6PqetpArUH/onAnv/VrG/cF9Pml/1JC/xucyCe7ySQUBdTXDr3H7v/CGTP8ziTinslm2T0lAnZ
	3y+sRSgVIihUXdW06UZ7fHWBM0yTY0wQ=
X-Gm-Gg: AYBFou0ysKOOlRXb8e/gK77+Ye5x9zAg1NKNnZX2drMPhfBAksOfa1Mjr0TAGP736Fd
	Z5SsyPl9/omdVqNQDJbb3YvzVYruN+gWyKLLCUU9Ni/NpKdyDdDCqUrGXB2PT/mqjGvg9V4ZuQl
	KoUpX2oq6DsFLB0hxNFLD3SLpM8zljwg0zfU8Awu5KZSYSv685w+gGQdQqLe2hrSGUZrhyqdvCN
	EniNHW3X100GY62JHwydAVm4aKWNQvbkNnUO6d4oxr+rQd+e3HSCdGW3cE9WHXy+5jRU/lTNDcj
	37NHEtSj1tD2Wkv9TqE9ZVsVN/ewJhA1NmR8U5y04FTVi0XYLXH2IF+f7YpGmIirF96JLJDF2Qk
	bPL6RNFi/5OW7OzXiH0ufeF2EGxYGJktTMwYE
X-Received: by 2002:a05:6820:2219:b0:6b1:61b8:7ed5 with SMTP id
 006d021491bc7-6ca9a132698mr439448eaf.1.1789682201892; Thu, 17 Sep 2026
 14:56:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917135051.47683-1-tano.dzhinski@gmail.com> <20260917215114.1136715-1-tano.dzhinski@gmail.com>
In-Reply-To: <20260917215114.1136715-1-tano.dzhinski@gmail.com>
From: tanodzh <tano.dzhinski@gmail.com>
Date: Fri, 18 Sep 2026 00:56:26 +0300
X-Gm-Features: AcwNN1UdQBWI62Niu39vnc_MepV5q8WTyFHhbRmt4e0Z1fYt3vUYBBKqOEmd_No
Message-ID: <CAJhzm-8wFgQoAt3gYHnKg-f-dVCiUycdcs38CUOa-rSrmT2NFQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Giuseppe Ranieri <giuseppe@ranieri.dev>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI - the CC to Giuseppe bounced: ranieri.dev no longer resolves
(NXDOMAIN on the MX lookup), so he can't be reached at that address
anymore. Possibly why the original posting went unanswered from his
side too.

The From: and Signed-off-by: in v2 still record him as the author,
which seemed right to keep regardless.

Everything else on the CC list delivered fine.

Tano


=D0=9D=D0=B0 =D0=BF=D1=82, 18.09.2026=E2=80=AF=D0=B3. =D0=B2 0:51 Tano Dzhi=
nski <tano.dzhinski@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
>
> From: Giuseppe Ranieri <giuseppe@ranieri.dev>
>
> nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is no
> hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> configuration with -EINVAL, and nv50_hdmi_enable() returns before
> hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
>
> The result on such a card driving an SCDC-capable HDMI 2.0 sink is that
> HDMI audio silently stops working. Video is unaffected, and nothing is
> logged, which makes the failure hard to attribute.
>
> SCDC is optional, and the hdmi->scdc() call further down is already
> guarded against a missing callback. Requesting it on a card that cannot
> do it need not invalidate the rest of the HDMI configuration, so drop
> that term from the condition and let the existing guard skip SCDC alone.
>
> Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config method")
> Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
> Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> Tested-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> ---
> v2: restore Giuseppe Ranieri's original authorship and Signed-off-by
>     (he posted this fix to the nouveau list on 2026-01-17,
>     https://ratatoskr.run/nouveau/2026/01/16963412), per Lyude's
>     review of v1. Added Co-authored-by and Tested-by.
>     Tested on GK104 (GTX 670MX) with BenQ PD2700U and EW2790U.
>
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index 377d0e0cef84..9887b3898505 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *ar=
gv, u32 argc)
>
>         if (!ior->func->hdmi ||
>             args->v0.max_ac_packet > 0x1f ||
> -           args->v0.rekey > 0x7f ||
> -           (args->v0.scdc && !ior->func->hdmi->scdc))
> +           args->v0.rekey > 0x7f)
>                 return -EINVAL;
>
>         if (!args->v0.enable) {
> --
> 2.43.0
>
