Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC204A3F1B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466799; cv=none; b=uNkvSgFKtqHyCmRxi0FctL6n4X8TT7VmNnLTtbLjDZAK0rJoJdSFAeHWhJwFTClOS5XLmURoWguOPeCFFylPoRy5b4NNm0/oyCQYvFchmKChidH1NqEtLY11CLzixo8A5nb42X2xSTCYI0ZpzCgmSC/fD8IfWXignyvBz/ONAnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466799; c=relaxed/simple;
	bh=/edKydgE0ASRsmNUE7Awh0WwhPJYFGzeFnAV4oiXyMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyDKUSenT0NCvumvwM6nlJVHn8+Ua0fArosEkFvkkFsvLyZZAVoI9/DnLB+SEmRYaaiZ01/qJTVrR9UyxrOYOATHJjl8Dhx2lUJ6fvvG2v4V8y9PKLxMBmLxSg7C2LaIr7mNTRjoIVeT+zQrKK0nSfedoT+h7MSVwTuSrfyz5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CETfW18i; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CETfW18i"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0759so2486166f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791466795; x=1792071595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XAQp5sjUTnBYVb7nczR4LRPTFMERYXhCXB9dzgexKM=;
        b=CETfW18iIM/rdQ55AQXD7YxxOlTpKI5IyF5Vw1EfWzkhl8B7rHp6MzpqLOgvbuav/1
         KlJ8icgw6NQpcWvSxab6apSH8z0+vNIWTWv/ZZrv++CIWxJTr9KX3uhokNXTrvDtVW3X
         U/nckUZU8Jij4jjXmTFJGz+rtOqlCAHxLGBZHU6C9/Dxg0dltCQ88TfBHmLS0b2yHviB
         7k14+ltDCWpWmVOh/b76ehVDgt5PJqf4PxJaU3I8tEWJpIqaxWOUbCSybDNwiWiquC+g
         1GLdlIgJQw08+4gFLYVpPc9CBl0Q3M2f5EZXFGcyDm6690fRXFG6eLnJ35rWd4I7nwGj
         cmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466795; x=1792071595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XAQp5sjUTnBYVb7nczR4LRPTFMERYXhCXB9dzgexKM=;
        b=RxwmSXYlJasKbb9tnQ3w5srxrMNRl9NujYwmgI+HFuXpCLp6xsau+XosvQU29/gpND
         9KwQQeuAQkV4kqR6FP7Mk78Jt1z/18jR/cIlVo1PcCgPe4emzTQKxPVegLrrUM1ZPgyb
         x0w4kCuhYBmYx3e/skNmWbYaonrzD/fhoDavFfbfT69Z+N/oFKI1Q7/WPmcrr4DnzCAF
         HO8F4wBSp12KgPfh+pFBYu2pnK4k463z1S86H+0vV/PInm965rwOubNy2Iu1SwXejmWQ
         H1s2ZqT9e6kPIgrP0wEthvlFsvHajau5ez9Nv/QBa6KpLgWjWilp5q8GUwhJOQZquOpq
         wPUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzw4kIaXOlvZI2Mk7bJR/Yz/Gwy8RVwEbFdv52y+MBMrq613ZW6SsYKcHVDxEC6Mdsp3C3Ox2eH5cE2bmo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJr6zeZGYJEUT7UyIvAQtWA/4xJ1EaZ+iXjimtsNppt9anfOEa
	5vakCEfjAfXqPGgmZUquouFUjBxC2VVejQxjn2JYasGTx4A/z0uX0RibdU4wCFkAw+I=
X-Gm-Gg: AYBFou04aL+omS3+Xy4BSNJlfYv+fkMPHxTRquvSmo8O/xPX0eu9wdGOH0PkxXqAafd
	KuvmDPBTLRnTYq46Je8bH9+InP10XMgmxDfIKNS/9svXgIS4Xw6RRzwEjn8QPHjj4h3QnSz7JWY
	pF39pjmGcWbR5VmTK2hOeP2F5f2sf8JtG060NREpQ4q2TgM5gecmoVXNCSpd/zM+EEmY+8akpno
	aWOwzNfHQTBRwMgrLwTVRUy+00o6Xu6vlgyFmmefiKE/zCOq1TrnZvn1xX8NVgglcn1bvBeQUaL
	C0cuID9S8m/59Ycmj59srBwLPYUUuA3U8BZjnfO/RMyw8wpDv+Q+IAqrNsAlWnmeASObhLTInX5
	8yUOowFrWmBEtUyCOmQEL7vlSEufD9FQBrESz2naCrA2y0sluOSIjSX5wkmoZvYjWFsllP/X/oh
	1plPdvpOHOUDk+sXE4RTaosH+A3MTZZ3YSDDIfN8tLYDoVuR1f9QwoAujO1cy4t1BceLsQZ6/Wi
	nyban4RFvTzWxOwkcN/4/mfPC9EcIMqWwQxK6Tf8GvwLw==
X-Received: by 2002:a05:6000:613:b0:487:981:4df5 with SMTP id ffacd0b85a97d-48c7275b5a3mr9367282f8f.14.1791466794666;
        Thu, 08 Oct 2026 06:39:54 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm11292042f8f.38.2026.10.08.06.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:39:54 -0700 (PDT)
Message-ID: <92d5ec39-6a0e-437e-a03d-b1d2c0ec24cb@suse.com>
Date: Thu, 8 Oct 2026 15:39:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
 users@kernel.org
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 2:51 PM, Konstantin Ryabitsev wrote:
> THE REST matches every file in the tree via "F: *" and "F: */", so
> get_maintainer.pl currently adds linux-kernel@vger.kernel.org to every
> patch, regardless of whether the touched files already belong to a
> subsystem with its own mailing list.
> 
> Only add THE REST for a file when no other matching section provides a
> mailing list for it. Files that match no section, or only sections
> without an L: entry, still fall back to THE REST, so every patch keeps
> reaching at least one public list.
> 
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> ---
> LKML has become mostly a firehose of patches that are already going to a
> subsystem list. The reason is THE REST: it matches every file in the
> tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> single patch. During the week of Oct 1-7, 2026:
> 
>   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
>     sent to at least one other list;
>   - with ~2,100 subscribers, that is about 29 million deliveries per
>     week for LKML alone.
> 
> This issue came up during the 2026 Maintainer Summit and the consensus
> was that "always include linux-kernel for every patch" was never the
> intent.
> 
> This patch makes THE REST a fallback as initially intended: it is only
> added for a file when no other matching MAINTAINERS section provides a
> mailing list for it.

Documentation/process/submitting-patches.rst currently says:

| linux-kernel@vger.kernel.org should be used by default for all patches, but the
| volume on that list has caused a number of developers to tune it out.  Please
| do not spam unrelated lists and unrelated people, though.

If the behavior of scripts/get_maintainer.pl is changed, it would be
good to update this documentation accordingly, possibly by simply
reverting commit 77167b966b7e ("docs: submitting-patches: clarify the
role of LKML").

-- 
Thanks,
Petr
