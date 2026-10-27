Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086694;
	b=D/Ov7RGpqL/F9qb6DYuCRerpNLg/0UwfjksjrkOON4oVGPm5kePSzmpwyBixwKKymSoU
	 2r/fc8xj0RBdW6tcaEeXqxAMJCwt2huEXhzPaythpv+OrPmbfAIclXODDFq2Xq2I5zdwq
	 57MUNMooONGSRGdkVPJ8Pa3aoe4f27auYOS3ZGXcP+jVPQ01stNa32PP5KkdOT3b7A76s
	 tccCtk2K+Y5Kw8wusnhRPIPeTTN7DxbWv2/SS7wefNKTgx7r1XrYPVPY2lJ7knlMhWYvu
	 waRg/dmK2BqRgEGI8QcZ92lHudvsr+w04PerrsuHKZefwISU5mQfWsPKBEZ/g6rZIug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086694;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DUdFRfw52ywOMQpo+REv/lQY3o2e9igJbUGF/Xyek/s=;
	b=K/j1S92sYSyTYc+5Hw4CNigigBWUdo2by+JQxpwcsKS71tLTnslZiY4y56wTdTymsu6e
	 0KlpJ4UJ13iaQk3NgVtNLZTnDsc6Uht3CRIol3EKmgu9F/Ifji04M3liAIPY7g2cee74x
	 r8X/gYsmwJ7KJTMun4qldqvEiYtIyQ1aK99i3JbQmVNom//7o7QylRq31jkdOEjMxYHP4
	 ail4uch9Ma18OY748WhdLuZWHlwjzbdbxW8S/R6UMZ4qyz4/3u1+q9odwk0jVXIibXqcM
	 VPnuFBy7umw85lhlC4MGKJgMyiNr4arb4Lsq2VvoQSwoxI4jAKO7OPnWXHz2lhn39yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=osTUUREs;
	arc=none smtp.remote-ip=91.218.175.130
Received: from mta0.migadu.com (out-130.mta0.migadu.com [91.218.175.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1594606A324
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1594606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=osTUUREs
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DUdFRfw52ywOMQpo+REv/lQY3o2e9igJbUGF/Xyek/s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793086691; v=1; x=1793691491;
 b=osTUUREs8npe6SZ+FwdB8ZNj4GojFNVJGwETf0Dd9hSxyDU4PoPQohGX5OjTijckQV+SssS5
 rNOLRrcIRJ+s4VcCkhU97zM+7ZGa/YQ+ZtFseojUOZ3lrchvGr1kUa2owNPs9LjdbrvKYZ6jzwg
 6BJgYimlogXZg4rOs82RbZKM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 73a436c6b722abe4;
	Tue, 27 Oct 2026 07:38:11 +0000
X-Mizu-Trace-ID: 73a436c6b722abe4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso4034e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:38:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwbSowTHK+evG05cIf63s2ebNCQLzGrzUiEIxlderPxvdUf9HBh8QjPv9cdVzTHAPbYJvgan6OrK7+oyzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLevjoK384yTFalNIypGO6ZlVy0PHKw3c/bc8rd5QnT0SCowayn
	SpNkCgaG3ytV0kDdsaQCdhNKzADZjtxCim72clV+9sWpmU61el0PK2JajWO0UFCKOKfvwl3Cz8s
	KWye36hUyr8E/jk8hkv1rVc5Z+65a1Xx0sWzWhFdc
X-Received: by 2002:a05:6512:31ce:b0:5bf:b994:6598 with SMTP id
 2adb3069b0e04-5bfc64ebb06mr117765e87.6.1793086687794; Tue, 27 Oct 2026
 00:38:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026152639.3926498-1-fuad.tabba@linux.dev>
 <20261026152639.3926498-2-fuad.tabba@linux.dev> <at-mF3Qvq67Nh_v5@kernel.org>
 <87qzhc8ce6.wl-maz@kernel.org> <at_GYZQr1RIUi2Tf@kernel.org>
In-Reply-To: <at_GYZQr1RIUi2Tf@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 27 Oct 2026 07:37:31 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwnGzQ3ycmk+jL+Z8LKSZCBP9fy-CFvFWb18C6xb_xU1g@mail.gmail.com>
X-Gm-Features: AclHuK8QU5R1ACHMlkVCCkXbAIJslyt5dlAA4mZb-HbR610UB57AMm525lP1-_8
Message-ID: <CA+EHjTwnGzQ3ycmk+jL+Z8LKSZCBP9fy-CFvFWb18C6xb_xU1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Eric Auger <eric.auger@redhat.com>, Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 21:30, Oliver Upton <oupton@kernel.org> wrote:
>
> On Mon, Oct 26, 2026 at 07:55:45PM +0000, Marc Zyngier wrote:
> > On Mon, 26 Oct 2026 19:12:23 +0000,
> > Oliver Upton <oupton@kernel.org> wrote:
> > >
> > > On Mon, Oct 26, 2026 at 03:26:38PM +0000, Fuad Tabba wrote:
> > > > KVM can run a GICv2 VM on a GICv4.0 host whose CPU interface supports
> > > > legacy operation.
> > >
> > > I'm pretty sure there's no IP out there that has GICv4.0 and legacy
> > > mode...
> >
> > My favourite space heater, HiSi D05, says otherwise: 64 A72,
> > GICv4.0. Remember that it is the *CPU* that provides compat mode, and
> > not the GIC.
>
> Well I forgot that one got glued together. Good thing you're on the hook
> for fixes this round then ;)

Can I at least get one of those space heaters for my effort? It's that
time of year after all... :)

/fuad
