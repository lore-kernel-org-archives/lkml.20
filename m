Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153F026B2AD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284504; cv=none; b=o819bhol3kcSf2G7NWPypujIRZ1aO5KHNVjONc2ehZNkW/0AZ6WSbXu6lcZW0MiWS1x4u9PBq6ScCeWz38zqGL81JdPAL8a2RrVyOd11sRi8ea3nzreyjbw8OZsA/Q1zqeXqqHcuAoGUHu9lhX+Uaq4IdE3ybGFgrsN8BdFgwnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284504; c=relaxed/simple;
	bh=Fo6CUXjiTlAY0KX2pj6AjZUf7/3SFzUL7ui3BivR8iA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=loCtE85645q6aayxHPJ0cS5I3exG+W/C+Gk27YFVS5HL8JPAxtyIvGHzG4Vorh59GJ0AiM06KZE9h9DfQCPXM7NsNH1LV+glAkpHpDG64LbIhfq3ter1z+Z+EyQGFi4WpuIaNCIwVr2hQvRdXd+I6Q5LOM6mQt9zHHWj42l+QEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SCb5cSWd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AhELX0B0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SCb5cSWd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AhELX0B0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791284500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fo6CUXjiTlAY0KX2pj6AjZUf7/3SFzUL7ui3BivR8iA=;
	b=SCb5cSWd2TtqxN2/mqAw7kTQPaZak7WMsijCHcOCfv6YLAwu8EMx+fIOeq/1TMyieF4rsG
	xvFGTvzwiqXj1MDs6/gxfNejzNRXA4VRiq3bq9U6thuhMrz3M4KOomwrDZ11aBHuc/x11m
	8CjaEVyNxUPsw+Xe2K+Dcl60hG6uthg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-nhSHC7MVPqe4AqdCnUy5QQ-1; Tue, 06 Oct 2026 07:01:34 -0400
X-MC-Unique: nhSHC7MVPqe4AqdCnUy5QQ-1
X-Mimecast-MFC-AGG-ID: nhSHC7MVPqe4AqdCnUy5QQ_1791284487
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48c415561aaso1770120f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 04:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791284487; x=1791889287; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fo6CUXjiTlAY0KX2pj6AjZUf7/3SFzUL7ui3BivR8iA=;
        b=AhELX0B0htfU9YWQ/4aIEcG8AXbwRNzUwu9bGDeBCjVM5v8uceoaUdZBDrDZqbYfVg
         mYyoXHHbn/hYs0LEjv22pLkk7Xsb3kD6FIW9BqNv0gb1QEpXUjnhuOjv7k1XfFhb/Hvd
         9H6SmYqmXPB7Qwdg1gzNWA/YZVlIHyNK0HZqJJ1kKeem77+35TfqUnU5bSvahcSZmn+V
         o+EwFkp7w8fFr5CktJc7GpPYiRFplIy2PIkPtAimk+88nh6A91jMmsJpiRpBk29DWTHH
         Fu7KahXEAL3ygC4it0sC2teoZ4OW1ApN8BO4/lgPdp/EOvjXLr7MNBfG0kjFkS7xA/wY
         5HIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284487; x=1791889287;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fo6CUXjiTlAY0KX2pj6AjZUf7/3SFzUL7ui3BivR8iA=;
        b=iq+UzGrWl86bjqUt6lKhNCuHFkll0y1Z21C8w823bGxcM5Uo2bzOvfn9Jd2BYKQYqh
         g0pa5U7moCafgfIcWJo/cNZLgWbM/bskO2IhuAi8cbFaJEP0+PZKfxl3BW8JMLd8gpIg
         f7y6KM7KQuCiMg++pQkMfYI/oZLDLpPQ7vQ9reKVUzTaCqTMY+M0nUJhVf/1LwBFllrY
         /Yy2hXmho5zr16zwAW0wyThjo0RyNgOs4fua4hsjsEp8w8g4dsXrgiMrTPItTgtANUfi
         e5jv7b5tk7TO96Hf/4qtL7HoODrrnW49PYTb+H9ZJI+lPLL/mCFAft56lCqN8VwlKDI2
         FUYQ==
X-Forwarded-Encrypted: i=1; AKwUvByoEtINOphLGj0PPgTwv/94c3RLsvFPwHbUwVzuSDqHlKEIbGuSwMvb5dIShD6s+SxEoANWppoe5ZE4r2o=@vger.kernel.org
X-Gm-Message-State: AFuF++l/9qA/6GUsEYY72aKRhpRPvjY0qEAoyvO0lemFwPEejZvsyKTC
	O8uZXagN0Rl8Qs+k7Tld8HF5/Q3rFT7dagsa/LwlSGIN4GAzbpccgl1Xx9Gc35RR8RKo3/OAGSq
	TNejPYxifG0dR67SRNQUHwbs4UK+/sjXbvgMhatcWsABk3wDcgbM1h/8aVdZPSK2k3IFS7E0LM5
	BmqeFoz9e8/jKSo9a9bs/H0Wcjp+k6BrRLHvZXI2KkPc0ELUQSeQ==
X-Gm-Gg: AYBFou23We8w3diozQnQ4q4szMZPXmiy+pOVL5CjBvSWVNE1aPXSQUUQqQDCFPtZ0eV
	88DM/TMH64xwS6GZyy1x6Us85UO7VTbnL477ikKhJXAUpApkhre841ttZTLI/OVXWYKwogv6saB
	ZPW1VB+TkEap1f7397OEiBtMCDylgxRtHc3xYOJBBqiR149+2PkqeZJmLTD9wD85U8MOU7padgx
	LWTwgk3yXpBYbF/SLEdHceW0sLnJG8aAjzwOjAZ4NUWaErOHzOYxlILEqWt58/nUrspOi5/t84q
	DyMMksZenYpnnPFhzn7ueVCVNPBaXZU/qJgxUgmlwEJsQL8bqailNVZmGOHpE5dmhwNx4KtGdJF
	2To0PuL7wWXfIhtRpLb9uy8RwbF0F+EOv6IhgG88cN3+sowDkF42h
X-Received: by 2002:a05:600c:608c:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-4a17b52d586mr16388825e9.5.1791284487198;
        Tue, 06 Oct 2026 04:01:27 -0700 (PDT)
X-Received: by 2002:a05:600c:608c:b0:49e:6861:50f7 with SMTP id 5b1f17b1804b1-4a17b52d586mr16388265e9.5.1791284486807;
        Tue, 06 Oct 2026 04:01:26 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178daa115sm64755935e9.9.2026.10.06.04.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:01:23 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Hongyan Xia <hongyan.xia@transsion.com>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel
 Gorman <mgorman@suse.de>, K Prateek
 Nayak <kprateek.nayak@amd.com>
Cc: Jiazi Li <jiazi.li@transsion.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] sched: Convert last bits of deprecated static key usage
In-Reply-To: <xhsmhh5izyufq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
References: <20260903115728.11864-1-hongyan.xia@transsion.com>
 <xhsmhh5izyufq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Date: Tue, 06 Oct 2026 13:01:22 +0200
Message-ID: <xhsmhece3ytx9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 06/10/26 12:50, Valentin Schneider wrote:
> On 03/09/26 11:57, Hongyan Xia wrote:
>> From: Hongyan Xia <hongyan.xia@transsion.com>
>>
>> Raw static keys have no type information and do not prevent mis-matches
>> (like static_key_false() on a default TRUE key). The helper names
>> static_key_{true/false}() are also confusing, hence the deprecation.
>>
>> We have already converted other sites in previous patches. Convert the
>> last sites of deprecated static key APIs. After this fix, scheduler code
>> has zero deprecated static key APIs now.
>>
>> sk_dynamic_* uses static_key_{enable/disable}(), which aren't really
>> deprecated, but take the opportunity to move to the new static_branch_*
>> APIs to be consistent.
>>
>> No functional change.
>>
>> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
>
> Some comprehension/changelog explanation nit below, otherwise:
>
> Reviewed-by: Valentin Schneider <vschneid@redhat.com>
>

A quick search tells me there's still some static_key() usage spread
through the kernel, that really should be fixed in a single series powered
by coccinelle or somesuch.

