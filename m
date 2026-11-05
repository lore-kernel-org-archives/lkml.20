Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919282;
	b=L3wjFvcB/fXE1h+CICSJfgYzPHbT0jqfheX9W6D+IadJA6GsTkGSq8zFgkXz46ROainN
	 pHJB8HzfM8IaicoWKD9wzD17J4WRuaLmpf96n8BC2TE/v3sKb1JE2BofN4nrGFYf9jaWc
	 V2al6MBVuUMgkXOTW+ALmg0X+t+zuYNtVswodrj5m+B9wMtywY+QOluvOSm4bo3b0J3n0
	 35U5cjxhIMYzx0gnSh+Na+VL8l8Svk1qcK866byWBMjYSwS2cOXLRb+IPWhfsfXnpJSUs
	 UOEJ53+qWxdq2in49X2g08KGN1wJEdTtOvdHf6SQ9fUhKXjy2QVUyPqy+PMFq2zHIFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
	b=EKfqyn1PlKTesXzZ21dlRFnW/KaEXA6e0S96Jh2Frk2xvYN7FGxWfPPa0jfpUEsK9yf2
	 by6Dd+UNiOB+0btzXIkfNKCm3WCGXaAqij8BtgHf6weJ/idpjSJV5QZT/fPkfJrurTkQ1
	 SdVpGxSKz74tc0dJ0tTSYWKDguoSg51zSL5ysqMQYwTOCUNRFu6h1udYWCWnwV1GjdE8c
	 m/AIcd0cqBGpxSPiqFHtyfYaCMwaDEd+ua8rOeN1HM977807lpKrWKav8f0RQMvKfSTtV
	 7tCt4XnW31ctRMta541r7PQDTHSaJjYyy+Cjx5Ekspb5whzpzVske+JdGUaxf/zukig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="V1kH/vFD";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F5606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690F5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V1kH/vFD
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so24463a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793919281; x=1794524081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
        b=V1kH/vFDOC2roUjkX7MIVLPpZoB5GUWnzp2Vj7V7OythfErjlfX9K7qM8bMRIRPegj
         8nGhPJfRKJig2WqKbnTot2PxSGirimEHYpZwLtYZPG4fdwtQsmQmmKM7v4y4sgo7VCxP
         JAhVXrioRCnh+guW2nJupVxo91gjaDRvdLDuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919281; x=1794524081;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
        b=AXis+ZViJuXxLdS5tNxi2dvhTpuMEjliifPTGvyj8pqzp9B4Ta5cFbHSsk3uibZzA3
         ZO08hhIm4laIq7x8fBuxR+dDXycvsbaudK97rmALO6gjCxYDGcYpr/CZRVr4o1mUDkEj
         d4UGV9IKQraaazrWwCKpgN6sK92TgHYo9Pz3fTZIbmc+KdAjqokbFOsNP2rNzXpVkTm0
         xgqk/dlwXt/AeMJV0fMaRWAjL/PgtXL8IecC+zNjtFFLQGItRmYYdYzhZu/yXqXhBtfs
         NDsR+4sPQ+zq4ZrbUuhhycif2Y0vfSJ9fGqSNVCpsfqux6EL9efyEoyLS65aR0WFbbuM
         5ebA==
X-Forwarded-Encrypted: i=1; AKwUvBy6SdC9+Mps2ZyRxsjwCTfxVwYFxhvVGIJUox+ftTahSnSmzyQ7K7SEjZhzrFwakGShCjX6juJy1k3paco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wjyzdOaOpK8qkcjK81MYx54mua3S0L/wvHenD85kT5EvvtPRT
	ihLQ++XXGDq8wbYSuDX43/9BAxYqKzdiEj8GYRcrO9asEXzreFuRJI9LJsiIci1tfviRkti1dQD
	KyowiwYUx
X-Gm-Gg: AYBFou2/aJaLPU07pCuXfeVyUKf+VEf1LAY3bXstcMOVRqcZI4XSNH3ftDG8XqWCxVY
	XAzqASQsOmubNfPr3/HcMMAUzYoYKYjTXaQ6Hh+G830KhydJwlKpCa9/SqEeXXxc5mit2KbUtTS
	iGNz9VD8unkoSYgRegtv4yuEELbai8L1fIX5IdJ1jIzvpgb1wQaykRyNN+E6p3uaoFcR27gT2q2
	vsuNl+byenFVilbTW2r6mHLciTG7xMfHKoD/MtnpshsnMzm9GZYnukD+E/i1jET6eyj55z2cvqh
	db2W9nNO4pSyF4CoLHQ553ubSzo1/lT6S/XDFS/Glj+fAx6dYcsaOJt0u4ZDPNONxjUn5mGcgY7
	fMHJBqymAJ5eDkbOAHwp1Kbpm4MoWAoQ79IQgoIsLrrjgMx+CrSO7JRqkaIkUwTu/flmEd2K5+q
	FZuZX1vNB+6b9GMkpu+886j+7/pS/C1nJWX7qYeCAnF9BAmoXPygTA37rsUJQI8hY41ht+s28xM
	wT1LDEo5LK1CzFXLT7ueVPESn5Uk1MyPPXRwy70D/FbGE7JPLJ3sjVhH+Q9bC6YhuN07Nl0fsE0
	dXmTQpEcqeMT46Q4Pfa1r7/bKAdcAbpXwB4aDfqUMi+dMZtdAEUqcAoLuY6W43LqQsc=
X-Received: by 2002:a05:6402:3805:b0:6b1:cee3:9083 with SMTP id 4fb4d7f45d1cf-6b5977dc976mr478721a12.28.1793919280784;
        Thu, 05 Nov 2026 14:54:40 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm765919a12.2.2026.11.05.14.54.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:54:39 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so361455e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:54:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwg9TtDK0VbReGLVVZL89D0B6bjMaUxzGALYI9iwfgHTks8NTxKuZpQCa9MJMuk+/gj/178RGCSTyzFS+4=@vger.kernel.org
X-Received: by 2002:a05:600c:c4a4:b0:4a1:f736:79f3 with SMTP id
 5b1f17b1804b1-4b6de4a7678mr7775055e9.5.1793919278293; Thu, 05 Nov 2026
 14:54:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
 <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com> <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
In-Reply-To: <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 14:54:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UW26c_28wcZeHkZbwwfV6-r6YTzi4BcBmJTJXzCvygBg@mail.gmail.com>
X-Gm-Features: AclHuK_Ffzk__3YGh5Ruw9BKABV7G_tKL1f1gc3qp3lqSWqolrpj8eHeMy1suUo
Message-ID: <CAD=FV=UW26c_28wcZeHkZbwwfV6-r6YTzi4BcBmJTJXzCvygBg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 2:40=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> > >
> > > The issue you mentioned regarding excessive time in applyFlowInferenc=
e
> > > comes from Profi.
> > >
> > > The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> > > FS discriminators). There are known issues when using Profi with
> > > FS-AFDO; enabling Profi actually degrades performance compared to
> > > original profile propagation. When we tested and worked on AutoFDO fo=
r
> > > the kernel, we did not enable Profi.
> > >
> > > While I haven't looked into this specific bug yet and am unsure if it
> > > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > > to disable Profi for now.
> >
> > Interesting. I can suggest that to the team digging into it and see if
> > it solves the problem. My AI agent says it will though. It claims that
> > the default flipped recently and "-fno-sample-profile-use-profi" will
>
> I wonder who flipped the default? Perhaps they're not aware of _all_
> of the existing users of AutoFDO, such as the Linux kernel.

I've been preparing a patch to add -fno-sample-profile-use-profi. As
part of that, my commit message will include this:

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25=
522aa17c2a71003
[1]

-Doug
