Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794432470;
	b=PmYDGSdAZn/siYiUnEt9whBtZC/HmV6w0zkUv0GjGC5alSEg2RT+y8djuY687lHVmTHw
	 f9Xn0BWX8mA7H+89xAKwsEva4tMnPKKDybwiU5+iDlldP8EYZMLbt5PdWJ3keTO5lM822
	 EA3Lx30neUolMID6jktdvzrppNvwvlVUmi5YxebiAiyk989MI8loq1sO4U2BNEiD4Ynjk
	 LgMIG1oALV9T6lyD6w0DlBeHraJG++GAXxjETre4+7Yza83BaUusqnFs+GVxdIGuK+gTj
	 K9G6Hs/s9931Hepe+kcCZ0DaA4viFWvF+Cra49hvyKJpY1lkQeONtdK+s9IVdJaSouQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aLuN5oKQufqiM+Zk/c+lXYNiAxXZh/RaJZ1xmrkPNfY=;
	b=NJrW1LVJq9wmOf+4JlarvxqaQaRgxHa6KpkzBhVvyax8SFj2YAtvdaZ8Kdpnyd7RxsUd
	 6cYPkHLwkygEaz0KO2yiW40EVUVqUk/YTldd+34+P3Ve9/QKj6AT1twTGAAf05uES4Gb9
	 XxIeziBVQjBpUIvePS7wAF8ePQwzD3VxZ/1OOoR7M5eS8OFTdoMxfqhDRdrQ9c799gD/p
	 m3g4B71QcdOFp9vCWzfelDXZ8d8nmIp2SV2HYPelR01CAMhs7ENis1N1m4f3T5HaYKNdI
	 D06lRThe/7FhzyEzmyOt8gbPJoRUabhKnHaoaujOJBs5U3b01hvZUZTtWhMUZLSAdGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzaq9s2L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DBA8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzaq9s2L
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3aca0bf7fd0so26560201fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:27:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794432468; cv=none;
        d=google.com; s=arc-20260327;
        b=aGxVrFa4xE+ftt1yQUOFDnYqnkuldhDMSs1bTAKm3QTO6E+qbWVWiQpx1lCix8LCOQ
         /s68f4YOFnxfmsp/PXQUr75pxQV75enrtb4QimupAy5x6MggMPYau5hvAwqUHQbVE4pk
         jESkRXR7iUsiQq9SXZdsE4CJx9WK/tTHBrbY7yVj3s+e670Ghdb3iLKqKkEePdb6P7kg
         FlW7xul99il6iivVgh8srNr6DxonbJEZUfBXKXTvXgVxJsSjt5oGtU6AYXviUfoPytFS
         f8QgcbO3Ut1ln+LVMhqisBDnv1i8W/gkS8BI/L76LEtCeKhDEItXiAR/ovTNQ5tGFSQC
         s3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLuN5oKQufqiM+Zk/c+lXYNiAxXZh/RaJZ1xmrkPNfY=;
        fh=xKfmLzUMdgTMCzRJBP0GGRIP90NEZjbqD2IeL4otFZ8=;
        b=g0IxVAqaQvIZ9wHzy27gAFzmSIUyXOCX5eBm2iQBhVFEqKmZ+Z9LeXmNApcK4HgUKh
         lyb3lIDcp6nX7Ta76Px5pKM8MyXEdXxKf/+W1FoykTF/7pXuCdjI7pA2UIODSTD0JZhP
         +a6RZjWFFQ2l/D/jHlXXfu10jBtH79TknAguVTePDoMwKS6oVLGvDzSq+6xylVVi1Kss
         QZ9KWchNh4I5tU8aMRvhistA01fdRja7HqVrwuj9mCzoNvgJg0QXNn5jK9DdItXMoKSc
         wJYFp95zpL0KUdthr7zDiyPAaoxewapcyI0B8Sz8yBN4wT+e8RGJg2p8qcR6HRcyGyQb
         RJNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794432468; x=1795037268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLuN5oKQufqiM+Zk/c+lXYNiAxXZh/RaJZ1xmrkPNfY=;
        b=nzaq9s2LAS6g0jjG+PPbnUx9hl11EaMur0EYwYE+mWuB98sPIVtKP+gDajOJE4u+d5
         aT7p//o62/7OFg4rAuYHBMgu+9Wt3yE/09yHbD0vKRVnmrxSy/hctC/jukISS9tNuekb
         Jdvc9JhJMLYIqpY9AB1hrOU8zPdh3XLpNPldTBlWdayxotrTqI8xGRn6rRGr0yOYcb0Y
         qcgx0qpc9xF77inc83o5OokUYF/teuPG0xn2mj+sUKgJ+wx7SxO52LUTzoQECGQPxRWr
         pw1uT85kC8k7360/WZkECvUQ2nTsaRXlROwMvfM5B+mrBlhaU41eaSkUzQ8vkcxKfPeV
         NUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794432468; x=1795037268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLuN5oKQufqiM+Zk/c+lXYNiAxXZh/RaJZ1xmrkPNfY=;
        b=IOO/WQhwOoMVo0Fsd2VpWGSUafEvC/MdzyY1t5ml2qMED6FnIEb7A5h3+aUBXyGf6Z
         t8rb1QKN66R2E1sHEuxCcPK6Ec/N6rw0B/GokL3R5NDZFQTVx2a2nH/cQyhoiV8i2O4o
         W2h6WlE/6bSkWCgrdvYl+MlQtgCEX6aWqKlwU2MlHhLtuJAunWwBynyVmfdlQ+hWQVoY
         aMvRXku/e08Lipwc8hinQ2idq4i2ZDHl13vf/HwK7rm0bmsSQ9IZt9GTyQtsb8Z6tawF
         IaifYWwyKcGAtn3eogQaaqUQDh93Ql9YYdWxuueeSvw6xwBElbWOmA2u4lp4hckXBPSq
         nC2g==
X-Forwarded-Encrypted: i=1; AL+hErG8drw45OUrrbMCwihFLJwSN6dfxVZ+R3RIt0MZ8cppKZrSX7L3sNC0nXhQyxl7EgG12bC+bjX//PzHy2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rshTOL3NOD9xCM1yvIHWJg+lhWlmZe63GSwt3WNj3whFXtpsY
	X0V9BhaEAOGqCKtRruPQ3DI5SOuihF2wYgeA5GwdAzEoWvsy+qTb2zewAWH2dhBiPhorWvMPEpI
	eJXMy7jeLrmuBfe9EIpNvzU/ei8aPtDY=
X-Gm-Gg: AYBFou3GFJctlEUxLVlIYvcBXfH9g0PeWMjQWrViZ2VmPPXc6zgaIpxZ/t6s4FMIuyP
	QXNgojOdn6lFKNyNhRKAn7qKpcx92VSwRzsqsqE0DmBO8VkjTVKr5932YYnXZzslGHi4WSyI/Wb
	3pBmcUU7HAaghFCFl6xBXq9PR8mal6kAPgOnmvGTwhNqE6ZLsRgOLlnQQThWSlHCxPfAry4Q5Sn
	lfK1hwnUy54T27U+ZNiUfcUfJGOMb6PLMDWokDTw6btHXTj9orhqt2llXnIv/F64oVsgy4BmoZ2
	RuPTS6uRf+DHXwEY3gTPs6q8yEhzkkAMO7PNWp24oKLSmUvMKN1T8JJWKVdHPUbrvJMds/5DDx5
	3mcBLKr6r1Cgu7Ew3AHznJ5lcegQOwjkgJZuYlc7B6OCFHrUGacTuIAVJa18NKvuX5W2cqWHPAb
	IIFZz0jkqsko2EEv8f+sXmGzY3
X-Received: by 2002:a2e:a803:0:b0:3a5:dfd3:41b9 with SMTP id
 38308e7fff4ca-3ae12681cfbmr7144081fa.14.1794432467929; Wed, 11 Nov 2026
 13:27:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102193952.3002018-1-daeho43@gmail.com> <20261102193952.3002018-4-daeho43@gmail.com>
 <b3c98bba-69c8-4350-a9eb-0942be336f93@kernel.org> <CACOAw_ypOkWNWW8=8fn8gmnWnwrFDENYCHT-mXKjSEOL-UCYZg@mail.gmail.com>
 <20261111103947.3560570-1-nzzhao.sigma@gmail.com>
In-Reply-To: <20261111103947.3560570-1-nzzhao.sigma@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 11 Nov 2026 13:27:36 -0800
X-Gm-Features: AclHuK9auUWdrRWyc3gN9W3oAcV_VqBMD80KYSptwGEjRvbc9Rgeyxrbf4ewLT4
Message-ID: <CACOAw_yoyOFN0qJpSGLSesKpoJHqY3XnszVsQcSj48LamBP1zQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 03/20] f2fs: extend f2fs_folio_state for
 subpage blocks
To: Nanzhe Zhao <nzzhao.sigma@gmail.com>
Cc: Daeho Jeong <daehojeong@google.com>, Chao Yu <chao@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 2:40=E2=80=AFAM Nanzhe Zhao <nzzhao.sigma@gmail.com=
> wrote:
>
> Hi Daeho,
>
> > - Make the uptodate and dirty helpers take block indices. Allocate the
> >   state on demand with __GFP_NOFAIL, so callers no longer handle an
> >   allocation failure.
>
> I remember you raised this concern when reviewing the large-folio series =
[1]:
>
> > I understand it is used to avoid failing in-flight I/O or writeback
> > when allocating the subpage state. However, invoking __GFP_NOFAIL in
> > memory reclaim/writeback paths risks OOM livelocks under extreme
> > memory pressure.
> >
> > Ideally, we should ensure ffs is always pre-allocated during
> > write_begin() and page_mkwrite() (where returning -ENOMEM to userspace
> > is safe), so that the writeback path never has to allocate ffs on the
> > fly with __GFP_NOFAIL.
>
> [1] https://lore.kernel.org/linux-f2fs-devel/CACOAw_zD_a32UCJZ+F7zD61o0K8=
QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com/
>
> Now this patch uses GFP_NOIO | __GFP_NOFAIL again. May I ask why we chang=
ed
> back? Is the livelock concern no longer applicable with the
> subpage-block design?

Hi Nanzhe,

You're right, I changed it and should have explained why.

My earlier concern was about allocating the state in writeback. That is
still avoided: write_begin(), page_mkwrite() and GC attach the state
before a folio is dirtied, so writeback finds it already there. (v1
missed one compressed case. It is fixed in v2.)

The reason for __GFP_NOFAIL is different. With subpage blocks, every
folio with more than one block needs the state, including directory
folios. The helpers that mark blocks dirty or uptodate attach it when it
is missing, and some of their callers cannot return an error, e.g.
f2fs_set_link() and f2fs_delete_entry() are void. So the allocation does
not fail, like ifs_alloc() in iomap.

I will add this to the commit message in v2.

>
> Also, please note the warning reported by the kernel test robot
> (lkp@intel.com):
>
> https://lore.kernel.org/linux-f2fs-devel/202611050144.47BOVak5-lkp@intel.=
com/
>
> It reports:
>
>   fs/f2fs/data.c:5196:34: warning: variable 'ffs' set but not used

Thanks, I will fix it in v2.

>
> in prepare_large_folio_write_begin(). This appeared after the
> `if (!ffs) return -ENOMEM;` check was removed in this patch. Could you
> please take a look and let me know if you need me to send a fix patch?
>
> Thanks,
> Nanzhe
