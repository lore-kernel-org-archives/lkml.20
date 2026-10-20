Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492487;
	b=BAkQfjFAO4V4j1ir++ioOn1lL01VJPAzxpXxqKD8YJXPZP7YWFKzo8QJ8+Z/YRJVe6Av
	 0F1eYbdgAixQhF3MOe9zv3VcRpGpJozZ7rOL5rRpZRgLG2xbCuReqAxZH+PrKPtg+RHj4
	 Wmf2GWe5zWSyCVh2ZQro6ulzQmI/7r3nQ328UEssrLQ8F3ilqTORbynmNmiTFOjNi8qAj
	 S9PjO9nDI4P0CoqzkWzReSyGlfB6xNM2U0zy3tFU+lyaBBt4lVRaenJ3CHCftKAcq1Zr9
	 vJt1XcHOxoEAXgRt07uFNGDE3Xl2Jcyl9Ko9/ZE7Emez3sBdj5iqwybuXdARQxhq1bw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
	b=4lMVjlD9rYakSKzd5ls0SjcdClj63mKnAiZHbkua2FaNOBWZgZLMDR8fg/Ns90SnlPCx
	 EMeUxBsQmoNwaG08QQfgVMFfggzLgS49C8QEx/qdERAE90+5SXIxU5KF3P8Ml3tIGQZIC
	 fiSuNl9znzo+eOCaP5ic9PnxjToKozKipTSBy7+s4AvGQfklRuwB6osx1QcU2uWqI4shg
	 w3xk8P+mT7cmEO+zb0lqVKIT7NukBUiaIgOAMtWRsXEhUP/3kbpughEEJzY2msqyc6PLg
	 YB6pIQtUvsDy+CJBszFyUZFGZA8NOt0TppRwX3PwRNRmMxY6L7iDTfe6qpCwQxZjr1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC13606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC13606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-185fd3a4ca3so357178c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492486; cv=none;
        d=google.com; s=arc-20260327;
        b=JTY37KgGupvMEXyybgs2CmT0yKB3ZZgyOakRPV/reIiz8+6DT6eX/6WxLvOjzJcIsA
         6ThvRfPYNzzlM++mcqBM8bodp/qaHhSFPytka1m2knlGCevSUf32wUbD0P2IdW/1AEF2
         vX7ipOaWN1BQ3sK4ZQhR2msE0mmt6by2CgyzzgCj6o3vyGbXeN6wExj7Uy/4g9P23hEj
         g01Yy14zpqYQX6V/btWI5oNcK6O9OHg67/P5BmsWSPxzWGc6O0AEZqVLpUH/IG/e0PbD
         uuiTtSvwWYD7YeqOzM74oGNrC/eZM0AfAqoeO+CwBE0njMQu94MbvHoY1DbUKzqArIji
         8EOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        fh=XbF4YdGpNbvNVQ3FD7tpv4zXuznN9deAQ93gsUQUqN0=;
        b=JwB6BH/Qzb73WviqwqM9UzRTlSMIDwUvnTpTKRTwJJxF9g6t/W8WJiU11Vz34oViYv
         L/mPXzPnQ3RoX3buSKQb8+KrR4e8o3ICyDD6TuZbd/8QEm6R2fwMEXkp12PK7nkRa560
         0OQSIJ9bI9325PLEfeeg7g5CJlfeCGwvw92DzWC9FL4b9O34e2ohppKUtMOcyttSqdx2
         9PWokcQJMkhcOF9aFBiTQC8w3NSzXnekqIV+1v9qRTYQlwoLJPYWNVRbPl5TomW5z/V3
         uL9nLZn7RO/bCDLyRqj+0Zb+D2gDTHR6IljlSKVcpWJ/35HgALpGGU7BnfsrER/gKRld
         bFCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792492486; x=1793097286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=cI4IJybIWAFbUhFgiqBGwhfqjgpLGre5R3ot79Ke3zI83Rv8hsE7zK5rQQywe4d1ep
         r23usjXDN6ONg5MR+VjsdgsKNHxDDg0RrsGtvGgLLY7pBHRzQC8h3/H7kxTnExzE6Qmo
         QpZbMR5D5TDURKfX9iAKFDKoEOuHC/IePb6qiP33yxaGOZL4qmuyU3HaaGQSjnc/0vAN
         VhzGtkVCEK9aZxDzOsE877SK4MI9vgdKQQaC/5Oj8b/f1ETaawk5swZ6s8fSIdJzKSFn
         lbaG7dr3LzHW2i+qbB5nZmgclId/Y+2MInJaqBdwT014/GtR7t3ednJvS8omieNK8REW
         ob7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492486; x=1793097286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=A5MIaVkiWIo9cvOLqFqUKk0gaH6I6l+pa4NLqWpwY0Fr0fO2LkaiUz10U2I7cIKDYc
         w+L2l7fjnzr41zUr1Z5BuVdb3ZW6FwvI4/VEJh862tLAheJZ+lA6ofKRqIjPKNL4tQhm
         MHs3quAzJ0rKPsNGLjCCLmXi/r6i1xGYX0mPBqeVOxY3sK8LRxfe4Bk7raS8QkHVoOme
         OhwjwKVUnm8YFuUXaVdVIJNNz3ES7rzIqrnVHhhp3/ZaSsId9a+xjzw8+yI34XLcSU7U
         uGATjjAKXkw0fS8GnGZuB6bZzVXRxppUhWyweCALa1f0QjkMaewwv5cKALypltl+dVPE
         FdeQ==
X-Forwarded-Encrypted: i=1; AKwUvBznrAGROQOVUM+/nKnZVN5kr4sWxkg75PPmdk49w+DxL8sHF7O0HUOVVK2w9jSAn9s9vwWB6AHqTh55Uu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgO4e0w2uiY8DBlnVggi5XYHbBXuWDWMcscpHMC+MJe1WNhr88
	RMrBl48K1StDlBFrVoj8vMgcMOzT19txKIpADVovFtL1E0jDsIv8flbylHj2/bMXUnHR9QZF+zY
	If8yA2vU3ZreJsoyFCbBulP43wtSPLUilXdrxDipS
X-Gm-Gg: AYBFou30bJq+uwnC/V1LW+/3kNxD2O+HOHpKHIgN8hr0vJOKggb5f+0l8wLSzd76QUZ
	w2FBkbb/q76pCfapAJ7hbXqov6bkQXzwayu44eu53oF1IqZKed7m6hEo6l8esyjK65StaWlvSfX
	YFcDxpa5dqEGYFUOPjwYFUquiEohrOqy7nQY8na3LEw/RVSjIqs2eTxVjBBi5p6QFsRPurJED4n
	jm1YVl7EPd7VVOPoOJvK5R/RloP46hDahPhgv3Psup7EqeFgyS6sS8h3ho2moqOPDIFuScBCNDx
	W6qSlsm4gMoYZhqKqcy2ecQ+U7ksyCmIX9cZdy1fOqVY0GHoD6IGrYJU70ODEca+P66+qs3YLdo
	kt8axRZcAPkC1+DmR9qXzeg==
X-Received: by 2002:a05:701b:4657:b0:183:bebb:e93b with SMTP id
 a92af1059eb24-1850d3705c0mr13844857c88.6.1792492484834; Tue, 20 Oct 2026
 03:34:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com> <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
In-Reply-To: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 12:34:07 +0200
X-Gm-Features: AclHuK9vxwrK8NaLvu2ec0o5N9md4lXO8zMypsPDxXbgQlLlX57bi1hqfmPPF_I
Message-ID: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 at 12:27, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Which tree should this go through? The Rust tree? Probably too late
> > for this cycle.
>
> I think you send KCSAN PRs, so I thought you would use that, thus the
> Acked-bys (I suspect others thought the same). But the Rust or Kbuild
> trees are also a possibility, yeah.

Happy to take it - but in the interest of avoiding conflicts, thought
it might be better suited for the Rust (or Kbuild trees).

> In any case, at least for Kbuild and Rust, the PRs were already sent
> (and, generally speaking, I would have expected a patch like this to
> be in the list for longer anyway).

Needs some -next time, too.

If I don't hear otherwise, I'll pick it up later this week / next week.

Thanks,
-- Marco
