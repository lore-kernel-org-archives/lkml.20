Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCCE40099A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419729; cv=pass; b=Q2+bi13fQVvHqTe01yvVe4GNZSwAUrMnQSKv3sJb6tP6s9JZI/xc2QmWCDgnz5uDW9eH1RNsRDrdTIjqmj1rkx4G/6QR4O8hikH3oQ4QLDYqd76FZehX1x//9F6bvh1C2tmL6cPelun2a3EkPr2NgyPNO9xoz1/dfJSAjga6ksA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419729; c=relaxed/simple;
	bh=BDxUrAidUvmdE4UU9/YWqxyp9t94nH6PJ+zSqrwq3lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VbB9X7xur6cw2sq+DFUSf1U4wsDWydTjhz8s5ORj9ZHlM0W/SvoNBJsgVLh1sLM4I0ABFUIiarnsKajBE7sETDQ7rSj+tKA1wJVQR8wEKN38xmIhs3fXJtMg5vgrkoVQLBMC7KV7QAioWWBf0EDUz3sqZHVHmKN+PU+nOi4jLL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=A842VfL5; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="A842VfL5"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5300bdf61d9so22378711cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788419723; cv=none;
        d=google.com; s=arc-20260327;
        b=a1ZPIUUrGIuzSv8kzpNEAEYSHmHFmLl1YqAyU+M/tihYUDF+O+i1yMGnxFsws23Lmn
         nYO4MTfORVRs5GVOSVeQGGBGmQ3g30kwsSMeWLFUuUZTHQWxaePrNojh0taxEjZnqgMP
         CSl+sxrVv7LXheFyhfQSKcXrp2RwBlskzsoJ8m0n1UAAxYKaDgPYull6HV1m8E+J9E8D
         jfmxw5xfkcevHrP4Uw9yqszpfRzdWc+IUOzQuEh7oYZfgiMAKMaWDzgAsiYQqAC5AM+x
         WANYryL8P2+MV9HqkX7wJE8xnuSMe0ZZclCySGHGYEGjPPLuYUH5T6O7SPdL7NM7iXrz
         lh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/3ZaVDaa28jmLpu92uijSHs8QLly3pVgpirsXkJfs5Q=;
        fh=42HPEvKTmzF2KP/efOH/DuVjcGGPd5ERbzvfbLH3MHg=;
        b=lFHu+LcGwq4vouYakPs9U+ua/4el3XgKPCODQ00YRtoYQSmYwb2ZpbIEg+IMkB4zud
         MQiHc4um3rlfGL9PY0f23Tfv1/lbJueBYa6QIiu6K40WDIOVbxcA7tOan+m1qeX/VYTX
         KiwEJmsb/3d8mwpO/kDEzslwA2PC8WenQquocXsXpDHDoq+bfqZAQNHT3zMIhlNr5izs
         1XMGWO+jn2b4Iamd+s2lBMvwPXMhhqawVXJCiGuACE3bZYjKh8SSmK2Rr9OQFZITKX3C
         3hpWhPNqoGd4vO/lsAHgJsJTX9Y6AhhsOJkhwxmvRwsbKstvNQ7AMpzCsJG/qXAT/7Zf
         bZ1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788419723; x=1789024523; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3ZaVDaa28jmLpu92uijSHs8QLly3pVgpirsXkJfs5Q=;
        b=A842VfL5K0OpzSSxxjPNkNV5MiR59ugdH6e1GHMuyaa4pG/yubkJabr9X4Y/U+Jal5
         szQ17bcOR3Lx4dZxqbmD1f90D2Rd1GjBLqWZ+WVc/JIuSJZUqMwoJYDU9ZlA4g6waLkK
         UFfG/IMy3RCUCu5+4tx1PLshY26VwN7Lr32sdnt/LgVophkd3DFDKFRQMXMBfGa9JCpk
         75NVcrntErd2puJZ13YamB2hYuYcXBnBRzKLporwO2iseEfGVgfUFzo2DuIMsBWMEK3l
         d39Z3MTnRmVZTYYUwNIjfMNFadD5+AT1Iz7vDT5Jsr4NoaRwnAcAmOiZz0rwLErkRMdQ
         fE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788419723; x=1789024523;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3ZaVDaa28jmLpu92uijSHs8QLly3pVgpirsXkJfs5Q=;
        b=pcjawMvqnjwFbZsoAyIqnR1EDkt0DsvT9T20SWmEXXeLaWyJF7Z0zfK9WChAdw55Eb
         uR0Wi5SRRmuu24Gj/zFYSca6cBQeTdHFgFbHzue1ogToX72dM6YpGriouah3Lt3F5yZ4
         Xgafo3cpbUtUHiFOK/6BblIhDRKIyaUL7WTOAEnfiNMs0ADDxRIvrGtpEiX2E5IIV/jL
         CM06avO9uKzQDFPOEtAr6AcKgJk9vceIfH6mSNe2YS8QqewxFym5fPvSc3KTfrlRSJ6G
         vHDH5EdRRFgzEMkpl4m0OcLeNguzouW7X3Anfpw3MCd/D/sjyiuntF0opdUNL+ALZWGY
         2FWg==
X-Forwarded-Encrypted: i=1; AKwUvBypIh3+jNZPl8clXoORye9SO4sVX+/CSrMcEORxm4CqtULWjfxd67yNztHrE/7wg6h7g7vc++2qy6hU6SY=@vger.kernel.org
X-Gm-Message-State: AFuF++leuf2XaWKZVj//eRA+iv2Ctz8c4+wkiRAsIMWI3sMbU3pUt2V6
	Rmg7eveNFs+Yeg3ZxHq6h7z4RcPArmQU+wzhLIXCYAxUmtXyVO2j5iu6jvRAz0F0E9E2oQnMaEC
	m095Rp6nGKoOupE+RH+3Vl1vWQ5O+WM14k5U7P7HJkw==
X-Gm-Gg: AYBFou0OMvlb2JJgRghg9JguvMZiM5UeleVy8ZyaVHAaTRk4+cWpWfr3Snd1HQwb94S
	aMIm8OsFdQutyFJz91WKFHTdzfgtuW5jgYX5NnVfJE85SMANDGHdmKIb1wry7L+mT6L95+zGf8s
	t6ZC0EhEJmCH690ZimbPGn15d/wOb2SPo/bQ84z80B8A7wukoV7Lvu6XqJ9WG6T+QpCyy8mh4ew
	hwBppxa7AFmgGN7pS4ySeZ5c2QJ3fGYvMmPqgN8GtCjLNPBaQ4NY0+TL5k0QsoAn0vOb0KKOemG
	3HMvdA17j0Nz45Yd21xssKTfWBVReaAeTfsMUUicNHk+If4i3Q2L7AieqxyYhUvrdjwGVe5IXsV
	miDY=
X-Received: by 2002:a05:622a:138f:b0:530:1e1a:fc70 with SMTP id
 d75a77b69052e-53036bc87b3mr104794101cf.1.1788419718250; Thu, 03 Sep 2026
 00:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-acpi-char-v1-0-742c450254dd@thegoodpenguin.co.uk>
 <20260807-acpi-char-v1-1-742c450254dd@thegoodpenguin.co.uk> <60e25773-b3c6-4aae-a687-92e1ab3b141e@app.fastmail.com>
In-Reply-To: <60e25773-b3c6-4aae-a687-92e1ab3b141e@app.fastmail.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 3 Sep 2026 08:15:07 +0100
X-Gm-Features: AcwNN1WIqW6SG0lDemdV894_p4DFDolE7YAmpidzaCNJPpqblz3q1bAvW3wQFoY
Message-ID: <CAA6zWZJRpUzbz20daytHO4ygqKosM=YU8UyBcWnm2sUmaEHbnw@mail.gmail.com>
Subject: Re: [PATCH 1/4] char: use named initializers for acpi_device_id
To: Arnd Bergmann <arnd@arndb.de>
Cc: Clemens Ladisch <clemens@ladisch.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mattia Dongili <malattia@linux.it>, Weili Qian <qianweili@huawei.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Corey Minyard <corey@minyard.net>, Peter Huewe <peterhuewe@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I don't think this is the right approach: I see around 1500 instances
> of acpi_device_id data with plain initializers and only about 50
> with named ones.  Converting all of them seems like a lot of
> extra work, and I'm fairly sure you can just change the
> driver_data to an anonymous union without this.

Sorry for the late reply, I was away.

You can change it to an anonymous union and the kernel modules can
build and then you can go over the code and set the designator only
for all of the entries that will make use of the driver_data_ptr field
(which is the union's second named member). However, you will still
get -Wmissing-braces in your build log for all other initializer
entries that still rely on positioning and resolve to the first union
member by default (the kernel_ulong_t). Adding an exception for this
warning seems like a bad practice. On x86_64 all warnings are promoted
to an actual hard build error via the defconfig. The other option is
to use more brackets instead of designated initializers for the items
that resolve to the kernel_ulong_t but that would arguably make the
code worse, inconsistent, less readable and require the same amount of
churn. Therefore, converting the tables first and using designated
initializers everywhere to begin with, before adding the union - as
proposed here - is the most sane and clean way forward, at least in my
opinion. Perhaps I should add this extra explanation and information
to the cover letters. Unless you meant something else.
