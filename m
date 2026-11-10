Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339204;
	b=U68aogsUBc+EvJVXbJGglqroci5G9731Vdp0uhUGULLm/HtcpVk6qLYqhvoY0ov/qOpU
	 cs4SFm7aI+GXKQaofFowaytNbG1EpG5JBse/0QWPrN4ktMxoejRRtck2Do0w7LbV0U2jN
	 oCVSL43eB1q/t7oMEFDYyQ7czE5pLyJ+/bxjtp7NR+QuQpB0nLbyh3wkYe/hSyILKg1Ds
	 2dB9PUW1BIGMI4Eenqb8E+rDXZLECTHtoX0v+4u0c0OXeg9kAPe+9Rq+ZLPKualWZG1u/
	 l+sJt9JOW2JBtlBHWOSb4FlT4de+35BQroVOYwDoDs4v9F1b0tKutHbEupagbOMiDqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RLw+a3wROC6AnVJixBMNQH4DIj6G3UJAoFrXsuYY5xc=;
	b=vsBXvLnMKjd5En6+3hT5YiXWvEoW7CWolFQkSGCuJT1IrRZDZfqoSgLOv6F5U3c+14xb
	 hmAHNljfQfcUIuQN+Fiw8Ahqk0naT2/a+J5UPyH+rfVWzKLrW8NW25MpuGlzPUdBSqumi
	 N9BuaabEC1VIMSZRo8mHxffsy975e3c+Bv6EabFLrJXv/LJNbek7ygsqbr72K5qHt0qE4
	 LuNh9v2/UNnmzQyin7G0Z8R4jvSn6ahyaRPzQgl7oXlmX2fZhlLmV+QKskMX48rCdoszm
	 nzj8FA7ujpO7U5t9HFHnBUE53+YKnxcPR1Qe21zdqdgv6rOp+aIDOM1SSntrzzR5fWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClUItzZo;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C12D606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C12D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClUItzZo
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b467581b98so22671745e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339203; x=1794944003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RLw+a3wROC6AnVJixBMNQH4DIj6G3UJAoFrXsuYY5xc=;
        b=ClUItzZoyBiNKpQc+iDKfNrjE/oJM6HtZmNKPhfL9nw6d8DZIPoU0Hy/cKv6JXfQO1
         UZsyHYGiESlSQJzJk7xhkF8tOqU8/acujXsIqFLdBFMhR8p3cJdg1C5wzPbQhbBtV+6n
         9YXPNiJ8utVVppqqUCXhedrlpjTidFFZkwrxMcv/uLXwUw+6JCKB8yPKTUhGqjzjRg4V
         WXCFu4JiMdYmaQ40YupE8OXMR345a82VNjhpVdSXtY/rhvL74vUw/IPAztDwKD2lzFCr
         5iRwqhFKpuyh12mtto4jiNJHFTaNALrZkc40Z4nYOA4WMuHdv0YRtNTfY9wJsJmnevba
         1viQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339203; x=1794944003;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLw+a3wROC6AnVJixBMNQH4DIj6G3UJAoFrXsuYY5xc=;
        b=YlRg1QE8pLiPxaXaylnDpNLc0ru1v0jHgUJC4s9ICfOTkyziXFV9uSnYU/CPsqfZSy
         nf8l3eDMv/OVURPNKnjqX9UwecdiT3lKQYO05/1akPd42OsQ9No3ABxPCe2zGIGChJN6
         G68YI3cl70KabcR+GaC1ZNoKgLBcIzsqGnxsRaBoHjwitjEHyISRetA5tNBhHJBApECq
         vnJYtKk6hhp1OLx8HzhmDWZuNS1unQi+Lbvj+pze0FqzUQVcOm5psJP0IhDw77fMxhn7
         8nLYCsAI/eXlRb/UYduMrVPo++tKWfSpjEmQ3rWNPGURvMCCI1SUMvgZ4F/m8plWVM/Z
         wXoA==
X-Forwarded-Encrypted: i=1; AL+hErF0bCzKI1xyURiIhTXKVH6cs0uEzQ7ObVX6Wv07CIq3oNU3/8T9y7vQtwcu5f6v5EstsOtX+4SjB8939LQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JEs6ULbwl+vfmPmIjXe85eGKZbnVekny1ASmS/DppHgzVapTJ
	3yXALIKIEQckliM9pb+oureKG7G7Zjps1RZ/Z5IQCHhwdA47xogJ8sUo
X-Gm-Gg: AYBFou2bqc477g8ORHMDGGPg5Siwo9esjqERJaWRyyMUEe4qy0jrjoWS3ejzeFINhXJ
	oU2d+KeNB+Bqhz1a6HbUibq0BB/IINMbcOYNxRKCBRUh1O6fVEGT0JUT3RR50LZW9J0My3jG+td
	37yxLLHhyMbL7xaBJDMWwrv2FLek7TCVkxqTRghaTElAxFwnMXx2L0O2kkZ2mxtya1hMwVqMB3w
	ni+hjoR+flHH+RB0xhR3ykc3hxiUdf7X0BCN4NeXpu2GQQG8z7yDOniXlD9letmdKPGIWltMAFF
	xj6OwncO9xLU8Fn03zRlbWfC1yxY+2dgDDpMZHdznY8TEWGdk8Vsi8udETPOzLtBct/ye+Ao/Dm
	/kOOIv2chC5vvL2zp4r4nC6LGRPpF+U7pyKRb3dX2K8vruP4F89VirVDQ9fDI4AEOJ6ljNN9Jva
	XEiIaYS/sMaqHuk872Ma8Zud1F8VM7/O/JFfb767Tb+mgqb8gAVDCyZw/VnllgB1yqIoGfVr6lZ
	urN0aVu2hC0kiRCJ4n9GT7zv5DpGrLOqY5L+lO6IFzA0M2vuv0bC576QUj00igSKdaDfoyC7rIE
	1W++LIEIj4hUjp4Gx0mDtC8cz/EvKezDgUfW4x7oWhsblgdT6CK+GU9UWeeiicMMEQ==
X-Received: by 2002:a05:600c:3ba9:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4ba0939d4cfmr2352395e9.21.1794339202582;
        Tue, 10 Nov 2026 11:33:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5b9sm6471439f8f.9.2026.11.10.11.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:33:19 -0800 (PST)
Date: Tue, 10 Nov 2026 19:33:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Usama Arif <usama.arif@linux.dev>, bp@alien8.de,
 dave.hansen@linux.intel.com, dsterba@suse.com, hpa@zytor.com,
 linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
 tglx@kernel.org, x86@kernel.org, kas@kernel.org, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v2] x86/lib: Use REP MOVSB for large memcpy() on ERMS
 CPUs without FSRM
Message-ID: <20261110193316.7ad9d7bc@pumpkin>
In-Reply-To: <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
References: <20261104222806.1826508-1-usama.arif@linux.dev>
	<CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 09:53:07 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 4 Nov 2026 at 14:28, Usama Arif <usama.arif@linux.dev> wrote:
> >
> > +       ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb .Lhandle_tail), \
> > +                   __stringify(rep movsb; RET), X86_FEATURE_FSRM  
> 
> Let's not do that.
> 
> Putting magic things like RET in alternatives is just a bad bad idea.

You'd definitely want the RET in the code itself, and then overwrite
it with something else.
When I suggested it I did wonder whether the code patching really had
the right functionality.

Someone should try to measure it [1], but I actually suspect that the only
cost in following a 'rep movs' with an unconditional 'jmp' would be
for an I-cache load (or, worse, a TLB miss).
I expect the pipeline front end (which handles the jmp) will do all its
work while the setup for rep movs is happening (even for FSRM).

That would mean you could pair the "cmpq $0x20, %rcx; jb .Lhandle_tail"
with "rep movsb; jmps do_RET; nop".

David

[1] I need to dig out my 'rep movs' performance measuring code and run
it on a few different cpu types.
But I not got anything newer than an i7-7 or a zen[1-4].

> 
>                Linus

