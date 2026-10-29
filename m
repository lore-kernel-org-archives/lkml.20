Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793288212;
	b=kQx8mcUStEeoSKvMguqRHuwwmR1Mk9pTYU8CWdgbBVpUiuGn9m1iHW3edf+WjX2ThPZ3
	 v18lbolPb4UTAshP2hlzy9xC1FYakXiwsQluD765r7/oXJUuVsf6ufmI0DHWLQHvn81PR
	 SgviKMSF5fCGNthi3TtIRBIH1RRHUZ4jxbA8yhIm1n1CagUS/iYBCw0CIhEt5tWv6XCgx
	 WBcRAf4TE1VK875sVfHh/fl8pvzkMdnajEuVUqFz2nGx3wEdh00vhfpeElGNnVhkPqoTM
	 /KO3eRDgQ6XbS4G7pqFZ33/mU5+WsPL8wL+MI866nRz23MVe+aLL73AZtU8Z7UkPIhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288212;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=D6UUa2xNPRVirPhujwvkv6IdDdVKe4P8N23+MP1pK9Y=;
	b=w+y6deVdpIHh8lvzBwlzEdm29J8USmqBu/EM/Av7ZrEV2NJcOIzwtxjwFQ/WJlGUl6YJ
	 JH5bc+DA+nJopOJyfBL/v7GVQzXVI9pFTB3lX/ysLocJEh2L6SLiNW2W+thcVHqllhn9/
	 Cbd0BlRERkZN2BrOvLplHrchq02+9GybxZUFHlFfHczOesNOrEQQsMm26sfyrenmj01Qf
	 hbANHb03r9awLjfr5mnbZ21QRUUG1uPZNVo/6xFidJ44YEMckWRkVUv+4ka2B5QCUN0I8
	 5UyCAQLqTclwzi6NhhfLkD5ojyMat0r40CZ9+Kdxu5vJhjvOOo5QDdrvvKspxlygTgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WL0ETLTn;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD00606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD00606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WL0ETLTn
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49953abe51fso17747695e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793288210; x=1793893010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D6UUa2xNPRVirPhujwvkv6IdDdVKe4P8N23+MP1pK9Y=;
        b=WL0ETLTnu+RzZ+rWl3gTcAoUIOf0QlWu+j8j8nR25Or4M20qZI8CSdNaSCMsp1Ys63
         Gsvfb0Ni1QbqZoSa9Zr9aHEXCtSRuwI+/IPSLi+CVBRongaCz9fH41a2rDGtFRkn+NiN
         JNP64rLiHGkJXNN2IaJ+6FFbnoQEwGz16NMaZDJxRcmIMIOmA6n0JDzTIJISwHbCe/Cz
         wgBnnW3c2lihE6wBFIDZMfRcu2tfZVk/85JjS1bn7MMLhwHqU5Uuq7+eivbJn3DijFRa
         IVga8pYchEeSis42dqRNBZDmCe7zCDVDTDXTALoIFpCmnvzzsoLJ/NaCKGBbcBDnnvUj
         wbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288210; x=1793893010;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6UUa2xNPRVirPhujwvkv6IdDdVKe4P8N23+MP1pK9Y=;
        b=ppkMSGNucE6ft/Onlflt0ZJnQhk1jfEhUebMvunyy8kdZwYzyMXOWc3OWOYv9mwqeo
         CcLvmab6t2RKYZ0d261XwpPlWV0qTI9Ph4nDc7B0hMT8qYXGqo5xk2KJnTz3K0AC69a6
         +yTLmDKoKEOcpzkD2yEMRtcSf1UTHUOi68z2l3MzBvHk6q4ju6tSj8qciobqL20utjiB
         QyIWgRSx3hYDssrfP+T9Jj2W6affDNYGBTvjrpLrVSUXrG4Vh8lhOLcxyb96REfPign4
         Po2dyCwSku9KpsipFwo0asW+yqTc1GzL88h1zYxkcjKS5sKw1O1yeYYHhbyh5avGWqgY
         082g==
X-Forwarded-Encrypted: i=1; AKwUvByPVjpjCNRDhNO/zsAQ1Ppv63810e41af/Wi/DUcyrDxfFo9zvWF9hxfYaImkDD094TDMctKmUqKtahQC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFu1Jqjf3yclY0fKy7pBsxgioWp6KAiVugd38NK2rZC43dhr/g
	zU7Ev+98ld4pK5foqz1g58HyUT6WvYycE1atF1jUOxSGoL5jAKNkjeH10gLBGoiVZjItBdbPKne
	0w0Z5cSkvHmE6OOi4fg==
X-Received: from wmap17.prod.google.com ([2002:a7b:cc91:0:b0:4a5:9877:cd58])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474f:b0:4a1:cd83:b23e with SMTP id 5b1f17b1804b1-4a97452869cmr133905495e9.0.1793288203757;
 Thu, 29 Oct 2026 08:36:43 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:36:42 +0000
In-Reply-To: <CAH5fLggAuPdmwOFiOMMRUCP+yLPjmdjYGGfBxZJ=7+bkGODJmQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
 <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
 <athToIRyTjSB_jVg@google.com> <CANiq72nP1cXVOQp0xciGfBhZZfEfNP5hx8c+1ZPhXwrr=EOUGA@mail.gmail.com>
 <CAH5fLggAuPdmwOFiOMMRUCP+yLPjmdjYGGfBxZJ=7+bkGODJmQ@mail.gmail.com>
Message-ID: <auNoCpPLYfr6hBu8@google.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 01:44:12PM +0200, Alice Ryhl wrote:
> On Wed, Oct 21, 2026 at 1:37=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Wed, Oct 21, 2026 at 7:54=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > Miguel, is this something we can take through drm-rust-next? Or perha=
ps
> > > you want to take both through rust-next? Let me know what you prefer.
> >
> > Both sounds reasonable, so whatever it is easier -- do you think there
> > will be lots of movement in the Tyr side?
>=20
> If we're able to land JobQueue soon, then yes, otherwise no. But I
> think we've aligned on how to get it merged at LPC, so probably yes.

It sounds like Deborah does have other changes that depend on this that
she'd like to land as well, so it'd be great if we could find a way to
land both once the merge window is over.

Alice
