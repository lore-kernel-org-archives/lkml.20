Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DF9583AB4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897575; cv=pass; b=V1C7ElhITsTtQJJvaP42yvf4P31dLU9zl3L1EeiVSrxWD3qNfUa2DYYrWY8+J2bgYZognQ33I//UcOFNNfMEAPB0m2l8xixMgvfUY6UfDKlxVSyEOZdyiZSzGCNJMtjgiCV1rjI6uVO0sfSlZFF+wusXjxFC7pDJs7npuKawH0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897575; c=relaxed/simple;
	bh=DcQuradJJQuqIQy3eOyKV4Bhq3ZNEMuO/29imkKSf4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIdE1IPk40fxL8TyjCBbq0EO0m4bu1taSVVovH2GEsF/LVIaXKDiHEo7nMkC7yXPjmQHxEal+1cC9fgzAKqIZrkVXzxw1JpA4ZuxPtTQwUKIfyKrI1XZYyzcEI/Ydyxl2K1o+fzc8KdBzxgTZLRm/PypWN/YD6ydkMyANlJCcYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRZeJdvw; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRZeJdvw"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd281so869530a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788897573; cv=none;
        d=google.com; s=arc-20260327;
        b=OR4nbJ1b6VqY2l+1Fa3PpKB7c7PkIxtbrAJe6jAAB2ZD6ruAt953sIfKZZy275fWPd
         bV6lJLAiKXpHzS+t9vAeDdFreb+R91zI7mqpYQHG2F+DED3Cjaq1A3MkWNMwteGs0V6k
         2V3VsAFInTcfm+hud/EGFtHB2fJyze3AONxr1FBGYZPQhvE1I5a4BWyAoDTEL6zthAIf
         hJeoHqNeULro+klenvJL1bAEFiZYAAR0W/OiEiBh7vevQQGUU09D8XAQ10sT/Ujw98wk
         J1nejwOxCfIdP1ZJLxCE8JOSOhekDS/MdBAjKXpO3PggwuUuVYg8ecdM9JnVrSVNzcB0
         7Gpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EA6VJj3uj11HfKzs2Men39fPqqbTFVz4Jj43+Ofeu94=;
        fh=zF5kSNFV1AuH2o9cIzohuKJLhPuYzxwBnXkoq18Br60=;
        b=Z4YbingFxV2mzp3Z8DF/GFHRCoaX3jOVdji8ljDhTNA0OUckOIYR0WUNyxz7zfMKps
         DVmDdvw4VO8z9CDq2M5sTPcjwPYB0rszEQWPx8hTG891gj5CI2xkO8pskNnyviRD/BdA
         hYPba/Y6qUFBxYRXh0jU4PQ31gTvplAQjSMLwDnUcJoHhnb9fwqo0fDhbjJpriOFNjlc
         5f+mMnqttqbIze3JBmmi4OpVKlkKFUuaqzhZSTs0Bza2L/zr0ROpovk2apIo8jOGdHSM
         ih6U2YIgUXDKbl/a12ZnZftpidWj2sqCQpaf+SAc7lkLx1A8AItDmNyPKGuxC7Mbr0ui
         +Bpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788897573; x=1789502373; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EA6VJj3uj11HfKzs2Men39fPqqbTFVz4Jj43+Ofeu94=;
        b=mRZeJdvwzBTcE25lzEfoPqeZ/CqpYODMlf/cjrVYVLPXdAKw9UoM1ThoVK+F5/xCgp
         rGNHQ9BU9OiEEuvplh7lLwiDjvZX5UAOnOtvOLGChpBXiu7WVmnZhjp+ePEHtFPE3tJg
         mATuVtTaPonRWrsihOa4CNvg7/J5fTPIT56xR7tlWr95H895PXJmceDHH5tpyPj5dc+o
         8i/eLrYLH3O/tJNzofDblhegP/6al1TGhJxaNaSiG/BvlJx0b5fPoZkoO95aAKJtGV/h
         O95kntfp6KRfQNVOWEkmyVyOz076TAOKO16zMwF36ft+a7hG0HtMmRip5SxVthIX+CnW
         +1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788897573; x=1789502373;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EA6VJj3uj11HfKzs2Men39fPqqbTFVz4Jj43+Ofeu94=;
        b=sOjt30nI3doUEEngwIosL3QHYa1IY7s5Su5f78PLxOnAwyHEhthzOhM0R0OdX/ZThh
         ZD1paSsDWtqi8omEx7JxX0UnVgHC7rmNu7HCU6yGMrr5L5AQPKBMRiSArXNEC5GIfMT+
         puLFET1cUEi/bxAe7qsrZUBEXVMvpUs2cBasKT7TR1XQUARhn9WwXUqLcX9d+tMr8DBe
         Jnzy/xU4KD+wtJRL8ohXg5TDN0VVYR976BfYxtJ4rCBtJ0yiZT4LChvuDeyBGU692hRN
         7yGrhuJE1Pvd/kQZZCKt7YxluYjt5NTkz7b5qmoPC19qvmXe0FjhEMrjU+5y2H+7/EFP
         xLBg==
X-Forwarded-Encrypted: i=1; AKwUvBzzTVduQ0M6ZzYSY7hZQkaU8nMd0wy7f8WRYQ72Fn5AOkDhb6pRCdLBtzAJwXagxOhmLqe426YU7orf19Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kwuwYtbUXgUhCQvD05DVQz/HSYJgUj1p4ZquGzupa/00xtgfzv
	IKiVkrjdhQSE9sWVjxFQBmhKP76mlr/RB60p0eDW2pIiepcMetH5SUCQI2MIKJbsWZMMjJQvwoH
	Pef4M2FSJaMRGd5urQ6CRzHJa4OUOgB0=
X-Gm-Gg: AYBFou0HtAeLrrx5EZN47ZOccXznVmo8fVxSCiA7HDvztRUdUdOJknr3iJlvqruVg/F
	mrc7Xi5tXq9/sRdVrb93a0yCGUuZ3TbjBcymxASonUTthW5amFxMK7j7sL5voBJrozb1iXyCoh7
	25YZkCy6QoBXtcU449xeC3xTyNlq9YKXc7slMMgrAW2zNQnKDbCfTOFUE7mOQmA9DwoMtVe0Kw4
	C8NbKNQTBaqHWpvDiHcdtY+Almendr/JrJB56HQDZuH65e7dnmnSuSMDjQ0AvTS7o9LSxNCa5tP
	grefeNTe/s5+hlt9f4GlV45SWkqPhNcBH+iPh/CP4VUzjgPbX6kfFwgPQIh6LhRLJkpkjKfJG0A
	HXAADHxnw5IZGtNTLOsAj8iPEXKEvccG8gyAiNjmciSu4l/oFk1cc6S887PZ7HMs3FxzdrWRWBB
	m1tnOH3A0vJG9eddkZv4BFUTheABGolgLDNpbXDwbn
X-Received: by 2002:a17:90b:1d83:b0:398:bad2:c10 with SMTP id
 98e67ed59e1d1-39b3d85c011mr21904473a91.6.1788897573126; Tue, 08 Sep 2026
 12:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908080604.34070-1-1239989762@qq.com> <20260908092624.63350-1-1239989762@qq.com>
 <tencent_DEBD9FED1CD8FC1625D8EBEFEEC3EE7A0405@qq.com>
In-Reply-To: <tencent_DEBD9FED1CD8FC1625D8EBEFEEC3EE7A0405@qq.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 21:59:19 +0200
X-Gm-Features: AcwNN1W1ixlmDUMcGjjuM4E8fj7zx1Mzofm53MZn3V50s9jujYSJ7LULEMxHfsA
Message-ID: <CANiq72nBueaioDwo5d6=mHWjjJSLO74EvK+28OMtKYH=XNh0UA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: make unsafe_precondition_assert! const compatible
To: JX <1239989762@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:26=E2=80=AFAM JX <1239989762@qq.com> wrote:
>
> Signed-off-by: JX <1239989762@qq.com>

Thanks for the patch!

The kernel requires a "known identity" for the Signed-off-by -- please see:

  https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin

(The thread in lore.kernel.org shows unknown messages and v1's cover
letter was separate -- I would suggest sending the patches with
`git-send-email` or `b4` and using a new thread for each version -- I
hope that helps!).

Cheers,
Miguel
