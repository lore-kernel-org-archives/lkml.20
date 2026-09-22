Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491784C651E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058228; cv=none; b=oK9euKU/+9jZzWhqxIG5mD7lqpjtnxrkuGFzxRR7AGRVQFG7+4WQX0bUgkbZXWX+2Oc+zAKAJ9FOtBBgKaw6CcQPqDit9rFfCoI0xsgkBGJFnVa/4rs+66MAmm/eaLkBshXZXCYUOJ63/qjGewiOezfXNIBfwYT77yzv9Y7vaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058228; c=relaxed/simple;
	bh=+W/+qy8dN82JRqL2/6riw5tyqhHG1BqM+2TpCeDV620=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=m50FIzO1lThU8edcf5q/ed32C8JM0Z6Un2tKNVRzNoA2g7WsEF7+BvwE9JNKxqHH/9LsSZOSpMchMTKOnPKE9m6TaLiLMV8oUHLuo1Eb6LgqWvz0gDS3Je6TGUGdm/8qgihFeEKpPUTvf6MAIOnTVMBMwIgPvzdJq/gR3ONdk9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=Jh8Br0IK; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="Jh8Br0IK"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=+W/+qy8dN82JRq
	L2/6riw5tyqhHG1BqM+2TpCeDV620=; h=in-reply-to:references:to:from:
	subject:cc:date; d=arkamax.eu; b=Jh8Br0IKuk5d+X6eCud/s7LhzjRuiOfJ1N8Fp
	3GdorYx2rTlmic/RripSkWlJABBfA8zvv67X8tDbs06ESw5U9TML32h1+XWbV9hK9yB+4g
	7ZnA8AM9pzX/VtnhAn4j0748vgpsStDH1R2+cuoARNGrjthF6XSUljQHhTUldVVAiTCqeg
	N9gZXss/PN2DW+iEcg2ZgiT8M+2UFy5dv16eiDFZZXuAz7SVVcPtPf7rmLWC9D147sdTmO
	jU2wbS2npFhontgZZjVriDMCCZsq8GJM9+1hcZ4psMN3v2C0BmlUWa5MRbPadkfVXq13iZ
	bnjBlqePZqHu4sZVVs+6iicuw==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 8e6623e2 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 22 Sep 2026 08:23:36 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 08:23:36 +0200
Message-Id: <DLLMOFXNSI43.22DN54SMA5U6L@arkamax.eu>
Cc: <sagi@grimberg.me>, <kch@nvidia.com>, <linux-nvme@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <mlombard@arkamax.eu>
Subject: Re: [PATCH] nvmet-tcp: fix stale comment on NVMET_TCP_MAXH2CDATA
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "Ing. Alfonso Kuen Arroyo" <gerencia@idkmanager.com>, "Christoph
 Hellwig" <hch@lst.de>
X-Mailer: aerc 0.22.0
References: <20260921065448.GA13764@lst.de>
 <178999815960.27132.5021907314171265355@idkmanager.com>
In-Reply-To: <178999815960.27132.5021907314171265355@idkmanager.com>

On Mon Sep 21, 2026 at 3:42 PM CEST, Ing. Alfonso Kuen Arroyo wrote:
> On Sun Sep 20, 2026, Christoph Hellwig wrote:
>> Maybe use SZ_4M instead of having a value and a comment that can get
>> out of sync?
>
> Good call - that also gets rid of the case Maurizio flagged (a value and
> a human-maintained comment that describe the same number and can drift
> independently). v2 below; the file doesn't pull in linux/sizes.h yet
> (checked, no other SZ_ user in it), so it needs the include.
>
> Signed-off-by: Alfonso Kuen
> ---
>  drivers/nvme/target/tcp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
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


Looks good to me, but you should formally submit it with subject "PATCH V2"
and proper commit message.

Maurizio

