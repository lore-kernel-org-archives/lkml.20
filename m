Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBF54A6890
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791312168; cv=pass; b=TnirIKBb7hD38FglPZciQwujRPO+xnzGlqDPp0qJgsrQsTrZQveE0UgHrYXy8XaC3hL4igA7a99uKYYFGINeeImN8uyLvjTk6HyOnV19LlBYhEAMYR80qaw8wwTLBaXuZuUTOS1rokbVXHveP/ZG7E/UjjBbGT1aE0PvHEBk4fk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791312168; c=relaxed/simple;
	bh=3VMIWgHBKgddpJfpGx7nrdOEGlywqbmgH7lAP8hvl2I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqKNr0Swvaga5zzzqc03lQi1Yv3JKonLsTzMEnoYdj3t0K/RkSskEyBCB1YNsYs7wgHF4zSWKW2sZp4vFAs9Oi8l0l3bcysDuBEAVFIgLjEwE+apzAFkHUKNPVpw0CJ+MsO1fSitT2tK2usjMcl6nT1ilXjwFGSj2PUfmVuPUdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QlBgnXHO; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QlBgnXHO"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-150ef97e790so2135c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 11:42:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791312160; cv=none;
        d=google.com; s=arc-20260327;
        b=KkW2LlgzIpcFsnRZ6cK/blNhtkX5VL2kgjBb6j0LgmykcMzHrqoegjTTDn1G4O6i9d
         lRbsaJppeGOupfVhz0JIUiihht19jSK12V9Na1aqgEAMqOpQ5SZdwLamLQtf+W6rliO0
         pZrtYbegMktWW8IGTQaSmGQgR7loj88XZf4pl2g9DcHKK2eiWQFknwbOAJrpns5n1CQt
         9HPHejqFMkNgpxyxoDJadNIZqlBIEj5I+KvnYjs75L5E1FutA088jj0wQYDX3WCpdCJH
         6x3EvTsDowrioN7hKh71N+M+Cp68lily1/8fMYdLQ7I31wE3Q5LCILj8NzkX8Iw5oNCT
         4/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PXeSyA61cP/YG1W7o5p7MScoynhww5ruZfkO1uzVkSM=;
        fh=WyjHhAYfM8jICzXoiMjW0ocyH86UWntrJIWaH4bP2xw=;
        b=eRXXnEZjoisTqlJ7t8AQG1MnNtZZSBcXX+XP00MITNcVgxrgNTGPgbIxAo+RUh/5aU
         bGXRp4ZQCQOirIbIx+Hl96VmUYjC6WjWIReRybMAs7LW3wihfLmZ2cGM6V5eXzgBQ2PR
         6AODth3yYw6q61zmlLhShhPcrntz6ObHodmXeeh7d2axuV4AnrCh8LXGZUInMmkzSRZG
         dxV82ZbxHsGjvPYUhnZp2pIw0p8sLC6miCecOdUcdOcVSCIZcz5HrYXd99vL5BCDw3aZ
         Z8Emk7ufYh+tT85GL3bqa1UKAHYFAKEhQ/6N3cO7ZJIDK4tFmXVzYe0mCGOHkB8wLe5N
         dOEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791312160; x=1791916960; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXeSyA61cP/YG1W7o5p7MScoynhww5ruZfkO1uzVkSM=;
        b=QlBgnXHOBGG/1C8KIJYR9xojmZGrWBt8Sjvs1SQV+o9rAvcEB3+LKrntLy0bRTeXD3
         XRb7WFXcPldCx9b2FctMeOCsux9T7ZmBIQO8LS5Sz3fxVwKjwCzZfg9m1FRQIDlQK+IA
         V63COZOlZl6mEuZkiate8pIYEHZ8R0enjZEx9tMmS6c74pLClxEY3QDlk5IPH/+luLOv
         GtYtQcH6tqAZU5Wz+LDg+WcFlU77GUY2Cdv2CjWkf7PHMVPVhNLZpeZdsrEF/NJjQASM
         hCqLy/pqMxXKPymFMrP3vBY+++ys28h//nO2dOoIqkXoKEHnyCSTVKM/FvQ747nmq0w1
         sFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791312160; x=1791916960;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PXeSyA61cP/YG1W7o5p7MScoynhww5ruZfkO1uzVkSM=;
        b=VFXjCIDb6oW1SZ8Z9Zic95DaPrYx5NePy9Un4lQAci613kLEPtm2nmSDIQZH7OoN/6
         jzfPxoSAfKF4AgpGK6OCaQVtUhIk3x0WEEaQt2cH3gpQLaEpuxpcqylgrfP9cu22FFdX
         FTpieKBFH690ONyO2i6RNjd6g6zybYan/sd3vrvTO6WOWMLq8ee2hnoMwK8PkhWrlTMz
         yOEakuS37ds9IlQKYZM7Z6U2PSQNtPRRz2U0LRhh42yBJL8DupxvEYPKQhmJkGbJiQ8V
         Sj2EYLS8KuUW61IENR5OYZvYoWQwUhzdqfS3JlVIqBfp2XhBKe4QGhwWvc5Yegy1O5kr
         QTKg==
X-Forwarded-Encrypted: i=1; AKwUvBwMdIeZekFiiygUJ8wr6166rlevc257Va00CeknOjznY+MwRRwL3g7+kvKjaJQo+KneHL4+Dpc6E7T2iNY=@vger.kernel.org
X-Gm-Message-State: AFuF++neKbBxG7BUhtYJibm7Lm7+pF9cMa6BShAbzPKaLitA7bnMhYdm
	nLx9ymbBWwgH07GoEbbGASdt69ubAU3dcPz1gnz50H6/1iYPhbsa+ICDF1YcL9QNuFXirXwYehS
	zfIcemGIdanPLSR3zxrWZMIgBjmrqE6cYpkx2DY4=
X-Gm-Gg: AYBFou3vPUvhdxO0ButkZptUBU0MNoUTMjlfoSWnV1GBb7UPZrsolw3UJKYcJ6cDVhv
	N4u1w5Qk4L7M+2iVCYzrNwi/g1djqNpTFoXjN/Gh4f9Lfsp4d6tM8aXZbL76OmetWpW7qkdcGyp
	QHU8/Oh6R8MmsgMfFHj+KguRnEeMw5lBeeoMZ9BVkNujCwOK4U+MB9aSYjPV8oqiIUjZet449SF
	Vjfoa8rPXaEiw+eTmYjffBlLhQytvylAI+5Or/b3B6gvBhfrvAbmv6Ei92pxF9yaW392M6Zv4fg
	X3aEHu1FaZ+Z6XuMSNVjYAFtvYNi8UVe5/eloWWsi+BG9dh7QuoanefIi3DTnqTxa7Tq+WvwC2B
	byYvGrHBy4wm9l5HuvdFvKB9iLN3lC6VhwH+23g==
X-Received: by 2002:a05:701b:2518:b0:14e:e4bf:7974 with SMTP id
 a92af1059eb24-15d7ab090dbmr488934c88.4.1791312136400; Tue, 06 Oct 2026
 11:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924173501.856380-1-dmatlack@google.com> <20260924173501.856380-14-dmatlack@google.com>
In-Reply-To: <20260924173501.856380-14-dmatlack@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 6 Oct 2026 11:42:04 -0700
X-Gm-Features: AclHuK9yzmvKK8dZq9avpOj6F6GskJ-F_IbrwE7g9TDd8JjXbHVrXV8aJ-JhauA
Message-ID: <CAAdrzjs1JkKJwcim7czNHAoq-u+AEGqgynNzmnbxq6Xk3LJCfg@mail.gmail.com>
Subject: Re: [PATCH 13/15] PCI/VC: Save VC state in the saved capability store
To: David Matlack <dmatlack@google.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 24, 2026 at 10:34 AM David Matlack <dmatlack@google.com> wrote:
>
> -     pci_allocate_vc_save_buffers(dev);
> +     pci_vc_reserve_saved_caps(dev);
>  }

Nit: after this patch pci_allocate_cap_save_buffers() no
longer allocates anything, so the rename to pci_reserve_saved_caps()
could move here from patch 15.

- Josh Hilke
