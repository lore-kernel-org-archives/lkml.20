Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389217;
	b=LcyQyWvw0tSeHBG4sDtpIZgnGcGpIA0BGZvICyszMjsYtEQNBR0PKIqgwndjke4Qej/t
	 SY+UPgeRxIA3yjuBRx42RXRUrGiAjv/+ucNeKU7Ux9tNRO00KseIncYLhvdDiOTxZe7M0
	 XVe8VWia6QV1eXj3DZz/I0lSka2sPy20h1NAf4nls49/nB2aKQwiBuRrX8a0QVXEn6fDX
	 SIvW4VP+uSheI4HQs3pH+D4gFZJFiSZ7/54ML+rOWkeGDa+JI7q3T7ikny7cLdjkMYKMh
	 Gcj7xnOFQKGMw7jM7FZx9mafABYis4TsPPbT9UmFq7ObdSFBStOdF4idS0WYbpfuK1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mZq8WFoa246JvnCQ2u+aMsPmQvHpMlw46ts3B51T73I=;
	b=MNz/uqR6i2+FBakv1KmBTgOSuwf5km1RoFruMM+1Vr/jItXcK2xiVnn3bK3GTrwgmXwK
	 Kt+tpZs2s22opr1Et8pDwikACywCMrwbnW/you1oDAZmpA8WCnWX8Xs8awrCvOLGZ8Jzw
	 M0dV2CLrJcy5yMGPdX0qoxeXqBpDd/VHjqE4oQB0wX89XI3k6cSjzvYMxmM9bQvWpNYbB
	 O6ee4+uZalITwsbjLY/XGxpcEwUvbpiEf+/MNKkCwgPNXQNM4/c11hJtZ10jvV/8g7Pj2
	 uLFOFEAzsflRYRF/h0hB1/Mvp6Z6G8HSK0mglO1NCr7Z3soiEFiSvKWSxXk1YP4hOeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bg4mwkOS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C006606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C006606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bg4mwkOS
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3ada81853so2664782c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794389216; cv=none;
        d=google.com; s=arc-20260327;
        b=N/qve5V53RhVjDPemWNYzpchSvC8GEcLL3GCMoahOgOUAhGZuAtutNwhe4/4gO5/AS
         bBzNhwod23o5+g5epGN/wHNwDI3FF/Bpb8k+1bYwKRqomH9MwsNpt9Albxg725vGCSMy
         ZCZlOGOth0TExzyK0WdnJMah3pB2hKP5pPWCAgxL6LDWQgNqwqMGq/JT8coZrx8u0bnE
         Om67Zj6eflGnQo3FmvThZwrvTZ/O5mj/ZLTsE6I5iFqnM/wcjyG9YQUXy2o8lDyV2Ukv
         OzdYPL98Jjq3OIHLX6gHEf0HfvhXqj3RavoGzLBnQbfomQ2EiBoYty+hbybiWDN8YLuq
         JLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mZq8WFoa246JvnCQ2u+aMsPmQvHpMlw46ts3B51T73I=;
        fh=f058AzrvITUmvIYU6f+lUtnfYdRzk5+z1zOGSphCu6g=;
        b=PsbvAykIrgIn/ouINKzglzL0fZPFjeHeC5zJ8wMekx6rHff0Me7HPk/ZmDz3eVz5+w
         tW80b7CcYgUTSh92ZRHBrNpHKxssXKh7SFSgoXSFzdT1/UOZisLZVJG2yd+KBCfbXR5h
         tXE7SQzcE3C2ldxQxPBIfkzaXCHkY9+VPTbtdFQwYYXqtxscTVmOQU4SxQRlX4opXyRK
         I1FaqijSGH/mDdS0ro8f/X+b+wmD2MA1hzl9TOEEOkSCr4B1V564dZe0hokb8CF9S8D5
         ntnGejfTsJie9LmBzsksLMaPeIKuJYCNEVlGbJtizEz8mdJCsLdRTI/vlbde8yRp/OrT
         +a2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794389216; x=1794994016; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZq8WFoa246JvnCQ2u+aMsPmQvHpMlw46ts3B51T73I=;
        b=bg4mwkOS402KVQeXbkYkmUTxLYtasFaP3VjgrNuuM74KqPhgQB+gQcdwjnAfXTeKVx
         qno1GWKxAIn7MOcWlZTg1z9/oU7ql2SU+x4nFmgerLdRzKQZITfv1fcaERYA7XDvUKs9
         /xc4U6SRobTsn341WV5IwE8HTbs8VIZ1jH0/RxfUYcSllo+BbiKqmcdLc4PKMyhujcGd
         JZEWCFgC7sEivyRgeUVlaLtTVCXwqzM07Z7XPsvcs/DMTh6tMshVjTsUDVuh8AuL0K3U
         0kaRbezv6jjnKKRUMUXNLVqsfZctFbanl4y+PccN3BA36pojQQUqQgBRT22kzxHP0nM5
         JXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389216; x=1794994016;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mZq8WFoa246JvnCQ2u+aMsPmQvHpMlw46ts3B51T73I=;
        b=Ei7X5sje6CMCI19gbvfK00y6hR/UNolH9YOI751t3ru2j7R1h/ZGFR6cKZv3ZNeAAX
         FbLgw8VpsvdFf8ZY1UX6rRBv7NetYmQM/3Qiha9/k8cm4jv4gHjaDeV39VEZrDnaBWry
         h5o67KhDHp/hWzT81d8YcEmvgEThR7vOjX2uR52favec0fyEbf+wltEKJcyWZDlbGUpd
         RSR0y8K7Ide2a60elEZfps/S/mhIm/vJizggUATJFyJAs+LQKcZN1OKnJN/5PaOBsz4q
         nW8wGYJHxMr9EoH7ET7bSk6ffXoZU8PIFy0lwo2k5NOeOmxnXulEvsBBuxkrilJdf4aN
         dTJw==
X-Forwarded-Encrypted: i=1; AL+hErHmX/YWL4TO7ZIzytOQvD5Mbeq7VIS7vvEsG3XO/Nt0fIwqE83UxeNPTrOwFNUgFkjFXTqqxsBxDVbVEXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pzD1AkhW1RMNuJeb4ROJ7lmkUlxG6uvIC/4YQMwDHm4EV26GV
	zT5CTZ5v1RiqI9oxpdubFf3Vr6D2KzN+m6Zet4ZCqGaSv4kHoQOKEmr90CVIU/L6RHGEL1zLOnP
	3bvCPXL9z/ERgaV3ZD9KCBncPf7OVpIwmLij8MqF3HYhyXYcpF+hnRP+E
X-Gm-Gg: AYBFou1vmWFLhObVwD9CpoFXH8d8xGbQrEMX23rGz3FNIwiuclD0pOjhwW9ZeAarCbw
	aAujha80bUZQFaFtbJ1P7WuC2eUhgIP32slzwdFhqO+R1Dt3vGPqOJgAlywzoD20/K15N3To4D5
	nLEMO3rUKcgDsi0SQYBo6u3N5OsU4NAaeENyL2a8eIIIS6xTrw+hjoJAtfe0F+kCLK4azNrf1UI
	CSJBRfIbunZIR7vuiQQQGS8RHAlVj82m8iN40xQt7FLsrabQlBw19OU377r3EiUvOCqme+E20XH
	dyvWSjuvMU2jZugFLU3Wl7Hv/RLVKdnDVwVTopVMpfTeMHkZSZG3dAJjIDYM7e1l1TaLF9iwuJE
	CMfyh0IwDZypMI6pMk4JcwNShm51ymGevzWkPcjcJJX/QEZZP7nHSvE7o9bjhwWcDsPmi
X-Received: by 2002:a05:701b:2802:b0:18d:5988:8d3 with SMTP id
 a92af1059eb24-1b3c023c74amr1881207c88.3.1794389215778; Wed, 11 Nov 2026
 01:26:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794250850.git.bvanassche@acm.org> <7074ec433986fee7e604a2c414452a3947f496d7.1794250850.git.bvanassche@acm.org>
In-Reply-To: <7074ec433986fee7e604a2c414452a3947f496d7.1794250850.git.bvanassche@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 11 Nov 2026 10:26:18 +0100
X-Gm-Features: AclHuK9wEnz-uuzpbZIyveDoSh-2Oa5p8ghrvwMwxmJi1Dk_4ulizOg1hr-3ZBc
Message-ID: <CANpmjNNDt3sAnzUE2p6cEbs4oKD8LZyt-2FwVnLnpTDec35GQw@mail.gmail.com>
Subject: Re: [PATCH v2 02/14] cleanup: Disable context analysis for __free() helpers
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Nathan Chancellor <nathan@kernel.org>, Dmitry Ilvokhin <d@ilvokhin.com>, 
	Christian Brauner <brauner@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 20:14, Bart Van Assche <bvanassche@acm.org> wrote:
>
> The __free_##_name() helper functions defined by DEFINE_FREE() call the
> free expression that has been passed to DEFINE_FREE(). If that
> expression releases a lock, e.g. because it is a call to an unlock
> function, the Clang thread-safety analyzer complains because it cannot
> know that the variable that is passed to the helper function holds a
> lock. Hence, disable context analysis for the __free() helper
> functions.
>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

An example where this fails?

I think this is ok; but knowing the cases where this is needed will
tell me if we need to make this work properly or just disabling
analysis here is ok.

> ---
>  include/linux/cleanup.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
> index 1fb8058b897d..f6afe80781a4 100644
> --- a/include/linux/cleanup.h
> +++ b/include/linux/cleanup.h
> @@ -207,8 +207,10 @@
>   * Without the NULL test it turns into a mess and the compiler can't help us.
>   */
>
> -#define DEFINE_FREE(_name, _type, _free) \
> -       static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
> +#define DEFINE_FREE(_name, _type, _free)                               \
> +       static __always_inline void __free_##_name(void *p)             \
> +               __context_unsafe(/* _free may release a lock */)                \
> +       { _type _T = *(_type *)p; _free; }
>
>  #define __free(_name)  __cleanup(__free_##_name)
>
