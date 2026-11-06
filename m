Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793997480;
	b=itqc/KEXStLZBNU205/EFWlJt822M9vgjEc9Epz0eoLQiygcfmErwZn2Swx7rTVSraGQ
	 D1bH+KatVbN15Y/gvZb3idqaW3TJwn9YVYRA1Hp8vi5qVbfjJeOhjFWVccKPT1HHp4PXn
	 pUzrIcYjpjqMRiWAOHk7uSleCNQq8OJc9/1AftjnK1I68Ygu4LchPRflKFvfQs7Yki/DL
	 alsFFKSKNY3sd9aG4238Hqr9dr+WYCTDUFcVeVcYztTqElJ8Iq2K8CICScmJ4GVtrAPKo
	 gfY+8gSv7EwkM87w7qzgZHItHpyqFbyyNtl8i1GSZtNFJPl/uShTBBGMfigE2qK06Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793997480;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=CWFtzEGOjYXWWrRXdjVOFSZ25rh8/v8jlZjeE8XoHSI=;
	b=GcdXtZBtYmnG/UcJPm85gaSUSPvUIljFMxFakuDSUjv8Gv8FdZgc5dIgyH4TFEFtzRly
	 grg/AVwArkbgknXjXmOmfLgMVwCRiSK5NNWM24+t8TJzekfeUAU3X7nLrn49H0UngUnW8
	 SD03CeIu0f5iJMO/1GoRxFvDM/6ZXz6hHVtqmRw30hVVznATKZ9ulP4KYd9/6x6Vq1y/Q
	 UY9uvCEF2+m4l+Ksi9QORCAP9zVAs0uI1595nF8qnJkf2V12uiEF2EUEMkca+Usosxcga
	 /b6dgpOBIUAnBqTlLdZPZdoZRg3xdiXu0+6wlYZ+1VZWXduHzxqFPFyKbp8zh5UbRxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWIvhJ2H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1A606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CWIvhJ2H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670341F0089F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793997480;
	bh=CWFtzEGOjYXWWrRXdjVOFSZ25rh8/v8jlZjeE8XoHSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CWIvhJ2HHH8jG9uSfhCSDdMluji48syxsypheLFVGyyvHBde2UEqpQ7PBfhRVkViR
	 tMaGtPq4x8VjhvDEoAKJvxMAQBD7Bb9wj3Y1CiUgtZPWixG5xbxne+eYvyMrafEso2
	 g1oZkPfPhld8HDgxl9vybcKhTDGBcegQH6sj4brzD+XyVS6gy5PEj4TD5EPTzqBXGv
	 62DS2k9UdIpdnGjfiQcc4DrXZ7OA36W8GXQvk0GrM8RjRA+GLXdAKMZS+MrWIMAfjw
	 cpAyf88PllwA/p4krB+dhgBx+zfll9+QK80qTYpysVv4RTEp7gP8XiG6CoZBOOdSzU
	 8Ceq3dJukGw7Q==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be47aa555cso885798e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:38:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHbXMsRWJ7/aux+Um2nq5FBPBYdzJrO3o1bxkmQ4ONu4StqZlk7ih8FnNptv3ci/oUfm5azEcCgytBPoNQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BXyz+0z9Z/femkf9opkL/TbZPvw8WuxtvpT1gMtwdETStux/l
	pF8qM2t7a6vsBl86jSlyf9BUVAKfznlWirgnkHiTfwDRl7YEVSfo1jSHBTffmjmxwEltc9vDYBi
	HJobRauJP9jHV+5F0Y6BKN27eksVsra0=
X-Received: by 2002:ac2:5692:0:b0:5b6:1a7c:27 with SMTP id 2adb3069b0e04-5c003c0903dmr1289753e87.42.1793997478844;
 Fri, 06 Nov 2026 12:37:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261005153723.2644331-1-fuad.tabba@linux.dev>
In-Reply-To: <20261005153723.2644331-1-fuad.tabba@linux.dev>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 6 Nov 2026 21:37:45 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0i4wc1oeRZ+eswsLErgchfQa0Mmi8K7nBM7Mb9T7NToHQ@mail.gmail.com>
X-Gm-Features: AclHuK89uJyG-LZ30b3MHdFmqSZ2vlWQfjg36o0s-bFfSBL5BozxQuU83pcSs24
Message-ID: <CAJZ5v0i4wc1oeRZ+eswsLErgchfQa0Mmi8K7nBM7Mb9T7NToHQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] ACPI: tools: Fix stale headers in incremental builds
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, 
	Pawel Chmielewski <pawel.chmielewski@intel.com>, linux-acpi@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 5:37=E2=80=AFPM Fuad Tabba <fuad.tabba@linux.dev> wr=
ote:
>
> Hi folks,
>
> Two fixes for incremental builds of the ACPI tools, which compile
> against old headers after a header changes. The first replaces the
> copy of include/acpi with a link, so the tools see the current headers.
> The second adds dependency files, so objects that include a changed
> header are rebuilt.
>
> I found these while fixing the same kind of bug in the KVM selftests'
> sysreg header [1].
>
> Based on Linux 7.3-rc5 (72d3fcf802c45).
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/all/20260922071945.693714-1-fuad.tabba@linux.=
dev/
>
> Fuad Tabba (2):
>   ACPI: tools: Link include/acpi instead of copying it
>   ACPI: tools: Rebuild objects when a header they include changes
>
>  tools/power/acpi/Makefile.rules | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> --

Both patches applied as 7.5 material, thanks!
