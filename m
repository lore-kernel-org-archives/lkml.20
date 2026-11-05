Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793889794;
	b=gcF+gWWRLT88ODYwY2NUaRk/kYNxrHVn1kVBamXOnsjynsuuIRnLFSw9gW78XrgBJZp0
	 eFoVhqTZ/oOn0k8nGwRyjGOgrhNAfGSjc0IQ0Nu2UW//3n/4XG+EaWo31g4S3FSbKgzQq
	 V5xamYUL5jrZC+MpuTUIIVHXYdf4+GOlo3h66j55Z29zAdF7Pqf7uL5ujeAM4aaY3HM/8
	 riYT+xm/Scf8r0kG8KJNTehwcfQ0SfrlMbM2HZmjY5ameF8M4riWkY/C0IFQZW4gYTJE+
	 m7577TwIQxIbX1kOz8wFQYq3N0J7B/zodCZnK7Q1NNiPVm69RNW0oKpZEnRbiYiA/eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793889794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wk/So20xr62QzWata5h+JuMn7QiKllnw4EsB0QPRdZA=;
	b=4f4WDlxRLeuWQ3MvULlgO8Z8g7Zb10VRDjXBe9aKGqSdDDXMzKRcBCsGhe10vp2yL3b2
	 ass6ZESMUvhEgXhfM1UXFeMSSqi4/HpG4BW6P+bWzDo7po0sKe+e2ZfNrzMiROriQ5dqB
	 l6Hs4paCMj1ehvRN/MGbv5EdU9HS4fzTJXp8dSTaUJg5A2cXKHb1ZQnUuVvl1wCYnEIzU
	 iwmf5cvNRIVwkPkq32WKc+Mp2TKKsHTNxxAyiHwaXVy5M3WgLr6pSimAXAlnTziX5Q3iM
	 uRLEL4Kdl5xGctiBGGb+u0IS+n3RskuRB08qj9AVZuco2Ix+u9jVEBjvEmOz+krAnAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NiU6VXsz;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068E2606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 068E2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NiU6VXsz
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36f26e6abe9so91481eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793889793; x=1794494593; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wk/So20xr62QzWata5h+JuMn7QiKllnw4EsB0QPRdZA=;
        b=NiU6VXszwSfPXrvc0ev7LGdQIIoSNzyClwMenodgW9tHkL7rHggh1SXl0iWN7QHbyR
         T7wqatl/b7ghNIDvQjtQP2wfCu/Z5qTCeLEOJ4b9a2zOkEljQsMQ3velrPbzt9xPQD+D
         YuHJm/G+1LGKZY4T6ymn2AFQMNrzJLyhH22hDELC5IAIlodZ8vw7JspNG9VR0s6h9ip/
         lCPlLIjXqPfDHI4Cr7ZW4z0d+dw+u13ff5R/laSywid6YhxqMGrG1liqG9CkOqhGFcfb
         IBABQDwHDmm1eSNB/msmmRVJmLsfBGD1V2pfRpPkrdmAkT0vFlJ8hrPWmaRaEhulaY2E
         zkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793889793; x=1794494593;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wk/So20xr62QzWata5h+JuMn7QiKllnw4EsB0QPRdZA=;
        b=zwhh1eWydThZpBH/43Z/ziYG3p3dIpj4xB+6RB4nb0dg8+H5wlT6taKW9FfMCijFfO
         QXcXc04oy8MBTlXeXJzHOsEFTRljES/076CahHYce5K5yKoos+9I5ySnlbSxpuvqRXWl
         9l35j9NBe0KCTGJ+yRasYJgiIC6CJnxI8wLGY2JUrLxNSgpE2bpHsyFJAa26uM0mXr1N
         h6GiqQ7HTXqrqEXFUG3mpo0L17FKVyqNU9PyEDRKKbvvBTdDmO8p26Eh/m3cP9K6Asq/
         yqdT4YUSIiaKMicLDu+t1WwrweC7LIzk3AB3ArYg9lp292t+WW1mRcxSXDLDJkf1iQUZ
         EO9g==
X-Forwarded-Encrypted: i=1; AKwUvBz9y+KHZrlr0Fsj+4+MveLpqCTIZMzbLeJSnuzzfZe8Rrln5hWWtJU1qmXq+ayEGNG6It5swgDXfS7PYzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mB9M5yeaudEWW+LZWoWYPYQn1ZyjVT9CFCh20l6aOUacvczzu
	p+l8bNWYBCr50mRhUXga8OTRIwUrfDi4Vkk1un3ipIELmBrWWreHr7JZTW9bdv3TPgPEXRHqkbi
	4tsSRlgj0ZISEnem0tmBzXw==
X-Received: from dyu28.prod.google.com ([2002:a05:693c:811c:b0:36a:15cf:f589])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr26273635eec.30.1793889792660;
 Thu, 05 Nov 2026 06:43:12 -0800 (PST)
Date: Thu,  5 Nov 2026 22:43:10 +0800
In-Reply-To: <sashiko-outbox-198692@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105071518.1458428-1-stanleyjhu@google.com>
 <20261105071518.1458428-2-stanleyjhu@google.com> <sashiko-outbox-198692@kernel.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105144310.2626473-1-stanleyjhu@google.com>
Subject: Re: [PATCH 1/2] scsi: ufs: core: Skip redundant variant resume after
 error recovery power-up
From: Stanley Jhu <stanleyjhu@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Martin K . Petersen" <mkp@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
	Bean Huo <beanhuo@micron.com>, Brian Norris <briannorris@chromium.org>, 
	Can Guo <can.guo@oss.qualcomm.com>, Peter Wang <peter.wang@mediatek.com>, 
	John Garry <john.garry@linux.dev>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-scsi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 05, 2026 at 07:42:29AM +0000, sashiko-bot@kernel.org wrote:
> If a subsequent __ufshcd_wl_resume()
> fails (for example, in ufshcd_set_dev_pwr_mode()), it rolls back to
> vendor_suspend: and exits through out:, which clears is_suspended and drops
> the clock-gating hold without a matching ufshcd_hold(hba) on future resume
> attempts:

This review was run without the prerequisite listed in the cover
letter, "scsi: ufs: core: Keep clock-gating hold on failed W-LUN
runtime resume". With it applied, a failed runtime resume keeps
is_suspended and the hold, so active_reqs does not underflow.

> However,
> ufshcd_recover_pm_error() only marks ufs_device_wlun active if
> power.runtime_error is set:

Agreed. This will be fixed in v2.
