Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E3247A0AB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254011; cv=pass; b=Rf+nm+RcPdpNMNWl5phA1bvrHGwcQiBGfKhco74dOvARHLNK6uK1SQV4MOgGkBa9klvHtQuUmnwYjsXEaufEFdgWcXXg+DPWInuG9f7tyc0ucFty2Bfopl/y05BjTtXt8zyBJ3vq+Zy6Nr8LyY/eggUKW/3uWY1FeNN9EUd9hZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254011; c=relaxed/simple;
	bh=vpZBEto8PoVWCX501jJbndFd75E0wS7eccM0P5s5MNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFP5kjn9PmeYE5Sm2Wk5Z6O7fgiWTcN2FSaca5o47uVJUWYLF8A0mrwF9e2R0S1n+5Dfuot9Yu1stYV8tfYW5MOavOQ6KYl5z8uRzTfclAkeRIVSvmsVJDosLuzs51e7sx9JAOcRc5Pw5fFW2nVs7GskcWS6E+5Cz5v3iIh/GtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ+mdyBN; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ+mdyBN"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cb48db3eso444157a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788254008; cv=none;
        d=google.com; s=arc-20260327;
        b=NvaM5qWhW0E//WCwONRYoHfb6wE1NMequInkumPcYidjHveG++VvhpVHILDiXD2d75
         jhxfN/dF6F8nLq4k6abyvU+c0+efD7sy/NI5ISYKF4JZxrsM8yevQHEdD2nYD979ZrfI
         K+q7lqt5aiUG12M7ZOU60WsYcZs3mAWNxMwNeFK2ZbD7cHGD/G0vBaji2lrmGw/LU4le
         S68gOCCluNNILagfDnTUuCNRhl/w/e4poTCjbN474NnDxUjzKr2IuSWQhJlDF1Nitfh/
         BhjCqU2iY5sDrwPpK2EMRRnUnpLN5iJCCOLHzRtCzpz1dt2miXPdetW/tTk9kGY1v2aF
         4NnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vpZBEto8PoVWCX501jJbndFd75E0wS7eccM0P5s5MNw=;
        fh=PWucIqGRQJWdUCllGlHlN5c8FHtRILV+Bl/TvmyDv9M=;
        b=gyrLMDeddiKnNJAOaV8+rHVq2M+JpEPDO6O1IoXRL9AjvpFtbuuXFtHE1WOvHtcD7Q
         vF0fl9wbbeJYwaT+HbeEPjzbJrwRDpn9CUfh6LBzaWLcYfeJVGyyTCy2ZtmsKxd3IT94
         taNgy8pLe05RQQ+FnPzu8WKCPtFdkbnAwoYyRefLUKJfq1nY2NdkTsL+OUyT5e6SqQD0
         epUCdk/pqMQlenaKZTWXIjNm6rRAK5nhXu8OkYNwva9b+z64KaVBKcc7PrUoo7lSwKSZ
         9inQGYlNvJ6uGurbQOP9cDH36io+FQEg1rGB0TU0Ylht9h+vtpC5fWGq/4PP/OJFTMiz
         Y3LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254008; x=1788858808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpZBEto8PoVWCX501jJbndFd75E0wS7eccM0P5s5MNw=;
        b=kZ+mdyBNwGXPB71ZOD5ubeRlNeoMjjm1324iN6VVXQkvPXpBZOKXGwe9aGz315/qq7
         DhFxQcy2jAL0m7AR6gbdouQyb+NdCmCFlaCQCtUec7n5mwftziRlyOtGCLtRWjHc7P7Q
         E4K0m4plTvyvZZ3YfnZDYbx1hTAaSP8TtJkOBxL1yG/WXZRN7LMS8RCgfLMHKeNU4EpE
         ufK18YM1bMOtoyS2wVU/J1IYbcNahUHBv/MFeymV227UYQuzT/V6xGcLvluPmBXfVfbb
         g2ZZlMS7h08VS6Pph3L85s/aXi/xtodluv1DN32yg0Xr+nJKxQORiav+nY17CWAIG5YZ
         CT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254008; x=1788858808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpZBEto8PoVWCX501jJbndFd75E0wS7eccM0P5s5MNw=;
        b=kzE+S3KEwN9okqrL0XUNcrJtfcoInOXc7xpjc2LGkiE/HyJ/gWVEYYI/YKpI27E+46
         VC5Naaaw7oGDgyFWe2ogkBBqpMPbXz9FUhst904BjDcSXWZxGvw2n6fPcrODHRyI0Irb
         2dVxm8LrVUPOWrn9nF4nUy9amtCBUKyYcfM7dJqGZZK4q+HE+AmjRDh6LzVqZ6afws9e
         d5lCTzQLbx70wJ7NXR30hOZ+eDXIOCG0K/aOGi34dO/NNNig/zsu9BWc3DoCCZY5WfLO
         1XkVm41vvkUz+OsVlhEK2HeRgWLYg1REXkT5qpZoEhARUYMuWFWLOoYx5K4fzPXlERwQ
         RM4A==
X-Forwarded-Encrypted: i=1; AHgh+RqA3gw2Ul/QdNpzplVWgTOWWy9diUgZA7iIM0aSyG17jnWO56vdWoAx+VHEb9FD6x3PK6Ge6ektn6IWDy8=@vger.kernel.org
X-Gm-Message-State: AFuF++mZy4to39Ecpy0ru1UXhVNZPf1Tr8qgSfwG56tP8FAWLzigcaVM
	y7Q4E6I3EH78z+Lbk39z30tAzQE3IOG4/Fw8LQGsercMlUHCSn03/9sjmEFSoBIJLZdf/J2G8de
	zuVdOv5wFHs/K1as8sK72ncZQVo14dVc=
X-Gm-Gg: AYBFou3BRWiQNq2tv8T9HsDsEP71RSopBsUL6T5ATwT3d9k9oF6p3GWYKwLWtKaacpJ
	D7zG23iEGG01bPF/VgDsSgfWRgojo2Ku3AVRkuqJt6u5QRIC/LB5wMKwhlv4JoapBs2pgKms7e5
	vglr+3Q9U44iAPBcXOaLoynrbJ2p0IhSyMKkAOtlEdhYk7J01cgNeCj5jvc/ytDs9sMV0maFim1
	cwmYl5ssth7bDl7O/SIr3L6o79BMxTG/igf0q9G3vh9BxTV7jQ5FeQ4tmLH1xV6+8t/BplDx6a6
	kE2F7QFWGUYtE+EDCovSLNU9fyybuvKvFbSb73aXSAYDdm+v8J75hnVjglvDwHceO/Yc1z7XWcl
	ueL+xaV6lk0bd/jfDGBBNeRoMEqli4OOqJvechXMB1geteTnCf5DrLRs9qD7/eHTC3NZgo8Y=
X-Received: by 2002:a17:902:c94e:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d74ce5e476mr262988545ad.0.1788254008481; Tue, 01 Sep 2026
 02:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <eqzS1cYG2bYJ10oFrfX_D7UVNqb_NuK3wsMUUEXpdBj7yCtzD24WOzI8zIKg2FlD04VFp_R9xt65fGmEqpt6QA==@protonmail.internalid>
 <20260831-fix-gendisk-block-size-docs-v1-1-900546005799@hotmail.com>
 <87ld9mxxec.fsf@t14s.mail-host-address-is-not-set> <SN7PR07MB9708ED760C7DDF833BEE80E1CFA82@SN7PR07MB9708.namprd07.prod.outlook.com>
In-Reply-To: <SN7PR07MB9708ED760C7DDF833BEE80E1CFA82@SN7PR07MB9708.namprd07.prod.outlook.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 11:13:15 +0200
X-Gm-Features: AcwNN1WeTomQFbbl4m_DFvxroJZ1wjKX2oKzXiA5vqp9Wpi2S2v6pF4_O2NjrD0
Message-ID: <CANiq72mC6uUrjHQ7Cz41o_=+YPBobf5TX4X43WfDhObaCRBM9A@mail.gmail.com>
Subject: Re: [PATCH] rust: block: Fix GenDiskBuilder block size documentation
To: ai qubits <aiqubits@hotmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, 
	Sophon Z via B4 Relay <devnull+aiqubits.hotmail.com@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 4:00=E2=80=AFAM ai qubits <aiqubits@hotmail.com> wro=
te:
>
> Thanks for the review and the Ack.
>
> Understood. I will leave this documentation fix as-is for Jens to pick up
> and prepare a separate follow-up patch after it lands.
>
> The follow-up will add a helper in rust/helpers/blk.c for
> blk_validate_block_size(), use it from
> GenDiskBuilder::validate_block_size(), and update the documentation to
> avoid specifying a configuration-dependent upper bound.

Note: I don't think your messages will be accepted by the mailing
list, since they use HTML. Please switch to plain text -- thanks!

Cheers,
Miguel
