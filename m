Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974359;
	b=D1ybuN5+ThypufYFcZu5hYbeVvys8kCnpfdIxSXfGGwGPjNpjHdONDNLa1BFLW7eF4Zy
	 v4bnEeGFcIx6sRYSndYKdN3Zk2OQXG3R0jwXG3vpAlA2VTnaeGBOH3R2K5ItvfWiuG8CY
	 BxAOksSSbVX6q7BUErutwNqMrLAaUUUv6nE6cQDaO6jqJMPwFr1MwGhNJXmRkpMco1bSb
	 2SxJegMiyi0tzM+aHtNaLYe5pZgsg9ZH5nbx3xMIyYYjOJbukotxYAeWa7I8I09614EHW
	 woWKCfDkj115YEr/5s5NI1SlMZCDgCpz1Ow540F7BSZWw6nrgOKN2GFRZ0TmWrGjuIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974359;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Hy9Nb6PTTUob6aohVhlErbLUpEbw+NLmXu1l6Sjgt7M=;
	b=B+fnj7ifxfM+DLDnbAvegeQMMHwCvmLDMLOt/zfgQtkPdCVXnePsuHD7qv6Tw6Y4sQc3
	 098tih5e9PYusuTIh48Y+8sKYSnlTgC+TbAmDvGK6HRSD1cT2NPk3DcdX/3JXDvcdqZTS
	 ySUC5Ch0ncaB1MFFLUUAm9OSvaL7YHNd78eeywSpMh8orWWh4UebBAeCj08qWTk/GM0tA
	 VOVunrowsxIz2Ab9sk7JNgiweVl6Sdy3MSR6efnBJ3TYACnva+0ih2hzzOdv3SMxhmZXk
	 f7kR6c4c2eVnQK3dOEMJJKCuf8z4IwlAyyjg6MwYhlqRfInsYwPCIAizSi96GjMJCVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzH98RjQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2B3606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TzH98RjQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57BBF1F0089F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974359;
	bh=Hy9Nb6PTTUob6aohVhlErbLUpEbw+NLmXu1l6Sjgt7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TzH98RjQsHDOqeXhw7sIiddkbUl76gvevZ2XcY843kQ1SCq5N8euopxVsRxB9TIAe
	 rwaJf+Rut6RsXnRzA28n5d0Hr4+eMNEjyAnfLRu4UShUUAN/jwWKql4t47hRzpu6DO
	 Em3hWPDhvGt3eDEUiZv0euYdchAOf1WS15AgvkKqWIt8rUwgFO20KjGBGOyHxT7QeT
	 T/1dxLzTDMJZ4iJXCwp8JbYF/mKTSaTDlbBWXOI9h/pdSkxpvjI5Bz+CeW5njrLrxr
	 3L6XLS4cEveqTNRoakjgnBrNH55we73pSdMmq7UjiIHYzhXfsOpan383dscrdzvQxl
	 /OOvDsNFsoWnw==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67921b515a7so648323d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:12:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFKY7khSmlMh22psbu+TsRX4QoXEbMuqoCxf0561SvGTX2qDncARd9jjl6MJYIfNgtcS9ufeGhXmTSGnag=@vger.kernel.org
X-Gm-Message-State: APuU4Z8M1D1IhlUoy6NvxbyRM9Vz8muHjguKL1468DRMXvKeYxDLTqZ0
	JPeXIUW+dyoHmKt9Yn9SAXhUfdrmxTYU6SPbcN2ns0gIOOtMyhWuSldJw5TEYvgWutL67hH4KLm
	7SvgZafssJq/kp1Y6vDQcluMC7+4Xt7k=
X-Received: by 2002:a53:e808:0:b0:67c:11a9:bbfe with SMTP id
 956f58d0204a3-67c142c4275mr1111242d50.20.1793974358607; Fri, 06 Nov 2026
 06:12:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106124553.2617026-4-wahidzk0091@gmail.com> <20261106133110.2659482-1-wahidzk0091@gmail.com>
In-Reply-To: <20261106133110.2659482-1-wahidzk0091@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 6 Nov 2026 23:12:21 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
X-Gm-Features: AclHuK_T2DQUMc0OEmrubLWb5yXs7ugphPBK2FPnifKmAkfBBAp1bb89FaW0bos
Message-ID: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ntfs: do not convert a named $DATA stream when
 making room in a record
To: Wahid Khan <wahidzk0091@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, ntfs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:31=E2=80=AFPM Wahid Khan <wahidzk0091@gmail.com> =
wrote:
>
> Hi Namjae,
Hi Wahid,
>
> The Sashiko review of 3/3 also suggests skipping every AT_DATA
> attribute in this loop, not only the named ones. I'd keep the unnamed
> case as it is, for three reasons:
>
> - Converting the unnamed $DATA from this loop is what the loop already
>   did before the patch. The patch only stops it from pairing the length
>   of a named stream with the unnamed inode.
>
> - The lock order the review points at (mrec_lock held while
>   ntfs_attr_make_non_resident() locks folio 0) is the same one used by
>   the direct conversion near the top of ntfs_resident_attr_resize(),
>   before the loop. So it is not specific to the loop.
>
> - When an EA or a stream grows in a full record, converting the unnamed
>   $DATA is what frees the space. Skipping all of $DATA would turn those
>   writes into failures.
>
> If you'd rather drop the unnamed case from the loop too, I can send
> that as a separate patch so the two changes can be judged on their own.
I think making the lock ordering consistent and using ntfs_attr_iget()
for named $DATA would be the right approach. Please check it if you
have the time.
Thanks for the patches!
