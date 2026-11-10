Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326739;
	b=u4DPLLi490bDaWoDHB+YWqNosAahhWcLnqjv41vfELJu8KM54Qo+6cGdVMx0gL4fOR3U
	 kurRs9m5KeRi1BstmJoJAVlLqK+4AiY5w5ejfaXT+oSCZTXAe81k/yDQKWjZP0KCR1IrM
	 FF6y3T7xLnw9wYIZzY7IafIKIKS2C2ggxpeRr/CgNW8zFoVAej7IBb4R/ogN/DKaj+yn2
	 dcpQFzLu2+WE3gMbIornhQGDz9nL3QxLkT9cn8SzNhAvqJ1yp7buUTi8I7+IV4GC5kSEe
	 4T79PADwpU6Hpf4uFmxRap8RCPKdT1C7AEgH7Rc8N1Equd5Py4Z5iGYuXdioeNuISDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hELu8QwX+qFD/DnVT/P2rFt7tx59zhJVYLvINkhGp1Q=;
	b=Ooj8+uwOkVmbC0wnn8oizdFkVuOc6ngJoMcPEzS7nuWUM4iBYgDyKV+mVFWtYD6pHTd6
	 9Hqho0JOUI4yPpzepp28npymBIpI0/76dI1XPUGvgPCJZz409Q4ulGaz4unztAAuFoF0C
	 BB9Rc9brTtbTQnhoPGLqdYt/+RisdhzFeuziubG+DXkpX/8bA8WuhbNBZRNBeQFzIz3qI
	 qJcrLFZmO9IxSHAn9Kqgj6vN8NfA0jdfMYC91Q+2hilUfXsh/DG775LF8tkUqZzvXMqX9
	 BdRbbdRM++D5hkT5mFlMGUZ3mSbZmLeK+grVKmqR2Xub2Mm3GUgPO5Z0l0fRbSPrpkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsIDDtZ5;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CA4606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63CA4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zsIDDtZ5
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4b28d7c729fso1384925b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326738; x=1794931538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hELu8QwX+qFD/DnVT/P2rFt7tx59zhJVYLvINkhGp1Q=;
        b=zsIDDtZ5sks72bWAQZKuHIr6mYn0Zl8cMA0em/UNdi/b/oi8VKgjksDjHUrZrW6ajN
         J6KjkKPPreD+8yRabuQ3VTAaBuTfy5BGjpCXlB7YwFt7GReXARJCt97PS63nLrpPvtPz
         GhdZB5viDbXScVkopHFjd/woRTgoxek2S/qDubyLMAWAVy8aPm3+Xe2xssaqnTGHc4i8
         VoxvhIqeDupkuAbHKXdPd6Bq5cqsiVGq+sQ2c+l5stBqjLbOvCbNJbXsXyd6VEtAYlcT
         JH3Ksvq46UNAj4ZQeOl8jq9VVFHkoefC575jsSnfYg+E7l5tu9t2+brd832dMysfL+Lm
         G5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326738; x=1794931538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hELu8QwX+qFD/DnVT/P2rFt7tx59zhJVYLvINkhGp1Q=;
        b=SL0JrcLjdg0BvxkcaAh/VGe33y47Ox0RDbjSzjHqCOwlZfNYC+tD96C+e8CbHC4JJc
         8ac7/e5yPnHAiMU9ndZmzJMqdh64zj640ZVZOHv2r48zk1iF0WFpQMzap+PALv6zJcuq
         e+R4+x0WTttn9HVNur8zRkLktHVIXz/gQF3D8N5+uHzJtO7a62IFJoLgxS5yXc2FkEM5
         FDgBjFMPU4WFD3ZLiKfio1szasnKg4kS+LQd2qjhmanT7D+ndYFQ/0kb0KSnzKLPlbJx
         otBvmIOKgHZaDBat71q9jRiP0YsxBIZJYiA31DX5AOinBky/nBoUuTi78abVkXyu4kOC
         SNAQ==
X-Gm-Message-State: APuU4Z8ITLqZlobHAFTfYptDxVLNX1Km/nUNAr8XIzayPA3Wt7ib9BE4
	8jALwmIByV8TRJiIDcD9CqqZ+GYps0gm9NG9FASMX1D3nE1ehwVl7kUy
X-Gm-Gg: AYBFou321h3Rh8b8TN0L2HJ6KHArgxeYD3GArEVPnj9J5Wx+FPg6XJItzfQm6drQpi6
	gEvykpYCDo+3qKpqKjAz49SMPptgRVNPediGlf9tTGNYxPYsYhT6rOY66d935uUng6RW6reSXDr
	GaOflY9SNMCWOi4gU/WC0co5e4heDUJQoGKTuG/rtwdml86DSXS6gM6h6zg2dafQvtQXOyNsJm7
	BYlxXDjTLKtQJtYZ96VKCRkFbXzkJiu2Ka21Yp6EKuI2jkneq9QF4EJkinMlFQmSki9WpUyTQoY
	fxXaJe7VPVy0ZBY/9bdzbU4joaOv7dW3N4TuoJtJb6Q75gm8K6uFXsOFJpEZqyIIfntphHuL9Ec
	thtGgN5cvG5oBijr8RtviaAJ77qK5y4SvkFP6THbZGqdvPhEhsRQfjeYMaphukOfrQ1vJwejuxB
	Mp2cKr3Ot/yl+ksVQvRsG8VXRhTVT7byOZAZPXKCJavjpT3pCymU8j7BFnpeD0cTKZlIhA8uXLD
	wPV3m6hyvK3rp6irvBwlx5WwMP2lNkaNPpYD70dVMUgxx10+rYT2yDdS1yKGeNZXheTJ2pO9IT3
	oKcINcHUAAY/5r2/jORK07LOmdcU2o09eWzjkTMbGpj7/IxThAmqzvlcbGWaxAFYq+vOh58=
X-Received: by 2002:a05:6808:1524:b0:4c3:4e34:c69e with SMTP id 5614622812f47-5683c9eae0bmr2080731b6e.8.1794326738280;
        Tue, 10 Nov 2026 08:05:38 -0800 (PST)
Received: from localhost.localdomain ([103.170.54.93])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f2faf5sm2434105b6e.13.2026.11.10.08.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:05:37 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: control: Validate element info in compat ioctl
Date: Tue, 10 Nov 2026 16:05:10 +0000
Message-ID: <20261110160510.2697-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87y0b1ug39.wl-tiwai@suse.de>
References: <87y0b1ug39.wl-tiwai@suse.de>
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

Hi Takashi,

The validation in snd_ctl_elem_write() happens too late. Before calling 
snd_ctl_elem_write(), the compat handler calls copy_ctl_value_from_user(), which 
uses the type and count returned by get_ctl_type() to determine how many values to copy.

If the control's info callback returns an invalid count, the integer and boolean paths 
can access beyond the fixed-size integer value array. Other paths can also calculate a 
copy size larger than the available kernel buffer.

The read path has a similar issue. It uses the same type and count when copying the values 
back to userspace, which can result in an out-of-bounds read from the kernel buffer.

So, validation in snd_ctl_elem_write() cannot prevent these problems because the unsafe 
accesses can happen before it is called.

Using __snd_ctl_elem_info() in get_ctl_type() ensures that the type and count are validated 
before they are used by the compat handlers. It also reuses the existing element ID handling 
and access checks.

Therefore, I think this validation is necessary.

Best regards,

Sreeraj
