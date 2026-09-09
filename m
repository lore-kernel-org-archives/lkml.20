Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C7753446B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966893; cv=none; b=jBTv4yERDnc74TFgEOdoN17RP5GF9abxb1SJMEmvQSvGUTNYjlbtas12J90G+EXvtgMhy7iwgBU5ed6NdFB1jb8HCdkWB6CzhK7K4uVNaSmeiVErYz+IMW4NKoMPXwe/fm0yRGpMCGWuUb4x4jqMML6wlEOD71JGbIEIJkAnqM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966893; c=relaxed/simple;
	bh=CECANy83eJ476WV9+m8Z1DPlG6IR5GvieLQvKQjJhkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTK2kVts6oDpGP0PCmgL2oJsP+BRRdLWJnVtrVgaH2j9+gPVpt2N3eJjmHzNp/Wn9VLHQssghAXw3kN+pDS17nJM+rZWM3mQ7Cy+29Qw3QoFsYeVZgsKBeBZtRPsgVY1nVKY4yH5ecgCmP3x/w1thekYEapds646OQD+FBwSX3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785643199c4so123735137.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966890; x=1789571690;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=haSiNz9f37NiWVNy2OnhpaaLVM7uwzgfEK4yu5ZD+M0=;
        b=mygR+2bMoJtFzlWkhpEO0ThsrCUutAFzrSXVHcGPTAHh+w8sgyUM6/+ZSPMkH8CzaN
         kXw1pCuJtuyfJulpimRyO6a2hXE7xQfR2e6KgV/+aOaYWdoYY7VOhUK+NbfdoaKk8H4l
         BSx+plJGB3ZpxCFOzt+Z3sHGCgR3tVdgCZt/f7RCOhC5mHpTfH5RvJ+/cN8q0m9ptKRE
         6VddunlBL1msqYKLZxgqUgn0Zwi6bXCsB0ezE6R7fi0ljqxIKrCyp16NRUj1b6Xd2yRp
         o5e29qCALke4SkiruHSxLSFjCjf4q9Fl13V0HN9RpbWPirxigKE9rPlj8IFkIYXx+Qp4
         ybfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtp5O/OT+YFZmF21V6MNmUohYJMjsm/WqNp4yiH2RM/a5Mzn1mn/suBrmsRQIbGVoDGuUWIcf1KSCwkkw=@vger.kernel.org
X-Gm-Message-State: AFuF++n/QYpXSdzDY1/Fzj2csR0RYBuuJNqx78TWZzLx85h/QnXKBU82
	SgnfDsqoMpH2+XxvFkbFvlJlrA+na90s023iLgWYtDhFdvLma7NpTvY3jkl9IjZWekhupg==
X-Gm-Gg: AYBFou2pkKZutKc9/1L+3ebEwYSixyac0jzawCyM4tkWT3gjOfvC65cefFpmcs2y6XA
	AgqMAf5NSonCpKW/gegA+762j7DWBph1EpZDiOQyWY6TFEuRrudDk0vALNyhzRYVVineLCnFvoW
	CpLjWgXiKn2p+XkFguO4d+hDm7anemYN8r6MAArEOSjlvJkIZ+UykZWzaueSHV/Oo2/YgpnvPo4
	gqbd9OucnavXWugtPBALqKd1EaHhq2GgoGqAorcMfv/tGxmJLraXusE3UECEfuiRacc575CRTVE
	W+jFwQKweTddKxk2dP6TI66/O3TmGn/zAyAnxTn1X4+uPKlMco582SvaNu7esaNytz5acMdtcNV
	wYQjNjKfmGQwdv+GQ+cP01kKKnG9Cn3eMO5dM3Tl9PrWNepfSXJ4ygtwL8gyxRDkSqMY79FfLWr
	rEkfobJsvKXDrJIfqBnwktes7VPr7KnyPrdeQ29fInYoTAcaBUhgMu12Wk+uVw+FfEka8UYOF5p
	+bEqT/PyTXjsat88NoHIisAQqDOR4UXE2In
X-Received: by 2002:a05:6102:2911:b0:785:c643:a415 with SMTP id ada2fe7eead31-79077c0c5cemr1056790137.12.1788966890084;
        Wed, 09 Sep 2026 08:14:50 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a4764e321sm11519483137.0.2026.09.09.08.14.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:14:49 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78830951c65so138936137.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:14:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw8N+uPJF67U7rM5iWujiZnBYEZ5jr9LEcMA+qAHMpb7yZX6ncSEFgAX0KmM3Ge/rptoZWrcVg4DKOo3Sg=@vger.kernel.org
X-Received: by 2002:a05:6102:f9a:b0:786:7a59:a313 with SMTP id
 ada2fe7eead31-7907800afe0mr1252914137.13.1788966889473; Wed, 09 Sep 2026
 08:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:14:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
X-Gm-Features: AcwNN1UB2bvnyx_MDMU6btLmRb2JR3XbtnsQvALz2JEMNNgbbOmmr-5JjuTx89A
Message-ID: <CAMuHMdXKQMn_3ZeCmjdPH1KiBDc83Eodp5vhOd+yZYwz7p0sJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
