Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC0348B37E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808165; cv=none; b=lSfuVg0IMJ7IQ/owJuUpQuPFnabWgEMuZ3A0MHmj/D1VkFAIerbmq4fedCn38alyrkEmG8CrnCPTzjZFsGL1JfbFFoiUPVSrqdzZg/pP3+aagdOurhlkYnnaX5xegB5RgcMaLOoJKM0aEJmmFKZdtkRMz7H2FZMiW33D7UMmchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808165; c=relaxed/simple;
	bh=9haL7CpTeGwMT94bE4pL41Xvs4IAq7ybWO36KUNZoBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0p9OB1XBuXj3fdNp5V56t6whe8Sm/LKUUH0tFTyBAFecx2NsntjKuBod0BJaewGXmdDyWyRVyv69ZLsax28pB3RTcaMAr26MZMIP956Mj1CYd8ZrrNuvHHE5Z9LjBbE7rPYj6vO6IsnnXycuNbKYELk38qrTDiNat7/0aMFAwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DEKsOoAy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DEKsOoAy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so17142055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791808162; x=1792412962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JqSJ2G7/usQS8+3P+fzDQ5SbcV6XNXRdWhFnApGvBmk=;
        b=DEKsOoAyuAvf10KgIzOcI0CdrNvd9GE0c445BJ6nzYt8ojq9Lizsv4NOvfo0NyZqbZ
         zxi49sUAsUzfy5TRb0FMtvYC1zwqmIEs82352ki6hY1wZW1xeeLHJwwebKxoGqizvhFM
         xoAcAm9r9rTxCas+2uF1N5e7qfE/PX+HJNDywV8rDXaxrpjxNOJNk03Qzunq21BZYFpQ
         17xZMGPg8CIt3VV8mA7NRuhEvM2lDGUG2uwl7cZFSwZ7Gzt6OKabFqDc3wNXdhK9XIsw
         owhAcd+ipO1pQhkv79Vd3+HvScAub5cXmkEYU9/Y6An0RbS1U3WA6P/O7RJs7sllZadn
         rUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808162; x=1792412962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JqSJ2G7/usQS8+3P+fzDQ5SbcV6XNXRdWhFnApGvBmk=;
        b=bDoIwA1XRzpOsHtcoQv0FtoWb9Qh7G4jvCH2i0I0M/nsdYYMPzwh+5/yUU+kbXqe05
         DF6hOEKTph5+ig5r77Wm6qhQe4TZ6PDbRqK0T6/ujsx1JiZ74h8lRO+8I3WN8URO1CS/
         GtwlVDJiGexivNOrLa2eFpmgIHHyzCqeIRWOgaamo8j58ePlVccK5yukRyIuj+FkfAFN
         Iy4BOsiK0MdwQ2fW39Vkfk91Lfl2qLrC7fWN1+WoXfjFAHW9Pts/mwLkurpyvkwpdktS
         NBJWSc+Xgj4hPUnUmAyzuCkT4e/cp8iT/ZjnhMm6otu41rxjufClI7l2dccmgPSYNFFm
         CbUA==
X-Forwarded-Encrypted: i=1; AKwUvBxCxAMLxKQzZPCzUMwLVuLaSVFSs9FgISU55OcIRs2LQ6avGJJhDbuilxlywejcxwD9bRgUMcdK/keodMY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlINXTgZBawT42t9Djk9ANuss2F//EiBTWzEEax3Pn9tTgqouO
	1ZkjvrHWyY4imAll3MHeLJD4lUaUVi/WPJgRN7EplWf1B/nK7Uz7BmKs+0yJPzN2V38=
X-Gm-Gg: AYBFou0D8REpnrRT/AtMEi/QNYvOAqqS8oS53Wu4Zgnbb/ey2ZeyNg/VOV6A8btAWAq
	1JTbVuk1jrLz03ybj/0JxVNbEFhdJeiRfhYsUz++ZiLN7Z86NMdlCyvhWvqyp0GqmbD3a27G8vT
	7nsa2ixsHmhNvz1b1uF2+NTwKK31lvI0na3IKymuav6cyqqW3g+6B8s2PgHEGkDNa0gtRDfAy6O
	dbjlUKDJcruULP3EHy7tsoxiBaLHlk4296DXs8C9HYQgJYZ9Uv0I2zh+iNDCFyDj3iRqKKpauC5
	Nh1fz6PhRTqfsd6mypY8g/hLxj8X7NxHXbXM0Bzal/LsvKq66HrW1vuWfAbDWyiLuL4Z67jFPG8
	2s9ieNxFNyDVn+IOxDS9m+ot/oJQAZ1BdRtDm7HCRh3s81A3LiIg2hCFtvBvIquzIP4lDgF2k+v
	jc+1b3Aj4juzI4mXLINnp7kOSD907yem44c2lFlUpX2qHlB+DhPqGfaFC6Onls81v2Km/+i7VY
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr176504325e9.19.1791808162195;
        Mon, 12 Oct 2026 05:29:22 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm533001275e9.9.2026.10.12.05.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:29:21 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:29:19 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	syzbot+8324b8fd984b86905a66@syzkaller.appspotmail.com
Subject: Re: [PATCH] printk: mark racy data block id accesses in the
 ringbuffer
Message-ID: <aszSn4stj7ydLJNk@pathway.suse.cz>
References: <20261011091755.303723-1-ngocthang2710.1999@gmail.com>
 <87a4oj9r1s.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4oj9r1s.fsf@jogness.linutronix.de>

On Mon 2026-10-12 12:06:47, John Ogness wrote:
> On 2026-10-11, Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com> wrote:
> > data_alloc() stores the descriptor ID into a newly reserved data block
> > while data_make_reusable(), running from data_push_tail() on another CPU,
> > may still be loading the ID from the same area. The code relies on this
> > race being harmless: a stale or garbage ID simply fails the descriptor
> > lookup or the blk_lpos check. But the accesses are plain, so KCSAN
> > reports them, and the compiler is free to tear or refetch the ID.
> >
> > Use READ_ONCE()/WRITE_ONCE() for every access to the block ID that can
> > overlap with the lockless reader. No functional change intended.
> 
> READ_ONCE()/WRITE_ONCE() could cause minor side-effects as it prohibits
> optimizations that do not need to be prohibited. These would not cause a
> problem, but they are unnecessary. The data race is allowed.
> 
> How about using data_race() instead?
> 
> 	id = data_race(blk->id);
> 
> 	data_race(blk->id = id);

I prefer data_race() because it makes it clear that the race is
expected. Using READ_ONCE()/READ_ONCE() would create false expectations
that they are needed to prevent some races.

Best Regards,
Petr
