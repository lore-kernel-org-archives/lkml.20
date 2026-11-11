Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393600;
	b=FPlW1mWt5R4rurFmkxUvFjwg8KscAuTBmLF/n/32tR1ALrNPCKD1i4/lYisIYKImVvI0
	 hqEw07nStZK4LyyG5D7yUPRSODgnp6yG3DfAVs/CSWdEcXNIcV3nkAPjp2BaRxu6vxQKR
	 fppUtD4tspg946xPq3rhzRjMvFn9UGGbMc6DGU63DCk7FUnj/Ctm6ap4AeglEnH98ajVE
	 JcDvZP9qR0EgKV6FZwPrBHyK6XfB1mtoT7G9lppVdoPuZE648C3jNW+LSKJlHT8SDvkwH
	 kzIEYIwf4u+3f1M/CGT335BLwXmyJTppxZUUrjTodlT1t6zNE/0F0A8b9t0+vF9wAlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vvw8pGMMvdXfl1xLQ0CKwozeJ7V4XtvlfJfweWh1jGU=;
	b=xHDgYEPLmVxgfBZzcCZZXWkgIXrM4eUjuUB1KE5BjjY9cvEPTwDPfohz/Wyw98A4DSSQ
	 sOi/ZQWCYQ5Zlx0R5c3c1l/nq5c+tHuGRpcvcI5CrOJRDw+Oi3hNbsvYGaM1Xqt+Lwmhv
	 T6/+d6ggJ5TibzWKwsxikw+Z0Zf8xSPMbFvPgXwKYANqW9o9X6RDWmjzr2ZYW2WdZvU5g
	 zZMx5EWk0zF+cJiMazsRsKgHDrGLShim4+dxR8zb8blQ6gdS4rv0VjtvP/MQ/RPCtzG6i
	 mifuAoleiZEiYR8eDa6glJ9xaiHSYCD2vpAqvNQeYZAz3/ZR/ZWtAgxbB6NdmK1+obg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Llq2Lcn/";
	arc=none smtp.remote-ip=74.125.227.202
Received: from mail-pi2-f10.google.com (mail-pi2-f10.google.com [74.125.227.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F1B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Llq2Lcn/
Received: by mail-pi2-f10.google.com with SMTP id 41be03b00d2f7-cd697a57d7eso802616a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794393600; x=1794998400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vvw8pGMMvdXfl1xLQ0CKwozeJ7V4XtvlfJfweWh1jGU=;
        b=Llq2Lcn/vNznSiMsjw6RIV6XAmAyscjREZS6RZieHhg2HctKZ9pBCE5g6LLzC8a5EI
         fUKJyMxmrHZGKkaXBQgc0ma7XaD72ZK2DEcYqxth9SoSeOvPumKknpMGNgtMqdTkXJZs
         LL8BRA5PZHi/Lgl2ud8IZY0dtI+V6A1sxuOD4bb5XDH1+k2X4tuEYeqsJv0kT28KeyQf
         6nla515WQBapbK38/Ywl5ebEwLQIjPfokDEHi+yjNVdhgg/THnEZELEeQQzIXZ8rIfjW
         u6hsCMnvybkcQY7hR/T6HXlzqJcSroHBLzcUnOJhXUTHKkvkfEasyk6Vm9AkzPRg0ey7
         qOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393600; x=1794998400;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vvw8pGMMvdXfl1xLQ0CKwozeJ7V4XtvlfJfweWh1jGU=;
        b=V7I4drX4CMFEer2cduCQX8KMJlD14HJHuRKJFFdmW/H2mjgx8Ba0C/wewD3pyiUES5
         h9WIt6O6bA7Kpu3rh2hXNKEyM/ExXD8BYdr8rzqL3Rcg8hbk2WPussAO0QJqeXY5w11q
         CTYwT1oFz5mQAyU5rT4BgugvCZ3dJFsBSUQSfB9eReIuo+BYBCVgld1jIZLK5qQs39NS
         F+/DPftOdfq0T6B2VgprHoLOPFwyZloBWu0NSynGtgWTD6XzoPAvynEV9jQekHgazHLQ
         c+wvuMDJFBBQWItglWxRFWjZA4mqEcARXMEXp7xJZYojalswrXWoPDcG/6osNnwnMfVR
         f/QQ==
X-Forwarded-Encrypted: i=1; AL+hErHfd4O30gpZR1KsROxOqBmCtLWqcili5R+Jtmi+IMB5I5gnxZq8tZWOzGXw+lLHDBJm2LhwebD1E+V1X+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X9VRSU46dJicvRtK9bc0UM3N/hd4ruF4B21LX4o+WLMxIG6uD
	PAW/Q00vlSp2y0LyRCNtpDj8YOqi6b2Tq5/ih+RkHcMFO7LuNm0moPlo
X-Gm-Gg: AYBFou3luBJedHia6TQ9wqsob0nLzNW/FDaISb3C5xJibBrOuds0zxzA4qmq34B1v8g
	COvS5XKv/njpGCNBMphvVSdpyPercwJCyBHizgo1LCGdf6YO3VhK+iYupLME5qV0HEdJ07ktZKc
	KRhX/sl2V006kF0kF4DTYGhaREWrDfsav/IYpzmgEmQAJvdJpZfcVusNMPHmI4t98+FDpRhw+oQ
	emF3ZCuzS7VDgVDJ7/If6EH7DwXjg2lmOpRPp2c5xGd3EpYD4x6gl7SAFnUYKDOqIaXXWQLc0Cx
	9zpTOl+M3We0TAFD1jciiSFDL0M8LPKyoiMcfU0EciHsdxMy5dX0AR5jnzb5HKEBKDq8ZANI7P/
	i/qSzfpB+KgpNv4l9au5vWRMje9zb1JyYsKU1xmfFDcXSmUbG3xZFUy/r1fjNH4kK/rD+aalDft
	r7+mNYkGqfmrR8HMpcNO3eUr+6rt3q9WynuhUvx7Itla+ahhr44AwIAfOD8kiPyN3CdA29AZVGe
	C7jkthPHGCGzI4lLHKSK//qJgRqYbWDy238AnCCAjrua1YPbQeRAIgEPOsr83M6TEMEDI+lKDRP
	iGYyIxTt32dbyFKYvCU3fp6FwjMsgsdlniU1A1kYJatPVokPqZy2dz045SHKPdNy4dU=
X-Received: by 2002:a05:6a00:3022:b0:882:6d80:e5ad with SMTP id d2e1a72fcca58-8bc1c4999edmr1960515b3a.9.1794393599641;
        Wed, 11 Nov 2026 02:39:59 -0800 (PST)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm2065878b3a.41.2026.11.11.02.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:39:59 -0800 (PST)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: Daeho Jeong <daehojeong@google.com>
Cc: Nanzhe Zhao <nzzhao.sigma@gmail.com>,
	Daeho Jeong <daeho43@gmail.com>,
	Chao Yu <chao@kernel.org>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH 03/20] f2fs: extend f2fs_folio_state for subpage blocks
Date: Wed, 11 Nov 2026 18:39:42 +0800
Message-ID: <20261111103947.3560570-1-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CACOAw_ypOkWNWW8=8fn8gmnWnwrFDENYCHT-mXKjSEOL-UCYZg@mail.gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com> <20261102193952.3002018-4-daeho43@gmail.com> <b3c98bba-69c8-4350-a9eb-0942be336f93@kernel.org> <CACOAw_ypOkWNWW8=8fn8gmnWnwrFDENYCHT-mXKjSEOL-UCYZg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Daeho,

> - Make the uptodate and dirty helpers take block indices. Allocate the
>   state on demand with __GFP_NOFAIL, so callers no longer handle an
>   allocation failure.

I remember you raised this concern when reviewing the large-folio series [1]:

> I understand it is used to avoid failing in-flight I/O or writeback
> when allocating the subpage state. However, invoking __GFP_NOFAIL in
> memory reclaim/writeback paths risks OOM livelocks under extreme
> memory pressure.
>
> Ideally, we should ensure ffs is always pre-allocated during
> write_begin() and page_mkwrite() (where returning -ENOMEM to userspace
> is safe), so that the writeback path never has to allocate ffs on the
> fly with __GFP_NOFAIL.

[1] https://lore.kernel.org/linux-f2fs-devel/CACOAw_zD_a32UCJZ+F7zD61o0K8QAh7QKJVuag4fm98qWy7SRQ@mail.gmail.com/

Now this patch uses GFP_NOIO | __GFP_NOFAIL again. May I ask why we changed
back? Is the livelock concern no longer applicable with the
subpage-block design?

Also, please note the warning reported by the kernel test robot
(lkp@intel.com):

https://lore.kernel.org/linux-f2fs-devel/202611050144.47BOVak5-lkp@intel.com/

It reports:

  fs/f2fs/data.c:5196:34: warning: variable 'ffs' set but not used

in prepare_large_folio_write_begin(). This appeared after the
`if (!ffs) return -ENOMEM;` check was removed in this patch. Could you
please take a look and let me know if you need me to send a fix patch?

Thanks,
Nanzhe
