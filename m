Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793130756;
	b=RJHaLaRyvDi4n01MjnGGHavvspNacZ7hL5YX+3zHKDqPW0kVxnRg6AeUBD+F8ZD3W9jN
	 8GjaLMH31A+AVqqK0WNVidARRH+p0i6EIyF3F0m1OQApoFZpHVrkkano3lrTiKE0KMaSp
	 1oBt+furCoKhMIjjN/BdZRQG016cIrEQy2jQVUAQcLNo3zWsahozqsDMMfWDqJ2lk1LQn
	 d7BNEc4Nvtxwf/dFUk1Si+TAhC77GQ0ofFv//dS9g7cP6MIocd+ci2dY9aePQQqSCN5B9
	 dA6xmV2oSchdHjkxrYuoqsDc5DpqyQF3mIzvya1CTqazjwjCf4/0VI2mfehoTD16ELw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793130756;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=Fj/41kyXVmvwyfVHkwSaPVRS80w5kPMmhzaFEoYT/ZQ=;
	b=XYXYog7HhF4Vha8xXJJdas5Wd3F8hxvChsvQWVC8/kqR69n+Q3rJjyk9EqFmzVQXcORU
	 S95CDgYbpe3S5+ErJ3liT9NdiJ9cSodoSa5JOzzPKQAKSWWyYwGGqTMkuPxIQGGF7GqHj
	 Qbp3n9B6CQ3DLQ0kytvUn2gFrYkyfjKX7k1ajODaHi7dOpamvPxRWBH2dGP17kZkKoLgI
	 kwmELriOtet1+dKd3wjPH9gc8k1aMlp5QMpHKmrcrYe41fZkA6CyMljx+IiLKhDDZyhPD
	 qLCjlZfDnKYoeANGMXZksYnmQZVY6+P0IefUpbfDikEfEamsxSbTDzodQq0OKrEkp5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETmjCydf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JSAEve40;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7D6606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C7D6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ETmjCydf;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JSAEve40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793130755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fj/41kyXVmvwyfVHkwSaPVRS80w5kPMmhzaFEoYT/ZQ=;
	b=ETmjCydfvdyy4pExGJNgjkBvNuhyLJZOVH8E5bZYJBaJW1y3Yax9kXwIeqFo+EyUQATyVP
	Ib+iasVEfsZ08YYADq1xbiZVI5c57jDYwjFB60N+9GlgLIODqgW3SyjIBJD7WlujTomRhj
	u1a+F3HRlqnN2g9+h7ohpwxPxNHi4Iw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-oSwmd0clN3egaH4mQN-jaQ-1; Tue, 27 Oct 2026 15:52:33 -0400
X-MC-Unique: oSwmd0clN3egaH4mQN-jaQ-1
X-Mimecast-MFC-AGG-ID: oSwmd0clN3egaH4mQN-jaQ_1793130752
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a35db2d6b3so1383365e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793130752; cv=none;
        d=google.com; s=arc-20260327;
        b=spjHGprakHj55Dh3HWDK53rcXP31i1LIlBq4CkFen5b/DFG6GdxK2D9ea2YlVMp/zH
         iNkhLvEpGJhcu6EiseN97xFIwSg/tf4kS3pa2YWn60s4sa8mVdfGlf6rRkaBE5CqqpMK
         q7qlQkB9CiiYWnjQ0rcmGcHQTVUKZ6XBqFDyrJyPUinQNVymWDucKxVrvqrCKSsKmkAV
         nJOlPyary2WSut7n6b2zEpyFLlRBndT3qgHfxMrWSKmypVadD4psuv4Kcl5vnQERvzrR
         gWJD9ZM5STHTrzt5wcoOcPYjAj9QRu6Wma0IKIztQ3jXRGDVSQfHCDhcN7OeXZHwUgjF
         xuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fj/41kyXVmvwyfVHkwSaPVRS80w5kPMmhzaFEoYT/ZQ=;
        fh=SHgn8Tmzfkw3NcSpFx2BmurDq/1pqRYcCyFXhVQaQJk=;
        b=oArOlAiqdbyjpaFlKSAvG4atcW1TQRkhePcdym57KqYdsbzaC7r7P5YhPdgpnVNHb1
         nkvcq8mt81cHlmwo0Inv7h3mqM5+a9e/b3f1ubLcQKD4TJLVsZA16L/hPDL4mS5uI7CO
         jHvaajR6mUMBL266zXRuGpEcRq7Tdvjy2r8QT2QAM0Ed51qTnaUFL/B1+DFSrSuFcAnI
         RRnFPtQL5K9Wd6dJGcoyzQ5QSLJmqn2QZXu5JUdmO2hZnV53jgssc+T+Us+biLSUpN7/
         pCYX144IZrA/6yBcCssMTHPSM8LqVSkDw+quhZe0Q/mFSRE5HcPnHPQbKNQ8MZ8RtofK
         LlRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793130752; x=1793735552; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fj/41kyXVmvwyfVHkwSaPVRS80w5kPMmhzaFEoYT/ZQ=;
        b=JSAEve40tNCp1OgkTx0p1aGYMZkVty/Vg64c2AEuuH3IJ9A/9QT8zqfNTU3f21iXzZ
         ID510KAP3nk+La3t/D4e6X1LsLIyvHxlmvdoTAmExm1vSrmO1yHt+s4JF7RASdFul0LV
         cgjbZUJq3Ag5h9l8ZDo8f4GUA/McJ6FWVkXFA6Ehdvot5V7fCEdrqV1FhPcsNPVs3TST
         hgtAguQOdUVYw9wWj+UDsRYZbTW2HafsfkuyQJX8QATmLoQtU1jol6DYKfpjlyGV258w
         D5cblVPYMx/lcqsafE3jZQuODADCUijq4PFi3fRXgAg8bcGkqxk5IEs8gvuAFKbZAwEn
         8T8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793130752; x=1793735552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fj/41kyXVmvwyfVHkwSaPVRS80w5kPMmhzaFEoYT/ZQ=;
        b=LCajy3gwd5tc/ZJ+nTXkpS95OR88DMZC4OwGt8oGApcO9jvqOfSUg4RpQ0dfM9cadi
         EcbKkVhXV9KTtXpRcVULhSUVcIURbrU81KOcM/4a84VPF5eEYvBDEAwf8dkd+VLocLST
         gU1W1Ll7L4h9Z3RQnIChwvisokHIz3NcvMaQ3qsVY7P5lpVXfGX2mw423W9Hx6AoXL0O
         Nvs0ZDLlKfjFxcGQcmsIFlNKB3GBZz9kJxNMAdhVfA5AUXlO0EjbeaqTtBb/U/Eb+qoo
         8KNLtSVtcEwyMJBqt6dMY36zfwA+zfEEt2y+CzDbRHfZL0deX/7xTI12jBdozpw5sQDD
         sv3w==
X-Gm-Message-State: AFq9FYL+CqX9B9gAXyRkguUZ3z8rx6U8QisrIFimXP1lYn9/azb13aFf
	JDcg0u9LNijLuG/5iE8Hz9NA/tJD+4TtxuRO4ZbiGFsa9SeltZ2v4vGPaLqLa9qT/NZa3ZPy08U
	ZX+s2G4QAQg/AooRNeCSTVc1TDsHNteWP7ly8AOVHFOIisB3EgcD2I2jpfYwFA5gTbz456qeC/I
	f8i6H3COa8+3nQrmfeuNKhelcgU2n3pwzhtFDUwmHm
X-Gm-Gg: AYBFou3PZZvbZtAwjV1ZYLa7+4G9vh1B6m4fJmViqUaCq5f8EuV79keCJFTimCzXAni
	rkGMLZNUZRWMFqpFY7zS9X77ULsrVbpDRZrjLNEBcNcoBuyCwwhC0usZdZtGi9H8NPEkJFW6Fns
	Wp+lgYX9mfAMWHTruB4q/y6fAt44b2ftaTqqsSjyuV8t9pzdBW2/34yBg4VBI8Thl2vTDCq9of0
	vjgqQMtls1OEYQnpA==
X-Received: by 2002:a05:600c:c16b:b0:4a7:b304:253e with SMTP id 5b1f17b1804b1-4a7b30425cbmr77123915e9.22.1793130752216;
        Tue, 27 Oct 2026 12:52:32 -0700 (PDT)
X-Received: by 2002:a05:600c:c16b:b0:4a7:b304:253e with SMTP id
 5b1f17b1804b1-4a7b30425cbmr77123575e9.22.1793130751844; Tue, 27 Oct 2026
 12:52:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260930063919.608911-1-himanshu.chauhan@oss.qualcomm.com> <20260930063919.608911-8-himanshu.chauhan@oss.qualcomm.com>
In-Reply-To: <20260930063919.608911-8-himanshu.chauhan@oss.qualcomm.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Tue, 27 Oct 2026 15:52:20 -0400
X-Gm-Features: AclHuK8-hXL_DfAWcv7wadq_C65si-Ml2WAgbzPdgrocvKidGZ5VkAc-qEqFxfA
Message-ID: <CADRr4bctCf-7xBER1G2vqtQm2Nda+h222UzYShMQXw+rtBwPzA@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] perf tests: add noinline to __test_function
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	alex@ghiti.fr, aou@eecs.berkeley.edu, palmer@dabbelt.com, pjw@kernel.org, 
	qingfang.deng@linux.dev, shuah@kernel.org, thecharlesjenkins@gmail.com, 
	cp0613@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:40=E2=80=AFAM Himanshu Chauhan
<himanshu.chauhan@oss.qualcomm.com> wrote:
>
> In the breakpoint signal handler test, a breakpoint is set on
> __test_function. Compiler may optimize and inline __test_function.
> This causes failure in the test.
>
> Add noinline to __test_function so that it is not inlined.
>
> Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Reviewed-by: Jesse Taube <jtaubepe@redhat.com>

I would resend this to the perf list and not in a patch set as it is a
separate fix.

There is also another fix to data_breakpoint.c=E2=80=8E that i have been
meaning to send here:
https://github.com/Mr-Bossman/linux/commit/db4faa52a66f6b7265cd397a2d44d7d3=
8c3fdfb7

Thanks,
Jesse Taube
> ---
>  tools/perf/tests/bp_signal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
> index f580ba7486b1..cc4a27224884 100644
> --- a/tools/perf/tests/bp_signal.c
> +++ b/tools/perf/tests/bp_signal.c
> @@ -54,7 +54,7 @@ asm (
>         "ret\n"
>         ".popsection\n");
>  #else
> -static void __test_function(volatile long *ptr)
> +static noinline void __test_function(volatile long *ptr)
>  {
>         *ptr =3D 0x1234;
>  }
> --
> 2.43.0
>

