Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514989;
	b=zg+/kIQJ31S1pqUJMFCt8aqrZ3dXDdIGO2bSvtY1FvL1Vcwq9/WIXFMbFzksohw+37NB
	 umhvbifwzZiW7zd5JzbRyEXozkyKTfKqQcnC7sXmZ+ev11bnC4+E6zj99Qy+ubMGMTys8
	 8dqY9PrhaWZHRxfwIx6W2pD8Xh8YIGYUC73uQQ2cKAhhvibn1l3sQCCHR+lkIzanToYkl
	 7YAehbNpyp7pSabUFNxUZWQyUFjZ5Q9O6FqnXxcCwWrJ8gVmqUeAkqa1dSvMR8eOt//ZT
	 gbj+2QGu7rxbD7dSXbiooRGNPA8dDcaD3wvXjkH4OBx0JtDUtxSEET7rKthxZsVBCcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=oDkF+EHNknttvr/pyjYehgB7V21ORBFZrQ57TwACNvA=;
	b=vHWlOl6VYbT8fXg7BKHEIGFjUP9IfDOGaELMObYRF3HSxkxyOs1es9U8EmWqMN8dVGSc
	 F/i34RMBPxNODZPvBIiDWDUXPE2KHO/ra3Xjxnmz5oSt6F6JEIOAEg/2FIRRvF7/xUJ+s
	 P3ZKi8f62iVDEsJF45oej+hXX/RF9ajVz3wgAQ7+LlHHVU1uXHrknfBdBlk5g/I4j+ybC
	 xYB64WxOWrBx45GhcsSDdfTdQiQ5kTsp1dWGsoFfDM3HAnwZfnFc7JvFkjhlCD1T6T50f
	 lDOLahTUgPVr6gpvjR9rhdvn3x8aCpMKAjZvz+weQ6DTgEuIV7Yw7t8a/WA5Z7ZzSsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VxOYMEa7;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8D606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F8D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VxOYMEa7
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eb0a52d605so345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794514989; x=1795119789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oDkF+EHNknttvr/pyjYehgB7V21ORBFZrQ57TwACNvA=;
        b=VxOYMEa7WN5hU3s2AL0gTAK4CGvO8PTwMETyXLtJjhfb1RoqrwwSsIreAjmEhNNqHp
         mpHOwQsZ3SnU+oqT2m2FizVk/fAFNAsBVCXr3c1X4oL51td54ly5w5hv1/mfk6ZUhtlk
         3UHK97m66K71g61Mw8fYqxMI5ekb3IXKdjZwzbXdTI4FgqEocNXlVk2WAy4Rb478ZXX6
         GPqKBs5apfaDV5AyW+X5GEn9eztVMp1jdyrz8OZyYqiuSFB0b/Ti4RuhZsaKqg1LbR+H
         Gvt1Crpc5zalvK0/B6N8w5Jkr6CMkjWRuqtMxUyy571iVEhEEUkJ8u02iAzP21OyGiYm
         91dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794514989; x=1795119789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDkF+EHNknttvr/pyjYehgB7V21ORBFZrQ57TwACNvA=;
        b=ieNSWv+wBEe1+40hkwEAloeAO93Qn7BLwpgUkcuWHFfwrj8H8+KAPPo8BjhTbI5DIh
         25WokoIHlvz9YL6jsqC/u0CPvUzkmb2aU/ABxXC1m4VA6BsWCY4PVnQ556VKpKr9m4AK
         j5T6+jbqPoO/KmTQpveN74uVVDrhj+OcKljBieDkxcCNtXoRsVJgECpDsabsIBf0dGPY
         WjkFUAMt9jT5aLyc9xgPBJ2yJUuG7GURi4zYpobnZtlesqSWxTZ682PK0PWV5kmzfj/p
         a2P1ejfPIvvF0GsLYg9GVru71wEQvgTk2QDkzl7w0WKJmi0hiO806lPONm4SlZ2cTWdj
         JO/w==
X-Forwarded-Encrypted: i=1; AL+hErForqMErNcAr8CDmv2g2HVZUUXTJVIhFUbElEfuKYHxcHhAOAfLvz91VWYD62rNSuIfRmr4ZBT97+umJsQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wVe6Kx4vZ42d5lPYGkU/fGBVrg0Ly0kXmlxcUR4PnosJJRnJc
	/bQ8vl2I3bJsXYt3vrsrB8ZKm+u/Gey3tvxreEfwPdYJVkfwF18wnQ7cMAYS2sCf/A==
X-Gm-Gg: AYBFou2kd3Q+lfMPtdxXg2Rl76MHN7PZR+tbxIedJ8DCGEvRiPbBHGw47n2fQ7/oCAE
	aCZ8u2WYz+vt0Nv1CKYE5IASltUwy3GdN1WKgyiS8Z0TfgHZXFoUL7krogf7AS+hDqjW3uzGiPF
	qLnaJ86JLNw0QM2Jjh89Vluqx2AisFyI5c1DJM5Qoh7acSEB9uclfNh2UlmeqSjlAqzklzOTwOm
	EygJwCezYIUG/BGNchpUqyayrXT9koCYBUKpTWz0aIdFbrK2ZtupFuyMxmx7+5YhLkullygpVG2
	CrQoR1jxaxtKTw/3S2rX/EyCIzQhXNDQVNrJCkJxjnJLF/mVKdFalJrt2eXn/NAUMCIF0+zdbVR
	MmaFpl2gboY6MzWTEebjA7Om/5/FywqRzdHWxY9ao+GVkUbfoXVczc/DDUPLh/rR5wuuifyfFHh
	szF6LPYbCfbBUKmH07l5Vh3tnq8T1q1JV0v2bGzQGjHKV/OflIdKQeEzIoJH749cOCcz0u0f9F7
	USQcCyIU9NjvCzIJ30ENpX9hl1T1VTerzQAG5pTfTOpQxxqfEKvpV1/kNzqHdApI+rPG3rBQznl
	obD51xHdrSa7x4iDTsmLNSYPKcNw1HZw2larz6Fa+AKcx5wsV9Z2N7Q8jhOoEYSq5PZ1W4nLGeM
	l0MYk7Dr8erBzUfDf88Hx4ZkuSVijNTReNW9UCT4lZQerlD3nhXmjNnuP0AMYwn7bjzrXA6SkDS
	xHPSC3JFf7x60M46ZtWH019/H3VMvW0fABmOoaiWMDcyX5HNu+AvFsj1zTJ1GBDF5NtdO/
X-Received: by 2002:a17:902:ce02:b0:2df:42af:2f9f with SMTP id d9443c01a7336-2ee0f0e1667mr1068475ad.1.1794514988112;
        Thu, 12 Nov 2026 12:23:08 -0800 (PST)
Received: from google.com (130.155.125.34.bc.googleusercontent.com. [34.125.155.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb18b73sm874147a91.3.2026.11.12.12.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:23:07 -0800 (PST)
Date: Thu, 12 Nov 2026 20:23:03 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust_binder: account for deferred work size in
 Thread::read()
Message-ID: <avYgJ8wIbY9-gFi-@google.com>
References: <>
 <18e70d7cbc2831c0.3137322e32332e3235332e313736.1920de.0000sendgmr@google.com>
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
In-Reply-To: <18e70d7cbc2831c0.3137322e32332e3235332e313736.1920de.0000sendgmr@google.com>

On Wed, Nov 11, 2026 at 05:23:24PM +0000, Chris Wiseman wrote:
> When a looper thread replies with TF_DEFER_COMPLETE, its 4-byte
> BR_TRANSACTION_COMPLETE work item is queued via push_work_deferred() in
> inner.work_list without setting inner.process_work_list. On the next
> blocking BINDER_WRITE_READ ioctl, inner.should_use_process_work_queue()
> returns true and Thread::read() checks only whether the remaining output
> buffer can fit a single transaction (4-byte command code plus
> size_of::<uapi::binder_transaction_data_secctx>()).
> 
> If userspace provides a read buffer with 76 bytes remaining after the
> initial 4-byte BR_NOOP placeholder (read_size = 80), Thread::read()
> calls Self::get_work(), sleeps in Process.ready_threads, and receives an
> incoming synchronous transaction queued behind the deferred
> BR_TRANSACTION_COMPLETE in inner.work_list. Iteration 1 of the loop
> writes the 4-byte BR_TRANSACTION_COMPLETE, reducing writer.len() to 72
> bytes, and iteration 2 exits the loop without delivering the incoming
> transaction, leaving it stranded in the thread-local work_list.
> 
> Add a size(&self) -> usize method to DeliverToRead returning the maximum
> number of bytes that do_work() may write to the user read buffer, and
> add InnerThread::pop_deferred_work() and Thread::pop_deferred_work() to
> drain deferred items from inner.work_list before entering the main work
> loop in Thread::read() when the remaining buffer is at least 76 bytes
> but cannot fit both the queued deferred items and an incoming
> transaction. If any deferred item writes bytes to the buffer, skip the
> main work loop and return the drained deferred items immediately without
> mutating inner.process_work_list or waiting for new work.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Fixes: 8eb05e8e47f1 ("rust_binder: add TF_DEFER_COMPLETE flag for avoiding userspace roundtrip")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chris Wiseman <chriswiseman@google.com>
> ---

Aside from the "patch threading" issue, this LGTM. Thanks!

Acked-by: Carlos Llamas <cmllamas@google.com>
