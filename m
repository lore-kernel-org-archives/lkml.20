Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192C6440643
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137776; cv=pass; b=g65DdF035CJDO8vAwPrhG776RrFbFmjRDhfS8kxIxOfhucIUHRvjfVUEJOC9xT5GVtlSSAMNSICnl9kB5UcvznNDg7OC13gEUkYUlInOSiqKXgBSUXcg/lAgoJ8pNPLtcGC4PPKNUpW16uyylKNTF4zcUL0hGY8a+RKxAA8if0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137776; c=relaxed/simple;
	bh=fMgWkltWjD8XgS2rZlbHinux0fIVC/yssxPGnE703tk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6uc4pfC4ciMMdBUV48l89OoBQM79LYfKUf3KLdxOMJXwRhbxQOItNmlygLtLqXAN8ucygC5Px1GJ61jsowbX5XZSPFkKpTNFiMZDmAApWSwwid/6x18KhxJBSxl0KibgC1WZV/AZo6XND1hfYSTYcJlFq7gAxCaH9kadEmTDdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YKTHjJRu; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YKTHjJRu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso13194865e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792137773; cv=none;
        d=google.com; s=arc-20260327;
        b=iD8hGkk6Pg4kC7FH+GUvE0jCAZoeHvb0O6+M17mjkvVu5kFcteAPy+Lqeq0k/OVOlh
         G+bLzluHERTtSMnu3nGGiQ3x9xP6svAZgIC929JvoXfTxef+Y/rfCn0fG5yfjMrls2L+
         bG/d0rQI4TwimScaDNm5mqVyElVrOqWAlfPl1Qc5uTNXcgvFdHZ5Ez78i41JFPWy/hRV
         +ogL1ckdDYAkd7HjWiWjTwQQRiXFTnrUfOMtXkrK/qekIHe444kZZTmVoyfDuNcRfcaK
         xHOR8S2N/CQoe6Hr3bpr9ghW59dDZUCjimMzT27fXH/RwdcEzeVbMT3FZjOO7LoXak74
         TAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fMgWkltWjD8XgS2rZlbHinux0fIVC/yssxPGnE703tk=;
        fh=uVbJ9krnWqgOQMq410Z7gnVKLC/YaFbUAlaL1slmdGw=;
        b=gTIf5LQtBnBF/Yj3sqVyeOapmsfc66Cx0wSu2b2GTFrbg8fOzEktAqqKKMLx3tHhaQ
         TPLe2edKrXVzjr1HE/C4+sp3IprrJ4p6r7rUoCgkQI2tG58B32nHd8csIEiUH1S6tYQa
         zQ1+w5YwTZjhPqOrNey/pcN0Qs6F3FFO4sakdV0gVBWXx9GGWnI1GJzyb9C9fMI71C5M
         cvIjZVl5NoXPmzqTY+WlysTDWsqKIP1Dz7mHee9STuhyUBxPM+TpaT2gVgeC57XTLaEL
         EVetDYUYRnc4qRA3rGYIA4p0wrAU0vLpb948qLa8lvFTTIitiCIrxZkokhZpd/VpU0Vw
         leLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792137773; x=1792742573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fMgWkltWjD8XgS2rZlbHinux0fIVC/yssxPGnE703tk=;
        b=YKTHjJRuVSF9ox1VEY8K6IamOaaN8yFGDET9uoeBC3KZVrGXEGtY5vnb30FNVTPFEl
         ZA0MG21uX9vTWOeR3sDO5gp/CStaQjQ38i19hbglZ4CJh3sqCT04y5g4ei6CBKAxZTNY
         xdFR9Y91MKR08QDGkt3nwSCnjK24lkhWIoHe14mtoWtwCcAEe/DcHDSlZJHcPoDRP++f
         hyjmIA3Bzjo1nFL9DtfXhJzaAp0MHzz7dIoHW1QeACGhwqiVLGzFlR3fLCFn6vNa9XmN
         WR20zBgcpY5+B2ox3ndU63OOWsHXfGSFdKQuJXKA+MvXYgqJsaio8PGghSex51u0MsGi
         RctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137773; x=1792742573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMgWkltWjD8XgS2rZlbHinux0fIVC/yssxPGnE703tk=;
        b=EPOw5RUZkt5XG+y/DOTy34RynRAQj4kjXsRcTwaOFg8SY7e3lNXIa3djB1if5ZZbN8
         APupAJe2nbQmZXv25n9OvicTWZNySdVfT5B6Tog6bR/SYGwzY/87OQuh6NoknkNgBbdV
         NhzXB1cvZceXfT9pNWkZpIr2x7wjdylrQOy8a60atTuWQKobE4KcIU2TnnL8xwHHj224
         HQt2HMZTbjVn5f/K6o3RiqmGlhOUSBH9Q2pUFk+fX6KXQmUNoUinN1Wgt5GiIeesc/oR
         woXiG1vrtZBgR/nPKteckLOCXsRxoIcz7WPkvX2tf80VEpUYIwa4OytOHE4eCwchqqL+
         NqGA==
X-Forwarded-Encrypted: i=1; AKwUvBzzIPsoOk6nMJ+c/zvJQVBEAN9ET0WNGkYeHBaOvRvHqjfCkMi7RwToev6lg4TO27xUynl5ZyI5cR7eAhI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCLAjQo7ZlYYqZK64YC5qObkhlrB2/HzVeHb6sC2ZvDUdxQxA9
	OTvK75XDjgZZMVTHV36EeQsVrlX8uMOJ8r9/ViF2G7cqi8TBaG9+kQNbcotoyZ9pYcrLqUzaa2p
	21A8YM5y/HkpTCxRY/wEYoZaxS1NXE6RjzWuiwtmb
X-Gm-Gg: AYBFou1XVvGGedZte2UVO2aR/7oy0UsyoduaMZQtMwNM9IegnTIjjtVG1Ns8NkTOZYz
	2l8wv+Ewz9M+CjZAs3nCyCNBOnF4x9Mide2YN7jkspruJ3rnJXGAHekQMYvSNIsBRTIQ+KXam3Y
	o1JdXAwgBZQuL1+v65RO6Ch0FR4Jdr/phKekI95/UWRocbb+mQL5Bq7SK76O6krNs+FaxIrJch0
	Bxfw+rYB9wF0ELBOR5JFXXvF+xJ3HjN7QXptzN3pHX4NMPu0keXdXhmuGfKpJuypzdi/FSpzDon
	Zyh0Owwej9TESGVw9Bsf654lAQJRqBDe9h/gI6pxPzUJHopb3qud3cMnSmrd6HPIgbcb54A3iTf
	dffEfpnXy+MysIsMpKcr4qhSkWtL8f9yE6ZGpZLC3hN5gs3aB2DEN
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id
 5b1f17b1804b1-4a18e47aa9amr450721915e9.6.1792137771107; Fri, 16 Oct 2026
 01:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-b4-dev_query_fixes-v2-0-e3e6d25050cb@collabora.com> <20261015-b4-dev_query_fixes-v2-1-e3e6d25050cb@collabora.com>
In-Reply-To: <20261015-b4-dev_query_fixes-v2-1-e3e6d25050cb@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 16 Oct 2026 10:02:38 +0200
X-Gm-Features: AclHuK9VwH3E-o_Gsv9vnah3Q_w3nfSpzW3kvlPExDLV-AMTDeW1DeiF3LCmVWo
Message-ID: <CAH5fLggsJeaHfwirfaMvTUHr9rArbm8qPXiEfYiprjc9M+To+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: uaccess: add UserSliceWriter::clear()
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 8:35=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Add a method to zero the remaining bytes in a UserSliceWriter.
>
> If userspace provides a buffer that is larger than necessary, provide
> a method to zero out the remaining UserSliceWriter buffer. This avoids
> userspace consuming potentially uninitialized memory and/or mistaking it
> for data intentionally provided by the kernel.
>
> Use the #[inline] annotation to make this clear() method available for
> inlining outside of the kernel crate.
>
> Since clear_user() is architecturally defined and may be a macro or inlin=
e
> function, add a rust helper to make clear_user() callable from rust.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
