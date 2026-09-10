Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23433D5679
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024900; cv=none; b=EfXupZMBnCLCTwitdCX7WN6XwUQ4VfncO7IH+z/vlX+N3wQy1wkv9udbU1oFrGws7S4QeVIaE4SDPd3yk3esupY2fB2nBuoVPd8FwjOEStjDq+GMdOYrClkwYIb7cmWFwksOaEbSuZT7HViqaijTH49Hot1V9DfEM/JYZ2P5Qow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024900; c=relaxed/simple;
	bh=iDx9kFP2Pe+5f4NTzgM4UokikspnqAWM6BeY6UMISyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMNYjan4z710Ti7NCqom+moKYaYaevxg500M2AHkPzlQajI9cGAxLPazcEQ0F7MvmNaeRjtOb0USvHgPhanrNoR1x46L/UWXOpydsx2ouhRF68cvgTLXqj2hTXBLrOLzrJaO8PFGx+Y7CHl5U1l7MtFW6HuMADUzDj2LKByTWFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o2yZ1gnE; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o2yZ1gnE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1187892f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024896; x=1789629696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iDx9kFP2Pe+5f4NTzgM4UokikspnqAWM6BeY6UMISyQ=;
        b=o2yZ1gnEhJUCbMBhoiTt9F+IeYNcX97u6YCcTE6EEF0qtzoRa6qpqrrMZl7btTyKVD
         H5VqT0CeE7HcEVZ/G31Wf/fVqR5D3xnj1if/lizghYzzBlsWAXmy8cr3SGtEwjMgVzc3
         1+cYgHz/kaG26HzhSCOwGlhl8xqkz3P5D8czJ5p1ZSUP3kZiSXCNSGpI0g9lGr+GauNQ
         5/LUjTmfjTqpsOFWt7WzFrDc8LgcgEPcVXCecuz//dZBNKg9U5gfYwRDuOhtcH2w9EC0
         xUqXalVAEaOVijJNOFvCGD2fN5ouYqvZgFszcQNeV8rCluzS6kPuOcVpHDbP2DXwj4AD
         plGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024896; x=1789629696;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDx9kFP2Pe+5f4NTzgM4UokikspnqAWM6BeY6UMISyQ=;
        b=pD6rCZWO86Azb59R1NATlSIFpH7QPvWiVEgHMufzj4TfLrjN9CPpFGRhEGoX8TWezl
         jHF6JZceI1sJ6d06qkQfGTlAg7tIMxR5QAM47eJBBoBnxN6qQA3WtZSl4Ot7NxD17y7E
         8Td4Mli8lGMgAcTT4yqGpRxiF8gaF4JbiUX+0FFv27a8eeEw8rNFC/uBIt6HXGYuQkgX
         /VUf5HSSkUYlc+09F6ePL4SMK0KM/0R1ewwQE8PJIatx8cbxR4VaOV6UPd1wM28rwlFe
         YSVpiAhERlpUwmvOMXMH16bkNPdcaLd3VLVd4oq7lzjqcAsSycWQRkb0CbLuuTnuRr8y
         MGbA==
X-Forwarded-Encrypted: i=1; AKwUvBwyv/du6G4OcPyikdUlsiaieJv1mXmBohY66ptqOcXeyVycNU4A/vqISlyvA1N0axVzyDdS+78yvSdy3R0=@vger.kernel.org
X-Gm-Message-State: AFuF++mSNa8VlufgP6saoG4oXuuepm948fIvRKVHB30RQoJaFwdOGzx0
	EP+hL/k8MP3DL5+6nTGmjtsudWe/dMROeG1tdIjgrxqT9hE062KL0c43
X-Gm-Gg: AYBFou3jxP/gLw6VFR3pG/p+dJK+elZNQRQdzt48LXtBcpaDGPhcGTYMRrK0ofRXQUs
	MTPQ8HGRSAvqRRZPEbirqF0ES01gd8qT8zDD/LL/V/cQz3n5QQxnuPn1XsrXPGyN18P0swYRyCI
	L576Ti9T0PrtjS8oVatg/JwIxm31fG3wqbPo16gKn0NdArrDfgdEJQigXqzpqyRC/T2bp54BguB
	8ViR9GPRdX79odZzSLdW+INgpwhfmVd0TwwobymZMW2nPJdvBb6V4zv1vuiP0ObFqpsyGGxFfeW
	Y9WHthXwAOgbutWHiZmEqgw8sJH0B30LaoNDdwK6qKGoy635XGUaNupNnTbIhqo4gHBZA5I+8wm
	PZ7jMF6BKdvJPLXCR8UJaXJ1pLnNtufT1EUwbSHkqcrS29SUkc8yskNIbJJ3oYIXOV6PEni5HO7
	wSAtnzBnnD0k6R7sixNQCVGG8L++omAFglTek9CYeBxzpofqn++e8cwCQ7KAnaOdL+nfId578Q8
	3jZpNOnKdQJ7e8=
X-Received: by 2002:a05:6000:1883:b0:482:ea08:8c97 with SMTP id ffacd0b85a97d-485aad9458dmr19032504f8f.2.1789024896166;
        Thu, 10 Sep 2026 00:21:36 -0700 (PDT)
Received: from andreayoga.localdomain ([31.189.90.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm43293768f8f.2.2026.09.10.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:21:35 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:21:32 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] hrtimer: Use hard expiry when updating timers on the
 same base
Message-ID: <aqJafE8azJ3TWLGT@andreayoga.localdomain>
References: <20260909102749.7677-1-parri.andrea@gmail.com>
 <87v78eza1x.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v78eza1x.ffs@fw13>

> So this really wants to have a big fat comment explaining why this is
> safe to do.

Agreed. The existing comment only describes the update and misses the
temporary tree inconsistency. I'll spell out that the base lock excludes
other queue operations, that the neighbour check proves the node can
remain in place, and that removal does not consult the expiry otherwise.

Thanks,
Andrea
