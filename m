Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686851;
	b=FcD1vUTr6tFYbybGgJClkkLIi6VPkKpdockinhOtn596IZCr23I++7623vt0LWVjfNV4
	 BXpxnK68cD5w0UdGvU5Vi1n5mEczU0F6nFvPxyQdmr2ggDv5F7aZewKS/b8h3gb4eqEyS
	 uUAGN+M0t4NYRwwcYQOUN+TtyCyNvgbJjtVs1iC9+m1uUDJnOLAO3agU+nqjrgV67CQ4m
	 jCo7xZNlFfeDzKNhvaTUVp+HLGA8j8T0NbvNTJ+Ke/AZP8LPpNgPOZF6tYOIXoJvBNdYA
	 1SeSx8lIoW4M8RIZ5JERimYBQVfnPpOGuqLTjA/i+GkRYDPit1edcm9BwagaDlbrNZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=viQnFNkfgxE1Vj8v5dyCU4nOO4hedWvtxo3baR7F/4w=;
	b=eBBEzokJZBXyx06BSsm0uXcBSbfuPgmVkKb9Q6x51wf1F70+dqjKjlrBSslUAjsXmleh
	 X5vtIxXIEZd3zZ4EGFgJ21LU7hroEQJ4YyLzhQtayUt0hgDQSGIyNVjC6G0aI537mz4IA
	 nbP4+AqXmDZAW6gHzh8h2weSPdQ36sr43LthTO6DKDHKRi3WKc22K3pl0zdftZHQeCnAh
	 EGrCCv8z+ZjwtJcfCSHSY25B7LcW+BqZkb2sv4v2MaadtElSmmcegKDYcmxojims5hD7K
	 oQn8K9ruudauFhNM4dxxObOvYg5wbKq4s3tlVZ8UZWzlxONwTdjU/S4RNojybMHOm8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05NCn8+a;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0AA606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A0AA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=05NCn8+a
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acff56a300so20939361fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686849; x=1795291649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=viQnFNkfgxE1Vj8v5dyCU4nOO4hedWvtxo3baR7F/4w=;
        b=05NCn8+ap4FtQNWxuyiMuo3GWF3wfnyS1Q+GXUgtXTSeRU8pSR7Cv+Lg49kNPEA8/j
         xMDvu5IaQgh2ogVpuYNRq07U6K5H3WaWU4PImY9wZqjaEFiPcrHDr88sOHGEcUjWmBRm
         oqS/RvUnmKO3NqMzI+Wu24zXuMM0kzmICjGr6O7Z3eQLHpVMTn9wTioCP2SfX/pLViAK
         hYXctjFBZBeeJ2bPCVqCBhBbxZOlajRTwH/8iGemgJviHvs5WQE3t4zTpVIgKjfuvgUE
         RLETRNWdexfpeAKhKtmvnxjXTJXLg3CE1bzTokfDosaS2MdNy/Gko1ItXAPZqQHGhut6
         tpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686849; x=1795291649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=viQnFNkfgxE1Vj8v5dyCU4nOO4hedWvtxo3baR7F/4w=;
        b=aFi3g8+9qlklf9aby6XYO3wLteWLW1N+N5ZxtcTMc3/85/7z9+c66pPwaFbUYNh2Zm
         d11T26UTFJ28eE3vjijhQPQuTZx6kNcM4mM2iUvSiIu9GcIM8AdlN8UHID2US4LLCyL7
         7d5wRwESRGrfDygCGbTppE4QzVYnh8OfAJGXE8ED7gWEx7nrQxN+LO4q6dQEJv1TmfID
         SU9pyBO205Ol/mAdEyhzsWhTSnrXPLDRk6Xl2j0ImpdYf4EcVeL0CWe1gxr//8c2U7lc
         /o01h7ErMfKdvQenwmBej/X21d0ipI0FQ+Ev4tdL1oS78y5d6menjtNBqaHwujz7cGUe
         u+Xg==
X-Forwarded-Encrypted: i=1; AL+hErF+H68SPar11BiX4kPz+7h2VePYJ4Au9xXsFKlvO31P5v0UUw1IHB4qOnTZ1EkvuTw2fFgoyV+CAmIfitk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FnEGElbHPkG++IAtemp49GiSASo21BIRM3nm0SbVGox9KV/Kj
	QWILp8TwoALQ8hK5legaAL+0D2ZGvQHxsQ0ZITuT+chZg26XS2jZoaxX
X-Gm-Gg: AYBFou2Ti1+23ANWw5u2Uptrtv981Mb0F0og2o+Ps2uje56lVcaPmBUHAsMIkiIgsVh
	TILbglr4gbi9FGzTKX99Nzsc8ux+hWQ8hXpNFfhfjGmEb3FBvDvBYbKP81HKv4l3ArMCFVchAQ4
	0ms68WD8SfD4b+Ojg7Tzu3k5lLjEeW9QulTGzR0u2rQTMGffnhXADVLISvpfgg5wa/Hifs/CRBn
	RgMIbJShMt/XOKQUv17dBjx5SZ6nwUDo5vO9qDbldfDgX3Z9aemUqWT9JBDsWiFfH2Mhp2ePIKz
	+Qq4NIsipctVTDNfWCNToDndCq3/Nm9apZtzDSEn4K0Uw6/ZcnzzyaIo8VwLBJ7ApKvxOg8rbJg
	Efgnw2WoDr0XEgrgMa17pr/JW9ThcJsb+iGT1fL0VgDirDARLmtBVgpQ2zrvTU3ivQHGGUGRZj1
	uagiKqWzj3jlwylpXXCIwas/lDUThq5bItz8asjLi+1/H4XH5RNB4tL05pYuWRAEhH1l5RUPu9k
	MeDbj5KPMa73vd3tZY3PCI+iGGO+w/Sxd+IXbVsK3crN7tcrfYW+KzjgY1Gy6T9GIney6yp49xs
	c2/rhgI4t2iPuZDqt6bcgfwm+YbS80RWqICExPE=
X-Received: by 2002:a05:6512:3a8a:b0:5c1:5715:bd00 with SMTP id 2adb3069b0e04-5c170b1c313mr2231081e87.18.1794686848394;
        Sat, 14 Nov 2026 12:07:28 -0800 (PST)
Received: from IuseArchBTW ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712da125sm1891070e87.1.2026.11.14.12.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:07:27 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Matthew Auld <matthew.auld@intel.com>,
	Arun Pravin <arunpravin.paneerselvam@amd.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] rust: sync: lock: allow fallible initializers in Lock::new
Date: Sat, 14 Nov 2026 22:06:59 +0200
Message-ID: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GpuBuddyInner keeps the C gpu_buddy structure next to a separate
Mutex<()> and has a TODO to move the structure inside the mutex once
Mutex::new() accepts a fallible initializer.

Patch 1 makes Lock::new() generic over the error type of the initializer
for the protected data, so a fallible initializer such as
Opaque::try_ffi_init() can be wrapped in a Mutex or SpinLock.

Patch 2 uses it to put the gpu_buddy allocator directly inside the Mutex
in GPU buddy, so that the allocator can only be reached through the lock
guard, and resolves the TODO.

Tested by building the rust/kernel crate (x86_64 defconfig with
CONFIG_RUST=y and CONFIG_GPU_BUDDY=y, built with LLVM=1). Not tested at
runtime.

Ivan Tverdokhleb (2):
  rust: sync: lock: allow fallible initializers in Lock::new
  rust: gpu: buddy: store the allocator inside the Mutex

 rust/kernel/gpu/buddy.rs | 38 +++++++++++++++-----------------------
 rust/kernel/sync/lock.rs |  8 ++++----
 2 files changed, 19 insertions(+), 27 deletions(-)

-- 
2.56.1

