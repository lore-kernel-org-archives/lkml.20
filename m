Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D14AD7D4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377917; cv=pass; b=NndKAd9nVeuzJknH2bTfbHycoCbAO8VMNXzZfFP8upgbISITazq4k05f9XROXrfuILR7ymTU9zkjE+97O+P+S23HoNTagTH7BbLyxNfUdFzxiAHACKRVOqn3E5xABAOUhZzppXUHmizPhkkQ2ZAtS5dCkwqFHFblNqEKrvhSaJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377917; c=relaxed/simple;
	bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnf1yDfSQCHyAgmgi/DPaZ0FAlBU+V2zr6tK3x7A7MZg4IICcio5gHMIl+8p6H5uQ/Wdk8JPhPyUMxJuQrrKuD4jPYZyb6DxdMhi++vJPOU4yrvIm5we9cnGnJMCY7UqQBLYi61wsj23uTQkv/55QNrnTfnc9enCQ9GC2JyB0Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEXmUauc; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEXmUauc"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90ce08834feso21190966d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788377896; cv=none;
        d=google.com; s=arc-20260327;
        b=lUyRJCoO8Jl2Xm1hFjxMxd+9IEmZSEtiwcgDn6DV9mOMl1/f/Odq1GQmfgFIQlyEMn
         fhZQ1rhTGfWuL5qj+rrgBpUJYQ1JZQKxvFUkfVp4lrqr2ucCiwL6okJHj1sOLusJM4tu
         kPpJdM0YTytBgRQRYqB2P4QCLnvfYHS3Olv+ndUdg5eUubuKQHihnfmVml+JtjwdmawI
         v5xmn0hMzc9O7wL+TgxSVWJ29XS/3wx/vvIlqeSuaUWtOiCxr2ZSO/oJoZUE++nNX8Qf
         pr78Z9XrUJ4lgN6aiC9R4Tiit8+j+W1EtoYCtlCtb0ME1yHDJYERAZIPItZeqecxRsVp
         qbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        fh=choylytWUS3dq4ATBTD2qQaDm+LSTDkDDqshBnlssKg=;
        b=Th0i49PCNvgfZNipXIHWzzm9E3qMLFQ2si7MrUydlOzryx2R5l/UNiJE5PBehHm9T3
         wP3lXKAQmuQaG+w7icpUpLhEdCBWMSU+sX2na1yfWG1xR/4KrtOtzUE15oJqgCWsVyWk
         bf2c59ndoF/xqMIKOCy2tCxfnQBa287Kh4cppRw3mblep5kR6r9rLDfPtlVg1aQAiBSr
         oDGCatLYukNrEcn249b4ajK50owqezRZyMNc/GJUtreoox+tBvboyqipKu//2xytCqdH
         yvJ2vM9ppeKIPghrI53SfKxly1tJHL/y5D95tQRK49ArnBO5ni5FrCpXLVPPSUpsXZSh
         yegw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377896; x=1788982696; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        b=KEXmUauc+ZkwkZCWvWyWC7k7azK95lh0+eeOaxObKFmzM4zg/Ki9JD8fzIXJxu4usO
         q1/2W99BbN2VtDzpkcUhru+8iJsT6Oid+lkWbZ9JsQb1yX/R9frHWfV6H+w0Oo68PcRT
         dDI8rd31XIVFfx4/1PZfpnrdOY4Kg3MWxl3yO0NX6lJPi2f5Yo1sjt7e+e+PS5NK+b2G
         +7UVfoXITlwxOmWKAvkw15T5JOvXZvRhu+JKY+ctCRmwrpbV/2QRxQXue9nLRxojNL/i
         iGBdbsCIXsGvHyE9Ftg2HDi11y4geEnMukq5vnT7JDbL+URSNtNm+qq9TRXixn+9WBjr
         3OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377896; x=1788982696;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        b=HqDZPx+YJQbx4Cn1Y/knLxhExlaOoVjq6WJJSYwIv/K9jIKiY34EK4R35ofstTrecz
         wJMSlr1gjzEUkEMyFqZfpEMEvsHTqlaK/BaE3saDXjPfbFc+GgtQZHhz+fsJj7mXk2bW
         uKtAkihvbjccU2Oi/9Gehe2qvWhDqoXJn3GKbi+7jQANjJDV0zNBcJepGpiHQlkBdOR8
         90EuQkHP6eRNM3bxtVxuYwgnsTS8E42PiEm5biseZtLbKsCkQoCB8V5C9F5vS50UdORu
         2kgwWn28AzmuPLipdpDz93YroqJO2YWUQwgPrwEzGR4+zw8eV840afDgyjGnGPnfWKhe
         ehMA==
X-Forwarded-Encrypted: i=1; AKwUvByfdGJ3mrp98OXf/NFzZzDPKT2tsTBKJaGXFq6uXx1ICLjs24dG4fIoosIrZ4EwVDhngPzsKvL+TJAl+7A=@vger.kernel.org
X-Gm-Message-State: AFuF++kububxO5hnGzXyqXB6PMDQqylzWkXiSiiOE1O1Tp2r1K535HAW
	4KwIRNo9tp/db45tgtzvVXOYs/24A1BrpE1cx8vNOwwxd666gjmz1raITlB2Luq9FtI6QvJ3gtu
	YjBjkAyZ9BPClf9xe2BfLW1JlKMTa5u7zTCi1
X-Gm-Gg: AYBFou1Zflo+y5tbKbwHQfuWWbgzsnfes2btD+fZbmvGDefQR9XHMEx5G3otadb7+G+
	OP5lNK1FygS/0/sSqBKLyLbCVw5vRjSwTHCF6sbdCvftajWHYuOogGqN+FR5zz3zL8yDr+iVzgX
	7ssD4SttF8H6jksD52hHLREzneF7E89tLFlGLI+9ZEyqx8dN3BALwxBsCctxLVclsgzZROe6Ura
	nDttmHQn7hZTlOc8xPNz8ojfczPVacuojcHix7yISOvKaQnsTDbEtK86+o1MgjAh90dzRt6zaQP
	1wiaFkW4G35uxmYAaumAYf2fFEwAQJ4E2SAj++uyamPhbO4A7SBkaJJFcwjtGv5NOPQcCku2Ocq
	YhJ8DOb6LCOpcXE8W3+G0879iA1yXDaZhMTCbg85j
X-Received: by 2002:a05:6214:2123:b0:908:951f:415 with SMTP id
 6a1803df08f44-90ebb005390mr85498866d6.13.1788377895624; Wed, 02 Sep 2026
 12:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org> <apZCTUYiN5FHCkCm@nvdebian.thelocal>
 <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
 <apZbKc5xMQ1yTBTu@nvdebian.thelocal> <DL3SXIIA4FID.2V3K5YC91RM3V@kernel.org>
 <apetgjQ9zWpJATj3@nvdebian.thelocal> <apfJhtr6BpMosz1q@nvdebian.thelocal> <DL52TB47MFFY.CICXD0XQ3T5K@kernel.org>
In-Reply-To: <DL52TB47MFFY.CICXD0XQ3T5K@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 3 Sep 2026 05:38:03 +1000
X-Gm-Features: AcwNN1V_5ha_snCzThXD4CKKNnM_EsprQAGBXp8YrnRXkYcD_qK4vrhdwG6Bj_k
Message-ID: <CAPM=9tyXx=BVy9E6PZNwYwab0SWWpFOFgX2jktqPVumiqY2viw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 05:27, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed Sep 2, 2026 at 9:05 AM CEST, Alistair Popple wrote:
> > On 2026-09-02 at 15:21 +1000, Alistair Popple <apopple@nvidia.com> wrote...
> >> Ok, so just to double check are you happy with an accessor to return
> >> gsp_static_info as well?
> >
> > Still interested in your thoughts here though, just to avoid churn because I'll
> > probably pick the wrong answer :-)
>
> Yeah, exposing that for gpu_name() seems fine.

Though userspace doesn't probably need this, but we could I suppose.

Dave.
