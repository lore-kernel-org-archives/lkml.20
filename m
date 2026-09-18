Received: from mta0.migadu.com (out-112.mta0.migadu.com [91.218.175.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A9E4848B0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716178; cv=none; b=qIFa5T8AsAU06SkOHgd7Jrjb5eMTB8ARVRwD1QF5QSqrn0PX6IwYvX/8gu9OyhyBYtJe3kMWSlBzk6vcPdI0k794c1eDEuujOTWvOBALubbq+BNk8PXXTDLHxtBxj62O6XMoLbaY+ZeihqZ/YdGi3rFbebU+1UxTjmOvjd6kih4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716178; c=relaxed/simple;
	bh=dNme8uRIYN0dXbX3fo0hsH8S0MXXz3OARTVkTdVwCds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6kitrDoMATj1SGuBE5j9pSdmXzZeN0E/UW3kGSaBGFlJebLusO9fBsffKCQan7L6NJuMOTBktsPeK0YsSvxrTm1C3aywr4YgoOclZ10bznvn3+W75gF8HnN4WY4hSAHEFdUkqkl3juVMEGYal5HgoDnSLun+KpHcixcvq87IPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J30uzKDp; arc=none smtp.client-ip=91.218.175.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J30uzKDp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dNme8uRIYN0dXbX3fo0hsH8S0MXXz3OARTVkTdVwCds=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789716174; v=1; x=1790320974;
 b=J30uzKDp2ekhtVdamqJZGyRIQH/5EkrhKFohPp6uXNHd8PKzDcQTqEkZfS5P/PW4wZf3AQe+
 PCPkZw37H6k8C3Y8UfxzKoE0t/KpSzIpOpIvn6Hzrk6cSlIvwPB6IUXIa8JJhUpR8FLnHUGAZva
 Im8GAQe4Ppq30BDF//rxulCU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2a2d0cbe8aec2a5b;
	Fri, 18 Sep 2026 07:22:54 +0000
X-Mizu-Trace-ID: 2a2d0cbe8aec2a5b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b8c42da963so336e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:22:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw92e4wblKKL1A6HE9AkSJHIdH8G2yiOSRiYVYsQ+lARDyDjUW9tKOjkIGmbCaP+klD7q3YjLXJljoA2xc=@vger.kernel.org
X-Gm-Message-State: AFuF++n2U/65MEaYNrIrS0ukanY5G37DqK7tiqrZ5zh5QagyX6Yvodk+
	IF5A+j95SoSvcHhgi9dUAAbvrmWKqQRB7GnmV9C8q1bYN3uQKMg7RjxkId/+l1F0GV+FWa7eQkQ
	l6va2dXEv2dCC4vUErPum8dnACKPN+dn8/M0wLGUR
X-Received: by 2002:a05:6512:2344:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8c101ffcdmr104708e87.4.1789716168414; Fri, 18 Sep 2026
 00:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918040214.85580-1-ndaugoing@gmail.com> <20260918040214.85580-2-ndaugoing@gmail.com>
In-Reply-To: <20260918040214.85580-2-ndaugoing@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 18 Sep 2026 08:22:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
X-Gm-Features: AcwNN1VwD5DsYs2cjOJY92QTdxd3reBSIUtzU8JUmsF3mGfW8sf3G3EvUGgiBaw
Message-ID: <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: vgic: Do not remove in-flight LPIs from AP
 list on disable
To: zjamg <ndaugoing@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yuchao,

On Fri, 18 Sep 2026 12:02:14 +0800, Yuchao Zhang <ndaugoing@gmail.com> wrote:

[...]

> Note: this closes the primary race (the last_lr_irq node itself is no
> longer unlinkable while in-flight), but the fold traversal can still
> race with a remote flush unlinking a subsequent non-LR node in the
> ap_list tail. Fully closing that window needs the fold side to take
> references before dropping locks (in the spirit of the prune-side fix
> in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
> interrupt affinity change and LPI disabling")) and is left as a
> follow-up.

This is the same race Hyunwoo reported back in June [1]. You might
want to have a look at that thread first: Oliver and Marc's view there
was that the fix is to take the ap_list_lock in
vgic_v3_fold_lr_state() [2][3], and Hyunwoo posted a draft of that
[4].

Cheers,
/fuad

[1] https://lore.kernel.org/r/aiHrGM1f8czcUby4@v4bel
[2] https://lore.kernel.org/r/aiJi5a3JJ-TbWL-s@kernel.org
[3] https://lore.kernel.org/r/87a4t99z9n.wl-maz@kernel.org
[4] https://lore.kernel.org/r/aiXvwGD1hS6vwLEd@v4bel
