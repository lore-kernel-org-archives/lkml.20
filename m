Received: from mta0.migadu.com (out-25.mta0.migadu.com [91.218.175.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D83BFAF7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458374; cv=none; b=eL6hOpoei4CEqktKhQdhasZISfll5YwNwoLR0lDUBjvthxawXb5vmCKUgPg9OmnDiyxw73ySm9s6bDJVA4OpEOMGKmEGJwssjeJ81+812vQqolt/FA9TTvwZ6PKOC+IUMKcUNcBr2+yaK/3/wfl+flEyE9fyqv+/0tg/Q84aBVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458374; c=relaxed/simple;
	bh=Vy4gkqe2RT9fQ7P2smtTj/nepgugYBkQhIdkpt1dzQQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBFwY7+E9qaGUMsGCNYJ8ZG53dld+/YYK6S2JrOnBahAFtqQu7yH7hTBX68z926wiHj1v03hBpNxgFP1r9dqXa95vUY6k5yREdtH7K8yl9NXCaWw+efpHJcsc5N6NUGzUsjfX6eyTLKw0Q82u2acdDg63Mwfl86y1VKvfWJzVLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BtiYGz4t; arc=none smtp.client-ip=91.218.175.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BtiYGz4t"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Vy4gkqe2RT9fQ7P2smtTj/nepgugYBkQhIdkpt1dzQQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458369; v=1; x=1792063169;
 b=BtiYGz4tJMkfwUwWgbOC353UyhehRLFmj0cpaLl9C1Jz816hGOQhdWgnyL5W6c4mboVOBftL
 zQ0MBnxLMd1jvTr2drBGT/+TXXMnyXhXPrIa4cxW/n4jXpSHdF/Zpvd91qQbbqDO7yJqhMqk3tF
 uBw/r085iAstgP3ENNtekssU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ad095c6b3d68dd02;
	Thu, 08 Oct 2026 11:19:29 +0000
X-Mizu-Trace-ID: ad095c6b3d68dd02
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5947e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:19:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZyYFd4JrGLDraN+kD49izq34uEuj0VL8KHthzmwuZdMmUzY14ProbhAfFJjwWsoc7LXu/8oh3HqHmtrY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuv97fBZ16wr7wMAnvtXQZsAqUyY/n7MsTd180aezoP4y3QiBg
	kLZpZUUVU5BLlVp+HL+FpTEzaJiZEpQJuGD41W++mbcYX84GZdpS9xTxQumctwRyfgvfbQbmUrR
	2OFivLeSZwQZeooThjfKBZwo/jrqfyjCilePqwB+W
X-Received: by 2002:a05:6512:3504:b0:5bc:b531:51ea with SMTP id
 2adb3069b0e04-5bcd5895443mr96775e87.13.1791458368094; Thu, 08 Oct 2026
 04:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com> <20261007150255.1648849-2-vdonnefort@google.com>
In-Reply-To: <20261007150255.1648849-2-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:18:51 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyXg3ULW0XYkeA9P=zdXXMN7oszPiFHTYLPQ=GG3M_pig@mail.gmail.com>
X-Gm-Features: AclHuK9-1zLMDgd3KEIfnpqD4KGBnBg3Da2FUX2mIU2fGj8x9pVLP1_bf0_EVHw
Message-ID: <CA+EHjTyXg3ULW0XYkeA9P=zdXXMN7oszPiFHTYLPQ=GG3M_pig@mail.gmail.com>
Subject: Re: [PATCH 1/5] drivers/virt: pkvm: Make pkvm_init_hyp_services() __init
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Wed, 07 Oct 2026 16:02:51 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
> pkvm_init_hyp_services() is only called from kvm_init_hyp_services(),
> which is already marked __init. Mark pkvm_init_hyp_services() as __init
> too.
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

I tested the series with a 4K protected guest under kvmtool in QEMU,
on a 4K host and on a 16K host. The 16K host also requires your "KVM:
arm64: Fix protected VM fault on system with pages larger than 4K"
[1]. That testing is same as patches 2 and 5 as well.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260915091606.2111217-1-vdonnefort@google.com/
