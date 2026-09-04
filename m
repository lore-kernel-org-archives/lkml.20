Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2CF3D45F7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788566290; cv=none; b=dG2yRsQsUM6mHZ9kQCTeR8mfQVa2Ba8NHsxhLgF3A2WpywYl9UcBoN2ME/7gCIz0yrRaX7q2VAzAswR4P+tS7fbESPqW5xM4J2+8IOZ6pgz9CWd4SHGOFvuewT5gJlwJ62u6MxacPYXZPTBUjmclL+VPsgq7yRQPgEQF1ayUV1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788566290; c=relaxed/simple;
	bh=yarXFOpzqWnE+NW5HpWbsJFTGBY6u5WOzXmPUw7r07w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OYKdb5H8bqCPz4ggJTSDqDRUXbSrVZ1w1biPuOoYXEvMIVktdC1+8X5Hzybf3jIRkR6Jdp3slAZwXp2i7Y9Dj5G4UBvPXkuFASnvF5mQOfyiGnZYRlezkxtk3QbW5K2R5cJE0emGxege0RSOHB6FlHS887XnHCVidSdjmAlNK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOK4NB/S; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOK4NB/S"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc439aa0078so1398898a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788566288; x=1789171088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fd2qPCapWM+8MBnNjVnfMcoloTL66/axX8ypoPSpRK0=;
        b=YOK4NB/S1+IqAqXjnS5bJ/cKOaPYeKZOQirQ5tpLSZ/W+QGcW+GeEmBVNIUjL0RWA6
         8+E7mscIE+7Sz3Bf+MKrCrJbym0wQy6TzVOQ8p+3+7TUmwsor0HwfNv+PwuCG1ChOSjH
         9Iaw2xzIcotTiFa/lUzgg9QNIv28wyCi0R6Dx+tJJxlJIRqNbhevfHMlk7hIYGXyWvAV
         HNJCux6nS9ttaH3InO2jfUfz5hnrJ5kHzEYSrzayTG9Q7vb6WuHqazk8DADTAWXTQHuA
         YXm07N6o9oWgeMa/hmhVvPT4ox0W4+w0jHMpfGJaqRT9DBdell5u1AggZxejU0dwvUyp
         SpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788566288; x=1789171088;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fd2qPCapWM+8MBnNjVnfMcoloTL66/axX8ypoPSpRK0=;
        b=pa50ipNtUmRyeVKV7wsRgyuVWjWxRioL7wWWKgv20u1iWAHSfKBaSlg1KEx34pBH7r
         yYxfGLSLMkl3r/uGlfxPJQ8PKM9kp8elFt0eRkjM3DGd+VWSdKC3tih/KAC+EUCWCsC5
         Z5s3xGzprL/ZVZHJBf3vnTBAOHPeavGYiFa8RYGWkxOYTUtpK8RS1k6IvFei1RihY6vb
         XASsGLX1yQtRPn1ierkA0cEezcqc+5L1tB+l7jYDXcHksvc1j4rGS15oQlzMu9Crn9BK
         HIM4aDR2+5m7EkKsuPbvW0ZQhNBx8ODalHRV0JKQvjOHcgagWiRMGNuQHA+iw1Oq8DyL
         TR6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxEbovebHSDRtosRnCO1Vvn+SaYhk99mah8MuGsiOWC0Gp/Njdw0JxPB+rtQoDTdyQaQ8s92E3/mSS5t3g=@vger.kernel.org
X-Gm-Message-State: AFuF++m1FA4Gxvd9JgWC0sHosMnuLALDBCdJd8IWLiRS/j5UOFRIvG8X
	SsvyBMydtZ4+yiAcVhIHMML0hj6uewTYQbrT1kVZZR8w8y1ChKAzIcmn
X-Gm-Gg: AYBFou0bMnozukQpWvPlqGS4YD5vDAHwo3BqNAnOAAe/3QCK0vkqEESGn5zFjxe6qeJ
	OrDuNXyV+D3XpndAK5doGxVyMeq4u449p/qnur4EmYYbq1eVqA/CCTfNCGb/FzCUBp+nymxEBjc
	LtYuRRD/PZcYxYF/TfD63ZB/RS3Y0tHnCB3NlEsZKJ9KCNe117oHb27J+TE+k5Aj7eihJMcl4U2
	sWXx38woCU62W1iuKg5SQCK2jQ6vkTj3VfnJf00WWCoz+DZ3tlBbW2jnO7nQoSbETn8aqjS49KB
	DOeWTQq5tJNV4LBCGisv17dsYjjqC9fw2wdEnwdygGKVHbSJfDgbF4yj8F444nAQDz5qCDdHFk5
	OSN1khj4n2IZHf+L8ld5HlWzVV+SVXcCvo7dLTyOI7OT83JOf6k3AAmw/NiprV9GX2m5sdGi0yV
	uthQb9co3hq9y4eZiROQeQAGSw+POBGb58hDl9SLmHxO8QhcO7zSCnhiqlnCiBhlAkAPQxS1Ytn
	w==
X-Received: by 2002:a05:6a21:828c:b0:3d1:39e9:b267 with SMTP id adf61e73a8af0-3da39b721f7mr14030650637.3.1788566287848;
        Fri, 04 Sep 2026 16:58:07 -0700 (PDT)
Received: from ehlo.thunderbird.net ([76.91.223.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm10577251eec.30.2026.09.04.16.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 16:58:07 -0700 (PDT)
Date: Fri, 04 Sep 2026 16:58:07 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Tristan Madani <tristmd@gmail.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH] HID: hid-oxp: use cancel_delayed_work_sync() in remove
User-Agent: Thunderbird for Android
In-Reply-To: <178855662286.3192124.2102579968112413785@gmail.com>
References: <20260904105800.3923987-1-tristmd@gmail.com> <949B786B-375B-4F2F-B209-C135EC62E1A5@gmail.com> <178855662286.3192124.2102579968112413785@gmail.com>
Message-ID: <F0F0B5FF-2527-4577-8EAB-B09D45566824@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 4, 2026 2:17:02 PM PDT, Tristan Madani <tristmd@gmail=2Ecom> w=
rote:
>Hi Derek,
>
>Thanks for the review=2E
>
>One thing the Sashiko bot flagged, and I think it's valid: if
>oxp_hid_probe() returns early on an unknown usage page (the
>default: return 0 path), the delayed work items are never
>initialized via INIT_DELAYED_WORK()=2E  In that case,
>cancel_delayed_work_sync() in remove() would call __flush_work()
>on a zero-filled work struct, which hits WARN_ON(!work->func)=2E
>
>The non-sync cancel_delayed_work() didn't trigger this because it
>never calls __flush_work()=2E
>
>Do you think this path is actually reachable in practice, or are
>the usage page IDs exhaustive for all matched devices?  If it can
>happen, I can send a v2 that guards the cancels=2E
>
If the usage page rejects init then I think we can safely assume that it w=
ill be an effective gate=2E

There's a series in the works ATM that will make drvdata unique per hid de=
v after the usage page checka, so we could also wait for that and if it's n=
ot fixed by that series then gate on drvdata not being NULL=2E

Cheers,
Derek

>Thanks,
>Tristan

