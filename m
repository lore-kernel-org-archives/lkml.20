Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3642529A309
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 23:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791675164; cv=pass; b=LzJhhq/G7q8enJBwUKfm4caXCcKQu0A2LXfUV0d0Y7YYWkKBgttM6sXoIlBV+7cD/d7oYfetIowMlGbZlSL3R8CwyjV16zCrBaCp7socAQpmYfXE1n1IDOkv/06RgMKcDooZocRKa11D5Z67DfsYtLzVh/4vAyqNn/XuQakRzYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791675164; c=relaxed/simple;
	bh=yDUlUZyOjDuadO25mlevewbZFqk4aFcZYwXrs7HXeXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NI4ho0dalVruYJBhqE6vw52d/6PoSr+PRf3/Uj7GoWMTtdLz7qtbgMhQy4fWzTXHOi21hRTWl3oB+T6NshHG0xwoIb7ETQQ4CZTWAA70Bf35RpRg24nrZfxdD6OUHsZ68Fa8KMceSigXP7OfRJ8BuTmErnmIQi4osmpPR0kNoWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nyHz0up+; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nyHz0up+"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso6380001fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 16:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791675161; cv=none;
        d=google.com; s=arc-20260327;
        b=b6i9P5Hae6yoGJk7dr2ifOYsB5oKl6zpdqcEj0xBOtlX9hiaOPumGObUb+uoF0fqJ3
         P/o3CXftmNGKCl2jXoPTeIqiiAiPNYGgXRHk98NZ+k+J21kIriHYOJkT9ME2AnVZLpco
         YN2oE3QIC6d9vRUe/+7BPJARO93UQVCUxB/EoNk71fg+7rNFYwyClMiYKqRRmKhC7hmF
         aOenBENt90W1uBJ1wTwdlBeXMZ11IkaoJLdAb5tf9eW0vj6WMUlXL/02FmL7T65+l0Im
         eN6OXCiJerN/9QWcsTTQfBycejGgM9OIGYLiamtgoDOI6t62cHpgFheqEWQ3eqNF5sfo
         GjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yDUlUZyOjDuadO25mlevewbZFqk4aFcZYwXrs7HXeXA=;
        fh=5GeBL/fd/YFBuzCumBMWC3XaQQSRCCOl5mX3zX7sMbw=;
        b=IYeNgfdngiGpjHbZQZoITxFs5HIxzukT7lbESCjvDPuzFJu7rHOO+Lfmz9nDboHzZq
         k1In5pjTqoV4ULFkSA41C5P+UxCe9JoR/qf/44pDhkA/AtlgMIJ4NCvi2WqL1PiVSWKO
         uc9bwv1CKuh3UEWGucioLwiQJmxJH3GAJBGed91K2yhYW7JBMcUzgVQRNYQiyUAB4CfU
         o1rA/8LMQw8Vqaf9qU7mwZH6ruRaITH3jwIDVK9bbJi0pGwMOYtSe5YUHHsPrcrV7RfI
         9T6/zNkYiwYGsoQCux6bI+OHTe1o8oit8CeB1E3vx44niC3z2j4GytFy1wgyLDLs+Ete
         kcUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791675161; x=1792279961; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yDUlUZyOjDuadO25mlevewbZFqk4aFcZYwXrs7HXeXA=;
        b=nyHz0up+SSnKNt3TULfv1hrau1k+3LTxtrQbO1lvzoOVgqoy7QKpNBBUOvP+DxWOYs
         1wKRfV62LscPNTsW9858VDdRpyu4BH/+AiBcnZzmwePZqddloB9bJpILa0EDBjW6DkeZ
         w98n3jI/2QdGWubkTNdpBZnggb/pHz05xh/lWNtUs4fq+Eluhf5Na16Z1NATEDUWnsjU
         8lFGtM8t0Jk9Mhqio8+1/FRmJV0ZWwmzzKt4f6WehjYJk5ZBMx727h2fKyByW45EVeo0
         jaAi/OGllP5oHrtbFNa1xfmZB5BxgOCaqIUvSzkqve2uFS7tDq3fJ+7lfssPCVdYepMM
         6JpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791675161; x=1792279961;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yDUlUZyOjDuadO25mlevewbZFqk4aFcZYwXrs7HXeXA=;
        b=tDrUguDjPbuFYUaFihgUhHBYx7kDbZs6AWkX63sfXZl5oWtEQTRvlqvJce6K/7XRaw
         4eebybyY4+2gvqkPtOEB2LPUbZgo+BYazvmZ1d48NvTmRMjNiPom0kTiVU/ZpR1tnNOf
         RmP987YBRrj85xgWofNnXOewm10oI3RAiBYahiRmoLKEVFHF7L0ef/0SmElpO5USJFG8
         INjMS85Ltvte59uJJP/U991bZr9ejjNLqBBfi8hSXTlE8Kxfvcdzkcx8iLTLFFWFw+Ag
         vRmceWbPefxdkWaXf8ImkCnDXNcQbPRayBWbr76o7wDqToyCim0XWKSFxxV0EiFdGk2c
         Buyw==
X-Forwarded-Encrypted: i=1; AKwUvBxV2xHlId9gU396KvZCrtioXeP7V6qbGiTibvM73uK5sRoIdisgozkdx60ouBAJohdYQgRSCeyYUdAWC+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCWVvawEyEUX80klrJR3g1AK/12wpCRDjmpiN8lXvwcAmLas8s
	xSTPYb1Pc7ihSTHbOJzGKZSsCCjwOF9aC/Nj2IUIapTgfYiNdw+BEhTmxCCjwpGsc7E6yvLpuo7
	G2XGqthRAi6v1pazKoheTv60pDIXQEYI=
X-Gm-Gg: AYBFou2Rp2Sv8e6sQHlgnpYSW9wM4pFJcSdijsYuGXc7FgB198LR30b5OugIrXQgMGz
	BLfmlVtDYWXtUsJ8r/2Qi3btqvLq0JbSWvaxfFyGCvDfk5GPQ+4dA1iWzC92D6dmuERdHvyhUxx
	IS5akAZOKv9/x8TBVxzBE2e4i0aelm5m9kig2WNLPNb53QHRzaf2u8uryL2Va5sOjvHo1QkXt22
	h1ZJD7I8eU6W6MV5AL1IZPdFj42/uhsSKT9h9axIr3kJRxkT5mX4f0WiDIFyfsWdRMg1fiYOhgv
	0HaPe+jx7eUt1z6mMIzSr0L1tMucDA5JpQFe6Vn4mwQi8shYg63HuWWHMQbQnLoiN+r81dxVaGA
	SQ8s3wITw+4PSFaNpV3btWDdb2zaFj2OmAGDgPf9MMmvpu34JiIYG90oX35DrEiZv7doMjHg=
X-Received: by 2002:a2e:bc23:0:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3a9c5384f54mr12392801fa.16.1791675160999; Sat, 10 Oct 2026
 16:32:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010142533.974797-1-linmag7@gmail.com> <20261010142533.974797-3-linmag7@gmail.com>
In-Reply-To: <20261010142533.974797-3-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 10 Oct 2026 19:32:29 -0400
X-Gm-Features: AclHuK-gvxmspYL8uhJeKZU4XuFs3ltc1WsM9uJrh1XP9y6npltcI5XIXewgq5A
Message-ID: <CAEdQ38Ep+cu5ssTGtb5OQwHGRB5wz+crTfbV9GM6wVDdoZqfmQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] alpha: run check_mmu_context() from finish_arch_post_lock_switch()
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 10, 2026 at 04:24:28PM +0200, Magnus Lindholm wrote:
> code following alpha_switch_to(). New kernel threads take the same
> path through schedule_tail().
>
> asn_lock is left set on that CPU, so the new task can run with

I missed this in v4. New kernel threads do take that path, but
context_switch() does not call switch_mm() for a task without an mm, so
they never set asn_lock in the first place. Only a new user task leaves
it set. As written, the two paragraphs read as if both do.

Changelog only, and not worth a v6. My Reviewed-by stands.
