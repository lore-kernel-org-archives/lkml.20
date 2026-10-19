Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426448;
	b=Crt0CL53eZGgKy+hbyyaGG/uibTECcji72+bEiCl7MdUOApqJKiNCwDp6lG7ttGW/gKw
	 3gZzycE+glsbKaheVSDK5+Ka1P1lQvXzmPsZz2/eW6MPFaTDi+BRPq0BuWmCXM8XG1y43
	 CsHyMXIiUyCMpkT+5oQYwBTO6rpEiT7GRk/M9j4Csw2UQcCgL51VAt0U9mRD2woTx95BC
	 mxcbqtbyAw39PANEftqIZO4s5gpsSXEpsS67QrSV3HYTcVl4ZoDL3Rf2gQUi2keZFBy3y
	 TliRRd0ggLKCpza6XKvoYKEty3T0wFikwJh64MyACSkVVu4T6zCUsB9Yjon+Bn1jK/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426448;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
	b=nXiPwEvqmauLLl+JZE+JJcrhhJ92OJt68tn1Faa9tkyH70OoCcU7YlDaWEflLMB6/Xbo
	 WAkmE4V/qkB55DphJY0iauhteexJ1F1AcMJ5ktqdVvRvvi+j6C3o6+I8pSdZ5CJvir7am
	 H3nN+FwoR/IGzlFxiZErEiFfxCNJaXgkhcxbba33Qj+4T0BGqSvEpmglwETPNbjoDkUiM
	 ET9OQRfm36voLuXn8uwyuljZwrLPfhKs3sEe+RSvKT5bJfOweVoFlfxxYi/hjBGyrNM0P
	 +mkYpZ2WCLwSh4AXJHbPLhuvAe/k8uDtB2SIx2cYrGlhCQsqp4Ydulfa3u/M6n7lWzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qCIh2rNL;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C4606A331
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B85C4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qCIh2rNL
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1261476241.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426447; x=1793031247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
        b=qCIh2rNLyzShrHZcr/CSyeWZQabyG5BA4kgWpAslU8XOFJrs+dQUk9Yjkj3SUzZ7sJ
         7panJIZeQny53xgfr9rIX99aEh2CO7Wg8mQ7GxAezejLxVA5MmBKpWszpQWf+iNQI1eJ
         gFHtXHdC+jpfzZVU2VTlGtglp2qI+VCZNA9A7vfT3eCp5mYWwWOJBztshhM9TMcq7mb1
         Itzk8JwmTJxmHGJ1DqwiwwrzfmCeQs7Oo5HNnp+xsFlwlZWOGqFXSCwKRVjKS2tGHmlc
         nq35ljOwVLF4d3Kcx9k0CWkWO6xyve98PtzzK/CDxAzxsP6uVlEEhtzAIOz2DterKxeN
         4JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426447; x=1793031247;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB+s47HQvDT0+pJXulendy8jU5r7FFBd1iGvR2TZayM=;
        b=zHOil41ab/qhFTs8lD88PWeeyuGic3MdzLzxojDmT0TVL2V+fNGPkoag3vkWhw51yp
         yIjUA5+o3ZQJFYbWpWAKK37z+KKcxuy/EEs5osesXyOcSNTOnUXjZYzY6pnZzNh4wiWH
         nDmB2MwURE/24OGCWQYTZmRbgRvNrUXTDmC1iboeCIoU7rDDAHu2ufXcYKOhJkEaWPAW
         xA7b1GRiSCGCBFTYmWYzrUgaTk7if0TFpsfWE+LHzxwb514lGHt1UVkBSwVz0vOiErar
         5ZvGEjLwTcdoVTemuDHBP8gBiNmyX2rpwNeNAKmM3l3MzrzW3f1AjNwEOd6sZqA7gZaW
         uYgg==
X-Forwarded-Encrypted: i=1; AKwUvBxpjTNRxDv0EpI0WrC7ElWtPOHum8mgo8uGaXNDcalXT91RvO9Mkj/km6ffDJzDet4C+toODqZWrgVGR2Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5cwDnscF48eWBTJEvmDerRV3JOidnCRaNYxTLKU4H32iTFohn
	CxQCs3rOn08cD2/KDtxZu4Mm84MH6bzOsSMwzLe+anX5merNxcGqn0E=
X-Gm-Gg: AYBFou17mOmjA100UlEOSWQMewSR7Pov1JuZv2TcfcpeU0XYLt811/eivumQexab4tV
	gXwpaI8SFOOx+95HDi3dqEFEa9x5cFIh+BNCTenr4iDdIB/6dYhDwjltRytDnXia5cQcf7CYro1
	9kHherY5tYwBV4V5iKdOMcpRahsTCS9fJlTqobefx5gh0g/hPIN6Xk9jM2JCTxpaTWlrekbErbL
	Rz1co9CR9uTsimmSZUtfR/IA0a8EZnTa5cn/Rh9VSfBuRRiuHF88zkcRqXQMgL321hT4nuRojuW
	3LeMi56sM3Nm7yp6dByDoDi+OXjuweN56D76bZ0re8Du/yOtdqFiKVmcaD7j16aWb/olGPe0sco
	atdYIRpfUOVIAKTkMePHbsiOk9470XQ9Xr8qQZ0+OlSpM79kWLEmuxzgLip6j2gQ6nkXeEddMXc
	iMAfxvvWJMUisRtSIlJQhXb2oUMpA3qTDdx3s5hWGyVLgG67tgZA3qygsYfNQvLHIODglaqmT5u
	UTiX5KbxGXc3MlhKnc9b1rQsokdhxaz5XWeyv5+kljsCLRDVg==
X-Received: by 2002:a05:6102:849b:20b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7cc3eb09b24mr1467266137.11.1792426446639;
        Mon, 19 Oct 2026 09:14:06 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:14:06 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/2] rust: pci: remove TryFrom<&Device> implementation for &pci::Device
Date: Mon, 19 Oct 2026 13:13:37 -0300
Message-ID: <d128d86b751a51fff46a1702b636de74a4807097.1792417858.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792417858.git.nico.antinori.7@gmail.com>
References: <cover.1792417858.git.nico.antinori.7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the `TryFrom<&device::Device<Ctx>>` implementation for
`&Device<Ctx>` since it has no remaining users.

Fixes: 7edc491f6fca ("drm: nova: Use nova-core to read VRAM_BAR_SIZE parameter")
Reported-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1264
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/pci.rs | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 769d01d23429..0e9455fd544d 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -6,7 +6,6 @@

 use crate::{
     bindings,
-    container_of,
     device,
     device_id::{
         RawDeviceId,
@@ -535,26 +534,6 @@ fn as_ref(&self) -> &device::Device<Ctx> {
     }
 }

-impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device<Ctx> {
-    type Error = kernel::error::Error;
-
-    fn try_from(dev: &device::Device<Ctx>) -> Result<Self, Self::Error> {
-        // SAFETY: By the type invariant of `Device`, `dev.as_raw()` is a valid pointer to a
-        // `struct device`.
-        if !unsafe { bindings::dev_is_pci(dev.as_raw()) } {
-            return Err(EINVAL);
-        }
-
-        // SAFETY: We've just verified that the bus type of `dev` equals `bindings::pci_bus_type`,
-        // hence `dev` must be embedded in a valid `struct pci_dev` as guaranteed by the
-        // corresponding C code.
-        let pdev = unsafe { container_of!(dev.as_raw(), bindings::pci_dev, dev) };
-
-        // SAFETY: `pdev` is a valid pointer to a `struct pci_dev`.
-        Ok(unsafe { &*pdev.cast() })
-    }
-}
-
 // SAFETY: A `Device` is always reference-counted and can be released from any thread.
 unsafe impl Send for Device {}

--
2.47.3

