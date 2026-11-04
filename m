Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793818928;
	b=B23liFx8wCcWjL3drlpwPN7Pz2OxeOfQGrh18H9Yu/Hcp5lVRDhEjL/SifZnOaoRNswD
	 MVg+D8yV3CLeyFsEfcfQatSVx0JdiEu8+pcjP21RgMGEemOT/sZjBXG9GkNbMLJB7B2/d
	 tRWzqihME59RUHgfNkw7/NNGS97iA1iPTmBJUmvWYYFspP8wImrBpVp5sgMCaL0XnFkIs
	 jQQrGu6TvZKKB+b7FKvYDSl4M58YgC8l9hv1oUbW0w9m4jw1YADRWiSn7Li2s3grVV6e3
	 kSVmU8wllHSmO55OcN5xFs8dZ8aDNnYP2altLDyeaHAIK0IHC6oIvxysDMg1wqB2X4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=pwH85IO2Kmd9UvCosC1bqbkR6Q4A/lE32+TPIoCPrKY=;
	b=ylkciTjisfD/n63AN/SIYsrMMrBx4E8ZlpBH7ega56rQcuZ3ujhFPOnus9LvXbG8e6P7
	 44CBaeQArIPJlDkHR71xv/uXd9M1XyjQ5gHnnsKssDDjqDzpm/y+pMN0olUX/cMN6pY0I
	 mkr0C02R3GH03rvjdeiVR8cJN0FCCr5mZY1VpwUYNhbDxdUMqtJotty1vaGj+IUqfXAwX
	 eVEl0YmkEusKPMX0hVUozj7btxUnM40oNoSVvcnasFdGU334TctuT30esaUnd7dtI96Zj
	 jWleO2eb1eRVjl8Q3FwHMswN+5QAS8nyFIlIWQcrASnS7JX1zTBsiBMhzBq8OUGzc5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHCVkmpV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC12606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAC12606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VHCVkmpV
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1403679a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:02:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793818927; cv=none;
        d=google.com; s=arc-20260327;
        b=FqeftlYwGx8XgccLyqt1T7pZ8j43nljg4SGjnQz25nQ49fXzx4J4iTvXil9MCBlaEw
         mEfE7fINnyUb7qOqwBm2kz2Y86K+CL9mknlldgez5AUz+3s75r1n4f6ameomMttmFNYX
         Uh1FoPxswqNVNnxHJ7mfAgjVQ0sy/4QzVUv4mk42R09XRYK/iIVjKEpV2Nz48Llokndk
         QpQOeZOIuvLZjFOrcHetPvtwb3xO6u4YV93ZcFgpnC4lEcu3UkSAdlsjLpV5Cwpkllu6
         8aICiAr/ed1VYp+aaZIB+ZMA1mG6/evvc71zm4s+fqVqDagEnUhN5UPBv+vYQ0r3ULw/
         a85Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=pwH85IO2Kmd9UvCosC1bqbkR6Q4A/lE32+TPIoCPrKY=;
        fh=stLDf3Z2NjFc4VZmPHwp/r6GPV0rcJcPXJMIgL6jQ5w=;
        b=doKfr4JuLxmagFBn16NtDk8//V3RMNWwpS++I3cjz0oDB3RXQEMLYVZYIe26E9A/9i
         /vLWAiUO7iGAVYQ5SjSHwAxxkEkl//pGUcHcz9L6+ZRf13Swzii87oIH0eNNvzZixkAG
         +XG5XP5sDmq1HqoQxhXcK9AvxxsqgxzqfcaBTuy+YPZeXjrZHvYsCZwEIHSCb1kltsaZ
         DdNRt0aKiH76XJWXcHKpk0s7jDyQPxqU2+NeOeG70kM1E/NgBuWf0M8xMqx0TRvP6ogP
         Wx1S27FG3MjlnmKc6FbZqhSfBXjNqwsTnpQW4ASIC1S3KHz4JyPMTfH8FcLrhrYl+jm5
         QaMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818927; x=1794423727; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pwH85IO2Kmd9UvCosC1bqbkR6Q4A/lE32+TPIoCPrKY=;
        b=VHCVkmpVP3TCXhWi9QOz8cxV/g2XAE60i70h7i08Dg/OT3ar6CnZuTkTEwHPe9wAh9
         QR/RjOKxRNFrXKwJBefhf4oVOdXxpZhHcyhPUs2WPgETGk5oHkWTAQgDUU/cuq22kkUa
         nHC/aNlXJ74z6eqRkN3uN7hzy2wCoTvNwSDQItdt+Ot1xpGXHAzKKDBh0Ugshp6wx1KF
         9foX6WMqz/clCmlTyeOgf/GSWg8ITetP7s13rKV8ArpYudBY4UfcvOhn/4mFBPsx4ih1
         jFV4FOPxwVk9RkPvYcMkiG66Usy3vUX5gho0dOxM4uzWqVAKRPpynI8BN+s+F2xl1VDG
         8yEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818927; x=1794423727;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pwH85IO2Kmd9UvCosC1bqbkR6Q4A/lE32+TPIoCPrKY=;
        b=hPcou9PFRiyHiszdNtju93z8od9QH1xLdBft09XiM4XILpdM4pUCBxEfI4YQ7sdrs5
         d09NHSfZm1yd1TiSn2ufl8FENOdAiRa6k4jcbWKEx5uObyBjghu4pxiZYuOIZixze4l3
         YBrwwuLlBtJTlXNSQk7E+gTz78Fo9D2VFhqbeSrhbO6p9cB79Y6iKVqWpg/EmJPqK1cK
         BMpf4OrP/yRuxjIg78nWlzRIDoUYyUyxFmAZ2NN3azWB2Sy3prshAUVlbf6iL/DebLzu
         CHNYgdhJMapswtvrJ0lAOEWhFRgQFGtRSQ7GRvi2Bsw11Ud3hp0/TP+jAvi4ZXy9N5M/
         L1/w==
X-Forwarded-Encrypted: i=1; AKwUvBxdVCOU4Bh8ONI84qLYpwBWKXjwfWlodmdcvT3MjjFhoFe7dQCTyyXuuZuGhOgk9FRCrzjJ/Qx2OA2z87M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8328+f1tHUNFTNt1ZM7msIp3mYo9SNiGlmBVO7A3u6oZOWJelT
	WaKRNkG+6eug77cSDWRN/JlUbm7xyNKdkr6e54uPwc+TAfFXk7X/+Gc/+c8C2jiBAzkHS5yUr8D
	oI7cSDQyG6PoHPYyx6YMibmAH6dLIVo5gXbpP
X-Gm-Gg: AYBFou1JyeYv565R+7bwbNClJ8U42ysGjPDeqbJqjQw/l2C8rFvHZ3ZmKtBXJrtZt3K
	SnFtISjofO8FhiP5yJ79hyPS64iDXsbT+PR70rzpUQFHbl4GchnZ29PBTwowkk6JfhN9Yg9RuBr
	EralOAp6D+nae39HXSVuej3P0Hv8rWnG+GdWLBqXMhsHvCSO+Xu+meW4pF9DAQADHMaOTx6YLNz
	sP0kqVhihpnu7arBjixJXdODL3hu+hi+yJFu8DmFZKxGNcW9otJOX8FwAVmlBPRr5FAwOqFOTAY
	qEyFL1NALxFi7nyIg2XZENNQtS2g63ehExtUAyzvLrYgiMfTvS5H1sOv33qfRRZn8t0+vg3tjwR
	nS8k7sQsCfqwtOlrpFsqroPY1OUayXznQ3mSv7n9stlwagbIyoPfMIlvCJdRj/korO9KU6g1cR5
	YeBf/f/3+sIWe+
X-Received: by 2002:a17:90b:1a8a:b0:3a0:eec6:b065 with SMTP id
 98e67ed59e1d1-3b0afc28fc2mr223845a91.13.1793818926988; Wed, 04 Nov 2026
 11:02:06 -0800 (PST)
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 19:02:06 +0000
Received: from 511566560828 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Nov 2026 19:02:06 +0000
From: Henrique Godoy <2dgodoy01227@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 4 Nov 2026 19:02:06 +0000
X-Gm-Features: AclHuK_f094t9Aarf_ICuOIqlKf8WmOIyvUEgEjQ3oNqea5atvStlotKptHyeQw
Message-ID: <CAL1HEBAHwP68MigcYpBqTeRo5YhZY3Xfp5=HDZzvhm=SpMAA=A@mail.gmail.com>
Subject: [PATCH 0/3] tools/mm: page_owner_sort: three input-handling fixes
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

These three patches are fixes for tools/mm/page_owner_sort.c and are
independent of the out-of-bounds series posted a moment ago; they touch the
record reader and the array of records.

1/3 keeps a record that ends the file.  A dump whose last record is not
    followed by an empty line loses that record: ten records load as nine,
    and the tenth disappears without a word.

2/3 stops reading a full buffer as the end of the file.  read_block()
    returns -1 both at the end of the file and when a record does not fit
    in BUF_SIZE, so a dump carrying a long record is sorted as if the file
    ended there:

      $ ./page_owner_sort dump.txt out.txt
      loaded 0

    With the patch it reports the record that does not fit, with the name
    of the file, and exits with a non-zero status.

3/3 grows the array of records instead of deriving its size from
    st.st_size / 100.  A dump whose records are shorter than 100 bytes
    holds more records than that, so a valid input is rejected:

      $ ./page_owner_sort dump.txt out.txt
      max_size too small??

    Measured on a dump of 200 records of 93 bytes: before, no output at
    all; after, all 200 records sorted.

The three inputs above are the reproduction cases: 9 records loaded before
and 10 after, "loaded 0" before and an error naming the file after, and
"max_size too small??" before and 200 records after.

The output of the tool on a realistic dump is byte for byte the same before
and after the series, and checkpatch --strict reports 0 errors, 0 warnings
and 0 checks on each patch.
