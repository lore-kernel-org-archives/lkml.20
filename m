Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571300;
	b=dzfXaYELXKX23bs9RdMs39Jua74snZztnO1v9FdmPZzI+Dn8V1z/GNODLlmMVr0PYGf0
	 s/kSnbEMdaT6ATZNrgu/tS0sFhNuOBdlFmaUDzrbQwq7M1Moki26rGGoippt3nteX1ITm
	 CNrDntuXEmab54XtqMpXloy16WpALlw9IRNgMi6WMO7W5uH4fbmHnMVhhv0xlstd2QAqI
	 ysYnYi3bUj7dUiirIbD+Knz4KnUZJ7RE7CczfXA2VvscLuH1Bqq0MJCzYqjw13tTUtafo
	 4sE4vLCuh0t1ZcKBhSml5293p+T9NHTM7iS/R/lFy9f/03D0IzqShEX0xbZ+qAAOKfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=kudVfvR8j8oKpMlnT4HRJXKZnsjg3IZPx8xqv9ln/aY=;
	b=0y20fqP82dpQHP5jkFDEgtQznQUD+ndGpfF9+9XQc2uFAfNHKBpA4PAh6XiTs/qtIgpm
	 UB6HIaJH5m4X+wxJJI+E6ZnuuWvXiH4JY0MnX30bKuMIi+QFWwwKuD3C491NxMxqEaSYg
	 1LGpH1IAELbMXv78pKl+H3lh5rK1zaj/MiljUT6WPmuxZglOqGj9hnR6nZOh8i3AuJ3VA
	 9kXwgG0UHR+NaNGancEA3YKLbmOFbczU+YG8vH/G7cKVC7EuSQq7nPTtHPKJAdDTYSU/X
	 ph1B5bSYaHPpSsBToze50pNRDeEXhgkRA+8iIssF8CkVu8U6QpGe4cz5Svz4tdn7unA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+pL95pW;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE8D606A8D5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE8D606A8D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+pL95pW
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-372cba0ecf9so91915eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794571299; x=1795176099; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kudVfvR8j8oKpMlnT4HRJXKZnsjg3IZPx8xqv9ln/aY=;
        b=d+pL95pWTQ3jrjsxlqw989H+pRIcGJv3p+LmtTJBiGIde7CnsOXvSoqBApHnEmkY8W
         CIHbYQSmM2kh35Pl3BlaLCxZsVNZ0fu5sfL8j8UFuehkrJgEFnYzZc/3eToNysPq+YfX
         vmfJh2csbKkvlEQdIreMGP7eViXk2+5J/H98WxURJB66Z/B1NiyOgng86GIXSJhfsKHj
         fQqXXta6cctfbhUb5bLPwttwNlXQzr2BDXsDxq7Oi37tkKMNlCKRK/fTjjo06N4N6/hF
         OmS/OaWk0J2tj9/UAJeyq0nEXNwh8YKS68TtURAi0Otfyp++uyReuokYx+SdBU6zoRLx
         rbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571299; x=1795176099;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kudVfvR8j8oKpMlnT4HRJXKZnsjg3IZPx8xqv9ln/aY=;
        b=Im+F+2N9Kg96ybSjw+6T6sk+YvHx8AbfZ6+0ODZ3oE67vOl83du85wEHCoMMkbRAsb
         YMmIgMIueTLb+0VrUwwrtq49LMVdl31JsqTRhJqaaXi2ANV+u+oDvzQXzoWuQYxdS1BD
         RVZS2ebObYds616QPQYqiKZEUJHPgBbitAzT6x3R54yBSFH/xWTx9WjMjixaQ1ltSm3h
         JjKYEEG73FFM1vkhN8Z9LdBQa1cBNAMUpWf3yFXooUS7LcCs5uMSraZkihIyNF2Og//J
         b6NKNi+aih7n8UARVqAiYeklFFb0ywEqYP68X4snBOL+T1KvIB45kziYtw3I9Ba8zTen
         AS7Q==
X-Forwarded-Encrypted: i=1; AL+hErGo+aOPKSk/hUed+Kxv2uS/A9G/YopOsSnfHB82gOnRgKXI5aDfiZHXicsP1sBGaBtAH7OC0RhJIeppgqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iEwuIZiz70HPSEkOprDhwwPZUX6cueQe81COabq6gBnwIou/L
	pkTp/VRbY4RfIugoyTnUnHU/zT7AY+X4hhp9Dv+gE5kP9P2GYvQ+g3OL
X-Gm-Gg: AYBFou1YTnpcIuGeFccvcR0tAfr5VGSS+1nuW/9kGkmsxA/5zSSUwVK1lsMayfqphBU
	+kO9wMIhlEtyCftkENLgYZaAZRWy228Tky7VGTC/V9yUjNFpvAlnCvqr4+2brQCDxRvjsy9JeiK
	42JYi3Jglr0JFT6SQzfCnimpWJof34ypBpXl4bqDkh9r/vtvCQHUkfSMvWXX4zwC3Na3005MjFt
	t33bpbLTD3A4a6UKWSAqFxMQvxQCWOiiPDVeV5oO8rfccxM2BqKdwEcloE6/DVE2QHl17aJ577U
	EqCv3DXFLg+Z5e8adXKd2bejVbxQb+g7yBXz17qz5eMk2YgHjkPA8Mv6+ckpIPGMvZgFiOA8ejL
	Kvr+w72Fksgia2qUSk9tAQ9BEczefWZLglPrMV2qMAPkX+qHTXZwuYTM6Nqvk7twUKU4esidJSJ
	VQ4sQRq7O7w8o1dwFfwyzVbPS0O6gW7g9JAH81lPmJXYEkaBxCMmEo1FyCdFLhrA9nKrR/NfUq4
	cEWDyo2sNPTqaeShaUCXodmxM67JJHyDZmnrsRkYquG4YMiYJOnSEEP+86PEOoquGXSpOykKr/j
	tje1yiDfKToWT0dqXawxalWEPOAWg+YxMpZxydcUCtYyvGmDW6yB3UfWNIZv3hWuKtUkT7hoJsB
	glqeyFNTPLqxY
X-Received: by 2002:a05:701b:290a:b0:127:def:dd72 with SMTP id a92af1059eb24-1b5030f8a7dmr3059602c88.2.1794571299135;
        Fri, 13 Nov 2026 04:01:39 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm11650418c88.3.2026.11.13.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:01:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Helen Koike <helen.fornazier@gmail.com>, 
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Nhat Pham <nphamcs@gmail.com>
In-Reply-To: <avZyo_hCRonuhXW6@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
 <avZyo_hCRonuhXW6@google.com>
Date: Fri, 13 Nov 2026 20:01:28 +0800
Message-Id: <179457128804.2142163.14813125534208665209.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-13 11:19 +0900, Sergey Senozhatsky wrote:
> On (26/11/11 20:41), Xueyuan Chen wrote:
> [..]
> > diff --git a/Documentation/mm/zsmalloc.rst b/Documentation/mm/zsmalloc.rst
> > index d2bbecd78e14..4c0786378dc3 100644
> > --- a/Documentation/mm/zsmalloc.rst
> > +++ b/Documentation/mm/zsmalloc.rst
> > @@ -33,8 +33,8 @@ proper handle-based APIs.
> >  stat
> >  ====
> >  
> > -With CONFIG_ZSMALLOC_STAT, we could see zsmalloc internal information via
> > -``/sys/kernel/debug/zsmalloc/<user name>``. Here is a sample of stat output::
> > +With CONFIG_DEBUG_FS, we could see zsmalloc internal information via
> > +``/sys/kernel/debug/zsmalloc/<pool-name>``. Here is a sample of stat output::
> 
> While we are at it,
> We use zramX throughout Documentation/admin-guide/blockdev/zram.rst
> and in some other files as well.  So let's just replace user/pool name
> with
> 
> 	/sys/kernel/debug/zsmalloc/zramX/classes
Zswap has its own zsmalloc pool too. How about this?

	/sys/kernel/debug/zsmalloc/{zramX,zswapX}/classes
> 
> Here and in the Chinese translation.
> 
> 


