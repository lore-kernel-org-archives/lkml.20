Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE043F8254
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745610; cv=none; b=RedBXVN0BI0Y8Jlg3CKFNOZOH5upE49ymnuunilWZbrVx/LBfCHVxq6bY4rml0xRXqhKqCIvoZ7qgIEZdg/hFHSqD2uj16qG4axYtzSJfx07yp4TyBxN06nsIwMYnh64avKingOxD/IvGJ/VGwPiWsws+Sz+DPpMFU1MEg1NI5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745610; c=relaxed/simple;
	bh=eM+2IXPLksQPCk10H6wLTPEFYw72blRBRBIFKEqHrfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dE3Nr0/7daW9AkA2eckRHzFNMhx2x1h1h5ePAkgIMDYUIrWeSQ/hoE4PngqQlOYNBQNpvBuHbt/k5I2T8Oignuvg3+bBDZSDKYMcMNy5MoN3lid1xh9ZRoLmZgR2qLfJ3aae1j+DKDCmot6nbQbJ5CQdiNtVnwd9kzFlsBNNIz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzlC2Vnw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzlC2Vnw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cacb8416a1so8526045ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787745608; x=1788350408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKmdjRPRpgrPNsYFGU3ypH80W/86kIrxtmbI4pD7Jx0=;
        b=BzlC2VnwCqpb4vOqNCSqc5SX006eEE4xXJQujVOhW7RSokBKbwsdr46/i0SWGeDKrK
         gevyTDue+aBRV2RW3HR64g8yNoMOrEfVe8UXx1pCqoLDWXEdPvnGdu68SqJTWet0j0hp
         wM5rVKMlvLhkOMR/AW0p3A9sqEYOUiU4cCUG8Njgb++i7SZO6FiHRG7DFKKTYAyXJWjS
         o1WJnBgi1+CY2SR4DUaqEhU5hHiEJDMvMD6DkUlwApF5UiSCUhrz7KKit6Sc/pEJbcN0
         PX8qV05I6vBkc/g26NMl5y0hb82imlqMOdxfsG5n+qkPLgp4mtX86qK1qsiuH4T8pI+N
         r49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745608; x=1788350408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKmdjRPRpgrPNsYFGU3ypH80W/86kIrxtmbI4pD7Jx0=;
        b=CmUt30DJPEe9jac6kNJPJSESLDhsamDTnbelbckSQ5F0wpyVXlt1tlByvTXLMt+gnS
         2pnsJO+P5nWWdSnQuajWQquUHe+53e7+5UNvcdP5wOQUOynVVaLrlSz27Sk3GDNonpT+
         LoI9ZPMeFKvP0xGM4TWUJtBiyJphLWvTBIip0fGBJhvX252GEkAO2G/dWC7HShNQZusW
         G5rOFShLMaSxhAo8AABG+cZIx7W5Bx2aLb7Q8p9oG94j5yxvdVne817k60fJXmacjUqN
         H0bw2S19ne+wXCrQy1CgorQAQdZIciXEnVw1EPIHmyuwhX06Mi4d0r/tG07b7mUfqRJh
         MHEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0acpeTlrqHv66TIpCazdudnIMagZ/YT9Ek4xcBthftbo0FwTT4rl/fxdqfrb6L1B8uq/otxc4jQ71Imc=@vger.kernel.org
X-Gm-Message-State: AFuF++np2PVou8EkEiHVGBDExtkljb8qs34e+bV7Fn4tULhKDFgSK9hB
	pTTy1ffu/vRJ455yuqTZGW3n7jHjsDp6IV0Kf9YdmMy+gYOs2rzh0N6/
X-Gm-Gg: AR+sD12UHZXfeNn3YBto4uqyvkLbelvF+632sngXHotny8ILnpr6NZuiAt+UwVHZlcf
	fPC6gosCdhOL7cCFQHU6NpJcFVU0dSNm5zer/Tu2clrHpQuHNMiBMa6A1MlEUeNzBMuC7KOMjCp
	PpP9EYroWzFISd702elaTYmjrkom3KxBV77zCRzI3beWdibmGZt/woi6XvT7UtBa2dthgNAKGHi
	mAZbwA2EV7PWUOR9my2t/RE8QCVF1dNZwOazLqXbleZc/k65dnIT5U1/3Ts7pRkZ2lkSQT7+r7t
	iSiZirT1H1P3dEVzmi+MIJBYH89N1qukjo5JW6Hek/i8SEbKHH1tbGQq+Di4tCELfI3Gngyd7Wd
	Bkh2WZIFBxoJVbiw31sgv9lLVmOHMvq72auNT+XeaamiOz0rOTVh/YbOJ/7Cea1BmR/w3j8Cwj4
	PXrXVkOy9oWkWczafb9DwT9LtrxEavGHIetptLHwqCNX4DNkaq2Ugqy77yZvs3oIZlGNCYznHRj
	AhRvBVhlVA=
X-Received: by 2002:a17:902:f70f:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2d707b7f68emr112387745ad.9.1787745607765;
        Wed, 26 Aug 2026 05:00:07 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d9edd8esm7655079eec.27.2026.08.26.05.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:00:07 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: sashiko-reviews@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: Test the PV_UNHALT feature, not just its CPUID bit
Date: Wed, 26 Aug 2026 17:29:44 +0530
Message-ID: <20260826115944.2882320-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260826101627.2873660-1-hemanth.selam@gmail.com>
References: <20260826101627.2873660-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please ignore this version, the report about the hypercall arguments is
correct.  KVM takes the APIC ID to kick in a1, as kvm_kick_cpu() does, so
this asked for APIC ID 0 to be kicked and only passed because the halting
vCPU was vCPU 0.

v2 halts on a vCPU with a non-zero APIC ID so that a kick sent to the wrong
vCPU can no longer pass by accident, and I confirmed that reintroducing the
v1 argument order makes it fail:

  https://lore.kernel.org/all/20260826115900.2882139-1-hemanth.selam@gmail.com

Sorry for the noise.

Hemanth
