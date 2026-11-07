Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794087143;
	b=3L6J2HJUjI3/rYIt3eAdn4PN2HgGNLaJX8J1RXBIgDXVOIUDlJA81scsLXrm6UCqJLQe
	 Ab2GZKCkiVifFB4Z2VTxT5MaqLgU3ZOIuPounAdH1Rbsh+zH66aLuDDv+rlmdCyyJwLXU
	 0K/es4ZFUxFG/nfvLoSqbVWxc+VxW/ORVu54r7FUeW+7gGTPb2I/3JVB9uFRyHki168Ll
	 3CxHNipopy3gyYyAvGI0F26OXCphe4xGD3D7S522VSKja5GTqUn/3qxDtGjv/hilh/ky3
	 Dd6LvaeZfHgzZpsvyVOqF7SoLRncZnkVHe+qA1hQTkOxLelpwnH+M7OaAR8uKhM7wHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794087143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fAClDdVa5D4N7PoudPRt5yaNj6K+a1j7ORktYRxzeHM=;
	b=Mx7eYQqTpXWpTM3mPtwCsX6QXTAhGT2+dbE8VyK/TR1NbjnnGR7Mr4z/efAwpVY6GQIO
	 LJrzhJMsQNxVHgFjoyYnKMSJlEA82wq8mUiB2ik7A6WD9bhs7SJxBP3VXg6TRzh+Y9Nrj
	 YcGchudXHCzqNPypftZGwfonN2lIMA3+EY5wXX+84+A4slsgO5TLdrHXkakoVb8S9DNtG
	 ipxbIhIxdui32op1UsxlBbP5vEBA5c6T3r523/ArCKqn47pZqNguz0zThst1f9sy2NLco
	 mVwcHH6ylqkeqRZeS8KD3c5cm8lYyD6bGYBoGZT1P+06cWDKiBGL+em/Tchhlu88Pnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=FE4M6Z2d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5D1606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F5D1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=FE4M6Z2d
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0b133f64fso7757a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 13:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794087142; cv=none;
        d=google.com; s=arc-20260327;
        b=Rk4bZmP2wRO6a4OleO8LHsMmGBmqBqQBmspUMngnBfgcFHZSuYr9du61Tz2UePCIY2
         AJphkr8sU9uKl9IRAyQKoJBJz1q//c3yIWnBoQ0HTPmrGyILbjlgTafiuO22Qh0Dub4x
         Jz4YwxAHHKuqT7pG59d4Lozx2Q4rSXpDDelkR2A2szOAD8AZXs8dJdqC4ZQIDG6NX9nq
         Trhxl/TdhpSZOAulLGIc/igX2fuIEl/gsBJgDeiTv8vSxDKTfDxopTMEmuc2NyNS16OD
         ijbUsJLi4sVYz8pVPC7F88eyqezflOAihb5NqTKs4Nj5Ns5rimok6t4Ng4VvGzfawBsp
         OvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fAClDdVa5D4N7PoudPRt5yaNj6K+a1j7ORktYRxzeHM=;
        fh=yXNIhGfufMXQrpixF7txL8E7agpBaXW3HS7VDHbdC50=;
        b=D+ssXrCSkNjwBjs6vR/PzAZeHmX43ZiyIp24rEmv/Y64AADeDGuR3lhwNqYwCBgfHK
         xPCc3YZlubnKPXdkQnm2IP12BtHKlhxaahO/JeSlk6V6iBmAOweyRJG4hQ6q5dctkbuf
         ARK4c9Ce6su2xR4r28UbkujqlF9Jfc/iDll2q6OMT0jwOPOGIyLcQ50dToomc7NF3hXP
         TYcRmDDQMU/pvQaVkcDJJi302rkh9rXJpsAxGJHp+Oyfpn6B/n3RAQzI3v//BuO2hqr9
         jX/rJaOxSEPV/T9+OE4zxuroRFgeaa0nJBJ62fXOlyW7ZHS+BrALmUbvSfFY6frJor++
         e96w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1794087142; x=1794691942; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAClDdVa5D4N7PoudPRt5yaNj6K+a1j7ORktYRxzeHM=;
        b=FE4M6Z2dKnhEWsud6rEQ6kWuD+HailDfVd/JSa0GXgCdcPn/l2WszEIk9XGPSqeT0q
         GbQ8fn0qxiCAjHSNLQ8UEr47fIuqLuWD9yVjm1xLIt14/XsoVbxZC0+NWjeXjUu9SxyH
         6eQKrG1KNgkAACTm8Bcor7Ml+W5azJissuwxAA/4bqBbsvRDWR8viHkGdrYgmiJ1kzwg
         xl84zqI8urOELJQ9lWk/bskTrvjGrog+67v8Y2Mtp+BRPny0bsTNNQSG7QSZeVkfxRbI
         9oDRmImLfydYBBDo4Ndiptq+f+JzZzTM9nGBU1/WVhium6lA7JGNpiDMmPpzKWwDIurI
         iGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794087142; x=1794691942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fAClDdVa5D4N7PoudPRt5yaNj6K+a1j7ORktYRxzeHM=;
        b=QniU0aIt9XajG4l3AyhQcqUWL+cBF+txr5AQ0ix9VSipTm7CFgMm72g5IPITeAt8vv
         W0QmDQEtajkHpf5LSdnqDzs6my9zvZvt6xqslBpNH9SyZcmjie0CVz4aLK1O8zP2heI+
         2Ewf9YcNo6Lb/LyqAGtAwBf65Da7cz9ZbJYV/znQnSvc/22IBIUC/4b7NexwMEA48ccb
         pyW07ufzS+s3Nf7E8vqJJpRxA6+7iYiBP6lxQVR7pFmlWOQ7LX33YV3C9wQoMkaBVrYb
         xhW0ak1Tc09pCcpKmW8f/E4GK6zcVXtBHUdCl6DIdC4Cw2tOc/pqfY6Q14ATK8Hr64M/
         8Fag==
X-Forwarded-Encrypted: i=1; AL+hErHFbWTG0acRmfOVk3mCOBP/m4DQdnex6oU7umb3kwM3+N2SEgW/q+WTBWmW+7S1Te9U3f4ytbUojjAP9/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L+DmuJ8bCL4U5nj0DZvVyU8uGA8oweZA8M3GgVaVlcKgp+v53
	LA2/gABOUOGlFwLl6U7Lhp4Mf4cgXGe5jEDxNggEFe81rbUs9JYNgaOLFRTfTIFtkAH7HatNqay
	cJjUwS7EAvE8Ei4S4cidtmP9Qj0woMraKg1ZCzd2PHg==
X-Gm-Gg: AYBFou1YHD4NylrzbmQ66vuRLJzKOjGjWODPoV8HcsqFaNpZOdOJZitGULPxBhTgc34
	JPrfQboxcv5uA74+StZ5Yxl/ToT5yjrCWdozrvhjHItD4BTbpjCYTAOvLC0H+6YEzkV74iP19h8
	u6iB8VhWNCtqe9xTOnsJq0TA1+TgKLvVWUVYvH5mzIq+3JHtmlMTq6EBNOAjvE1G6HL233Lo2nE
	BJbhZkhfXclALhEpO50K3aqlLHwbtee5N8HdYoZTEAbcCERhQOO0M64JnkBYLlyX6LpqDBkthqO
	9CRrPm5cNzJjO2HsRqziTqlpPNNSJHToJts0Ap9RlDjeb+dZEUdr7VVJC0979sN18qaUrhU794L
	C0OVm2e6sdIMBz6L4q5jNot7wJipJJ4kXPg==
X-Received: by 2002:a17:90b:388d:b0:3a8:9db2:a59 with SMTP id
 98e67ed59e1d1-3b0db013fbamr10127781a91.0.1794087141883; Sat, 07 Nov 2026
 13:32:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com> <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
 <CAEf4Bza0XDMTxxZeukwRXjvoOOruY49q66xBXnYnuncbeo_Oiw@mail.gmail.com>
In-Reply-To: <CAEf4Bza0XDMTxxZeukwRXjvoOOruY49q66xBXnYnuncbeo_Oiw@mail.gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Sat, 7 Nov 2026 23:32:27 +0200
X-Gm-Features: AclHuK8VaELpN_xVEw5v6aYLhDqxLEvH5z7CzGWzlbUdtSKDEKr2aOOzYpF-uoo
Message-ID: <CAPnbwjpZRmzJFXDa=thc188ZNru2xCBrCsc1WO5mNDzRRQZJBg@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, JP Kobryn <jp.kobryn@linux.dev>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2026 at 2:08 PM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
> hm, funny how AI figured out run_ctx, but didn't figure out that we
> already chain them and we do have that pointer in current->bpf_ctx...

right, good point, v2 would walk the existing current->bpf_ctx chain instead of
adding a new task_struct pointer

> That's all to say that I don't think there is a need to keep
> guarantees. If per-cpu map is used naively today it works ok most of
> the time, but not all of the time.

Alexei was concerned about existing progs relying on it.

> Perhaps we should just get rid of that whole per-program recursion
> protection and just make sure that a) BPF program can protect itself,
> if necessary

If we drop the recursion check and go with a), protection is up to
each bpf program author, so wouldn't a careless one be able to panic the
kernel? A prog as simple as this one triggers itself:

struct {
      __uint(type, BPF_MAP_TYPE_HASH);
      __uint(max_entries, 1);
      __type(key, int);
      __type(value, long);
} m SEC(".maps");

SEC("fentry/htab_map_delete_elem")
int on_delete(__u64 *ctx)
{
      int k = 0;

      if ((void *)ctx[0] == (void *)&m)
              bpf_map_delete_elem(&m, &k);
      return 0;
}

Without the check it would keep going until the stack overflows

Mike
