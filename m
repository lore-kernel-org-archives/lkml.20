Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347088;
	b=Ew1hs134/BC5vysyb3a4FA1ZxYi/UZBcja09/gdKBsiXVOwEOtKHhyI0sScM1p9vlNmx
	 s4iplNA/GopeckyT9n/8VDfozGTmVJCzmmv1/qmgqHjLAU1L2NLpEToBB2d8UnHkTQus0
	 apNr2ZFRRigg4CSJsqG11pWtNpp78tlqNTd68aJERywaOfkPvqxL8WIVa7e7kykBeBYld
	 HfPnQGcimRhC/qUnlNpLnEBMe/JA9pnvyBZSPO4Xan+ooP0LBDf50+jjPjl7pw8pLdjNn
	 RK+LdX5A6Sl9MfEmIt3VFDUjjKGWfIDJEyysQ32/GZb88hcO4f1s6Iso90Ig7uR81SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
	b=Ub4zAdl2iriHAg9s2rNMidaY783FWvEcUfGCeWan9OgyNzClqPglnD05FjAeuhLG+q7Z
	 a/0Ertjlo/t8TDmtva9VUN94Tcx0px2E463S5a9wakCsOAuuHDu/+Q6T1IyzheTR+uhvz
	 Tot7/+lGMLEozNlWdbm86Y3mSjyuhh7lLmM4uw6g69k/2mKdm/9G/ZE69vaTnbH1a175M
	 MOp6gn+MgpAx0gTfNxWncs/FF5rvmW6FaSMOTKDH+JsceSaGpGv+taDJJ1F9yVFmD5EHt
	 gK9XlgPb9faQVpuEkHtqF4JShQG9gPZn3j7iwjc8aZhROyeS19KsScS2bGBeWx3PkDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fireburn.co.uk;
	spf=none smtp.mailfrom=fireburn.co.uk;
	dkim=pass header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XFE8VPb6;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F1606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B34F1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fireburn-co-uk.20260707.gappssmtp.com header.i=@fireburn-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XFE8VPb6
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso2246405e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20260707.gappssmtp.com; s=20260707; t=1793347086; x=1793951886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
        b=XFE8VPb6m1GPfBx2CUgfiC5nJbXLI/Nv8RbA4+Ji34UonIDhtgJhIHSc75StLMcva9
         KOWVbUN5h+ZaflzQySQO6eC5cwkxqqI8zuCDcFe21kSNODnzkzrXYalCsimjIRCEiP8N
         +Kt0MDJ6+REjoou+T/CgBTbRGvgfrMtu2lEZbe9L8p0TkrjmYDQivqPSAsiTr55xygK4
         8qY9VU+KadIp8YSwur7BL2MF0b+kcony3MVrFZmgkddU9eJyCzEaWjNMN+oqRx9LOBeA
         5NHmsY8ReCQ0lqHVfQYG6HR7Odxo+A99SP48IVFY96FkA+y2ENhxGwCKLI9mfrDOia7a
         SDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347086; x=1793951886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZj2Qty9JInb5244dlMUxHY5wM7oXDHaDgfyNj4i0kU=;
        b=z2fwbpmArUQv2HOSYvf3hr7oUU/ImG9YKU1cWCgWOStVtZ0m/OnK3Wu1g/4LRMVhHX
         DcoXZzEOQUSNL6GFZWf50bK9pTPx6SuXA5zGn0kGKXc3Zpn6GL8K7grxqrQi0OJL0/NZ
         6gyBEHbF8GBx1bfBjSCREyM91ETKsUke5E2/rj9bLBtnhfBru1TRW8no+6HGgludft5Q
         tacea+B9EM02+rRsBHmnVze/bOiJgx4AyWNpWMqrmLYLV+HtqRm1EBt5S/nMgBzNC2oL
         nqGW8oRuCAFNjm1HgrxMuI9zDzWwgX/VKGRKuSlOSfmDm1R/A3Y7fksG/eqn2+CZQMpU
         RhXg==
X-Forwarded-Encrypted: i=1; AKwUvBw4MOz3wCpN8lKLGHV/fAU9AsKJpNGLFVjYuGf87v09wqB3vdek6p9oXpxUbBBBDJUXYx0crKAo3LZPbgc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLON0x7mn394pp/rQOXH9yURBQIBbLqOnNqNaX5HsWt6dEQQWnf
	EBDyFAM4Ur9rwgfFIK/tAF4DBOkD9o8j5S85e1+FcAXesl3/VL9UQ7bgIWJxshEhWQ==
X-Gm-Gg: AYBFou3G5qTXV+D02JNzy2rn7YSVje2vHA0D0JQntr8imwZNqi2tq+2OVcPOKkuEkNn
	P7D6M1Fbg2hXs4N1cggw0QIf3un/56RR43Oinz/ClKRJq6DWhemYomkjRKG0kRRlBxsmbdXVSG3
	U786/xe9fSP1J143UQzfLHdcAkGJkdPdQ8sN21CgEcPlzFLf+WzB2xbIeTEizzQj/VCDXApkjVN
	nBNmbvzLfMbc1fT0SqHExXUNvpVbSjhtCcUbNBe2bNlR5e2zq2cu1Cw80CrCy9/ced3e+Vp3cRB
	6URQr1QsQWgxS+JOZfTHAoAJYkz0i3/drPx2yRPFnEZQe2vzLFZxGHWEAfsZbSZip9t3y1GZB0E
	UUwCUU9GstZpwjb/M1mymZ7CzQT0U4/AiEQTeL6oJ2VynIva8fK7yQsUJ/9JYkM560vYOcXrBU1
	YXjtrpmNg8v/StS65jM+B8JMtGWfPFksrcQoVW+qlvhuXdXbafX5dy5fQMJUFfUA+ucq1khZasq
	ml05sZVKR5ZoVDNDt98eZ644wJCq0SJ3w+5naKPP5RYCtc7Q8gIUPkYmkTsGsDbftNAAXvaDB5T
	JeKiFfyVgP26KvkrmN35HB2wqB0qI5p5QWLFr82j4jRBFoo5/6D1MbNIIDiFhvB0dPg82NqsREt
	v
X-Received: by 2002:a05:600c:638f:b0:4a3:59c2:b41e with SMTP id 5b1f17b1804b1-4ac150b304cmr29519325e9.4.1793347086099;
        Fri, 30 Oct 2026 00:58:06 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b289f7sm40818935e9.5.2026.10.30.00.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:58:05 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: Shuai Liu <847807867@qq.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	colinbrauncl@gmail.com
Subject: Re: [PATCH v3 0/5] rust: usb: host-side abstractions for a bulk-endpoint driver
Date: Fri, 30 Oct 2026 07:57:58 +0000
Message-ID: <20261030075758.356879-1-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <tencent_A0D3062EB058E244877B87B4324B8DFC4406@qq.com>
References: 
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

Hi Shuai,

Thank you for reading it properly, both of those are real

On Fri, 30 Oct 2026, Shuai Liu wrote:
> set_alternate_setting() invalidates Endpoint<K> without the type
> system noticing

Right.  Binding the proof to the setting would mean threading a
generation through every Endpoint and checking it at transfer time, and
I haven't got a version of that I like yet, so v4 documents it: both
Endpoint and set_alternate_setting() now say that every Endpoint obtained
earlier must be looked up again after a switch.  If you have a shape for
the Altsetting token in mind I'd like to see it

> set_alternate_setting() with transfers in flight is undefined

v4 refuses it.  The window already knows about every queue URB registered
against it, so set_alternate_setting() returns EBUSY while any queue is
alive, and the doc says to drop the queues and build them again on the new
setting.  That puts the cancellation in the queue's Drop, which is where
you suggested

The one in-tree caller selects setting 0 once at bring-up, before any
queue exists, so it isn't affected

Mike
