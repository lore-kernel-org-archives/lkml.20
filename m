Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966654;
	b=0MTWy8KoxqMG5Hns4pgyQNh/ZHWYCmYJ3rPC6bBzISi4+o0/VqrZtsVgz3g6Ts+Uc/Mr
	 eu0lpv5m7lgreWgE5Qf+QlDP7E60wy9Ymwajje0A02PbkmUnrTcxpXp4yI0aPVyjPGsl0
	 48siVsS6N21gHUedZaWKJ4CbNu5tG1f/d4rFJhqdXhepiA7/wgNZm5JlnG6OwbXMg754U
	 AdPCQ1hTfhOoIYeFK+DKycSLRfD/jiWxfNJn7tnoGXM2/EmFgqv0xToFB1nHCBQmZ3YiE
	 f8+xhy80RcuyQdYqkud6SJ7P6t+XFYGRxqkwoCSvNx5118qQe/7pIRodvArv24CSYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966654;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=z2fWxPIivUBhMftF8Gk1vKGE8eRaXMmvpg6wPiGqf2I=;
	b=DXRDG2RsoStob/5lZxJ3JGquPBsDsdX1rS8wcgtPJbYILzLSlTGDCrqmVb+Wxzo4t/4f
	 ZlyauBleB/RAEI7Qqk66i/s6Sk3Hm6AP37msAQ7Tnt2OxmuWs/SUFGvpv7UJJ9f6Nq4b3
	 XkQY65O43hZk1Lwq2kqnIQkY+8jwBobvIkyK+j0dqtX7rvPyOM6HKVT1xQqkDRKVKEIZ6
	 nDpRpCWCIG+5dN+nlFaGB2RZ5t7wJUZFCssiq5MOsaSfRdDI9mRKL1xanC9HJm+M7aQZp
	 ClL92qlrAbkq7LGn1jHQzqTVvqjL6+dwutNd08qi840qnroxqbXZRD54QPAFst1qRJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tZ9r4Jzb;
	arc=none smtp.remote-ip=95.215.58.25
Received: from mta1.migadu.com (out-25.mta1.migadu.com [95.215.58.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D57B606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D57B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tZ9r4Jzb
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rj2O/1Kb6OAaGvUDXfJ6mwWrzDMaFwYbI8RyxwywtBQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793966651; v=1; x=1794571451;
 b=tZ9r4JzbuLRsjt5YpO8Jig8xPY8hTfnWa41Wedx60tBSOUaHN34aa7Y19ite+x7H4bXmdM30
 DVSbtoQztWvrBq5BZ99ESJZpfnlJ+WUSULIRtuLlFqZfNHtWK5Qh80P/H1sV3wy6/gUNC8Mtita
 DTq9jD1YsEZtWrcVSM5fPWd8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 08bd9cd49ada0a25;
	Fri, 06 Nov 2026 12:04:11 +0000
X-Mizu-Trace-ID: 08bd9cd49ada0a25
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bff701efa5so3354e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:04:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBySHmONivues3pB7dHH02jx0sJej7UU+FRX9X50zXUXnsrNGDOgXUqF4WUlcCn8biZXTQEvPWcyYcm1d6A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kECfxR7EjLhjDB+G21xI6DLZOQ00j3YtX+HoCxn3QFuRiNZMg
	ziR32A19P7xlibCGOaPchatga7aw3ly1W7vnW9mEhk56QlUEYGbRnrOMCWAAczWZ08axeDNEMgk
	HgjTtlsqOR1mBrpJayZqeQdurzxS2yiO0qwW+LFuf
X-Received: by 2002:ac2:4f13:0:b0:5bf:f1ea:16cb with SMTP id
 2adb3069b0e04-5c00641eea8mr72074e87.4.1793966645378; Fri, 06 Nov 2026
 04:04:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu> <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
In-Reply-To: <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 12:03:29 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
X-Gm-Features: AclHuK9hNEpLkAP5NVJokscwbXhyIypQ1gKGYucY4gZvymjkk3c1yRLXlhMVEq0
Message-ID: <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
To: xuheng@cs.columbia.edu
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Xuheng,

On Thu, 05 Nov 2026 22:59:50 +0000, Xuheng Li <xuheng@cs.columbia.edu> wrote:
[...]
> No in-tree caller maps into an existing hyp block mapping today, so this
> cannot be triggered in mainline.  Fail such a request with -EEXIST
> instead, so that a future caller gets an error rather than silently
> losing the rest of the block.

Could you mention in the message that the WARN_ON() is fatal at EL2,
so a caller there gets a hyp panic rather than -EEXIST?
kvm_pgtable_hyp_map() is already documented as rejecting such a
mapping "with an error and a WARN()", which is a better reason than a
future caller.

Also, please don't respin series so fast. Give us time to digest the
series first :)

Cheers,
/fuad
