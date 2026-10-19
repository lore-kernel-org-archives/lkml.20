Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792429019;
	b=MOFZMfFhZcpQLCJE/0KEwH/fqxdp7CNvllw/Oc+5xyGQuZA3vDVTABcjlJ4Yw1LcPQBU
	 zj2Hn2+jW8dDa61yBnScSMqiHEK/oVFPL24SiRYGhtJYI1g71YeoeuUzsy0p3YEhG8Yfz
	 HLVaqpuNRNrFJ3J3rTJ3+60PzH/gfsqYz2sVZf/XByPtmkghq8LAbgnB5rCKvYhLju4+/
	 IJJsO/hG++DfrFQo30oPT49LKhrvygdCwNL+FtkUpApxwHAG1+6mBnDQMZAColfpx5PWG
	 7DMiDpTPdeD5afkNykzMeJXL6ebShRoK+Xf6sQxafk1re2PL5/I5w4BAZcFkReKZy3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429019;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
	b=LrFRZ5Rwb4qISY7k7Wbadp1MtSy7eBniCuUlPc6WJmYTSzyOUa0Sae3dnDJR2G8EBkwA
	 tz/FvMPuu8VCJAM34ePL65ep9K445cXI5kf9K5BY/9yujx89XFT+39CJGJXxp4jIZ6FRW
	 56jwMjKq23ve/rO/186yNokgsmhcta1qfH4SzHAbt6rvdOqPlrJ5OrIxtGHtY0idUcgMj
	 9GI0VYUZ20l728gzlBd62adcn1j3znU8GcKbhQhz0d62hidrR1cainPRsr4TlLeHX49NC
	 gaNLyTmAaW7mvjb7o3h+r4RF7L9heOe6zgn6ofy6iDXydPCBHOepOQhJFn7DP9FuOAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="QJZw/GyT";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="nS3/gBNz";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60B7606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B60B7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QJZw/GyT;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nS3/gBNz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792429017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
	b=QJZw/GyTkogHTY0vHN/hIY2LTJt03VOMx12+AKkwPIlzBIcpToqxYaxbX62Ynz/PRj9pY+
	Jl+QcHCHgr0G1IGGjoKXNhA1TzCZ6PfPGAvWY6Myx4QkFINJYGMXw/WELbRH4sH0L0qiiw
	3fcJxERM7rgAhFuA+7zoy7xJ9s/p08E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-paTMEvPPM_C3M-XdEyedQw-1; Mon, 19 Oct 2026 12:56:53 -0400
X-MC-Unique: paTMEvPPM_C3M-XdEyedQw-1
X-Mimecast-MFC-AGG-ID: paTMEvPPM_C3M-XdEyedQw_1792429013
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e17d30a79so738765f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:56:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792429013; cv=none;
        d=google.com; s=arc-20260327;
        b=M1R7oPpJ4vlyNzF2tmWMcTpevTCbQoVglRFTn3CkKcAEUhv5OPN/lKkxgU92WaJk4r
         U3USjTt9LavauhUMLhmao4WNdLeyZ9/td5j5ElVPKND4+Ih9D5ntIuXDZo0Phu8a2HxJ
         jR4bVslExGTUNU9LW5kZAmDmIsIWc5dnKrKwBChMlbu85iGjikzhi/aNRYCEutoL6378
         j2lizbyIagn8QSa5RD3uVZhYVi4KAJ0OkhPJEXtlTaOCAwp6O35Jsh7JO7dgBz6GeZWW
         VvimIJnPjQPX/MdNXSfJrWEztBWE9RHSEYyhy9oszC9pOCKW2TE+f4e0k4BGXM0AqhRW
         UEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
        fh=EazY/69oBV46txc+Lhrj7GxsPDlE2C+e2V+qRk9QjBs=;
        b=FXzVAltegt5kuM7xvLn0n2H0wns5XkxIyr2ffN20Vwrv2swLrCnu1OPC4sxlT69HkQ
         a0eDrMrYlbmlGAS8uAklao0zejvToOB6KSaE+D6snrFqE7dPmldZerWMn6Ma20Q30nX1
         pgk2fkWZeHo67x1pyUzAJbWtzoYxXxiQf1J9bjv3t+KfA3JhFz+Mzkq8yuM3FCCdR6eF
         JT70CeYZ6xJn7XhSMnAd7/hZj6YH4Gg6iC/V/GuML7c23isdunO7k8Kwh/e0Ra1pgnWC
         Z53IkmHS4sedEqx2mDUlMFd4QidS25qv8jyIbiZUM4+xPJzHEoH+6J8Zns6d84YNSkbU
         MyZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792429013; x=1793033813; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
        b=nS3/gBNz/RIAybVsK7bkfz4Ls04SCNuJsPimvndGNvLIClFkqx/dmDXjWY+LQsRoMZ
         7S5JLY2LcUBvArEat11T7YPk2iLgNs20ZcplURpldCgIR/2cFYkwKunfOcHDcBT0++t7
         7tzzQFqyqGiLh9KDSsM9r0vN9cv3FW5/NJPvGzPZ/HYSNrWyK6FgnPpbL+WqrVxEJnjl
         usQ2SwSDfR47kS6PT2O9Zjsw59Z1Wqj0VCjMBPCcG8A/DTh+uNjdzvLfbP6aFevPVdRf
         PUMWGttmC8fsgaHVJkGDQ36KXxgBV6HhFpkC4/qHSqHuSq9iyB0XyOmLerSjwIWZ1ZAN
         Te5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429013; x=1793033813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=93Mxke0ognMkCH1OvgVhoO05LeJUA+eXnVQ+rwQWPck=;
        b=ksnjAi8ZUmUKfMfuh5LLzviegHaDPvbNcbWBxljfAMXdb/uMk7clQ0yBNFAxe+q45n
         LBEVdDhpQOJWupWbwnhP1duwC84Txozn1jj8BElA0ReGDZrVvfaU3THxUdLFTXmngdV2
         kS7k5SSrKOR45WHhdgBjIKwE4opC7JUKwPwsYFxLV8xSvettQ2RUOmuyXGH7yDJsscnj
         iZxMGTxh088s6aRyAwMacr5iLfb5yvNhegpgxgg1Xr4b5uQLhbpQwvLAaacLGp1d/cjm
         kXAJnASzvLLxjuQlpNE1LLdiM4ah6eEm2Tp6ZKvu5sSDEx2WYgUGjsjcv4tPqHahf4yD
         +aPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwO7k068qmz4pQTrIccPmBrxyDwJx/BgsJRjZ7YQXVJEAysCwtOtZNzoWcKVBksgXyuuxuFhO0j1ohLH1k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvWX/6iJOCdcuNWOGbSjwJgWS0GGUEFX6zAEIGMfZHLbOHRcdM
	Tr4y7mL+y2lk357TnG6OAT2vhV2O5hbL3pLuFQH9aY7f9kdrCci1L2z/5c6dJ1KUPFBAyJojCi4
	ZVcWJbEje0jMZ9gGB+8JMkmkQGFk3mcbbfcDebdYjuuKEchqrh8SWg80+/2aR3rKnaaaTrhMFms
	8ShEoynKpC9DoD7hSmrwRzLB34sSslG37FKln1lC+b
X-Gm-Gg: AYBFou00k4nx9Mv+xOri+ZXv/9S5oQjJZyHu/NPGvgxZ8pbj6CHCKvpatB+ZHqp6diW
	IbmXTMVT5okc/YMmxe4EyCph9vYzNvtZIdddRNz+B+x7jWGV09XtMyMXTjoD5P/ayg0jsWuBTKb
	TOYgkb7/Y2qZ+V+1SBwle5RquI1IFS+1i6vuFuDwELw5QrF2VDqpkdgA4Go4LXF39vyqr2+JVOH
	i9oLH+dGCpIbwMeq5J0v2zqLcbU6/0mEjstUzEPP/uipVxftLGCb9w96F48EA==
X-Received: by 2002:adf:ffc3:0:b0:48d:f3a4:a6aa with SMTP id ffacd0b85a97d-48e07bc36e1mr12549486f8f.35.1792429012688;
        Mon, 19 Oct 2026 09:56:52 -0700 (PDT)
X-Received: by 2002:adf:ffc3:0:b0:48d:f3a4:a6aa with SMTP id
 ffacd0b85a97d-48e07bc36e1mr12549457f8f.35.1792429012350; Mon, 19 Oct 2026
 09:56:52 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atZJV1B79VsZoy8u@sirena.co.uk>
In-Reply-To: <atZJV1B79VsZoy8u@sirena.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 19 Oct 2026 18:56:39 +0200
X-Gm-Features: AclHuK8vumiua5SMjMCvMOThl3efjoSr2L_M6TnDtZ77TgU9w18ADr4xGbKM-sQ
Message-ID: <CABgObfYRYCrOj-rHDaDd3LSFMSd0ug-YoB2pD7jDA8ZgMR0sCA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-arm tree with the kvm tree
To: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"

Il lun 19 ott 2026, 18:46 Mark Brown <broonie@kernel.org> ha scritto:
>
> Hi all,
>
> Today's linux-next merge of the kvm-arm tree got a conflict in:
>
>   arch/arm64/kvm/mmu.c
>
> between commit:
>
>   dd0bc00e3e920 ("Merge branch kvm-arm64/cca-7.4 into kvmarm-master/next")
>
> from the kvm tree and commits:
>
>   b44a8c32f0116 ("KVM: arm64: Abstract out memory abort handling")
>   892c8a0bcc8e3 ("Merge branch kvm-arm64/cca-7.4 into kvmarm-master/next")
>
> from the kvm-arm tree.

Hi Marc/Oliver, is this something that will be fixed on your side by rebasing?

Paolo

