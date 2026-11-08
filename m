Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794154919;
	b=ZZ9aCkqusTcQjzhW5yK+Uo9ekLdWmLB3KU09RXBuaLBuRMeVAdWUWN2sRziSg/HbMnrm
	 cG+1lwNJlH+j+rIm0e7wUYOhq/wdLWLuuFgGLcYrXb+DHYGQZ231a05L60ALsATP3meA+
	 NDY2IL+VCFcaK+wgh8PLJV64mEBkHj9rsaBy2i6LJ4mKoNg08xofRy25EYpWbEN3DI3BE
	 ynwlV6z5dYsb0iAo9sl4YDACuJKMHRMiawlWNTHAx8o42KcBUW5pLS+fwyyIrum3uptD5
	 KyUjg2dZHWnpS34trghAHSpx57lCoOoUsyc7zGiumF/CiB6N1B/aCDc9X/+AREYrPCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794154919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=NqiEvNJc2p38Ujj7TawQCPTCe9qdBp/ccFJptwABHsY=;
	b=lt2wKiIW4k4+djKVyqBOQ3nxgxjoelU0oTKGXF2/0ttGXIu4p1yaJJrxse+Rjdit2/f4
	 EOUYmACv3BY6WXLezCzjgfaqouXcehNg38OEPSAipYpi+JPEi67ysN6CnVz4IEkWbPRF1
	 WG8bVo1yjLz11x7pvcUhGBotVLCY7kl8IP0D3W3OEx7wP9rCiKS6Vrwrew7vzwyrrAYv0
	 +EkEJvrvrxqdaVayowM2N7XQXxz1IcGqrYrE/gnjF1KEIP/IFPErWpQ0Fzra3Ss6+LBrn
	 BHKnE7j4hHSkVAx/FkatdvVvwr57YLPgN+Cz23z5Eqji0WIsP+yhbODm35LZ9fj9kEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByZKqEY2;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5F606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 16:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF5F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByZKqEY2
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso785435e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 08:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794154917; x=1794759717; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqiEvNJc2p38Ujj7TawQCPTCe9qdBp/ccFJptwABHsY=;
        b=ByZKqEY2fqDhKWoL3BQKBZjth+x/iOlR20ruT+hrURNxCRwqYtsum7eZaEhd63rm50
         +GHBf5keyZIJ8BcMAlMHs7ZqsCdBnHF5w6cKrAqTxfqgHcqd5LZUhSdc/J/1gf4lqQaX
         5UsxhwT0VO/ynoe2i+sWqm9U+7By9WCmpaY0Lox+wkZPKASr25srJMuEjQHsG6shkRoX
         zhsnz6GCHInxjthTYMvu7UTKBmUrrtFOAyIO9PXkdTuZBmhEsZGDOJ3mKNTIsAygQd5g
         Tjq/dCJww5DtLMaK56lq+wtOcBNcgqgy63lXfEQXZnFZTlaw3naDMUuP1VQzT8d77Qf2
         yBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794154917; x=1794759717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NqiEvNJc2p38Ujj7TawQCPTCe9qdBp/ccFJptwABHsY=;
        b=b/ymI3GwJ4ersW+oe0nOuF3QvVqHBweWjR+iZWXm/R/VR6XZ4WNh+T0t1gq6aW9MQx
         7xDIh2lWklwXO9m4V1Qida5L4qXSLcMfBrCbaG0Wgwba2RPOmGJ2Cqb4+xuScnNl0Pmd
         r0lCdcOUJAzw7T4y0qgJWrBw9341cAjm8gPFVyuM4dJNMqi/1oFjGlBNBdWG0ia3PSUx
         kDTA6OaqDilYFpQpc4RRBJBrZA1srALv+E8lFhHRbnxvy999Yw/M1RWe2ynhv1IVtjl6
         Szu4XvR9PTd3Fspn8gKpy3pCXcRA1YaEYGuShAUKvKsWPM7+cDssXt8W902haZT1iNA0
         diqw==
X-Forwarded-Encrypted: i=1; AL+hErEMOyF7Y+Q8afL4zdE3H1CcS7bMOVKowK4Kf7BBE2Mnm6d/kh+WIueGLdikvAm4e/05n4jlqn/n71rvB9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S+aHPb5qeCrxOreBiF05JwgqlSuLpD47w5mjZjhVWJmwv0ure
	hvgarFmrn7KhOAs7q6Cnciq/v/QZcNyMOP3vpyCxJW4F2qRU3WbrUWus
X-Gm-Gg: AYBFou1bb6Vxo2YAUMyWp6OM1ZPVWEBkChE5keG6LELPSERuLVO5vh17T6okE6BHg3W
	EwwtPFVegc5itJu30QcOYWXbmfVBkBK8Oy4KNSBpS3y7QMbIXZXURo+6wpGN/KMHq+L/EUc4p7n
	pTKau4G3qqSGDH+K2trTAUSidtpMdII6uMTkHI0KAiY0005DO+/MbyObt2eP0mZzFkBFE0jFUrf
	LzJ4udEwj0fPHGNqfteNfRWGHWgK7lpQ1RBcZUapG9y61qcdP2+X5iN0pVtFV+pKWdD8jZYcspO
	Cqt0jNzN6sm+/YMp9O5z3LiD8ycE2/IXWtdBiTcR1MASjlXyCWub4lFQf0/+YIU/EK6Q8fJXx/z
	L6SNj/7ildYxjMACsqtc6NMfRgCXH8xJFO3R+RleMSYbX0ceN3nmw+WXn0Ac1SxqpU6clFM+gUL
	XbpI/epvowJP4M+xsflu7UPumabfJQL/eaYjFFpFq0FBVgDJw9A8eeAJQvDPFi71qcmkravvSTq
	EsGEcHs5DmEtfHg8TJk59rlaVGlOPWdUNBJOET7tn/cENcm72wG9w+LxYMARhCqSmsHE9Ux28yT
	4JX4ySfOfdim65x3uixDkYAkvJTMMLo51hs0FrVXxCHaM+SmHYli
X-Received: by 2002:a05:600c:3f16:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4b9633cee64mr34051605e9.18.1794154917053;
        Sun, 08 Nov 2026 08:21:57 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7d54d6f93sm272669515e9.0.2026.11.08.08.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:21:56 -0800 (PST)
Date: Sun, 8 Nov 2026 17:21:51 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Shi Lecun <shilc2025@mail.sustech.edu.cn>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	gnoack@google.com, Fengwei Zhang <zhangfw@sustech.edu.cn>,
	Bryam Vargas <hexlabsecurity@proton.me>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: landlock: clarify F_SETOWN signal scoping
Message-ID: <20261108.5b4268b47da6@gnoack.org>
References: <20261107.2f1fa9977739@gnoack.org>
 <4C69C1457B12AD80+20261108055048.3745750-1-shilc2025@mail.sustech.edu.cn>
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
In-Reply-To: <4C69C1457B12AD80+20261108055048.3745750-1-shilc2025@mail.sustech.edu.cn>

On Sun, Nov 08, 2026 at 01:50:48PM +0800, Shi Lecun wrote:
> The signal scope check for asynchronous I/O notifications uses the
> Landlock domain saved when fcntl(F_SETOWN) configures the recipient.
> Adding LANDLOCK_SCOPE_SIGNAL later therefore does not retroactively
> restrict these pre-existing registrations.
> 
> Document this boundary in the IPC scoping section and link to the fcntl
> documentation for I/O availability signaling.
> 
> Link: https://lore.kernel.org/linux-security-module/20261107.2f1fa9977739@gnoack.org/
> Suggested-by: Günther Noack <gnoack3000@gmail.com>
> Signed-off-by: Shi Lecun <shilc2025@mail.sustech.edu.cn>
> ---
>  Documentation/userspace-api/landlock.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
> index 3d45b956b640..cc9c5b102b8d 100644
> --- a/Documentation/userspace-api/landlock.rst
> +++ b/Documentation/userspace-api/landlock.rst
> @@ -499,6 +499,10 @@ The operations which can be scoped are:
>      This limits the sending of signals to target processes which run within the
>      same or a nested Landlock domain.
>  
> +    For signaling of I/O availability (:manpage:`F_GETSIG(2const)`), Landlock
> +    checks are done with respect to the Landlock domain at the time of
> +    ``fcntl(F_SETOWN)``.
> +
>  ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
>      This limits the set of abstract :manpage:`unix(7)` sockets to which we can
>      :manpage:`connect(2)` to socket addresses which were created by a process in
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.56.0
> 

Reviewed-by: Günther Noack <gnoack3000@gmail.com>

Thanks, looks good!

–Günther
