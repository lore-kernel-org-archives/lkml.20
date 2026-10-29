Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793288981;
	b=N/yE7f9XvAhFjAmOSy7JBd+TQ658Y9zdPA/frSSmSpMo4kMiq+idc2bK0BvaSOOonYj5
	 IqqU8oq1i5JFqfWcux6mf4jxoyD82SRoGeFRcd2pAPzSdDKAktcoj+a2ENdtyleTupvAk
	 hv4oj8O1AgkXbiUvgIaA9Ctz5uWqYWq/x9mOmgPAP/kaZKFMJ0dpOzeAa+Mj8xZaNePif
	 9qW6HzqcDEK9wsdLqcc7SOcB5X2gtI9lEorJCtyL56e+5+AO8XWM0vuGOGs/5y1+RRkTL
	 RRVLIuV98QJ6OWoGCv81SbXSILOE2KhBUuyID990lp5Na3fMckFM6JQQPYZifZg915A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793288981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/khPgYt+Z8Eyq72Gf1KS1mgbVWdyIQPBrR+ezojWw9k=;
	b=4gc1C/EEMh4Yg4vc3hyTssZYk3tjG4AXEeLRT35jjGH5eV3qgI+HeqMCUn3nlldnAgfC
	 9250Fdp3BLlBpwNQdJ25wNqF9bWSgRxyrrVk2VpkQoO1Href/H2FeEXbllL5O+HxUmRmr
	 YwNZdRI3x/Xqqncf9KpEiZ6rwS/exXF3cgN7ewhh+POuY0w5ZqihqBohbPn7cDptoWqQX
	 adwIBnBeUYvwLaUEEEx5cINMbg9dAeNrihYWs0lgDYMHxFCylV8HUQBdrezH8mm74T/m+
	 yu9dtKEyc9rj2Dbd/gF5sIygYPrp0cjfPiMtLr4NoaE8mp6bigFWobC1XFkOoWM8eMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcAaee+S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB167606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB167606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcAaee+S
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ab432273c5so22198937b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793288980; cv=none;
        d=google.com; s=arc-20260327;
        b=JCL3T6AED8pOPcVgJC934PvmmIyHoBTzpm7mQrqC0BAk0HDd0Yne3yRSu9S+baZ2/7
         i7qpHHAIGSNoCBdRDKlmUnvs2lIMlHNJkiMPhaMWwJeU2afkYfSkqfIjP4IHc66zvnNo
         2nplDGv2iM8s0Yi3LHsQobdsICkK4jelvwn8WUWpSZL6QyTpD1cuxeaABrCp9DuYaD72
         xi7fbqcpzCL1bPip7fcxo49YHUPuAbjfcccYKNUhaD41HZA2b8ZYfRWdQT+utd3wgiUJ
         uOvRonTdMB3Kv6va5mRWs2y/fgJoWk8gfVu2+WNrmXGxlCsIG5i5VtDwoiW+FfhvgYak
         931w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/khPgYt+Z8Eyq72Gf1KS1mgbVWdyIQPBrR+ezojWw9k=;
        fh=PFzU2CFEmuwgWkHyVDq4wPR9cYU23RfMpj4zpa+oXRE=;
        b=VU9EawmAMXVcjD7EGxR1i+bXCColAa/vPLaYJRgdDL53bIjGi2CoEP6SDXMIgRwp1u
         NnzppDDShafX7TsMx+XYgtm67XwRer/ZQgR+b1jpJc0CpMF6lAuGW6Bm0Jpj8jDMtK17
         9SVVZGpV63yTi1Qs1MUDBRv8PtL0YAuWuGJzwfnY/ShB+IvbAeR4V4jGjL+Yx97FdyeT
         qqFvY4Q6ukb3Gvg0NHIHujUq+UWkcREV3o11c30UhbDv8KFAUXgn8ROPVluo3eveCR9A
         dsIryHU2EiolbA8ZNSXK0rLG1ckT2uHKScIKNySJdhEVEMshuW0Cxxu5geL2fxA+nZIr
         k21g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793288980; x=1793893780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/khPgYt+Z8Eyq72Gf1KS1mgbVWdyIQPBrR+ezojWw9k=;
        b=dcAaee+S80BXfYgGuIWlMPBosR9i6QOVqlb3vY8l/9iLrOGFm4+unNUDtzGxGKyFok
         12itqDDa4OKJG7gxl5X0/Z5LCZ5XMw0rWJ4xOU0k3c4iJ6cNbZgfgoRMJe6YaOpNHua1
         lV6h4ZR37JaIght9Dl3mG0pPKgqN9UvyZVpy+m8yUwT8n4UtUsVM1dvkwKjzDUnG2PfT
         YxPF+I4avo3XTgDKQyFs4LDafCmkMUjLyVIW/AOR3KxufhBpfK0ADP3CHeEY5YwlL1Ax
         yy1ZevKVxXWeX95dN/+heiR4nSOxEhBPanoY6PJM7ZVxGbgFyY6FgcwO2mGaqagjj674
         zrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793288980; x=1793893780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/khPgYt+Z8Eyq72Gf1KS1mgbVWdyIQPBrR+ezojWw9k=;
        b=C+ezwnQcy4qqHbRRHR0WwscKqF1WZ0CEoMQdJWAWmvk/DInRqabgkm+1UDgJP8MKk6
         M2CeqMqML67bbvFWlIfovhoQMMFoFHAGW+jyG2VTzOFBs7iDbqKimNQvD7l5hZ3wG/Qm
         yy8wObQ6OTCCY3SdRKzqItaoYMIyN6ydtg3ESM3qyIehoMypCNHoeHLuvn0gY+Arw874
         Dgty7xwsFjLYIpRx28xBmwEEE1+xbIO0LeI+fZUjT25d26QrwSaeN3a7UOUkPqBzf/3Y
         LjchtZjY4gqtVQS3UaJD9+pmprW7IfS037YhbPH9hHpOgy9acXBzMpx/t7yTl/7xXVf8
         mdyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgOb+MtjsXqfGWRoSIv8V62Zoe75n/PLXSmxRmBwIOAkKgJJ1EoA2IrhUUuHRpR+RA7brkJzzMpikofHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7fdiEQpvqO5Ymd912u2muvWejdUtAuP/f6i4aB1jBCCbC9U0Q
	Ohvy8GcgHzn5sNT/VZv227t8oXsk0Fcvkv5EiXbSqsmHBUwv1PILYrXURV5igmHAA4jbixUv0GM
	6rxYdI5gkhWjTsawR+U7LmXn7ZVSYIxM=
X-Gm-Gg: AYBFou3rudTkvDvUl+Z32U8ADUrSWe6Fif0aGwYNH1mfv5wGw1gRyOH4ioDdvi/GUAn
	1PG3csGMr/hz4p1+oxu4alN7uoOnQVastYjt/FrhHbI9MBbmFlUvqLOIPCu/adl9AZfSOy2WPNO
	gvJ4AL05KCeK47HIO+O/5OX3quVyjKvd5hRtUTYRyJ/XyzGyRNtTnvsRsc0GpWdLt2hs07+CvtP
	Gni+XTAWHT80niCPTqmHdyDSn51vtfJCkpmDIJRBSHUtMXANd10kwzmQj0zfXTLLrhy5zCorQq9
	dEvgQvZeOISJh69bQTi6Os1rz2OGTngySh4e1lyfnWoQk/SGA8/1WF+mHbj3DFVVtF0ONRFDw7t
	SfVgzxLZwDScROa8tn4MyqqV3NX8yjOikornnrAifR6y6PSizw3kcucvTL2Kq
X-Received: by 2002:a05:690c:38b:b0:8b0:c71d:2b2b with SMTP id
 00721157ae682-8b1b5d115f8mr52613777b3.45.1793288979677; Thu, 29 Oct 2026
 08:49:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-keys-update-type-removal-20261029-v6-3d92b2f9693854230a02@gmail.com>
 <auNGzJIWFt64IMWY@kernel.org> <CAFRLqsXdUfqvNyzNpnz=dvgtHrVyRhYoZqt-CQUo98HW7BtNJA@mail.gmail.com>
 <auNghmbNdKLQ2hmH@kernel.org>
In-Reply-To: <auNghmbNdKLQ2hmH@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 29 Oct 2026 23:49:28 +0800
X-Gm-Features: AclHuK_tM2GHZqt-tCPoNWRLY1HXoFFSXOkHSMBhJQPhDESUOrTm0WDe9EcLL1A
Message-ID: <CAFRLqsVKXJxqpPCj2od3AxnbuEa2Y6PMz00kgAq83pMH5Rchmw@mail.gmail.com>
Subject: Re: [PATCH] keys: Protect the update method check against type removal
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8829=E6=
=97=A5=E5=91=A8=E5=9B=9B 23:04=E5=86=99=E9=81=93=EF=BC=9A
>
> Yeah, overall I think this is improving and that's why I'm nitpicking
> stuff. What I would wish that if you could hold with any other fixes up
> until we've got the previous fully addressed.
>
> I mean submitting a fix trial that is not correct is not a problem
> or wrong for that matter. The problem is that if you put stuff out in
> volumes with patches in various phases, the odds that fix will land
> to the mainline tree rise.
>
> This is exactly what I got pissed of last time. Just wanted to this
> clear this one up. Also, you can use that on-hold time to re-check
> your unsubmitted patches one more time i.e., do your job better
> ;-) At leas for me that is something that I want to continuously
> improve.
>
> Br, Jarkko
>

Thanks for the guidence. I will follow that.

Best regards,
Cen Zhang
