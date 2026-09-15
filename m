Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD2D2AE76
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789457042; cv=none; b=HuqwesJglFwp3KOC565TkLYyLJxx0XuYcrRqgkjP1Rb66dOGU2WhBViyuFc2c1PlGFhNLpg9m2J6ps/lBgp8Vx0amYZN4KILRUoNtITOP7eA8XuZ7kaFMAVxZwHcLHicuDsjgiFZDm2usVNgL6ZHO7dOETk4mng1NcbbKEGgLAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789457042; c=relaxed/simple;
	bh=AFY3lN0nPpdQzHz01v1mY6oxQ6Y3SsL8Xqae2tfNAfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqV6OVBnFW7qP5Dj73BV0awEM5D77HI4qSA7BIUWarwHfTDRLUhqCK16fDMWrts67/3gK+fkHvF8kYweS9NAQfwHzfIwCUVlEMN3mFvHTzg0N6FPS6NmDC/yk90VVa94d+tZ18nPU5dn8ySI4vUaSSaDQ57H+qFqE+iZqupMnx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kohRUwf4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kohRUwf4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so9799445e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789457039; x=1790061839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3byU7IfKsmqkwQHBDdGKLnfWdbNnlxn1U1wY0CrzBZc=;
        b=kohRUwf42q58l3LOwCyUoujPif/jPGfLDXZiu/W+Spd+D4YG3HA+wfKN0cCbrb2hZ9
         l1aeg0lnWE0IwoKYyISxHoWVOhHTXoQ0VuXW+eQCNWZYo+WZtpjBXITO92VgVNyRP5x6
         ZsUAo4yP9ypAgcRphvB6H9SoCO4lj3fYhpsZ57pshht6428MjHMDX19S7+yFssmo7mTJ
         yD83n6PEC+sQY1Uq1QR964ecr8wVSj3XdSf3MhpBRQ/JMcF42G0cOSdHAQ3VBskhj3ic
         /chiz0vupX/QUJYSMFizeXD1kAc2wede0GpsNbPTNEVm2oW6o9Zc7C9SutCJyY58Iwpp
         MxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789457039; x=1790061839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3byU7IfKsmqkwQHBDdGKLnfWdbNnlxn1U1wY0CrzBZc=;
        b=G0LVb+BMcuiaHVoiVIxySaGlGHetxNgc/GpkmRGvHI5Ljs04V5nM+9AhuwzD8JuAjS
         xxPTAblDQ9r/0HeXZ97Vc8Ro4ZmrUldO/OUJitED3oVqgA5p4EgSeuhqXD7jf8hmLU00
         OR/VgGTOEXSHpj81sZHF9pbk//9lH2qCFaJvBbfObfHGtxAtYBEGR4m/PDBK0eINlMEd
         OILjIkqYdXRXStdk+ggWlNBlDtRmGDclLhUr9liQXZ42VxbhKHmqvHtV7lczvEW69fl8
         3o20xHaiMBWY825643YVAI0mn4Bh1Z9gFO/47+4f7mqfBeAdKsu0Jn9ulJzt6kvwa+wS
         71oA==
X-Forwarded-Encrypted: i=1; AKwUvBx1Fe1m4j2ldGtvWLf04qIHLfMnnRHEA4IOQyxFGb5V+TPXIqUqwamLpFZXI7yY9G1nJdkbeUfc/9ve5hc=@vger.kernel.org
X-Gm-Message-State: AFuF++ku1UL7Y59SccEhiCbZxKUud6bOUjJ/N+jiWojCSeeqHPcgplCy
	frJLw7lClRNO3HzQwklX70qP3Lu2wdlK/VHkOx6yER9mC/k8DR32jpPFQgiepaXnLQ==
X-Gm-Gg: AYBFou0ktUYo2B1YVNKETffV1YJn4zZHNjtTvPnaKg61yHh4IwQhdPKuuuBiFdF398i
	8dIts55CfelYzYUGRVN4oYOZIakFCELvurQhCRPCXRuiMF03P/tSgU2JQ96m9JB9v6o45Oa4XTC
	AoJ7gnSvpR95dpWFGJmZkivhsuPPMmjZmcxbwCtc6izN8QjjaUvqGjxtBi2tY6lWQaWorqkbVEm
	c6GWDPjuaQ+WjK8BXYJ1wdbiEs2uTYSuSccQiMgPcZDdqri8M9+TBmMTOKf5tbU7c8PTbxHHWET
	9W53cosKIE+4LMrUMX3YvyE44EoiZO0SGwyJg5vgF0jubQCQm4jZs2PYW47415QaVU99DircvoQ
	z6BwwYTNHWg+d8GE0jSnUx9tqtD53N492LE0YLrVS28P44lgNEquMGqu0z4Qoo6A0kkeEd+fIJf
	HGvlr4PGt7BA3hplf1052l11ppU42rclLEVhoshoqszy86lllG6brHfKy2h4xmzH1VKuIzIdDJr
	cy7D3mS3IDMMCpwhOPUGQNoHM0AwMy8OMuFix7arj7u/KF8tJosuA==
X-Received: by 2002:a05:600c:c162:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49e7d72b000mr32527185e9.5.1789457038909;
        Tue, 15 Sep 2026 00:23:58 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm52818775e9.10.2026.09.15.00.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:23:58 -0700 (PDT)
Date: Tue, 15 Sep 2026 08:23:55 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: David CARLIER <devnexen@gmail.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ring-buffer: Clean up resize_disabled checks
Message-ID: <aqjyi2RD4oSCAY7z@google.com>
References: <20260914175907.1027349-1-vdonnefort@google.com>
 <CA+XhMqxp2XOB9PnfHJwBvK0up8Oej4hGcnsM0a=fdoRDyVoEyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+XhMqxp2XOB9PnfHJwBvK0up8Oej4hGcnsM0a=fdoRDyVoEyQ@mail.gmail.com>

On Mon, Sep 14, 2026 at 08:09:24PM +0100, David CARLIER wrote:
> Hi Vincent.
> 
> > +   if (rb_resize_disabled(buffer, cpu_id)) {
> > +           err = -EBUSY;
> > +           goto out_err_unlock;
> > +   }
> 
> For a single CPU, this now happens before the nr_pages == cpu_buffer->nr_pages
> early exit, so writing the same size to per_cpu/cpuN/buffer_size_kb on a
> mapped or persistent instance CPU fails with EBUSY instead of succeeding.
> Intended ?

Actually no, I didn't see that it is also "fixing" this discrepancy between the
per_cpu buffer_size_kb and the global one.

It seems to me better to align the behaviour for both interface, but then it is
touching something that is user interface... 

Steven, WDYS?

> 
> > Additionally, remove the unnecessary cpumask_test_cpu in
> > ring_buffer_subbuf_order_set().
> 
> The install loop still has one.
> 
> Otherwise removing the second check is fine, the hotplug window is
> covered by the cpus_read_lock() patch I sent separately.
> 
> Cheers.

-- 
Vincent
