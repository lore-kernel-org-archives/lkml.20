Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4361F4A4EF7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 11:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472873; cv=pass; b=kMUvGOqIy4ktUr9drrtM9mO1dodgxhygQYmLE54wX0P8kxugtpt2SPb5lmnzuNY6ZTOMlvzeeuptk+4dUoJrDYrSrQiWIyfE89Ax+uU2v7y5b1zZXpLTxvOpXQNLQ6lfWWPPji8FF8t68p7gUi4NdMQa7sDfEquJGX7QMgxjg+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472873; c=relaxed/simple;
	bh=s2Lj4pHsdIrh0iNl/yLPyohADV37fflTexKvvaB+Cp0=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DgNmfQHf/iumGmr6+HLN+55A7Abnx1TKAv1JD0H/Mz1g3pGtPKUgLkm3qPROuJVHgc2333nCWRRmkyHWhMCG+JJfH4Ni6gruP9c9x6TD5DGXRb3dOCllPe27A8wsxhA3L82ymQ1oLBpQL9gkMqbaHOrpBWTSuSk52SrZpDYtC/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=DizrHBiN; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="DizrHBiN"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b845so164392e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 04:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789472867; cv=none;
        d=google.com; s=arc-20260327;
        b=MneJib6ZsA6wfGpHT1H7iGXzvJOzFdZB2NYdedO2Q6hyS35YoFOECYWlMRjrbSg6mg
         uhASi/Z8ox8Wh+8aYkDjhNj6wiDpqlaspz9Ry6/+LlhyFGU9Mm6kt/20yPdAYIHekQHp
         zm37rRuU3f8KZm5On29SQmUx8dIm8QD+1twHCiyN34DUSTAeaVaGUVOUeWtRuVGS07zP
         +XUCz1yrU7hsjJyaITo0NrMbJNSp2lUrIIXMtZR9rdftDWlG0cy5xv/sUzR9yzIW/mh+
         dKM69FQ/iLVynPJF4/rCtZwO/YKOnd9gqW0VYf21L5Q7aBiIwchq2kt+U2OonK8br7dy
         VM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=s2Lj4pHsdIrh0iNl/yLPyohADV37fflTexKvvaB+Cp0=;
        fh=g834v/2d5N7yki6SSTpqPm81yDGIrh0aOx4nMM0DZxs=;
        b=eYtU8kk77nPre2LpOTFMwXcFiNRRI7cfzF7AlCSc/Dt/KTdQ7g3Q+PVstdyuziaupt
         eNc65ucpvcmboAiFHJ4w/6F7Zfq22m9CXdYK2URn14DZU68SXhncaayztCtAwrAMGuOV
         pfvrkG6ST7w662EqD/ZEicZKtp/2qAwdLjxni2xZAUBtf+B2+PU75sjc0wTqBtIHlu4k
         wXchUHQm0HGK90V8Sb+vr5AU45x9Dv9o6Jp9Yh6Cyzx79dvcBY+kRv7hNL5TE+KwUtQ2
         82W4qsVhWzCkhixK8dIRB5DXknogRI1cKwRB1vJJBBO8f5M5l/pezrpn+fbcu8Mm1nhR
         O/Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1789472867; x=1790077667; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2Lj4pHsdIrh0iNl/yLPyohADV37fflTexKvvaB+Cp0=;
        b=DizrHBiNpy5Odi7pSYpRXre9pL8mOY1erNG1Q4C1IEckdpz8jxv3T8LMawhBVAqrd1
         q6aohvMhMde5+glFDYLuC+pG7rbGcQQJ/E6evA0MgJw4fUkRdd83xly/IKcjmlkjLQ/E
         XYu5EQ2xr4uTBeygVQKFxKhZReuIqMnA+60pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472867; x=1790077667;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2Lj4pHsdIrh0iNl/yLPyohADV37fflTexKvvaB+Cp0=;
        b=a4W2sr8f/QQGUejZGemDgWqBQCZH4jMc9bk/NtKOCf6koEr/EPzrvJmBHK3e/OLDll
         ucgSmsW6hcbWi+VUup6maFvGolI4DNP+PZdPKckhMXS1NpLmJIgSPqjB172byEKxMnZa
         k9BPR0kwzQClqdq8gK7TiM6X6mwKBHrSOZGRVXXfXBelMUVpJZG27foYsyMvWjX3PMB1
         Bg2GpGMl/2nW7HOxCAIbsowmvoTzuYwD3lq6FWiN20qQ1qyaObmebWOKAlcxImik5o12
         TgWTXkd8Io31hc7fcwsoO1uPtxUoD7iedhify8fgGxJ8qAh02ZnIG0jcDlHd72ktw5He
         xxCg==
X-Forwarded-Encrypted: i=1; AKwUvBywMvaWzOXUXK3Ai+TQQqrc/h2rIwYy4ywyCHxbhwQ55GhaWiR+GKELj3AyPyQgtZugazOsiFl6Ggh9hOg=@vger.kernel.org
X-Gm-Message-State: AFuF++mkbJcl7fNVXWn7GP9fmBJO7d/bJL7RdvjfGxmBoSJa4KjbAR6v
	jsQhthBQtA6h2ekq2DYsqbDd0g7grXpO6qNyo4oyBU6g9fYc6zIfhRuwBENBo1e4PRJ0E3zEamf
	9bXIhbQ9d+DPQdExE8FO9kTlK7ceTAUiK7xvyiHcpeg==
X-Gm-Gg: AYBFou2y99TIcsQOm7AzZVHWqg5CBvDfnwzqOdldfZ0SH3CxpgzHXGjeSXHnrUYzXtl
	2Eez1ESseJ1FxlvbPbpC7MOD4FbVDeFFr5VhCVkLMi4TlITOHrRYvzfVXyN+vb9EsW+sFR3E7fF
	7OE/pw1jlhunqzxcAMOIDec12lec7HHqbzrGByOgGiT/p+Kvc01WH307fIZPFGlXdauO+juLRIH
	ZAaoehktc+ltqxPvFQuHs5zFh6aVrws/UOM/G4ZDYaOXgw1aeal9xQsbXEnkTQw1FzROERnrCKl
	XOwFYdNNhBHPKvaso4c16NAqnsVyJNQsn4XfimGbQ8f9XnuAhQlr
X-Received: by 2002:a05:6512:2210:b0:5b6:1a7c:aa1f with SMTP id
 2adb3069b0e04-5b8b4ffc4d4mr179859e87.55.1789472866941; Tue, 15 Sep 2026
 04:47:46 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 15 Sep 2026 04:47:46 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 15 Sep 2026 04:46:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: kimwooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <20260915083839.71546-1-pabeni@redhat.com>
References: <178911388614.25348.8892025153904636456.macb-resend-1@khu.ac.kr> <20260915083839.71546-1-pabeni@redhat.com>
Date: Tue, 15 Sep 2026 04:47:46 -0700
X-Gm-Features: AcwNN1XcLqf7mtvLMWC_6Wsu1EscKIC8wJaYw3QKchmlCeJvSymI27SGWfnMzAA
Message-ID: <CAH1Bc_yQYJ6cWyYVvfWK0pAgrXW1TMkpzmNxZvAXAKZJdiOqWQ@mail.gmail.com>
Subject: Re: [PATCH net RESEND 1/2] net: macb: Preserve one-step mode on
 rejected timestamp requests
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, theo.lebrun@bootlin.com, 
	conor.dooley@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, richardcochran@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

Thanks for forwarding the review. Taking the items in turn:

TX_OFF / OSSMODE: this is pre-existing and independent of what this
patch fixes. The original code also left OSSMODE untouched on
HWTSTAMP_TX_OFF; this patch only addresses rejected (-ERANGE)
requests changing hardware state, while TX_OFF is an accepted request.

I propose handling TX_OFF in a separate follow-up patch, keeping this
series focused on the two reported bugs. It is a distinct defect and
should have its own changelog and Fixes: tag for stable backporting.
I will verify the TX_OFF fix on the Pi 5 and post it as a follow-up
once this series lands, since it touches the same lines.

NCR read-modify-write locking, the gem_get_ts_info() rx_filters bitmap,
and re-applying tstamp_config on resume: as the review itself notes,
these predate the series and are not made worse by it. I'd handle
them separately (net-next) rather than widen these Fixes patches.

SRTSM: NCR.SRTSM only makes the MAC replace the received FCS with the RX
timestamp nanoseconds in memory; with DRFCS set it has no effect on the
descriptor-based timestamps this driver uses, so leaving it set does not
affect timestamping. It is also unrelated to the two PTPv1 filters
remapped in patch 2.

Thanks,
Wooseok
