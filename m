Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7F73C0621
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007490; cv=none; b=fc3PV4ofxYknOP4c2wiZ44K41WhG4n095FFiOPv5xy5ug6W4Fm873s9LjJ+ugwjzekZj72xMUC26tKlFY6CBA0Y+ySWgCI8hAcrVyN2jLlAGk7PfEGxL01n5MQ046K2HPMSvn5JoFpnsHXQhXspDlTkQNffbTM4DTY2QLEQIaME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007490; c=relaxed/simple;
	bh=C4QdF0kfD5I7YkBEnXi8MMrfwuUCiXACZGR7/E2177Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Di3v54m/cHGKa3gOLIahrc3P50JzzUc6bkxTNvwDGLoPC/Wb4y2gNMBSgamy5koaXYTTGVSZ2REScaY/gKfxQIm2dWvcxh9ojLu/MhmnvYGHflDJBFcFEGOMjhbWXp7LPK/pQ2aanTDNPeP6VKT/ooyeWElHoK4Pm+iqlL5skgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=F8acJgUP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="F8acJgUP"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso9359245ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1792007489; x=1792612289; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hzofueAYnlurj6BhEZgw1n60GJllU6UFAaFK5QM85x4=;
        b=F8acJgUPjIq+IOCHHc29Jlq4tACFhaqdG3uSHLTZKUB62Tii9YEPgjp35ave7jFG1t
         9Rlc4cwVdhHlP+lcdDAHWA2j/0afGl0wwd13gr+W/C3Gcv9cYadVCj4lTrHdUqDzRvpk
         SiC+rijc1OYe5JVYlJ97tmthuWjkJaczHtssJb9rvRALLSTyp2O01KpPdwbiea83QNVo
         4uFEKA/p/cbuAIfSp/V2fpKGFswCk8Cm+rURFgx8TSC1YqS7JdbZX05wMNZQm4NW3qKi
         6pBCbWGt+qThRgi6EVUA6sgdoq8xcExSTegdLXhtbcznW6dTjzTgZTbp3EkASR7WkcbQ
         TS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792007489; x=1792612289;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzofueAYnlurj6BhEZgw1n60GJllU6UFAaFK5QM85x4=;
        b=x2TBbNo8QDacyW1aKcxfHMoxEyF+M1kr72vDJWPuf93MCh+pdzAOka7w4hi5XDCU0F
         5fzLl8P9ZUYhBQG8iPnSnEujshdECtAv6ddv6o5abP9YMoQwBKlSs32DftsPAXUGmM1G
         e7IWDbKzZRiXFRJPA9ijIumSn4lBQugIL5THVdrH4VcCAxJz5vIlCyi4mNXkYNzIV8g0
         AWfdHPZFw6AtBnLvpRLY1t2ci5OTnuDtoEsnjxfmSAj+WfL47fU6XFNR2Tz2mZL2kII0
         1s84hETJDGFLjQFKVqvcgrisSwvEeti8rnLhiDiwZRVFa6pATv1ojm0vjuLUasJPatDF
         W3rw==
X-Forwarded-Encrypted: i=1; AKwUvBxqwqImmAMuSFzV+wnQ47QZffSFBIva0kjDKkeJTpaat0wZHMuniy+PXk4e6uBUmdjEsE24AAtwNp6fcaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTK2KLEMiry3lYd6DMyO/EOyxyg3d1g6zX355/KN/TsMY11ziI
	FLRI6kLcZyZFws7cJQNK4ItR/wgcV1AXnKQUqnzr78+yZ4YBOaJQA98vF+I2Mpofma8=
X-Gm-Gg: AYBFou1+ayf+3osEw2oAa2whuG0rdfk08jJmBMZ3M+ql/CWeJyw5WhegypLsdzIU9Uf
	35+YTCCq5X1wBllpSQ3V/KPNxl13Cml9G/+Skd3mlfrS2OhqbgdWlUKpIl/WL4l+/uYM9Z4Vayi
	3hqabCaLNIEgM0xtaGruZMFiju28enUwQl9W2ZSAkWVekc+kSBdilRSxS48ZiB7GSOUU0GXMZLi
	sYwT7npjIaQgXp13iu1xXFcx+ixec0YWjkx4jsdM8hBJw3S/mUp5Yuq/BQclS3ex0vahg2dlNid
	a2Th4dgyvFoP1zaGk1l6teFM2xnW040RffouWuU1e0jFGg+IWdG9AZrIIMJUXk2qybiE4akzxCX
	lkxzVnWQJ1TZf9Q9xMD+ppGzDjOogN+0VPICkiptEZi2eEBYxDCdwxlgoCpnmGJFT7w/H8CtzxJ
	bq7n+lC2LwS3lW4qzng4CYOP24VWQ878+pB41KYdTYt05Jysr+PXCthRv4yGo2Lrp5g/49llpLJ
	M82lalcOf2uZGe0oX0wZUTxwCB4
X-Received: by 2002:a17:903:38c4:b0:2dd:c100:4257 with SMTP id d9443c01a7336-2e842f11875mr141177635ad.59.1792007488455;
        Wed, 14 Oct 2026 12:51:28 -0700 (PDT)
Received: from localhost (107-190-31-93.cpe.teksavvy.com. [107.190.31.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e8c9sm72720135ad.23.2026.10.14.12.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:51:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 19:51:26 +0000
Message-Id: <DM4TMYJX3BXY.15067Y489FKUR@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next 0/2] selftests/bpf: Skip libarena when arena
 spin locks are unsupported
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Alexei Starovoitov"
 <ast@kernel.org>, "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii
 Nakryiko" <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>
In-Reply-To: <20261009-selftests-bpf-libarena-nr-cpus-v1-0-e726ccc66fc6@gmail.com>

On Fri Oct 9, 2026 at 1:49 AM UTC, Qiliang Yuan wrote:
> serial_test_libarena runs the test programs of libarena, whose buddy
> allocator serializes its operations with an arena spin lock.
>
> arena_spin_lock() fails with -EOPNOTSUPP on kernels built with more
> than 1024 possible CPUs, as distributions commonly configure them.
> buddy_init() reports that as -EINVAL, and every test then fails at
> arena_buddy_reset.
>
> Patch 1 makes buddy_init() return the error of the lock, patch 2 skips
> the tests when resetting the allocator fails with -EOPNOTSUPP.
>

If new kernels expect more than 1024 CPUs, we should update libarena and
arena_spin_lock() to support them instead of returning EOPNOTSUPP.

pw-bot: cr

> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
> Qiliang Yuan (2):
>       selftests/bpf: Return the lock error from buddy_init() of libarena
>       selftests/bpf: Skip libarena on kernels with too many possible CPUs
>
>  tools/testing/selftests/bpf/libarena/src/buddy.bpf.c | 5 +++--
>  tools/testing/selftests/bpf/prog_tests/libarena.c    | 9 +++++++++
>  2 files changed, 12 insertions(+), 2 deletions(-)
> ---
> base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
> change-id: 20261009-selftests-bpf-libarena-nr-cpus-50fc5dd00fe2
>
> Best regards,

