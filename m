Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED933BBA01
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412982; cv=pass; b=ff+J8KQWR6noHXZln1Wm8y5p0w2SFwiUeXTSyH60GpZfQ+Q4+aKNB/Xrnel+x/3OP/5ztKyWpVBRsixk+ooTavSgSbIhrptvy9x4mWGGg6eI+cwc+gXdIMd9hNTEbdZG3yrY3EDwzU7grm0dxVwIJtCoxbpMxn3DlASY3qoqjqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412982; c=relaxed/simple;
	bh=xk1YgFzBk6elfDd8JjJVnAZesHkNakF18ab0MQu8l/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gh4kl/cTtTaMNcfnQTFnKca3O3kujRcvVSPOj4ii75ZmgwuiBFydk+GncpLKrN5NF0d8Y/XvjbHHQiuH6zWC3/S9z5dP6IvTz8xBC+sbRdyJE7bxH5ykI/pkXdZuQsRDtOHEqIYzRqXzALIabcVuporRpcdR5z5XfIT4k5rOekA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdA41Cqt; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdA41Cqt"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47b5043f191so1420473fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789412976; cv=none;
        d=google.com; s=arc-20260327;
        b=bYbkbTDzw/w8dRl7wfAjhnLnvra9hM6pZW6GjFUQEiHhGt187WoxOFk1UuaRVCVsea
         R0RS2PRUeVBc3fUS9bgknvcpZZJnsmCllVFoRu1w705NzawMVXZWSRLK6DXVHH1ZiB99
         g1aXpU8WFwjdcP6QUU3nUU9QV6J3ZJgA+wIivk/Z/F/yCB4XtGD3NKb51hCUhziJUTV+
         qLtbWGHX5KRAJDaELKIBPzRT5qOYslnK1He7B2uBhZ+U6mXK1QdJymn7E4aeiDMp6Rlv
         OsMIKrARYNvZoAdDixs464G5pD8drIGIhR0Gl5rmm2q6ukJ7A0H/8IOQoKYJsR2fx+1O
         SE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z4qmyS2vqfHj91Rn4XVyGVsQU3bnE9E4yE+vz/mcM9E=;
        fh=kEH3fxGq3JF7pz+QdPkfE3V4RXqgoHfHJM+1D6KbFKE=;
        b=H80HQhc3IoLVw7DAdFtPmmJNrSSVDjHNukJSlvEMTcdWvjGViC7xdBw2vDg7SrV5SM
         nuqtns0GIu1x2KhWNsVllLWSNeDM+nSts6KfaEgyD+pEYde/+KNrckfhfU9RxNzHLiv3
         qODoEhnk7bCOdrUhrjTRtT8Ps1paX2tV1UeZrZoPxhdUCj1B8QDJ+4dQHTuvxbmFzSLm
         MAHGGBrkIcBpVxblinnEyaKeJx9bf5Q+a3aWzAOCBY+x2U8a5mMKS+oJB4iFu5LE2H6f
         SFgprSXdCi3TJRlu/Qa6cgf6AkG1aSq/oSKHtbZp32EmqNTzfVqBpyY6w8PFowDJ21ZH
         RnnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789412976; x=1790017776; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4qmyS2vqfHj91Rn4XVyGVsQU3bnE9E4yE+vz/mcM9E=;
        b=YdA41CqtM0PJru/Pa135R2Pfy2llWQ69KThYyiqzGxBZQI8WrxL1HDos/mtOifBz2W
         7pc5HkxuV4jDAHfWhEVzMoEMI3dj7Dur+h4xuXUE01gqxXS2ZbkGoDR9bvh3D8OI4CS8
         qEAYnBS/3kx//ZA4zg15X3V2dAJKf5JbHECdMUEjrzTqbzuq5CGCigPheCkl1nLPAN9q
         ifyrEho/pgbXUSGCYzCL/+0gwcEODyINll8pbcOFHkHKxVpmFONCq/EcoG0jwsCICM16
         +9SFSGNrtqSFJHYfhHPqEmFgZFb0HYnBRm7WI0MNZ1HXBxnMw+VrcpyO/mcsVM1XDNeZ
         BkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789412976; x=1790017776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z4qmyS2vqfHj91Rn4XVyGVsQU3bnE9E4yE+vz/mcM9E=;
        b=oim3WnIpgSRnwbjNy/IolJ+cdAxZkAXZqDjfqyLztUVM0xx2eMliWTXzDt7JC+Dom0
         vaJIo8NPPFt8HeOy9nF5sloKwC9yKe64/uMH1FwofZOS3CHe2Zlb/zCqDqQaxo4uHOO5
         NbY38ojjb0aDgduIEeA+LbaPgpfsOZ2yTiKEO463oqo7yXNxZvFggNIMZmhQMwNXjamU
         W0Dl4/8h3oNcAS78os/mrDTO9dhdbReLO9yTH8yNqFjR/zQI7Qc5PW0RDnaJ66MM+/U3
         u0EyPUqTL0aqcpKXWhklI8qxtvYZpJPkwPm5kP5Ok8k0AKILEFdQDeBQ+dA7rem/Cv03
         01jA==
X-Forwarded-Encrypted: i=1; AKwUvBzTfRgNtpeO+jkED9cKhjt0kUuPXXaOhtI72gxkDqnKRD/xHqeJPIJKQFSJPQZtYL3L/VZjk/aPu7foem8=@vger.kernel.org
X-Gm-Message-State: AFuF++mOWu5xwRO1xKKjvDSJadrevi14t9Ke3W2nEgXm2QO5ibAqaBDm
	QEjwDT4Oc3Mjq18lJqOFDxO9Ns0P/Y4pb8a69pk8fbgItU+/HuM2I4xojmgzAYvtzL6r1y6NfPp
	Sphm/y2yxGtK6oqUug8h75jyvjIRvNnQ=
X-Gm-Gg: AYBFou1Gf7RXhH8PDAuL7QkuPrSTv1pHdKCG3cQu97yN5u75MQVQCo24R/dY2ijgLmO
	vsfXnNqgMaRMnfO7sK2j3n2ochiujfgEQQmcUZVv7tKgzvggevHodpNETNPxUWf/8H8oHGra/mb
	/9tmOKnIoBxvmFkllm9Ezdb0o+VHMCyllJ7LuSN1qnMGDGb1yfsaYYjJP6VJkKeDNIoOVsm9Fv5
	xLme3elk48B+jH9vI8IL4X3EI9Rs9rT8I4JpKKls5QSM5a2J2FFh5OTGVGvpDSS9abaqnoGPiTK
	Rb2B7rAtV/G6a5p/tteE5Klrh1SgAmgTwie2O1ckfxxD5DKVA4MELSKEHRtyQskzjTxsVvUXGjp
	xlxNsXxWhkg==
X-Received: by 2002:a05:6870:458b:b0:45e:4deb:92e7 with SMTP id
 586e51a60fabf-481f97f14c8mr3645365fac.10.1789412975663; Mon, 14 Sep 2026
 12:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914175907.1027349-1-vdonnefort@google.com>
In-Reply-To: <20260914175907.1027349-1-vdonnefort@google.com>
From: David CARLIER <devnexen@gmail.com>
Date: Mon, 14 Sep 2026 20:09:24 +0100
X-Gm-Features: AcwNN1XfrufVB7vfooH8sB3z7NEf9B9zed3nYyuX5q2EMKLSurNaKFGzXUBsno8
Message-ID: <CA+XhMqxp2XOB9PnfHJwBvK0up8Oej4hGcnsM0a=fdoRDyVoEyQ@mail.gmail.com>
Subject: Re: [PATCH v1] ring-buffer: Clean up resize_disabled checks
To: Vincent Donnefort <vdonnefort@google.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	kernel-team@android.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vincent.

> +   if (rb_resize_disabled(buffer, cpu_id)) {
> +           err = -EBUSY;
> +           goto out_err_unlock;
> +   }

For a single CPU, this now happens before the nr_pages == cpu_buffer->nr_pages
early exit, so writing the same size to per_cpu/cpuN/buffer_size_kb on a
mapped or persistent instance CPU fails with EBUSY instead of succeeding.
Intended ?

> Additionally, remove the unnecessary cpumask_test_cpu in
> ring_buffer_subbuf_order_set().

The install loop still has one.

Otherwise removing the second check is fine, the hotplug window is
covered by the cpus_read_lock() patch I sent separately.

Cheers.
