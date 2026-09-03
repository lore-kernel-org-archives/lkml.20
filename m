Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063138A725
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428157; cv=none; b=Ud1YoVqacVT6tdI4qXdlymcFbBOl77jzsa9w3SnQEvWuP59uLdsBSOE1o/92gR/UR+qbarElepol1/X+ejzsr4aNNHGAzVWk2gSMrrx7GkbEhUCuy5goIvfzRAHwkstvRqtI6b5E1pn5gogLkOC4BGldRR/6DB/2zflTPoOijaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428157; c=relaxed/simple;
	bh=6dxSwnVMhBQ6QrxcI00aXBMeMsbJMY0TD4I+y+LKu/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk+f5/S+YUMYiH3JpB3iDc8P6Suzw65t8KvP1SkWVD4Pm4sjyhgKvMufznIe6TiJ1ICbNEynzirHQiNoBR5LpCGYJxxdYRvmhT+ECcEC/8uGaoFPGi6qGImT09WRheE2Z+VNDkcrF+sqgprBLDrhKRu1Z2bpHfTNwMcWAFq+FsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=exUGNFig; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="exUGNFig"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so17518255e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788428154; x=1789032954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SA0YMkKZrk5pHRtNM6ynurrEGkiVyx5dwe1u190lCDo=;
        b=exUGNFigLqG7qUWyYpfXvNYjTx/7yDbbBtTm/KWAsQhVB4CYbGOUHDf8wYBy6sCAhw
         1FsCyDToJJWi/T0jsZNlAx3vvXNG7Umlr7QMUFHTTI3mOo8KAeea+M6yYNAM6351/4zc
         aqC0Qfekez5FKPZGgqI15mgdQuvmbNhWV3abWKd2ZaJTjJbU/+aoUq9BRIP77f9llJA3
         luOztfFpL9WqdtmXjpeJdq/oUTTTMYS3iZMXq1YK0RjtJO+IwREWyyWNTat31yeU2+mw
         e5pYvFaMROzMXnmWB7CYfHoKJ9+GwdyjNB2t1tLB1Q/1KXNjvOTRtx85yPKJcUSLKF3w
         HdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428154; x=1789032954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SA0YMkKZrk5pHRtNM6ynurrEGkiVyx5dwe1u190lCDo=;
        b=gsXiwui51HZ/WqoMaLZfgY/vv2gyQ6sk4FsxVDbq9XG64qpyr9EmMkGrdAbjRdQf+L
         mYq6b/dU8x8v7gW3MMRvn7HtJHKmAs+KViICli1YD0/WgS3DZofAPVp8Ezt+LmHA+toV
         zOK27jnwSmjKF+Ir/E+qpsBJYATbMjIJPX7tOVyjaEgj8J/VIv9kFAMoPJX9+1Zwdhta
         oTaUpcVppS/aAHsmwJb4pinDoMIwiCjvnHfL7Cz2IZoPOm+B9TFsXvcczIWzyYynjBJ4
         TrWYtRJYimZtEJplNqfiKKnMAZF/+LyeGhoSwJa8PeKs2zenz/dwHGESSkNL95PBP6vg
         biHA==
X-Forwarded-Encrypted: i=1; AKwUvBzqZPDmwJAvU+Qcqg/mO7+fpzIhzceSrlABQMPs+CH0DjzEH68kiZyu2uFIoNHV/jdp3bO4qwcmZceYq3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nQ5ntAfWECaM76iKDDfHqylbXveunvtxVCUx9ToUfOqOi5yLxc
	/4Zy4elztAy7KaL1g1nvQRN3vG2oT00WNLbzQLw0wobIHRz2kTpg7PG1hpGVTVsThA==
X-Gm-Gg: AYBFou2Drz3IOjr6E6Yes7qZhhA7RH9SCqs9HeFUQQsHMkoePUZET+30NqtdtbVbwNw
	07mzZC6adaI+mVzg7vNGnzEuKl/QlALaxN+tz7LT0tPNdF/D++FGK+3GHk9dCWBwKu+hNXxMI//
	ceycnDjhJDkn9ffj4ELmPEHUeZ5Un96J/MkA08w1ofBw1Nkc4ZHmEjpcJUHSYiIGGdb4rI1oVPv
	aX8BZ39+wEZC8hgTgxCtzDnO1VZ1stEuf1NIy73YEK41gsXmB7Oenl4OcSDqB9c/LGOxOoyQzv5
	BS85JS0yLKEgdG0MZIB5z03TLSwrq9NjXrIESOYyHKY+Omc5iKrdrclN/q7uPeWVDlZXLrI17Bz
	slsKRtruFak+o2dxkc4Iil+2I4IW1wwvxzKvmCjUI5MeTGZco2s0LKe/leQZGjJxNz+BrmFGtg9
	PYJx5KG6dfh7VKwqoONeAAhzHzMQHkieNn7gzT4FFQpNEShFm05nU2O4aiIobQ1YQwfFVo7854O
	GHD4wJkeen7O4gXOVsFnj7VAm/KYZnU
X-Received: by 2002:a05:600c:4ed0:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49ce57ec163mr200889865e9.1.1788428153444;
        Thu, 03 Sep 2026 02:35:53 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm55247145e9.15.2026.09.03.02.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:35:52 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:35:49 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: Re: STABLE REQ: [PATCH v5 06/10] tracing: Fix subbuf resize races
 with trace_pipe_raw readers
Message-ID: <apk_dQ4Q6msdw_Ub@google.com>
References: <20260901123444.GA1350131@google.com>
 <20260902-daily-reply-0006-tracing-subbuf-resize-7-2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-daily-reply-0006-tracing-subbuf-resize-7-2@kernel.org>

On Wed, Sep 02, 2026 at 06:14:05PM -0400, Sasha Levin wrote:
> > Concurrent subbuffer resizes may crash trace_pipe_raw readers or leak
> > uninitialized memory to userspace due to stale size values.
> >
> > Fixes: bce761d75745 ("ring-buffer: Read and write to ring buffers with custom sub buffer size")
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > Not sure if this is the latest version or not?
> >
> > I see review comments, but no v6.  Anyway, no matter, it'll do.
> 
> Queued for 7.2, thanks.
> 
> -- 
> Thanks,
> Sasha

This isn't the last version of this patch, I have just posted a v9 [1] and
Steven hasn't reviewed it yet.

[1] https://lore.kernel.org/all/20260901155445.1475405-3-vdonnefort@google.com/

-- 
Vincent
