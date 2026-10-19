Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46254CE69C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405111; cv=pass; b=KofN0qrDRCf8nT+uHk0oMw1f81Hs6qIEnmPEy111M6/rSD1Q6v+6ksHC/cxkTM1l2A91viCh9llXNmqtmRDe8+dz7JqkJ/xALMNJK7tfhYS/ABqK7a4qgiXHcXVTNJ5kmYHrPn0l2KDDdSGEI+Ci9y6hDkTQS3cCxk6L06f2qY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405111; c=relaxed/simple;
	bh=0X5plGkx2cbkG2CtOVwpU5mD1drTa49dzUT6iJzQz9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZMu1Hz57TxWxa/wH/jPeHv7DuPbmRm73EV3Gw69hqGC83wu4y1TqnNb91WckxCcSuoERaCyA9hFzBdFLhDFETmmZ56T1u6+QuvoInQ58xQqEG1xZ7w52+nQrXUsZ3zscviXifEHZAeQmUddERfUEFFV96n6NA/qhWoKTCtOXeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b2nXhieO; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b2nXhieO"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso1711188e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792405108; cv=none;
        d=google.com; s=arc-20260327;
        b=UdZwVWwngjj2mF34bN4jaVdBzoV1VJA7JR9aeULVOfyEJ0sXCXF6ziuxFsHdRhS2TD
         69qclMq4Rl1uyXuu+l2maF+1/kfaZL7YUhdoFcwMRmtYVYmx9g1c0gewmEIA1sXDSrTx
         t9kogPHxn563yfuPpjyZncrLQw+SlXq3MRJN3gmqPmakMHTp/PnFSxjAdWHC9gtg1c8m
         wmNc9eyV1wVOUiLn/VAdBtEQzrgnp0PaZaGeG6EhAl4hm2OurWk/YC0uXrneFN8ClKCs
         wrAEUght9GozwjzLX8Vl13XvrpvHcyev/k/BN5YYgBNyZTnncEnvkTWphS7TeuV59OJ4
         F2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0X5plGkx2cbkG2CtOVwpU5mD1drTa49dzUT6iJzQz9I=;
        fh=+BB/0ISP87zB1oWdJHcnRPquCI+JfxnL2n7oG0L775o=;
        b=hOko1asBpDwSyLOHS4CZDkklsibp4niVbPL701L66MNktPKtm3rEYW3muQDYKJGuST
         sKKLJtdbSzlsRrvNrMczuN1gE+0cb671NAYep/h/ADuUSz83CJXm1ItxR/ludx6DDqBa
         4kSauFN5r7vfixpDsJe91W1m189+UrVZtGB/ZNDQoE+dhDcOhO/WP3Y4RdSe9gGTKF2z
         hCGiINiT7NisTWVS7QuMAkybDvLusepUacIP8oSeIAAAnIplOVHpSS/46aYh1IJWD1M9
         xYR3FAGGgVJsMWWpcZWOGPVTKZ3PpyvhzsVw5xaRs/DTGuX5o6bbHv5xoRm+B40v1xWc
         gc+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792405108; x=1793009908; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0X5plGkx2cbkG2CtOVwpU5mD1drTa49dzUT6iJzQz9I=;
        b=b2nXhieOHRHMFL2rCXaJWL4epOElrY/WUDVe98SjLp/NKrjr4E89Ha/Ro9wT+O/hrN
         +dPfhRTEZ3MV+FeUUtzaRN5LiX4aLMRGJm0qWpCj3F21gZEIsgbO847vUwNxuJJb6meR
         R/fG2E6htgqJaEnwXsGDp0co+kg7OI6qjP+98UVbBO97PyiO8JUQdtSejkf7ZRC/uO1d
         aj1lt49vreqxahyUT5Jej6Tuymrp87uKZQvOPNXXgQKOZOATiuZoaX+y/Sble5jP0QP6
         Jujs1g2g/6GtLEPQMJfKJVSnQFI28wGvDN8NdAw+IBAfnDB126ApF1IHICA1xrql/Gbq
         Nsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405108; x=1793009908;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0X5plGkx2cbkG2CtOVwpU5mD1drTa49dzUT6iJzQz9I=;
        b=1AF5xK79zpmvwgsWQNjW1zk6/JdrZyjH4SlWBijkcz+0RbrJzgGXV6bESyRfBMGaY8
         hD8Z8yGE7f8UgEO3yj26csjqvAW/335+JgktPTVQpAdGBiYMPoh8/UCJUENuCxRc9Y6r
         TgLL8yhSPpoqrMxUV7ipxsk9FOMXVkkpQms+5HVX3NDk3tUHB1MhS8kD8pqrKjet+1ws
         Sda8DGplacTkhvfCFxVXBNtRCnOzdp0IuNzHKvhXt9vejIt9OHQ0IFZPJDDXoZzdN8R+
         zQ+5FWKl/NMqnYqtV9JQiQcH5ae2S8pqE2ALaAOXhWHmjtYY0pJuJhN/HwhOb+w6Go5Q
         6toA==
X-Gm-Message-State: AFq9FYIM4jIAizIqcck5yLcNaxt83l+99wTqLDU+mwokm1MPNFcrIZoA
	pxuWbmYJL2SeTag7Y5vq4ndzxCWx9NJMJoQyo7a5N/SOmuqauV9lo0NCXl8SoVWnbLx32C6SR15
	byub/h289JROKuAe4e+OximsztIzg21CCDN91Em/8UA==
X-Gm-Gg: AYBFou3Y0TJ5nacKbZ/2slT4vPPm35ysRhyPvllRiFZylZiox1g7tL01mUQSfirDtQo
	aiVrGSTpieacn+RhpOp4ARFiOg3frsj7MuCkj0sJOt5jqN0JOIRXjIBxW1x5ep5Qc6vCuw1dNMR
	it0i7Q2piCL09HDf5RkE8T2jKT67CJA7zcQrKGV9PYCoArKT3zN4tslFqWQ4RE8tobraY2DztE3
	zszRPQ8WCpkhRMyOvwhDWQi6WD7ptsjNIqJ7dV42YzAw7gLfSS3gP9M3uS1sIAeIYLBK83XaRg8
	LkjjROfWQHvpRysbEoT0Mu4VNHeO0udG4xGhqwPK2b784wDqDkNsif4jCHp3Hj2jjW6D+6lKMjt
	7vXr9h1XhxjkR
X-Received: by 2002:a05:6512:3b08:b0:5bb:7b64:340d with SMTP id
 2adb3069b0e04-5be50a73dbcmr2180517e87.28.1792405107931; Mon, 19 Oct 2026
 03:18:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012095452.135828-1-marco.crivellari@suse.com>
 <20261012095452.135828-2-marco.crivellari@suse.com> <de6d786b-fdbd-42f8-b2c9-b175a6a33c69@linux.ibm.com>
In-Reply-To: <de6d786b-fdbd-42f8-b2c9-b175a6a33c69@linux.ibm.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 19 Oct 2026 12:18:17 +0200
X-Gm-Features: AclHuK-BUw_TxfB1HhBk8jNSN8MxUezMM1hmofzvTqK6-PRot3PI1mJ4gMma7qc
Message-ID: <CAAofZF4XMmr9ajA=W7g4EHOSy8C_GRR1n_aK+BXTgM60onFVqw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/6] ibmvnic: Move long delayed work on system_dfl_long_wq
To: mingming cao <mmc@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haren Myneni <haren@linux.ibm.com>, 
	Rick Lindsley <ricklind@linux.ibm.com>, Nick Child <nnac123@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 11:20=E2=80=AFPM mingming cao <mmc@linux.ibm.com> w=
rote:
> [...]
> I walked through the reset path and the conversion looks fine.
>
> All three system_long_wq users move together and there are no
> remaining users in the driver. The work items don't rely on per-CPU
> state, so system_dfl_long_wq seems appropriate here.
>
> Minor commit message nit: ibmvnic doesn't use mod_delayed_work(), and
> one of the conversions is queue_work() rather than delayed work.
>
> Acked-by: Mingming Cao <mmc@linux.ibm.com>

Thanks for your comment.

drivers/net/ethernet/ibm/ibmvnic.c uses queue_delayed_work() and as
you mentioned one queue_work(). The workqueue used here was also
migrated based on Sashiko's feedback received in v2:

https://lore.kernel.org/all/20260711164434.1691221-3-horms@kernel.org/

I will keep your Ack for this patch in v5.

Thanks!

--=20

Marco Crivellari

SUSE Labs
