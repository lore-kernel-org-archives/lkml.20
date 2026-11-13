Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568452;
	b=HL5j37/LR43OGnJuvyBfYgDCu6yS9igHolxcPK+cqVghoOBsHNoAXy1Q/4LiaqI9kG8N
	 fbT6IyCrQ+nsXSx3ao06bOsgFvWuaC4HuHtLZ8xaM/x5RL8BXWrxoLBTAnOUlLFHpCfVU
	 ZFOumIfpcsmu/UIt/TzmQkwU0gZzUhETbjuqAYfCTz/JyucoFh4RprEhb+cqLSgkTeEcr
	 Epq4owdHfJRjUcNQBv/55JdwLZDFY1wmONE6ZNpAtejXnTV4BDXwUXdcaAlUVxGB3Rpsl
	 JUy2ogwk3SmOBypy2g2tGjyvAZCnoBsHkzSYN8O+mHuZf4Ec9LEOpT9BrMuf94fw2SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ezeDFgt+7atYRovKBFaoESCiQDt0qKhUHXV+O9nHsvs=;
	b=pNpo4YCsfDpYB+rUFXlMDkJ0g/uACPhuqGRZ/R71VNUqj4I+MeevhPB/ETqjgVZr+cF4
	 ryQYOm1bwk7v2WDnoT87lZQgU8MQuoFy5Xkdnd36rhlWptoIgW/eercvsG2XddJJgwx4U
	 zBSdcYqPFzkhBwFZVSptX814lXmwWuUAnlsQhGK0/cKjnQU8x3x5qjdKzthM3k6dmX7rS
	 iC9qZUFkO3z3VHpxSMtJSXHzrn0migC+EDraaNYzJ5EI7D1eDVRr2lPJ4kYSm2+FK0P27
	 2+fLfWc5UV1PrR8OwRiQXrU8GWmeDSn8Jl6XmwXwQArb69P+QXAXqAL3bje3qxSlNaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A12qJRHs;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF01A606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF01A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A12qJRHs
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cddc4bde4adso337954a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794568451; x=1795173251; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezeDFgt+7atYRovKBFaoESCiQDt0qKhUHXV+O9nHsvs=;
        b=A12qJRHseNOEaZYx7qBqIgqcM72XffvjFu773eJzQFdnDXjLpWlbsW65cLMMiylJUC
         5OJkBoZgGBcppTv0mukKgKItiPpleXt3HDGGYgZtbFDM20YjJ+4TU+SVd6ya7C+lTpV+
         02q++QeyNAK8alM2Qy12Vms74lJeZ6llIWGvHkOgF6EpDpwwcmNBYLh5MknmvbTyC7/K
         kDqi/zZRhBREu/AGckP00Anj0d1sxzxMpr0oL+HoKoDKsgwEGYmcjFME8uVi/87r2HlN
         1r72D0fAksCrahsOYS86wIcJMh+3Oh+pigF7QAPQEF5lbcL3OoD++vz8qgo22mOLDROr
         l5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568451; x=1795173251;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezeDFgt+7atYRovKBFaoESCiQDt0qKhUHXV+O9nHsvs=;
        b=GG35veea/wupqtuoKmjJjMiaHV/CB37FM0rt2cdeO9gZIGjgitxPjC4pCCuftld82j
         e5fFBmPnkO8nGlWUhAR204ZPcpS/iRAqm7ch+BGPrDWUry4Ml3jMYGnK8SPCxfRJGOsn
         uJEJMm8t0lyI3mo0bMTf1hLpcMxydoCDuxCpiTrcEythaSPZZG5o4zYUm/flI5nGHnbx
         dbTHwzA2eODJi2/+PrwdtORNFzOAJ/g3KBmevJEjBgU3bJHZ5uKNoNt76kM9yEX4QxOj
         GW03/EQ2APyV0brEM5B8Tmisghd3Ya14EgIXmQSfktfnUmI9kOaO8I7Hp8cxj6EidU7q
         ZLwQ==
X-Forwarded-Encrypted: i=1; AL+hErF19k0EJ6Ta9K4wQzC1Vaf85V7dUQOaNawbNrsVppIimxjbxxEGQW4RyzkTD7jsSsaBdYWyE52aoVW+tEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jzABrR2Yh+8NM86OSpVKm5w2AvVQlyMS7SmOGgnGMxDDnxqpV
	IfaGph86ClDwBmde7GlHVch/Xe5V1y3+5uwiAti6ZB9ychUVq2UUVnGeRqzOq1PL0fHPnuPDqEE
	6eoYbhpnW68808UvT75bOYA==
X-Received: from pfhk7.prod.google.com ([2002:aa7:9987:0:b0:8a0:941b:f002])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d043:b0:3e1:dc9a:56cb with SMTP id adf61e73a8af0-3f7a72babf9mr1889436637.17.1794568450840;
 Fri, 13 Nov 2026 03:14:10 -0800 (PST)
Date: Fri, 13 Nov 2026 19:14:08 +0800
In-Reply-To: <59c577b6-4749-4edc-9dd9-a83f2a124adb@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261112051542.1539779-1-stanleyjhu@google.com>
 <20261112051542.1539779-3-stanleyjhu@google.com> <59c577b6-4749-4edc-9dd9-a83f2a124adb@acm.org>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113111408.3567353-1-stanleyjhu@google.com>
Subject: Re: [PATCH 2/9] scsi: ufs: core: Defer link recovery on reserved PM
 command timeout
From: Stanley Jhu <stanleyjhu@google.com>
To: Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bean Huo <beanhuo@micron.com>, 
	Peter Wang <peter.wang@mediatek.com>, Can Guo <can.guo@oss.qualcomm.com>, 
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>, Hongjie Fang <hongjiefang@asrmicro.com>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, HOYOUNG SEO <hy50.seo@samsung.com>, 
	Brian Kao <powenkao@google.com>, Jens Axboe <axboe@kernel.dk>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Stanley Jhu <stanleyjhu@google.com>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 12, 2026 at 07:19:32AM -0800, Bart Van Assche wrote:
> I don't like the approach of this patch series. I think this series
> changes much more code than what is necessary. There is a much simpler
> way to fix the issue reported in the cover letter: instead of calling
> ufshcd_link_recovery(hba) from ufshcd_eh_timed_out(), remove that call
> from ufshcd_eh_timed_out() and instead call ufshcd_link_recovery(hba)
> from ufshcd_set_dev_pwr_mode() if the SCSI error code returned by
> ufshcd_execute_start_stop() indicates that the SCSI START STOP UNIT
> command has timed out.

Agreed. Recovering the link from ufshcd_set_dev_pwr_mode() is much
simpler and avoids adding new driver state.

I have sent v2 as a 2-patch series following this approach:
https://lore.kernel.org/r/20261113111202.3551341-1-stanleyjhu@google.com
