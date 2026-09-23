Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9FC36B90A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790149212; cv=none; b=TQsW2waRhLqhdWvVeA12pNspgomMOTQGKNDItfd/u8ByHdOnSjRkMHYEi9SD36taLEsAUyuZOWZmY2dz1BBXQKre7dHreqU94mtlcMk/2+PjCICuuu80Ae/e/njZ39WHT70h26iWpfTPd5pZkcHPX1d6N+GzXYsekW/YKvFxF20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790149212; c=relaxed/simple;
	bh=Li/7CtQT9ekhb/rzTQeU0eAMCKM+r3+9eXDiZG06pV0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=adOD9BlGZKe0aPQQFZlZHUGZBtA1mBZVVc/F+r0UdtRJU8mwIy4HWlZkZG7iEaTH7yyeoS158FV1/z99sqhCxpJZO0AO7N2z2QdLkCExSRu5o9hdRLyJNxPfaf2hvOfxe3L7Q19uwExXfmDLI44aYZ8nLL2lN/kVNtEnOSy+O9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=e+Zed52s; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="e+Zed52s"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=Li/7CtQT9ekhb/
	rzTQeU0eAMCKM+r3+9eXDiZG06pV0=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=e+Zed52sFs1MQhswBlULyyhS2wxFpwwD6DmHL
	Kdx5wffvjxDThp6IUMki2uLx/J3ZQ3InYVtukhdxOpdu7pq9TnRPT7GXZbmfUIwD9ECBGV
	e5YaCjF5OaXZFdL+c7P62gi53t27r885zhjQvg1rwGWx7WOfyQ78dTKGlcY140+LyUz46T
	21bKs2RPW/cj2rnFwJyoRD/TQu/tUwUzGv20GYtjfAdTuwmvrYNHxi1wCzaPwz+RXveGkk
	LSBFn1xao3GYrqB8ZMlObyVOFMZzUyDffrA0/DjbpyICphiQataFCtbUR4f99qCJPbqiPB
	ZoLLnWpPrmwoHpy334RjbtwZg==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 58c282aa (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 23 Sep 2026 09:40:00 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 09:39:59 +0200
Message-Id: <DLMIXHATYR90.4RUG08AMWH8U@arkamax.eu>
Cc: <linux-nvme@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <mlombard@arkamax.eu>
Subject: Re: [PATCH v2] nvmet-tcp: fix stale comment on NVMET_TCP_MAXH2CDATA
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Ing. Alfonso Kuen Arroyo" <gerencia@idkmanager.com>, <hch@lst.de>,
 <sagi@grimberg.me>, <kch@nvidia.com>
X-Mailer: aerc 0.22.0
References: <179013720383.9364.11263428288753603011@idkmanager.com>
In-Reply-To: <179013720383.9364.11263428288753603011@idkmanager.com>

On Wed Sep 23, 2026 at 6:20 AM CEST, Ing. Alfonso Kuen Arroyo wrote:
> The constant is 0x400000, 4 MiB, but the comment next to it said 16M.
> Use SZ_4M instead of a value and a comment that can drift out of sync
> with each other, as suggested by Christoph Hellwig.
>
> Noticed by Maurizio Lombardi while reviewing "nvmet-tcp: report a
> bounded MDTS instead of "no limit"".
>
> v2: use SZ_4M instead of the raw hex value + comment (Christoph
>     Hellwig). The file did not pull in linux/sizes.h yet and had no
>     other SZ_ user, so the include is added.

version differences should be put after the '---' separator, they are
not part of the commit message

>
> Signed-off-by: Alfonso Kuen

The mail is missing, this should be:
Signed-off-by: Alfonso Kuen <gerencia@idkmanager.com>

> ---
>  drivers/nvme/target/tcp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
> index e598101..000000 100644
> --- a/drivers/nvme/target/tcp.c
> +++ b/drivers/nvme/target/tcp.c
> @@ -18,12 +18,13 @@
>  #include <net/handshake.h>
>  #include <linux/inet.h>
>  #include <linux/llist.h>
> +#include <linux/sizes.h>
>  #include <trace/events/sock.h>
>
>  #include "nvmet.h"
>
>  #define NVMET_TCP_DEF_INLINE_DATA_SIZE	(4 * PAGE_SIZE)
> -#define NVMET_TCP_MAXH2CDATA		0x400000 /* 16M arbitrary limit */
> +#define NVMET_TCP_MAXH2CDATA		SZ_4M
>  #define NVMET_TCP_BACKLOG 128
>
>  static int param_store_val(const char *str, int *val, int min, int max)
> --
> 2.53.0

The change looks ok to me
Reviewed-by: Maurizio Lombardi <mlombard@redhat.com>

