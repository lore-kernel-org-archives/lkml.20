Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D94F55BC
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569427; cv=none; b=KmyweUDecbGCgB0hgyvR3vmIO0tzkYVKZGl+wjkdpaC0hFmm8/nMCes8fP6RgfPSdJt2gspnprv86LU/zvQBaVUv91PmMwmTootXC59qpIqTin5c+oaaqUjiuuw92Ms2t2PxyLsx01DPBFj//Ki8yZIYmL+nyM3YR9yKsLniSR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569427; c=relaxed/simple;
	bh=ziNt2UNBXY7S/iZ8oKowW0AWyxIdVd3hL7tAmLjsIMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2Ljirbuk6C2ut8vjHp2PM5plr61hEG07QCcTcu/o3yfPRYGAtodXCiNtZT9wy8ut6kVki8W73o5/yGJmO/RzEjT2VMHva2e0CJPVcsWsLuJvxu8UrG7a0Ush1VuXvech0JjTEvP2izgAT9T9/W/KmlwAAhnkl7T/n2s4i+6djE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aprcr7NO; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aprcr7NO"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so3281814a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791569425; x=1792174225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4oCT/pcsoFsoGYw5wZ0dyim84qC6MfsMvJYjzdFSnBk=;
        b=aprcr7NO/YNCrhPoN8vD5cJb+eQcrA+AogG5dh0mD/0U+/saQX2xd/X8VZ9MtAGM9D
         ++JpxhUDZR1/y49iHJleZD6I4OQJ1zK/MxmmwIDxDGX778uLMw3FZSH0Nq/PjpKi5zNV
         iGeJlsMqsN32EUs8yuc97T9+VjwwXw/RpGqHIwFHlojn/KS2g92ODgy6JZur8bUx9Sxh
         0V2iSYiaGaETIiUX9yj9/brCe96Zi6a5aWmAlK/ZyFmp5cR6rCbSeIikkVbgKzTS2RCb
         UYJY80CKNQ2g+FYw2TeOANR0yOVsUpapb08VqqBGvEumgxrtcRkPNP/t/QDASc1kSd5u
         aJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791569425; x=1792174225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4oCT/pcsoFsoGYw5wZ0dyim84qC6MfsMvJYjzdFSnBk=;
        b=KBE1KA7aOEW8un0Y7L9IuXnlGL+3e10ZQGtm5MaO/cofqSWyxsv4/QIWcOHkBLifXF
         FLaIpLtrIE5Q8E6k3joZ8CJ6GPECjcOGZX2mPgTNxlf0XHpIVDZD2vFbJOZkzX24foQp
         X3WsDGTJug0r5HW6nGnlfKZw58Twfo6oVc7jzPJ3d78MRyWWvyhBVG3Rbb5xLejKE48F
         m25Zv3UR4kfWMsGUdjK+y0vK+By6RyUH8ukuC+LjYXaAliViajkJZMvl2SMGbbpwJpzS
         V0/sbBogS0dsD5SinxNV9m8D+hgJmI8Yq8Uf3RClIA3Hx4ULp2iTfBUp3UosFdTMaOuB
         fVGg==
X-Forwarded-Encrypted: i=1; AKwUvBzDdufIlfoA7kWu4dhax8GOpmocy3Tr/WCaVEm2nlHS0EkopN6l210q7e2WvMXtBOi+4xA9oBmOrsVejTc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsUdWptXtVAzZ9y51u4MHW7zBxwPJ1rondGBVb1XxbdgCaJn/q
	h6tEZsEvibexIpt0VwK+I9T3ZuE4nInVeSnL+gepxsIcGcm8p5LSTdOE
X-Gm-Gg: AYBFou1AmTd5LdunkTcAtMDFGFxfWRfRjLB5Xp5XuOaCWGHX9eSHJ+dycpKgbBM8AuU
	36srHOjSfA+tONuqA2thku7JHlWq7NMblqD9wD12b7UBLaxt0As+TdDELWK/x1Npn6+V0XFRQWt
	uoJlCqKg0+cZoKqL+oKn+SQzJ5eHe23fcdoYMwq+yGA0ASkBsGDCIDYKqqoLgIeiVyaMW2BOtWe
	xet1A+WHztvUKN9vZoqzRgwriiWqDCg7rDKgGDNohzxkyXrgh4I8LrQ9V7Cj39w1JZeHs6ol+0D
	7YQRuXLvaJzPWPID8Q8u0AKoaFNFJ6dw6bGakrx1iRVXpKAyOkhgB2OT6IxisxNxoYZeg++Xx6b
	0XbgRzF/zvqKzuUnb7yodOzt5gHq3Y3eaaHRU+1iqgO/T7yU7xaPDfOriAhMCsZP5E66QWu/JRm
	ElltTFZAOR5J5s2LvCjprYK8U/dCT7OGWjUqEG9fyIrX59bHRebTqPwkivb3s+2kwy+9ZeOgq6B
	0fIDgajoFnSdWhwPuIxRQDYtx5wpH6JMyHQfEq0hg7KYfe6EfqCpLqD8m9JYi2fGqTsmdmohE+c
	pppNVpXKDIsraP+z8ORXPCRD00KDcrZHIrIJWc03B838ZVmYaTQjn38Y10arGwJP2o29VNg1Cyp
	QDdZxFnnEStf00wvx
X-Received: by 2002:a17:90b:4a90:b0:3a0:d20e:e2f1 with SMTP id 98e67ed59e1d1-3ab3a912287mr2400753a91.10.1791569425494;
        Fri, 09 Oct 2026 11:10:25 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:d58d:323::50:f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371b2f2bsm4555508a91.15.2026.10.09.11.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:10:24 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/gdb: Fix radix tree lookup pointer handling
Date: Sat, 10 Oct 2026 02:10:07 +0800
Message-ID: <20261009181009.2442-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <CA+NtrhTyE4J-C2=hSUXYc+NJBsQeYvbwJb+-ROHE1QQP-_gYzg@mail.gmail.com>
References: <CA+NtrhTyE4J-C2=hSUXYc+NJBsQeYvbwJb+-ROHE1QQP-_gYzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding Andrew to Cc, as scripts/gdb patches usually go through his
tree. Sorry for leaving you off the original posting, Andrew.

The patch is here:

  https://lore.kernel.org/r/CA+NtrhTyE4J-C2=hSUXYc+NJBsQeYvbwJb+-ROHE1QQP-_gYzg@mail.gmail.com/

Thanks,
Ting-Han
