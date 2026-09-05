Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E501E3403E7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636274; cv=pass; b=aa15ZJook/A6W+uVokm0CY2n4ToPbfNs2jBFD6/4sOSUqB0FCVdoyrfzv/cceWWxS9QAnI+lv1k+eI6Po3ax08LfMlCTTIWx4/IMKf10fufHwUhJwVcLcejGh41Pf1LymBz23SGWXhHraekn6cb0Am55g7Ozrb5avMiJDzsnmQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636274; c=relaxed/simple;
	bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3Lcs7S4MsiVRxVRojff+Fw1jSzr9UkKle9Ig5fS1qF/dSmJDK8DDklWC6pYd5Dd79V9VS+oguG3QIQ6teBOzas8Giey1iH1XGkdxQ1iHX5D2qNRR6dt/KdAjBsJGp3Y+GkkmELXtc7zzQ1xr71Qd7D03G1D93Lla05FnM/Kcls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E01k6EvM; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E01k6EvM"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2566so262525a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 12:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636272; cv=none;
        d=google.com; s=arc-20260327;
        b=aZ0+VTVoSim8DjDLJtqOB0tJWP8pUl0YlqWTi8Sly6zAKgVCn00XZ/SHpY/TQQn3P8
         HNyavyDmiW2BT6+cJa5YVA2L4MUgqY9fIltzqyXNguudE54Bl1MWbypN+NuRcsidOrMr
         yk0b5XlEW4lYKMzIHR69HbRfIRnEAf+Tt3Fz8Mntxzvtz79kW4pTUw2s92TFDhn2y/rM
         UsO6CLyiMSjr8Ov1KDOcLg/MbtkSsqw8YzKRVQ2EuoK6BiR3mTa295UWoGcOhkWfLrTI
         ZEsF/XhGfDGWDKaD8rmX0DGe8spakIulbicWw4BE+evOpuhh20F02vGRs74lYeoLLUXH
         bEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        fh=zeZcVFqjHY7ZH6dKeQJU80anQG1NQ2qoSLaQ9GM8WKc=;
        b=VkeDaxKTgEJZp25Q4ZKW4tbVo6B8u/duf7i6csbu/wuY8H1f0TdH9NSZxSJRpCNIP3
         +4FeRbDbaWwT/YzOWrHXfq86T6BfcD036VOj5yMGwPghsIYgBQd2MRyBEZdyabBF9rx3
         7k8L16YCLIZWYCWX4NZCRgTdyGSQYUxx8RTgpdwEFZNHKHv5/79qyX4KOBPNs0G0J7Y/
         7LzRlLavdgprqk1IpEPS7bgnQmB+BWsv/832n909sQEKrO5vpqW5eRSR788yDpg1yHeQ
         fFi9J+ffOHa81UvuO/WXKxr7CggOi/iRTrKo93FhWkIeNv6fIGzj+muB8o2Zedm/VA/1
         2pQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636272; x=1789241072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        b=E01k6EvMRCFlA72sItVAczr26BLEIdBhQ+4S7l9a9aoMpN4eHz834G1Frh49K6U39i
         P25Cc2UfV/I4XiAE0p5SqR3/CfWPC1wi9WTR20af6Qiqqtd11crr/2ZQSsOJ0DkSQNBT
         BmPhI6D36DGYJDm8SiwaD4BAkUKyEM1jppVyRkVJPKCir3j5o605evKGFaSrIVuGeMrY
         8aPgOsQKePUSw84U7ZeP6fx1lEIpCMp/xgAtYbGq0BJB+6pAeTLQpux1n1XevSKlA2c3
         rswB+w9JunYrXxbHlR2VzjM9Nt+d9hYB7sYqMfNt7DmB7tDyb5kNSYTD1nvNWR0Y6HUu
         GRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636272; x=1789241072;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlpeqXScrDkE5nbP6tp8g5wa9e/y0HMZle6PR6w1uuw=;
        b=AQHEjosvp73BQOwS2cbZjuK5mnIzq0L8Mp+tOkntGhcVVVsMzbTcK29uoRl8nTnGp6
         p5VHchGaYYWn8eaJ0OWDFCuqBWcIoI2CqcFv9bRnozpsjAMHSkaww3zsVsEft14Hpu39
         Z2jv8if6bBXV55j1uuz+jv9uT+XUKWMqkWTZdZCr7rZyYoOBYncuwzAmImg6pwy3e73F
         eK8NLKKRRLI5Fs5uTj1d/HwMRe+wasdbO63vlUWu8Sd7VzbmBCeo1TJAJ5ZQWEmbKjc/
         ebaaCG9ths02idoqCB2nxGppJBz1vZ9mkRd2Dr5yKzyQ2/5B037yBdY8l/k9RF8EpWOC
         l3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+GFuyVbe4b0T4qNlYS93+Ew/Tj/PyWNC6rNJn4CU3xkAUTpYDfS9a1Strtmhzset0eAtD9HcqZ2KhbHI=@vger.kernel.org
X-Gm-Message-State: AFuF++l8EaVY05PQuIPPJQTLm+aSDvwNBt7t7yYM4P7ja0/W4pa+fG8e
	zzG4VR6yDI82rrnuAaPUlcpa7t1V82U5YNNJoyk344DdWN/ANY90pHmXvCSbbVjQuZ9COEdupQB
	l88+nCbKNTKMdWE+f8GQF8FsvQA3MAE8=
X-Gm-Gg: AYBFou39qbuTPXtF9yNumhh808ceuBBRQ7Qg9voBFRilWfPZcYQpnJkQfRWCurxGdkP
	Au2hEWye92qNnuop9ZIQ2qW83p4SzFUldtXLzOn5XWJCUCWxOFmDkbH4CGSEPizqiaOzc3kL1+w
	I52putMYZt39QQ0sIgoUsTz0Fy4+m81NO02XCeXugz4yCjAfHb5vtGFhep+1kKAryYXJXdbgkXK
	os4si7Ld3H3qXl+sl8BL33+xOVw1XC+kvNOCD2Hd+dak9J2ipJJI7jchy2KAurGUZ+nNulKbYPP
	u8xK6muo/FIT/AWZRJPAby3PLdPCLjqRDOPOPRSQPl/L1gwj93IMtfQixTDcmM0yjlyjAs4Wer4
	ZNpeYeyQ7lEZKMXuoW2WuxNOspwO9YueNeoeEvC5M9x2Lam4r+2SD0st7aPRe
X-Received: by 2002:a17:902:ce90:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2db2776adbbmr63554785ad.2.1788636272311; Sat, 05 Sep 2026
 12:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net>
 <20260903192248.2248560-1-dakr@kernel.org> <DL5XG1N71CVV.TOAF6XQY0SW5@kernel.org>
In-Reply-To: <DL5XG1N71CVV.TOAF6XQY0SW5@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:24:19 +0200
X-Gm-Features: AcwNN1VrVIX1rn-ymHE6KZVlOZK2RCfm_y-i_dbObCbOpleHp8K2ryo0MaspaGI
Message-ID: <CANiq72m1ZxFtQjm4fUAt6Y1MFE=ww6jx+dEg3F4Bqbki=ndO=g@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] rust: io: support register projections and
 remove relative registers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 9:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Miguel, Boqun: Please let me know if you are fine with the two
> rust/kernel/mem.rs patches.

I see you fixed a few nits -- I pointed a few others in a couple replies.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

It is nice to get a slice of the future of the standard library a bit soone=
r :)

Thanks!

Cheers,
Miguel
