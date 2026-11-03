Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705387;
	b=QeFFqhNO0rSzAz/FYrU+U6M1huil2DIdPWwHO4CcQlJpgjmS1hX02RONNvcPDRtYHIEN
	 DvJU4GPtIZ3pmpabQ9Cryc7XMMN27jEOQ9WFqzNx240OEU7MyKYgSOhdNL1SIhvUk+Y26
	 C+IYy60WHlJ5crTh8l07/yAgnRzE54Nn0pELBSjUV9/EiqwLUNzVwXngNhJMdJA/zf6y7
	 8xnHVUglFZWOAUckzIHJ+4m7fBxGKktcVUXHx/tDsh1Q/XiMHF/rrQks1+taqwAxgG3W8
	 NErWx57NStxfCJnAkP55vgYrMsaaWnGLLigF1mCGNIE4ZuYgQW3jmyMAtsOFaR0KOFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705387;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oqpCgjchCrdMivoMsP5bHNfJWAP3TxpXuX0zI0mcmjU=;
	b=lwaMJQ52DAJ26rPTIgb5buiVqLimrGfy0BuZ+I16Qm1EPy8Y252ejkCtQrdur1gFYIb8
	 9h1S6HvmTBr6g4kqxV5pA3EFOaxfgsIiPPIJ7oBVb4RJo+an+Zb3jVW6aeaT2r5gW7yAl
	 obU6HgJ0uTh82F8p3pihJmTKb7liu3IKo2+sjoVxXMGtAMU99Xz6hfZtsrXRuPhLWEjda
	 CXpLL5YeKUwRnIZWOSsIbL99c7q06m0OBgYA4ivvugVwY4/0PLD51ia1POIeQ3un8IXZs
	 N7g5xLMsyu5q7bSFtTSHlEZv66YXgyzVYFKQO3IGkeZq+rrWebjYx9W3KgbtLSnjt7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W9VLyRyb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UgpJx0lx;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE3606A819
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1DE3606A819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=W9VLyRyb;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UgpJx0lx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793705385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oqpCgjchCrdMivoMsP5bHNfJWAP3TxpXuX0zI0mcmjU=;
	b=W9VLyRybhhxlYe5/e0f1V/YI9mNU5375wRXxIjIKIVI0AFWKCePI+E03N0BPmcVnSImCGn
	WXKROXw79rvzRIQPVuD5ff8EjwUCMvRWwn1Mlj8W3fzwtKMAZK6l/kONZN0bs/TM1494Nn
	W9gPGTs1rmsRlFhgJaIolgZ3HJlf8UE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-BcyvBduqNo-sj9lii1jhkA-1; Tue, 03 Nov 2026 06:29:44 -0500
X-MC-Unique: BcyvBduqNo-sj9lii1jhkA-1
X-Mimecast-MFC-AGG-ID: BcyvBduqNo-sj9lii1jhkA_1793705383
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so29341395e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793705383; x=1794310183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oqpCgjchCrdMivoMsP5bHNfJWAP3TxpXuX0zI0mcmjU=;
        b=UgpJx0lxbmAu1iSFNE+9GNxSFA80mLzqU6yYjLywVbgm827N/TMJvSXwMarNdg9arB
         7mcz/t2wjfc38sswS/t8MwQ52p6yOXska2WcwiatHE8Hm37DlAF31jbIWAGNWbEbft7M
         whABXD5XInJYIzeVLGOKnrH6/S143AwqGl6nJcXAD/eR+1GG3razk/w9DTG0Pb0FN2kO
         sFsubrbsnFcbh+tdJcIhZcuyex4932orm9f18mzG+xfOL/qpVy85lP05MQ93Io8iPiT2
         3KXB+PErl3albM4h3H1E2QPqfXDv72qQmxgTaXzXtpVfpyzmnjBN8H8ABTwUooFC5v4S
         N4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705383; x=1794310183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqpCgjchCrdMivoMsP5bHNfJWAP3TxpXuX0zI0mcmjU=;
        b=WfbDGmbv+VA44NWJnL8gjulNn7+QDncV9iIwqk44D4Kc+/GGdh0hVSY6neRdbbj3kf
         3FwKlT0HzgzJctz6ijzvhlPVfS14N7l0hajjKk0pMUz99YSy2nl6DRtedpK1qwm8YUgT
         7Bw/u2J6YoxVgT23WmzoA36fVu5Lq+Cly4aqs23kmQtYdomdOIXJzvTNb1mnNhgi1a13
         zvKrXKrZ+VciNRwBhtUPl2lyV9rF5LNhzIUQbyOHjexbFkPoJk0svhagWHtVYIby9aRB
         2R1rpq04lcl0hIxRf+LofW6MlJMvnciDv0Ks1rpXk1a0RlZawmJOliu6afCRAbIOUV+5
         /jCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKJ3fiylAuEYtvsTfcgmzF6W0/FYsWlXvWYgg1FYgKucNzcOcwQvuL27WLroczttqJqax10g4P/npZdjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RN3DqFCc3Y7NNZrzaxP02DwEL4E+8L44FcVANFczTnhjpU/ob
	Sy8Pt242GqO83BBxRiayqfqLhcYa8okxfRZGG55vC+E1A1ykQaZc7OgJi5gTwtRsVJanFFy5TCm
	UHC4qGVtidXZmJmEpMIfN4dWy/4+Jpiw9p1MNoiCniYl+X4s+V2hI2UD3jGGJC8qH9w==
X-Gm-Gg: AYBFou2lUAbBfTF0o4Rc+SbcHpGaecu225vXiCOuy0nlzp3rW0i7m1ss+LSFgaramIw
	OqxPpmGVhfNsTKY0f7MTeq/iXnnNoVSEuMrf22ktwSGZArgHKUWfDNlPqMuOJLiVSYSKrH1fLBq
	hCeep71yreMBIU9rPUMysW8fuxOLkzjWFhYQXEqO/Ej7PmsF2nZEN8tad8NrlKnrJYIYcxEhAFk
	YFeD+lVU61+ktyxVzA7IpfvYFMW/bJJR7xC3sf86+ZBt9gjj/4yCXOeQdGhl4fQGt8MJRE4hfze
	snHKYnZact7NEQTHzeJrCB2biCxStpY6bL/YxZBCGmITd3KNfVgzAVBWvHF0+KXfU/GsnnRAdfy
	prSSOr1gHA72+Bu1iS1vho1HLFj4Z3Ed35dYwhUffqgVK20cW3KURPLbdzOBjN2T5T92+yzW9y4
	0Rag==
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4ac180f2fd3mr305846565e9.30.1793705383406;
        Tue, 03 Nov 2026 03:29:43 -0800 (PST)
X-Received: by 2002:a05:600c:1f93:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4ac180f2fd3mr305846255e9.30.1793705383088;
        Tue, 03 Nov 2026 03:29:43 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa38bb4asm49981275e9.6.2026.11.03.03.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:29:42 -0800 (PST)
Date: Tue, 3 Nov 2026 12:29:40 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Andrea Righi <arighi@nvidia.com>, sched-ext@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: sched/deadline: total_bw leak when a task leaves SCHED_DEADLINE
 while not queued
Message-ID: <aunFpOODCbZ9UtiE@jlelli-thinkpadt14gen4.remote.csb>
References: <2b5fb3f22bca6aa383be8f4781923392@kernel.org>
 <auRh42kZI1xLIWNr@jlelli-thinkpadt14gen4.remote.csb>
 <1a24bcdde0bb6e4a8c839351002e841d@kernel.org>
 <auhhGAjRtuSb5JP7@jlelli-thinkpadt14gen4.remote.csb>
 <auhw3ctxwy8qeOvs@jlelli-thinkpadt14gen4.remote.csb>
 <0c5a32d85c3bf4d9fa3bacafa510b51f@kernel.org>
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
In-Reply-To: <0c5a32d85c3bf4d9fa3bacafa510b51f@kernel.org>

On 02/11/26 06:34, Tejun Heo wrote:
> Hello, Juri.
> 
> On Mon, Nov 02, 2026 at 12:15:41PM +0100, Juri Lelli wrote:
> > Would you be able to re-test with the patches at
> >
> > https://github.com/jlelli/linux.git fix/dl-total-bw-leak
> 
> On 473adf013e43, all three are fixed.
> 
> Tested-by: Tejun Heo <tj@kernel.org>
> 
> > BTW, it looks like I could verify with reproducers I pushed to
> > https://github.com/jlelli/sched-deadline-tests/commits/fix/dl-total-bw-leak-reproducer
> > but I'm not sure if they are similar/equivalent to what you have at your
> > end.
> 
> They cover the same cases as mine.

Thanks for testing!

Series (including additional fixes) sent out as
20261103-b4-sched-dl-bw-fixes-v1-0-dd761fe005b4@redhat.com

Best,
Juri

