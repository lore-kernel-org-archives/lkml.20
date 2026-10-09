Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA1535C68C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562408; cv=none; b=RsS0Bw4V2GEm3Lln49hddGW4VM8dMhvhUGelwl6bawsfDZAbmcWQupYg3v7BfatbHEcKMCxWNqLJ/SgLAXpo6iVPmYyHz4cdRoMAQpPnQ/QAuWGc0H1O57cjm/K302x765nhyPm4C3wSvRmmm3ad4EERVQI+hWvF7jp6b3paIfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562408; c=relaxed/simple;
	bh=aI0lI99K99g4OWiIyyU9iimqIuo4+tttB2dJpAzwIqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzTIzn9NStYa2ZPKZze/y+IXp1lS7QgHtXm+yliHO8cA7E6IO7qzp3TCBVHMMSyvVdFzG6yAkLQpwW0UuhDoUenpJD8fNhAvBZLxZC9MQk0/AGqBfC3qjj71Pc0A6GBzMjVG6ptfyyC1eNjv/yqBPMwQbT4REDKtcjRtWBfp4wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com; spf=pass smtp.mailfrom=egicon.com; dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b=Zp9xr/Zw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=egicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=egicon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=egicon.com header.i=@egicon.com header.b="Zp9xr/Zw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a020e65269so49855e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=egicon.com; s=google; t=1791562404; x=1792167204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2d9W8EXh/CNMo1CLxiIw/sZcjDyWO51mng42uYG4xNE=;
        b=Zp9xr/ZwoyOfhoqlgbs9YoKAaE0lSG99pS1uIAkzBrkkMi9d91kdfkH9L3bu/rxi6y
         XJuqJc+F0pIG5TScjFnpETdWFqD5HmsszzeA4XJVsssWwPICJfg8dqqnaS7cZ1YuPBqo
         mPsXkBsoCkpZ2bIM6e2u1wSbJWFTDZO5deDMjqpRqNlXPLBYaDWvJd2KJ6XqeuuyzBOy
         f6hRxZcQTjuhF5gErEUEWifnzSDe2i2z3i+8ssRJepGcDJhtAoz55ijzN40cgQmnxE0A
         plU0PkqsLiY1NbchTV/M9XN0II1/5TxllJup+D00s6cgQ44QpLbhIUMC8eZOK93cSPug
         scUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562404; x=1792167204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d9W8EXh/CNMo1CLxiIw/sZcjDyWO51mng42uYG4xNE=;
        b=yTRvMnPheIGr7MLxU2GYHhWRhC0Z1iu2sU/85SkkQNCyVoXowWFGEF1ZV4JaDSSorI
         J0kD69/yWJ9kh8OtALkMkTvXd0QQ+MycEGbjlzUpQ9AVhqaKtkLJDfk9wG9y4JnJq/D6
         yispwAJn8mrTx2PqwEeoCaorfWM7+iL4HMUXnBjute99HVwVRwI7pquuOwU98mAuCP1g
         /CaaMhAWxjtJJpM8NkUrtM+olYHYDwbxLzd/vWorfmIxgXidwZkglCIJzUMVqdckaxTj
         9VnzBNwO0/G+7zDkR6BfdLFN+wMHWBBjzsVSn3IwZyNntnPkMJFQtu7PtveDqTIxiFf4
         qrFA==
X-Forwarded-Encrypted: i=1; AKwUvBw6z2hSlhSk7slM2xslIN4yLA944Pcj7SvxKhpMym4m/vYsaCxl4dea8ae+R2+xJR5P6QYJ3vJHLw9ZBh4=@vger.kernel.org
X-Gm-Message-State: AFuF++kGVbBa97w8hK8TnI17zMBFF1WRtbWdZz7m+9q10ETYxnyOeNF0
	HOgOZHrjplpELeCnqXeLECeStqXMraR2caxUAP5l5OPU1pizwb178cVughWEO8P4pA==
X-Gm-Gg: AYBFou3SzBmSLsHTtveSJ7FSyefXqTvys1sIQiI7kSq7Bi1xj20IVr6Fadwb5sMtkA9
	g81TAhIo0+lg3QU1YtWZP2xlxc2uMSszGrm+s8dbKysJ6LRUWUi6B4aaBJab8m+iwJMsQFhWxyc
	UXSfoHPk9c+kaRflRCBcebI/114wY2lpPHyFoeLJYW6YDp0w9lpyrabMpeaRsaglHXU1c/pUCIN
	wRhph9YoB+iprUpFNsjsdCTQ3e3tuB4gkV+v2wmKYqmEuPEfCqqaz62Xy3/hHdclYvMKmGdlB8S
	e8GULDqBRAEYX3jds7mnPfQJHqX94XQWgbYM/uw6A36k7TBfFT1C1MyFtzsOmicmW6/fY6Lmgsm
	W/ArhPxJG62U/woHxUDhS5UWf+470lccqUNy0jynySDntD8MTrtX02t7ozOjdpXMIbhRCexz1Jk
	4nd+G5SOvYFKpPsv82XjzmRSZKsuqFR51sHNumMiCAdSfAFZi5Xvj+ydevx3IfHCzv2LaSldHl4
	SP/jWrVd0OUViiS7J+GHClIj4ERJoH3W+rd4kb11eNv21FQXIJ8Nes=
X-Received: by 2002:a05:600d:82c7:b0:4a0:17a:8844 with SMTP id 5b1f17b1804b1-4a18e446454mr51163965e9.1.1791562404063;
        Fri, 09 Oct 2026 09:13:24 -0700 (PDT)
Received: from egicon.com ([37.179.95.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf0abcesm76509375e9.1.2026.10.09.09.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:13:23 -0700 (PDT)
Date: Fri, 9 Oct 2026 18:13:22 +0200
From: Massimiliano Marretta <massimiliano.marretta@egicon.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, keyrings@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add bulk signing support for PKCS#11 keys
Message-ID: <hhgoxv37uegtx3memo7spxlesoywbsnavzoezdg7rdrfwog3ml@tx73cw2yhu6n>
References: <20261009101915.495734-1-massimiliano.marretta@egicon.com>
 <20261009135228.GA321175@quark>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009135228.GA321175@quark>

On Fri, Oct 09, 2026 at 03:52:28PM +0200, Eric Biggers wrote:
> On Fri, Oct 09, 2026 at 12:19:13PM +0200, Massimiliano Marretta wrote:
> > Add support for signing kernel modules in bulk when the signing
> > key is stored on a PKCS#11 token.
> > 
> > Currently scripts/sign-file signs one module per invocation. When
> > the key lives on a PKCS#11 token (e.g. a Nitrokey HSM or a
> > SmartCard-HSM), every invocation pays a fixed initialization cost
> > of 25-36 seconds, which dominates the actual signing time. For a
> > typical build with hundreds of modules this is impractical.
> 
> Can you elaborate on what problem you're trying to solve by using not
> only asymmetric signatures, but also an HSM to hold the private key?

Sure, and thanks for asking. The HSM is not a choice made by this
patch; it is a deployment requirement we have to meet.

We are implementing the cybersecurity requirements for the EU Radio
Equipment Directive (RED), specifically EN 18031, on a device based
on an NXP i.MX8MM. To satisfy those requirements, all production
keys -- including the module signing key -- must be held on an HSM
with controlled access. Keeping the private key on a file would not
meet the compliance requirements, and the same token is used for
other artifacts in the secure-boot chain.

PKCS#11 support for the signing key already exists in
scripts/sign-file and in the kbuild Makefiles; this series does not
introduce the HSM. What it addresses is the fact that, under that
constraint, signing hundreds of modules with one invocation each is
impractical. Measured on a real product build with 802 modules and
the key stored on a SmartCard-HSM:

  - individual invocations: ~6 h 28 min
  - bulk mode:              ~42 min

> 
> Have you considered hash-based integrity checking
> (https://lore.kernel.org/linux-modules/20260505-module-hashes-v5-0-e174a5a49fce@weissschuh.net/)?

Yes, I have been following that series. It is a useful approach for
its stated goal, and I am not arguing against it.

However, in our case it is not applicable. Our product depends on
Wi-Fi modules from Ezurio that are built out-of-tree against the
Engicam/NXP kernel. In this case the module hash is not known at
vmlinux link time, so a Merkle tree computed during the kernel build
cannot cover them. Asymmetric signatures remain the only supported
verification path for those modules, which means the signing key has
to stay on the HSM and the per-invocation token initialization cost
remains a real problem.

So the two mechanisms address different scenarios and are not in
competition. This patch is a local optimization of the signing path
that exists today: it is a no-op when the signing key is a PEM file,
and it can be dropped if asymmetric module signatures ever go away
entirely.

Thanks,
Massimiliano


> 
> - Eric
