Received: from mta1.migadu.com (out-249.mta1.migadu.com [95.215.58.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D523EE1F8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458301; cv=none; b=bX16zdAxNikbw4n6vOuRn4B6lXTUtqMYkKh+A7djsceN/FIDjpaB2crdP3fUgR/TFz7+rnAJZQgdLao4+t5FbYkrVbmgzMqrVfqnl9YFb6ow3KFQYhYBge8B4U4w/CAiIXoqUG8IIHY8Z+89Kh34Hirm489EEUWK5mgMYpoJpd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458301; c=relaxed/simple;
	bh=RZDQiChJc4BLUjPTC5GATFlDtxZirW0FNEhzwWirWTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OZlECO6G2IAjavuDiKmqZdmb+05X7HW2B+tT9uZDNy/WRVZgp2dD82mkGz4YgtTtuoFKokkV5TmyYepG0aYywfqvi4n19Pb1SOrzR2C8s3Zu90MrWfjySS0V+Vhiimk9QsHvE5MR65/cOw5xDUbCMcyjgcyHWrKZ7XGefoOZYDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tGCheB6b; arc=none smtp.client-ip=95.215.58.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tGCheB6b"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RZDQiChJc4BLUjPTC5GATFlDtxZirW0FNEhzwWirWTc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458297; v=1; x=1792063097;
 b=tGCheB6b2q+bqnTXgB0hNjGHJ7aozqvhXyOUAONn7zFMXS3e3ZvTqN/sjLoBTMC2HhlCwdtQ
 N5L51nS75o28vmYT9vsoVJ0lXQ1Gy5rrmz10Gga0FO9h9OxTqq+4qF0dXfKhiuJjUwmZ7RsNngf
 bvbjreSJGsA8Co2qfdEWHqvg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5b2f9a9f57170a7b;
	Thu, 08 Oct 2026 11:18:17 +0000
X-Mizu-Trace-ID: 5b2f9a9f57170a7b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so7264e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:18:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwaCKOOa8CUq9pGyUJaufe+PVELvNKoec1odEGX0JYhmxUtsinsmhiWIMO02J2bA1lWuJB7z45XkW6ixv0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYynEBZ3wjt2l2rQladTD6FPvXTFHumjx5/I9DXGVtxbJVeWte
	9qcD5RRyGQjljMr8zah4A4s2NHEclFkrBPeFqM4odvOFxkJjvs2Hm2YqxgfFZLZQKl59sMW9CCN
	UzgeyKRNFtxNYq/hQPAS+tuAcRZfs8ulff5O6lwg1
X-Received: by 2002:a05:6512:2315:b0:5b8:cc2e:2fe6 with SMTP id
 2adb3069b0e04-5bcd41a3c42mr122649e87.5.1791458291477; Thu, 08 Oct 2026
 04:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
 <20261007073537.2454351-14-suzuki.poulose@arm.com> <CA+EHjTy_1EekD472UH=CDSpC7oksdy3eS8AP0rPxKkhQ_PyXdg@mail.gmail.com>
 <4cdd882b-832f-4968-9838-dcc29a899121@arm.com>
In-Reply-To: <4cdd882b-832f-4968-9838-dcc29a899121@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:17:34 +0200
X-Gmail-Original-Message-ID: <CA+EHjTyg7QM9+XtbQfAf77zpyNGh0rvEjMBm=mD0694Dtk=rGA@mail.gmail.com>
X-Gm-Features: AclHuK8P2lsNGbFWtbI77W6PCd57-smcbil7-006btPRzP0RGDfW9UFPgF16p5I
Message-ID: <CA+EHjTyg7QM9+XtbQfAf77zpyNGh0rvEjMBm=mD0694Dtk=rGA@mail.gmail.com>
Subject: Re: [PATCH v23 13/14] KVM: arm64: Mandate VGIC v3 for pKVM VMs and Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Thu, 08 Oct 2026 09:51:56 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> But the second part of the changes are required for pKVM today, right ?
> and you requested that here. The check as such is useful, except that
> it is using kvm_vm_hyp_is_distrusting() rather than
> is_protected_kvm_enabled(). I don't see this as a problem as this is
> not a hotpath anyway.

pKVM already gets the -ENODEV at KVM_CREATE_DEVICE: protected mode
never sets can_emulate_gicv2, so the check just above yours in
kvm_vgic_create() rejects a GICv2. The new check only changes
behaviour once a Realm can set the flavor, which is why I think it
belongs in the Realm series.

That said, my tag stands, and I don't have a strong preference.

Cheers,
/fuad
