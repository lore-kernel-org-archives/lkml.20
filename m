Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A59275B03
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266015; cv=pass; b=nM/AzoakVFVKEG3AeMK/qsWf7oVew5+ByM5WjiWxavGNvtjWb/wLo3yD2Xpx/wQlTVTQ7e49sY2yjYyWR8elwDMg0N5BuLVt47rkiP70eWn83XvSKYmnaQlrz2nBXJ0gYIsboxJosf4h/J8xEiJd/0VA9J5zyXkC+ZvjS5EhD84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266015; c=relaxed/simple;
	bh=tTilPEePkpjTFCruJKJ/IvVnzIPmWB7ZxbAkmTpfbLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=inZBiozSfg6s8EbNig9U04Ooo1FscbzF9uIxmxjpbrpwTPnpXkHn7ZwIZyXZHNj5BaaNRMdXVtFweXQ2xsR7/LaQJEliMf+jpiuQU1Ah5GGGZ/7weYIpjwtHlTDrm//WjqmUJcFxojwNr+nBLsMtBtUdV2IQZ9jj3brZ3RigIko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LwULko2B; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LwULko2B"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso24915455e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:33:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788266011; cv=none;
        d=google.com; s=arc-20260327;
        b=iWOBJZ1JJMbXWI7gfXnk0zICVYSFm7D9WMez+BGfxALtQesRcFJTZFI5gVJWPmyTtU
         g3rkwHfPFVxrj9CK0NFWumeKaRyMH0GdbuhYm9OByjzN1FPje6vfwRef5+BnpKyqNqOI
         MwGv+2WgsMDxfkaZzRyUoqcgfG4u4L8+rj89DI65HTZxAuYEvmzT5sfx12XjeCVHrfZE
         Z/AliGH471FIj3gMkhFQf1ZvOo3c0M6XWKiveQZjPcEXMx4rJDdeDUDlKjvwHbXxlRcy
         Q9X5tSqiRAwY0+NZNCfXmxt+L1uLeiRXqa3Nv3F5fHd1EUG35dmTCDDGxgGZ5tgvdf2i
         dDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cfOC0PiJENFhgp3GUEin/fTduYk5GNhKZ1VkMcNkAxk=;
        fh=pKP0e61QnTAKdzgOdFUvyWx7Yj/o6hUG3teHWDMlIV8=;
        b=Cd7iLxyVP8yG8/eq6HeV49texqS1U6bg5Euu88UFR3UPw90z2+9VPwni4quO5o1YxJ
         N0ranPNGtpnbUwSU2OcaxgpY+ckTtfk81KewCO91ZxltV3rFsQkCqymoHsOsO/QQ1AS8
         V1Y9NQJizHiOUkXqDDcaVeHH5+djVFTjjsigpKc9WtwcKMUvUX8RveOpbwvxfhEKed6Z
         G3AsafsXM/p3NLv53OaV946aAL1FJrLH61JSMiMQlikdyDtLtX0kXtTMYzVxX0ikxLLB
         UefKW1itr1CKXbWlEx945ccLp2Q98L3YPBUZtbLgmzXux8t9ORJG6lBu6HWR2I6uOcZC
         OWFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788266011; x=1788870811; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfOC0PiJENFhgp3GUEin/fTduYk5GNhKZ1VkMcNkAxk=;
        b=LwULko2Bs2/mrcLVVTaUXuF8PSdjkYkM7/aT0kj3uLwex+mk+2tR4S+4gfN0f9f81f
         y0tITeUFsvdVAIOSundN4TaLgBLXIklaAiLC9FCYq/6oVyvNBCOATTVCaKQgmmkq5g91
         sVSJbFUHpl1v++n4aVhRL0t+np6VpsuFHXngdlrNwy1liHtUPiTZvsjdVx5oxjrzmVAc
         iIgvUafOTrGYjXM+hG8UghqxdwaEi4zYMeWAjKmGSl6/AcwLQ8ywIkVNCj0F8yv5XiOJ
         z6heTKm6E1Ho28SNQcNkp1eU/9ja4Q9ZgktC9cZXnzagpNWsy44ijRIIC9dlo5G9EXWJ
         qViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266011; x=1788870811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cfOC0PiJENFhgp3GUEin/fTduYk5GNhKZ1VkMcNkAxk=;
        b=Fx0LUPa0alBoq1B/biB85wf8izfW5LepYSkH+4U9RJOv0wEyOjs49vkPueJbn1g+5O
         FqEVmgv3FRf4UU9aRB/ezPP1wJoNN1KPC9VMTT/Jz/xrny0ZZuyP8AIw3WJeWUW1w46g
         XRKmEt113M22LD93vKzG5t607zsxXNDyXpLLPl82ROUDcGts3LGRKveNc/15OKfsCGyS
         mpFoLCXVZlkTQtlkwtoP6xmpjouEZ6fG3MfQbCcMAiSySsvw2P03emOKpXgJNb97hNfA
         h1gSy+ZXjkNqQ1xg4YCMo+9tEwt1Xm9zpM71OzkL4SnTulQvR/eUmTvdVNr6/AiaCC3Z
         Whvg==
X-Forwarded-Encrypted: i=1; AHgh+RqLItq0piOg4sgV262OXKNkX+gvCG/cbaTRu1n2mIoBu7Fhx0no/+jB+Db33VIt4SzM9unHODt3scPWv7U=@vger.kernel.org
X-Gm-Message-State: AFuF++k7RdEqKi2hadBDcInWyf2THowZNCRovMz34O01JWzFGVP99p5l
	O4y0G0PewH0d3wGhRu+D0p6fi5ukERZ5AvQMxDcnXaeqXeON8wk2yeO6p65eQpu249olEmsyL1h
	DFo9nzNpldRP5IRm+HwbDKg7NM9dC0iThO9sJoISkgg==
X-Gm-Gg: AR+sD129xQhC9ooOMT/cnk4led0kb7s0leCFwZS2A6mvO2BIRH0+JFhwCvrizyf9e64
	DOHFNd3BJtiTZPqtWQqjUK9LLNcg/TAa0V4BOw6xdZFDYFjYSSksPuJDBI2MrVLegcJtPmpLI26
	rQwJhgwE9HCqInyTPbL+V4VFwWUp7bYAEwz6PzaC6wMKM+K6TtiHZNSPDnPZcIRa7HW2yusjbPk
	ZrApXpDO/mIladvDIl3Np8yP9TeC1X+ESFOtSDcWsmmmOn2mDvEZns3QCmXqtUZCqA/5YR5TLnQ
	w4wvPf2y+K0p+qVS3YMlbBf2dVJZcJLlBpW/jtcXmP47b1AC6oY1/XjRH0VLuRqwitscdrIBDtf
	PtdSrFQf+S7TgJxdHTDnzvhn1yK1QIjubE8BuLZLEdQ==
X-Received: by 2002:a05:600c:4f92:b0:49b:90cc:3c87 with SMTP id
 5b1f17b1804b1-49b91c487b2mr523873155e9.13.1788266010932; Tue, 01 Sep 2026
 05:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513085340.3673127-1-neelx@suse.com> <20260513085340.3673127-6-neelx@suse.com>
 <20260602024849.GE2295@sol>
In-Reply-To: <20260602024849.GE2295@sol>
From: Daniel Vacek <neelx@suse.com>
Date: Tue, 1 Sep 2026 14:33:18 +0200
X-Gm-Features: AcwNN1X9FeJn91s56e1qLRSgSxckd0pjW883fuhQnYtX531oivm_yi3cZJJZjtc
Message-ID: <CAPjX3FeiYo3XZUuO5qpNaOavwxsVuM_qgs=zRNuNe=bh_cGerQ@mail.gmail.com>
Subject: Re: [PATCH v7 05/43] blk-crypto: add a process bio callback
To: Eric Biggers <ebiggers@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, "Theodore Y. Ts'o" <tytso@mit.edu>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>, 
	linux-block@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 04:50, Eric Biggers <ebiggers@kernel.org> wrote:
> On Wed, May 13, 2026 at 10:52:39AM +0200, Daniel Vacek wrote:
> >  /*
> >   * Supported types of keys.  Must be bitflags due to their use in
> >   * blk_crypto_profile::key_types_supported.
> > @@ -77,12 +85,14 @@ enum blk_crypto_key_type {
> >   *   filesystem block size or the disk sector size.
> >   * @dun_bytes: the maximum number of bytes of DUN used when using this key
> >   * @key_type: the type of this key -- either raw or hardware-wrapped
> > + * @proces_bio: optional callback to process encrypted bios.
> >   */
> >  struct blk_crypto_config {
> >       enum blk_crypto_mode_num crypto_mode;
> >       unsigned int data_unit_size;
> >       unsigned int dun_bytes;
> >       enum blk_crypto_key_type key_type;
> > +     blk_crypto_process_bio_t process_bio;
> >  };
>
> This new field needs to be initialized in
> fscrypt_select_encryption_impl().  Otherwise it breaks native inline
> encryption for ext4 and f2fs.

Ouch, sorry. I should do regression testing on at least one of these.

Thanks.

--nX

> - Eric
