Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792876995;
	b=aCl+eUq3V/F9NOEiuAkz5PSgW8GqAgblk4aKAK5Y5OZsUOwQKv+gDDO5o0YltUuoYiTf
	 6T2814eiSiRJRsNXUPeGC6F3jjsAamWpsZA1vWe+pG0yL8I3sCG9fQoCt8LPPDFYJ/Hqr
	 8Rtiib+nvPgwXb6O2YLXw4AQK4XIhH4G3Vc2V+5lJ08IYDeMEvEViFonquQcsdDogQI7D
	 dyaqznZj9d6MOk8RoP+Cks3hj7Xi4EBEUO7/827h3wTe8U1hzmIo85CBZrDJ/f7g/rOQb
	 8fhPs5heNC1VcrZOFeN3VSGTA22nAQWM9zk4MuXcHtpJX1k9swC5A2NKW4vRGzaY10A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792876995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/uDSBSON0zRSqoCF+kBzR4qoVmokC3Xn3ipHg55DqZs=;
	b=WHdVQuUfxQdskD8/DgnbgzpgQGSdKIgrDGzuFyjnlMNE96e4Q+88Vd5LIK3y82soX1iw
	 ggQsdgtAr5q663zzlRCE6UiOYjH4JJek55uxUeRIN4eMJ183YzCJCHpxlcuR093Oi9zkp
	 VCDi0PZ3PpSmM8RZsffyN10HQ92b72fkPB3HXVh0tDPeqDEUzU/A5R8T1emuasSb1BUi5
	 0sntFrN2isclHHjqAL37eOc7mauSN0hn48xeXjDso7mvknIbgvoxlZF+Imh6rurehzUUY
	 /4CuptWWMrXT8bduizzw0tt2jwmXaaig1uP8OKGrfzAuIPASoyiOFjFYM30yMZz2PGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FnDFv9FC;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B29606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B29606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FnDFv9FC
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso15053805e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792876993; x=1793481793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uDSBSON0zRSqoCF+kBzR4qoVmokC3Xn3ipHg55DqZs=;
        b=FnDFv9FC0AHYyP5czxkqqlZwWra2RtzF2z1eXJhYudz5n0i+dp+GtgI43Uw4o0sun9
         ZbhTL2y7qp0FgwwS+Upt0OpshaSddBfgzZAPWg49SmyiiKXIUYBVSpMUMNOlJfvmAsVs
         6D7UUrX+3/gQb4XfSFki6C4jtUvgCK/0ZYHihKKRn7QACjYeIIjvMIFX7d/KLsKeWS79
         DJkAZcvtkY84Go1W3T3eXAmCM/Kwl51MxZi+Uxgu0xCh1kiN0ysfJQAUcKribzWwQZEd
         zNfEiooshsZq2G3+K/5P+MlT80bHePXqKMtfr8qK85bJhbDq6yk9YsbyhBXlm4i93j03
         DDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792876993; x=1793481793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uDSBSON0zRSqoCF+kBzR4qoVmokC3Xn3ipHg55DqZs=;
        b=PNWAZOULV6GO96iYNWkGw9USI5tnGGgzh+vm1nf8LvbGf2TogUGh4RpD7GQOn8zeO2
         rrRxLaAAMAeXKBiC+WMtMwnCD4xYT4kp7MA3t1R9kkLVYM+2RZqiY/XItW54bzazw0oz
         Zy/yYm5p1zxVSbd4PeJwjXTrMmesSaKmaYgdsWnyqRCtVW3S77DLRR/6EGu0GeY1g3ZA
         e5irHM9RPu5/9HJNIjTX0Z6MDscI5lsfqyBsKOHBmcxTF7hxJNiFj+VHIvvK/8kfjC6N
         Sock24UYJBcTmT46du/Fm9WcYtT1bbVIec0vL6yzia5p2ENQAs1v7sVh/BsG8CNxRlL5
         f6JA==
X-Forwarded-Encrypted: i=1; AKwUvBxdziyF3eSgT/cI1/f7BdE4LvpxVOGHFIUwHO/O3/dFkVBzXHAn7SBlyxJ0MrKhe3j41iYW9cDzj0un7R4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpo1VxXsse8YKztX5YQIOPKZlojHhYC2tpjPaSyVvRrf/JGzOD
	shvMjd+lGeYqKgbih4VK7pe1ICR/H7Fe8kATnZlsGsdH90eKnQXonwak
X-Gm-Gg: AYBFou37v6pKCNjD0d99u64EMM5W8UhN6SLG2xcx1y7gq5XLUpbaGVjYF3jlXk/I7o3
	dCWfbPpAGKaGequDQ7ZhlyhiOg2O59XRxjvhU0sA3r6+KhHqe9VgBpRPLlvtY/wu85Rd0L67Try
	uF90bEzAso5X39HaUjaNSavkBZDA6RaN0/fiAPQOg7S5Dp/7iv6SZjjfYBdClapbdD6pv2jOUAU
	kd5hpTldq/to9+s+fqi1TQyh7ug78fA8sYaKXGrCEj2yEEqrQ1KOkIOK+L96ZuKTCsot9t2Swcj
	1l6neLB7vTRFWFo1tD1Vc5YepwRfDIrEWDEO603FR4lqU6lCMRGNpmP3lEpdq2+uuQYoZpisXb6
	BqjweJ8ZBalEurFZocGOu6ZfMh5zzeBWiwO6CVFbCvPX/Kczrs3DOp9clQ/UAFZHp9xUl4lHvMh
	HJENcOM2Aq5fDMgGpcrNW8cqo68imlnV+RzAr9xtotWAAWQGmOx7waNaULXVlfhczZMgj/m0qAU
	yZvnW/LZk9YfNYka8I4LQ3DcTTWC24oZUPr2kdocn+3/3ARDg+a/lqjBCoxSU/MBHPi0YjWCUGl
	dofMkw==
X-Received: by 2002:a05:600c:6095:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4a35ac8bf3amr39663215e9.11.1792876992941;
        Sat, 24 Oct 2026 14:23:12 -0700 (PDT)
Received: from ASHA ([2001:630:3c1:164:1a66:daff:fe85:4026])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f3e00asm147825395e9.0.2026.10.24.14.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:23:11 -0700 (PDT)
From: Amir Noohi <amirmnoohi@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Igor Velkov <iav@iav.lv>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] genirq, KVM: arm64: Avoid the irq descriptor lock on vCPU load
Date: Sat, 24 Oct 2026 21:23:04 +0000
Message-ID: <20261024212304.2620845-1-amirmnoohi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <87tsmb8gdv.wl-maz@kernel.org>
References: <20261024022450.629980-1-amirmnoohi@gmail.com> <87tsmb8gdv.wl-maz@kernel.org>
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

Hi Marc,

On Sat, 24 Oct 2026 12:52:44 +0100, Marc Zyngier <maz@kernel.org> wrote:
> Looking at the test case, this really isn't a representative or
> realistic workload.  This is a contrived setup that has trapping to
> userspace as its only purpose.
>
> I'm not saying that this is useless observation. But it is not
> something that represents something exacerbated by "real" VMs.

Fair enough. I checked with real Linux guests running hackbench on the
same Altra (kvmtool, in-kernel GICv3). With one vCPU per CPU, and in
lighter hackbench runs, it makes no measurable difference, but it does
once busy vCPUs share CPUs.

With four 31-vCPU VMs on 31 CPUs (124 vCPUs), all running
"hackbench -g 31 -f 20 -l 2000", each VM takes 76.5s on mainline and
60.4s with the series, so 21% less time (8 runs per kernel, no
overlap). In a profiled run irq_set_irqchip_state() was called ~2.4M
times/s and 47% of those calls hit contention. With the series the
contention on that path drops to ~7 per second.

So the case that matters is overcommitted hosts with busy vCPUs. I'll
make that the main justification in v2 instead of the exit-to-userspace
test.

Thanks,
Amir
