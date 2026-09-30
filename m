Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1A72AEEB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768315; cv=pass; b=Mvn39Tz2SeEkyDxq8a4dtF9NJmUzEd/X529chRkoHvtj1ZQT583AQsEkLHBG5y47d1itKNT48aiASDiF7xNiJMPEmCksAAgdXQ3Q2t5vD45F1iUJtJxh0cxoMUQnKDo+rIVK+HMdufQ3LyfJ0h4mQZLn/K3KjvTYUXMtyyrVjoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768315; c=relaxed/simple;
	bh=X0bCALbQBm7mhZDD17KyTmJnIcmS0A8KGlD2Hez6zVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RX3RdrT1cKmyqs6YaBBMxC4qeWwmi/sQkY0aDG5n1BUb6cgmV1BAxYTVfVaP4Fd+J7S26yIQanHHe8oAn6MbfdaFO8APOSIQ8Kn4ZHm+LPXg/QC9Bop+oD9nCjuwuyX6Y9NgHxr1h8+2g5wrvrrgwp5Dl4NkVxcXgFggxnGWE8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltshOoYC; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltshOoYC"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343bdca7590so210437eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768313; cv=none;
        d=google.com; s=arc-20260327;
        b=e/GZqccstlI79+lYhsrO/uf5YgyiDzoN8NlB1AyXl0RDc5CKJaHfABw5+pWXJ6fxdd
         SIEui6Zv6lrU0bz0X91TAj+ZhTyhyNBMlVO+0jx3uMr6mh7alv6NsHFtUtZCXv18sPES
         RpINApJF8tOUbf0WGrCh2aG8816zkrauphv6LxLMlvxNBlqUQBveCt2UJ6kGcfXvxT95
         7+XYMq9cOQQ+/FCr/7GkKrU9zY9PbkNpVAmSN5gTXVrzt2G+0V6GIUqvfjG9YI1vUDk8
         tmZhTM6yQ0ux4Ny1+BjqKjcxVUfrJccbJQ9+6cwbPzegoE99s6APHLNopb9tBTwIYueV
         24Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X0bCALbQBm7mhZDD17KyTmJnIcmS0A8KGlD2Hez6zVk=;
        fh=sTBL/+WFNgbLY4pxmfITl2zQzYCYzXfUVjbfTdnoVVM=;
        b=nPrZnJEt2vtUOMlQo3f/xz6/r74pSQ0Cs448CN7G0BAW7U8skbRyDgTcHmqbC5f4YD
         hl3SNTteN0yGM7zwUbC8KvIjEC/4ZMfclfna8np3UMNcM+Mc6ax8ZoVj/btG7gaJEtqm
         Gjn6Ozm0tJMA9N53HchSdTyw4QJh3EzlD8fLD6zCMOozftq0Xhc3yHlojOBFk7DWEpMs
         b81w/2pINvjXrh9fg4enO75BWijnFh14gOIsYAzNw1ctA+GqPi+4PeGsdz2emKmssMBr
         k8GSgJUgVBVxKWT+5AfHfs8A95S8wtyVCnGj6KwkUmPeOi/KR+SKZzkenoeFWaGkK8wm
         mDsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768313; x=1791373113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0bCALbQBm7mhZDD17KyTmJnIcmS0A8KGlD2Hez6zVk=;
        b=ltshOoYCGT9kRU77iyofClFYwAIhur7nJXrBtp9CSfwU1oS2TMtriAydI4cOPxc4Tu
         uaAVol+EH8orEBpcE2RbA/LM1ft9KOKyFlzT4wzpZ+aqOpkd5TnUObWKuwPW6HNEg513
         Pz+OIYwThqWy62vK/s8hwckp2nPIwnwI2NHR808IpsGYKXBeV6+qeMClW0QyvdkmNgFo
         MsCXJpbZnTfRDR8AHuWVccL2HnehHNE/bdpxG+rGARzOcD7oWXbDWGspv9x9dm2qUse7
         59eA8J0yojn6jNkKevNdB2j9m2vEeKfDUL9EY2PcciZOCivYntgbXs+FufGFgi+kKp4U
         pl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768313; x=1791373113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0bCALbQBm7mhZDD17KyTmJnIcmS0A8KGlD2Hez6zVk=;
        b=As0OpKC2+U8XlkddG5/1QH2y/VnwRvFBinNKnh9Ht5+A0pQ301tjrwcT2/mYM/CB0w
         ByEiDZwzS6a0rPo98Z7BhPqgqmSOTZ0n3vwmX8F7pwsBoZCTV8opvkNJ0x1mMOVr39Z+
         MJO7Mvf7YkA8Hdvgp0doQfmVUAR0WJMXE2nBbWR0Rka40oSzLKJckatJk4XmoF1n7j6P
         XbpCB5Z8crjCDMcWhoxdXzjMlt3VbXDHA+bAZnrZuYkT+0MtQW8WiXOQFnp50PMH0BMC
         dQep//479RDZsPzO7WjyIUYCfkIyRmtIa+aSUAhMEGqXlIf/IpL1pwiO9P57TivDPu5f
         UQCQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7Uv6qaGIU28MufQC1hHWF8emM79d90OK4kETyPAk1TlmRxb27LKsQA1AjsfV6XeNpjr6lf+r3tQUmgzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ARanxaSfibBDRQzM+dIg6jiJSFYsB4gGkjzC3pFxhZSkB0kR
	BxB3wXHzw+G/9SWIuE0t5egAH+Re3ke7Ags4H2/MZ3hdKMzC4yuyqOQsjno3C9xhJPk5PT0NApS
	FBmDOsudnqJL5i8VQp2ZJzym+SCgMCr6d/5X5
X-Gm-Gg: AYBFou0qM8Ob/QYtpmbYV5sgfAJuA7Soy3Rs3JNyaEpn5/O5bGmbKZepcqHYFwOWPXD
	DExcYnfbFxCw9RPCMhBWnMaF66VA0hO5nX+QiNpbc35pQ0Asyh3mzEUlhgW/iIV9RBpYD0oOHCn
	DNRFaSlvspbj5hPA4f2MaoTOms0xydfU2DVJ9C97VIe5jZWeSah7XgGQ49VrWcLOywmsc3r5WZo
	84a8ccZytnBLMnaLqWeuVSx5VdTI0CSuEO7f6XUT776CRDjEkLWU0369xMLxBqpqKoHo4Ivq4ef
	ucc3oZkyhu9PYQH2TVR1w/I38amGzT7bLP0lZcFTuxxiWqhwl2q3Z02pqgrWsb09wdJlKCmqql7
	FiwpAAVwFyJAiQ7Ps76UJhrcDYi2UwyZ2xtMOmzi3KSMzWkexi+psnZ/GGoxX0MHskWEr1BoUl7
	wUXZg+gnNTlmPd2dbGLt/JSXDF1spsOHlCW+CDKXzmWXEsfXs++mw=
X-Received: by 2002:a05:693c:2808:b0:34c:3ae5:ebc with SMTP id
 5a478bee46e88-34cd60f8956mr2568944eec.0.1790768312870; Wed, 30 Sep 2026
 04:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org> <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set> <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 13:38:20 +0200
X-Gm-Features: AclHuK_SpyqhnK8AZ5BN-ONzwML8ISWuKW_9wFvKq7F9Mwfhhlcvp3yTpTzcxJE
Message-ID: <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:34=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> The helpers should go in cpu.c, that makes sense. Not sure why I put in
> a separate file, maybe cpu.c was not present when I sent v1.
>
> Do you mind moving the code when applying or do you want a new version?

I can do it.

@tip / Peter / Thomas: please shout if you wanted to take this patch instea=
d.

Cheers,
Miguel
