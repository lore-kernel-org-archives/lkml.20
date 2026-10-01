Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764FF3B4EAC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898256; cv=pass; b=iAYb7iEpC/S+NvKWIcQTKAoGc1h069ZoUPkwMeZWJLEvok3XTgvY3kFKoS3We1o58ft8DwULcVLMOxypzEx0wvHH2fvAthdRoXS8kxRMl1PP5iJnwk+reenZREH1zT/FLsjMz14QWO4flsEcAOAZYqd1JwhPcLkW51Hx7Osl16s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898256; c=relaxed/simple;
	bh=o2g104Wfo69c4modhI8ohmf9z/HmP117IrUmXcvK64w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LO/+00k+eLNHkP2rXlJ6NThwxrDwKsUE17W13ws4qfguQsQNaa5sxa9NK9+52ByTgMH5HjaSPMilVqfEeepXcvavu+v6KP0+zu+KNT+dcWEGmfUKKoIlaZo4eR9BcfpaYKuV0uc0SBFXSFnzul6o1SfrrOVd6vA+vMS24fSXC4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJo2CXMy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kRvG/Q44; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJo2CXMy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kRvG/Q44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790898253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7C0wO41olnFgIkFyxcI/7Fxg3q/LgyAQWGzA9515Wqo=;
	b=YJo2CXMySVAfdUwdP+daGj7wmYg7TIoAJGpc12rzGbWnzr6XeoecRrhcYucUhP0XBUfF9M
	tryRZGqW6YPJfRQtgQdkAvWo9HaIijGnUigUbWbeJkMIphOI4FWZpYPmoBBZfnE1MQR/CI
	XCaExTGEJ1cQFbRR8OQNuiUzjmH2tS4=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-ooNI3qVcPpOE88HuEzHDeg-1; Thu, 01 Oct 2026 19:44:12 -0400
X-MC-Unique: ooNI3qVcPpOE88HuEzHDeg-1
X-Mimecast-MFC-AGG-ID: ooNI3qVcPpOE88HuEzHDeg_1790898251
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3a782b8620dso8107781fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790898250; cv=none;
        d=google.com; s=arc-20260327;
        b=gE4OAEiILNO83U7+wld7uoYLtab2xr6EedY6u3c5Lz//SHVX3O8LuOmrpka+fP3JPn
         +sX0oJd7TGe/JvWes0xS067hoprBqqiwq3+Y0Y9XJFuaPBLmRL5BWVP134NAHPPXWYJb
         BCdAm9vUBUq8LqF5601+gAZYbdNXnSpvwe07DcTRb4xdILWhQsvA8EKSztoT+Mrnu7tL
         O3mhAfb1tPm0Ug94IHvyc9HXg8erc6RSmNUBQ2AQtyB5bKzST2JPU4LL3ITdQigUSg6O
         6C5y3tQ7StLx/KQ79YS2TdRHAWmxTbqYnX0IZu9K777B6opFtfW0g8GQm8eXdldDilNM
         jQNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7C0wO41olnFgIkFyxcI/7Fxg3q/LgyAQWGzA9515Wqo=;
        fh=d4dVVbRlQVWeCKNh1O8C3kfuaQTacT3lNB19k4e0eYE=;
        b=ptw/NF53w2/xeME+eWWz1BPDtcW/QacY7//2er/iCrE3WOR/Sz0CyJXeGjuWJckepk
         AoB2HqjwVlTatCnReiSjUSAJIqQhziID8HZeGcZ3lBQUqoEr/Vjwt5vDn6BDpca9ryxM
         jdrXGpxjz58qfhDerJrN2jymTI+IMFA22GWQlYpGpuAnLhUye2rulEkC4/Ajzzf39Pl1
         fTXu4ZxmHh8DxeSFjIBiDddptNzBZWoDtafLg6GdfAJB+PGVktpDEye4n5hxKFZySWly
         SU9CN+ymT3WidJXeAR1p4AcUQymxoQ7tEL3yfoWP/r/BgQ/N0dWjAHi+aYPZXhYhnVnZ
         UrEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790898250; x=1791503050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7C0wO41olnFgIkFyxcI/7Fxg3q/LgyAQWGzA9515Wqo=;
        b=kRvG/Q44Mcxy9Q+bEiiQ29xWdD02nPuXEPkTe1VbqWDq+FbljtgK8wpV3kuPLiSjiy
         lMhckjmcd7yYtKHchWqPltgqx0Brmo8yOHZk+aQ5xNm2Aj77WqgJEpCQEkGv1Yzvb0Nd
         18Z0C+cC+TKyWYm2aEigciayDYGUq0VJyct5QyvxOiQnXUhR5xM8zIaLyrc21AoMTC7u
         Q0yFeDIqm1YHOyVKBu01gJBZX8aNVSOjmuhqEjrewKFkKxriBPpFRp1tc7qJMppaup36
         foEab+I+BY86GVZwDzFle2361vfism9JvIn9yTD4FBa17b/h8HBlEejuVWRNQ5tTujXs
         48ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790898250; x=1791503050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7C0wO41olnFgIkFyxcI/7Fxg3q/LgyAQWGzA9515Wqo=;
        b=M5W6mr1/mHcCNTLH7MpLwnvluVGYeDLTbn2EBuIezruVmf1tmG7A+FsWLZGVqagu6/
         mAfXzrilDpty3jvIh4KmGVmTQjszjZcUnNwr1aa2P7SDV1Fywch396Aol2jiZmRTg5Rf
         Nj153GmcqqBNiFui55kHL2zbftO3WcG9JZAKleD/2aRoMqBcuE0WPZCDnCMukIpgZvuP
         Po4b/on4EK6lUYINx2TXy8p+tdTIyrvO9bUSEeV1C0I+jZyWdYswYWvjUKlwNhiWPAxd
         c74qgyRoauUhYcOmKaMYN5FF2cTQk0PzKBlWftyNxskkSRSZzNEAnYM0UH3IG1uWuAU1
         RBrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVy4hxNBomB4mIFG5NU9siQulLEZZ+CaDx0RLXpxuZFps0IjWQcBKMs9z5qo8Cg0MRd1xXC4Qi6b+GZN4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEf9BQoTvlMU/yY5xK5sXJHCt4+6+mFyvb0r2+J7i5U8ipVhFz
	etW5tTEdWXkG+dgJQxZctRJmtgs7CeOMU9YFyyP15dMiDsJedLxgfZFnjv4zsNZN7BaGN5W59mo
	gj4/jD07bJBk2p6/cHwajqWqE5fFNRF5Zyqub5lk9W6AbOoyUHrkS/iSh+D2/zzjusfp17pl9V5
	FTDyzARncsfYdjSkw5b0xeTuAiAw+feRh5Odt/2gap
X-Gm-Gg: AYBFou3Q54LxllPbtxVXpjXD844JKX2KLSZZHRSBAdVA3BsWJomhYtfOTVS3R58uvpJ
	HKBtqgwZGa72XxysQI4fjn2d4x02sHemb6nC+dDxCMkzLF2gC0ECnXoSpcZkSkIT4/432oPEh72
	/KZx/uoiBk0cZwEOTEquXk+KpRbK7Jo0wjn+XYWf2KG8VNhBoXvBKnUTwJ
X-Received: by 2002:a2e:bc29:0:b0:3a5:d070:9fef with SMTP id 38308e7fff4ca-3a887787567mr1692571fa.10.1790898250545;
        Thu, 01 Oct 2026 16:44:10 -0700 (PDT)
X-Received: by 2002:a2e:bc29:0:b0:3a5:d070:9fef with SMTP id
 38308e7fff4ca-3a887787567mr1692511fa.10.1790898250148; Thu, 01 Oct 2026
 16:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911065357.3511466-1-ljp1205831794@gmail.com>
In-Reply-To: <20260911065357.3511466-1-ljp1205831794@gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 1 Oct 2026 19:43:59 -0400
X-Gm-Features: AclHuK8B2IlGXv-cagMI52YwLUQveVZTRqqkPPRuJDKafJ4tVysX2bs9w7uZ4e4
Message-ID: <CAK-6q+iB2jjvKN+p5WmMap3znWPUhXXT0dRsCFK5BcAXBJRRuA@mail.gmail.com>
Subject: Re: [PATCH] dlm: fix RCOM_LOOKUP length underflow
To: Aohan Mei <ljp1205831794@gmail.com>
Cc: gfs2@lists.linux.dev, teigland@redhat.com, linux-kernel@vger.kernel.org, 
	Aohan Mei <henrymei@tencent.com>, TencentOS Corvus AI <corvus@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 11, 2026 at 2:54=E2=80=AFAM Aohan Mei <ljp1205831794@gmail.com>=
 wrote:
>
> From: Aohan Mei <henrymei@tencent.com>
>
> receive_rcom_lookup() derives the resource name length from the
> peer-supplied 16-bit h_length header field:
>
>     int len =3D le16_to_cpu(rc_in->rc_header.h_length) -
>               sizeof(struct dlm_rcom);
>
> The 3.1 receive path only bounds h_length to the range
> [sizeof(struct dlm_header), DLM_MAX_SOCKET_BUFSIZE] in
> dlm_validate_incoming_buffer(), and the RCOM case in
> dlm_midcomms_receive_buffer_3_1() performs no further length check
> despite its "length already checked" comment.  A peer can therefore
> send an RCOM_LOOKUP message whose h_length is smaller than
> sizeof(struct dlm_rcom) (48).  The subtraction is evaluated in size_t
> arithmetic and wraps, and the result is assigned to an int as a
> negative value.
>
> Both consumers of that length only guard the upper bound
> (len > DLM_RESNAME_MAXLEN), which a negative len passes as a signed
> comparison:
>
> - with rc_id =3D=3D 0xffffffff, len reaches dlm_dump_rsb_name() ->
>   dlm_search_rsb_tree(), where memcpy() converts it to a huge size_t
>   and overflows the on-stack 64-byte key buffer;

This case is already covered in dlm/next. [0]

> - otherwise len reaches dlm_master_lookup() -> _dlm_master_lookup(),
>   where jhash() converts it to a huge u32 and reads out of bounds.
>

This case is partially covered but lacks a check for negative values.
Can you send a patch to change it to unsigned int? [1]

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/=
tree/fs/dlm/lock.c?h=3Dnext#n632
[1] https://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git/=
tree/fs/dlm/lock.c?h=3Dnext#n1273

