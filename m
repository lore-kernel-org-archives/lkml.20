Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894778;
	b=J8HTU1R8wTue5X6mov9vgt3siIiCf1cm8X4PGVo4ZUyVK90daYkJXEztbotFmUJ6EL0Q
	 0uqzmrgyeLxlB/eU8lBq9J31+g682iOJcJuguSSmIN+AWSWAS6cEX9ZakfiAfib5yagcJ
	 1jQbJq7PxKl2KwmAgM/2Ftc7rlfZTaVf0R1qCOkg2CQxD1wT+dCdZ/gTv+QJvl26841U7
	 YfoAuLgEmmVqKIOUuD/I2dn2T9+f5EG7kR6V6Kxsg/i0uYZni5HkjpiTYfcP7kRLZdIBl
	 w9CmsJxMth8UJHswYwgJoAZmXRd8qGxCaaMz72CzG3dxkygrnq5Gr1cvbMiFix4qPUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894778;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/cWlRZ8SCFwTMb55OqToMLGSlbLAYefJerAulPP2VEQ=;
	b=vY8UMYImp2BJn0omBpGSab1MdPOmP0RnmvzHlersApDoEymkP9OZ+mOP+GwyfBTT2vXf
	 4QCkn2r6MA7k1s99fM0lZHDFa10sUUjjqDWbbreJjKDq4gb4IzZ0pAeUc7B07nJc4ml+W
	 Q2XiR+t1PB58icPMJbSKvtZaERqN+A2/mK7KZrl4x7qBI/jISR5HM4tyt0TGAmTC2egDD
	 2kn4SvRC58SOIqfUVmnBD5Avh/MjoH71X0K6hF2vQJ3OVVIGue50jWHC1fewFhd/SO2De
	 efK6aM+/C1swuHDWWMYZruBpERuXA3Ezp/BUCdXM4FaKGPQFNkWi4KYQ6EroHWPpVig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pn7Wglhq;
	arc=none smtp.remote-ip=95.215.58.76
Received: from mta1.migadu.com (out-76.mta1.migadu.com [95.215.58.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726E6606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726E6606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Pn7Wglhq
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=q1Jd3oCj3wElY/Ramn8yIWwh5Mzi3hHTvnQWrqt1nCM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793894774; v=1; x=1794499574;
 b=Pn7WglhqBntRYHjdsQbqRKyn7lHBPxai6iNEYbabp74BJ0buTkHTvlcRsdFYufNFUBCZ07ha
 gR0aM2pCLAKCkT4oXTKrbWA3gGB8l4Ctz7xVtC/wLRmglYS4m3MlkAfjemeI+wYcI1vKCkv1N1W
 CeNntVi3a8pq/wDVMBt6LV5s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c953ff68ad09f67e;
	Thu, 05 Nov 2026 16:06:14 +0000
X-Mizu-Trace-ID: c953ff68ad09f67e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so9896e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:06:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxNqaxyhHQ6LyjEJDUO90WqBB/5nhvKXocShGAPo2RNIO8+XoFWKIKX2AxXHQwI25LJGYrODxlygzf3yDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cPboqjgWgwVvjLm3ZE9oSvcTqN4Vt0CeqtF/Enxc1IqFt1bcl
	gkQlVyr5E+BxTc8gGpnzZdNiviUJWt88RczsCtowKy7VgUAittMW6UfbuUtY/EV3ntAm/z58qO3
	riixzQU0+O1a1+R4ycJj8GllWtckwXvca9V1YFUBJ
X-Received: by 2002:a05:6512:6ce:b0:5bf:bec9:aaed with SMTP id
 2adb3069b0e04-5bffabc3e5emr166519e87.8.1793894769045; Thu, 05 Nov 2026
 08:06:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105110050.1244525-1-fuad.tabba@linux.dev> <861p8z2s5w.wl-maz@kernel.org>
In-Reply-To: <861p8z2s5w.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 16:05:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyEOfDf4ynYuGz1ejE3s6R2syP4=zZMcq1oKAqFfDxCNA@mail.gmail.com>
X-Gm-Features: AclHuK9sqVJFjm0gw0BfO1w3RU0O4-fEP04HRvITK947bPe5QzS5BG9idCL7ftg
Message-ID: <CA+EHjTyEOfDf4ynYuGz1ejE3s6R2syP4=zZMcq1oKAqFfDxCNA@mail.gmail.com>
Subject: Re: [PATCH 0/3] KVM: arm64: vgic: Drop stale LPI pending state
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andre Przywara <andre.przywara@arm.com>, Eric Auger <eric.auger@redhat.com>, 
	Yuchao Zhang <ndaugoing@gmail.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 15:51, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 05 Nov 2026 11:00:47 +0000,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
> >
> > Hi folks,
> >
> > The GIC just keeps on giving. Three follow-ups to my LPI fixes for
> > redistributors with LPIs disabled [1], to fix pre-existing bugs Sashiko
> > found.
>
> Can you *please* come up with a full series rather than this constant
> "here's another set of patches" that address the same thing, one
> pothole at a time?
>
> I'm now really tempted to drop all the patches I have queued on this
> so far, and wait for the "one true series".

Sorry about that. Every time I think I'm done with it, Sashiko pokes more holes!

I'll sit on this a bit more, make sure all the gaps are closed,
Sashiko it locally, before I respin.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
