Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794876839;
	b=jEnmD+YUy1Tm5vHCQouX6XxMJOtV4TiBEqo62/uCyaD2JEojhJCRlD7BndUzp7jXtE2A
	 5kImFzhVFwXRxfM/Jl7Ze/no2YNokxZ7NLgksXUrqcxNAB80S7tGnqMeF2lZND90w4ek5
	 uuLPU6vjp1+4bYiGriOf/XdDTqzupapExWV4szT9NS5sDYL1S8kKvqRgYIR2FEMJR4fIy
	 mJj8OYITAqzPs8H3rlawoK59+A1AddNNBGy9GNBtAhFeUeLxTaM72CPtICvvhRFEdG7lz
	 nWD1YdVkpUdGxt9OEdMrkigxtjtN3nGZAZUyKX2F3jDoHuVgjaFAZkodXmwMDCdZ8Ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794876839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=A1hmyks7PnfUxhgzPsJhSUpf+ZPr50/wwC2v05STh74=;
	b=D+CMQ6bsqgX74EbluRxix46NRf/iioiI/KgQirMSUM8hAA358ofoTYkLiiXfwmrQedTB
	 MC4X9ZOWhcahNM/MoBNsh4kZhRrEThWpCOAihzZdf0lBXfG1rIdqOnMtRWUhBMsZBuloi
	 sOlPxZiX+heOg8hEywPnf2YbsW6ZTssW/ko2Err1ZlNwDA9+edu349ZwnYSfB6cr/u0ix
	 YRgafkNVLi1dq5uZ18AWaT5jtZQyrH9+FaSgbEJlGVmsy2uDhY4+iUQI//XPRdVamgvhr
	 27MZwHkNchpkGj3nveN+dYPikNozs2Jp8cWaLQ/skIyGWyaPqbm6dGZqk9liMfZsbyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N9RkPRkY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F17606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F17606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N9RkPRkY
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b791a4b732so2177a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:53:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794876837; cv=none;
        d=google.com; s=arc-20260327;
        b=au+rCNskVenmNJYBwKWBSKqO+zetGSXbJkfKQVvHQvoxz/RmoxQBPq1tqzOCosEMGf
         BzKWAe3ximGWqk7sW19ZVamIfNQywjJztRh8RryEVj6vIs3bz4WlgGnYuEQ0aVRXl3A3
         xg+UyURJqjSILF7Pct35MD4pibjTrUAiEWX2BLac0G2TFFje3w5q6l8EL2PnAwkdXRYV
         BnglUQv+zDduRif836qufi7pxADQGqSn4NFLzBE3O4vTHjgOLAPKTYEBvGTsHSkVEEtx
         7emGrstinDD0vTe35rdQthIKcba9F477mFUh+Z285rXbsdHWXAdeAAmZi7rSDMFsrQpx
         srBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A1hmyks7PnfUxhgzPsJhSUpf+ZPr50/wwC2v05STh74=;
        fh=YWqKz/OhQGq82rwOGyGNbtWJa0D7LKraQcDOHjvDUxI=;
        b=L/S5Uydb+7pbr2SGTSID44J4fj2sJ1JGAPq3xEMAXGn5Ao1AxKuc+GI+KRKP1378zs
         iPlkgLR0qIjmR9DHQ+L8EsZ9WxgJVwvWppSMqfPOme+gctMleuPwkjggalzed80REQBV
         fbW9tRjV1167ZI7DR0I3tAcP1dLP19JvyRIevTSHw62zwWpXcfj6FYjk35bm1wvVKDQp
         HTla/nkjXpfMVfYyEJcwzGdfvmGK1Lr2aUPFRy/T7lbL6GLI3hPBKAyP+jg7XEHlu4T9
         ahj2aSC5FCem0o0LyH/A40DU5/SXQYqUHKqjUkdEv2t26kTRJvMoRwNKDYAsewlLySaa
         pu5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794876837; x=1795481637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A1hmyks7PnfUxhgzPsJhSUpf+ZPr50/wwC2v05STh74=;
        b=N9RkPRkYuf4T11DtciheLdnFwdPQCj2TpBljehj/77HdGh7+YiIBbfkA8agWdrUl4S
         uDcyleuqudTX4u9OViPhZmIEVJKYvKLcQ1YLZJyFYiHgUnDNMls5Yl5Np7DkiFExwZdu
         hETjmzz7HO5hEU2EfTpqmZccFb6W8Ct4cu/+6MRsnnEfRgndStwrcv3ThG7IPGfXMb2f
         X8gpj6fs987ZLM/1hRAVBLkrxbAE5qhhoyl7zH8L4ea/A5LotkTY9hCZbIUSxSrzFcTY
         FMHDkPd8uba8F+VzxMyZkOyY8TuHGHw9fb8NkJmPFUhXvDNgH/7bH7bOyY4cFvTgQ3Jz
         e1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794876837; x=1795481637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1hmyks7PnfUxhgzPsJhSUpf+ZPr50/wwC2v05STh74=;
        b=qLlkuI1wGjfGdYteY7V7DYJ3uxjeyZB+xYlWwHMPzJaupUVdq5mBUKffxCK7+TX8Y9
         lBsWT1LAgE0YSmDVJ4nIKPTb/dOC0YOZKz1kLb5KaSYWxZPCElMSEsdrKn6CNiicVYHo
         P3scv5/gz8eqFytQkYflhzf6eN9ReusA5MFB9oW6V8ti1AUJKYUbEwHDd10o8G8A8f6H
         D250YD8CFSi+7SRTMP3dYpYGyhK342HcTCfyApD63UEgiy1Jx0EWjXgD/xLAC6snJIlR
         c6z9Ox2d/fU4hbbXkr+G42ZeV/p0exIgsf5/hnw2pi9qJMbWON5WEGhkq+05p1von6OL
         pNww==
X-Forwarded-Encrypted: i=1; AL+hErGVa8xTUQyKh6Kf1rrM7IL3EIiehZL93zJU4BMNZGMiFyzV6cPS93kk2n8oAyYU2ZEwQ6Z2/ps0+wSXV4M=@vger.kernel.org
X-Gm-Message-State: APuU4Z86njgAUC/KQNe1n+nuEKzPS1G7JNvs6wfCkI0Ppw4Y7FcwTgM8
	wvPbSMbxIKqhpGA3C66PbQWWgyCz7P/JTAQq5vVgHPgCDTtPH0/XQ0u0ym27hKXRzblXyAWUv+b
	MqESNL09Da1RYNeEAoVVCdc5N4xBEiW/ESfOsPaWh
X-Gm-Gg: AYBFou1Z3VzlLB5lQHbkFlF27FNol8gLVclG7/M3lPAZn1uA5B+E6/tDQ5YVQKLEzrE
	7xlgJC8UpUJx9c1qtYIM1aFvTg+ul9J0cGtUHNsGrEM8OZQq8aOdhU+4gN6Znn9oAZvuWt76D/g
	6vJBbi5NHcXK1WK3tQJm9yPHRMl45ZuzMoRU7in1g6FZDzfQwt3sExbT2IBJeISk/MmV/NJSITh
	jD1TuW7mqq2j+Jegu+inEmiuOErkqbjWiTRyXPhsncNw9sc/JCgE2Fl/5a80E4xJsPvAE+OWuSF
	88OxKYkqrXz256buWDThbYCQ4I37k1XQq1ZphNq1IFC8XQ/IirpN8Yu+h6jJW6ZF9pZodtKkuPb
	ARzk2V4sSInZyWGGlW2vf+lIiuMk35TMZyzbcqkRJOM5gLSfOT3Y270D9cKb8VdCFNKoWwS4I
X-Received: by 2002:a05:6402:404d:10b0:6b1:c6fc:aba0 with SMTP id
 4fb4d7f45d1cf-6b862ea1772mr26359a12.7.1794876836831; Mon, 16 Nov 2026
 16:53:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116223033.3866283-1-ma.mandourr@gmail.com> <20261116223033.3866283-4-ma.mandourr@gmail.com>
In-Reply-To: <20261116223033.3866283-4-ma.mandourr@gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 16 Nov 2026 16:53:44 -0800
X-Gm-Features: AclHuK-_ONAvoQV2AWzEnSTuAEHX60cMUswZ9NZQ6pnplSH0FpE2bJQY3Yp04zM
Message-ID: <CALMp9eTadwjDENTw=oFixE_5Dp+762i0CuGVTt0pjN1q8S-fOQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] KVM: selftests: Verify nested VM-Exits while
 vectoring INT3 and INTn
To: Mahmoud Abumandour <ma.mandourr@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 2:30=E2=80=AFPM Mahmoud Abumandour
<ma.mandourr@gmail.com> wrote:
>
> Verify that a VM-Exit while L2 is vectoring INT3 or INTn through the
> empty IDT reports the event and its instruction length, and leaves the
> VM-Entry instruction length alone. Only VMX is tested, as both lengths
> are VMX fields.
>
> Signed-off-by: Mahmoud Abumandour <ma.mandourr@gmail.com>

You might consider testing the scenarios that Sashiko flagged in V1.
