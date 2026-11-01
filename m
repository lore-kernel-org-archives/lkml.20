Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793494749;
	b=PgBrmJN6/hc9f+FCtVrATPnp8OnX5s7sr1guuEHy+unpWYbwyMoTBkHL8Xw75JEtS/Dy
	 lkN3G1YoLo6v1yXXtCXjOnlPhMQmTO70vSR2M6yjqaK1DmWzXlV+TeAx1unlDUojJvyMk
	 LUyITmGtDPoiBryQ5JkQQpKh7FawaMURSloEt8jwavp9HR9vhzj9TAQIeKV+RVtvzmcjO
	 VW38rIOiKewlTvxQnwoqlmd33Zl3dIC8Ty0yykyXCIFOgKb3oi4lQZS093iQk1zeu0rTT
	 VZYcJyKItj0Xv8ze6YvfvdR/QT1udGlBWX4jAp6pjJKja/h2erVanvP0cJmy3wiru2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793494749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PRYSgurAOIt4+aBdsRsGfnET3k61sZs24m9Ee/nOO+g=;
	b=HKNsDLPOySOo/BvpXcok2sK3V3BmAN+9u0Say7F7PY4gJvMjdpN0+rRaLsc6QwvtNgKi
	 uJ/1CXkE5pRD/OSTdakXTSMDMt+qUBiWUzOGHRvFxDdZ6aTLJArPdK7l+nxgitjmBpxBU
	 73xu7fHhLtJO1jWAa0ang2Hsi0Az1kqWj1Yx3sqPQGS8MvpXaxHXIOl3WqkrUJaOj7EfF
	 XQvuBFfKK1AKCkR0P6ix5wdSc8vKaCEQbfQRmrsA8ObM5OZNdzeOitO5Kp0yYtQJJmG5Y
	 bEJNMI9IQ8i3BNGp3M+syhFntGjIktFcIC/+HqrHk19tXK+TEmZMR4Q+Dc1ZpqaxbDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3ukN4yK;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DB7606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 00:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T3ukN4yK
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so840023a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 17:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793494743; x=1794099543; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRYSgurAOIt4+aBdsRsGfnET3k61sZs24m9Ee/nOO+g=;
        b=T3ukN4yKFkPtgMsFX5x1SEOOKz8GBupCamU8i49SWxdqc3wJiL3c5ySJZxdXRgKQzF
         Wrpl1NNK50XzEYomT/rGTZcURo+d4zhfepIKbfpct2Z3RUIIxxVf//kRTcHezlh/hC5W
         l4TlCcsf9+Nv8k7V3YJDVjDNnIepGxJuF5RX8xDEVcw3JMzdHC9UtHN9FzUmZsu/NLxi
         riut+UyVD0lcxeYv3q4wWvH6SP12XEXG3o5fiNVF6O74lyHedkdGEPVsPRNdYWWOiaKb
         W3/pFP1tdEGyjIIj2RxijaCTeu1hUVkYukPABn23eCxO3bJLOh2FESkL0/z5PHrzMzKq
         Prcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793494743; x=1794099543;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRYSgurAOIt4+aBdsRsGfnET3k61sZs24m9Ee/nOO+g=;
        b=L/l1p9IVFmzGPLt11Ho97WEdgCb5uY1fo9YlMJjGi/JUh7oKy53afmZU8TCbcdoADJ
         24Yv3EDOsLmv/eJzuwAqnfmgfhQJlee/0WOVe3kblvQeHGwXq/82cxoTD5ADr4DhpsCt
         2CJIb3yGVvS82HHkNquzb6WwEEMnisfr8DmYocCSN0CL9r5k7gh+p8O+xZCLddcwWMl5
         Pq8Nh6HuiAR2Z5eccO7RD7OHwY13SAyE+oQrQwAu3GLehKvmE6QxFvIKvF9D7bLuqp1U
         jQ8YeN2T3Px8lrtKX9ZjZRzmFqNOl8Bmk52T7ZsAy7/6nbjhoAwETo6eT0srXUDM9LFz
         I+9g==
X-Gm-Message-State: APuU4Z9ZZFhGx0QdNBxEVCqsepRqZbP8XmxkGNNLnDaEVvTt90Bt2vvh
	/rWx0eIwMKR3jhrHxEYQ222uard5/WVJNOMeQ2NHFbWFLWbetvnR5jn4
X-Gm-Gg: AYBFou0b9HB2BOJA+M/WopytkOnN809EyA0XbjlI2FxMZ+D5StjtrfRCgnRv4FTPpGM
	GOkCFfTQtykWkmw11JTA392uuoZM6Y1NyerI1KY1+69sj83imdsAZzeLSve9J+91hhbYONkIH7i
	Alfz8ExPyGBLelSLWIZ9Fm4zhmDPJI+9B/RV0lwEB59SxvEYaTKNzBf/eq91j2/UVC1zmyp4WYp
	ZaZTF0LFlbaUFzVLfYaeoR+AKCtemIY1aMEgfylME9OWXyAfUX0Iar/3rOZYCz6hPsmKQFzLGtK
	XtJoHIZ7lVoiW6hL5Geu1EwNP20Rb+sN52ksm9yRDoUbEEzF7hxlOwweG6uVVVAGn31sr103e/2
	Cdv48gi2+IL70yb/KVat5SQoavj0WkSkSEdhH8dj7PQP0ayenjNrtYB4KyzfXX0ELRLlwGXa2P3
	PhRTtyI7heyqCIkfPW/xypqIY5Phrx8IytIGo2+IF9ZCuZRJsR6S55wkXBM9T9Uh++mOI9PHXwf
	IhubgJqYb0/C/QN0ko8X8AC0KltNnIMEKFGlh6PoRGTslmLbKiAXJHZaX3mc2qN0xI1XqK5YqWZ
	Wa6A7Zi0nuC71/2QCb71cCIerpj/+of6ajtmRJTQMsHboRCp4Ew8AcLmL+k+r4/ZBJ2Bg45sik/
	O7+nWLeAphX4BxWCwJxl6MxDq5xNbOfnjOQ==
X-Received: by 2002:a17:90b:3909:b0:3ac:a203:e095 with SMTP id 98e67ed59e1d1-3ae89536c23mr5122823a91.7.1793494742778;
        Sat, 31 Oct 2026 17:59:02 -0700 (PDT)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm5145835a91.4.2026.10.31.17.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 17:59:02 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Nov 2026 00:59:01 +0000
Message-Id: <DMJGTQ2WDH27.A1UOC3ON9WJM@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <memxor@gmail.com>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: don't count skipped reg_bounds
 cases as skipped tests
In-Reply-To: <20261028211921.1055711-1-vineet.gupta@linux.dev>
References: <20261028211921.1055711-1-vineet.gupta@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, Oct 28, 2026 at 02:19 PM Vineet Gupta <vineet.gupta@linux.dev> wrote:
> @@ -1581,7 +1582,7 @@ static int verify_case_op(enum num_t init_t, enum num_t cond_t,
>  	    !assert_reg_state_eq(&tr2, &te2, "true_reg2")) {
>  		if (reg_state_needs_two_arcs(&fe1) || reg_state_needs_two_arcs(&fe2) ||
>  		    reg_state_needs_two_arcs(&te1) || reg_state_needs_two_arcs(&te2)) {
> -			test__skip();
> +			*skipped = true;
>  			return 0;
>  		}

Applied. Thanks.

Eduard,
unrelated to this patch, needs_two_arcs() returns true for an unknown
register:

  needs_two_arcs(U32, [0; U32_MAX], S32, [S32_MIN; S32_MAX])
    lo = 0x80000000, hi = 0x7fffffff
    lo > hi && 0 <= hi && U32_MAX >= lo

That's the full circle. It is one arc.
A random 64-bit range has unknown low 32 bits.
So reg_bounds_rand_*_u64_u64 and the like ignore every MISMATCH, it seems.

Should it return false when r1 or r2 is the full range?
