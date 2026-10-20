Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792539543;
	b=N8XQtcM9pQqgd0Hf8kIgK/CiZILK6WLwTQ+X4o82X/t/f+uhOVtMu1URYJHXMd7P0MLJ
	 y9niGgitBtobkApwLV7lK0e3snVEE5fJryiD2K9KJU1IhiEONu+ZnvZHAb8tcL1TteX/0
	 XcbujVS19CHNRPcLjY7F4b2PG0NtiBTwzgiaM9eAnERyklna6mfbKA8NDgypGDb7HAcdH
	 UkxKW16Iwz46lnb2neDbwMg2VRqOGrsbb3yRd4p39iU45c7ZCchspvsRhSOOpPMdlWYF5
	 reuuB+P9zuNnnRLK8+4Lh6VoVuFF7yEdGgRBPRqdoPaqVHP7qhKsyNFzufCZ6yscbDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
	b=OiEpla6s+xEXm1ibo/KEO6Ox/INkF5Qsuo4NLHWm7erX6/z11TIyZeUB1zxmzY30OySo
	 BGLb/6QGdsZ0ebYWrUfRW3+v2rP2ahcaOoLFG1JkwqXHsp+1ZSyGrgRDIhE8aOQ+LDYp0
	 mxWeuNwKj5vEd94Fxp7eVZvPMDHxgR6bqe5UpeQrtcNzcybvTBWBBRUuCuEB9xK5h1rsq
	 SwbdZtRzV4GqRyi0u+4e3S3TR6A1kq3SuJe3aDqrEdHxJfZccEMCGdDY/pd1pmud8CQr9
	 i1uuhzJfB3N1W5e8Bao1+1gIy1yhg2erUES078MIpEXxWxnfr9uA2JS/3Izkf4v/Fbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bgzntr+m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1F8606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC1F8606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bgzntr+m
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-355724d032fso11203eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792539541; cv=none;
        d=google.com; s=arc-20260327;
        b=Zh2oEDIen8rLMrI/by4PvEw/s7pDKJNv7oM02OUHqn+ABb7FPAdhRZjWobYx3zE4U7
         0gNkyoN/+FW9OM7JY6A7LMx+UuHT+v6nirzWQ2ZJn1g2Gdi3LhJLRAQ1f1qolcB8Ab1g
         wfujc/0U6wqCkN0Pxzy71l+VMp4/tu+lq3hWNCM4nppkguKh6dQjPOMqexRQ956AaS8z
         9qRJEFzQXlpQAeUPXNb50Q3wcJoSO/UYGbsN2zVJSlu8pDeYiqvYy7OhS4v6tOBF2pUQ
         g7Eyc9Qz7tQO3qhCXQmPBteOOIaEZE3Rq2LEo+yem002Ymu2aGmBs7sJdo/V2Zrsmlua
         ts0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        fh=L2ICduXWOM43rCx+uWP7irYiHgYb9KdycA2OQGkMaIU=;
        b=W3hLynfJH3EM/1KzZA2FLWZgD2TfHsBuE9pNddxK9oZv8UOzHH4i+/DllTKA5xctWQ
         4T/LAYgB7UP6GGnzF/DaGzZIZmUO9dJbq6CI+U7j0TX6hfIKELRlGEf81CYW/Qyh3hPN
         o1+dSMF1Jo/Et+g4LfOnOXCcjfTS0LEHAzOOmzOGtrZtaH8ki69sri2clV4iL+Wosnlk
         zHFohsLBIMYmq7ovdZSi7gtNdixnwVx4qTt4h47ihJmUKCOuTE3WjxuqoMEqKzY/F4E5
         xtTPMxcIpMa9BTXYC2/zT5gwpDaRx8pdxkvCk3ODuwtoEfRiXklZpflqtSPU7TQLjvrw
         srwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792539541; x=1793144341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        b=Bgzntr+mTq/MYRdA0vDX01hYOFuHOkjfr+4ZTyvXjpCpqA6YQL8OesCpTivlbCO3M5
         QLrNcPkQuu4f7nSljhd+EfMSskX1pDwzgDgpFbEb3F7gvSqx4xvsqhRAo2d9Z/VUlau+
         TQWiXzY3jhHLdmwdGYHb2lNYXe9tl5FVQNzlKuQL/RPEWmJDPxNx6Y7EEgecSXzniz5F
         6SBRogJ4XtbD2CxvQ+AswQLUubKAqNHdzT6OlKsgdzdOYAeiPusiU/XUA4PABalcp1Jd
         9nwfKUoXOgZdmty5Y3fbNMnj3f74JoMZbWWSmdjfJCvJ5kG5jlw8UguMEGYzTrNiOZRf
         lrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539541; x=1793144341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k877884f6bo0kF5Og+iuIz1jesf5GeJuYHSM9YhWG/o=;
        b=fhoj077hflybXo2xYiKThmHjMaWpfCJ5e5BKTuqIbM2e9/2BYFiXtWGTwiK7TpUIVA
         2ctq0BKAk4+uzAu1IIQUkfgXhU7VIQhe8vaCNPcNVEqz4R1XMuOz0TjHnlopWiRna6ZH
         2yfTwuTfqO+wd1AmbcKbH+2xzP7A7dhVcYkrkIG8xKx0P8FQmXYmQSXuwx/LIrERniaE
         E5ZVZezzcqD3r8MApmNJyewALB2vBsYsxYruNH9t5pYBAuP7ediA5rRDr0a0va96wDaf
         UA6qFpmmeQ8n8M0iTVKLMIc5vPnylOjKZsIqRHLK8LXU31kHvJqRcA9/FFEHDaJ8X01A
         itBg==
X-Forwarded-Encrypted: i=1; AKwUvBwyu+pdpgucKKXC1VnHblu7v9LmHGLw/i3xJH88uX7Mayp/cf/Q1O1/zUPOVy8x9aTBCzG/CE/jmdtbLFY=@vger.kernel.org
X-Gm-Message-State: AFq9FYILJFZByxCOs5tSUomoPn25lVamf2Cg+S44dz+XYvt3A1uNoxmr
	ZPUmvtEDGdVinHR5d9mNsOaddU5VijhTt2T9fTVb+cl4OPu+Z83sCxez9GWDsZFulrwbYtB766H
	wDze/R17sxS6nTcQJWDCZ5fana7z1g8o=
X-Gm-Gg: AYBFou1UhLDnNnbL8ZrIwTswNJFN+IrruycnJ4jZxDAA8iP23yR9b0jEh/MrxLG75UV
	WETpYFPzHz2lHzsHUaXILDUZNSzwyCqK9cJ56rBF8xTfXPfvTQZ89GJhKqIkuX8cB2AIxHQ8FnS
	2+MWW22BOEaikN/GMEoOfMrxToucPDvGxyZNTO5+qNiJBl0DyHHPfQH88sNHZ5qCsPsIZOrKM3/
	SSz6Q0sAURNKYVV1+2ghVM83Tc/Bz8SMPFMQn9WUO5hkN5Ux6rqaA0B3DkEn/4xlwXBTGiTEggn
	KEeIU6/4UCdDj0muF5BxJp31CImO26O25E90UdDWi8LBys/z1TEkdtoAl+XukdGPbmcwhj1Rb8q
	kt2ybR1hm2yLUiRczDcjoo/TCeG0YpdyijgneFbzZYQAb5I8ZxyYk0T2EMwCd6RB8tiNB+UQ/nf
	uvFLriJ30VqISZCCcZ/1nvl3WdfhYcYMAJxTIcT6/fIByx4R23YeXQ/xhVfm9bWg==
X-Received: by 2002:a05:7301:6192:20b0:33e:6714:3945 with SMTP id
 5a478bee46e88-3674c43a7dfmr1490822eec.2.1792539541506; Tue, 20 Oct 2026
 16:39:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
In-Reply-To: <20261014-rust-workqueue-system-fix-v2-1-c018b8f870f9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 01:38:47 +0200
X-Gm-Features: AclHuK9F_7aaAg0X585zfZoDOcg5-Ci0Oo6j4hvWMoH5Rdsf4VtUyCtDgPceqfs
Message-ID: <CANiq72kACdJ+yaKd81TxnQTfYoc1drNMxv-4pdWMty8dSkwxyw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
