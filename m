Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC24C10CA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767385; cv=pass; b=pP9dECUYGDi8CR8GhqNeLowHrvofXa69Y8iv5j57cNyhfO+4y1ldQ0XORytgMd+MWtLPL15wY6vkjbRlVRZzRGkFipobFerniF6vvN64gQ0ZfBIDCYWXvQuoLetgobaIT6Eqob9Ij7klR5nYbOn7ADUAEnMOaRH+0wZ9ZnTyRAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767385; c=relaxed/simple;
	bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7HFB4mQCDJA0RTCwoksk0UhceSJVfWlTMtolExlULBaOu3LqgjZHnFLEOtbT1dG38Y/Aa/DQHqWkgkwIYPN3GstVzCd3rTz3dFoWPYISkeodmx6lfhiGWfLbJ7vAc5anzWNoK7CAgdUsbtyVYY9F3SrTtRri3MAW8eoi9dTLXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss8idYNb; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss8idYNb"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343bdca7590so209180eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790767382; cv=none;
        d=google.com; s=arc-20260327;
        b=LEJpxACf37OoeuAQa+SqjyRmp4ERHPFqji1c+MktE2Id6/Ng6ZkTYTVvZNNvyoOaLX
         arQglX8fivX5Am7/nqvI1PVuNooWYZd5fThXERpGmidxv4joZUmMzCuYGtnw8QL3VEZE
         +o4pxBD6AGQ1yU0HomWMDFf5/5Vt8sFBThL1sVYSMfEj3RnfAmdbBnMG9OumImWB2c8f
         /svAoPfcL5Sg7yOD4sEP1BngiJwhbN4znwrgs7m340Dh+tygM/JLJEriibTyekJwH7WO
         rUf0nK4kwgG4V3MxbTjVxbw6VuTpp2BBIYiXm4cUzEvX6ylk159v/n6SmVmAs2Czwa7O
         q5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        fh=N7yN27tM6N/PhIKz/NzyutOCga3xyFFia1YF9sSMbtA=;
        b=C2QYe7jafzZc+GTZ51AKF5Mi4G19KpDZmjYn4xQj1CxOW2Mn4Kh9yFjHeypoDiFKqN
         +ZYAEI4GnJbyweOgq30dy/1hDlZlNBTRKXHgyw/2I2wdwarA1Yq7dx8EVVvsSm0gz+7s
         XaxXh92kJ6o3FsMpAtkLqz5OV924Hu8lkj/eYa2JXFA9dF1xGJjiZRboHYQuC8WlIkh9
         1/9/hrEEITImmIpBeXaUKpiUeVEJAua3WFPWFheCm2Y3IgwGpLCV7MkB01qbVu4PdcfB
         TPQ93YmspY3IKFfE431l/QM4apFyyxJ2sN1CQT4XblKoOEOHwYzL6knDaFJky9NbET6m
         rqew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790767382; x=1791372182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        b=Ss8idYNbGCa8wxB9qACmHEOdVlhI19gBVQ8YzhBaoyv/KoviyukEnu4H5sdcDYH2Xo
         /rE0lQSfPYAzEfjzvsDMmgZnjrSXqUieJDCx0XT5UqV9FK9H2Cg7qlYAbc/X9PT3/ZWL
         r3DaEy5uW+SkhXBECMLwafRJXIpdMYLCth1Qd5uyZ2GTCxFQAjfODEza/x1a9JsPDD/J
         NN14OYQ5oMyglvZZSqt9BhSZqw+caU5Q0kbNl3ky9Ng+qsfmkRdNjxHvA78mYlbVcpg2
         EMQ7x3uUukctZ8iZormt9Zw2UGuP/cK99IuKOoqRX9sdt5lQvkRvBtKF3g1RvTzYeaWI
         PdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767382; x=1791372182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q967mc0EqT+NcQxMSEBQMD45Gc4hGwPZY4Sm4dYQidk=;
        b=r3ne03L+fuFF5hjiWcpbrC5ilh5pVgE+JHdUCdbdhrDT4tHa1SBVbrx7hmhNtV4Pt9
         BwpY+vf+d5tqKOOYGWQp0Rev6DHFbLRw06hPtDOPTu//r9NfcphMl9Mg8Nw7Sj56UVh+
         ja/DFbrwjiVL/kL6UCCfhxo5mvFBc+f2DwsyppwEbehJO2gJR7TMYpyFFzMVxlKbWiPc
         /bpq0V8NB19pDPAjRz0Xler4SMcFt3ErMUIJjLyyfR5Qb+Zepq0bHAz1gRKvSnwjQf3F
         lKcJsCPXhMc3iyOFga/o/zBSLhfr51/qey59hfjDOLj/Dy8jRowxSY5jsM9Lt9m5vxhz
         ZvBw==
X-Forwarded-Encrypted: i=1; AKwUvBwpRBX87etoqlv102IWVIR03hvJCm51jbncepWAtzYZugjwZ7JN91xQwTppcqBqgIJiY53rduozb29LW9Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPsbkLyrQqH2b59j1jGj9yPTrf4SMu5ti1yehhGnrliZVIyF+3
	+ePQrIPyz5JiZis7OugnRZd433QfV0K0Hu+FWKvn2ybbuSqISSmzlacUA7kL+GKkB2efEKHh/EZ
	my9IuV4/+Y+rafbbDlC6xejzYTF91300=
X-Gm-Gg: AYBFou13J4qJCIlEzcUTRS45RbgWphVkx5gjc1Cy8RQDdue2jEZ87fTca+7nlO1ctZm
	PInIzssPSKA2SuWIokJHYOL79b9Ks2KlJmhlGkkoQMXIlPUhAS22J7RoBpj10t1DESsosuP4bfq
	hRcS+b4cnrOMOri9xA0B09y8bzBMVYQFAjVwL7YoUupeLBDiFgMdTm0IXZmbea7KfaYLCnGcPqf
	ATAwPeMIAKpbWz9m843NkE9AUMzTi1pmfFnE3qItmnMLJ4KwKw3atNbI1piqrnjjFMbvNu1snSc
	TQ4E64jotP3NSUCG9gIO7Wc69iq22Uil2AkFPjWC3K4KOVIN0PTP6TC+TETPcnhB+HosjRuCudu
	69bS89LErqcyrWptGYYkGqtZlksw1tP5OkvABUp8Sg8heJFbWKS5IpC1htG9UYJ9md+ryDvvMeL
	5a1Po8YnZOt/4Nb0Txc6mv1kasPhprCVTtpY4WtdipijnZnrU88SM=
X-Received: by 2002:a05:693c:8085:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34cf1818b1fmr2066899eec.1.1790767382465; Wed, 30 Sep 2026
 04:23:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-3-0d6cca376cff@nvidia.com>
 <CANiq72kcqVfvVj_b7KTHKrCDj63LMKpsfP30zafoYB8c924i2Q@mail.gmail.com> <DLSLNL9HDUKM.HN7Z0MACZZSB@nvidia.com>
In-Reply-To: <DLSLNL9HDUKM.HN7Z0MACZZSB@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 13:22:49 +0200
X-Gm-Features: AclHuK_tZvjMuy0Rny6WfvK_GwQlWAvr20_A4Fja8oGIX-etyz8meHHBtoM6IgM
Message-ID: <CANiq72n5jjW8U9VkYJZYFpL9Z5rPe=nRfs3DqmUdfxCW39oMgQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/9] rust: sizes: add sub-1K size constants
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:04=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I am considering picking the series through DRM, but it also has a
> dependency on the `cv!` macro [1].
>
> Is this ok if we take the patch introducing `cv!` through DRM as well?
>
> [1] https://lore.kernel.org/all/20260917-cv-v4-1-547ef5727451@nvidia.com/

I asked Gary yesterday if there was any more recent discussion on the
tag thing from v3. Does anyone want to do some cleanups this cycle
through rust-next with `cv!`?

Cheers,
Miguel
