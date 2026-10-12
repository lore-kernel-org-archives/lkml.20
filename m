Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781DB4BD352
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828157; cv=pass; b=BAIhBYqAFXBXC06UAKdiw0msdB8uiy8bRPwdYPWJntwlLTlLJfHWhrKHNCoAssGEaUsMkdFhTuXOs/NYRhVN+EhKfyhxo7m+gxQfl2nPgrCrj89MrrSp0NVd2FLoE+LlFX0wSqlj40Z2PXn9gEB7mg0HBVnRxACfdIxeQqGyMDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828157; c=relaxed/simple;
	bh=w942YmWlF5CTYJ0/e0ZVlAkC6qS1G1PkTrlg8msVX0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AX0ZKe/SA2a25t8nWdYUN3ESCQ/U2a3mP6+a7tgckM1XboBAguqL/ELrRjnL+owINsuNnKFtkN817AYld1w8x90Aips0oNhv9o/7X/ybG7/zd3/wAUbnhb09ADOPrd5/xETTb09t/rT0S53B+TT/j6xqacOlJK509hL1vFwOrmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFACAYn2; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFACAYn2"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so15410711fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:02:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791828154; cv=none;
        d=google.com; s=arc-20260327;
        b=Vf0R3NM1eLm+6Z0h/+pL3ZX0YVpX8wivYA5f+znfc7m8vM5A0TwEDltwzOzqMAYtt8
         kg1Ho6Gz495lY7GnZ/B70ZZAvYlFNOFWb6YUN+GT1pZpYohG4pJvzBFhLJqJL0gsOs12
         Mtwj1BISwDmvM24bquHhPYeDELCb+6qP2GTChOayA6qRIBkzTg0erVrwtvK3dfp73mQg
         RYiXB4lACSAJz3q/ZgjkG7WNE0nDG6D76PQZApPJf4wLjmSlfuoU3cHSB+PZ3FKAedy5
         1TXQO1RgI4vFUnAFeNlqYv5C1IMPeYXK7DJCyk07MvZhnFZrAOvD83Euhb3lpqdlmmUU
         7wDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f9aoCkFfSDX2/6XxSiLf6H4ohGMtImVLYKMUBsJfeiU=;
        fh=vaKK4MFSXQ7T+yFZIfZQf0XlHczijbkqfHSuff5Tr+A=;
        b=hBWquj28rv4ynVQVxg+NaXztWf/+uEs4BK6T++H9MiJy5aAl4ahhau4uNR3crflpr1
         GdZgpmrqYh+eTvN/iGAaE/ESM6nMUiVkPfeHj/dqSEmjp3u8Z5JG//SmmQi/eZ+5CGX2
         LEZFTupbt74BR1JiRgMryarx0bub5Bmffj0hMH7J+8D94CIuS1iytzFQtKb2i133fL/h
         R7d43oCOxKhINNxa/R/HRvEtHaRxOIOZnEsd5HL7BQ6V32YcrKFM7DPxEAle4qjD7KUQ
         wdRdYiWfoOrm81mFRpxaCMZJnS9NkDYlF7+0r/l6eFKEAYx+iaSf2q2YQhx3lfPX4T15
         4Ycg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791828154; x=1792432954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9aoCkFfSDX2/6XxSiLf6H4ohGMtImVLYKMUBsJfeiU=;
        b=FFACAYn2bk7ATqIROx1CgOo1ZKXt5y+0t58DiH10+pPk3+S/myJQWOVqhKRIsRbAQ3
         UWdII8twI06YITDLWvuwIXYzUQfhf23YTzxGd2xfPUKhkBJDgv3gZCXGBTadL4prN/xy
         D2CIdiYKp00ck1YGwKaHtArNjeivfn6gpHlqHtKrFpAiYkyTjui26bOuYzMorRhO5+Dg
         /FzWxAiCsD48C5SvYsOHkeEmTCbY/LQZOF1fy8jbXBS8djFrx+VDVOoi3lCljK4gSTe0
         PcZ8p0aL8S47NGzpGZS2UmmJSLNWQHpENx+OpBZn41MERGxWHD/8tACqGRz5EpIK8XLg
         hQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828154; x=1792432954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f9aoCkFfSDX2/6XxSiLf6H4ohGMtImVLYKMUBsJfeiU=;
        b=i66xU5fVfyzG9ZY1zLdFBJ2jUw0BFb8uleAzGSNo/xKZqplYoriymrHsGh6qgCE9+/
         ljnoT7se3NRLMqef0nDxT9gNtbmsIkBbzBtKyIAXtSjhwgqH5oEzSAlWsLpXQSH8hB5z
         k4fnwvuVSvoGiC+utjBb0LCuc4cDZogkuxbvaeWowxr62OvjM1ckFxabP6BCvC2iKy9O
         iNwNPratx79S21r3LarLBgwfb1HzkPraLoBQKpu2PbAPT84WUlHuCG9plVDt/dS0ZLAQ
         Vz76xW68aAcUW5suq9fd5kSa9WYbnmyI3BhLmS2IeIxiam1bLuLx8oGWcIDB2ClaZdvJ
         mfMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwd9BlUfoOCWVExt63IZxpGh+2sQuY5jRgki82QHtT5mFvhqIQNulTZA+hJFVuuUyJlAwuT/sioICe7E3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQk0VAlJ3nKsYMx9GJqj6dKzqxRIUDVXJ0tQ+yud11yKJ9p8+v
	XUDkYQbB5QrVQ61dA01Jr0Ull/A/6hvQ3TCDhgLDBk56J+oZ0Iou3aoan7/i9iMAfswWQsDp5VP
	cUrWPjiR4O0jR7Z5maEo50YLOShhwecs=
X-Gm-Gg: AYBFou0pVfKRin1rc3UUi4GK6HXs9fVOmfStot6xk1WQOKsprzd/Z7o2f6p7F2/HhT2
	EiUpaVRtDrAcfHOMEbaxAWKOhhXqbsyRWD30zf7ubbAG+2r/D4976TQXekpMa4ExbbqZFFiURmd
	b3mZOx1roAYavmmF7akO+5MppjBzRrtChgXeSQtf4PcyfrafnAEv0iBxZwixoFmlkxZ9H6uWX0o
	VyeGM+dJCHj2efxGGTlkKxLKJDOQa+2CgkNywAJxd63VSgnhcWbFDV35wZvRtKrouK0VELuK2p8
	8GhEBYnigu0mm5016xe5Dq6FFIVCN3JPeuQ26P0LRNqHxoCtgXNnAyw=
X-Received: by 2002:a05:651c:144c:b0:3a9:d377:f5e4 with SMTP id
 38308e7fff4ca-3a9d377fd51mr18447101fa.20.1791828154266; Mon, 12 Oct 2026
 11:02:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002090947.869220-1-jiangwen6@xiaomi.com> <20261002090947.869220-6-jiangwen6@xiaomi.com>
 <astarANeoldvqBxc@milan> <4f812ef0-ab14-48c5-908b-b7d82ce418b3@arm.com>
In-Reply-To: <4f812ef0-ab14-48c5-908b-b7d82ce418b3@arm.com>
From: Uladzislau Rezki <urezki@gmail.com>
Date: Mon, 12 Oct 2026 20:02:20 +0200
X-Gm-Features: AclHuK_uSuO89Qhd1bXs6ll2oIbh2EHyO8-k6OSdE2Rwub_69M_koNK3b1_sl9g
Message-ID: <CA+KHdyVjjk3B0gsfsx+NPeuNH+ZyN7HbiP=S0F9kspRO9ZAXAg@mail.gmail.com>
Subject: Re: [PATCH v10 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size()
 to batch multiple CONT_PTE
To: Dev Jain <dev.jain@arm.com>
Cc: ryan.roberts@arm.com, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	linux-mm@kvack.org, will@kernel.org, Xueyuan.chen21@gmail.com, 
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org, 
	chleroy@kernel.org, david@kernel.org, jiangwen6@xiaomi.com, leo.yan@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, rppt@kernel.org
Content-Type: text/plain; charset="UTF-8"

> >>
> > This is arch/arm64 code. Can you, Jain or Ryan from ARM folk review this change?
> >
> > Thank you!
> >
>
> I will come to this soon.
>
Thank you!

-- 
Uladzislau Rezki
