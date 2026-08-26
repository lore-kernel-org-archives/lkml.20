Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B693D891D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769888; cv=none; b=oIglbDqLu5ZMd3KTCl/Hd3RNOjYknIVnV8JqOK2tCqDZpKbRTR0XpeO05+P36jmuuGodaUdSo9qVnmUD2v/bXATqmjg7dAp3ckK0mm/QBLFrsS8ma+RoxFJhgMce8c5BvB11LyB016/CK4FiehkxjWYFVUipV0HkFHC/6QWwVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769888; c=relaxed/simple;
	bh=o0kVe7JlFi7gzakUf0MOGw4UB/o3OZf313s3MQZXBnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIshLmgjBAjiM7ouHi2Cp4JBeSTagYioG4MdAYabb4YbHstcNquXXrVsRv8zDyh7/g404kpboEyaL1AXhNYRsYH/GfEE74z9mYEnE4fCxO4C5yB9qQXHIftu8I2H+kqzdSdcDq1PBcGVJ6W3jQHy28NYX0zk/b92qErkho14Euk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1DBsUNB; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1DBsUNB"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15b51ba80dso19742066b.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787769876; x=1788374676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BW0yqpxwrxQ/SfbZ5SsmgOBwBnQNnQshpDL68C/c/1c=;
        b=d1DBsUNBFgXsxMUPgZ5beYhy+WT5j4o5cxSq4AHRqO51Wy6x89VAZtwrjgyey+yWUf
         s6RSZGdeJNOhUuay5EsDGEQFoPjLzeH9uGRPCGhgCLlInN/uXtDQxiYMUl8X4U4cb5gu
         pYw8MpuG0TJoNXtQnP18+nNu8kZWmbr4cXCXPoMhW05IeHCAJ3CZon4FIRJ8LvUoDiFe
         IuITCsTrpeH8wFV44nctD6NbGp/CEDkteshsMVckBHQOPTPPx6rw8Z1R1a59Jq2jP1nU
         hbhZHeYu8mZpLHuSmu2KUsAvYZVDv3rto4yys4o0SsYG/CPOgmaYT4FiOYgbUIiNGo8i
         wg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787769876; x=1788374676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BW0yqpxwrxQ/SfbZ5SsmgOBwBnQNnQshpDL68C/c/1c=;
        b=QK+G7jizBcdFAs30fxsgXV/kwE2iPJBMlaMP7wONV+xnISSQOW9krD1P1f0j0rVUQ8
         0R967B2MKhALO6jLFmA0VwYqZaKyiD4YznxqVNRncmFPXvAlD4/NpkCTbDjRSJ8uzoYC
         0uwpPiZ73OWBrI69Lp2/twD16DC9fsN+/0TZCKCmbRgsIEXzy/5y6ummuVrnG7WmlIF4
         eZhlLPJ/fnjZXnZAk/B2QuCf6Yo5UdGK5E+kY42g0CJSFzK1YgYRgG+JlbpYCeXFtHxB
         V42GgxwOWjAhyBsJCXP5QLIMCOabRSg7hA1qpxoJQHrgfYcsh4YhmApeO6yTe5Jq8sCj
         SPSA==
X-Forwarded-Encrypted: i=1; AHgh+RruruauoqmdxxWNBs+TNA3lf5lTY2Nj/NzaRHm0HHiZ27MKj6GVlEVhylKBpZ9dGRckkkWMTQ71KSXu98g=@vger.kernel.org
X-Gm-Message-State: AFuF++kqFILAy+A2V8csx0IOC0ylMXbuxjI3V3Gu9dAHwTF4XLtMfi7w
	rPenM+xf4Oe4mZG08gVTubxIBD4PZnCLLjWPGe6SvfmNuYRIbP2+1lUN0queI6pM
X-Gm-Gg: AR+sD11xhjn6fZGxsPuP9cIs1w61zrTi+/Q/dzkbFWBGoqd58sVEyxokhXV//3N1+4V
	bKpk9j3Rhlqc/qQ/qB8ZA7x9D5avne6S6eVsGwcopKypN3fgrlK9h+Q/hewgQ6nUMhL632to0JR
	fueyO4jcmSgNVEKoAg0U1/QuO3roCZXD+iF7pFMoOhRqulGRjkLvU2ZaJLRSaKOEkwostImeSAs
	wImtS3EpOxZYGLmUpmB2xIWdguFTtSxD/NF9KuXbpPXsTI0zhGOHKu3boibvQJ9R1c7NUzcmdkI
	aZY1p21+IO0BDcfoTkSPGqw8B3Mu29qc7xgnoSsdLg6OYOehOqK8DqcjucL7c+BhKUw868N8RA2
	nuoKZTSDc6/XtU7hUUxMDdf/jfKzSEZPHwCDr3pWQRv42e4HVuL7/07D5mEAjhCETnjJgJTZ5ms
	1kmoNhDJZM3Fr2f2dC44gzFWwKiRxOX5weqOpxaRdKMQ+gN91j5X/Wb/iGH0HfhoWXzfpd1Q9dN
	2aXQK4Yyhonte2lyu/20w==
X-Received: by 2002:a17:907:961a:b0:c21:764c:9417 with SMTP id a640c23a62f3a-c253312339emr164901766b.1.1787769875455;
        Wed, 26 Aug 2026 11:44:35 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a73038asm546998266b.26.2026.08.26.11.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:44:34 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2 1/2] sched/fair: reuse the ENQUEUE_DELAYED calculation in enqueue_task_fair()
Date: Wed, 26 Aug 2026 21:44:32 +0300
Message-ID: <20260826184432.911321-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <3ae49b35-2188-4b29-af4a-6fff500098d3@amd.com>
References: <3ae49b35-2188-4b29-af4a-6fff500098d3@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Maybe wakeup_delayed but all of this should be optimized by compiler
> at the end and a big ENQUEUE_DELAYED is better for humans who are
> reading the code no?

Can't we rename it and use it in both places? If not then using ENQUEUE_DELAYED 
is better since the approach remains the same in both places, no?

Thanks,
Kayra
