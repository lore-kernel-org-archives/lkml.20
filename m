Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A6C599A43
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066398; cv=pass; b=UQupHA6vgP7J4MDocTHKaOQmKYojhO5X65GjTakmSQfVntAEIGMKRl0GiDmDEwaE0AVg81TRWEbESYQKI1g0QPGN/sbEB3sN4X6mejhCDYCP7AOsdirlZSRA+XcpGznfMpa35g31KzP1xDKkKW9c1jDs1VIoqf2YX04CR2hbyC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066398; c=relaxed/simple;
	bh=dT4FNCiiMtIXPLJOvuFJF0jefoKwdOcRJ3SvzlEgqv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Db02nnvRCzTuN6Lii/UgWrje7irnGeqT2qTNnRso2NvWU48oeYNhZNih3dXrewvuht9IEWFK6dGK3mvcwYA9QIReWgvmiH94vDldGzOVGE38jje2QnCNVnr2jYVWZE6IISdISdVjlajJwUZxHEGdP4JQ9INs3dCDpFOEU7/ki9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sw2RHwaa; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sw2RHwaa"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b78e073980so10141e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066392; cv=none;
        d=google.com; s=arc-20260327;
        b=bq8zFQh8beqB50rSui7uHtn4sld7hxsvpyzc7qtfaSLrt3YlBxypDQvxqJ9hgHp3eW
         9hRasBKgldTXzKKgDeZSCejHWdRbcfCF1KJcwbSue/Dn5ZMk5v/lTyiym+/Ym9c5GuOv
         DJxRskUHCwdZgTYgqQTPef9YhqbJTF1C84pU9PxYttpar7WrAeBAN5OckCSNH2UN7n96
         OyrId/YfSTe0m1AoyroXo2YJQHEjI4YKNzX/zEWR9PVc5u66Z+o0cBuZnUhaPCaD424P
         jZZVGJGtQYlzoYzKvUULIOR47bqcYXuEaSb1LaEaojQHriJThstk4l9xHnaCpL0gXtnl
         Os4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        fh=SFkkkL1s02KOOq/YaqDb9AFUmuDSji2SCGD1K+KZN4o=;
        b=gTXbdwy/eCx9O71VM3nO8ojbRsYvtahNQ/jPwE/BUkptSPCEokMiWH5J17bA90QeqP
         zCJBH9ynH+kUG5/dZTqc0xJ0wN6/LZicuz8f+818zKWuu0CAP7tvsE5obnIT4bgCnNaC
         JHIzapqf+gp5SgXdL/0sqxzF7XQ991u+O/SxzFtv7+aKFrEut7IO0moE3HqNfZF3fjcM
         GgY2UDzG7IKVOcKeHaW3HEGpm/hnVV1+gA0d0S3oj1nbBYHh7MksLcrFe/AVBHPpdcsv
         kUleBRBai8ZXjIicIUIMfcumNOfo3x/KQqMzwbA8Hf2M8r51Tz5mF+33wLH83mvNQgCp
         5OUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789066392; x=1789671192; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        b=Sw2RHwaaXxf51aB+WhflsVPXZjPmG14dd4LokBPYZn/6ZK7idt0TuWHcwAav/rWQ/J
         eDL6t8jrNOzhMjtU1SidTyEOOIwal+t61/w4oylo6ShSyZHYn7vrPXaTTkeJ125mtlzp
         6dgwX6oRGqeQoen7xjJiFujW4kOEQWd5pX8BhfUxGS+fNbJQ7XnqkrnIWsCw0ykKcA1V
         Hru4wYgKWBHQ9f1dQi3R0+hFBxyDmOm4+9SCetyVRT2TG1svlCRnmbi7ps8RcMSy/x+b
         QMEzSPV81L3d30DWJPWPvUFoT7OY6HznQulPA05Ceuu5BvYhjvJPtKUhjtANy084mqoZ
         EVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066392; x=1789671192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uPA7h1yzQiskXY53xtPOVbRZgGvwK1v/3hUYMrYw/Xg=;
        b=qNmBylhiCIFDmJSb+ZJci2f9ecRntJooRm5H6NZYlVYuITHt9PyYDQ6BGYGGPVaj2a
         sg3qIMYLbo67oXJj8LEU/PS9feuPtgripVIaHInQNI+YubX1OIJ+bMGdMHOx3RNkVKG+
         8ff/h/7kLvYFiipz0d84DHzeMhh/gXQRUXwRM96JtSibyi1Hw6m5z0mw2u+reT6Z3HzD
         xiN7TWmGB/+n6Vs06WD5NzdW9RXO/yw4VeDHtTeNzdWY3PSkVsCQzVtHjvRoBTn1gtu4
         /kzH2YIJpje3hVnzssgS6Um84pXxKJQ6PWV4nPERX9+1jmKl9UohUSZMy3CfXn0W9dzK
         EzAA==
X-Forwarded-Encrypted: i=1; AKwUvBxdqyx5PJ56yV++vMWJyuHuDEvurje6rotmdggs3UB8w7nT1QpJvZnnT0AFh2NNSJ3bf6WUbOirjoEf98w=@vger.kernel.org
X-Gm-Message-State: AFuF++muF+9TdIQNSh7bHSB04NWG45RhLTEOy0b9evW5ke2wkCjIn+Vi
	UL1g03gTwuySReytks0nvD6+NCaWsa3cmx8y4bBlOyDEY/Fb/vPQ7q+OZZjg7ns0JUimDANd/z+
	jpB2d53m3BwT5hClnYfQDZYVD77BNKoeSWSFav/5F
X-Gm-Gg: AYBFou3cEeUZiTgGoPDbtTTev2JaJWV2DkKXxfZwMTmgMGgNySGud7SqE+gLWaKynOP
	/j8TMs+dSZDGC6Cy1YIJYjV+7ZVGRSquSFcRcX3o2C5LOaMDH/cGlA5ipQ9wsAWRd748a6BwDWC
	0zXHa9OxZbLKzWkgqyVKIfnkgiSjqwtTgY73N2I4JgWNJZwwHxXLfkLo7565klZG7X6UHvr0kDO
	eY2ipGbk+1bvqT9KGq13oC4gj1eiu7uJ+2sTMSxMGHOnQ7bK+JLZ5h38eg81tjQgl/O/lJlUZu3
	MMXzsjWwek4GFly5nbAWM7fiVRfx/D9j+GDWvdbGEbt/qczIr4ifNWLEIrbsDTjGfh5QeBY4Gns
	KIN0IiOAY12dmmg==
X-Received: by 2002:a05:6512:4009:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b8a07a0e5fmr23463e87.3.1789066391400; Thu, 10 Sep 2026
 11:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org> <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-6-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:52:35 +0100
X-Gm-Features: AcwNN1XPPeWtd-a0jzst6s0fMnTr0aHfMbhg6rA4kjyMckfbadgDOVe553duj-k
Message-ID: <CA+EHjTzOKHNrf=0n2c_E+vbt=pGquz6qzBpJ+eLJ5hjK_nyJMA@mail.gmail.com>
Subject: Re: [PATCH 6/8] KVM: selftests: Enable pre_fault_memory_test for arm64
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 17:01, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> From: Jack Thomson <jackabt@amazon.com>
>
> Enable the pre_fault_memory_test to run on arm64 by making it work with
> different guest page sizes and testing multiple guest configurations.
>
> Update the test_assert to compare against the UCALL_EXIT_REASON, for
> portability, as arm64 exits with KVM_EXIT_MMIO while x86 uses
> KVM_EXIT_IO.

The message says this updates the test_assert for portability, but the
parent has no exit-reason assert and no struct kvm_run; this patch
adds both, so there was no hardcoded KVM_EXIT_IO to make portable.

...

>  int main(int argc, char *argv[])
>  {
...
> +
>         TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
>
>         test_pre_fault_memory(0, false);

Would it be worth adding an arm64 case for gmem_abort()'s pre-fault path?

Cheers,
/fuad

>
> --
> 2.55.0
>
