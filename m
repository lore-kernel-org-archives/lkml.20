Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567937;
	b=IuDR1LZM7niuGu5CWrnWGb7SNwmv3f/V4l/7Fv0rva9aDkz7oXvbym1N041ZWUTKMLm4
	 tOcyBGNzKP/El9jy5JBPhbhOly/HxnEskFUqwYktoflS3fYVY2nquBs4LLsOpouMe1I5Q
	 Y56MdMpLoHMeXCVqHpqNzy6jp0XzCdetalIbptBJ0/pZowgp46wMKY7gX952zAann+Qzq
	 EtNT+YlyTAWv0Dc1PPOY8Ixa38cvrk+UKLn3Q/zPEW6r2N9ZOsGaOixOQqW5KpOsZxb6b
	 kzK9AbTKTN5mFnIBQuKzbuQC5IedE65Y0OrukvmX/ko//+cnY83FeYjA+uIqiS368CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567937;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=hDulsKUXTiaWl7ljBHKiX3WkjYxWKjQtrQrwS29EqM0=;
	b=up+GseBnzQ+6rYK29OESGD3mD9+Yi32yErvk08frf8FELLyebhYOwDtSA/efTU0SM8Hr
	 dnnnkCzH0UKzJkzcXuZjCwFBe5imgnnc7HnCTBvZBzF0Gpf4APyLcsbZbBqHprLxXBDAU
	 KmfTu36TEiRfk2YkM5+MiDLKj6II2HVTlosAD3JjcxS6vYv9LHSV17ive5DU8G7dUwejV
	 saB9vMfeBOSfinf8VPRxLm560yf6puZEJUXh+EFAHQuTJ4u0VVrSVuqI9lQxiP2GRXv0N
	 tAkMQu8diw2dmpK3SaW9gWeKBjcILMZigVL8F16gB/j0Om1Ixb7mMTJBrjXEQh4kPIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XXuEPWHW;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCE606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBDCE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XXuEPWHW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794567934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDulsKUXTiaWl7ljBHKiX3WkjYxWKjQtrQrwS29EqM0=;
	b=XXuEPWHWyTbdA6UB2JG+A9Xq+tH0yShUWf0kae4HuFOmy4bYDniuaxIeDjzhFpDOtxbdQ/
	QLgyreyGVksDpTLhNowhKZGQKd802ihUXDUnLDHCh4qqKQn0+PL5J2Y0eaX70WnllrX+KR
	o3Tt8oacgfvYT6BkFrQkgUm+459fRzo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-646-RwV99ItdM5y-209Xr24W6Q-1; Fri,
 13 Nov 2026 06:05:31 -0500
X-MC-Unique: RwV99ItdM5y-209Xr24W6Q-1
X-Mimecast-MFC-AGG-ID: RwV99ItdM5y-209Xr24W6Q_1794567929
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 560A1195608B;
	Fri, 13 Nov 2026 11:05:29 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C94E1341;
	Fri, 13 Nov 2026 11:05:24 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 13 Nov 2026 12:05:29 +0100 (CET)
Date: Fri, 13 Nov 2026 12:05:23 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v3] uprobes: Use flexible array for xol_area bitmap
Message-ID: <avbu0HiCiDE9AVHs@redhat.com>
References: <20261113052948.2668076-1-rosenp@gmail.com>
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
In-Reply-To: <20261113052948.2668076-1-rosenp@gmail.com>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

On 11/12, Rosen Penev wrote:
>
> The XOL slot bitmap has the same lifetime as struct xol_area, but it
> is currently allocated separately.  That adds another allocation
> failure path and a matching cleanup branch without buying any extra
> flexibility.
>
> Store the bitmap as a regular array and allocate it together
> with the xol_area. The bitmap remains zero-initialized, while the
> allocation and error handling become simpler.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Acked-by: Oleg Nesterov <oleg@redhat.com>

