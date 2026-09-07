Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995BD4E1408
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789100; cv=none; b=fKFGNeCgt50iIY/0R9YUiIzdgKgcTUFezsDd7/AeSN/2kTCary49359KZqqhdgKIiXhnf/kp94s2qPXgZE/tw8L95d0wToRrCM4XkN9h6oQe+7+vDseCgXCX+GaoY/fHj2LbSKWGpK6kRgGUQ1BsKckh7qTJznn+GSPeVlHY1QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789100; c=relaxed/simple;
	bh=xttc2vOfucoV3IA6F3qa+k3IZHlmqgnUex2GNR5o63Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sQga4/ddvSqrEoqvRtiaglLPsPpvz/8fO85pVvAMeDcFRhtVjGgDKHZLGH0NkQ6BCLf41IT5FD98Kie9j2uangrnSNTI7ZwKUS/yXHu1vgZPM9IhVjSgx0B9AUtPlQr9B2DIVxWVzUxf9LlzYRbEZUKWv94x2bHB4x7G7zD6pKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VmMtMS1v; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VmMtMS1v"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cf9df1eadso27233915e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788789097; x=1789393897; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRc0maF7oOjfW+WmBPefhnmOlBXT47molAodoF7dk4w=;
        b=VmMtMS1vV9KzSgYk4a2Gq/pXRbFSkZovXDjGurmtAOobuYhO/vgo7LiVVUwtsYSVZN
         3QmIXu1N5MNeEXVu7IIxqORgDCZwPiMjw33YnDKDV8J8/Ed9VUXT0cn0KNFkr7CHWnRg
         6GzNiU+H2kMq6AFdFHkpfODVbxe2tgOTevI/lRuJP3GDYF1PR/m1dX8PtLWn1DfdUSbc
         OkbV7QL+DvuwVjwk4XwgQCzYyLE5bmx/yT+1Z1qsQ/2t2lyUEizj9eTm0+us05ImFUVi
         Qhr7HQiSdiAek0ddBkQGYv8E2rWfzonLTOaWlNDrZsgiPmw8FIHb7an9JADG7keCRfD+
         OW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789097; x=1789393897;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRc0maF7oOjfW+WmBPefhnmOlBXT47molAodoF7dk4w=;
        b=pxTY1QTjlA+VTB/iJTDO6920Ksxh9NdZB1TfHRBzfY+N4t8H9rWt4iIdkN0pSrR/Kg
         vDw7/NJrSiPbQl6AlR2U9VH46e/YklCQ9vaOp0FWhJFGFwoO8dfll80fsiHfw7/xYS/H
         nIgf5NZCXuviWSi0rT/+x9Ne5+8BfH9jOHCbS9eJhWUiUYNCi25EBfHK2//hiYg0iQrl
         sZdX6Nj8V+F+YaLrSng+cvPh7C9bv29dTdqSnMtunJ9nGVLA7z001PzSOylOoSv1jssg
         YqtxdffDMM8sjJADtzINZq7o1NuKlfZqnh803ol8jCGx7RNb1T1HTKzgWaBGHBwZsylp
         qGxQ==
X-Forwarded-Encrypted: i=1; AKwUvByOqqgqoNegwqrAFsZPBgHEgW6kaJQeiVt1k/q2G1e5uVH520OFyL/76IQfYI59/NQXC3E9RnHnk+wK8b4=@vger.kernel.org
X-Gm-Message-State: AFuF++khl7NDlZ09bKP/tFBeatmrFDcv7fwFmfNiPB3Eby6Jrq9jo+Eb
	xW8kUU1f3ya5WdRULBGJ6ukKi0qsI5kgrmygexJqUlnaeGLJ1Pvbmlety8733oLsud5OkF0fp2L
	L+AQP8FI5iNcTTZL0qA==
X-Received: from wmqg15.prod.google.com ([2002:a05:600c:4ecf:b0:499:aec1:2cd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1914:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49cf8269fdfmr224746215e9.13.1788789096370;
 Mon, 07 Sep 2026 06:51:36 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:51:35 +0000
In-Reply-To: <20260907085139.65576-1-advaiv2@uw.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260907085139.65576-1-advaiv2@uw.edu>
Message-ID: <ap7BZ2dqFs7hy-0E@google.com>
Subject: Re: [PATCH] rust_binder: add missing newlines to log messages
From: Alice Ryhl <aliceryhl@google.com>
To: Advaith Vecham <advaiv2@uw.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Christian Brauner <brauner@kernel.org>, "Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 07, 2026 at 08:51:39AM +0000, Advaith Vecham wrote:
> The kernel printing macros don't append a newline automatically (with
> the way pr_*!() works), so the error message gets concatenated onto the
> next line in the kernel log during these warnings, errors, etc. Add
> '\n' to the end of error, warning, and debug messages.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Advaith Vecham <advaiv2@uw.edu>

Thanks! Unfortunately my patch series that changes all calls to
pr_*_ratelimited! already makes this change.

Alice

