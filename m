Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDA5522F17
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984011; cv=none; b=G00kYkdduWYgE5W+q+mFTv9YZKpqiiHNjh2xwf1UOSMOG7C3bPLg2zeMkqJ1xolB9ixqgOPg0OdlqZnHRgUxN15UOm15kqKP74rgJnVDP6vq7I7xFYcsYAnp8Af30dre1XNXWHrmmhHb9uzwEEge7IO2cYrA5T8LKRGVwlAJ80M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984011; c=relaxed/simple;
	bh=E+DMpe7t/dGxE3sBJyyEWhe+11Lj4NA7Gz+f3SNlCqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bp+OOvg8NaSZDsyDei2MOzWlVTFMt8Dz6+9c13ppm7O36xPp+ltXsNZc6hp9UWOXHU4nGsY+wdB9RKpXcA45vNPiTjGJWKpt8IkzqBmE8CCx57zS22829atd15MhKFTbk//jRV4UOLikZfkJdXDCOTuetBw9SLSzkQ8zt+k6gOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ttCwi0Fk; arc=none smtp.client-ip=95.215.58.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ttCwi0Fk"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=E+DMpe7t/dGxE3sBJyyEWhe+11Lj4NA7Gz+f3SNlCqM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791984007; v=1; x=1792588807;
 b=ttCwi0FkeBHPPztGfYXcARn0mcn0Vhbcr+ozK4POU+ndOki4jNrgZCDhd1NriMgwfqiN2JJk
 yA7rnOXC/7mpS30O7Aq/2tBhMolPC5ahWsmaiVs8xowHUJ2oRdzpp9EChUCNkkemi8Y5+krIP5H
 cia6KUSRMbbCJhgEXV1sqTZs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f30e151a41daab8e;
	Wed, 14 Oct 2026 13:20:07 +0000
X-Mizu-Trace-ID: f30e151a41daab8e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so30778e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7D21vWk9JJ+yFcYX5R3YTaF3T8yrgKJE/iwAZ4iZjHWbC/jyOkCHox+r4F1MbnvqvSlw2tgcFtZV6q0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDAVO3OiFjmzTw9U3ENdmMrmtQxEdyLVtRnEZmkSrYM8n4VxhP
	6zmRQNLrVjPCi+S6PEFRiEY051Uem3Z0X4fLMgSWGwdF69sPuwzNJCZ31WQowGb+/2fdluNCxfV
	+F0lsEDF0wGGJ6hc2xqiWWVKzTVMilp9z9T09zxyo
X-Received: by 2002:a05:6512:39d1:b0:5bc:ed54:d5b1 with SMTP id
 2adb3069b0e04-5be35cbd990mr74741e87.14.1791984002197; Wed, 14 Oct 2026
 06:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605153248.2412064-1-weilin.chang@arm.com> <20260605153248.2412064-3-weilin.chang@arm.com>
In-Reply-To: <20260605153248.2412064-3-weilin.chang@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 14 Oct 2026 14:19:24 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw=vMvvmoQ==6pGDZb9Y3rgZN6Bg29cOoYAjhmK-eTQwA@mail.gmail.com>
X-Gm-Features: AclHuK-2zxxhToktFj1rc-j8CjjTBanqw9vP7b14CdsYAEhgF95q11O9e8ZWNkE
Message-ID: <CA+EHjTw=vMvvmoQ==6pGDZb9Y3rgZN6Bg29cOoYAjhmK-eTQwA@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Remove superfluous aligning of gfn for
 dirty logging
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 05 Jun 2026 16:32:48 +0100, Wei-Lin Chang <weilin.chang@arm.com> wrote:
> Stage-2 mapping size is forced to PAGE_SIZE when dirty logging is
> enabled for a memslot, therefore we don't need to align it down to
> a possibly larger vma size or THP adjusted size, they won't happen.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
