Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670825;
	b=0ObW7+9Dhb+q72JXHZmCe0f3U4/NidyIWxrIyMdmG9WbNG94aOdF/+dxjdK07IDsClf0
	 IkM+Rf7Lt1NIaPtxPsD02TIzCD8dE18KEtt0p0pARBdNptDGybhe92ZY/+hYUwk+e8hi6
	 SZuNyldao/ASAAxj0AGEv36QfhDgD33PRhZ1libVRjowfd84qhdY9OzrwJCwcTfU7S1PG
	 ysJ1nJ7C/fVjGyySh7c+qstBlEG/elK53VQ/8xhCA9wqdSbmiu8XVhqGzVWi2E6ZjWI9a
	 E6bGFoEKGjqqelmC+cxalSN1DscYsLWMSm0BhHIli5N6EbJXdzv/cNLdYPbKA67sHZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f4Pj7b5+BCbfAUSTsrmqLzkuYkoyWrTz+YeW1iMb6p8=;
	b=ruNvUBDZJhYBfNS1+5mcRAqDQI6C6JDOL+de0oX3DWqq9zY73ROk+5DvOHJxi9rnklAt
	 YL2EEDJv17jn99RUdZta3hNvUvg+bKeQ4SumLAFSRVpi3MU+3fvkd/GHYhSemYQ7BIe+X
	 ByosiRHAlLqpLLJG100BowYq9lF/3PhpJQuWCU1FpK/OvnOp3qz6cWajc4VTcuVa6xHs2
	 UV03kJK0n+ZliRXRjkpVtwYxCAIu6c50bSbmi3H+SJv2/z6HHcXVVKNCQoP4EoOQSx6QI
	 7gloY82R78jEAPMPzKaeMNaZk7rLkDNdtHAD5BJ6CB9co294RWDLl+LiRfF7KZwh1xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=DCho+HQ0;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23092606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23092606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=DCho+HQ0
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0d91601bdso6849077b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792670824; x=1793275624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f4Pj7b5+BCbfAUSTsrmqLzkuYkoyWrTz+YeW1iMb6p8=;
        b=DCho+HQ0HUQRh5vJ4m/7U8EaK1YUKYd0HqPcqV483E8mA8fjn+MUsZLKDRZAc54V2o
         dq4aMXrXJqsfG0nTL8vatAr/OVoProMCvuAiOrYBGwToottVPhQ+JkGsA+pqysFAdqVU
         WD2Tg54uWt6n1l51HQsRTxWtYDzUjdmgf1pSV6V2Eb9EHa1Wpo5jt9bSpqBEJY+DJsoR
         owpIrpLxe1pfrNEaXNsZax7LCA+iPdJgPosYvSJ4YRVBHCCtDkm0Q7gbTwMCl5nAa3bL
         Vppa5iAczQkqskWc/lpfDtHIuLdFFBMUcFsbFnPA/EttqYE0WiOBydE3whHqwbUFRdiH
         BS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670824; x=1793275624;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f4Pj7b5+BCbfAUSTsrmqLzkuYkoyWrTz+YeW1iMb6p8=;
        b=FMzJtflT4dvrFcvmwGt1MSn3lkVNS+moUpo/kI/phMxJCe810mENvRJd/blvekVnRw
         wflmnFTsOe9dgCp3co/JFrPZBgqnsCe43g/caOS/juvdUcGi9E7M19G3Uwokg566kZri
         aDegJToLb2ef3BOJ695efvBb5zC6jEeZW20o0lElQa2zftzuwQaVZTV1rYjcQTVCuue6
         8Cx8oS/kTIZnHmIwNxwov2VNpFDwjCtxmatwqc6xtpoDKl3VM/F39fYCd2uef6XtxSaZ
         nhNx2FL0z4ndtdUuK7/RtcY8t5HSviIvd/kZF+vNyukQ/zlkulLf5NZf3esXebXrTkLT
         RRBw==
X-Forwarded-Encrypted: i=1; AKwUvBy1gY3cTpDU/UhMjvvslHItzHOZ+Sv/5U+ZOY4tYLbcjITBfkW+pFfoj2m6ROTxanfv2N8R0ZxcQr+BwJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI8NxWVXx3zDiByhkX4r8+hUHmyjCmvYCkevYy298TcpYKlyOd
	lvBSXunMqO39OkZg/3m9zbl5tkgEvQ+54Bf+eoCkONCDCS53X62+UBYfEydR6VwHPA==
X-Gm-Gg: AYBFou2Q0alHbI6+ZjanWY5I8IbKJSV/LKUtVNgyrNtC8/e2zgG/JwaqOdgPyvR/JMs
	rTumYh7vTVtuojvw+KaAnItb+hBaSnHyfmjytDHkLHd/XhvDOIx77ROhU3Md22HjRTydQJOM13s
	bH31rSZ9yevoY35F3hsNYe0LMfJI3FYheOavbFYlMgp+9+lDfvXzqxQf8HM5L5Ba23ugGOdFFDE
	CDIgNSL6bRBIyx1DRyyQMpk/fWX4fIZSUPokYXan8i6WzkF6s4Y1FhvNmaBNPwjcyTFCiKlUOYD
	ZgrM2dwxCN7P2KdoTTb6NmPeEf+WTkiKbDlTUgm2BDSwACb7ILKZ+TozHJP6gN0GhLT51L+LBC1
	8ZT4c8xO3WVcPAlFYYPCEaKtanbKIgzfxUaCu58d2bK1fj54ZCJAmWNV/5AKePEyzNxad8hXhkE
	11peeR25xne6lRdoEXhARo92uRjiVheiA8nfW30LxhOd+Wv+Rzh9hk+pa0P4RC8Jyt76Sj+gSNK
	YRxWFlw7DGz/Zvt5HY//WPKT04E8B1cqvNvMq86BuYMlDVsx8yr+V+MPXuYdAlBv9qoitYiRtMb
	TETO
X-Received: by 2002:a05:690c:39a:b0:8b0:a171:65f7 with SMTP id 00721157ae682-8b145716d60mr15017307b3.19.1792670823891;
        Thu, 22 Oct 2026 05:07:03 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300ae236sm25232857b3.20.2026.10.22.05.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:07:03 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: slava@dubeyko.com
Cc: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] hfs: avoid reusing occupied CNIDs after deletion
Date: Thu, 22 Oct 2026 08:06:57 -0400
Message-ID: <20261022120658.1328124-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <1797b66dee80c9553748d4a961470894c917bf5f.camel@dubeyko.com>
References: <20261015110114.1649059-1-hengyul@cs.unc.edu> <b6f1cb66778d09015ad5862ff273edc37c44ef28.camel@dubeyko.com> <20261021153141.311425-1-hengyul@cs.unc.edu> <1797b66dee80c9553748d4a961470894c917bf5f.camel@dubeyko.com>
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

Hi Slava,

On Wed, Oct 21, 2026 at 03:26:10PM -0700, Viacheslav Dubeyko wrote:
> I think I see your point. So, I think that fix is much simpler. We need
> to add the thread records processing here [1]:
[...]
> The current logic simply misses the HFS_CDR_THD and HFS_CDR_FTH cases
> processing.

Thanks. I tried this in KVM on a804c5742bff. It fixes the example from
my last mail only in part, for two reasons.

First, a thread record's own CNID is in its key. rec.thread.ParID is
the CNID of the parent. In the example, a's thread is (17, "") with
ParID 2, so taking rec.thread.ParID sets next_id to 16, and the next
create fails with -EEXIST on z. Taking the CNID from the key gives 18,
which is right.

Second, even with the key, the scan still stops at the first record it
finds, and the last record need not hold the largest CNID:

    operation    allocated CNID
    create a          16
    mkdir y           17
    create b          18
    mv a y/
    rm b

The last records are now (17, "") for y's thread and (17, "a") for a's
file record, with CNID 16. The scan stops at (17, "a") and sets next_id
to 17, which y still uses, so the next create fails with -EEXIST.

File threads are also optional (HFS_FIL_THD; hfs_cat_move() already
handles files without one). If a (CNID 17) in the example has no
thread, the next create gets CNID 17 as well, without an error, because
hfs_cat_create() only checks for an existing thread.

Result of creating the next file in each case:

                        unpatched   thread ParID   thread key   patch
    example (z, a, b)   -EEXIST     -EEXIST        18           18
    mv a into y         -EEXIST     -EEXIST        -EEXIST      18
    a without thread    17 (dup)    -EEXIST        17 (dup)     18

So the scan needs the largest CNID over all records, not the first one
it finds. This is what the patch does; the cnid - 1 lookup only avoids
the full scan in the common case.

If this looks right to you, I will send v2 without the != change.

Thanks,
Hengyu
