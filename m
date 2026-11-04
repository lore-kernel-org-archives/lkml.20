Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797426;
	b=RA90PISxfm9WgNWi70LQLansLDdTRORtn33slHG0zBjXb0+yzCmXBM2DhvoHPkVXkI0X
	 Mg3hdtRjCzxpoiokkY1XRrsaQ7/tOu2rpU8KLXVSaLjHfYSr2vh4XHiostaWtNqGf4VXA
	 RG7jcS8PmkBzBmthYnKqyXjpv6b5qIoJz16gbI2tUqy4Zb+Fvs5H8yoDkAqoWBlW6TwK3
	 Y215C17jkc1Z6ZbtVxwtCFwhUkkVaRKgsjDNLBwd5YzOk1ohMRKP3IzGYUkgqwHVyL4Px
	 iveGTlhgYLCvPxyAElmhXivolWE7tWBpSPRJAfUTmQkesoLOOQ4LkzYiafb5zGkoz/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Rk9I/hs0FAD1JpZN3nz0IyElTxou9AIDzVZ41o0WZsY=;
	b=zwUrmFULcXiY89+Xe4ayfjB/QlDd8ch2anRMtd7BpzVQymGqAKh0/+Mip6995dBaWtHM
	 socMHcKZUGZjz+LCyefkhRMEjrxN4dKB6lUFzAXx8dzg1+so1/yveqnBNtnE/PvC33HPV
	 3oMDYYhBLGla9+ohcmy/7hfUZLI8lcOmhekUT/FLRnN+4lngUXGc8O+FbyxSYI/ODNd25
	 LKDhB/dUeXL8pQg23BoQ2udX+DIHhdayOCaBeD/DCBQsje1n+E0ZDawHLg25blPdkuuO3
	 rp7K4vrZ3EFGErvHzokwmV7r8IYzbRFzwTdyF8fmic6dqB/qB/eBX0kVUAY/sH00Vjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SundMkPA;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA122606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA122606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SundMkPA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b027578a4so578177f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793797424; x=1794402224; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rk9I/hs0FAD1JpZN3nz0IyElTxou9AIDzVZ41o0WZsY=;
        b=SundMkPAP7nK88QqCodUo6cgiHfwucHJ2BB7s+84UW57L+S2JnswkeV3z5E+jnjjiS
         uYJbWuy3crTVgS2v9uNU+xMFoBfOXCY/PZhRZVgDcBN8VIj1Y/vxJkjggQcE7XmYbZ2w
         XgGNoFB2eJzlLFmjeXFS7rrjh4TEnrcWlNJ4k80kYfoIjNxkZ4HXbu9pcdq+dwcIwFlD
         cG1iX7wjqaqYeca+ffIq1Mad6MkDVd8ccTWW4Zas4vB7KvscYTZY3Mv2oJiHb8uMo899
         042BMZAOA12jBTu9X6bJR/ScE7SG6+gseXgxLO9FDy7so+xrDHuko5WnFP310QOIOHZz
         o0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793797424; x=1794402224;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rk9I/hs0FAD1JpZN3nz0IyElTxou9AIDzVZ41o0WZsY=;
        b=gxAFKv2K2jwX/lEvkwcceoxwczi/Mqfz6hsTXem6fVeCytXmVi43yV8doUNCmYf/15
         hIVD4iyyE0Zqt28i64GO2t/CP0txJFq5SgoNdcNoTXZ7LQv/OhnEFEsBXAgIW9sc6C80
         wkpH6YezYtKvB1VsZWosa7thdMwc46RzHjMVr+qPisE2N0MN0EO5oZr1y0/rz33oawtI
         +gGPLPbyNaBw8HvBiU+goCKAGAYx0avy9IVBIyDoVlmrXLfzD3e1eH1jJMRPuGLTAV8/
         MIxqKOh2gecwOdjSxvfGHWI24QRO+lxMa2WF1BQcb9zpPfVc02sKz+O65Fm6TM0eMx3x
         Z7PQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1olxBA5Txo39wIw/WjWWQMQ7Hb3IJEbrYcsGqPH41bsy441zENtALX8CMyBSfUOxqXE6Ekp48dl8zk1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WXyhhzTmBASzI8SONW48/f/b8dVu7XMNr/zvps+fLFMM2zIEj
	prXH8Lx4ep1eqtE+29mpmeX5no9FNR/iz4bwKv5n+IQqMv8goyAMV9cyTLzKVzWwVRfyOp6wCCE
	DOWpDk6B0mrAEerOhpA==
X-Received: from wror10.prod.google.com ([2002:adf:f10a:0:b0:48a:eea0:bc47])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:29cf:b0:48e:6f76:de9c with SMTP id ffacd0b85a97d-48e6f76f453mr21544509f8f.28.1793797423627;
 Wed, 04 Nov 2026 05:03:43 -0800 (PST)
Date: Wed,  4 Nov 2026 13:03:41 +0000
In-Reply-To: <auixgbeSSfBWwVS9@tardis.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102035934.711973-1-tomo@flapping.org> <auixgbeSSfBWwVS9@tardis.local>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261104130342.261593-1-aliceryhl@google.com>
Subject: Re: [PATCH v9] rust: sync: condvar: use Delta<Jiffy> for timeout and result
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, FUJITA Tomonori <tomo@flapping.org>, arve@android.com, 
	brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	a.hindborg@kernel.org, acourbot@nvidia.com, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, lossin@kernel.org, 
	lyude@redhat.com, tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 02, 2026 at 07:51:29AM -0800, Boqun Feng wrote:
> On Mon, Nov 02, 2026 at 12:59:34PM +0900, FUJITA Tomonori wrote:
> > Update the only user, binder. It now converts the freeze timeout with
> > Delta::to_jiffies_timeout() instead of msecs_to_jiffies(). Both round
> > up, so a short timeout does not become zero. They differ only for a
> > very long timeout. msecs_to_jiffies() returns MAX_JIFFY_OFFSET for
> > 2^31 ms (about 24.9 days) or more, which means an infinite
> > timeout. to_jiffies_timeout() has no such special case. It converts
> > such a value to the matching number of jiffies, so the wait is long
> > but finite.
> > 
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Thanks. Alice, any concern regarding the change in binder?
> 
> I have some naming suggestion, please see below:
> 
> > ---
> >  drivers/android/binder/process.rs |  7 ++++---
> >  rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++++---------
> >  2 files changed, 26 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> > index 1f4cb43f1de6..edde0ea35687 100644
> > --- a/drivers/android/binder/process.rs
> > +++ b/drivers/android/binder/process.rs
> > @@ -1552,8 +1553,8 @@ pub(crate) fn ioctl_freeze(&self, info: &BinderFreezeInfo) -> Result {
> >          inner.is_frozen = IsFrozen::InProgress;
> >  
> >          if info.timeout_ms > 0 {
> > -            let mut jiffies = kernel::time::msecs_to_jiffies(info.timeout_ms);
> > -            while jiffies > 0 {
> > +            let mut jiffies = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
> 
> I would rename this variable to `timeout`, i.e.
> 
> 	let timeout = Delta::from_millis(info.timeout_ms.into()).to_jiffies_timeout();
> 
> Thoughts?

No concerns from me; the binder change and your naming suggestions look
good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
