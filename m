Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794257435;
	b=p9b5q29HtPo0C3EmG6YhIowNNS3Fo9lTKjCyvTen+c7YFidn49W4+4yQZaHBxFb6KbqP
	 MYzxMcwsOdU3Lsu/E5iAyXjv1f9avatqJclgwKwzFgmpCMVGK9+B2YwI+Iq9JBE+vOnY+
	 q2nGF3UtSVorTIb7PkFNcl+XEcHBH+z+s57QBu/L6WgGcWSvzIY7vWzs2JuLlP11jG/Zk
	 U/o4jJNCq/yHWSL2xC+IW6pk8GHsHsc5qxo7NyOucy4GhFsvbsj1jhVABh6PbPS5G+a8t
	 y4XzaT7T4tq9iCIfAjosHKIpM6X/Y1AqZqONSutrvjYNZt3SoAG+1fgoHXBqzoIRyJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GA8L4hGmAO2Ltbd4LpUw+HGTw9ExVwC9vVc3s9jVzIY=;
	b=l3ZIRQ6y6eqAAlLP4xHxlouzUfIrAKklTPW3OCzJ1xLnH3p4zKq3j4MfZ1FJPLqPe8A8
	 snEMahXyOGHzwa08GN6CFlxrJ28nSAxVEQrEUJ7ucbbrRRnblFjSrwFbbjt9SGXm5q9LA
	 /90bcqLKP+ok0S8t1ty25utkZX/G4jUx00/T35/yRdc6qMvt4UHtp5oeIpPlRbRHki4AR
	 4B/vmyiPXN+a/E4mxA7piiU7TcHqMdJ+e2YGqkWF+q9TnhxyEJgUlDdRSiz9XW6ysfXeB
	 vQVPqYiSVibFc0N9OuaHNlPZfvc0IsQu1ixqjFd5UxSosO+9WdM/veREJLE/+F3+GqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jljl5C1o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB4A606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB4A606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Jljl5C1o
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b579ed8da6so598a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794257433; cv=none;
        d=google.com; s=arc-20260327;
        b=X8E6CqCqoNa+DdIC+LRuQPY/YKyzl2OYoIKZQleNa+WQgohWflEQcmxAxcEqZqYM7e
         ak5lZ2vKfw646Tz13WZLs4y74odQ/xVBnIWzpm7HD22EFi5X3m9BzxWJAb2c9AOmWdWD
         Zt6L4zjWy8AM4rLn9xPcBfJWJt0enujEMwjesOS+rsyzDh814vWJZUaqCa4HhCAkrTEJ
         PDiI5/FRd1s8jVaMkpuD4d55wIyj1oAvCfTzUvrMdeQ1A68eFG0sk5zprjkYRRMCuvRk
         W0OVkqJt4iBmlrJ7dtdIR0w9TIbMxExBhsXhb8SwTqprYkJAvKkOfT2mH9jMJw4zoeyA
         zxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GA8L4hGmAO2Ltbd4LpUw+HGTw9ExVwC9vVc3s9jVzIY=;
        fh=sRgFeNcho+PIMIqUrWIamVKjAQ38bxD09mFp3lY8Wcg=;
        b=i5TJ84nxTbcCxt9zDy8yYFl2QNmzbarcitU8tSi47HXAD78xNxSu4Pft00D5Pcc1Gg
         JfToleFFSQLIdYccxJSn2AmmSLJFh4jH4YMRJcrmvW3nBWCm0FXaR+dEe6IPPVyIMvfR
         /3JlzBFnUyyL6HtQ/jnZa0wCGPYqNvCzVdGhM/xuW7kELDhdr2+59jc0wG2tEOxkQPgo
         zyWB/h5HQphmp2I74eyZr+fxg3Ch4s0Y5sfM3qCwiVvqvjIuun03UF315Koa4zjHOU7U
         tWvMngRYhnCsNoSy+IARPkvbJHG2jovYnTZX/BLbSprSDsnLXCabARUNpajsrYsZWrPt
         OnIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794257433; x=1794862233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GA8L4hGmAO2Ltbd4LpUw+HGTw9ExVwC9vVc3s9jVzIY=;
        b=Jljl5C1o4ArGRpAZbn4DjdP+lM44ctynb9Sz8vaKMQxRr31sH9hX/sUHqhL/resu8h
         AkAtQZ0ZZZ+dzXQAWbG4HPnJEBEU/1Yl9Lj5k2VcSYFddk6pc2+h74MxnHo2ikb7Ngky
         58AaqbtjOLgKv2RbzwZkhsdNqbcUdP38lWIEVtzNgbaVlO6vQJ07Xk31FmVgT2ym8okz
         PGcIIUQivqH2oIr9pegq8iSivcdQ0ES2a3LMs3zi4PJAQHaeNV0abatakyOwwTaltiY2
         CxwgeLRpsBnsMR7JJu+wQ8Q2R0LblFscdSJ+em2uf2uGdcpkBJR1+xgAYXDpOZmTl2xq
         5cWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257433; x=1794862233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GA8L4hGmAO2Ltbd4LpUw+HGTw9ExVwC9vVc3s9jVzIY=;
        b=PhR/rxbwuqIv4aL1EZUB9FlpmMugVdKZlyTQGzGYzWfJghrjSQaV3jiseKNke5HMxJ
         GECIh4MKf/aIb9layqVtYEXa0+WnosYUtlHDDsaC1pNZqIvL6cSn9PufvrS3iRe/6Lug
         YTU1+vXf/U9ovFo6/0vbThvb5uDds2wNu+RZi9FInGUw3JS74XaTum4r0seB6DB3/Nhn
         72yPJ+XFXKNrMpxFjXWCNx8/TSpCWStEV7ipkiG7o36gYNR4aLaoC8od4z9m8UB/7y03
         afaRFeH7ELvzxzd2+euJsJwCC1mAuvfMyBWIFtsahI4gsRaVw4X9T0/2IWRaXsjDUk4F
         78Xg==
X-Forwarded-Encrypted: i=1; AL+hErHmd5LoAxzKnLQ0vgLmIm/EBw0NOy9shPjrQTKF6obgQojPnhWG7QiYWAe4f+iETiL1zxcjzaC5cM+bECs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8P3zGZ6iCL07s5NObs6dQMIee/Hw5wopNzBWYfr63rL4n94gxC
	Hzcylr6/0zepysdRFvuYYoAUZ5QcfZJ8om933BO7i1b1vcJgpI3JbL/Ln+np/jP5J80w96Yk7AR
	kyFRKyGp19R/hK33Q/CNdWwsl+L7by8b+us902IwL
X-Gm-Gg: AYBFou3vPF6RGbfax7QBaZDhZlOw2jG6svZHLEpKqWF9gB2WwH6IORwb4UGtMNgS+J0
	N4Zgi1svfY8ei1txD1hr3naFufJhNScssSpaDha1gWadYxGbB2FJmbWBtgETdyCn9uxxR+mTTt5
	sc8EkYFij0cZs8yQa+CpDbRSTRyDR3Yy9ybp7c8C3WUNU3PS7gGqHrFLcb9VIvrKCf8S0f/diqX
	PT5qyPmcyQbDjqdiMLpwazXNj9hqNAarNhkz6lKISXBqO9pqXhaHjkXKfxpfJpHnQM/PsMh4QHA
	RvGyaX2x1myfuFZIUIvydRucBa8C42TH/fzzlfB0SZCFDM0kk3M8f+ExSlcBjkYF8jZ9JBP/E+7
	yxAoJOXYEtBHeKDrBA1lmhz49DgiVorccAinCv7GVmNGANiKD59clANpPa7BEaw4UmpT15D8r1g
	==
X-Received: by 2002:a05:6402:15d3:b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b75782c6f4mr14194a12.5.1794257432903; Mon, 09 Nov 2026
 12:50:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-9-zide.chen@intel.com>
In-Reply-To: <20261106013927.166209-9-zide.chen@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 9 Nov 2026 12:50:20 -0800
X-Gm-Features: AclHuK9d65x0k_uzknW0QEmJhRZeXsPMSFJ7esl5jri3Kotct2khxELM21sZaLM
Message-ID: <CALMp9eRuhRXuFXmMQuFk3U6x_2DzeBYbjjhsziOjm8-jKdK+5g@mail.gmail.com>
Subject: Re: [PATCH v3 08/18] KVM: x86/pmu: Switch to bitmask-based KVM PMU capabilities
To: Zide Chen <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>, 
	Andi Kleen <ak@linux.intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 5:50=E2=80=AFPM Zide Chen <zide.chen@intel.com> wrot=
e:
>
> From: Dapeng Mi <dapeng1.mi@linux.intel.com>
>
> Intel platforms support non-contiguous fixed counters via CPUID.0AH:ECX
> starting with PerfMon v5, and support non-contiguous GP counters
> through the Architectural PerfMon Extension (CPUID leaf 23H).
>
> struct x86_pmu_capability now exposes {,fixed_}cntr_mask64 bitmaps,
> which may contain sparse bits representing non-contiguous counters.
> Switch KVM's kvm_host_pmu and kvm_pmu_cap consumers over to the new
> bitmask fields, including iterating kvm_host_pmu bitmasks directly in
> VMX and SVM PMU MSR intercept setup.
>
> CPUID.0AH:EAX[15:8] and CPUID.0AH:EDX[4:0] enumerate only contiguous
> counters. Derive these values from kvm_pmu_cap.{,fixed_}cntr_mask64 as
> the number of consecutive counters starting at index 0.
>
> Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
> Co-developed-by: Zide Chen <zide.chen@intel.com>
> Signed-off-by: Zide Chen <zide.chen@intel.com>
> Reviewed-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Reviewed-by: Jim Mattson <jmattson@google.com>
