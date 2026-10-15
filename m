Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CF7457E46
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046499; cv=pass; b=eF14a4u+1ZxLHJJEGnEJmg5BhnlNdeglZHXmBCzStdFryVWOv8RHKzGm/LmNQsKkUpHVv9C0PWCEuhOquthHwcNTWNh98IVr7usdmMlThSdtU/QG4RO7XWggRt+StCeMYPLnUr9oxo4v+hCcJ3FcoCR/ww8RpbbmGbbYcqoD2k4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046499; c=relaxed/simple;
	bh=MrFGI1be76pYyB9TL6I9wBqjO1kJCs3f0U+Fi8vpDZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlQ9NUwtvlrArkGjnjCemv+3dsOeOlA6fG4ZI6opKk7I8XTMRCgSwMAoSmIrgygleaiqXDfqp8gLLoKV1tWtXgGio9tt5YIgSOQuKCN4EjSOq8J0uQvxJnwLRO4x+4pYZsuIdKLWe0dD/kuOQJJIlwpEFS/Q+ScZCuWHFWxUmTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9mUXX//; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9mUXX//"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33c10faf6easo523798eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:41:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792046498; cv=none;
        d=google.com; s=arc-20260327;
        b=XB1Bc/+vPrs5S4yBgY4sKVtNZHx4Gd7rbDN1SpkmS5uIU8b2ejruI3x7x16uE/ZiOH
         mw14edARUzL1xG0qF2obdRhGkYmVgM4N7mNXV/amYm573bLWg5IqiDJVx+RTq8kWwkID
         03c2FbtDgvZyr55M4kwtOceAzioH9h9KDZ32VmCHkPtCU1JO/IU7fx/vdCli6Jnftmmn
         oOI4SshAdw/KPGNhDrF881Vb8U8oSwd2HxlpCXP8Kd8M7PNRpl8VLJDa3S62fI/XGANV
         jIbNnAqcHz5nLRBRwx9j2gIANre20QyLxfH8zF5P3mxN5Kvlk36HqwDCJ3GUXPVOFRBo
         L/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        fh=lS69sQQGb+IAobuQsNoczyGiJbGDQtv6tv6XTYJKnbc=;
        b=okhETbS1iaGmI+F3XkjDxm9hDCiOunOu65IZQQ4hLF+4rzO5zhpCZuEQQLDVoMo6v4
         f/9wenHms3QQgn5ooMp6qB+WKalUtEwqH3GrCJjz814+EEpK4q0gmd44eAGzzrXaGH7W
         GM2D/8S5EXC4p2ji2z8uvdxwEMEXQhoVaLLbTmzI0mmKK+VEe60vQO1OA+3AcJZweMYV
         5HyzX7GiDAwxd/gZff1VLi6vSDqcxepqzR1JET/sEashXx/GVZWjcR46n8grP0S38baw
         zd2rHphEJ0E/75Zf6vNIMwHakfn+vGR3HAVB6XAZG01l8SEfd0u8EYblslyXqsPXhIVx
         33bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792046498; x=1792651298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        b=d9mUXX//0M3BTdGknxyw62CeTj5V3Y/5LN9YHt24xbjmuhkd0YFUzgB+euNwwpZXey
         +uSWeXhLWol1IEM6gbxUQ2Q9idIdeXmwgIcSbyBqkakMBNGLzvn5LD4FQkJ1ks8IZgy3
         5lzIkaEDc8BfgLo2yHGw0alXY8BWi9NNcp3Z+9Npb0k6HhOF/uXcLFWNstTExJVndfcC
         0+2oAP+XV7nnlVAfa6wF3UgClnx0o3Sm+EwS0pxPDYRyIt1oypzVnDBtVxWnZGv0glID
         pP93teQk6cc3c7XBr+ipgP94/ooGaUFCcZUGvKUl1wKu9nX612K4vhh/vBH0wzksFgVQ
         r+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046498; x=1792651298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9odSnvYCtr0sGptAX/xIcYUrhmINaRR4pN3Qm6Y4SjU=;
        b=B2N+I+ZPdpARJlrEgPGFubXYo1zBoSiZ+qznL5LMyvT0ljNMWP5NJk9IOddUOENQ58
         l5tcWnrhMXJqOmV+LztjzX0d9ySFtj1ixpu3hOqj7jEsfO1v6sp+uUTk4TJq62JYLvjR
         qTSmguvGpSWyShfVcuividhS5FdOvTyYBz4EMxv2mp4tfiF2ANTP8WCsiHeQbwhjprGB
         CHkG7bAKBACvJXK9PswuKvzeKS0qyK0QImkLD9CLth3mfEmLix9AKkEL3aENL1ydMdFZ
         h+bgtXSCWZcmdGGsyLfBzddK8+SBhrHaD9pqRpXV0fghynjPI6+EaVxeEPqAS/U0NpMK
         I62Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3U4xXdX/1RDOfKOWvLtypQ1N7zg9pnCrIgksYLRRXMCZaDDIb7g3rJZWS7ciWppb64fpNhW89Urr3vlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcoCCCoUxSgMBYzTpp3q+mAWAy0X0dsPOnaio+dekUWkC0/9qY
	p5s+vGehkY7OKZYqUkcy2l3oezP1ClibASfMuY3RAjKM8WTJykb3XtJHxpMJMg4AAD6pmiHt/Gt
	VnSU/mP4TQmEDn3rlzcoOG4clyR96YCk=
X-Gm-Gg: AYBFou2MaYoBmCMEmSwwB/DD+DAdoT10npunEievSE4B8sEnimktN+R/sKCZ6kyDxhP
	cRluMQLru6J25XhAKnJTjOs2OLdU7h+pRcafB+7Vui7l/FjgK9J2rYntPipoem97u7pfeeitu7L
	r0VsynSH8oF2zxTO6S8iKoChrxMB1vH6ry/PwuI2RxEicVAeC9QFP2MEyxd14YX8sWFAd4dMfjG
	whd4/G7X4g3Sml6Hx/4FiY8L83HxPaOmGQG8ODxxiianNj31VDXmAvYsb/FcYvuY6uYCsIEpjIn
	Whf7phmHTrAPjXzjICAj68YWnA/LhDi9MzyaoEOWy/toJtP5PCp7PutPioowMcIFUop7KI/qiaB
	y0egAQN+lqF8kJ5CTE9GdVSMSCNsMgIJklmFV2aBH6cowdB5Qnvrq2ozKlqcFjruOTXxSz3T2VH
	S6AjcDzOo26Hl8hC2KJ6sl1S1CNl8akT6vNLoWPv0jTtalonO++zM=
X-Received: by 2002:a05:7300:8a9a:b0:35f:8c5d:5938 with SMTP id
 5a478bee46e88-35f8c5d5b04mr947891eec.1.1792046497624; Wed, 14 Oct 2026
 23:41:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 08:41:24 +0200
X-Gm-Features: AclHuK_HDQ14xS71Ad82_rpzYIJtkQyGIN6gdAVSfUGhxccboCyKadyvvVMRcI0
Message-ID: <CANiq72mu5nS89cxFQ8c8k+URcqfSCGLJ0d8xW3k0Gp-fMeVWLQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:08=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> From: Danilo Krummrich <dakr@kernel.org>
>
> system_wq is deprecated and triggers a runtime warning:
>
>         [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Replace system() with system_percpu() and system_dfl(), to match the
> previous behavior of the deprecated system() and convert doc examples
> and tests to system_dfl().
>
> system_unbound_wq is deprecated in the same way, in favor of
> system_dfl_wq. Since system_unbound() has no users, just remove it as
> well.
>
> Fixes: 64d8eae3f895 ("workqueue: Add warnings and fallback if system_{unb=
ound}_wq is used")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Happy to pick it up if workqueue is OK with it.

Cheers,
Miguel
