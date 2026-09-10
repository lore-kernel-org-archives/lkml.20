Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9D48E0C5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050342; cv=pass; b=cndY+iDQDIc/zT95d+KMPNpAm3dBHyHLmhyF+k+OD6sBbSh1D7a6swc7byK62BB7LxOiAGhTweqa2AHokEKCtUwhm8PS7ho4EVIHOleYPEpx8SR6mX7ONkkpqA79oxuzr8YpmnTYh0ww81gz+CSeY5IhcrS7cNDvW3K5hcFPbsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050342; c=relaxed/simple;
	bh=iexBxeT1r80QFrStcwB2/AMqN63Tsm+wJYHNQeJSdVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSpdWUcdcFllDOlVjVv1Mx+f0u218uHNBj9OSLrVIr3Wc67+dVMXpswPi+IQlQ8yxz9jjlNhcx4ryjoP8B+fBrsAMAVHlIh97gZK2Gon9kdJ8nK7Afc+MX5VTpppDaTrtX3E/pH8I5Ti3++x+XKpnXfhHL2Ye9R/4yvyIzkLWDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJp4vwvC; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJp4vwvC"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a3688a2so1292659b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050339; cv=none;
        d=google.com; s=arc-20260327;
        b=GZGe5gPVRGOV9K1UKBj9uSx9tviNxCTZM9Bg0l9ERV2zwkWYKTBmOncd2lbIuylgP3
         EyDGIkVnZ2onPVvq0wCnAVK3eu95J1oJuSvwJY/41F7LR8I0/NTezRL6W0wsi3F+8rJL
         I1B78v84gUfpwbTZ0Y81iF+TIsy/zNVfJZYRVGUbocUB31B/uEHy2GgW8+S+ehQTOc9G
         Aq0bk0H+rPhVmfTEbsEgQSGpXKwHMY+nf6R1sJ8bhkXO2xLMbzycOlXaFWTGopkZAwwd
         mkF8F/Gg6O5Pq0viAXquXn33CPcJ4zQPlS18jbr68/yKI5mkovA3RRV5QSOwQPbM1LPI
         b7Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=haTWqSj8+sulXARcSdY+bPVghCT1LWLKYiL7Y87SzJw=;
        fh=xBNHwiGZhmHlHOs2ueN/CbKa4/nOA+5OeOCBmBFdVQE=;
        b=On+rZyiLJEiGmC4RGmBqZavfnAsIRvJ5tYVMs9O49Q5KEXrqHGWA04cwVgSv430pl3
         qCp+Uf9WvvJZgJWo3aCvdA5vf4L1VB5oe6jUnf/+PGXXfVFJolsBe7/w9OydewrBYoOO
         u2An27tRiTEo06GLWOzPJPTfXhKYF7pAQVwu+qhXPgGkzPUWKiZrOPBJPOTc0c93I0Jt
         yEBlF5p404lh72V5SGdJ7NcLIDqshCeIceEyY5ND6OhqgVz+JvSA1gQzPTBXXl1oWUiT
         iGwm8t3B4CLcV6mHwkXABRK6XnLnNNiEcRydXT1pE8SzjUCmNoCJ2Jrhw3PfJjBuN7kY
         gQVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050339; x=1789655139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haTWqSj8+sulXARcSdY+bPVghCT1LWLKYiL7Y87SzJw=;
        b=FJp4vwvCiR0x6tmzF+PcmZUx009lRz8h32k3K3kUFuuTRyj6aojucLDolDzlQz7TuP
         h4Qwi8oqxvxbEx1Qbc77NKmkd9pSc02yDxBqFrTNd7d/gqAj8rPVKyyh77hFuI1OkpQT
         R/bdwydN4x/Lt/8Nlb4XlPRIZezfOYw58Jzgbztd27rvzE5uLT2zFc/odd9vmQ3ZeLYR
         VL4NY3l38El3Mc+PhHQkmBsOdRcM+BjqBIOIAOHvhp1gBWzBKKMRmWA80FOBBPZvHDTx
         i6P0EA/TnFF1lidh3h1cRigRDPMyt4aVCBSK9k9KEMXJYNaFOG51bgcV3PM46gwokp1O
         fUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050339; x=1789655139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haTWqSj8+sulXARcSdY+bPVghCT1LWLKYiL7Y87SzJw=;
        b=Hjs8h0kgYvuPM1UK5RWjS2Va/KUI+91dsMAAD/lvMwKsAhlhqf6w7uG5jLYUtVkKvq
         hM7BDALMw3JjhHungKRDuv2D0AGN5CMg2nImZBfKQO6vBphevzWz4NTnr/fhY5wNOdTI
         0FRokSZ7dBUJI8ZNoA9NgbfmoQXsxgGwrEBCKFR470Lg+UTX8IaHRoHPKT1hA1pN5d4Q
         tc8Th+B22LTuRN2pyLhliEa4h1/3qguwuUT5OEuwn5ln+LK/+aE6WjPe149b5VEr7Gwb
         COGCayoL1s9KR41mt9M2tUAm91FJrGZv9s0YEeMFIw876/cRVkbRAb20XAzfflhwZ8Lu
         9KYw==
X-Forwarded-Encrypted: i=1; AKwUvBynmBl5gN7VcGZu1Z+UqZddHxK8iL3toyg82qcvi/X5AOPOz0WcFL4Q8xPUCA4LyMljiJ4j/Xj5/rUjJto=@vger.kernel.org
X-Gm-Message-State: AFuF++kX2yVMX0s3OOBC5o5oaRr54xeSiwZrpKO3mwpEjOwEKrlrGRh2
	jvrjm6myVGeikSiRmNVy+8zEJXH6CPJbUdudadhlxTgv9HY54z9kU1QKBzPD8Gqpt3rjIJ256W8
	xgU+lh0vrTE5xyd7uZMoaZO8+ms+sqIw=
X-Gm-Gg: AYBFou3Af1Vi92GnXmJtIEDh+pwRzui/wvaCbhaJfZVwimHywSkteJP8tvachOJBqjX
	5mOs5IsCc2zXtZ/UmSioAmGAO3s+N0wOXmJtRTTaNZ8sAn4uuuIoT9GSe0vf/iLZZF75LM4cP9z
	dn1bcZPIRgP+bZZEIUJTamNMqkwEhUOIlai0NXHMGb9LaIQQp0/ifGOmEc1lwZ+GqZyh2LhmJYG
	Igc70FMJGFFREF+xcn+zH+T9IAB4IYe3oUwtop2D4mrkjJZWu4FJjsSSx+7st6zn2AMCf0uJjL2
	5NiYb9VhnthFb3XzqJJ+0zcIt9nvxF8efxU+1K4yXZPfmNyycDg9LF7jYQuLboCglW8ySSGdmig
	uelu6GDtlcb06PEXHD4hA0DHLVxbqro+1g/mon0yamRA/OimdXVdZ8nPu2b+G7R+uxQ==
X-Received: by 2002:a05:6808:4f0c:b0:4b2:8d91:ef6a with SMTP id
 5614622812f47-4c13fa8795emr5586961b6e.8.1789050339246; Thu, 10 Sep 2026
 07:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909132602.68852-2-mngyadam@amazon.de>
In-Reply-To: <20260909132602.68852-2-mngyadam@amazon.de>
From: Ming Lei <tom.leiming@gmail.com>
Date: Thu, 10 Sep 2026 09:25:27 -0500
X-Gm-Features: AcwNN1Uu_GuAXXJ2Be9f6O__zza3jhEo9v5mLmL2JzR85KZC_M254gRqoHjxODg
Message-ID: <CACVXFVO7YD4ckMPgZJh7=oxLMjka2UG_vkNcfECCBpkSQ7SHPQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: ublk: install test_common.sh and trace/ scripts
To: Mahmoud Nagy Adam <mngyadam@amazon.de>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 8:26=E2=80=AFAM Mahmoud Nagy Adam <mngyadam@amazon.d=
e> wrote:
>
> Every ublk test script sources test_common.sh from its own directory:
>
>     . "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
>
> and test_generic_02/12 additionally run bpftrace against the scripts in
> trace/. Neither test_common.sh nor trace/ is listed in TEST_FILES, so
> "make install" does not copy them into the install directory and every
> ublk test fails when run from there:
>
>   ./test_generic_02.sh: line 4: .../kselftest_install/ublk/test_common.sh=
: No such file or directory
>   ./test_generic_02.sh: line 8: _have_program: command not found
>
> The bpftrace tests are affected even when bpftrace is installed: the
> missing trace/*.bt makes bpftrace exit immediately, and the tests then
> report a skip rather than a failure, which hides the problem.
>
> Add both to TEST_FILES, matching how other selftests ship their sourced
> helpers (see kexec/kexec_common_lib.sh and zram/zram_lib.sh).
>
> Fixes: 6aecda00b7d1e1 ("selftests: ublk: add kernel selftests for ublk")
> Fixes: 723977cab4c0fd ("selftests: ublk: add generic_01 for verifying seq=
uential IO order")
> Cc: stable@vger.kernel.org # v6.15+
> Assisted-by: Kiro:claude-opus-5
> Signed-off-by: Mahmoud Nagy Adam <mngyadam@amazon.de>

On Wed, Sep 9, 2026 at 8:26=E2=80=AFAM Mahmoud Nagy Adam <mngyadam@amazon.d=
e> wrote:
>
> Every ublk test script sources test_common.sh from its own directory:
>
>     . "$(cd "$(dirname "$0")" && pwd)"/test_common.sh
>
> and test_generic_02/12 additionally run bpftrace against the scripts in
> trace/. Neither test_common.sh nor trace/ is listed in TEST_FILES, so
> "make install" does not copy them into the install directory and every
> ublk test fails when run from there:
>
>   ./test_generic_02.sh: line 4: .../kselftest_install/ublk/test_common.sh=
: No such file or directory
>   ./test_generic_02.sh: line 8: _have_program: command not found
>
> The bpftrace tests are affected even when bpftrace is installed: the
> missing trace/*.bt makes bpftrace exit immediately, and the tests then
> report a skip rather than a failure, which hides the problem.
>
> Add both to TEST_FILES, matching how other selftests ship their sourced
> helpers (see kexec/kexec_common_lib.sh and zram/zram_lib.sh).
>
> Fixes: 6aecda00b7d1e1 ("selftests: ublk: add kernel selftests for ublk")
> Fixes: 723977cab4c0fd ("selftests: ublk: add generic_01 for verifying seq=
uential IO order")
> Cc: stable@vger.kernel.org # v6.15+
> Assisted-by: Kiro:claude-opus-5
> Signed-off-by: Mahmoud Nagy Adam <mngyadam@amazon.de>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
