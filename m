Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607991;
	b=peFom6YNhUgLAhuGOArrmyOoKwKr+G1W2ZcrObVhjJ+k0zFdp/C1oHOXp9Tg+8sb9DsK
	 IDXncHjW+icVefPn0DJ7ZLYC8ZtQFpja4WjeQvodHwFKWcj/TOMwTNfamyy6yIlPyiGmW
	 smcjcluNkaq70YvAyas9CmxQClgTqreo/GxRBjI3/biEGLj6CZQhX1B7pz7lFtPI+yrWs
	 77702dXlg/bbAQWNbgcbjSY3LbLu3JqlIOxbS4hEnjBdUh3ecrMq4ArayQKEn89hkoHoC
	 2cNtLISm/WVOUqW1UYm9Yn9ZaIWQRmEJUejqcA7juMyRum6RuqwM76nSFEu4d+KpUUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dcE/5rnGxKA55YKLDJm0k2JZRyvDK8vL0G/XzycxiFE=;
	b=BdqlorVzytQ2bgO3i4cmNk+1xxUsJSvC/54REcg8x2ZphKtfDwzQr541G5GKi4CC+7bO
	 lWKstG1kAyfxG3hO0u5EdnnQxrlvbYScq2hLLCVi1ZqG2MH5msGu9VhNJlIyzseD90qri
	 hfrpxHGaY7HNjUQ7xlzV28ewxMC3i3Ra1DcInJtUBRva4ueTpXQaUbxJmsVxVDqEyi59I
	 szL3GxLUZJsT+F5sRUo7IrA2YXkJq5iB3hRgLQCeJydtPnhWHJnJzzvfODfBcCGhIqW/R
	 +y3FtkvxFDyUH0L/zxtsTYAOM8ZLsY082UWWPHelelZKG3sPqzKuMBkkp6Lfsqgj1Cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Ghla3XBe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C08606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96C08606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=Ghla3XBe
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso443063866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:26:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793607989; cv=none;
        d=google.com; s=arc-20260327;
        b=l5lcBwbQ2RswbmwgwxEAABEH0Gq35D422sKfSFlz4xMIjVH+04/SYBIijH3nUIrQQu
         ObnrRnOzevbzBK1NxYrI2yphRd9fjZd3U46jIFeH7d1MXaJZ1o44vDoy0ezogoj7iO4w
         JWC4C+vndxhQTnGbkHPa7/Fepbt+79PP629KBH+Odu7YIaeWLfSfp30+Cofl4Qu5Opxl
         4Se8xFe2S2wslU9U7tuetqwFrBBTvU57LIlpObnix9d1as499kpZmJxWZ0LuysFE9f2P
         6K0Jcgvk7mhdkKW+7JguYv0FFBWdD5mw8cVquOPqy/dkE+8boANd9EjNzFBsrQ+f8ZUg
         9p0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcE/5rnGxKA55YKLDJm0k2JZRyvDK8vL0G/XzycxiFE=;
        fh=wvCt+SVSf9JQQdRAke4opEBYg6rMoCpMv3kQAdD8Myc=;
        b=Ligwzrjs3eu3v/0NpE4pK/Q152by5COoiQEX0b+YTxAjdGqk1KRU3ZNsNGldVTVnHA
         bQ4umBrCOhK844bwoRsJjwmT0aINJVbVDBSWSQW1kMUmWKPSd6w3rudarNa8956kSRxJ
         aubpZOqAZCFuooxLMCMZ27900Z8j9DEv+9HF4Z+Y/PQExLgpgEqPjCTF0EYdg35+ssk6
         6VzMh3Qhmq6xg4lhjktvtGKKnua4wPEGSJhaZu10FISTyBwv5DtQdUw/Fhwr6Bvs88L2
         1pm4YzZ571YfluiaheLREs5VQa+++DnaPlBcOz/aPmWBm2LEJ7YrjXeW2ySHFGBBdFlS
         XooQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793607989; x=1794212789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcE/5rnGxKA55YKLDJm0k2JZRyvDK8vL0G/XzycxiFE=;
        b=Ghla3XBeS3ZICDrDsHjTXEvnEEaidAKWl/h1ntZF2kzJFeB4ZzlWCOPMEmE/cVNY9R
         K6YEJg4LMX5VCL1r98aAqcrZvHPyPUg6ePzuNvBalIR3blx7UM7fdSzAaxBxiodOU81T
         /7mgiqozIqGVoXjbU2aqi698KLTkCnXQVLgJv+ouqP/L4lRbQKoyeMl1WHZ9y65FT5Z+
         wIeg2Ujtz7Ip7hUxjCJql/TVnrLpJZzZi8yOvHuRz88Efp1flvosjSN95LCMQxTFhcPt
         5xCQJGPZYk3ZfV/fwpXn4ziYAhwWTXP0BBQjSOIbuYyugnyZM6QfnDWQNohKxEj6AxZl
         nEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607989; x=1794212789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcE/5rnGxKA55YKLDJm0k2JZRyvDK8vL0G/XzycxiFE=;
        b=KRMEDNMBRtKCXu2iIRn/FtZAfAQQqcSliev+kxQQ7YB5deGmhMcSoPqqYhmwNrt7rf
         jyJpol5UFXFGLnRNUL8YzcezY8AAgZaX3BaGCnfS4bA4K6CMfE/b/xRBF0FvXY4YwmHE
         1GnLq9Z/eqgiU22obUMawfaJCLlxZw4+lZGv2InBHi7q34ilJN3EmgjqQHZxLCFE2Gxh
         XpVHnJUgp+s9l/o6CNTQegbB0P5esXYKLmrK0VTN59oPmyMC0FWiwanfzLVp0Qv9D2nM
         5cxhDISCE8iFinYuokmP2ltEXgn6Dpr10Zi0BFh+IlFn4A1EeIIjGtygzu0bsRPrQOwW
         TqRA==
X-Forwarded-Encrypted: i=1; AKwUvBwHZUHElldXbrHIQxYieETbzc6rGQV1kxQFkh3/tEtTK/mCy/wJ1V26+AO2RG9vwimrqmqGAM8noFeHhTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aLkqiw8Jp98+/DUfMz0HQYgaqiYdkZ704Ir354nnqjvP07eon
	X0etRuYY+ElG9zLNTdZkC1oJjCS2edd+Mgwgu+9eZ3QjX3Iu0Wcc3AQg7JNPyyI4CtkOBeWH3Uw
	XqEDOysaAPc5DMUrZjAdtNTt97OJcgcKHJaa7CB4Yhw==
X-Gm-Gg: AYBFou3ubI2isEOtnbt+5w3Fk7ZLXcEX0TOswHMV+WkbI5zKVtMOduC5FS2U3U7Z1cY
	ovIvYXy0Jbzq/ZaEGRtFJIRzcAV4WbTZTvQjQTrZvSqjRLVSA5Pyx2iwkIJ2wcYQNqhbms0HXfP
	WPMqHMeml271HYkb2loEjU/BhiBsxuroJHG8OqeYEYPWOdSM5MmnfCXldek8Ah1bChymVfNBUkZ
	dtvS+oqFTBvGPLm2I45vsHmJsli+xAWpGRn6M7cqkh5W6wtYqbXfnRGVH9c4HvX+RVN02V9vDJS
	bM23l/hXY/SU2DVXJdoeD6DjUtz7xi5iGdR61jg3Bo9rPlijTS/New8keiD7lnItltHSRssAY/q
	3+XNLawUjpvRYSGdopIT1AOLK3v1k86gETqechbK6d/U3wajY+RiGtMxZyo/kWEYTnKCiriBeCv
	hoDvMRGaOc4t+i
X-Received: by 2002:a17:906:ef0b:b0:c33:923b:ad66 with SMTP id
 a640c23a62f3a-c4ca7acfb4cmr790165266b.43.1793607988903; Mon, 02 Nov 2026
 00:26:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012205447.2717801-1-max.kellermann@ionos.com>
 <20261012205447.2717801-4-max.kellermann@ionos.com> <a64f6a98-de70-4004-aac0-312cb05aaf92@linux.dev>
 <CAKPOu+83bH2CRtiAio+1VTTQrYFF9th5XfG5wL45ujEavPS3Dg@mail.gmail.com> <20261101135047.61fc3f209b3235ed6fc96183@linux-foundation.org>
In-Reply-To: <20261101135047.61fc3f209b3235ed6fc96183@linux-foundation.org>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 2 Nov 2026 09:26:17 +0100
X-Gm-Features: AclHuK--3PTuMj8RZeBQA28BApSOQ09xugBp4TxqQtGO5WmzRMN0zBosAEwqtzc
Message-ID: <CAKPOu+-e4uPhjSj2KxWojDKJ6GsK51HrWMOwN9-SAnqi2gMW_Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] mm/mglru: cache the last memcg node, make tail
 insertion constant time
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ridong Chen <ridong.chen@linux.dev>, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev, 
	baolin.wang@linux.alibaba.com, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, hannes@cmpxchg.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 10:50=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
> So.  Can someone please propose a nice simple quick-fix which we can
> backport into the -stable stream while we work on the larger
> rearchitecting projects?
>
> I think that might be Max's [5/5]?  Max, do you know whether that patch
> alone will fix up 6.18.x, or do we also need to addressed that lengthy
> spinlocked tail insertion?
>
> If you think [5/5] is sufficient for -stable then please propose that as
> a standalone cc:stable thing then we can look at the broader changes on
> top.

Depends on your definition of "sufficient". I guess [5/5] will make
the symptom go away (the stalls), which is a good thing, but I see
this as a minor incremental improvement that doesn't solve any real
problem.

The real problem is the degenerate performance due to a silly linked
list insertion algorithm (traversing the whole list each time). So
with just [5/5], you'd still have hanging processes and abysmal
performance, no progress anywhere, but nothing would be logged. On the
positive side, not stalling RCU would at least not pull the rest of
the kernel down with it...

I repeated my benchmark, this time with Linux 6.18.60 and an isolated
run with just [5/5]:

                       No patches    Only 5/5    All patches
  Requests/s                 5.28        3.20          50.91
  Mean latency (ms)          1494        2463            154
  Max latency (ms)           3932       10467           1685
  CPU time/request (ms)      1494        2452            153

Patch [5/5] does not improve the underlying performance problem,
there's even a regression in this run which might be noise.
(My micro-benchmark does not reproduce RCU stalls and thus does not
prove the RCU stalls are gone.)

If you believe [5/5] should alone should be a stable bugfix, I'll
resubmit it to stable@.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
