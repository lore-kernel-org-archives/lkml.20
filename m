Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794298560;
	b=IVulUcWaVAgEU5ZcJYldsxO4OMbNwpWC+OdECK+o2eqohdIaM3nHHf/Zwdw4i1HBiLD9
	 WTTl/TpaDVY02sV8/Oz+5qoqf91Y6HX13ISqha+F/tBms/CwAIKud/kLb23coKqjxcsYu
	 jNjLJiPOmxmb7ljhdv6TgL9Okb7ALLRBLEClTBFl+NrxONe9AZTBbxBIe1FdG5ETeZoVu
	 Zt3UnRqoemoQLNsgQ4p0mSCENalNJRel2F1iRHoHfuV5ucq392wbWRWu0DV0LwbZ/5JfP
	 L8ZV/74+gNnne1zJhcFy5Kb10EQX3S9Fk/xwjB0KHqu4yrdQ1BNgYZyliVv1L7QwF/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/Xc0/rpdCy7AH8vJ8uevr6qJbvz6HEgRC2sFXRCHrFQ=;
	b=UIO3Z+NnWSTSygwo/aZWrtzLzGn9haPG6GrrVY7xUNMADRsjduxWqWuMS5EAz+oeh2Sv
	 nMJMLCNIlxcbnxjHdxHOnxkN8kro7M4Ih2sViakv6bbVG/wcIz3HYlb9TtM5QyUxKPLTV
	 frDrSCkwKfJCjjndsV/45SwxWQKvj8hHEAOcl3dv3WQU7w2CP9FlEEtAK3LiZERkEoPYF
	 vDrRRqa0QFUBj5HVAaowpHudeFuvJ56G5rnF2ZHpH+3ghyGIPv0Z5FetFj/sQN+SiYHBt
	 vjtJ3jvr56cHn0WgQGVWr1JgwOvXRXnMaOZ2JVKyqk0AeqLwy7dJHlOXNuHX1/mYpFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGZBNpRJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95C4606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A95C4606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGZBNpRJ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3719e3cb82bso204638eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794298559; cv=none;
        d=google.com; s=arc-20260327;
        b=afZiqxrb8cdI7n83Qft4xSuXPvSIZOExmjHpeEj6wHF3pGnpyefIXd+Nu9WLcGupeU
         3R4FkX7AwLXh8iM8Vv3iPHZDM4L57y6uRlbwhfAmtdxWFcD/mMNmcrjhZsKq7RovpCnt
         anUCR9dJtBIEDjhw6gHs8iC4PIdkNR1dSNHMp3kN+QB20eqmnW0hvNH1QNshEGANTa8M
         9ksZ81lsi1I3uFyDFx1Ck/tAY5N1LAB+D8RHY6mjgtOWYY4nMAW8b1+LncIw3Vsdb+jQ
         F2qJjKlihHIU8pKVTyoGxrZTPE9ZRCM27VFHtti/eB3EeiVpUtrz+GqCP9Qa+ND+xm3Q
         CkJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Xc0/rpdCy7AH8vJ8uevr6qJbvz6HEgRC2sFXRCHrFQ=;
        fh=oRgPw2uxrEKB6H1e6U3lKRcOXgWzCbB1cLkYxtCReSk=;
        b=GMpsQQnqzBYB/4FCOm5YcK1gY++Hw2Yy0pMtbU6vl0UoW9f6MfDMF10ZUbhuJXgXuV
         bUY//MJddzQattWBbWuXJ32WpBTMoh+NZiVpiZU9M7sKDs6MOn4l60i4i6+nsErap2LN
         UJQARwZNNjo61DcZ1u2wAQgIv4oBK5zr4TQ/GSaYtMe6BtZLCegdkyVmVs554sHHtlSZ
         HOdMNzeZBaxFg7pTDotjY1Fsx4/LfxuvQHJQKAYH3jQGuDpjZ++YP5Uzu3UH7cX60T92
         0Y0Rk5pncdUc+87oWDk9bcn4iSvmYXk7fxqF5AiKl5ZiemnP7bpL5Xa7HRa4id7UaiBK
         zUxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298559; x=1794903359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Xc0/rpdCy7AH8vJ8uevr6qJbvz6HEgRC2sFXRCHrFQ=;
        b=XGZBNpRJY0jnuBeXNYz1U5VVLyNMRnRa+ymN1HRDOHkdOd4JQMS2+5zKie4z3n+xvJ
         giq++xKICcPpaxiWd+sCEITYNYsvyR+bX/47Tu5dg+wniCBN6SJuQN5Lvga/5WNRd8Us
         nsuJv/7ihZQhKNuTd5lPJHKnVRa9e+DfTefIjR2+fTaTv3vaC6bEmwyebZOyIvrruLcx
         PyqY4yzIdMCw2ZFV6iaetg9QwFUCQW0YPUmX9s8493bV2eWB+4rLJ0zRXOxA/smA++8Y
         I3w7PolkN7v872su7CSmf83BaIl3jJwgguHTFQuy2n9kLt4Rf1t6T4S2XOxq0U4Sb6Au
         6rsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298559; x=1794903359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Xc0/rpdCy7AH8vJ8uevr6qJbvz6HEgRC2sFXRCHrFQ=;
        b=2ImW3FQS+UHFzNsWXakv1ZWrXoEiX9j33zPaE5gnKBS4wgviWexXKQDmfQiKe7xyY6
         /tbzUKvC3RhuLXqLNOeJr6NTazIX8/0eyv7UOgmqv3Ml5e2/4NGVRmfwGnZvMfs1Oat9
         DzkQYSOc1H4ZZjNYHAdhOWocTAJt7hN+p+zpYT+65ZTUw04jVANLjcBFD2LJfUx9icEV
         vvmrrPEAXvJv2UUt5YuH636hk5+a3qtzj8k3HsWqTYFBDscaHtIS6JK2pCnta7oo7THU
         JSQm5HZfXTqq21mPGm/yruH3keFXbNbTZcFCqf939OEFJYegRNcCHrfFA/H587lq6mpd
         TDhQ==
X-Forwarded-Encrypted: i=1; AL+hErGYgBHKKN2jmvU7eoWyDkwyrgRxmK/jATMKKQrBmLOrcC4hNOxItH0TKBNrErXf0LT/68cixgnjtXZ+A18=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uZ+tHf3o3/PBmVR8wQB/iFgQ+s7at1LXRkg9bBzs0AnkVxnBA
	wNXV6TeHpokq1mIKklqHCVOOCi2BG6zyHqZ2TmQKF+2HOLGO3Aj612//A5vA691gb4tzKRHJwcE
	MipjoqCJLog06C2U28pJGu7c7UEMse5I=
X-Gm-Gg: AYBFou3ahJS/Cn7x48tGTE+MVrkeNyK4hVRdJia2S+odEFugr3RB9xsRWcp3aoMwsKJ
	nn159Owor8R+c9mteT0wDUbVyX7eLTX6NxJpo77+jS2QiEZ5xSOOZN2Kipw2d1mGamTmAVCCv/P
	WgqdLJszT3GAt3yCfG9YzxrAYz5+3enmoLygcpRw1GfkvAzMGuHB1ipkGpdQEvlaFae/LRQOYvq
	V+Vxo8uRG6LHLfsLWnoRMnV6Bv1dNYFBcqNY4uXR8evhEh3GhIXsB1i1q/QALIDOkR4MkgS3nYi
	wtVsb5BgvvcfyqtTYA1rV13+dWOyOe5K20TQbCTCeHuOXZUYFqtU5exgeN5oXepWp3maZMOjBh2
	j83KPLGYhPIQY5U4NS8VZmTaFdxG0EpEdgPJOGJJhujnTcePpXdXqVZf1ETyoxMF1JIXb4xl0ir
	ciovfYiiCfWjSZX8gsKcA5RcVFiLDmLbiHp0EPU/4588WM+KlSFvCU5WK+s+PyWFHcJ4rG3OTlE
	pMplQEzuIaoyZVOavGhJIA0AFgKK+wkS58=
X-Received: by 2002:a05:693c:6089:b0:35f:ea17:d171 with SMTP id
 5a478bee46e88-3751e99321fmr4325717eec.2.1794298558497; Tue, 10 Nov 2026
 00:15:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org>
 <I_BPRv0XwpoRCf2AG4Ot12JnHyqvdM9lb_wF0sZMixc0UIoaBb-aeNWYuff1oe4_X1m5SpCTcZp9woOg-dt9Eg==@protonmail.internalid>
 <20261104.180854.547774168466136920.tomo@flapping.org> <8733tgnc41.fsf@t14s.mail-host-address-is-not-set>
 <20261110.075758.247487148810717068.tomo@flapping.org> <87se19qgeu.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87se19qgeu.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 09:15:46 +0100
X-Gm-Features: AclHuK_MI8rOthbRv1i5nWdpIAxbnLDNEYvOPfNdpenBYaVTmaGUwNiPwQARWQA
Message-ID: <CANiq72m4YdDbmE=M=mu=2g3pUzSXn-JRQ27TcyVhAOAwCyyJdA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: implement `Display` for `Delta`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <tomo@flapping.org>, fujita.tomonori@gmail.com, frederic@kernel.org, 
	lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, boqun@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:07=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Good idea, I suggest you submit a patch, then general discussion can
> happen in that thread.

Yes, please!

Cheers,
Miguel
