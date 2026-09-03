Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EB04AFE13
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442161; cv=pass; b=eu/ggC9mopMt3X12z2EGQoVmZpa7uKZSVaY7uwq1VIaarQZPByeBbRLMI5UqKdTkhAcziSIbfONr6QNfiB4ZbE6Ynpo3EZkuhtH4HhlZpVvo+s5n6yZz7xez61y13MxRvcnLT5Sbf2y8Cdhgl5CEukGyeRyI15ac2jFsL+vQHS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442161; c=relaxed/simple;
	bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=On8iZqPMbjpYuw1KcKN8vUClhGqj8PDo6Qda510Ad7JrnVzNkRsJUc9NgC7S1W7iF2lsa3hWrgDfbScMHduHIFoHH4YrW7WRbU0yO931rmafWl+r3yAOpsPEJjvsr4R37b9rHnMzeNaudbqXkhMpR9kMCm9dZLisHu6aehQbHEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QibOJQnk; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QibOJQnk"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d70066b704so3531745ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788442137; cv=none;
        d=google.com; s=arc-20260327;
        b=Su8HZnCD4nRRs89pg2/tvKin245AP3zCmAobivEAvk/jc5h1AKCZb6m/KgBDdW45pt
         Hj1W3xHHLuEJaM9vQTsy1KwNuWR5Bbs7Y2H+/a2al0Iqp0CcZzhOP3VJnIlG/tpQBLWf
         ReifX4jFnj+9ushtH9r+RfduUDoIvmjtclMjIJrh2S85tZcLVS8JO2GFNyfk/NTQp8vW
         MtZ+O9Q902smj4F5enfngE+QZLuBd91pFoNVVqGxJi39ZcEnVsVvjOJtWOpaoTBYYPFm
         IGdUk0bqLjLHhAGpSAuwS23s5aDoT1obNHBL2p3LGhSGuTVE4vu0fK0KPcjEPvTPuSo7
         IbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        fh=KPwvSRao4rJHMXNkOaj/+O92tFX3g3jCVDb2bL5Q2w4=;
        b=Jcm6qoEAHuGi4meNCioU/jVLLf9kfrMdWEAwKlDXoyXrmPYo2aKzoEXxHku/Z2hD1D
         ssU61kku85ASYOfNwqpuyxYBxpE7tSNwVNUH2st8pGru3yBhkIPoY+dqR03A5Curwii6
         U1gH8S3WECYuBmpP/O3YWzTSZQIYREAPLk+Zkbdqov3Zou5g+2L68icSSYk5py+6o14p
         +EiD/514FaLu0oJHu/9FNJSgofGJq7ORbbJVN1r/mj0G7I49W5giRhHgrcWDJWVddSTc
         JjLhwOHGwOx4gcu182cMxVhswd0G6hlikG7xsbGXoIUyHI/YitrvgOT7eDLvg93TFLkl
         /grg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788442137; x=1789046937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        b=QibOJQnk1IcJqAPts7niHKXB4MYd7rKKk/wudeEGKQp0iGQwDGwevv3JskZ75xdch6
         jfqm4L1dCpknWVRfoup0pgPVeoVkxrEgPBofP5UlvVojRvaPkpNXhQFo3YOpI5eUKzJ3
         oVIpCzNOrezqt2zVbyS0+jWle3e6IbhPsEo3ji4QqZhQGS8vqm75osJq5KNHbniSe7Cs
         7IMjXLKRAKNvoWjZP6f0QpU7q5nxhdS5rzzAAq7Cy/eRo92sBJSuU2C/89sY38/jJfVI
         jvANMBPDBxnLupAoA5f1OGYcmYjS1lAQ1aXvNLhVjMv0fKwt2U1nwuAN5oFlZ7SxOXAL
         4HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442137; x=1789046937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0lzGBDpPSFyRzORpVpv5BVqn0OH17bvA2nEL9BC2eGk=;
        b=MtQLC/FfjjIfJ+x8mNzD9WOWtwTymnIMXeU1TJF1JKh6SMkd638bwYxrTrGlpciqHM
         4vER83bMppuDeOWkUDtNpFC4TJg7i7rnq+yx2WeI04PBEOaWB+c4UwvdF2AZptS365vI
         Ev7llAp7iM0TytfvPu9XWKfSeQwO/dCQ/58jNjvaQ7cbs4L71twCUze4LdaENCxKW/gZ
         GNPft7d6QEWub+Hjy1kdwOf7mMGC6SYIgCDV7cG052IfQudYbFwnHkRu7T0ufwnoT8tm
         Dt8tMRopdg71r60eneo28FVeJtL80+b0Vh8Z7HnPWX3q8bczdL2qJ02uJDmDQdRO5DIK
         dUyA==
X-Forwarded-Encrypted: i=1; AKwUvBwhXr23TtUn8NeimG2R8njcF3Fvy1D6oS/T8CJmCouoNWRxWdGezzUzpDE+Ucayum5iKcvVrF24Pjz2iJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l0hmdSyaTujPyN/D20naTh5MY68BJROA4JLCxtlGDbcKdgR925
	stBVXkXGuqXnoKCe2aE6MZkA0UxeBWtEfY9pXGusYgoY0w+8uWVJYEPnUvrnufX7AAY8kQsJsnU
	4uJWn/Gvcx1zIft2f54ww6kJ3UeyoVHw=
X-Gm-Gg: AYBFou2cTMRwzRUYpQAvvmyoio8oXs+9hLetJw7rBsbEsvRVEnVQTGivzKw+muwehDT
	zcKwtQCqzH7EQ5pNjWP8Z5PqvIrxL/cW+4Jo1gxl/nAxfBEVhEr2zPgt5JZwXNdBs4rpx8h7bTW
	mTGmC8Kjm0/N+iqdYuoUpj0XrPKkThzbwHT/4l4lVwy7f9TVO+7b8n6PFt+Byit/uLUzjrZCv+D
	D3ikWJn4PULrp996UJaFXILRF3g9cK1494JOllrVbEdLySEwsiDa4qZPULNHxv6lqV/e6Oobd5v
	+LMPBLLaCQQZY1P612vntlxhX4AS2dI6zCjq8enR7hhKt18nwambqv1qiV51/kvudd1viCp4Fh9
	sTwOLDQOslCdHWnnC5fZgbMxOXOVQB9pM5llA4lZ9QblrF3JJ5GFjNp80d3zF
X-Received: by 2002:a17:90b:1d0d:b0:38e:c140:2a0b with SMTP id
 98e67ed59e1d1-39aee0e6ed8mr12609481a91.3.1788442136905; Thu, 03 Sep 2026
 06:28:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-6-490735672187@kernel.org> <CANiq72mPLrKQMzb37ow2969m5r3Z2Kh_4LHERUun6ALw3ea6tg@mail.gmail.com>
 <87y0dt1b8b.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87y0dt1b8b.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Sep 2026 15:28:43 +0200
X-Gm-Features: AcwNN1XsmuEPyO39jqyvRGfAMw_DGGPMkiDRHtfg1ZEoNlBhpVDCHnmjvBP_pa8
Message-ID: <CANiq72muo8SotJHJQhEe=2kiprbrQTvrEMqd1Uw_7yNSfA3Gpw@mail.gmail.com>
Subject: Re: [PATCH v20 6/8] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 11:29=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> Do you want a link to this issue with a regular `Link:` tag?

Yeah, thanks!

Cheers,
Miguel
