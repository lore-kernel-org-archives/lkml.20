Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292513;
	b=pVglvfqUz2C8f7bxZIpD6BdPAGMCKsqqRmkV6hTshpDYoxAX1pOd9x21YnNkWiS0j4cO
	 i3dbREcx7fFrZoXOF60tv7ZxvuAropmdCAUUcDhhz/BoZDnzUFqJt13oHicP+NyOZIZyb
	 2IqL5DElH3WvdOpZz8ilRJf3Vm0+7NJbihcW+U0gyTHkZ2OaqaZkMS5P3CDS47rVy05vV
	 IKEau/IwFWdD78yF1S/UqKZy6tDjjPFpHk068SuHoFe70LwyWKs7bumhSAyQhkTUsDTdx
	 KrQG6Lz2aFJ9cpa2yIOdyDbuan07DEzokFVppAiWrT2HGXmVjnje6Kmvwqpnn7vEeRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SrAtUp9emSKSwdDhGVp75ycz8yJkKPQkr0AQDP+R5XY=;
	b=vRMWH80zr5lAwcBekj4bcUujH5ehneWzPBHHA+3SnXA+m+r2nuSBRtxtZxEw1B2hgAsA
	 XnT3hPS34KygHGE8Ik25p1UHK/XScV927m/YQHAaaSN1LcVhJkgWgTLpE65bR1BPdLzEW
	 D+IP/7uVVXOlGfF0e44BpSDgcBb3GYmunLXYqAvD/oUBVowVRdK7kkG1JrVi7rY9HWTyu
	 vuFnlcHfPfAZVlUy/bvNd/NP21H9o0pL5UFH42hih25eQgdAWebKWQeo0fw1rNxG3yjvH
	 UB48vbJRjKIknO7of/oF2MjG2nZD7l+FoJLXrqcfLfS3pA9hG+c/70w5Y5ie8ebjsjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvZh9KkF;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAFF606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FAFF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KvZh9KkF
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so1093073f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794292511; x=1794897311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SrAtUp9emSKSwdDhGVp75ycz8yJkKPQkr0AQDP+R5XY=;
        b=KvZh9KkFCB0l/6Bmr8nRlFNiNAYwTuU4bAbREFGDiprWKCca1D9gjGF60eGJA+3F1m
         /bv5d5Tc5eWM5D865wZT1/xR3NEMOOdRqy4g1KkEy4dNN0ai3E7ZEOXBKCO9AA5jrZON
         81noRzABdcThsTx/uPfWP2XKO8tbYcZNnqcldty/UzrmzSJt6LP+9II6IP/t+90m35A4
         cHdS20nAQY6nLpp4JCwaxwmfEkKJkszzwHAQ0RkC24pcwIC8g2itd/wYEPWH0RU5LloK
         +jxZ0egu/5nUvtzeuP+y0T3PHWti68rhJPt30aoXkp9b4h0G+AWEqtc8wek4WNU9qfaJ
         cryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292511; x=1794897311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrAtUp9emSKSwdDhGVp75ycz8yJkKPQkr0AQDP+R5XY=;
        b=ayuTeBFYife3isQ99ZjSsLYH2h9E6UVu4F6YOBiYhwvBVAHFZ5YzJ9Xugy/D+n/tLZ
         xKez1srvB5R8gWrOg/Fxa5MjgjVsl7QjZLxSgBtt+PpoQLYpzvs7vBtT4eCGWes+D0W2
         rX8t1lL8FKplqNEfFpdk71FLw7sSnQZ8YWxyWaenRx9SfUlARcifoT9wSf75/pqRNoi3
         DjGjLrZts+AAJ7JoN32UdLUHv16Ayy13g+rYMQnh7h84GaLVbrKDHF2jt1eCGk3nz9+Y
         WUz1hrX79ZEYwtIaw07tH3R+O6VlBx2ZEjMOuYeRq6gpZBAdBhFOqPVFzO1B9q8c11O/
         Kucw==
X-Forwarded-Encrypted: i=1; AL+hErHdG6CE3P85rgQfc2mgSqCxAvSCO4qDU1AiMHf7RdcMPucrFD1P+BIiqGQ3igsDDXM8VoJZAL4sNRnVPLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WxyaZcRD23ZCJ2NznjMSwMEiGrz7nGjKgEMI3dmZYYtAFQ1Fc
	0uIEuR4nKM09TaZ1o+F/lhSzMUNXfFHW48CLY5kViQvquewMQzUGGCRE
X-Gm-Gg: AYBFou2XARRKAlr1njKVmx4IS7T2vZ1/1X6l2UzYyOA2h1WvX/ezQWF/G6EiBleio+p
	ijD6i4c6E/1eTOCDEhnZUxdTnle+3kLepwOjUCroksZuMWP61Ri5ntjwJl7GcJpq253ewl7gQCH
	81nczLZ0QF48OfRvWvLCK3K0/7S/eu6A1INi+qFfD5aZUMG8B/Wb/vn7ojrSxkGrv/w0GcVne2Q
	9QxMJhmqchYp+T02a/tPgUmmA/XcX32F7wSsn/GyBg0hwce9z8IKSbCAOFDu3z2ZGpSl99OUxC2
	63gGyd1Muw16AyPcRjwYYyvIWyii9iVXSw1GBuNIta0d3x+6f72qvx24EFWnCsZ3vDG45RGywju
	l5FU6F1ydCqSZtBJhRtWRLZlJzQHdRP+/x82ECL8wkD6iRQTMWEjwDFkjxuAxj9BYl5WY8rTLqr
	XEsDGAMJCBOekBX5XiTsvyTWkPWWilyQwelgQbagY45jqTURZfSSwcsbfXwtAcEg8XL/qoBU/4S
	4Jfqr2G2fuUv7SDPNZQHwGMnNQQ2HYgsG0Eja0eOI53PkxEKcxJhXHg0GYy6+QnjnAv4Nc+FHRM
	HvtAbxH9/MD1t+K0WQ26KBPb7MZUNTWSq7Jk56HFhwl0mkAh5pn4IxjqdRV0W5msdJQgH3NRG1h
	+Y+oST4SaCH2gLax/qL9TndpFeQaFnOfm8Et9+nfuJ8XlpiQtnPLjp+a7huGXdSXnzH3rOTAf7W
	vMz/aMI3Z8evP25ntGb/tFGjqfk2daUdk=
X-Received: by 2002:a05:6000:288f:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-498306d02e3mr2957082f8f.40.1794292510590;
        Mon, 09 Nov 2026 22:35:10 -0800 (PST)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a0e9-dc01-c402-36c1-c306-953c.310.pool.telefonica.de. [2a02:3100:a0e9:dc01:c402:36c1:c306:953c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm3241156f8f.48.2026.11.09.22.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 22:35:09 -0800 (PST)
Date: Tue, 10 Nov 2026 07:35:07 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: palmer@dabbelt.com, pjw@kernel.org, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, oleg@redhat.com, 
	rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	james.clark@linaro.org, jpoimboe@kernel.org, jikos@kernel.org, mbenes@suse.cz, 
	pmladek@suse.com, joe.lawrence@redhat.com, shuah@kernel.org, mpdesouza@suse.com, 
	martin@kaiser.cx, oliver.yang@linux.alibaba.com, zhuo.song@linux.alibaba.com, 
	jkchen@linux.alibaba.com, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 00/10] riscv: Add reliable stack unwinding for
 livepatch
Message-ID: <avK6oydgmtsa_Sjg@gmail.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110013750.36800-1-xueshuai@linux.alibaba.com>

On Tue, Nov 10, 2026 at 09:37:40AM +0100, Shuai Xue wrote:
> Changes since v6:
> 
> * Rebase onto the current riscv/for-next (based on 7.4-rc1).
> 
> * Fold in Karl Mehltretter's two patches [1] as 1/10 and 2/10. Patch
>   1/10 stops arch_stack_walk() from reporting the walker's own frame as
>   the first entry, which corrupts the skip-frame accounting of
>   stack_trace_save() users (page_owner, perf), and adjusts
>   return_address() level accounting accordingly. Patch 2/10 adds a KUnit
>   test for the start frames. Both patches keep their original authorship;
>   I added my Reviewed-by/Tested-by and sign-off. I asked Karl on
>   3 November whether he would like to see his patches folded into this
>   series; he has not replied so far. Since 8/10 reuses the walker
>   extraction from 1/10 for its !CONFIG_FRAME_POINTER fallback, his
>   patches are included here to keep the series self-contained.
> 

Thank you for folding those patches in. I'm fine with that.

Regards,
Karl
