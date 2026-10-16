Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F9647ECE4
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152756; cv=none; b=Qcx2k24ulJfA9A245ZG5AFjQmlli18XVcHkZ9rYmSWc4sDQL7XV0fyEE2H72hQQmG5d6GTWOrc8P8qzV+80txW1wYWsoyhDsVMfLLhGnKtP8eyJx8Ov4QzH9sYOABfi1vdWViBKwm5cPP/PlyojQPbESQJJCDPu6fAZKSifgEEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152756; c=relaxed/simple;
	bh=NoH99aicsFlriFvr4iO9OOUEPgUPA3yDZM37SVANJLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AW8pQRB9Kv8d1QAXIRFv27c4OwNVCURFxh05cPjblOCzYQ2a6YEU/TVd0fBFSe6r5RbEcvFazgQFdzuAshOZnBj4fTLJbWu+PSJ3rp/2PRtRcI6HUMmo20KTkdcMR6ba+f02o4Y9UoB+bpI1iepmYeTnTPZcOIGNLCILX1gV29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNA6xt86; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNA6xt86"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so21846475e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792152754; x=1792757554; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcrR92pfRDgRPvJUR5cNdBc0H4+TqegTvgg+s0NCJZM=;
        b=NNA6xt8632OBb2w6c8prLrVzFmwuext1C8QXNfJ6sc8j54V4Bue69P14B6aEu6tXU7
         Ae9op8hBbsVgAkZplzJCciFoPlAQ4inBT7RNddS5xEPiGc1ukjLgEmiRqSQeC1QcgmZl
         aku+4MW4Ez6DVpzs8jnTQOxQH5riiI/+czMCgj54eD2Az/WK51UuXhrCAXg6O8qx74pt
         qyNpVHp4mslAPix/yo6K6UM4IGJrLIpeZC4hNS9LVQaShiWHbCV5wBOAtzb1xzGFqDHT
         v3NkMue5h2irJHEKRG0weKxBT6M4boaKBvoUBaL0DNjlaDXCfn+VRLwYCd2XncokAFG6
         T8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152754; x=1792757554;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcrR92pfRDgRPvJUR5cNdBc0H4+TqegTvgg+s0NCJZM=;
        b=D5n+tk8AV1mLndXuAWdxyYPlk56U3NjZci3NCt65NU0te37LNIAWmKWsVXIq7JeaDW
         S6f+pxM3Ur1VSlHtS3hkaJhpAAbKLHaK9vdPjCtd7f82GQ6xGZJTw1RkSVoAqyD5J6PQ
         dBOykBUrSnr1eaxxqZmj7WacR9t4NG/4goOXo78DPo0Dh2M7iPPj+1fn6I7GSL5Kuvx3
         KL7Xylh62niuRyXXYWlntpVpXgg97rvrynoKLel4ih5xRoFKGEolkJH21jKLypKKb8iq
         b/sxDmSo75GNkBqbUIythyWgVHKtSYluuqNqoAL1sWe3jLmlRpv0bb7byioQNrOY1uYj
         MXRg==
X-Forwarded-Encrypted: i=1; AKwUvByl1MlAJ7+jMSrs6JjtzphjfhrcIdG108udJvO51J9DYQ95oFP/6MSKpbF4otl+5ZFKfNcIbAEjuRJDQeI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrFWBTuLHkJx9MA4bS9oboV+sL8lg505E9+CevHr/oaEri0ffg
	lKSCGcKrPDPw086XOZCnO/Mi/AUgX3yI81OggUrU5EH9bo8rcc/k2e5N58r2CcacCmxeqh7Yg4S
	rpajDWfQ8sqkbltzeOA==
X-Received: from wmdd8.prod.google.com ([2002:a05:600c:a208:b0:4a1:787e:6a00])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5251:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a18e4d5a01mr446361805e9.32.1792152752925;
 Fri, 16 Oct 2026 05:12:32 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:12:30 +0000
In-Reply-To: <20261005133857.1572243-3-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005133857.1572243-1-beata.michalska@arm.com> <20261005133857.1572243-3-beata.michalska@arm.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016121230.3724323-2-aliceryhl@google.com>
Subject: Re: [PATCH v4 2/3] rust: platform: wire runtime PM callbacks
From: Alice Ryhl <aliceryhl@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, dakr@kernel.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	boris.brezillon@collabora.com, work@onurozkan.dev, samitolvanen@google.com, 
	acourbot@nvidia.com, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 05, 2026 at 03:37:40PM +0200, Beata Michalska wrote:
> @@ -223,6 +225,14 @@ pub trait Driver {
>      /// The table of ACPI device ids supported by the driver.
>      const ACPI_ID_TABLE: Option<acpi::IdTable<Self::IdInfo>> = None;
>  
> +    /// Provides driver's PM callbacks, if any.
> +    fn dev_pm_ops() -> Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>>>
> +    where
> +        Self: Sized,
> +    {
> +        None
> +    }

Since `DevPMOps::pm_ops()` is a `const fn`, can this be an associated constant
`const DEV_PM_OPS: Option<crate::pm::DevPMOpsRef<'static, Adapter<Self>>> = None;`
to match `OF_ID_TABLE` and `ACPI_ID_TABLE` right above it?

Alice
