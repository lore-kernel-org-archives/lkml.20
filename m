Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5EA400974
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791140210; cv=none; b=drsFAv3Q0gc1mM3hyJ2bJCceqn3YPWYhnqCHxw+lJaL7176G7lPSQ2ZPjSTmunrmWBvBSX814fAfK+vvLUfmSB2HyW6QCricR5UJZ/nnuMKkHiAFBoHnfcsl+87P2Q3eqhIjg/xbpq6vkWlqR5QpAybU7k2owX9+FqDHfG/WL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791140210; c=relaxed/simple;
	bh=VTj3CjFmC5z/dk0JCaA0IK0lT5Ac/9t7urJwAwDbeYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRJPBQzV+9SdSclSgHXM1lkRd4c2URnRXrgRuDDQHIJm5IE8+hAEHQV0awsVxszUOfNhrHavxFOb8ggAojPo+ivfSdsIIVrEIMBf3l6m83l8l1BGsaW/cSXX+qIOticJhZmJkjUmENwahplqqG2WFjmuAPkzqJ4exm3MgCONPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs53PO8a; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rs53PO8a"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso6354205e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791140207; x=1791745007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=;
        b=Rs53PO8aGtje+RESDecn/lmAHXtNqojJu8nzqQalVgLSX4H00TW/wvMbJCecyvLB4v
         q9t8bY2emZpOPGa1h7F+9ij25uVvPaO3yl5lE2kSPQ6XLJUCzBpoZ1llZgfln5jLmRTK
         VNypW6hrgWjmRPL3CYiDoSCwuSLqFu3Y/pjQRN58QSEBC886UYEs6uxuWvj9idcGtiAo
         NS6wC10/8ngy8GvKFJwYkrXp245ZG6t1C3d79nqfTsbnsgyGNpDAH5TNdgVYZHwpp/LF
         ZWSQAl3biIQ0zVkTFFJDdvM3TZuSeaC3PDpO8J5dvLeIF5K3eSFauR4Cdrr2I/r70KUd
         BdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791140207; x=1791745007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yLp7Ndo/7k4Ng8+ohcODGZItHn+YB7X4XQ/xgVicdsE=;
        b=VUGP3yMZkBMlN1pKANwqsFHVoljDFfKqHxoOzsBdcRmxZBoNbK7wohpqmnWwOxL8FD
         KnCfJQnQyxC6jAPLhMjAaGhhEqy+ERzS38NQW26RtQIMFNaZAp8eWfu7rTmRtMnq0/UH
         g7vxtB3ILeWnF3/VYw4KjiUqv6aqe8ybuk+6XIdwoK4zUCcOXe8ygY4itR7UByEbFhQe
         PHXEwQdkudpOqzDDm7Fg2PaRQe7uTPZX11RRejEByjuX4cQyEK3eHskroBXiL2fOzh6v
         crg4MYYdXY6bp39q+ouCzjTfETusFMl0y8H16dWy6WaC9+HGS+zggsQ3UNiPqLGshmi7
         HAZA==
X-Forwarded-Encrypted: i=1; AKwUvBy50KLqNn4UAlpq/QoJQoogOUvFKjskqYUGEcN//7OiobwMF3n9+hkA3uCQGQHSMRyDdUVH6FZDQzYn/Qc=@vger.kernel.org
X-Gm-Message-State: AFuF++mA1VqEvxE/0wINaUeAYdsO0IpeM9CkOTW6gGWVvoHGFVLwnIfb
	0wdooqUKp+nGqfQOur5BVDvQQIkZDG/kKenUcU1GBNnKX8oYSyCevjJt
X-Gm-Gg: AYBFou3vHSrh8f4UfAkngjx0xW9v5XHFXBTJSU6d+Fw59cp4MvCkl/I1EPxhhIcB19b
	MVVkErtCskhxBLU33NYex0xI9GdviUEL48GTUw844S9Z/8wlZTVXN0PFHujX7PDQM6DeSv13AIZ
	4+UiQ+8C2G1jNqq/n6TkRD4eGUtPEZzS6gL3cNS02NvlQH0NQKvCmZU3KenA/9g25woeE+NWWC3
	2wjnx7bsRvR04usFcz7CmkHk+GzP1IUG/98ZXNdpApy0uYUOyvL03hdA2M6OyddjpPQWAZmVvAU
	TpcO3aHyIAeQEN4KmyZDB1mmevdkGsYGiFOOjLlMo54R9XP8hp50YMSRJ/w1d56Gsc3cOJj1kbG
	ULFqwqenLqsu2Ixe8PXAoywE5SvMIUFesOE4hssm/s635TepHAA2ol7oZCjUpD7PbIOy6Dk/o9E
	MvsGBnC5xROS67dA+1g7DI4I7kJAAYN+adacGu8bzsQ0a+sF9tOhg35miLOGtNNpzkmuHFiVFUG
	TAAcPn21wHiMvtSeZ6LGS+Z7xRXi8Wg/VQ6QPdPAZXwziFKtN7fNqZ1v12hhsof13EhJg4Mv/Pa
	WDWurjt4HamnH9nSu2qKISwodzRCngDCzi63dXElF+ToWNOyHoafkprxks5uMSpbsc0q9pVwDCt
	jX2d8cMc=
X-Received: by 2002:a05:600c:6212:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a02758405cmr139001325e9.19.1791140206606;
        Sun, 04 Oct 2026 11:56:46 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a190-7401-a90c-9d77-a1b8-e6a2.310.pool.telefonica.de. [2a02:3100:a190:7401:a90c:9d77:a1b8:e6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280bcf0fsm318633385e9.6.2026.10.04.11.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 11:56:46 -0700 (PDT)
Date: Sun, 4 Oct 2026 20:56:43 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Bradley Morgan <brads@mainlining.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: rust: Enable Rust support for ARMv5TE
Message-ID: <asKgtWX7q-mgvnOc@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-3-kmehltretter@gmail.com>
 <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kGay03jqFOfFcJOjr9Poy+yc2u0=Ep_9LQ+KMy=1JtRQ@mail.gmail.com>

On Sat, Oct 03, 2026 at 12:24:35PM +0100, Miguel Ojeda wrote:
> On Sat, Oct 3, 2026 at 11:38 AM Karl Mehltretter <kmehltretter@gmail.com> wrote:
> >
> > Tested on v7.3-rc1 with clang 22.1.8, rustc 1.99.0 and bindgen 0.73.2
> 
> Great to see more arch support! Just to confirm, are there any
> toolchain requirements to be aware of?
> 
> If yes, then we should add them to Kconfig, `scripts/min-tool-version.sh` etc.
> 
> If not, then please test with the minimum versions too! :)
> 

Thanks for suggesting that! No extra requirements as far as I can tell.
I now also test with the minimum versions (LLVM 17.0.1 and gcc 8.1.0,
with rustc 1.85.0 and bindgen 0.71.1).

So far I found one small issue with gcc 8.1.0. A fix for that will be in
the v2 series.

Karl
