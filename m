Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582301;
	b=nTf921vbxw5c5OoLHer/RFqFzu9Gbyj2Ezt0EskAf1Ym3GTJM7OWXX3zWrvjsun6Q3fj
	 OvGNWFMLEVrQQnGmMRE53K8tsXpYaEUpt8M5QWLMib8+AL+AUNz3aAOV6fdCICWB1AblD
	 WVBaOFtO0I+6tueEllYeAqqhMsF8EXQX/MWvxiA8BrbVlkr2qaqTEIWoSmHKeNT7WWo5I
	 C5owTgy1Zvuh2MKw33NscCA3Ws07wLcJtw9fIOIRS1xv7AA8VDVwt3rs9fIUgLNnaTDSv
	 Ug1P2tOYMi0O1pMH5K4M4OezLJdTcloVNK5hlr10nIw1DgKOZUw4oX3JOOBVKXLPtLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KemPF4UyXFCnRn0FFZM6lfFKM0OQmZfUuPBKXbcJpj4=;
	b=oDcWuXZBl/O3FZ9IVyndMoTAx+XTZY4RDLAkbTP4vg91VodOswPstQisb70+14GRHBVf
	 9hqK9f1MPU4kzRAPuPaQZcHgoIUSUglkXeBCxIndoNe7Vbk13055/iyrA6bThhuIRrAVc
	 8yXpunVFgsND0WUk57bfAu8xOJoXuK7pzVD+4uLItTKQo1Rqp6agFlLqvukJirKj5gAMt
	 2g5s4/qxEHTqhlQ/qdwis0gcTpKEv77hbqS3LJf9BYVOz215h92o54PsNleXGzTc1jbH+
	 rbhH/WKwGApv8klDizKdEPrZ1I3UBEOyXKfSH+5XgaAm3Wr+eNLaxR1RSy1akARukcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRzKTiO8;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6296F606A88A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6296F606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YRzKTiO8
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e47347279so429070f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794582300; x=1795187100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KemPF4UyXFCnRn0FFZM6lfFKM0OQmZfUuPBKXbcJpj4=;
        b=YRzKTiO8grTuhhH901jJ29obt0j4Vt+j43mhWEoTgbm1muLsCcdfRcEaCkVPj6ommm
         TzC2ro3m2xKqeVvot75B49gn6BAIu5fwOPn6dPQx5xru6EMzZoJIyhaD60IONKHoCPcb
         7uIIXD6A7rTrBEi076STClaiA50f8iR1Gn8EdaKRwK+BdqTfpy1eaKQABYeC4scIIHzs
         J02TFbKm7Rn3I+TWXFraArR9NqrdYPCKpeMQRJsAfrR6hv2GGI+o+zI6mMzQAgZpp8tj
         g1Rd1XrgKCppTBbiBEPdjuMH6qkBKMsx/4YCgdroaqU7fOldE+uJWAbdZp6o7PjcQCcu
         IqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582300; x=1795187100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KemPF4UyXFCnRn0FFZM6lfFKM0OQmZfUuPBKXbcJpj4=;
        b=RVgjKpLK2m1zyqpTAhnz9BwIUJwF/02z2+b9PIv9yowrqJx2W9N+5f9pIlr68FdarF
         fuf4Ya745XuhEYLHGxNtANxa+fs4kKcanSb4tJ/s3rX7g8JalTW4W+FSPeCE1nskbPbZ
         BmAjX4h5AZIoIvAIXExta4viY5rrzM+piuyCDSD1ZimPXHhmbBUn7TDxRQkTSGXP8UBw
         uLD+LoophS745Uv+p+555+MXTxGS2uS6nnh08dAFO4HfuB1mwLMFtVOjI4z6XIYz+NYJ
         qtcddTUPE+srh6pn3CjRQg4jzAupNrHPGySY3rlLHPTsfNGoWhGkjRotBt2Z5dhq1fgh
         WaqQ==
X-Forwarded-Encrypted: i=1; AL+hErHAXkG1VAbG/6FXbDr5GdwBSVKDzo6t4jbhZdGRHc8itF6IeZlhmFWUTTzE/1LU55qhFVwUvaahcQMHPCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v5ZXl8fvcveMYIVZ95cBUXAUiViwUN9Hk1Ajk1JuYxnPPczCd
	SdM3Xo8A1k+yJigw8/sYG0QDVKOreSYKy5NmeX4sDZW+MClW+OBUzeLf
X-Gm-Gg: AYBFou0ZGoN91826Ysw82EQDU29Oa65NWm9Yuc3qayew+HShoR1PQ2QvE5ByBXBPDcw
	GwVy0OSARhiP/joBSKEj5q6E15BzDEE1EV5C3FGsbD1Vu0m8OMTvY/oHdgqyVbyFYMBzgerhUmV
	C9xKwX7s5NGS6JbvpwZFqNDzBFSdYB53f4n+JajJ3VZk5z1YcYy+gtEKVsAU5pBOhBca0QWM+e2
	SN4zpJ3oWdNIuH/UCl6JNR926tOOfq+FLI4CupvexMlw6FiUkPcx+im/tpbhC9HPm16Hl8FMmQe
	XtUVbHvkwSuZ/o6y+l8N/Rv+4sRG5YAZ5tn7CSifF/oebw7x4d5/g/r7qP+k42620iRo7gD8JuF
	4JCre5OhGNnqklTK3tBPeaj4vfVYBGezBOdurc2asPUcuA+87XNDIkIGAXvYk5XNnK9h1BO111a
	1g/2GWTjsmHvmPDqwXoU0NGHA+Vp2Aq0YbyAE4F6ommZFRMP53c2Z0kCgnMMq+yd+scqKU/yknr
	fAX2ddmNgeAXDwTG9jYPDTT7y8OPCPxp4LKL6SMvmKu0AOF33fhtq9zsx/xXfWPNbQ3W2gbRBYP
	bgZ1M0MgXZT29KAxF9/Ka0UwFoi8csUxpE8FJ6N4zCx0rAArsDgZLuNO+up41orQUEM7UA36aWd
	bwQ==
X-Received: by 2002:a05:6000:2486:b0:493:5d67:499 with SMTP id ffacd0b85a97d-49c712ac9edmr5552285f8f.14.1794582299355;
        Fri, 13 Nov 2026 07:04:59 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.56.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c1797sm6390874f8f.11.2026.11.13.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:04:58 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	peterz@infradead.org,
	mingo@redhat.com,
	vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org,
	tglx@kernel.org,
	will@kernel.org,
	boqun@kernel.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	shuah@kernel.org,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	m.szyprowski@samsung.com,
	kayracizmeci@gmail.com,
	weihengqiuu@gmail.com,
	cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 18/29] sched/deadline: Move a task's bandwidth only where room was made
Date: Fri, 13 Nov 2026 16:04:36 +0100
Message-ID: <20261113150438.9119-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d58e067d-05ae-4e4d-9d34-b0ac2741b211@efficios.com>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com> <20261108185406.1549770-19-mathieu.desnoyers@efficios.com> <avVk0UU8IRGoo77v@jlelli-thinkpadt14gen4.remote.csb> <d58e067d-05ae-4e4d-9d34-b0ac2741b211@efficios.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 08:35:03AM -0500, Mathieu Desnoyers wrote:
> Hi Juri,
>
> > > +/* The caller made room for the deadline bandwidth in the new root domain. */
> > > +#define SCA_DL_BW_RESERVED 0x20
> >
> > Why not 0x10?
>
> No reason. 0x10 is free. The planned next version uses it.

Hi Mathieu,

A heads-up, since both are under review: [1] adds SCA_DL_CHECK as
0x10, so if your next version also takes 0x10 and both get merged,
the result would build with the two flags silently sharing a bit.

Your plan in [2] to change the affinity check and the early exit also
overlaps [1], which moves dl_task_check_affinity() into
__set_cpus_allowed_ptr_locked(), right above that early exit.

I'm happy to rebase [1] on your series, or the other way around,
whichever is easier.

[1] https://lore.kernel.org/20261105164856.29698-1-parri.andrea@gmail.com/
[2] https://lore.kernel.org/94d8d7af-b04f-4c59-ae3b-e693d4457a65@efficios.com/

Thanks,
  Andrea
