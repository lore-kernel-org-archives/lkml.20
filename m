Received: from mta0.migadu.com (out-27.mta0.migadu.com [91.218.175.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E984E2F3E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775186; cv=none; b=VQ8PM4OcO6EvAHCrsFqo/dOICdONSlLeMZDHvoun+Kz39ZUjwJSJFU5PGU6hY9yAQqZ1kvzTRNlRpZsbLhq36BU7OrZKn3+xwNGAi2QNr8pgDviYlP+McfLjBizpEzLUnNTFnYCphLlC56raz5it9PHFneKcbJGdY4D3/uP2Kdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775186; c=relaxed/simple;
	bh=g1gKqZerOlTHnqkOHn42CkvIwvZTzP23Zcbc4y62YZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qB0fh3aINT4ItMkwhsnsZyky+lCA1yWfCm9TN88kbUyYLHtJA9yL8ZULl/EIe+F8CICpvJuoGUG8mSw+4AYEvOVaSeV7VMGAC9lG/rBr/J1qJb2qVQIO3aNDnq6rOVLaGNqn10uFknHTXKuMO5I7UbvPAEGlCf6f6bkSX1xEvDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m0fYRc7b; arc=none smtp.client-ip=91.218.175.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m0fYRc7b"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=g1gKqZerOlTHnqkOHn42CkvIwvZTzP23Zcbc4y62YZ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790775172; v=1; x=1791379972;
 b=m0fYRc7bq98ZpPQfJBgi28FehVtfdDiTUKdSvPq+xHCtQhQwWd+S8MTIeFlhF9hX4KFUSSTL
 O/MaPM/Av9HGQhk3k7pJUmdjfRuvY5EUAZ7afDgnhozVHhmgtXNTFapwXed6RLcQJGbEdMgpYu+
 maqEX04X1YO74xiWkYXjXhaw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e1f20e7b44c7dbe5;
	Wed, 30 Sep 2026 13:32:52 +0000
X-Mizu-Trace-ID: e1f20e7b44c7dbe5
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so1019e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByyA0mto7u7VtTTpECC+QyVEPTFrbj80e6mpNhhVS49wNAXXD9QVszEswHqHXEyzjcHRF3VHN6boS9OB7I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIU4ivD+onIcAsK2RVsu2FyB4KgpPYPBIfW9LC3kT1laMexyf5C
	xPIMvRzCf1k+8AVnNlpqezoyPUlsmc1YH6VES8wutrmADssDrv+GJDnNqfbkF0rTPhXhvg/YoG3
	wH99beUudllEHWhPCjHa4aCvNA6I9P2rrrnO34gx7
X-Received: by 2002:a05:6512:15a7:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5ba3f6d7af0mr72960e87.2.1790775170749; Wed, 30 Sep 2026
 06:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930121212.3101361-1-fuad.tabba@linux.dev> <mzmgyzxbha7fcrmbwscu5wbuge2iuhe76czp25guh3hg7cntkh@zrsuzosmzuiy>
In-Reply-To: <mzmgyzxbha7fcrmbwscu5wbuge2iuhe76czp25guh3hg7cntkh@zrsuzosmzuiy>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 30 Sep 2026 14:32:14 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzx=BfOe2bN2gsLEthT587NAq6S2n0EZcnFg3ntugo1WQ@mail.gmail.com>
X-Gm-Features: AclHuK-3E5BlgAYE04xbiTSHwyRzUHWUPYScfOkIMzqEfmAwSfYBzqw2T6965fk
Message-ID: <CA+EHjTzx=BfOe2bN2gsLEthT587NAq6S2n0EZcnFg3ntugo1WQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Anshuman,

On Wed, 30 Sept 2026 at 14:26, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On Wed, Sep 30, 2026 at 01:12:12PM +0100, Fuad Tabba wrote:
> > On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
> > __init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
> > which are RES0 there. The macro only checks that PMUVer is at least
> > PMUv3p9, and 0b1111 passes.
>
> Just curious - has this caused any real world problem on IMP defined PMUs ?

Not as far as I know. I found it while auditing these and related bits for pKVM.

Cheers,
/fuad
