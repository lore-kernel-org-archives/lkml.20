Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299201;
	b=xseEI5cMOh4b4rkm2vJPdiH6CspoBfvX8b5+7YUtZAxedvkchKlXKlCqlql4QVwU6Lwu
	 6F0u2oNRCxaXMDVCXJ+Wxsdx9nQi6wpRQqcvLdVPyr16osnAIHnuZaX9gK4fPbpwQCYgT
	 PJwLL3y3mR2JpiJkJbny5NV9oLfhCdnppN458xA7z0YA7I2Bdi+OuWu9GVX3kyixqmbiA
	 g5iB5KCNfTe7aQCXtasOpPYH7W5VCRo6YDOodQDzHty6xWMZdZVdQGlabdjYmJPr2JGlY
	 p1rBaLeCb2qq5jSecBroBVgseE1DFnTMoaTrez5behuDmikJg3ybm7Yk8jwoqs8Zf8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299201;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=P8sAw5ur2lstKWkCV1NN3TteySnzETKS77xqYaYoeEY=;
	b=OsTi8LLsZocjZD5MXuqBaHBM5RTaAdmQ24je3RbghjQ3HvYuHnsVgfchrVxc1VaZUpYV
	 fCRLZSVDHRI5lvyuHbeJ0a6kwOtRWmOLf0P8tGcKh+KE16SKRx/WkQ7mADl9VIYm5JRm9
	 W4mzZskGsTXTXqqrklDLHH4r5ZBqtJnnBjkc7QP3ZKhSOkf8mK0yg8c9dtRrqHpk0CJW2
	 axIpWLYpIXoPBYu0zZU63IgZoxAtri3VqDUodcaKmljFgzFMQ9DRrAdqpNFCvV2IqEKxw
	 w/FWzlBq+iH7/bmBcSLsrt+2/FcTxrOqc4MAqs1oK4Bv1bcHNqXrGjUP1Jfojt4UOjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WCpqSXza;
	arc=none smtp.remote-ip=95.215.58.164
Received: from mta1.migadu.com (out-164.mta1.migadu.com [95.215.58.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B1C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B1C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WCpqSXza
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=P8sAw5ur2lstKWkCV1NN3TteySnzETKS77xqYaYoeEY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793299197; v=1; x=1793903997;
 b=WCpqSXzatA4sEQkTecMu8mByEXeqhAj7cth0a2CfLSQlqgXMlzk71VxHC8ys/KYKcVvEYoH8
 PNMeDMRfXGcZF/wqWirJBJLx7luZci+8ijHKVcKz8XOC+7POdPldiToeD47uTs+9yf1HnTnMwEe
 dX4ec7cmGXYmIjjZBMAylYz8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e2d93823c1ecec2;
	Thu, 29 Oct 2026 18:39:57 +0000
X-Mizu-Trace-ID: 4e2d93823c1ecec2
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so1348e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:39:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5P7szpIy8eLVXiKTEGLQlLo2HUvCjq5XBO7ruuMncD/0/6bYYfoEsPKikXE9Img14WPjIhASRPYCfRIc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGeR1AVJTlV/jb5o4xzhMwhFtV4TCRelSFcrfSnN8w5DSaQyEN
	qo/9EJ69MGTZsFXlwIZydBgCSZhV3sxecvCT5RnRJXmL/OkcpY7h4Aky9iaeDYTxAJtDillTKxv
	5n9WEruHiVVcG6Vj3BA1JaGtR0Ya+vjqGtzN1xHcI
X-Received: by 2002:a05:6512:1383:b0:5bf:cea4:4150 with SMTP id
 2adb3069b0e04-5bfd140feebmr228838e87.5.1793299192378; Thu, 29 Oct 2026
 11:39:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029175238.3214788-1-weilin.chang@arm.com> <20261029175238.3214788-3-weilin.chang@arm.com>
In-Reply-To: <20261029175238.3214788-3-weilin.chang@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 29 Oct 2026 18:39:15 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzBB05GZdz6be0uqHFs7sK1879yBVDJrEqKrTtM8=_Lyw@mail.gmail.com>
X-Gm-Features: AclHuK_Wm_aye4dCeSRhGryTZlCEP8KkPO9b0e0oBdSMGn1JW0SmL7sHjZoHOTw
Message-ID: <CA+EHjTzBB05GZdz6be0uqHFs7sK1879yBVDJrEqKrTtM8=_Lyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Remove stale remark on canonical IPA alignment
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gavin Shan <gshan@redhat.com>, 
	Leonardo Bras <leo.bras@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 17:53, Wei-Lin Chang <weilin.chang@arm.com> wrote:
>
> Commit 3b8ce2b5132ae ("KVM: arm64: Use a variable for the canonical IPA
> in kvm_s2_fault_map()") created a variable to store the canonical IPA,
> instead of calculating it when needed. It moved the aligning just before
> mark_page_dirty_in_slot() to an earlier place but did not update the
> comment.
>
> Remove the stale part of the comment.
>
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
