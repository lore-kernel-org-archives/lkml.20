Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228829;
	b=u4ymCVrGph9ORnOVroWmsfrfBs39K0/R0HiyrNNNhCKctWlfOZKRQmyjERK0DK3/YQiZ
	 Qlns2aqPDQaGTMCj9ZuALvAtPE1Y6Vd/Sf1L1yO+pGoVYBCjHO7W9MnwC4vKCLQ0KY+FM
	 0PxxptuA2h0rBjkykzYUE24TOfCcojucvo7a6YvDpe4hHtany6fU3ng95sfcqYPTXFYyv
	 EkCT5DHG2v62lf8GIs/uxQyJJLBG9hdPd95e2kNeSbbtFHdnj3XG+TEJ+uUOlNYWPDeWk
	 8dFf7EAISFYPp8baxrPNIBySmOIMbwwZFiAzLbUmAIx3giKxySBPzcW3Vdl6zM9YKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228829;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=xsolfVVWbRORmL7YZZKbpcvUqqBN4m/xr4JBostwKXI=;
	b=B5+Q+nbnbDkd+uIpaqVKnWTA+zLTlMY9MxyoVrfOd0xF5Ti2zvQ8FPZZPzHRdse6w+O7
	 t3ni3Hiak+ymvxTaxExzzJtfTcbs9Uy+O8zsi5k81JXx9Xn6gnM2D9jk7yyju4Vcl/bxe
	 zCjXVgfl9KyySVRmKKkWCcVRN+8PI/RLq1PBXCa0RV6oiFtFXZTmktxmzwLVwgiKedwln
	 BOm6FO1D7F4GkosX0n3nLhcHCGbclhb7+iXrxooMctKMckJxy8lhv/rmDm9bCyjX7k43x
	 pmh8vb4kpYch2oXgg1XJt0hdSnKXx5jjkrNNDIikzf3cYr+4N6AABtpw7Bzf3blImnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="oHo/w0EN";
	arc=none smtp.remote-ip=95.215.58.156
Received: from mta1.migadu.com (out-156.mta1.migadu.com [95.215.58.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C0A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=oHo/w0EN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xsolfVVWbRORmL7YZZKbpcvUqqBN4m/xr4JBostwKXI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794228825; v=1; x=1794833625;
 b=oHo/w0ENHT9PqYRFCuvWoQ+lJ9P+MW9JqH5Tr2gdVZNzVo9DQkxv7JHsymdw9jvx0ysu2u8z
 SqERQOrULLf5ynVDOAZt9xK3+u7IdT3TXkMZJZWZahvgar6Juu/8ukt8cW+tDrbedqd/gshOYfy
 5ga+HOz0JVGBtuqMbhK4ZPvs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 30f075db220b9c31;
	Mon, 09 Nov 2026 12:53:45 +0000
X-Mizu-Trace-ID: 30f075db220b9c31
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so3190e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:53:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFH6z77iY32MzJp+IwOsa634NNYyA+2CvBS74e5k6ATottmGR5CMwCyGwm668Am3QorW+zz4d5CtbhvL+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z81d6N/8z793bxsxww+nJT5qa+NGa0BgR43/SjuEASGlLdoz8iQ
	GvM8/8MJCIGB7KHSGO/7wYf1HkZKthMxUFERBCsqWG93Bje3IMhkGn8klJ/ZAagsuID459WePv8
	K7vLojt87qpyoFIfOr8yD5Zw6NzkpKELqGALPI1S3
X-Received: by 2002:a05:6512:1296:b0:5bf:f060:c0f3 with SMTP id
 2adb3069b0e04-5c00bd5d693mr185283e87.12.1794228823188; Mon, 09 Nov 2026
 04:53:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108200141.383158-1-fuad.tabba@linux.dev> <20261108200141.383158-2-fuad.tabba@linux.dev>
 <87ld72f9rf.fsf@mail.parknet.co.jp>
In-Reply-To: <87ld72f9rf.fsf@mail.parknet.co.jp>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 9 Nov 2026 12:53:06 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyouGHwy4nYAfGuNeMp6NXhhatNp2ambAzdQMxv0AXp_A@mail.gmail.com>
X-Gm-Features: AclHuK_ZmCOyHXfQ_oS5KSMvwNHpXLhELyCWXJ7DxRnrCffbYDVqCAYceYWYm1o
Message-ID: <CA+EHjTyouGHwy4nYAfGuNeMp6NXhhatNp2ambAzdQMxv0AXp_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] fs/nls: Add codepage 720 (Arabic)
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 12:51, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> wrote:
>
> Fuad Tabba <fuad.tabba@linux.dev> writes:
>
> > FAT stores short names in the OEM code page of the system that wrote
> > them, and the OEM code page of Arabic Windows is 720. The kernel's only
> > DOS code page for Arabic is cp864, so mounting such a volume with
> > codepage=720 fails with "codepage cp720 not found".
> >
> > Add nls_cp720 behind NLS_CODEPAGE_720, with tables generated by a
> > script from Microsoft's code page 720 table, as ICU's windows-720-2000
> > mapping carries it. That table maps 0x80, 0x81, 0x84, 0x86 and
> > 0x8d-0x90 to C1 controls, and those eight bytes are left unassigned, as
> > ICU's ibm-720 mapping leaves them.
> >
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
>
> Looks good. However, maybe no maintainer in this area, so I'm not sure
> who handle...

I was wondering the same thing :)

Thanks,
/fuad
