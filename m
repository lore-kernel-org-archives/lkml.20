Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793161925;
	b=f/3x5bknybEo+gCk1goXSD/r8xOf06i6q7gVSAg08HzGmknzYVjPf1YIJoIwcouuBsa/
	 eCEXxBTMa55TUI5s2BF4brfGvZUDCEk1QSxLQMHebPZM1c63RKPAiDPGw2yXjqzZX9l0W
	 qxHoz4OOxie5pU0JHiKF9wle2VRXVevMaqLE3WrbCWwH2z+sf8ESRY7v++tUW0CZeAEIu
	 P+F/oTjD/y+eAaBBv2L9vRe1u83XrPE5gzIJgt9csy2G5uX4eLx8y4afKL6FXv54Xxnez
	 +djGgD0uCfx5x9KbjkT1f5yIGwO1XPFVrB+/1dH05D+cdzdEQkB+VSdOcbY3WgViNkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793161925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yM14926zPg3ZfRwCbYZBe9j460yUUMo0egqFW1RVlJQ=;
	b=i+HNMhgIjp/n4M4zofIEeuLPSdxCbH3bvRZiI3xYoe5noYqChYOqVGPqP/Py7FEBk/D8
	 GuE3M+aeUJE2YS9VczlxxMcZZJbbg5Tr2+vMdk2/wVLv1O4SoIzyw9jEzcLkWyhwPNzwx
	 IArVP/iefJnhJ5wOg8dR+Ax4t51ETCojYLpSJKaCkdGuGVb9cjK1v+GLlO0EN4kUy722X
	 n9JsU3jtp1n/Cqp9DLeWC++nVjKrzocV/NiGBVb6IZFg0ABY4fpOmG848sGNL2kRxLkat
	 bALqdQlUXHL2Erl7+Xkxqu6XyEFRt+2EDpiDRlbjrEHt/frum8m77xf03UhF30HagWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=XKUxt1pO;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27D606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C27D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=XKUxt1pO
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6767d92cde6so621391d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1793161923; x=1793766723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yM14926zPg3ZfRwCbYZBe9j460yUUMo0egqFW1RVlJQ=;
        b=XKUxt1pOjBpT1oR0Rna8fq1yt2L6uBNBxCIRQjlix2Cczel6chttmbX5yCRuKhsYxj
         6icJovGdzvM8e1m2EUJjBRZQRPb9KMPLF1H8L+lFy02ciU/rnyZ5zr/ESlwDFojYCFXG
         tjHLZA6ZAgDWgiae3IAw84h6IuBB2LZSVMfkCDSId4DuTiMs6biP8hk0fPNpJQHp2Q2j
         O23YdGhjlFLcrbC3PQ1o8R2tcqDrDMvBm7FAeGUM/rkf9hTuEr7TjM1EqF8hxiiMx+Gh
         XuQs+k93UVqRCt0gj3blcDyoCptfCZA6eaz7tAb5ta0Y8i0DS78Vc1sgcjbBiMbSDJKo
         r5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161923; x=1793766723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yM14926zPg3ZfRwCbYZBe9j460yUUMo0egqFW1RVlJQ=;
        b=Fj6+xL0qw+gEFMyZSQdjMcXNhpa5AsoMWxbOyrXM25AC4fZ4SOoSx/inpfz/T6XLe+
         fMrvS3pxVEjR30a0TaxhJgXRdPSFvm/YabhuR1qtAIFgOw8a9zLbHzID40gLe/l9qqk2
         f/zsZ1DiOCYOxbQrahmUIXKhHjrVqS2cstJ9tbvenKeTrckYcyd9jvVmSuIqTXHnLZzz
         t89MKK/FEuYg/nyIl46UYMx4xLwgSupvrpmFF1VQ1GLI1/xDU/y0ddmfYCeJgtyuw+yL
         RdtfVXhZrJoTyhtXqCMVIY3DBQLkFbm41e8xNGNr2Hr9erStc5fskDpvzeVkoVmZCM/r
         bKHw==
X-Forwarded-Encrypted: i=1; AKwUvBxm340ffcmwsMJjySvECrlw2rWDSZrSwNM7FM8OwU3bJzVQTHUvU0iuezkWYBGi8IxkLm9Mmra9O78qgPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK15BU2YQMOsm7q5ZA2Ldgxcc4lD1yIFLxvArzcosDHAOlagqH
	kwfxhP1V/hVtWi8lGzu9vCVuK4BFzNZqeAR1u89dhOmDLJKq0CVNuIc1sEPh+fEbXg==
X-Gm-Gg: AYBFou3+snFvCqAVPEYEeQyouPeJ04jDJ7OWtG4YW302fMEg2llSzIhjvTzxC6n9xGh
	qnzGhDno4WLEIc9Rd7qzyDxGZx/g+UOmW9C81iVfrcxoa8di6XPWTL2vmuPJRYP9kt4tAfOynWV
	HkbcL+FT/5uh0N6UtjRwDYZfLmVwiabTU2uYPVBZp/CHih8WCuwiRcqoW+Yozc1t9mPx8i2YvaA
	Oj/2vxZnX4kw0CvNBuJGwny1u1cGGKBRYOPXxMLIwTzGL90J/Y6Zz95lBzwoFw1Jo52LBdOutO2
	M2e1yfkrfdj99pBXA8bc3w2wGvdQRVzWWLQsw/KbdVB1XUrHB98WkvbQ+FmxX1Az4CM8lgTjffi
	bO4ZeQAkEp8wpnCrWVLi/opqIunwUI58sG4QMtL9UagjMiWjiPnsyHQHzB6GnVTe+GiehNr6B9L
	LfpGGItFnFa3tOpd/EY04Ux0BLiacXyTRcJqRaIs2E2MdV9dVI2I+WmuMILFeKSfQhI0hxuJQKo
	YjMJRFdBm9/qsNoMAl/4o+35pvOQ/nErhc1PvEMVahXbjrVzl2UcWK+PsegxiKzy+F3spJ7CjrG
	yVf6W2As5kZNPHTWeCJVgYSoOo4mfYezogKM/9OkxuQ5XxlgRr90cxwEXXjW9ZW5Af1M8cLs
X-Received: by 2002:a05:690e:c45:b0:674:1b39:fe1 with SMTP id 956f58d0204a3-67a7bd6d393mr1148399d50.107.1793161923391;
        Tue, 27 Oct 2026 21:32:03 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a07daf6sm1114915d50.7.2026.10.27.21.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:32:02 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: yizhang089@gmail.com
Cc: linux-ext4@vger.kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	yi.zhang@huaweicloud.com,
	dave.hansen@linux.intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ext4: do not advance i_size on a buffered write that copied nothing
Date: Wed, 28 Oct 2026 00:31:46 -0400
Message-ID: <20261028043146.771074-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <abcaabca-d99e-4bf2-b31b-5e96e7accd29@gmail.com>
References: <20261023172532.3271348-1-hengyul@cs.unc.edu> <abcaabca-d99e-4bf2-b31b-5e96e7accd29@gmail.com>
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

Hi Yi,

On 10/24/2026 3:12 PM, Zhang Yi wrote:
> I feel the last sentence isn't quite accurate. Dirty folio past
> EOF will be cleaned up during writeback. In mpage_process_page_bufs(),
> when lblk >= blocks, if 1) there are no blocks to map, it will
> directly call mpage_submit_folio(), which clears the dirty flag on
> the folio, and then mpage_submit_folio() will shorten the writeback
> length, so that ext4_bio_write_folio() will also clear the dirty
> flag on the corresponding bh; if 2) there are blocks to map, then
> after the required block allocation is done, it will likewise call
> mpage_submit_folio() and do similar cleanup. Am I missing something?

You are right when i_size is a multiple of the folio size. Otherwise
mpage_submit_folio() sets len = size & (len - 1), which is not 0 for a
folio that lies wholly beyond i_size. The first buffer of that folio
is still dirty and delayed, so ext4_bio_write_folio() redirties the
folio.

I checked this on the dev branch with only the copied checks of v2,
without the trim. After a failed 4 KiB write at 1 MiB into a 100-byte
file, the folio at 1 MiB was submitted with len 100 and redirtied on
every pass. It stayed dirty through three syncs, and umount printed
"data will be lost". With a 0- or 4096-byte file it was cleaned as you
describe, but the delayed block stayed reserved until eviction. I will
reword the sentence in v3.

>> +	if (!copied && pos + len > old_size)
>
> Why do you keep the '!copied' condition? AFAICT, if copied is non-zero
> but less than len, the excess delalloc extent allocate by
> ext4_da_write_begin() should still be cleaned up.

Agreed. In v2 those blocks are only dropped one step later:
generic_perform_write() retries at pos + copied, that copy fails, and
->write_end() runs with copied == 0. With short copies of 2000 and 500
bytes into an uptodate folio on 1k blocks, the end result was the same,
but nothing is dropped if the loop stops before the retry, e.g. when a
fatal signal is pending. v3 will drop '!copied' and compare pos + len
with i_size after the update, as ext4_write_end() does, so a write that
copies everything does not trim.

Thanks,
Hengyu
