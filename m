Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508390;
	b=4zF7Yg4+cCTc2lbvUA4cPPyT6f+ZL1YxT4TCbzudbW6YtzpN5vFoh12NAM/hj2CPtan4
	 g+m/pTmvrfAvJbcheJoNhSL+4QyWBRnKqHD8ojmiZSczhy06JdyMfAHFypkOX2dXPCuHr
	 pHLTev4Xdlbyq9ZHdSYM2d6UHwfk3/x2RdzYGcnlaZ0enHsPlZnY0pcfMrKiNvo2Nt3ND
	 FlDKqv//9IEPcSrz/nijSJ1+0oO76q6GWShUIufC7wabO4Y567+Y13FvnTw1C0can906p
	 ZVb/FvNnwe6PSpWBFRPuwwHOLO7octvet1W4IvCeMYVS9E/R7hj3OkEASATjUazCioA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=7XTaMBSJocX7R1q9IiXe5TvK1ts0/2rtoQ55kCQz38Q=;
	b=pCckbRVOODN+pnAsqjvlZVFlwuqHnxuxV/8li6EaaPip5zVlEFIKWGv2zbwaTnibRvxH
	 Ah81yBuVVigGeavRlNprzLnZsy9Q8H+UqwGNvdEJ5C3SCzoqEGdTzH+93/YZUi49JPcEn
	 23Hq7j52LApWZsfinw+8hbzrxIxes00JF0cMNSeQjMi1asBwgdKGqU8ZhpEIV/6DgRMi7
	 3HQb7TGwTzCJlsHlN8/7bhRogUuQRMsoCTCxhjrG7/GFkR14dl32ezEwBa8fI8qp2FT1F
	 0/FSEHyEcxaZR8gH+Lb9L2kcQPIsrJyIV35GQ//0f6TvrKiJA3FNig3yIMv7WyVj5nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+hCYSRp;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208B606A8BA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8208B606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+hCYSRp
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50933bdf4bso31443766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794508389; x=1795113189; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XTaMBSJocX7R1q9IiXe5TvK1ts0/2rtoQ55kCQz38Q=;
        b=L+hCYSRpqtbZvvzfTPM51bNUhMq2BbuykAG5oFAhxSmlmrzcY9wgwVFlr9REQwSZ3x
         wFQ6aD5XkVDSlS/t58e2UDg4YJLULKoeISY6s48Uc8/WoP71bu8tnqwwhKrweZaLpmyV
         dIFkAlIIk/2ibebZ6Clb/IQ1VW9uBuNzs3oRGC3Cy/4rIjM8ybiqZ+dPvrCsX7ObOkTu
         3yV5Ycwm05puJ4S++T/NemezOeH+JiHw7TmJPBFnw7JNh6J4/wpJgrdWY4J5FQsB6Gkq
         ctxI8c7X7ypxK7cTPvieH4Y2A3rpTI2NqPrPISkBK53e2xSFbKFOl1D6Pa39J3FtUw6v
         egfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794508389; x=1795113189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7XTaMBSJocX7R1q9IiXe5TvK1ts0/2rtoQ55kCQz38Q=;
        b=pEPiK50pYuotozYeOU0tQq97DHtoCsw7U58gRu7iOxjzCK9+lgcIKZ82TD/c7aOvoU
         +od72r+dz6d2xFyMzKxYScMsyj48tblFskDlHUpzCaHVL9N6o6rqaJLFRFeQlyMwrqyS
         VPbpMh4GfbLtzpwf+Gfys2R2pVSKD5nbGZ3QZ3FLbhK8+IKIToCBRx0PH5nti5bKSpct
         6r9VrsJWTOGYJIu19Hw5kaYZLaA8Md3Pcj2w6W2a3c7kyQxlJ0r4OitZRLn2hi11F5vV
         wEe4C8dcigtHtVXi09CHiylNULZ/hIQCfUxgbF3K3SlZ+5VW5ROj60I0jtW0yAjX2vPe
         2iug==
X-Forwarded-Encrypted: i=1; AL+hErGfvq7IjvJD7x7TZUrSTq5AT2aEmCy93S27b7WBAoL6DaqQDry9z5txTwhnStef6fPBNh0LknwvUDmG4+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JUC90hBTTK7UVHOyqVITpbjzqJJfByIK2LoP79W2Sp3pMQP/5
	p87gnesjjTxQBuaqF3CFbeXJuSzzBnmNA8oD7QKW4fF7Il7n9akAu5a7
X-Gm-Gg: AYBFou0sO+ILJBaHI60q34q5sJJ4JkswTe0k/Juam+eyUSeCpkuv1pWovv0Kyxmk3rl
	o48fwERVJcG5tgueqK20xRQGzBZ6qYeB380cINEnIaz7Z6xirUYiFZG8WSLBO7QpOvZtboc9mid
	COEL2Kv1akkO01ZnDq7AN4vh1hPI4Zk0LvxjB1BlPWXHLaGmgMVP2YjnPHAWUlJD4TAZIQqoq0A
	2g7LBQafwTKyk99TspssRF4UpoxUy0zWsoLoYD45iCfyMKBsZi2PsNsh4UtjL7uZajVJFYLt8/t
	vInNwpTI4jLY97NFMqNdOXazXfbKk6k9QnAxBWlTr1oM1fW0djMSxrEu5bFhR7rkmyvzkwunudO
	sQBBsJOHdCR3Z32+thSwUtCKfiaXJtuZUzMnSYDp3hmZ3tKBvK1g1CrNRywf29+/Lq8SiNvwWHF
	O29lD8EZ4AHmWsh+r/daLsPzv8VKxHPOP/5pds1zkyE4qJIzY8n2tj2kM5dI4XC+Sep57jX6b7A
	MKxw7UK/NOewKg39/6hilPYM/BlKgTolTXqTPZlU7uhUtyOJLkR+wKo2sUjVQywHiX7351QqGyS
	V/jxj0YdWWjJ27A3EL8BQqb6OdNGlcY9YrcnEQ==
X-Received: by 2002:a17:907:c0f:b0:c2e:2275:1168 with SMTP id a640c23a62f3a-c507c3fd35fmr333753066b.19.1794508388705;
        Thu, 12 Nov 2026 10:33:08 -0800 (PST)
Received: from krava ([173.38.220.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm6139766b.25.2026.11.12.10.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:33:07 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 12 Nov 2026 19:33:03 +0100
To: Peter Zijlstra <peterz@infradead.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Alice Ryhl <aliceryhl@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Alan Maguire <almagui@kernel.org>,
	x86@kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 01/13] static_call: Index code text reservation lookups
Message-ID: <avYGX1UpGlvbvHO5@krava>
References: <20261109194916.1089703-1-jolsa@kernel.org>
 <20261109194916.1089703-2-jolsa@kernel.org>
 <20261112090734.GH2668804@noisy.programming.kicks-ass.net>
 <20261112101108.GE2669272@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261112101108.GE2669272@noisy.programming.kicks-ass.net>

On Thu, Nov 12, 2026 at 11:11:08AM +0100, Peter Zijlstra wrote:
> On Thu, Nov 12, 2026 at 10:07:34AM +0100, Peter Zijlstra wrote:
> > Looking at this in a little more detail; I'm confused. 
> > 
> > You're literally adding an index, so that you can find the
> > static_call_size, while all you really need is static_call_addr().
> 
> /size/site/ obviously :-)
> 
> > That is, you could have just created an array of relocated site->addr
> > and sorted that, that would safe you a ton of indirection all around.
> > 
> > That is:
> > 
> > 	index->entries[i] = (long)static_call_addr(start + i) - (long)&index->entries[i];
> 
> Should be:
> 
>  	index->entries[i] = (long)static_call_addr(start + i) - (long)index->entries;
> 
> They have to all be relative to one location in order for sorting to
> make sense.
> 
> > That will make your lookup take at least half the amount of loads.

hum, but we still need the site’s init flag for static_call_is_init

I could store site pointer directly instead of the index and see how
much faster it is


> > 
> > 
> > Also, you really should support modules, there is no point being fast
> > until you load a module.

I had that, but decided to remove it because my follow up changes
did not support modules as well.. I will include it

jirka
