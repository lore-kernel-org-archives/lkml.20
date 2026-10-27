Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125095;
	b=lbtPfOmVYiiqhwwQMuHpQsZkiSD5r2TASB1RcK2C3vfuaXXdnDNN7azd02DNMpHP7LWL
	 p6ZwvI6zL0IVRmBlPEQ1zjM8uplUCVbNR2M0ecBCj3gVjvZ6AEbZew40Wbwsb36S9raBa
	 W3kLJahUq9GBw/684zsZ5Iy7z86uY9yUiZeitEBU1OpcskoigvEcugxlgeoi74J/7k9La
	 eACXGR55J/fvUXfFDi4nMSdjFl/VdnmnJ78cFJYZ6Pw9K9s+Ur/DMQNLlg4Qf2C2I23Wr
	 c38PDRtxbepDBL3HLKS4FZo/dK1tTalmDnIMHjmjuGBwOfZGwdxu+67dLYdYke07c7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=VgwqDMDL6GCHYL+uBCPhR4parfpWbie6/XUxbqyiET0=;
	b=x3ckajlqbpGW2C7ltOXcV3vOg3RNJ5VdXE9I0yAmYBMxfTOn/pw+XSxvNu1TkkTjl2EN
	 154BKJ3Qw9vRQnSREsz9uYthHQZ8v0wDERQt7yEfYkkrL9B0KjIqE/yQePZg/SSeWJFon
	 Wl25LahcFBpB29eSRntnO9SrFHa8xSDrjARAP+bJk7UuC07o1Elg43Py6AnM9+yBIt7vR
	 AhK/w+eWl0QnlyrAf5+d0CYRybE9MGoVez3dfmPP00DEG/CueQzdq/GYPbUz438z3OASE
	 h17bHtb6EhOkClQzSX2BRyjrEd065RtxJoLSPjb3o2aW/HqvKUp1Tb07rYBjgW3r4Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FWLhTkYH;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8FE606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF8FE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=FWLhTkYH
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c315869241fso22732866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793125093; x=1793729893; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgwqDMDL6GCHYL+uBCPhR4parfpWbie6/XUxbqyiET0=;
        b=FWLhTkYHp76UWnv/lRvrAcEX2Pn2bXOno+oVIwabCTaYdb+zoco6l3JUED/X9AHDKR
         Qio7prtgaaC6kuhvcH7WF8SpgRDzl3iSsYlnuOdC/pytQNdEYDkXAdPOspLZqWVGIXUC
         3b9usZB2e4impamoLV/Mkge/x4+Wjv5m8Qp0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793125093; x=1793729893;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VgwqDMDL6GCHYL+uBCPhR4parfpWbie6/XUxbqyiET0=;
        b=c4WwiHMAy/UHopV89Gqt008b5tsmdDNlfpRVjx1S0xlPKp5CdJ9YDElVzWchomLdEG
         YSgQRezVKPW53BxlW5H7MFD9lSeIWN/KQ6p4Vjij2eCQIvpj5HhF9MCmdyYsmcERfqOz
         vWN6GKXaJlIty0DqbycGM5jYN4oK7eGagITtwz0ANp868Ga6rmj0+n+1ldvWh1VD04s7
         kZURlxPo54PfddK6EzG+qDKTWgWz7usui5KxicUde/0DmPXq2wieW7UWNSTP+HCiish0
         kiTlsscM2tGjEFLyQRvKKH3N3m4/rNZDqUDiiOt6fzr1hs/G/6sKRIEYsD1kKeXcJlNx
         9J2A==
X-Forwarded-Encrypted: i=1; AKwUvByXMUYdOiG4RsdZgwRGQAxhfD2gGy6w6h5wv0jkJqkLGqgOi//A2gk2bejbu/+gx4q1Q48q9+9f5s0S0IE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkOAAwN/tQV2tDtRGm8DVfgAAzS9ALEpFjkKS05wha6QYx6Ch4
	bGT9vq1i/rfZohxa6KOsPstfpAx0YY0c/rYFctTgyPA5MEoCiD5CpF9SXp9+PEb4D6qy55n0xhw
	yxBuOVh7Tuw==
X-Gm-Gg: AYBFou3Ja2J08xL7LsVEazyZuCMJHzgqmeVKGhGXEEY/MVCfefTo7sTJtDTxoC+EhFy
	7NDklc5GMHpF8R5/HOZqOdqcWkB9s5djTQHuqFfpfwFdsSKbm5IbxZsKU2g17yv8mHbqBekYe3w
	ubgZff1rnobV2DxlUQ0KRFGznT3roZbwQ8NUbAaixgv+9Xbr48Wj9M+g4dbmAfjAhUGjASwRLAO
	D4xvklDTPeBCT5+P1qj86tm9fgbkRj+Cqo4qHW13Gn0dqb6jwDnc34JsUo5CtCgOskecnz+7+dL
	H4rbFxkpnJNrupF1QOBbTBaP99zHRwxqyiPXyiNIacVRk2Od5F3sZJtwawmb6Y88imXlwTNudrN
	JirdDES8XhFQiR1sgY6E2x8Nlrvq17oLnu16Mjdf9SG4ADYchg4vxc13V6DuR6y+89m94hObVZ7
	kWJ2b8nN6GKzoMxJ1coizQQTSsR5d2NpDhPrx743bS+zLtPbGMqky/CWC6tM7zzZz1+XqbxcTVu
	c+hR93qr0fUwrY02CfM6t/1U4n75ivUTcPiovOTHyVqVQx0JfrxLt6DnHWZyUXSD3KDqcKxnHk9
	uutKcJ+Bn+EGJrXgfOtKy+9MiZ8HEQ==
X-Received: by 2002:a17:906:ef0b:b0:c41:b94c:4539 with SMTP id a640c23a62f3a-c49bddac7b0mr9519966b.6.1793125093225;
        Tue, 27 Oct 2026 11:18:13 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e9968sm496642866b.17.2026.10.27.11.18.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 11:18:13 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c37b612635bso14955066b.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQu7eg6dg93TuA5JIL56bZoL87THQL+Yi7LH8q2xFcHOnIa2hsqdSIE9hOu2TGyprnVA/XtN9A92T3OUc=@vger.kernel.org
X-Received: by 2002:a17:907:9691:b0:c46:645f:ced7 with SMTP id
 a640c23a62f3a-c49bdfb88c4mr6329166b.39.1793125092132; Tue, 27 Oct 2026
 11:18:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atdn5xA9AZHAWNsM@hobbes> <CAHk-=wgjwxSCDQ7VhH5NgHSK2RG+9tDb=infbWbgQbWWHjVbow@mail.gmail.com>
 <auBcFQyaV727f4fm@hobbes>
In-Reply-To: <auBcFQyaV727f4fm@hobbes>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 27 Oct 2026 08:17:53 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjqJ8FLVmLCs-S3LHt=8J47HaNpitwitGarn=30jDO+Fw@mail.gmail.com>
X-Gm-Features: AclHuK90DoqSL-e53B27zZ_Rq4yt-2aPlPVaLD6JS2GDJP9bp6JxOAkvvHPT1b8
Message-ID: <CAHk-=wjqJ8FLVmLCs-S3LHt=8J47HaNpitwitGarn=30jDO+Fw@mail.gmail.com>
Subject: Re: [GIT PULL] sysctl changes for v7.4-rc1
To: Joel Granados <joel.granados@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, Yibo Tan <lhfff@tju.edu.cn>, 
	Zhan Xusheng <zhanxusheng@xiaomi.com>, Kees Cook <kees@kernel.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 02:10, Joel Granados <joel.granados@kernel.org> wrote:
>
> Writing fewer elements than the vector or junk after a complete vector
> behave exactly as before. What changes is only a write that already
> returned EINVAL.

Ok, I mis-read the code. I thought we used to just ignore junk at the
end of an incomplete vector write.

If we already returned -EINVAL for that case, then I withdraw the
worry. That would have shown up before, unlike a silent "ignore junk"
case would have.

              Linus
