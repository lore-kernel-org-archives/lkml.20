Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025024;
	b=3gXFS22zHUNZOWFmvAX1P4/09J8MREbEzrzTEnE04NRqaonPkFwHMs+Z72xQSXB/EYVn
	 M4gSC1OrL4rzx7qEbTsyL0NyJl7q93cG8YZM+K3INj8SIFHvHHNqfrkFmntlgyOdntNlJ
	 ugb/c/fDMislDVO/50fLDfJ6zOlAMOAfca0pyh7d6+NE5mLbbJutjncfWJTShfekDyBvK
	 bpGf4UYfCzRYF44c3vHP+a0iTPTRFyklLpF1Odrhx1FhVgI72Q30zv7qQJBD234nv5CWz
	 YAy0HdiHLsGXRdT5qSxuDYwHoOwyGQ1kAWRLwAihQPhsy9xISn3bBEA3CBT2U2vkK4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025024;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=3X/et2VMx7NqD+upBr88LG7gROvWjrGp1J/8ySaQ3hI=;
	b=WfdhhNUuIum2el+50ptOlMNlktEnxwLXByvjhPi+jTmtslnsZt4+GTQhAkTXQmeiyyFC
	 zzr+GxQkMOnQjLmIKtYaaNAwTPm/DsOD6persyTO+PGvLeqqsLcjDQDX3Cya39yo4LneS
	 94tu+rLNNQP2U3vepV82/BcyA4LTMzbcXJotDMNJY2Ej+o2c2UHr8u6kkwTsiX2GneAXx
	 8JxtXocAH+t7omG2sGMdYa5SB5aHzvKtZUwv4WYc3/eaWjSrjU9PGGprY8WE/iL8BU271
	 BKEb1Q6pCqQwhTZpbmLyeX6inZyBS18T16EqOzXyAsQEHa49EemoWYiToBlbBYWsihw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0TBdP5q;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qDbm1fIP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3BE606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE3BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I0TBdP5q;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qDbm1fIP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793025022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3X/et2VMx7NqD+upBr88LG7gROvWjrGp1J/8ySaQ3hI=;
	b=I0TBdP5qkhqVm1sY/eMQv+cV/fDsvuYKNHiniotE7/ziEw9Q8HIXHZ9KpZn+KrPvrMZLe2
	Np5vlpj6C7LldvCsUauM6dCjI2asulJgzmTlv7Z6CYVXqfOmewiYx96RNqeC9vEHJShoxr
	77zjSM0fHlF72wJyu9KbNcO4ZfauVXI=
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com
 [74.125.82.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-ZmlIN1joPEOO4YppfSKRbA-1; Mon, 26 Oct 2026 10:30:21 -0400
X-MC-Unique: ZmlIN1joPEOO4YppfSKRbA-1
X-Mimecast-MFC-AGG-ID: ZmlIN1joPEOO4YppfSKRbA_1793025020
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso5592941c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793025020; x=1793629820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3X/et2VMx7NqD+upBr88LG7gROvWjrGp1J/8ySaQ3hI=;
        b=qDbm1fIP5t/u/ATU1SXAkby45+GhUqp8VUVuvUJs3j+kmY2ivkPmXpVO2lpUXrhgRy
         V3r3VpQwrGDv0BvsIaGveBY3I+gAbmag0fW5J/2/ff3AwqV/CaqpebD87jrg3J6dNfft
         unvVGxlMZ4fqZzR2slz7N0F9NuQi5MwnO1iDYnNzNlmtN1KvMmcfBxSRTmMRSo/WcjMm
         rRcfjlYNIdvfGj3KxRXelWbu7pj8CJ2p2ofHbUlI6ShECd4pEw+ZIzsUjs78tEvMB1e0
         T/KCcGwbYY6ku3YWHSGLmqaRLVuYREZLm8cZdczIpjvU8c1LVBG2vmomxOUj3rg5Qwoo
         lJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025020; x=1793629820;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3X/et2VMx7NqD+upBr88LG7gROvWjrGp1J/8ySaQ3hI=;
        b=230pPw8YtgAjvnzcQIGOceWhZwERjBqHoworEHnLuVy//sHxydJS70o5JzrnaiesgV
         2eD9WZjPPN+PKCqKfYTf7cJT3bfEh8oH3KBaCGq3e9P6efzCWSDP4mWNGnyLnhbaP+ia
         wtatPGHgQSLmjyXLCKBmPfeniKE7kBsc63dl2NyQAimRT1J0iGZMUD7ubws+3hgUfGM1
         MF175k3wYByJ6ECuT+8QhUDZPGfgLNda2xwb5XxAcriGpRxNLcSZOz2VLtilvxPa3k3b
         UabmxMLWvN5FRk6gA8U6aGR7Gz8kDPJ34azYkywgUrT/rNiGM53Rt1cNFqyVavzi+eqc
         okUg==
X-Gm-Message-State: AFq9FYL8M2vPi2UXYD6hWll+JdN1XDgz+W8NPUo/OB8ljeOadve+WMLw
	QQQeHOLUgKhlU82DvISwgJnh8YfNvYtW47Y20F8/y3/xmCCyD+awu4hbP5jiHH1vH94jt3Hny1T
	bREleV+2gNx61ADptlNQZLT6+yvVc/Znmd4qW5hkJm71qMryXl7gVrJiHBGDCj0JiVZowPGQx1Q
	==
X-Gm-Gg: AYBFou37qoio767nTqDjqJ+HXB+c2RpoH5zVRtWuZEePHwffrZQYQXHQZ7FXvycJ1eq
	FhLW7zUczes6S+LkrmmOgvFzBjN7rGHY7uoo7JLLGhC9RimOU0W7Lq+MEwJH4hZ2ZvUBRPBkExA
	7deQ6h3gLzFcLVxfzKzf4oHoz79I955l+lCIf43QRWlQxMqiOdNSiFau1m3fsXwAXh21ooICfy9
	vXG8DJlsa8U1OaPvIEwBwrC5u+X4Hi7/AyrRq9XJs9RJE+db0/T5VIiVL237xXnbAuo5pFcno4l
	ylUubOIPa8sPwFEtB4pIV1WxEe+D+h7w1nZ7pVnWz6733UZLgJTxSFZ37BwxxDCLAw==
X-Received: by 2002:a05:7022:2229:b0:149:1feb:6dae with SMTP id a92af1059eb24-19937abcc34mr16272754c88.39.1793025020173;
        Mon, 26 Oct 2026 07:30:20 -0700 (PDT)
X-Received: by 2002:a05:7022:2229:b0:149:1feb:6dae with SMTP id a92af1059eb24-19937abcc34mr16272666c88.39.1793025019336;
        Mon, 26 Oct 2026 07:30:19 -0700 (PDT)
Received: from fedora ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm29706896c88.11.2026.10.26.07.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:30:17 -0700 (PDT)
Date: Mon, 26 Oct 2026 20:00:10 +0530
From: Arun Menon <armenon@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 5/6] tpm: Increase TPM_BUFSIZE to 8kB for chunking
 support
Message-ID: <at9j8iDp2ozx9y5z@fedora>
References: <20261025201859.221991-1-armenon@redhat.com>
 <20261025201859.221991-6-armenon@redhat.com>
 <at5tmTYX7ZjO_Q2m@kernel.org>
 <at5t-u3h1sHGJFmk@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at5t-u3h1sHGJFmk@kernel.org>

Hi Jarkko,
Thank you for the review.

On Sun, Oct 25, 2026 at 11:00:42PM +0200, Jarkko Sakkinen wrote:
> On Sun, Oct 25, 2026 at 10:59:09PM +0200, Jarkko Sakkinen wrote:
> > On Mon, Oct 26, 2026 at 01:48:57AM +0530, Arun Menon wrote:
> > > From: Arun Menon <armenon@redhat.com>
> > > 
> > > The size of the command is checked against TPM_BUFSIZE early on before
> > > even sending it to the backend. We therefore need to increase the
> > > TPM_BUFSIZE to allow support for larger commands.
> > > 
> > > For now, 8KB seems sufficient for ML-KEM and ML-DSA algorithms and it is
> > > also order-1 safe.
> > > 
> > > Signed-off-by: Arun Menon <armenon@redhat.com>
> > 
> > In what timeline? Or is it out of spectrum timeline?
> 
> "For now" part concerns me and I'm not educated enough on topic to
> know better.
> 

TPM_BUFSIZE needs to hold the largest command the stack will ever
build. TPM 2.0 Library Part 3: Commands, v185, adds ML-DSA key
objects and the ML-KEM TPM2_Encapsulate()/TPM2_Decapsulate() commands
(sections 14.10, 14.11) [1].

NIST FIPS 204, Table 2, gives the sizes for each ML-DSA parameter
set; the largest, ML-DSA-87, has a 4896-byte private key and a
2592-byte public key [2]. Loading an ML-DSA-87 key pair carries both
(4896 + 2592 bytes); add the command header, a handle and a session,
and this comes to roughly 7.7KB. 8192 covers that with headroom and
keeps the kzalloc(TPM_BUFSIZE, ...) calls in the TPM stack at an
order-1 page allocation - something I figured after sashiko review.

This is sized to the largest parameter set defined today, not a
timeline, and there's no guarantee it stays sufficient. For example,
FIPS 205 (SLH-DSA), Table 2, already defines a 49856-byte signature for
SLH-DSA-SHA2-256f -- six times the current buffer. If a future
algorithm or parameter set needs more than 8192 bytes, this will need
revisiting again [3].

I will add this detail in the commit message.

[1] https://medias.cdn.trustedcomputinggroup.org/production/Trusted_Platform_Module_2_0_Library_Part_3_Commands_Version_185_pub_87a5c10230.pdf
[2] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.204.pdf
[3] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.205.pdf


> Br, Jarkko
> 


Regards,
Arun Menon

