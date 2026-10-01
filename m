Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E5547059
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870375; cv=pass; b=tIUMM6oYoiYSyUWSwuwrRcGE6OtvI68+qRJjcVS2gHEtKxW/CDxJs7kNgO0jAlSm2/BskzcZTj6E4WTcZtjW/SpDYE2hoUjoVOxBnApaIBvuTN1lHoEsL47f6c238S6/bGxDbdMx7cn/CBiasQVuAj7oA46mo6zFmcEwcQLBoEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870375; c=relaxed/simple;
	bh=WzhH+AtHGPtHiPjBQHHacP5urFUcd2FtjAYYwProfL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qFiOpQuDzlo7JgBvAFM77uxdHKXdjw5CjPAOQLQ7f/jC1+1qzwpcoBybg/Jg4g51YGSWQxminGeiAH8GADV5NsK/94e5w229Mu5vpnUAV0IlRFg5YqPIxdpRGz9xQFCW04FiN6SFOgTTKhG2m46qGNmbooqjJ4oocNxRz/NHvG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Orol+tSZ; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Orol+tSZ"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6aeeccb7d59so1304580a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790870371; cv=none;
        d=google.com; s=arc-20260327;
        b=qaUbfA8eur9KUrfYIBQeetAGHrNMnhgkTmBDAeLYc6SxlOVJIHmP4FqXUECjpsuLeX
         q+SJ3hbWDlExj284pp6EAxBIaV+CdIvvLtI/fRVQ9WbZtR5hZnRCqYA01Qb09N6wefK0
         iDspJFgm09RJBgCW7s78L5eizLL04KhcvG/8WmY5u5gj2onmAc2vX8dNejf8u3r9+x9h
         pVS5FKcTSl4mkoYcf9BBbTM2DvOqKruS2i1qRARL9eg8zwwr40tZA0+iEGTD1wtx8DxK
         WakcW5bjjoqIyvyg3tDFWRWJeDqSlNut8CMqPIBMg0aTrkSLdeKtCuWjprrgU9P72+qj
         cPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WzhH+AtHGPtHiPjBQHHacP5urFUcd2FtjAYYwProfL0=;
        fh=vKpfAvGIjf3uMPbhCpT5orO44hLQ7xFfeJ2oIEi7Ve8=;
        b=NZzrA9e/PKrrvRRy3QmRB918VD/Mi08dZ+bA7Xq78qLXEXujPk/DK9QD7nVttqyuHs
         AAZS8SsruU4vsh6CT484cLySVCsjyB/99JOHz+VvshCYMEsUuhtjfvPo6aD5RB+YrlPV
         uqrikLd+Xz+SUpBx2wwhj8xT7JGLLgP9gnFYCmW+sVE5zTQGabnmrp7mMEAXCkxa+6QO
         Gvmcivv9DeJwR8WWEbMKmp+ZooVGx+0q2+1CL7wdtZy35gJqJlOh6lZvu7vCLLx+2mKd
         VY/EbRFA0Jq57g2bYDiJwNytmshmVVxyLCFUs5hit8J9DymdvEVKqiNSHDeqb2gaa91p
         yKIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870371; x=1791475171; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WzhH+AtHGPtHiPjBQHHacP5urFUcd2FtjAYYwProfL0=;
        b=Orol+tSZBNLX9gZGMk4VE7FB4y5rq4WvOH/SMMYTZ1tayK5cGqICbAZloM0N8PA3GV
         oQK/aRtbF4/NFvOdiFWkZ24lpA/mOlH0KVcSMo+7povFut8nRiJOBmGDSxUOSZw44E2y
         EZWV6V2tmeZgGWIFtMldrGaisnKqcSuKnQvmLflUtdkYaoS+kk5MlkittbehSTC90QG/
         TCSKJd576x5AZp48CNphv8ogFSKoH2DIq8wnFtTM5SItZGAPJnhNBCOUgs4wwnHUTiNh
         Eu+/Mkf97kDcpEjtAad9qT7mt6LlMi4bdkLJguR8UWziQ9IYQsIGXgxCdQXMpBw5Yo/r
         CBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870371; x=1791475171;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WzhH+AtHGPtHiPjBQHHacP5urFUcd2FtjAYYwProfL0=;
        b=iuux4DsI41jB4//VetAATh62GhSixVZtcNu6eOQoKXWalUQmBBzL2X8/FITv7nQwDc
         b8RLSt7hV/SmtUBbznpeqtW9TFdQcAorYluuZ+LyRXYpxQdEdT3iMUwCf9cc+tGbzFXS
         RfT++Q43yVIIt+7gIpozNreHQ3jTPwAnlv+rNca+JWV9ksxXg0L/Ai+9gRD37arJbWde
         yv8YVfRXIrz3mVf31SvRWiZ9OAUVmuH4yxj7fBSFHejLDt2jJ7JWhWqNqUxHVAgPGtvP
         ZjG195/8M0jY4XsCEqV8wdI/VeWRVsTBYvgXVTviiq4mDriFD4FDVBtGOa4ERJKgbCiK
         DS/w==
X-Forwarded-Encrypted: i=1; AKwUvBwBMYzN6HBJsIS0ZWrKHbaX5g1ZYJ2hhvK2XpM+tD3litCufQiDTAlLBSK4ZUmJQFROWXzHnrok+KhVvz0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQVLzpH9mIfA8s8RXBMvbhXsA30InePQ8RvXDJ9JxWoDXeFZ/X
	5RoduiKKo0IQ7wPCg5YosFIZACj4z/XRJgAsEEbVQYGOG5rFng5gzqTKqo7gzErhgDTaB9NSsiP
	n9mbQV5D4/wt3ei54AktFONFMaHDGQDZYJmFaOWM=
X-Gm-Gg: AYBFou1hechYqF7siBOdN+VakcXhfNlMEw9S7y7ZNaZZVIWWD1fMOVflQB/kfG/cLcg
	uFBR0haxuamNRyJGEOKzxTZyH0MfVbOmxp+ax5ibLEQ44xmkPQoYn25VX+JCvoglkdNOy6JIaYw
	YAhHd6xjLWW4OzO+1zBQ5reB6zHZzyEqdvHa/r1wmEpN8YY0PEpvNRohPkZ4hTlxX6sVLzpkbAe
	/OkbPejsWwSuzFmOjJ+YtnJYYL45ys1SYUYccjEPYsusqRXtMBCVb+wHYhdubkrw7GF2tAFZCVh
	PomjDWN2khSL0YEw3rlPuJKmqeLBhYIFJj2vULL0VJ4yLnJfpRtNIv9KkQ0K+sJzubs=
X-Received: by 2002:a05:6402:a544:20b0:6af:92a6:97df with SMTP id
 4fb4d7f45d1cf-6af92a6a414mr619051a12.0.1790870370498; Thu, 01 Oct 2026
 08:59:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913185016.523376-1-jkoolstra@xs4all.nl> <20260913185016.523376-8-jkoolstra@xs4all.nl>
 <20260918-reklamieren-syndikat-gemildert-763b72008b46@brauner>
 <178972607557.207413.4312278359822083538@noble.neil.brown.name>
 <178977609418.207413.15011378414000392029@noble.neil.brown.name>
 <1010887891.582666.1790682845752@kpc.webmail.kpnmail.nl> <179072013439.37859.465558431050704411@noble.neil.brown.name>
 <CAOQ4uxis4tsea6fx+9iAffVX+qwBC9KzHg5GcP7ahthKd1T9KQ@mail.gmail.com>
 <1910540525.790746.1790806610320@kpc.webmail.kpnmail.nl> <CAOQ4uxhYHf-gAkjdhs37vZREOcNds5a_6c3nBX0Lva3resofmw@mail.gmail.com>
 <1000409963.929534.1790869356300@kpc.webmail.kpnmail.nl>
In-Reply-To: <1000409963.929534.1790869356300@kpc.webmail.kpnmail.nl>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 1 Oct 2026 17:59:19 +0200
X-Gm-Features: AclHuK_3dF_O5lWW3SdzB7Kw85o723RVTI5tcpk87Y2IdVrsLp_0nrCYqG-LJ64
Message-ID: <CAOQ4uxism8-zwCDgGjO4Rxz6DqOkZJeZOeYKHf3QaBDFZHpcFg@mail.gmail.com>
Subject: Re: [PATCH v6 07/12] vfs: add O_CREAT|O_DIRECTORY to open*(2)
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: NeilBrown <neil@brown.name>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Aleksa Sarai <aleksa@amutable.com>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"

> > Maybe I am missing something, but I think you misunderstand me.
> > What I mean is - if directory inode has a ->atomic_open() op,
> > bail early with -EINVAL/-EOPNOTSUPP, because this is a network
> > filesystem that does not support atomic O_CREATE|O_DIRECTORY
> > and in most likelihood never will support it.
> >
> > This gating criteria is not dependent on cache state,
> > which is what we wanted.
> >
>
> No in that case I think I've understood you (or maybe still not?) My
> point is that we can't do that if we want to be able to individually
> support O_CREAT|O_DIRECTORY for some ->atomic_open fs. If we bail early
> the how can say only NFS support it at some point? You get into the
> situation where everybody needs to have support or no one.
>
> Does that make sense, or do I still misunderstand you point?
>

If we gate on an existing criteria now like ->atomic_open()
and/or ->d_revalidate(), we keep semantics simple and it
does not limit us to change the criteria in the future.

But I don't insist on this criteria - it's just a suggestion.

Thanks,
Amir.
