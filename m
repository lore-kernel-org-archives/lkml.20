Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36A83C13EC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788114553; cv=none; b=ju89mgrMvgYwagRIASxR8MUGb8Qcf5WUIaPUj1fa17JX3f/VK0USj+P2aJRK15YXGr+/bjm6w8FJUII8GxxSzL8fzB80QgkoezPolxSzYPKAo79ohHpltxKZ8JB/lFmcHd9277i64SR3K8YeKOeHqJiCoj+K+xthN5Up2l9D7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788114553; c=relaxed/simple;
	bh=9NKDnSEWfPvKPtUsA/Wf/uYwNlKYFsZ8Y0VhVrZy9KM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I8CFSCYOfk0NBnlltu5AHtD7BRlWKZnb2ILcrHn6v4brqB3l/X9GMsoCXyh/ZRgu/+cV/9AOEKqHJZK3/TB0f8o7ISPbP6OcDoY1ldN0yDOX0AxSdki8P5+QQTAiHsawiayNlXpAlX9PK5CaBrdfDrJKXedKoIf2ubKQzyIgWDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYkHBna8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYkHBna8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso26142375e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114550; x=1788719350; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Ptf7lkzRK2cEQa7tXSLbtyDvUDpbM17dkTmOc5wvcM=;
        b=NYkHBna84dMwXwcWaO6eUatLipedsBp/SSvLivwWHR2urS2QxlcpIo5ptWpFS+ulgX
         ZeZ/PEnrCltO/iLCv6gP3Amw3B807ZN+kCHB5sbIi5VyzeTKGP3RjL+Ksp9j4zaN0O2D
         DI71T2BWqdDJzNbFjgHudIytYWLTJphGx9Vrpejd/h/BV1YqV8DF4fBh8NVPWfQTfqZj
         ajix9JtxC5p/D+61A3txbAEeLsKTwfH1bm9oB9Pa24BxJjmYJpMTkVLmdFFvmsWeo9oa
         mG6lIIuQ+ii2gckr2FTUjlX178q8EXDejGc/XITj91+9WemyZDdkluIYnylK4s5b5VSJ
         OWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114550; x=1788719350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Ptf7lkzRK2cEQa7tXSLbtyDvUDpbM17dkTmOc5wvcM=;
        b=CzWMu0bc6GLuBiOrkkA1loSBItgvtykS8bQkew8WokgG5DxsT3lrPXW1NBMaMsQBmj
         OucyEH0Tcn0LzEFXx/JYqkxQRr9QCbQVVXBtd3VL6nxq7n81yk0MwIPSBKml0uskCeRT
         /beBhVHrDUlKUWbTmt9enB0OvUwCWDSjPSHmr0dcWremY7ZAfWk2ke+htFUPw7A2Ngwh
         mLIq9/RAzTpUyLRYXzBouMxnfgRXpjLlVUgVTQcbzvolC2+kzpjGiVi8M6meQFLZohog
         969UWZeWnBDV+cT4IRcAUqHRnbDwV867MaGCBV1uehCAiWiUG0qzrXjM5gla9kbCXA6T
         lAxw==
X-Forwarded-Encrypted: i=1; AHgh+RpoLPnOoifnn0VM5KrL9CXzs5N1tRD4ny8Sa5VdMsl9Vc10QC4rW2UBBidS7fJ+zzOm5hqbGzVQg+JXyQc=@vger.kernel.org
X-Gm-Message-State: AFuF++nCNnLWtZJ0cO/t++DpG6lJ72pTfgshmjHO4G9DoR7O/JwITm0D
	DFhetYx2GbOMSQ304D2m4q18rwd+zFIuW0NkJxsalfk4fZzl+6H2pPnu
X-Gm-Gg: AR+sD12cM/SKG0nCBn7F5oqO8Tz9pCUOLEy/RuXKqI1o7L8vaAqodX1k8fR7LrXX6+u
	bg2DVt3Ea+mRu6ntunYDaueOYCmQ5dk48FwhniEzqU7S12kaTLMDpwUejR76YCL/ODZTCMS3BYg
	iyRajtlNSG1j62IawCETtmE4+eB1gkz9JUUYxbnbW1/YRODPQ/Gbm7YcPmo3xfWVHWEBQy6pQog
	MrJGJz+QfQw2HmDoiE84qMsTz69/joAmFKrVdWfgKQpIQGZvckG6t1RuByvpND/lHIKE9VVCzSA
	6DjdsZNZttsYeOXyZ78yKIwrnIKfdadhS/d829sjQXa3Rg1vvmlGuYxlYEfk79TNqt0L9g+Yf92
	wh7A3nv5DWK0PLGxvHvMKD4gl4aJLGr9ejLPNWB5uN7BeQE5lZYw3es9TyA3pO0tOc63FwlrFKy
	NDxcxqWQOip60NH1PgoYiT85tp+CxEMnR9AaxAZPztRy5vmSOBYfTzNOdgCejN2PUzaP76MjNyC
	PgL2r1RifYZBhztkqrEWKbrwDox6844IClkWvpFiujywR7WKgN6D17g5ZQ5FO5eHYVbTTmCetyf
	SqDDxQf3/hIG44O7w70eLY+EMzjbzgD+egZPl1+4AbrADQFUFAMVREbdaC4Fs4ZdY9VW5Xz04VD
	aX0Pt8Sfop94=
X-Received: by 2002:a05:600c:4744:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-49b91c2479amr317299235e9.4.1788114549893;
        Sun, 30 Aug 2026 11:29:09 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-adda-dc01-edc7-8a6f-c6f3-73e0.310.pool.telefonica.de. [2a02:3100:adda:dc01:edc7:8a6f:c6f3:73e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961939ddsm102089915e9.4.2026.08.30.11.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:29:09 -0700 (PDT)
Date: Sun, 30 Aug 2026 20:29:07 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Eric Auger <eric.auger@redhat.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/5] KVM: arm64: fix VGICv3 redistributor rollback
Message-ID: <apR2SFrwBa9tCS5y@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
 <87zey4m2qy.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zey4m2qy.wl-maz@kernel.org>

On Sun, Aug 30, 2026 at 09:28:05AM +0100, Marc Zyngier wrote:
> I really don't understand why this is such a massive departure from
> v2, which was pretty close to what I wanted to see.
> 
> Honestly, you are making things harder for everyone by over-designing
> (or more probably under-filtering) things that should be *fixes*, and
> just that.
> 
> If you want to rework all of the vgic init/destroy, fine by me. Do
> that as a separate series. But for fixes that carry a Cc stable and
> require backporting to 6 year old kernels, that's not on.
> 
> The hack below is what I have against your v2 to make it acceptable.

Okay, thanks. I’ll adapt your suggestion and send a much more minimal v4.

Karl
