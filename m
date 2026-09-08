Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36F4DBD9B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861883; cv=none; b=gymLwLzV8JQVrtOHxdKJskJnOUKEvkzF59UP8MtxKphPA5yQnyKiKjNfIO5VzPvtPtB7XfAhL6BqCm/hMQ2SgX/iUqT0qlwE51zcp5IM+SIYxo1MQPr+FLL5fMFXspID8h0+15DTqvpYOKXtgHCPg9m9Tk+N/fsuUL6pQMWLduM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861883; c=relaxed/simple;
	bh=ghYsKIp07FN1l9ghsOylrYXrt4x8WJ0gtt+77NqonFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxRm6k9izz8hHI5XmAEPiKWcZ1+F07w0DpkYno3CbNkaHPo1mNYgfhsQgf1fyfawfQWl0D2ISm7W4/jguDv9Tc4hV3WAqRPWlgBmG1qc2hL2MWhX2JLH2ampijhLC654UckwbcotPOXuFzAEGh22ImpTAk0deP18xRYdSDRX2dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c6559620e3so1865897e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861881; x=1789466681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1LnrkgW+HhkF2YKwW0WsGcBJcvFVVqkAq4nhlk/AGHs=;
        b=FYd9u7nBj08EOl8fgWPHq2PS4ZeZwCE9e/nDdOwWifY7jkgJsjaCjfa+iGtHij0Y5K
         U/8DLbvwl0/rNXlDT+GFWRaetjql4Palfs2iuRfk8cHwspBR/8lGJJK+WdUXDEDezPpf
         2zUchAKJJBEETcLnotNRSSzqMOC3E1U4AzW+yZEztiuYlCpSASkDuG+FMLrgIzjIz4F0
         DBUa8duwJvVhocVjN871utSmr0opM5503feV5URl+uzW2GZqzZVZXLK74KiFV/ygIzyn
         eYGyAy0R6oxUro0ZmcwzUC32m638tnsBqmLuG0cjdBItkS97+/1ILryHIKJu2MPBd4Lx
         nKbw==
X-Forwarded-Encrypted: i=1; AKwUvBwNON8UhrHa3mIkVU7AyU9jp79pYXt4Wb5+gldcs1i4SMCHscxL7dmA9WC7xqmO5RZKAgde2hSR9m0PANk=@vger.kernel.org
X-Gm-Message-State: AFuF++nD59SZWGSJBAGUl4kpZU7ghitrkfsk+kLfQqUTo00hcOu8xZR5
	lstboFlqOQDRtLxgteN7cM9uePAjkz9gglwoBXkCRPF6Yj2m363SsnEx0ZqwTu53
X-Gm-Gg: AYBFou1fXXjFnq9EN3k12xlnvrw2++F3jGMV/WRgls4n3v12bG9jwcGCf15HAg3eAs/
	TmK2ucvDbDftO+aJhrjDSAIKartVeM+mrAJWg/mWJXcREsKm7rqkXWk2PWQPoEHESoBTaVXfriG
	Iq6GeVAlGTfwHQgHoTDFr72LB6EFDAjmgN9DwW+FA9L2MYCpVK1LiuRoNVBgCEvQJnXBb9A5n2Z
	imKzLDjKsFVW2gej4zkww/vq3QSEljluAVntdvdRzmniLW17AxavguRxJo8VEcKw1kv4DVc45ZR
	fxexfhDKd/8YST2Cq5umZ2WI4RxSFrtAm1fp19BLPlF6Y1cU+XUhTzmKDow7mHjjpo5NBdv4pEP
	8zUmdKGvZ9hKxPVqE+4pWp2M5zAY2ShBi3EdJhrmwHKAVB+TNv0XbnDXPpEJhFdCz/bLbra1cqD
	ZMBAh9WWwrnfeb9HLky2MS/XUwhr9a81+JDbn08o/tY+ky6YYzGxTuBvhVOIw5igNve5szXQaGh
	bLwpqxowgqVFg6xoKJa+s2T8g==
X-Received: by 2002:a05:6122:2909:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c7ed4201ddmr12443967e0c.3.1788861881179;
        Tue, 08 Sep 2026 03:04:41 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec386599sm9329597e0c.14.2026.09.08.03.04.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:04:41 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-74ab6c88052so1250776137.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:04:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwl+byRp66jRAnEoZtZQ7k7uuS36xwbDOmTKIgf1myEvd1jgFEWClT4miizGnZBVw1XOZzePDXlv+YdNsE=@vger.kernel.org
X-Received: by 2002:a05:6102:943:b0:77a:d089:3dd8 with SMTP id
 ada2fe7eead31-78a4aa5a199mr8952340137.12.1788861880753; Tue, 08 Sep 2026
 03:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-8-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-8-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 12:04:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6etGuJC5Kg2S0fZGO=gq4HPHVtN2MzfxKTdMVTKsJCQ@mail.gmail.com>
X-Gm-Features: AcwNN1X3RV4SYt13JI31j2zWzRybiv-rSaAkaCpsuF4HrMpzBo7HJkyDeoSaj10
Message-ID: <CAMuHMdV6etGuJC5Kg2S0fZGO=gq4HPHVtN2MzfxKTdMVTKsJCQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] pinctrl: renesas: rzt2h: reuse helpers
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The PMCm peripheral-mode test, the PFCm function read, the PINm input
> read, the PMm write, and the PMm read are open-coded in several places.
>
> Reuse the already existing helpers.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
