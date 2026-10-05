Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27FD4334B9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191493; cv=pass; b=i8VbUxAcp4mNWsida+pXzQ5zLRGHf+xG1OYE5YsHd2bckG429AmmxYggaYCoSmbgJLU7yNx5Wt3khf7OreSAFuSzAfc41nA1APcTKSiasTz63Ltu+2CNgvjALUbZlFGcTiJsW9GixZY/Oy7FgtQbOd44F/R6cYjNRtlvIt/21eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191493; c=relaxed/simple;
	bh=ChY0fe8uxN17uPp0rtFzK6B1YmEKykgx1fi2JdUkWNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQH6cHvGkxWSHc7w1mlg9Q7eTvhPMxhLM9KLFcUhH3jKCJ8oVn6k/FZMN1SCO4cAbEOYSeip+Ue+fDN3+0SindqI44KO5jZhZcslBu67FVMHBBzMSqQR+BXDyT+/sLei/UbIIZTkUHcU/hLy9ep4QoyrbgUxppft+UkYKw2vXpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVl/dL2k; arc=pass smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVl/dL2k"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e59607d38so778549eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 02:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791191491; cv=none;
        d=google.com; s=arc-20260327;
        b=jAQ+MYJcUNS4uBK31o/Ij3km1FXTW/PTHGcTgtSQf3rPy2jmHvJMUc21kIefp4RtZt
         Ez1poa4xwZjQ+Pdtv9G24J15DOHQ7UlD1FMzDKIrqwIn0lqg2zCNfgFLYAouqYbdcL54
         Kb5vv+9ZHvl+TPtCs1XBe33lUi8XoqqX4ZK0o5I7M2l3hgSj3MEx7wKqHGCsATbmykVa
         P7Kxz6mxviNL4RKgWV/BdYjnH6N8LrLdIRvGjmABt3Lly7lj1vINZSb5tzuTJXz0dCFi
         IfUUvQ/TGTSUExaQujxyqn3bZTHyBPDSXkFK0O1WP85scCI95N//bh4la9O3HfsUhu/C
         JAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nltl/oeRao/6F+EabSYNj0oW56X0G3LfHyr3jad4pvA=;
        fh=D9ETD5sM1BOE3s+F6IbmX5rsTJ8TCDARD6eQtA7WjPU=;
        b=lbKo3R/GzOWBxXiTWqN0QFxssUzYutzsmc68UKtF+Cz/IJaUKuUmQO0F2R0xcgLhSE
         i2bCAWW8m2zrqJh8s/SUoE8S4RsDNQm4nbuQLnaPmltcrLWK4FLERdCeQbbX5ZnHW7Jh
         Wn0th6TwxOCrBDK0ZDktnO1HK5CiboFvxkpASwlb8k33SRrCiYOFA/FYYXTlHC2XdTVA
         oGePk5EDaenmKTt72d4m+7Ay5b/dndef+SLOPbW3TIPEvqOxd6sVqVbZQcyhK4tU8qN6
         XWcrN/SrKy/mpIagwzA3V9UoWvJYCtKsbbxK/xSEtJmZSP9UIHlT64hW7qYuKPfcOPSk
         eC9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791191491; x=1791796291; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nltl/oeRao/6F+EabSYNj0oW56X0G3LfHyr3jad4pvA=;
        b=bVl/dL2kjniDVhsPG4kzAKAeGF3gz/KxiSCwVhyNVTZxnnS2EjvNCv783GxB39x/IE
         GaAvHYbRyjYLFprst4Q7g0w2sKU73K51qvXkGq9APOmwNqBxpwcNVJQyV6zMdSeHodYC
         MbUgZK0KQGcBlRNkFU0d3gU11aTlSZGkg46iTDJVaxDid/uf+jALbioLMIeiEBeBUUNt
         WZtLQhj9txgpnW7s7bGVRgoiyht/B7IScBp2kfWxTLqNqxfEGfQrRT5nhe+PAUKeU6sK
         SdyqDj+LLuYXM1jIXyFKtUXFA4JjkLcOMXappBtXjVeMJIVqliZt7T3yKiewrwvGKIzH
         Armw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191491; x=1791796291;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nltl/oeRao/6F+EabSYNj0oW56X0G3LfHyr3jad4pvA=;
        b=snVfWp0/I6oHOPlEWgDgA0mA2iWGb04/kiDZJ6Yiby7NWn9Uv6rhRD8Qvme+dcOLpM
         758A3P/lsNTrykFhSt0SgDHX4fk/RfD1FrE4JnWynFXb293PiVABAmB7EfQ1V5xtGP9k
         nFsrDeXnr8ICCR3AOt2UBnzy6HH8Ry92NopJ2OeWsDQjH0k9EAhsbrfu7PLbF2RtZU0k
         RP4A/L12KnFEXAmZPMrsotbiVmibP2ZIcDfQcrR8Q+YA84x7dKGEWxlPc7M8DGlrHIQ1
         m4VVDAWxf/l6+21MmUUUm9gHj3V5jJ6/3h+NiuXSFtYk9bk/SThMhPzH+rL2ANn8NaKG
         WmZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUDWvWhmzx6lf1x6w1CDt1xSHM1HYR0+2ph972T8bLJXhixz2SzHvkBycXiuHra7Jw3ghjuBgXcx27dOg=@vger.kernel.org
X-Gm-Message-State: AFuF++mVqRy8jYew9VlxKW4KjC9LCgKmY/3x8Sy2dGT7jZ20cvAtZtto
	I3QAALDMxT3U+6lN4ZGsKrxoOpbdxPOjMzEWpnQg5LbiGm5fHRAZOyE6Pfk0IrEbH+3xRHN4qLR
	p0KNAozOWf8bkVIxUCP5EC6UOt/tlDg==
X-Gm-Gg: AYBFou0BvhoBXYePF4/Y3ER9VonJp0EPKPyTAsjwZQ1Ub4hzFmZNhJSbrZlGzFhoW4F
	NduE5QxKRxxphf3GmUJ0J6oS4oUWSJoA83SJmCNpQNj9q0JWUWeHdfBvYYQLoS696IlcyHjMmt0
	iRsF+BiWT5+8xAbSoMEM8QXk6f6owwA6BdNoOTLHmDvfUPE2iK0jWa6R8CdDigXy25aHX5BA4nc
	fOGR6JCCuEVmN77PNFpNcuzJmJNIPMR6mxDU4HKGc7gGTwcTFQQ3S+4bkmjiBYOfA6JTtURutnx
	xJGZ8Td8xB7Zr162YVjH+hIRVArl2NOgNCJ4EYqdOG9EBiuF0DBZ1TICaA==
X-Received: by 2002:a05:7022:fa9:b0:14b:ff40:af3e with SMTP id
 a92af1059eb24-151c0b1c634mr16870099c88.5.1791191490914; Mon, 05 Oct 2026
 02:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-damon-perf-rfc-v3-send-2026-10-03-v3-2-0f00417b41bc@gmail.com>
 <20261004091023.630362-1-kunwu.chan@gmail.com>
In-Reply-To: <20261004091023.630362-1-kunwu.chan@gmail.com>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Mon, 5 Oct 2026 02:11:18 -0700
X-Gm-Features: AclHuK9SLpvLjJzhBJihMA5kXTwHPEKQErl28l-hclZyIPjWGE7kxoL_9Ju2DmY
Message-ID: <CALa+Y14isN3HmsY9Mgtdi3O3zxOH33uTtajSbJcxm9FO4Uon=g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/9] mm/damon/core: replace the access report
 buffer with per-context rings
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Gregory Price <gourry@gourry.net>, David Rientjes <rientjes@google.com>, Wei Xu <weixugc@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"

>
> Hi Ravi,
>
> I noticed that ring overflow drops reports and updates an
> internal counter.
>
> Since hardware sampling is used as an access observation source,
> could userspace get any indication that reports were lost during
> an aggregation window?

Hi Kunwu,

Not in this RFC.  While developing the series, I used a developer-only
commit that exposed these counters through debugfs, purely for my own
testing; it was never meant for upstream, so the RFC keeps only the
in-kernel accessors that the kunit tests use.  v4 [1] is the same in
this respect.

> Without such visibility, users cannot distinguish an aggregation
> result affected by report loss from one collected without loss.
> This may make it difficult to evaluate the reliability of the
> observed access information.

I agree that userspace should be able to see dropped reports.  Two
things to note before exposing them: the counters are global per-CPU
counters today, not per context, so a per-context interface needs
per-context accounting first; and when perf throttles a source,
samples are lost without any drop being counted.

I see two options:

a) a read-only file under the context or probe sysfs directory, once
   the counters are per context, or
b) the drop counts through a tracepoint, per aggregation window.

Your PMU-agnostic observability series may be a natural home for (b).
What do you think?

[1] https://lore.kernel.org/all/20261005-damon-perf-rfc-v3-send-2026-10-03-v4-0-b03452e137f3@gmail.com/

Thanks,
Ravi
