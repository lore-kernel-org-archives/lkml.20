Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B80843637C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033701; cv=pass; b=pobA32HegaPu1akCA0oQ/TM2pdDtq1PfjvjP51VP09nUmskszyXLom/s81NG40bVvR1BmDvPNXvlbcARngsfs57E8zLTMrC/uHVp3MBtS3jaQX50iKqvI2tTa2YjKiefCD8wfYomyOA2UN4YbsMC+h5IW4L87jI/pYWWWI+DTP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033701; c=relaxed/simple;
	bh=sxVdzkqUKmgN4f+qWxZ2zsOjbna5V29vqf/tedxT+VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JWdOFiVWfrKa4Cn+8XbSfSmIGSUqcU20GiOOhdR5KcWFSR17xcl0yhhdpBvGGgHtnKBFPoOExtd/MIX2rwQRMteNwf/YeTZIkwgg6SSj1Na4AVLViJdZJKxrY8pk22uqBUgQ3ffhE796LXE4gStB1E2yxGHp+OxRuTcxY1lcsak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NBJR4xPt; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NBJR4xPt"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so2328a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790033696; cv=none;
        d=google.com; s=arc-20260327;
        b=iwMMIFE6PKFeK57PI7ZL991Z4zYRLO6ewCK39G44PbWKH4QJTrmRe33OXfJcCA75fm
         hfqCTveE1lUaB+XlwqEtV5idZJSMLABIDGF4fdcVB1At4rSGWZoIcvEdMEXrx9l018VQ
         DYUQHFjJSZtWpsLyubpaam33/kJ5/pgPAv9pYxP/IhR4GtQknSr++svr7Zm7H3XaCX74
         aSDTRYLBan3yFIPoySBSzSVrvKFdGhkzeU0AWeNMHWRbjoD6fe2iRMnhTgvPBVS1SyvS
         5hxgerBCEnGkTEsRgO74bzCERlKwHihBdjkPgbKAc6OWNNq6SpV+ufxah8sVvDeCjH6I
         2FZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxVdzkqUKmgN4f+qWxZ2zsOjbna5V29vqf/tedxT+VA=;
        fh=T72e2davJmzctkh9mqkTvl2sLKH8uHmD9qzJV2aVw4M=;
        b=pqJF2BkAYo5kgpth8ZhboODCsSMVPvaZ2Stn68r+O7Gle31Fn//XxUBaW0QIfZ6hiF
         U89KjYpAJbOQ0o0k8sV+lqEYoTDVOJH8bTtQ4h2R71t7Qhg44l1ts+efQ9BPwDxpRlga
         djhBzkvSALYYoVWDMcQuvTSFBkUUgAVId7tE6Pl2PtBGlj3Y0G5ZadUPPaxO0WTzhESG
         rWZm8oTAyqA9/pH0O8DQLS43tm0O4OJESQd4lnwqjPILOUWw+KwbZEGDwHkTAzukKhcJ
         va6wKd7MXYBk82vL55Lh9vHEE6827xfIEdrD5M17sbLqiLYh8A4TjB4dXhHqsDLUlrcd
         IKdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790033696; x=1790638496; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxVdzkqUKmgN4f+qWxZ2zsOjbna5V29vqf/tedxT+VA=;
        b=NBJR4xPt942hts7pvdHW48X3SWxgYnDMwQ4s6BqJGk0h80PC8M5jHLmvxMSkkYtXHA
         6kP6vmVoTUiKPm0eS0TZrl5VN9oc0986EYK9bhKzW5LvW7gcHE3jKS1LY0tmYr4OV8n2
         SVXMjymgBtUgikhK06pYQhVgK3d1sbt6ugQpm2kJH0puMeGP88ry3J0bZKaNJoyYc6U2
         WEkQ3IUMDrOM1bTPMuumkCE+qbSy3/kFPADTc9r8upIwUg8hVlMmwUeBnBcE8A3tbETr
         +waznWlkqY5AT8daALYFk88nosNsAjfgFfAFGC4Q6rE2wvQD7uHaiwDOB0/Oj8dF5Ntl
         x1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790033696; x=1790638496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxVdzkqUKmgN4f+qWxZ2zsOjbna5V29vqf/tedxT+VA=;
        b=dpmd5us0xUVqTVxNrDKKryJ4Yybrikge+jZq6wtTAWYxxDg1g7Dsa9rhBKbua8/hAZ
         Uv1936sgni22yn8ti8oJnkMCoM1mormLWYPFOqSrRLyZDsfpOTEEVBE2HubobLHi7wx8
         bCxY7SKV/CoTr2D5BjOqKbr1oFGoeIt2n/X+Syy/AYqxcOyZoCOHoIZvfbUG6ZfouvQX
         8P23+NhiE+LPoHViOYmspPit94SCv9Snu7k2y2nsxAPmdc48g1AIwJl7gd0esHF+nNbA
         ttDJlxJ4OFoJEQDXvfv8XZWpM2Aol25a04O9P7X97VAgZE1bPDkEeEIvS59HuGAQhHEG
         jo6A==
X-Forwarded-Encrypted: i=1; AKwUvBxSqtBsX14CUYBy0Nxmwc05f1tkltg3CKwpu74w9eGpbr99gRbagxxdupn3vnie+1WpAgbUHegH4NoKhU0=@vger.kernel.org
X-Gm-Message-State: AFuF++m1b5kPAub1o1ry9wZr5wFwgmqhHXjHqO3aQq2YLPOCKGz7cXmM
	GTCno/orGa6oqJTt8TxtD9Zt9/WDEE53Jpj0G5IMpuvd1pQnUZj8UTdRYJ/pZT9EwRqsTn791eD
	+LXstcW26hlBtNy31jpOC0Svrf8st6ApQYxIX5X83
X-Gm-Gg: AYBFou0G9CqB+Qq+MdJv2sm1jI1PWN3zgvWBkL2gHVbWZhXtULzVwAjyvCnsaDFoWgk
	qOqfO1St9wsKRer0CMRCt8RPhjAeOtIVfp/kgU0wcFfLSZCVnghXyMyIrhmOIJndbB+fyme0PAP
	6Xi9qwrlkJoX43+kVsrPhp8jC++npWB2qOqrCSWoW61inDA+CMP5OCisoFPo/7iJW+6XyGE9U4y
	1koArznq0TLveTOkOjqJXgabJ+R8gDiUZJs5LwwzAL3URvZl+83I+yYa0Y/TaB4qdSO8k6TSBQi
	zRPemfLxMz2yYr0RV4JDVPODRYImnTFJtO2ob1evY724WQ/9XLZhu7dEuA==
X-Received: by 2002:a05:6402:b03:b0:6a9:f353:ef65 with SMTP id
 4fb4d7f45d1cf-6aaa3285086mr5729a12.5.1790033695802; Mon, 21 Sep 2026 16:34:55
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917181116.3319017-1-sdf@fomichev.me> <20260917181116.3319017-2-sdf@fomichev.me>
In-Reply-To: <20260917181116.3319017-2-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 21 Sep 2026 16:34:44 -0700
X-Gm-Features: AcwNN1WmRZwcqYEGOUzFgTIvMnbXviLLn9H3D7LnKrfzfpDlcqUx_C5C9_7JhxM
Message-ID: <CAHS8izNfDamSJEgn5D=VGDf0bZG+D_YMrMRmuK51kzV2ZyZC+Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/3] net: devmem: replace gen_pool with freelist
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, sdf@fomichev.me, 
	bobbyeshleman@meta.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 11:11=E2=80=AFAM Stanislav Fomichev
<sdf.kernel@gmail.com> wrote:
>
> devmem only needs fixed-size net_iov allocations for each dma-buf binding=
.
> The gen_pool tracks the same free set indirectly through DMA addresses,
> which makes devmem depend on the generic allocator even though the users
> are fixed-size net_iov chunks.
>
> Mirror the io_uring zcrx model more closely by keeping a binding-level
> freelist protected by spin_lock_bh(). Use a single net_iov_area owner for
> the binding, populate each net_iov's DMA address while walking the SG
> table, and check at teardown that all net_iovs have returned to the
> freelist.
>
> Validate the DMA-BUF size against the net_iov size up front and derive th=
e
> RX and TX entry count from it, avoiding a separate SG-table pass.
>
> Drop the NET_DEVMEM select of GENERIC_ALLOCATOR now that devmem no longer
> calls gen_pool APIs.
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Mina Almasry <almasrymina@google.com>
