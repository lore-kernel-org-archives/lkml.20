Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49768485937
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807743; cv=pass; b=JDmWtevAFYTaauTwiQ39KV3cFMC3kQ+n/NIObAd8Ik6hh6BlpeHDiYPnPwaerw/+tDsLkbJxnzushJyzNcHZ85FeixrQGIpkBi/q9K6TEIXs6u8GsL04agukBAKhM4ZPo1wDPnZMa3/D338ntE6jG3gPfG2kOoLmjira1C0JuR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807743; c=relaxed/simple;
	bh=W0/B6G2xceZ/TEBz6rYStoJyGubm7Za/8bijy2O6/uQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlepOFXKZbw+QqHQro5CwXgwDmHXNxP3fIc6hBRZ5KJtkIhK5rumhsaKKm4uetQntwdsv/J3XP099kRaz4RYDiRGzlB1VQe8uCwgdONupfh+Wp7WxRJ3M38PUg9MgbGz54KuBXXSuQeDC4aJuCGy8PwSkigbdRhMCZZ9T9nxnpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixe4Q0Xt; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixe4Q0Xt"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33c30fcf33fso239760eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791807740; cv=none;
        d=google.com; s=arc-20260327;
        b=XoaBVblgELvUb0Ujj1eCSc1/jFDYSij62NctMzwFF0x63Fmz5q9CoQSatBJ3fjgony
         mQzU5CULiz5Ur3lOcPLsF6WJnWWigyB9RpNaCkJ8XakmWIQz+GoEmuuo1IUj/bjIQ7ZB
         hXEhlraFJ1i9hl3fxBH+3FdUPnZPPXhcf4hqsZD5dNjo0JCLnkkHZvS59rjsYAfyPC1K
         4qBKi1NarMAK2lO0rznJ6AiiAdVwBt8td8PU40qyebKNlpvw7Mj90dltypTclX+jTrz/
         giHJJo+DW/3Omzk6clrJpfWf+C48wEpoQfuCiI/1SdcoXODAUgpTHHQtfT0uJytrlFLr
         T6Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W0/B6G2xceZ/TEBz6rYStoJyGubm7Za/8bijy2O6/uQ=;
        fh=ZEVIQJ0tR10bSoRHcfBS2Bw0uGsLxUS0C8x4PK0ym8M=;
        b=X6EM74o97ySdKXc4t/YxdW4eeLoyu8lkgcmht47CFi/HmIhaVIyRTGmpPj4VDb4q1i
         DszNTdqobMQ/AwwIb2IqgXkmcamiDC3wLdYO+wUKt2g6e4gZkdjXBwT9DYobfa4VoTdo
         3k5U4qIx8M9SRpcUPdjpkVnSKjayjSHhL86LEC82IM/EI7z/c3UQcYVAQggvorRQRADO
         Hm14E5VlvVXP+LEgNPBQJxqRaiN075i4Myh8FvngjHkeexAivcV9PXA9QxXuet3ZOASz
         ylnHwkxuV9V1dQEP32sV1QONTIOYOuNAOpkqDiWlAzXbzVG/+KsCJgYenpEQUv3FmGdM
         IvuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791807740; x=1792412540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0/B6G2xceZ/TEBz6rYStoJyGubm7Za/8bijy2O6/uQ=;
        b=Ixe4Q0XteuS/ZDj6nzR105B59owKRYEi9tU1pIPBR4fZaqn9sFJGpvnit+2GRZmJ2w
         h6jKEF+5VV3wI9H39XIXycHCOweGWgRlfEtoJIZi8wOKJHJapj46A2EiWTInogeK8LWt
         AUbFnRH/O+TdKU0sMkuoSavXFT/RWHi9cIIjfumQBzxF7xi85K3DLukaQKTwUpb9Q/2A
         jFRrkbiyasDRrxLpdQxsMkFmo2FB5h97zW5e0CCpxxT+b4A2RevLd7SDjh6JrDb7JjUA
         z0ViJFnL+PgetMb9JHeDma/6On2a81vYbBn9NirLWI58nw99oaam6Mjg3ocBP2ujscSx
         0QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807740; x=1792412540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0/B6G2xceZ/TEBz6rYStoJyGubm7Za/8bijy2O6/uQ=;
        b=vjlgklf3tGOiojAXIGKdAfm5VesNMIyNfgpRkVBjZMoWUxyonYUhuOvvYfP5ximump
         6EmHBxbLoOEMLd9skIBFF2kdYLCsMvO6gxKpWezt6HFATKAFzkFv7SAQa2bjguIBb81z
         wdGrJHVviLCUOa1jiXfNIPaTHuLAUGq8I3MR9ZpiBvMsVofOyM45HndUJoZIWIm1Mh8R
         L4G/WyVwRmSZl9TIoS2sj0mDB7/Mse1OvOUsTgLDhC1rT+BaMpZMWiR1+VfkA7V6QQXu
         A2x9dbcHLF0qZ70qhcA2eX+w5bs1s5SvF1lYXu59gGmLZkqTioAqEY92WDS0USvYcB8d
         yE7w==
X-Forwarded-Encrypted: i=1; AKwUvByUKSmXfTzDaZFBPXmZsMcF1BEQlSG+DFzQGNY1A3ysliPt6Um6UMZ5SJWcGCNPDae96AXU3+Lid+PPric=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHrRM2Our8yeGFq+59dgPjWb43jGMB0l4L3e/0/JRVIPYnuDI7
	SzJ5nV8Pl042uXJduSt46/6IzkC/bWug4uaVHamHaYD0NZ38LcYNIXJFjNjQslvmxg9Fw2H6n73
	l3QTib69cnxRTvvWcv1yakKz7RzLpUjk=
X-Gm-Gg: AYBFou32xHQxX+DfdukB415YsBTKidLTrJDieEZ7O9uIaQGM5SGs5mhjVLv9EVGZFJx
	yYln5vNR5Lk9GobIBboP2F/b2qXoU826ihxwu4B620jRCmvB5l5p0NmqQQD89+67dKYhL7A0xU5
	2xNlFX7P1+gzSFKA7ssNgR4Ik0xwxliJLiMKrt2hHxO00oXNT8HgqqEz3U3tm3zHuX/OpLkmcy6
	wpGxWYJLJhQLZQMEVTltxw+dvoh7KVsRVEjFmx5LndRtxrbFaL3s05C2puvfxFK4/DuYaqWkVZk
	fzhCFvW6cZADpFt1GEIbbo/gFRGA8ajhrHHGUga2Qk8SPVOpt501c5tQOUClOcfK0Jwvtx5BRmY
	/lwIABDDI1fl62nYP0IDISNIirXBY290gjb8LhmIOKCZWYTEFoddDNVv4u5FBqFKwqeyWmvgc9d
	Gm/i5pJNgPP+A6KOFT6/uemXzEXM0nz/zjKcc9c6a6514ZT1pTscY=
X-Received: by 2002:a05:693c:8810:20b0:35b:cb5b:c71e with SMTP id
 5a478bee46e88-35bcb6b1c6cmr666843eec.1.1791807740051; Mon, 12 Oct 2026
 05:22:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-nonempty-slice-v1-0-37d1fecff82c@proton.me> <20261012-nonempty-slice-v1-2-37d1fecff82c@proton.me>
In-Reply-To: <20261012-nonempty-slice-v1-2-37d1fecff82c@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 14:22:06 +0200
X-Gm-Features: AclHuK_JfArOQC24q8bhqpYHyF8WB4LrV3JCNgqOFmRVvHpNftv_1MS-eocclDw
Message-ID: <CANiq72niDTiewxWGC=PTCoG1xeb6hVmeKT+5N8DDHV2bQdQ0Ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: uaccess: use NonEmpty in strcpy_into_buf()
To: Lorenzo Delgado <lnsdev@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:54=E2=80=AFPM Lorenzo Delgado <lnsdev@proton.me> =
wrote:
>
> Turn the buffer into a `NonEmpty<[u8]>` at the start instead. The

Hmm... I thought the idea was to request a `NonEmpty` in the signature.

Is it not possible for some reason?

Cheers,
Miguel
