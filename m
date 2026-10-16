Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D20C48DB24
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175238; cv=none; b=c8oDu/eEfvEcsk29YvO0pxFru+ZtlXZ3zuEEu2w8ks1mJr+Iyz3/QxHKuNxpVfnlSpss83+Gltk7IZcbajuzAY56M4MIxD+ttT4LNMs5I5NgG2Lfkf3fo9jTfDLie8ObmAh34kbrrRS0QeG2ap4N9hnsEOXD1qSYkLB++hCiYbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175238; c=relaxed/simple;
	bh=VBRTXcwLrUGeAqqGUzuYSNaXljshwUPb5DPEUQUp/Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pg8HFbaTjmooQrfYox74ZiAozIHmd0ovYtLUr1PNTPqiLDv7hEwvrt1LpWDrjD0QFxDgaToQ05SJfK5EiGYXTLmMjQDXAsOq/kmuNNAgKdIObBg2kiVU5NBsIkWTUCbdM94JluIm4egZXNaZaWmeMex1xDMCXJ4nfx4ns4fUh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwWC6Y4B; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwWC6Y4B"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so426392eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792175236; x=1792780036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNlQS2xn23EOx0Q7AzOrXy24hZ0s1Lyk3n6Wb6L7jSY=;
        b=rwWC6Y4B/9PWtrSHtB2Z0NelkjCd55vBJnNfs7yg2s8FWuedT4mR5Af7ruOn0ma4Ho
         Ks9oWtUUmZmrVtjyjuoauG5l9nQvn0svES7w8M5VNzLb0YocaY0id60rFRQKRU7JnJOY
         qN7eG/vO77ohnH2CCE4bZOzxg82T+kAEsUHhdE7L1pXGW4i7Wv61WX4z62fHbIyhNByG
         AmjBsxV6iNV+++yesLBkq4QMApMjbkmv/owVTH994wc5W/vXlPgdcUuU94r3TvRE4qTa
         M/dcMWIsunQsWP/G2H5qZFXDjwf0TCKuT1vfDBk09i37C5/ZaphWzSgy9XoZgeAeZIqa
         IT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792175236; x=1792780036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNlQS2xn23EOx0Q7AzOrXy24hZ0s1Lyk3n6Wb6L7jSY=;
        b=pNDcsf3HO3PZi1BX2CIf04mCRXzZj0m+FblY3b32o3lp+L9uZVaaJpVDw8Cybroqsd
         GjQAyX5yen1k+1WWTMvusjGFUNfwYKA89CG3Sagwe5Lai6uV8ARCxgKJIRVkmr5E710I
         4iE6JRVu8G7YA3haUK83EqdZifFqEMHHmTPuf95DVC3NtQNFtB4AUJYUNytBJ/NlQJRx
         N0KJ5GwuPJwjuVup66UTHGmlBfR/f0dvfHD27XlHeFFay2iErD+yRJpQ02wLqc98hJxb
         Jmmeg0Jf8gngacysDPsjjRS5HEFVmR/UdQYgcJA4a5yJLlYiZuJvP3YS8dgIlKXoNALa
         eudQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOxvoBYT7/AElyM6wD7bfGI0p6onFFR7OKWKt1dCjQCQbSNr18UOxkE4f0DJpmOrH2PuGjJTpVkdnTzQc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1F63DZQMqW9IjDSM9p+JviiXgHmn9B7XxSksPRApFv80j2Vgn
	PoP6HANeiDW9c0bW64QXZ8cp/PNyCUm/cCEf/Cdq6xQLsKjEDtBnZloq
X-Gm-Gg: AYBFou0TvQXGwdXZNZGoRlts73obzpD51cxqrwd7rWEMB2BYnfiB98re2WVkBXPgnXE
	TU5xhNh1uUJGGKFc/Kmf7NB1eqq7+Ncys9in3/lKEABMFE33aHjE+WlxDNA89SNTvEQW3Ft+ctF
	JgyWCYIKoJPJtcCtZLxoyyf8PUZFvH9GmGKDhy+INTgGbOrlIC7HiyoSsFVVutB+8IemoZR3cur
	DNBG3cb0nvCj+RTOTy9kiPtd3PT5Xn9vqbYyVyu0ySZudwDprDb0aXcdDZh9v7O9CRLJ1j2eDuk
	0fqIluc/WXGk2ftP/HyjfPqvFpaeILGLCkUHfWAolUkcCs3KGs9jX5HIms1uJuM5DYNQT7O2wfH
	a9q2qAq3O1sdP6UwP7c0YXMdtsuHDKX4xC9V4YyEVuWtdefwZTdiiPNlTfsDS/u/UOHzjxtM6Nv
	kq2CaC6/nLA+PaVJzKBD37Oj5xyehkPIMTeGKOM8IoahJkecJXXc6hEC0bRjLj3cuUmpxhiSnZB
	MXW0xxxBY6/nFA/LbRVmZvSklCQuifHtEHF/1xI
X-Received: by 2002:a05:701b:2608:b0:182:9071:3249 with SMTP id a92af1059eb24-185131076f4mr716375c88.30.1792175235936;
        Fri, 16 Oct 2026 11:27:15 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e6ab:aea2:fd2a:caf4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c2e7bf4sm6670161c88.20.2026.10.16.11.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 11:27:15 -0700 (PDT)
Date: Fri, 16 Oct 2026 11:27:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v8 2/2] HID: multitouch: fix use-after-free of haptic
 data on delayed input release
Message-ID: <atJrRjjgXZz5A-Lq@google.com>
References: <20261016163349.3293666-1-qwe.aldo@gmail.com>
 <20261016173056.3397211-1-qwe.aldo@gmail.com>
 <20261016173056.3397211-3-qwe.aldo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016173056.3397211-3-qwe.aldo@gmail.com>

On Fri, Oct 16, 2026 at 02:30:56PM -0300, Aldo Ariel Panzardo wrote:
> mt_probe() allocates td->haptic with devm_kzalloc() and hid_haptic_init()
> stores it in ff->private.  When the HID device is removed while an evdev
> fd is still held, devres frees td->haptic at unbind but
> hid_haptic_destroy() runs later from input_dev_release() and dereferences
> the freed pointer.  input_ff_destroy() then double-frees it via
> kfree(ff->private).

Right, so that is the root of the problem. We should not be allocating
memory assigned to ff->private with devm as its lifetime is not directly
tied to the time when device is bound to a driver.

Your initial approach was correct one. 

Thanks.

-- 
Dmitry
