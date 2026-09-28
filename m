Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78BE48BD3B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790587911; cv=pass; b=hKbBdSJKnybyhDJgRwma6GFg/Wg+Op4H2kjwC+Cj6sOypY4gZ5s4KFsf125ez8p64fcG7k6FyB3dgsXTeSNE2oSqaokL7jTgCGfjRVQfpE2ZxOusdk1WHYt+ENtuDWodpYyS3Q3ynNqMFwSrD01P4V36fRoFKu1FV6PmqxspVW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790587911; c=relaxed/simple;
	bh=8bjgfdeQqI2IU+pfMdd1CQBiBYTPKG3YxVTrgK+MF0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGkBnkKHGF8oaVnAVOBk0Pzi7HCJ0YdUbMIlcEaoFklKcACEhUH2GVzLviTa56mRh0dGIiGE7faHpPNyTHgFsKfQ8ld6cGGE09LxA5aUrKyI45rhgatut4D+SPe8UQIPCh3vpapJbxJMXCUJMmOAElEmN+EGPKPIyVQI4LbeX6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h7lRS1yu; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h7lRS1yu"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343697ad877so106583eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790587909; cv=none;
        d=google.com; s=arc-20260327;
        b=kR6cLXT3GCgAEOX/aBT0eu6gVfCaGUVYEfwdgYrnlHg5gEItQQDDtwq/K/DZ3GBlDM
         IDEhEqnpXmMD0YKjOJcidS0C7FTVNtKT/Y5d66g1ZQ95n1hUmiJKvMenjwtYtlPDt8ne
         FZSVAW54Yj2HDFIsKBuOQh7tmQD6a3dRAakHXEmcnQeOvmf27Bxjgg+egfbDfZrNGdCc
         UG0RVwpUGrJqD07UBMzWm8d9UWBdcbnvGH8x9fHeWoL1cCMZol8S0nF/EodixRpk0XfF
         wCrOe5VtZZdq1eiAC8Q8+LPurENRPN3rj+APVZspnAEP7RNQcapaS6YZHaoVdQGktqER
         ZtHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JatWv86M5tAY+wc+iIH3agFbdWx7YD2AHOeP9v9NLF0=;
        fh=WFHykVOUKi/kpY7wrV67pYycAveOlegMIxx8Xl1y434=;
        b=Wo+DJWFpxtds9pxH23bbCgqdqnifL+GNXs3XXp5U5AxWlaxPPo/JIjNcw4sZ+cOcM6
         unmxm34lY6eiVBkgluhfi+jXFAKh55RMrLpbraljhlnpaRL5u2N75O9BxElmzgk70031
         UDNGpPYFpHH1+TFxaHvMzKxItuckO22A0W+sZHqHRW8StOzwxSAdTyKal0wPbNYu+h7y
         kVgdVGK/i5inVhqeG2CB+HvF3EcE/DOk7ceax8R2KdnCRJl34wStgMZLHWRmG8v0DzcF
         s13c5LzrvNqOGQQKfFt7PoDDYU6z8LWOMW3natg0zpMzdteSzyIhH0DpvMcV0n9vJguo
         D2cA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790587909; x=1791192709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JatWv86M5tAY+wc+iIH3agFbdWx7YD2AHOeP9v9NLF0=;
        b=h7lRS1yug0s0CyXl1DG0U/dn/Fo1Wite3QMYnhPaWxf158B/Rh2Wue2Sj6ivRtfAGk
         NHjghB8yjwBWlWzEU9e5afBIB4A1gKHybgiNbLXC1LTNKH68C9dEV4ubC5X1nP0Z+dxJ
         ogIGtPMR65VIxo85lKvEDhh5IC1ZzH7JCnXVkRr77Uc67HG4JqV7oseCTSNgOGYP5azD
         3u+CpNSowIVMFo4c+U/TTmuTtiojPQSFJcgQwKYTo3Xe8IO2dvFAh6M/ehUXTnwahDij
         LqwCAQ9nBWu50lvyBXCAZF2BR7WnLR5cdnPc/3osFDNSDMI4ikw5dboNFNRR6UNMZKm3
         SfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790587909; x=1791192709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JatWv86M5tAY+wc+iIH3agFbdWx7YD2AHOeP9v9NLF0=;
        b=N+m4wj04Ti4j6XlY0gBdEaKRxnl2jrsDDLS7CgLrHhbfJ0gwdON6YoGZlmvF5hvw65
         6UirF7uISRlWro6AnQv34BHGwDr5UoT7cJHSsHFv/S1093hgDziGcFIaSDqencjYg8UW
         f/qurcCBFNin4c01+9LtVv77TG34k5TVLNMr3xnzc8x59NgHKFiOUlC/rZML1DXCDkzh
         ZHHYQ2Foc/OPzWsWKLIoTNXNLGnAbZRUmjnW4byANx+Yzw9WER014l1KYwAAIvsLf1Hb
         aXwM0/cN+WoW+ekpF8xBoXjWg0u0ZiOdmBZMsoW5ScnR3/tVaLP2ODxfXluZL5xaeIwC
         jCSw==
X-Forwarded-Encrypted: i=1; AKwUvByMCyYGNrZLhrl/07ofF6N67tpSG0U9sNpwncpKzMNjifWUewO77regBBIl2YwXcImgcKy3ZJRPKBxyqD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2lWS26LnDhfJEHYVdmFMGU5HOkQG8Rl2mSlFKjtdC9nT+rp3T
	cA+DK5UYNWJoa5zSigJ2di/wEQOejsh0fDMVqBJbIQ9OGsyrI+rZJ4L5jo8CqDrNR8+FhVjrk3d
	eCiLEDq6Ac1FBGNObG9053JTyEBzas4Y=
X-Gm-Gg: AYBFou044tMGegWsUub9UboN95tLGL6a5BSa+UTdl3MXtdS8con+nXv1KqbaYcEpRzg
	Jh8XJPVpYQrotyz3Qnvu1m/i1vsmr5sJpp8P6WOQzpQHMPx9MR41Kv2w9Tj9SZawdv8o0lDwbpc
	C0TqvZ5X0pYDwwekfGodeCYeR83JtOy5eH0a6T5z7RpVFzFjZZfAHBVfmCmEf09JrlvByjUJHtM
	cP8u6+kGDjIAcJvSvtjfdm2Jv92SbC7oJz/zrQ3i7UrppxSs+hC8uJp7+1MQSFJhPP7pT3uResh
	Y0TfGr1byDu4TW2fDUOZYYZbds4nxok97KK2MPtVb/D2o+POqYpwQdBhC2oV6YsfkpsVuB9OOwR
	5Fjr2qVbO7IOsRtSYVWij/d/Xy0/DR/KumiRR7VayeTjRoKrMQ/hk5LtakEibJOiRtUvyRvDQqW
	RphWCk/r8TJPEvTDy/Nww5a0wI5RM5qb49TreIegm4v0Bd8vRQQi8=
X-Received: by 2002:a05:7301:4d08:b0:343:fdea:9a0 with SMTP id
 5a478bee46e88-343fdea25bemr10256179eec.2.1790587908057; Mon, 28 Sep 2026
 02:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921115708.4009754-1-gary@kernel.org>
In-Reply-To: <20260921115708.4009754-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 28 Sep 2026 11:31:35 +0200
X-Gm-Features: AclHuK_5UnWgzOwmLK9oqngFyj2kXH-LQPWosQXOUVyycWaI9jdAOOJ-IBnfSXI
Message-ID: <CANiq72nR-QzR3zOiV=RL4je4U8m_hCsPhOD3SxAcjc+4VCrMsw@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 1:57=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> Miguel, please let me know if you're okay with the proc-macro2
> modification.
>
> I'd like to take this via pin-init-next if possible.

If you think the diagnostics improvements are worth it, then I guess
it is fine. The ones in the commit message do not seem like a big
deal, but I assume the upcoming ones you mention in pin-init are
bigger improvements?

(I would also probably had shown the improved example outputs in the
commit message for comparison; and especially one of the upcoming ones
if those are more important to get right)

If so, then please feel free to pick it up, thanks! The change itself
looks good.

Link: https://github.com/rust-lang/rust/issues/54725

I would also wrap the `README.md` like

  identifiers, to remove the `unicode-ident` dependency, and to build
  with 1.85 with nightly features enabled.

to keep it like the previous lines.

Nit: "a overall" -> "an overall"

Cheers,
Miguel
