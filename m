Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E017043DA5E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084203; cv=none; b=IeD/s9QcoVkqdK6er9SauYkib09idUnMzmyslLELLXHWC43xMtOcW/dZpZJ4JalqndByCX49nnPln2jlVdZoQWcEFC8aUqEKIASL8SJLYLo3vD1clKRkRO+UVCHNKD6TnkPX4m5ThOwzOBVtkdx6d13pCFveV5GLiOfEqbrLydY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084203; c=relaxed/simple;
	bh=CYx87CEfR4uqo0EdKxZaeNEoOSY8JEECADRirN2DhDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SBfUcebSsKUenCuqFYojhEKJdKhcQZxEfBOwN5vmQflwTvOrliKLGt0bc88anuLi43kk9nKXp59Hkgcwh/C4lUQd25BETsm7gw/IbY3CM8WjmPVD22Xidtcvc5Jg6f4lPaOJ9Z97MnCyt4EwBqWFcDuPEKu9YF7GN9gZWIaQ6O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F13fU5Rv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B7MUDIU4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F13fU5Rv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="B7MUDIU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790084200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MDXjlNk0ngo/R8fuvqVhboxL4miIeE6je51J88+F1rQ=;
	b=F13fU5RvInzl9BhyO/uyhbtRJwEuX8PL28CL4IljNMg0IDj8sFcqX+K9PbMcr/zU1mqoSf
	ez6DtpB9uhfuwprprSQGogXoIitPBYbuQ6AUAa88ma1lbLOT8+2FG0qJjIm5MAWEvZ4Sld
	YpoGrlyfafUXQ9eaZMWwIXvxWTuGlfA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-UMNb9lAcMl2MfGjTjph5Lw-1; Tue, 22 Sep 2026 09:36:39 -0400
X-MC-Unique: UMNb9lAcMl2MfGjTjph5Lw-1
X-Mimecast-MFC-AGG-ID: UMNb9lAcMl2MfGjTjph5Lw_1790084198
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c29bc25836fso481477366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790084198; x=1790688998; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MDXjlNk0ngo/R8fuvqVhboxL4miIeE6je51J88+F1rQ=;
        b=B7MUDIU4oQUe29BhwmkRxaym59m1N1uuebtWHcUBEsTw+v+UeDLH6vah6mzAmyuaFQ
         Biaio2zFSqXm6x7hv/NyuaB+kABqosTamygxgZEG2S7fxIiI/kM2aJlpakYa2Z1Olyp1
         6dbpM6sMMIBdzrN0TS9u4X+z181huLofW0vy0U5hx5/h3/ZHwodjP+NYn/riCRzceDTx
         zMiRYrMzKY3HaEknO2Z+VyRd/5yiDyjeXVDXi5nWuZk9GJN/RYGkpR9MgKmGgOxqKDcd
         vU4l33CMyF5xiH0OsfFazOHamKAfYrIW/gAx4cgR+AlmJkf5UdQKmrxPnLR88ZUc/33l
         h4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084198; x=1790688998;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MDXjlNk0ngo/R8fuvqVhboxL4miIeE6je51J88+F1rQ=;
        b=0c+qAZqK7pX7ljbLKIu2PWD9rbuyjCeml0tfbpRL+jLKf1VfR3dW0uoBySwEBr7ng2
         VcSlVtSFxZX8vOi0VSRrMuwABr6sW48vuHiBxwBsiYab11Qx6YosAVTjPIb03zxtCXtk
         ChPmlJhmzVGbyUHAIpp2bXDcDFgKqc7DlEN73Q4L/EUUWQEKupW/VCfia5xwd+Cn7zok
         CmjsFbu/tOTmRs7F289GEXFMyHXDEwIk/GBb/9/timGEfFX1OjJTALHhoNrQW7t8IvDI
         TOresFZ+WoxDoKv9RXpmOA+UU871czOYyTpptCk23OIr7w21hdlyU3us6dURunltbWBg
         ZCDw==
X-Forwarded-Encrypted: i=1; AKwUvBxa7ejvVOCdGzGWbhWQKvPDgkKTC/Pw+6ygg3JSa2vHvRKVt5uEuudEvris9VsIW1pjLyiVHwqq2Z7Gtyc=@vger.kernel.org
X-Gm-Message-State: AFuF++kQgnd8C+HsC8wX/58aLj4kFU0Y5a7v5uf+DpDLAXVKYybX5DHL
	UwfNJFlNJTBn8Ouv94sVVD15LWZXkSYhQ3oOMP0QDl+6ttwuL2Jwao0X6NtQB/QnGmHvF4pM8E1
	GPvFB8UaGrUknlG22DMNsfWx3jYwexn6E273FlPl2ujnncdSN2K9g+Jqxjgrzx+6luw==
X-Gm-Gg: AYBFou33FZQjvu0YlanviGV/fsXo8qWGz/L/1QG0n3wC35p3/DkN1cK9cgqWr12Mod8
	PPE23bT4ZJt2YxiEqYBtY0aJpQp954QfzfcpQt7GUVIwb3W6aVH3giq6o2rkdYppvvdDkE+0f1q
	zwJCZrbLS5XniYGD9pRnArmBHoUsQFFAWE4OuAW8NPZ/U+D6mgmCyOsDbmHQJc2WUt+BnJQOg4w
	PDlgh/SGpTmINVrZz+zedFbDjjjRt2bg+bE/qIlcFq/f4AFCnDH+SHQEcK/ewTIanUiqI7bZBEn
	DwjcC09wzFRwZxbi6a2F9zbGCY6j25YZOrtj2LTOXbzr6ns6HnZy1AW3GmmxBDBuji98IKDbhPj
	7TWH8zLrZS9IcNqiDqNDa+8OrrhUDs/XGLhE/Ml16VQSfxe27lQSqnedOsTZ/HHIqM5W94G6E+w
	==
X-Received: by 2002:a17:907:3c8f:b0:c20:af9d:4533 with SMTP id a640c23a62f3a-c2a15896523mr1137714266b.19.1790084198434;
        Tue, 22 Sep 2026 06:36:38 -0700 (PDT)
X-Received: by 2002:a17:907:3c8f:b0:c20:af9d:4533 with SMTP id a640c23a62f3a-c2a15896523mr1137712266b.19.1790084198030;
        Tue, 22 Sep 2026 06:36:38 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c62555fsm86995266b.53.2026.09.22.06.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:36:37 -0700 (PDT)
Message-ID: <164304b3-3324-45f1-8766-536767e7b9d7@redhat.com>
Date: Tue, 22 Sep 2026 15:36:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] rust: net: netlink: validate attribute length
 before casting to `c_int`
To: Sagar Taunk <sagartaunk@proton.me>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Matthew Maurer <mmaurer@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn
 <andrew@lunn.ch>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260918100016.100988-1-sagartaunk@proton.me>
 <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 04:31, Sagar Taunk wrote:
> Hello, are there any updates for this?
> 
> Also, I wanted to ask is it fine if I keep fixing stuff pointed out by sashiko for now ? (I.e pre-existing issues pointed out by it in other's patches or should I ask the original authors of it first ?)
Does not apply cleanly to net. Since a repost is needed, you must
also avoid empty lines in the tag area (i.e. after the fixes tag).

WRT sashiko-reported issues, beyond be aware of false-positives,
generally speaking net-next is the preferred target tree (i.e. no
or very limited impact, very old issue, etc...) with no fixes tag.

Focusing on high stakes changes would be appreciated.

/P

