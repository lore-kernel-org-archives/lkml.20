Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716F450410
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465335; cv=none; b=LOtkT2C0w1j7xIwg9VLoxY/C5UqYk0MHUEsKlzHaChOPzqiFgw75m+gmhWsrxwOOQN1cwgH/Q2DOsa31167t5AvJKIR/RKLDAl+bviDeW9d5z4pOvztTsrAcRmU/0uhki5P/o9ic1kiKvT7OVaB7bbIXfuN3eE4slLACvj7qx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465335; c=relaxed/simple;
	bh=tF2sfR90ByQ4zAQmGJLfIxPFLaLCH5TutpIRk1Ax8Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8qbFJ0GZw4A8U5An9IyS31NpLOcQgx3dKCRbaX7YOMe3VlreDuV9bxls7RVIS/M8wIiRo4JYUWkXYj0IXeGXG3G568MQpAZWhKEoRn6u9RMwmq04jKgkXQJGpyAHMKAvuAgR9eW191vVQp1t55zHQKar9wTJAAJt44zV682cEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d+HAhC/Z; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rq4iOWit; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d+HAhC/Z";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rq4iOWit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791465332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mdgl4QmjWzdny8ss9pAt+FzG7msq5IqZQ3Yf0eCwcMs=;
	b=d+HAhC/ZEetVIV+arFkH6UQGifpIh8gxL2WbosO7EFebXuhCimX3cWsXKI3rAEdMJmNmeY
	E1maqH8D46V9y1YIaFF/N8zs1W30Rwg0deLjoiJj+MN+DhZtDs/1o9f09xxu88bwwc/Ubk
	NdL3keNLOjxoGSyZE4oeAvzsZDPoml0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-92AN3oYDN6Gxn951VbUOdQ-1; Thu, 08 Oct 2026 09:15:30 -0400
X-MC-Unique: 92AN3oYDN6Gxn951VbUOdQ-1
X-Mimecast-MFC-AGG-ID: 92AN3oYDN6Gxn951VbUOdQ_1791465329
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso600685f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791465329; x=1792070129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mdgl4QmjWzdny8ss9pAt+FzG7msq5IqZQ3Yf0eCwcMs=;
        b=rq4iOWitWMdQdVmKOMPbXxyznc9nXs7pRnMmuV9h4VH+5BNaYnp9w7rnEB1BD2+dKK
         Yfc95iuutYwo4auQD6LRsSJcors5f4BwJDEpeBfayGmqVXDuY/dhHZqP1J/up06fqoI4
         uTXTJ+IQhXqbJ7CF9v/TER/243ou4nwv0iBbveX/55lBTxi12QzUgseHzEW+j0EJu/QV
         TWSM6fI0I/PWVksU2AA6qKNK+zfJsdqu49yN2sDnx6x5353EpvDF5ptWSQjHaAiSBONI
         DvigHnMKuIMwmR2AH+NRbuQK0TalTp7nuOAMfAnDqPTSA20RCGl/2z6mmPJYklmCyiBf
         6KcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465329; x=1792070129;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mdgl4QmjWzdny8ss9pAt+FzG7msq5IqZQ3Yf0eCwcMs=;
        b=NO5KC1jfq3NidmK/yNPKQGalWMPtkLMeYkL1O+IX0EXY3dSnMiI6IWcPm1+7waX66c
         X935Ujt56SNGl54AZcUchYkGvvNkGKyVO21ABaJPxwlgtSPnnLduzHkiozOljevzJaq1
         QFnqmXDw79XUeumYZ963ovO9/fR6DJ2QXnAKOel0ktXmkBdNE3DD83E1fyc+L9jKrY4t
         5w28fhsSEicl8FNo+LsAy1YM55DQNhqDDkuylPJ/PcClBAkEAj8q0vY5vcw6CweAtUjm
         /u0qS093UETv22M5NtmbWT441QxklQKDi/BK6TbnMCOyrNtHE44gUceZMzINJAoC7Z6o
         nvQw==
X-Forwarded-Encrypted: i=1; AKwUvBxdKuYz8FA25Uzfx2xGIQaeCb4iXPGBh634SYyBixWLaUUPHX10KKBr6EWBV2wEhuoJ74Bax514+YkBdMw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/ZpuWIQ2STq0sbW5lKVfc5VmaOic9/IgnbYGf15wyCWz9PXdB
	OJDBX010aLBcdI9+ueohWTtt2cMu/l5I7Etg82kqiaqCWQHc/gCGF0Re+o4qz9ou1PE9a7r/7kL
	O8mmFgQbAyPPrfnjs8edyxYs7yLcIHPFNv2IbqGTcvS7FS9o1ZoZk706+qMpt5upwZ+co/mUdyA
	==
X-Gm-Gg: AYBFou0l343lshgDZRbLEATfOG+qNYaPmSEafqiO2wt8n6/fI2TpwFnK1h/8P/oasSf
	2GJ4MIcauWcVLoKxus/kcZOQOaMB5rOfbmSMKfCRgkXd6hhahEkSUCqPPgdeWyPrW/dg9JRVyNe
	7CXgjS6Wo3qc3aXp9y+WmJmvQ6jJfuZz2qcqDjcLHmFoyE0J0YusBAl0CZ5/aeMj2i3/29idx9e
	7jIUez+jR15pSjEoYUnNyaf7mHojK6GjyPabh+yflVsfJwOJ+IAOzAPMwLTQYHMzRvAEQuzNXQ+
	e+SB268anxglwve2gkZ6p5MLJYF5qOriIDHDMbWKQrKaualrHo8fpw/GGXZtBe0jsC4x2LY=
X-Received: by 2002:a05:6000:1a8a:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48c727891ffmr9525616f8f.28.1791465328643;
        Thu, 08 Oct 2026 06:15:28 -0700 (PDT)
X-Received: by 2002:a05:6000:1a8a:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48c727891ffmr9525547f8f.28.1791465328031;
        Thu, 08 Oct 2026 06:15:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7af26edasm6028256f8f.1.2026.10.08.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:15:27 -0700 (PDT)
Date: Thu, 8 Oct 2026 09:15:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
	users@kernel.org
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Message-ID: <20261008091406-mutt-send-email-mst@kernel.org>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>

On Thu, Oct 08, 2026 at 08:51:19AM -0400, Konstantin Ryabitsev wrote:
> THE REST matches every file in the tree via "F: *" and "F: */", so
> get_maintainer.pl currently adds linux-kernel@vger.kernel.org to every
> patch, regardless of whether the touched files already belong to a
> subsystem with its own mailing list.
> 
> Only add THE REST for a file when no other matching section provides a
> mailing list for it. Files that match no section, or only sections
> without an L: entry, still fall back to THE REST, so every patch keeps
> reaching at least one public list.
> 
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Not that I mind but it sure was nice that literally every patch was on
lore. Are all subsystem lists archived on lore?
If not maybe a new lore@ list just for archival purposes?

> ---
> LKML has become mostly a firehose of patches that are already going to a
> subsystem list. The reason is THE REST: it matches every file in the
> tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> single patch. During the week of Oct 1-7, 2026:
> 
>   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
>     sent to at least one other list;
>   - with ~2,100 subscribers, that is about 29 million deliveries per
>     week for LKML alone.
> 
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.
> 
> This patch makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list for it.
> ---
>  scripts/get_maintainer.pl | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
> index 16b80a700d4a..966595c3a6de 100755
> --- a/scripts/get_maintainer.pl
> +++ b/scripts/get_maintainer.pl
> @@ -959,6 +959,14 @@ sub get_maintainers {
>  	    $tvi = $end + 1;
>  	}
>  
> +	# THE REST matches every file, so only fall back to it when no
> +	# other matching section provides a mailing list for this file.
> +	my ($the_rest) = grep { get_section_name($_) eq "THE REST" } keys %hash;
> +	if (defined($the_rest) &&
> +	    grep { $_ != $the_rest && section_has_list($_) } keys %hash) {
> +	    delete $hash{$the_rest};
> +	}
> +
>  	foreach my $line (sort {$hash{$b} <=> $hash{$a}} keys %hash) {
>  	    add_categories($line, "");
>  	    if ($sections) {
> @@ -1295,6 +1303,23 @@ sub find_ending_index {
>      return $index;
>  }
>  
> +sub get_section_name {
> +    my ($index) = @_;
> +
> +    return $typevalue[find_starting_index($index)];
> +}
> +
> +sub section_has_list {
> +    my ($index) = @_;
> +
> +    my $start = find_starting_index($index);
> +    my $end = find_ending_index($index);
> +    for (my $i = $start; $i < $end; $i++) {
> +	return 1 if ($typevalue[$i] =~ m/^L:/);
> +    }
> +    return 0;
> +}
> +
>  sub get_subsystem_name {
>      my ($index) = @_;
>  
> 
> ---
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
> change-id: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4
> 
> Best regards,
> --  
> Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> 

