Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061083;
	b=TtOinQ/b7YgMbv+etbRXphNUmHs59qEDJT+Sc/mGknwhuC/bqe+d9AQxzYVBfmhTBnqn
	 1s8HV/CXxDwHszEf/jvgi/Qzd23+Rl4boAhGZleNNhmK9CYCHn9JwwZ275JjeH6u9C/4v
	 iA9jKuGjLMJ8HKtf3Lx6j06UkSiSxbj5r9OSWIkyIvJ7m0mCWJ54OU0ybTJ98SRCC5sAQ
	 kPgoyRSFvq1F9cR9XuxxfzemIbePzXquSOKz4dCqF6hUA9r7tFyoKEKNZfiU+k+ljT7q1
	 PUaNanIKA620Feo69AcGYGIYin6yET4T3FXPDf0O/oknsPoYLfNnKxIj2jnS+8r1IGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
	b=M0EIZ/OqVt0Q7SXJ+Nqw9AvU4tk1pu7iqkjrMsV1jrQvslBHAPaKVn+Lp4sAWRbWrnl3
	 YJXPqjrNlP4WiJU9KU2WbLelhKni/BtRr7gify6y/9CJiyVc3qePw6U6QxVRk/YyMHIfg
	 16/boGmqqaJVawRGAFXgk2ef8eEUbKIKREf23CwBdzNF/SGMeC89Ijjei0lZMIcEo+qAw
	 2kO4wJnHVsmU5Hc3L658J0CZa/VPtZMCR7SC1aN6rMLCsjKBrGVVbJaE8+VrSEKF2d0nt
	 kmX3QAGSUo4LxOTNVBDTvwN0F1XU47Ca50racaF/aSdrpIAf/C9W5hh0jBoxKOk2lLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRKJMeNk;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9B608361B
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D9B608361B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vRKJMeNk
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so3152845eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061082; x=1794665882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
        b=vRKJMeNkeYTvBGviD6I87j8Oy+rPbFlUb52I64IClyQsWkjEB5fZLuDzsYvW7iObbR
         GYEenh1eZQOwcd9e+Km0yBbUYS8upsjVAp/uHrp9DzQUCUxe0/RJ6sLbHtyr54ETYsod
         X+7wTcR/GQ82jkhUSdXSXa3QNoPk3Gtisy9D6RT+xuvqrvK6vaWLijZb1Y2stUIwTzVX
         ZcuTVjJq4d5I6yThJNvdyhAL+cMJV6UMRr4Xzftp6lyPsbsj+BMhOvTF2/SgZ6Y17gE4
         iuIv0ziNNHOdsxjhLbmerNIoYMOQOKfG7ySNHHC0hZXZh8sGDm1apSsuXi048t2ZqDNi
         rElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061082; x=1794665882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIuiohscteJo2hp38Rebuh7m/8NNcOKtecBPcT79lyA=;
        b=KSme8ND+3/pNsod9XM/oauGTPuTmuNITEWbuQZ2xfXeycIF5NsFn5+0WRtBp60jHU8
         tfF4Jpa5Cb+0O0y7P/HnL1EpG33NW8t59BK02d8V1mrIZ7nSLAlGyku7mXBCPmkE5ZSU
         VEwvah+1a29T6O+OCI1BbxB67khaPBg+UZJ7ySrgDSPsO/HYVfOhX2COsj/xmQDNIGOQ
         yv6BBrz7YmsEnZfo2FzGPAs5p1bC+l8e+6LfLI2cNh7XcBcHp9GsAEDYjLw8sA/YWDKU
         ullM19IsalDZIpt1HXPFgZ+k9P6Yflkqa2xRP84m9RjwKnROr8WH1wMAvETvvsZPT3n1
         gOfw==
X-Forwarded-Encrypted: i=1; AL+hErEZYPtpnqLj3fYoAuTLYX6EkkBpXwJ7ymCgHEhOyeKh8weFjZFi+n1az6VqwW4v1z6F4aZpqYdZ1FR35Fo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vuQZVkPGNh0hwGQTN6vSlxbuyqCkUOiEJ6cPJgdQ3uQ2IJThf
	2y9a3T323wNszBJbWg/lPhikzfcLMzh1p2cD127wv1GjeQbLlT4dUkui
X-Gm-Gg: AYBFou2gY/Mc4oGZOqL6RgZs73p+TkoiTSmg++tzYevJrEvTelT+reODuItbBlmzZrz
	byG3Dd7k7O7JmUd2c2QMWuALtHcXInAjcy/odhxUh+SvMUSFB9ItB3z/lk1g2w2zhmCeOPN6PAT
	edSSEPQWnWoOpuL1dK1cV5pXo0kH4HhzDnIWaJ7ZYR7Z7jKduCi9bKl3dJ1Mp7Ko0V+SdV8vwYL
	FTpshHHLt4FNtdBmB2aZwWge4SsPDmYyvbo/iv6apmpqoV0uP0KDR0+dpGYQ1uyL54RsQ1ErGW7
	GoT2Il4NVj/nMhE52unECz+cBaqWbMnfUG2u6VsBnxz7NtTCyxHpF1nuqQlt4XgSD3i+c3zCGSX
	aK9vH61lihEczJpkss4eK7NzpB/Gc55D2s46RX6MRoJWTQd4aCbGj7pQrTtKY1rsHwzJQ2cFHUc
	v3QMTeQDpJA/saXb9iZ5EK5oMYua2nqWiGT28Ng+390JKZhVCclng+CHpT6zAqC6CfRdi1GHUPN
	XCpbeoQ6pIJU0p5RdiLuRmG4ThrUXwYiNK3v6zkWO8wF4U3NvocEyINNGIY82MGq9NE+vK5HYIq
	LJ+mrNLbGLDaMgfV6g7Yx5SS9BHbxdrtBpB1128ObcLblLvnpsJl2TXQsSM=
X-Received: by 2002:a05:693c:87c7:10b0:36f:26a7:968e with SMTP id 5a478bee46e88-36f770062cfmr7560876eec.40.1794061081678;
        Sat, 07 Nov 2026 06:18:01 -0800 (PST)
Received: from TheRealOne ([2409:40e1:407:758:265f:d54e:2491:df90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm16251949eec.18.2026.11.07.06.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:18:00 -0800 (PST)
Date: Sat, 7 Nov 2026 19:47:51 +0530
From: Chandradhar Kumar <chandradhar.2003@gmail.com>
To: Alex Elder <elder@ieee.org>
Cc: syzbot <syzbot+693652ded53d3eb9cb91@syzkaller.appspotmail.com>, 
	elder@kernel.org, gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [greybus?] [usb?] KASAN: slab-out-of-bounds Read in
 gb_svc_request_handler
Message-ID: <au8s1_tIBa0mpTSL@TheRealOne>
References: <6aec63fd.5f5735a5.290c1c.0002.GAE@google.com>
 <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org>
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
In-Reply-To: <46a139a9-198c-45c1-b41c-521def10a0df@ieee.org>

On Thu, Nov 05, 2026 at 08:08:01AM -0600, Alex Elder wrote:
> Here is what I see happening at the beginning of gb_connection_recv():
> - If the connection is disabled or offloaded, return immediately
> - If the size of the buffer (passed in as the "size" argument) is less
>   than the size of an operation message header, return
> - If the 16-bit size embedded in the message header is less than the
>   size of the buffer, return
> 
> In other words, after these checks, we know:
> 
>   sizeof(header) <= buffer size (size)       AND
>   buffer size (size) <= size encoded in the header (msg_size)
No, it does not verify this, it verify:
	size encoded in the header <= size (buffer size)
> 
> Therefore (transitive property), this is true:
> 
>   sizeof(header) <= size encoded in the header (msg_size)
So, the transitive property is not true.

I have sent a patch for this bug which verify the msg_size and header
separately, which fixes the out of bounds read.
patch link: https://lore.kernel.org/all/20261106094303.55158-1-chandradhar.2003@gmail.com/

Hey please review the patch if there is something wrong or there are any
other way to fix the bug.

Thanks.
> 
> And it's not possible after these checks for this to be true:
> 
>     header.size < sizeof(struct gb_operation_msg_hdr)
> 
> or put another way:
> 
>     msg_size < sizeof(header)        cannot hold
> 
> 
> It surprises me this would be missed in the AI summary--and I
> fear I'm mistaken.  If I'm missing something or wrong about this,
> please feel free to say so.
> 
> 					-Alex
