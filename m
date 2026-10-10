Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4CB253B42
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596540; cv=pass; b=rXvQpsCiCA5MrX+tVcJ7DT3psjJWaD35vXbBU94Ns6ZFwli8M58J499q6hZgofu/lxzWgFEtmin2fJIsqqN/XG9bc9Q96TO/hPR5Y1rZ6QoIPfow6P8d21hUNJyP+OZtLX5Aeq6XOs2GEXG+coH4CBHE7N8yVNcee2ez+wENGAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596540; c=relaxed/simple;
	bh=n8K/DO4hWqYm0UUT3df/CyFWPzp5h4xXqc5wMfIgNuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URQQuIaRhdw0xu3xRrSBYcSXwpsRGK/1hsXyTTbHgX0TB7eoPwwQb0OInxVDZrOa7fayCeRUwjZ/+E+3dcRMNTQYk546MaJSXz4ZzYC8+hWKWW0pd3tqzQV/iIl5Y/9P3Y8TrczWUKqaHbVbEVF/LxsuXeZU718CXnrboRZ+Tfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptGUc8le; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptGUc8le"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a9a1ed66b9so2527121fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 18:42:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791596537; cv=none;
        d=google.com; s=arc-20260327;
        b=HcXVPK9OmxMcjwXl22aqtvEo/SAZ+Xz8aZbJPaN7IFOEStopkWlChhd8lJxqQ5EycB
         +1ezQ3KzEchJsAM3MUhAqpRDj90+TcS/uaXRMdvcD4bGH3xIhFfnv2XjivUw5kPEfCeG
         ceivtpjX94ACZv5KxDqvBkKyWTIRzZtoDmAS2cvU55uqcjWQoNPepAHt0HWqlOlMoQZg
         r90UvQCJ3FwUlElH8YXSjXt4nfMKIxZYm2P14fbttkXJo2OzPc/6Y26rLHpbALSh0Git
         fbjGk6MvUlhIQwJjm3eJIxlbh8w0eZ8K7GFo26zkbkV56HXJwZif3tRc37UEgbklPGmZ
         hnYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n8K/DO4hWqYm0UUT3df/CyFWPzp5h4xXqc5wMfIgNuo=;
        fh=d+RlFEFCj7oDwl7KQYSIHXQeVChaKN6vgK4kv/1Av74=;
        b=MkEi3/1792Fnf44YFRqjiZ6i0loHL8gcN0Q5LvtA2R2BoTLBilbX+ObKUj1UfjjKYM
         No0lpAlryZ4/7+89HF9eWU9u49ADzpeGI0IoeZBenuQpj5lCSwrJYc9VzIYm3G9KrBMw
         E+nqgj3U3xwJ19cJlU+l+5vhCB8pkIqbIvQLp7367GpowN9ggkwfiwBQSdwj1NOgd7k9
         IkYARpZOfGkkgVdf95CBYVRf5oWz7soSi42GsPjvXc06ul5Xxh6FJOEsjxs4hfZGnRNr
         JVz3tZIN/CRsFdCpDXQgmestmrZ5A+A0T7zixPvKJfnFvDFNXInCZVyqFsCyzqLzxJA5
         BDKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791596537; x=1792201337; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8K/DO4hWqYm0UUT3df/CyFWPzp5h4xXqc5wMfIgNuo=;
        b=ptGUc8leSjv8NnQFTNVgVFChYnwOI7do3JYZnUs4lJS18toXvMgDY8VU9ZCdqVIKcS
         DUC4Hl3II20M7gWastdmX7mwzm2oVRZBqqyn7kyLwC9ElubiSEZuyWFVConkhmrUStzH
         Y4dgWklE6dxnds61QcASIM1q4n4eivcsLomrNCY812Xr+XXbkOCq52lPV8/SMUApIh00
         /BGFXUflK7VdKGAVmsxwiZQP0PRwXUecKxwNVaSUZHat7H+SDl4Z0WEnL+92/6TMdUrO
         MDccsYCr1vSaDiixxYxxf1WoH34KzzRuETNN93x435w1C5N6AEKP8wXGhMHRqXDZcyhZ
         XRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596537; x=1792201337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n8K/DO4hWqYm0UUT3df/CyFWPzp5h4xXqc5wMfIgNuo=;
        b=Y12n5umtCKNA1xS+81DsqUJaVutygeVn4g42FFEXxS7T0v7Yu6U7CGpKBPXc/76xPe
         F3A+AIUwDxlX/mFTjsMxTv7MhAnALNOj2X0fv01QYT12StiIvuuQomy4sxf53d8c+Jw7
         6fqclAM4gI7CZ8oZyO7r3Xr5hCPfj4ZPFVNKmrq6g2QJam1prdHmUXX9jxWGp0BAy+lY
         e7DSNutxwrYT48/RuHxtnXC9NAWXmz5W1dmO/N3XWRNroe5rJqxTG9V450QSgIC3y034
         w4qZSROol61Eu9xUqlSgfIU0m27X9v6uDIr9x7YM2Nz8g4VQSHp+F2+KBxtTp8LPtB6W
         4yBA==
X-Forwarded-Encrypted: i=1; AKwUvByQfixtM8pWLxFtjHA8PzdnhqdyOMgL/jouezVY3F8049jEoGKgtk7vW9Uy1sdZ28rzuVy88OfjzUOlZ3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3IMYDlI+0AbK7n8FIx90QjRyKyGkc9zvf/b9QHkwxiOVdM0Hy
	LFgOrLaghIejgQ6cYrgQ+0taVJrMUp5O0cqz+gm+quscB/oQc2eN48p4mjJ2nCDHkohn72Z5drz
	GPK47Q/wawMvNLKJFA3S4VXR57ooCw78=
X-Gm-Gg: AYBFou0mF8XbxU/fgZS9gyeuBS0+UlRIZxT42ekpO5ZNeIEVYu3jUNKbEt6E3v3Q7wp
	uNGyoIKECc+JCsZBzV3S+2yPb95K7qrs+AXYrpMdTgAqcROfXPT5KhvsK5qF0iKmp++k+d7Yujl
	Fhd9nSt+7qxl+xOuXqhIzlgCrYXf3brDPzCr7PZ1rS2SBFD9HwVbnRr6LtelwTzEuxe46YbuRGR
	0YSs472qYgDFoqB6uAE+4/viWLVhWS9KCS1CXda9VvcW6BGediSM2qQ7sceljGFxRCmxbeO8TMX
	Bl8RWZiwMeM9nXWVB0keai5Ar2ld9Kw7HvVyUxl2eRzunK7Rvpoa3nYN+Yuz37fKXBDWIOpWI7z
	UxrkU7L1CsZjgXIpAHps5PZkFfYB8NoOWEY1kAeJIomcQlVYldvyNclnGQN6d7p1vJhY+f8E=
X-Received: by 2002:a2e:bc1b:0:b0:3a6:6831:6e28 with SMTP id
 38308e7fff4ca-3a9c515cebfmr8095241fa.6.1791596537022; Fri, 09 Oct 2026
 18:42:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009210449.971057-1-linmag7@gmail.com>
In-Reply-To: <20261009210449.971057-1-linmag7@gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 9 Oct 2026 21:42:04 -0400
X-Gm-Features: AclHuK-lff7CrDPJJPDMcqxzamEqKaH2sh9rsprwt8zwIwnx_tibiaqOsKQY_ic
Message-ID: <CAEdQ38Enhs7WvUYqVRs1YFc_GHJz7zzgAuh-msgEZ4Rd6UC=Yg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] alpha: fix stale TLB translations breaking
 copy-on-write and writeback
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 09, 2026 at 11:03:45PM +0200, Magnus Lindholm wrote:
> Changes since v3:

All three things I asked for in v3 are here. Compile-tested SMP and UP
at each commit, nothing run on hardware yet.

Patches 1 and 3-8 have a Message-ID: trailer pointing at the previous
posting, I assume from git am -m. Please drop those when you apply.

Two changelog leftovers, neither worth a v5:

3/8 still says "the prerequisite direct-switch fix". That is patch 1
of this series now.

4/8 has a short line in the first paragraph ("This CPU may still").
