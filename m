Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320D3033E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270623; cv=none; b=dKhclUvmEFepXaUu16W/KSF7JBmM1BO2ig21XWP9CGysBtP4/o8VFafQOPIpCrErJfzfh4nqexS4tMoEnLsBrfis1bxk2X2hE7/GUmT+G5dKrTFPjgVqWtmHCROcxqm6sAN/U8i5EsRH98LPHDXGVGcghTxsgd+eCigV8HYVvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270623; c=relaxed/simple;
	bh=WynuTooh3d2w4bp9yyON0x52RjuGtTuYYXM1KX5OJEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzYRiYRVaeJ0exavkKjsyA8+xXapabJV/5z5zkGW4wShuUCzRmWTjAWoIKAu9Sklky9ZvGW9hz1jeUeaMPR0XWeIMeT0htS0bs1BeWk9KsMbtf+Y7FAMdCq0nHbjsJ2y/ptFeQZ6UwJryOu40A61SxpWDeJPWWHZmli5fVqSOpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gg22Jx5Q; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gg22Jx5Q"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c207cb16cf5so793667466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788270620; x=1788875420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8+SZOE2xWNs6AbBanAPIBFLsvkxmbh30lToZDOa/Pk=;
        b=gg22Jx5Qw01lioC0iaWB8DT6B8dQEafNNz5j4qYEcayCJlyo4TAkRZnuItB6qkWeTM
         uO8TmfOeN9gDYbwXvEXgrNiuXsmI9yE/DCm9o2KXxGJ0crj0WmHy/WXdCwaW+iikD2Bd
         P9OVKmecUTFoQ8qwOYniOhCIaNgKGRkBDdfHtt1lFZs9h6GJ+Acf7GfJGp0obAQK/ffP
         22z4KWM551+UG1e/J/bTnzoYulxOhiR3YmwDJrK0KFej9dZ4tmIDctCw0tH6lf0eo/Is
         MYy/qsueTmttzEQOJskT3SB3Jy1jeSZvV7oXAp6iI4htszKNsbtSWFfcrdkOw1s4GZqc
         jvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270620; x=1788875420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8+SZOE2xWNs6AbBanAPIBFLsvkxmbh30lToZDOa/Pk=;
        b=Vrm1XV36wPBMHc2CIzdeRWzHOCYwT9LK9hctjbYFHEMabmKdI9d4jGuKqYtAKKZdNp
         DO7+ISKBr3f1AvHN0Gysljt8PQsuBUz7CDQUybs3f3sEg4IVrHzGfW8DyozXxchBlmBy
         zwWtcT+fKm9dNr41fwaShnCsUED1HQOeyQughphLSmfva9/LsyRxFBI4nUmp8v7Vgvlx
         fuzzd5ufOJ0I3ytsDENxqksiFbjG6fcPqqs0WKLaklVX76Wa4eii8KhxY27wypuDzgbN
         SS+Ruef1KytGtKhq3HuncJWoBsUFjQa9lCqFtrARjurV01TnlVcGsI6Xo62H6l9xX/Rq
         LWVg==
X-Forwarded-Encrypted: i=1; AKwUvBzQ9FWMpYvBO0rQT9488poGDRrA7QyeO01x+n9iTKujg44Rc4eDdWDHK+8uQj2lBQLvqUmd52B6FjXIaVs=@vger.kernel.org
X-Gm-Message-State: AFuF++nwhcUFEP7+jBLVhS6HtDdW2FzImEbFsI2apUyZlY3WiE4DBgh5
	xN+cFGyUN9s5BwsoECjIM11UmMrJG5/k3P8HZnar5qe/iQ02+bWIuGGqTAjTzfHEUg==
X-Gm-Gg: AR+sD12vSd8Zp5zWQNwL1atlCodn6gjd5wh/O8w516Tt6kLHMh0GA+HkLGBHUaAwoJ0
	q3GrcL/FUMPO4PiOLSqIR5CR9sSFWrdzdkl0MhBBUIA3xvKu4IpVZxSRpdh1oFIGIHVwirXjDOz
	bumbBRVwgv0FtXlvPgf3C1ob0BDFxAZWaAxEhBW0JavL8xyJDtf9q+UY4JF4hwNju/pNsl5RLvO
	7ZdUR4dOtpTH0HFl6kbgy4EI2mRqE5euFx1xt3TBKtM31dvHr5Q/CvpzSEaAtFKooBW/BpnzOMt
	XugK39KOB4GNhWYTXMmrL5lpQlf9S0KIHBT89EgBP5hO6nEh8ygOHmMcjQYcNyZLX1CCB06OTJg
	yvOfmpOkmG/FCVL2OwZlGn9BEWqXj699I1fkNn0GgxPd1+P+iWazdL6oKEAPweruSeFdQJwAVGz
	mqiI7ju6FYi4b6DKJQwJZBe9VqE/vtGEVGVUxGXUZr0as18T5h5Az8UU+/eGdWnZfEUHRhEcvES
	xtGjVwCegf0RGBcLcxb6gSbstXC1QST
X-Received: by 2002:a05:6938:a08e:20b0:c25:62db:772b with SMTP id a640c23a62f3a-c25b3bb8c0emr448253566b.7.1788270619586;
        Tue, 01 Sep 2026 06:50:19 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1443sm588471166b.41.2026.09.01.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:50:18 -0700 (PDT)
Date: Tue, 1 Sep 2026 14:50:15 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Lee Jones <lee@kernel.org>
Cc: stable@vger.kernel.org, rostedt@goodmis.org, mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: STABLE REQ: [PATCH v5 06/10] tracing: Fix subbuf resize races
 with trace_pipe_raw readers
Message-ID: <apbYF8rGD5EKG-oq@google.com>
References: <20260813131152.3589632-1-vdonnefort@google.com>
 <20260813131152.3589632-7-vdonnefort@google.com>
 <20260901123444.GA1350131@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901123444.GA1350131@google.com>

On Tue, Sep 01, 2026 at 01:34:44PM +0100, Lee Jones wrote:
> Dear Stable,
> 
> > Concurrent subbuffer resizes may crash trace_pipe_raw readers or leak
> > uninitialized memory to userspace due to stale size values.
> > 
> > Modify ring_buffer_alloc_read_page() to let it handle the resizing of
> > a previous buffer_data_read_page if necessary and add a new
> > ring_buffer_read_page_size() which enable ring-buffer users to not use
> > the racy ring_buffer_subbuf_size_get(). This makes the spare_size member
> > of ftrace_buffer_info redundant.
> > 
> > Use those functions in trace_pipe_raw readers and handle in both the
> > case where the subbuf order is modified in the middle of the read.
> > 
> > Fixes: bce761d75745 ("ring-buffer: Read and write to ring buffers with custom sub buffer size")
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> Not sure if this is the latest version or not?
> 
> I see review comments, but no v6.  Anyway, no matter, it'll do.
> 
> Could we have this applied to Stable please:
> 
> 8a5f63637890 ("ring-buffer: Fix subbuf resize race with ring buffer readers")
> 
> -- 
> Lee Jones

Steven hasn't taken all the patches from v5, a few of them were not ready yet.

The latest version is v8 [1]... and I am about to send a v9.

[1] https://lore.kernel.org/all/20260826094528.3738023-1-vdonnefort@google.com/ 

-- 
Vincent
