Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792582651;
	b=t8eGnxOPcqxxgPLRfFbcB3L7LY7n/sZo2phT2lBVf2kcoko6pH4XO9uarlox1yw1bZF+
	 jbsZgeTlNpMFnS4C7TIi2LPZ7BjG1RUDl1+D2uRVSHgRFvicd9Nr5Xstu+sCg21flJ6vq
	 bgxaEVxrv8BhMkftIx+1N4wFU68MRHwhH/Nh9c/G3qFqay2O0sxlBcKiXboEwEB7Sk1Kf
	 wP3p6CCeINijixUAWHuKJPFfN5bxWMHiH1z1SZjVT0eilnOFA4ppJUzIgt1WBRAm4H8D9
	 ySLLXHD0RCRaxCnmagEpaJIm4RcHrQBGHntcW6LWLCc1QPJZrzbGhbaXFbX2fJAGQQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L9TNqnfcFMmSJAaSkxyxoiwG4lEBGzzPIAP5LrLyRIg=;
	b=gfb+oWkXUYEm0GZGSG/BVfvMy0YnT674l3AmLsyWoJBx6L9n6ZDoCbEQLK2KkaQpCTKb
	 CzxtEvkjZrDzLWaQ9CRJqSZCxPaGbCRhkU8fQcaRpuHSytM3lY0kGc2bqoEfo8Y3RUUd3
	 EV27Y/NmkYSbNAALk4uo5So+YuEi+1Iz5Pn3TODF6mRW7Lwq0jslAHmZae53YEHJSAh45
	 QenGu7n90i217CXfqB1K5IUr0RrvVRt/xTKP44fwS3Vwzw519eKhMyzjcocdK4DIHO/Bc
	 iPOzWNFtcw4RolnmAbU7J7bhPVXHgkqGwA7gcapYNKtBjJBazDPOJfLHHNkK2P68R3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EEPgKWE4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F29C606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F29C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EEPgKWE4
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bb5afa736so70529eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792582650; cv=none;
        d=google.com; s=arc-20260327;
        b=QE6CSVAikTxOZQF0a4SAs8RaQkoMGRWxugM442K3Cw+dw9lKiMsJAxldXfJDpCVJ04
         b5aQL1//tiWYXNNuWtdD+kudBe8e45Mv7FAVScHV5m0c8VLS4hkpvMYc2XFRB2Qr3Yj4
         QxghgyNJuB0luhzcV7qQFP9IHM3yBUtW0hQeuMeiwH4OE/8lot8OpRsSV8NKk+WnyzMU
         DqmEwOzdceacF3ACKKPycVezVO9lb77b7rijf3ZWugJ51c8boo3oF6y8bL1DQf+LQ/R6
         qcpnns6w792TptsZMchu0tXZYiOleANQ76ImpccNBEkpK2aw1WEAjJ16v+0QLS2X/tle
         YBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L9TNqnfcFMmSJAaSkxyxoiwG4lEBGzzPIAP5LrLyRIg=;
        fh=D3YYtYq6+9/08vwv2JStPWLJAE5gOufLR6QVlXxF1Ww=;
        b=NhIDYY+U0EsP31o+xKAAMNW9B5RrIgUUAC5mdQQGrX/djmkVaGtFW9wa46nyhjeNWV
         1Dv7RYsp422E18QKr0LBTnDhl1j1ryEQL8fALLSJCyTwNHvRZJRLD7SAnlqtUCz5ytml
         RDhSLlS1pwt8bUoUDrylD++SbK4qrJE9HE+rV9Pt3/U7ZBOBYoUfT9VTVs79vSUGINHe
         wW9wmo7sdVApo3vypMaxVMioqB/MOYHz3bowy9zMRm2wl2ipxWQCT3OhKdWeZMMOMCjK
         ay7PUJ4/gv4/TbqA/N/uEljk8BqYOUskbWVVkC7eQpHCHl1yh4cDZPtWkCQfkQ9SP81v
         tp/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792582650; x=1793187450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9TNqnfcFMmSJAaSkxyxoiwG4lEBGzzPIAP5LrLyRIg=;
        b=EEPgKWE49OXEfBV1qqhluE9DKOaKPblxvuus40vGZgjvXSKuMcHmE4LR0dOyHSMid2
         SUUCJGGqETUOnicsgIobbdFX5G8hLBgdUai6ulyE8e5xcOkamEAGSO3lfmGzFzQBAv4P
         9t2WjI991wzGkny6dOXSInKrryjUkeqK1y+/zFvmlHGoJP7BmcSeurC+UrDEg8vKC6pk
         j9E/K50bLjLEQFRycsfpv4Ji1KCEmqVQrwCnrS9dHBV8sj+7AK2HYowQRfk1Uqv+L08U
         PnYC7gnl6rF71OeBzMPJaQgA3ra13bCkoLwQMZID2wFRRIgJphYXuqdHa2ONsJTIhDjE
         g4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582650; x=1793187450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9TNqnfcFMmSJAaSkxyxoiwG4lEBGzzPIAP5LrLyRIg=;
        b=sLT1S2u1Wc08ySgW6xEUTxjaZLb7HylBaO0DaluTMiEyKiJ5tZPTrj4qqKGwb0re3p
         O3lk989UatSAYtEdI8rjbnAOqy6A9uNgUXNwMFgJP4Tp/y4R09+lghEwXhgMy/u1Kd8g
         yvXsURhARMXnnhZ+86NBMigaWF1xZz9oGj/9YMU2GZkIFQhnfgGDO1cnFMW3Jszvjj2l
         zWjutYNavEskkNwhF///MghGtml12HNKzJjCQKPq8cvHTlrS0j8wYu84xOpUvD1U/7r/
         K+KYfDsFTpRX/TV8miQJFkQHwQa0gya+9ryC6JZ7jlAGCDeUDs1lMMQ7ZOMG4bhFR+OF
         LxPg==
X-Forwarded-Encrypted: i=1; AKwUvByvdudCv4Nbv2b6rgh9pwDyr2FGi71Z6+KdTWZcVMlhx+7x5cV4PROnJDpX3QgHkycbFt4cuuPsPbJPI4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUVkxrYRR/qL+oTgM+Ki7Ji1OlT+AXPeIAVd0qJDKFGdL6oTTF
	LQpnLl0HbLByiX3z0vJLtDfTN9dJ/m6rdsn5eXwxzbLJY2tNRC2K0cLy7G4kOef/WBBE2lqVKrI
	gd36bb7JvN8nX6rzPVb9J2oXB08/78j4=
X-Gm-Gg: AYBFou2A6o/brBCheTR+WUwAl1CakkkXu6PMW1ZkD0p+lxiwTJu/XcQAUA3+h8UhWZl
	O+vZrBFu0we8k15m9YBhFMXwwTNLVD1WxxzefQKqk3PSYLeUjCLbXxtMSpZPwuluMqrx40zwtXA
	/lBGhS0gKYVhbZ5C8XzEZAtY18phiPIyMdFdZrV6kgg4cBS9V3gXPZFKcDsdHX9RQmK2an7gUCa
	zklwwJ6NuesHcsJxvxKymXtPTVLNCn5YAkZ8IsaRxHX+m6F0DAEf1pCv1otmeuvbHM6HuVibTeL
	ZtlF/ttibm+qwE8z/EMYkD3dDcJYfrNtsCONirltGp9CK6sYCOfQfSMz9C4+5cLKp7WWqbv3VY7
	oR83lytSr+2pqF5AWyNWZEB9/oc6Zd+bTY9BAd1FhuVxSZVFmHeyUhkWEVuU7ZgtXPcpiYF3EZZ
	AXI72V57M5sg4F9/nADZV0qZYho5ba2rb3arnI63mvZhkiqIKhr1OF6nBXKU0Fzr9sD5/YsI6yZ
	o2Pumsd9AkNpqMg/uC1jc15hKYGkapPVwMO
X-Received: by 2002:a05:693c:821b:b0:368:2548:c08c with SMTP id
 5a478bee46e88-3682558082fmr823558eec.1.1792582649514; Wed, 21 Oct 2026
 04:37:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com>
 <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com> <athToIRyTjSB_jVg@google.com>
In-Reply-To: <athToIRyTjSB_jVg@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 Oct 2026 13:37:16 +0200
X-Gm-Features: AclHuK8_aYwJYOtfW9noTsKcimxOtxn3KEZMWBPUv5CixPzxJgOV79J2faUPU-g
Message-ID: <CANiq72nP1cXVOQp0xciGfBhZZfEfNP5hx8c+1ZPhXwrr=EOUGA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
To: Alice Ryhl <aliceryhl@google.com>
Cc: Deborah Brouwer <deborah.brouwer@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:54=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Miguel, is this something we can take through drm-rust-next? Or perhaps
> you want to take both through rust-next? Let me know what you prefer.

Both sounds reasonable, so whatever it is easier -- do you think there
will be lots of movement in the Tyr side?

Cheers,
Miguel
