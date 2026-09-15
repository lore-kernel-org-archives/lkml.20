Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1C023A99F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789430523; cv=pass; b=Gw++0DLtilz9xpV94GAq4oPC8/ewDbnPp1Lh0TDUCDLgqddfmp2/JJk3wcLdrPKkCQFPSQcv7179yt7g2JpWO0xq92jFPIePOsXi+42hVPiOXG9gOFP6jT+VxF+f48nCMTOfGQDeCRqCwg+cILy51rkSEfqTjokpT/fy9x2aKsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789430523; c=relaxed/simple;
	bh=eosAoihtwAOEQJyRlv6Vl6Ciyr7ALICvxVxfVC6AgmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8J//FM1u1+1eR1X6FwXiOOhgd80ByhdTvEr8HGga2FBVt/Zt8D8nsASbSAaiPcygyyNBbaY0wF7P4ZCdp3S7GbKDvqoPA8pwJQxrKKphGBEh60zGXRoE3n0yCTI/aYSYXbaxAa03yVZgQg/ckjh27dSRiiEN3oyWFgovbEmgEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=NHezCk6V; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="NHezCk6V"
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B79513F28A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1789430518;
	bh=r0hasLCz57GpF7SAqU2aNVEVHGPKn0sNjTbrv00rd/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NHezCk6Vot4mOEr0muRzuwZ3RESXVja7HmFQJDjKq58ulO5ypCFrJEFkoWpHYNe6M
	 O4IJ3BEw1zJ5LY0qatQ1rw7pwz/8xqhAkeA1oXkis9HI3HrfY2SDJk3meVC0jKwoxD
	 vicl5xtIh/mfKFKi04JDyva+kEPd5Wvcyt9iCAuT3/Rc5nB3WSeWK613nobzx+9xDm
	 e0brVb/14AYq8afSEqqOPcgtLMNvKILI0nVCE+uV6ofoCFbQj2wEJmXn8PrpeIC56N
	 kpEM/0mf20B/2gtnSRIh4yJmULAchlMGgzOSxCz7ETGSZ7LdfwriPQrHGsI63lJfNH
	 /BQynQEI0qUJdeeDvSAPywdalNciJr4m6c1qOU3zow0wiE3DnNpFXYLR8R/sX6dXIl
	 gxSA7Lc3Tw/TYGjHyEeXzbtT2GsPLsukuhfIj3pyq9ezWeibEr13EH1Q6Sgg88kdVV
	 DEloh8bd0SeeLAyk4l7kREWji75yOZwU3gGAzUnY3clFSnPlTIRPfUR4m+AZ8WTUwI
	 sXhgN+uGjt0lZ4Xa3fj2IKOFRPfdWbYnndsOu6sWqDQePsmTXdOiJ2nsumaJJOcAtZ
	 xbxBPLesvKf4I0dyoJIBm588+bbxMdb8P8HYb71tJgylISkBn17kS8F4powsBWEO/u
	 ohrtGN9xAVqxhIUS7TqST+rc=
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8881abf79a4so26774047b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789430517; cv=none;
        d=google.com; s=arc-20260327;
        b=SU5g10aHIp5NT5jJXROMNhuHOQP3hzfI2F1xoIBU69F/rM1NGNryvu8/H+0FOZJ1fL
         V01qYz5s8gar5LrK+SyWWKfhY9jdZTW4UMzUef8WTj69dULTLraAH1tuqS2iat0ua5D1
         kgxOjgWDORyLss8Tzlot1hAWulkNPRDmErbUoyD9lBReHH+CRy6lBSz4+tn0UkwRBMmG
         ZWiwUN+igjUposYh6HIQE2QwB0gzTi9ZfKMGTvubVEI7W/MydERu3RhPpSg8cBBn7Ney
         772ER068w26apZD8RdSNR+h6LKfV6ralQi31LkX6whK/tuxPmg3nDqYVKxpm1MNr8+kc
         VQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=r0hasLCz57GpF7SAqU2aNVEVHGPKn0sNjTbrv00rd/c=;
        fh=KNVwXyapKZyF+SdUhHqoAsQWzfPdccLYERnPgslTN0o=;
        b=GgxzGjh4KerRYm9TVqMgo7/aUlojiVqjd5taGmb7CM6IMS2DirA2tIp4oyJIpj1WAA
         HPFgzXWXoZM1pdNKn4TCa5RUllLakTFyYOiOVVLsYvx68SuUwMBXIfiSPi6n/Rh+Xk9J
         4hzXeP8xw2/4kXBfujovD1riIYaQHsSCjm5//DevPVqu2q1BWnGWnys7hnaYyqHmgBEx
         iWYRSbgvrHTtbHNiRanex+209y56i9T3olh5VzK3A8yiQIIi6pHWSOYfO+lZu2VEhQeP
         wycuWAbgfO+fwN1cEi7MAIkYJK2k68pO4nnYeeQHGDf6EUvKf6wBZaXbbQEqkz/bem49
         MuEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789430517; x=1790035317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0hasLCz57GpF7SAqU2aNVEVHGPKn0sNjTbrv00rd/c=;
        b=sLa13DFkWVQGSMSSmIyiqsr/C1aXttFT2pQ1HtLbdAtsqFmTc0RE85tLCdxVe5lgCp
         BYyk7/52qf7PpABCRSctja4w607MbDTJLr4Rv4jutPWvKW9M8gFbjGI7x4Y8rytZbVPj
         yJQ9nzogLgRUjfQC2qnt9NuJi7LFl83Qr2cqMODazu5Cic0NFFfG1skOYTzwgXX5WL/R
         q5gRS96FJD6B0k5pd/s7noQe/ShVJUlyyus9wfnk9x+j05rMZAupxPtZK0Hcchd3kzhu
         TmA7Re8gZvEXPUdH8oW7QbQYOs55V8RhADVNVABhfpEW430bS97tvYHMnihzClx0VVkl
         SSVA==
X-Forwarded-Encrypted: i=1; AKwUvBwHGRio3YlRYZjhGZnOVUffNiRky9q3QfMSrccb4I+zCX4gD/VyYQW9Jt3AW6hO5g4j25nrjRepzKeWHJY=@vger.kernel.org
X-Gm-Message-State: AFuF++nXVs79qNE07DWi4Aj/ktS2pJWHt73+3O07ETm7mfXI+m75YqjH
	gILaXl4SJ2OpRH6dwlvwUI1U3SRKs5OycUVDNO7qWOYgbKF/L5w0/6Ye14dbAmpA1iSwEPWNQTq
	iy/MurzLIjssduqnY6kQ22Kk9yxyWLltdXJ7VBjRuQCYE9tBw5MNfy/l5PwKMb+XmmhmSvdy5zs
	G4mtAJTZUnuZnCQB1KZLT0rhm6RVb83bme/2CF3y5dVWxED1JgtMp2AIt4
X-Gm-Gg: AYBFou3U7CBhxjflAYOCP0WCyyki67EdwFZL7ub7gtZvX3syMIdjTM59mOrbTL41HUO
	derHOPfucybAe80lO5DYEj6cCYSvHjaTNSkPgupLXUZXjJtiCch5is+69VGy7TZ86OYsPMTxooZ
	0TVwPerAZkUUIA0BDp45Feh5ssCwDoZOLDmDLuDi6Ir7TFmQMjcPzlloyPSkBBjMZXP4eVQy5V9
	tyc
X-Received: by 2002:a05:690e:108a:10b0:671:548e:f17a with SMTP id 956f58d0204a3-671548f09fbmr575141d50.6.1789430517565;
        Mon, 14 Sep 2026 17:01:57 -0700 (PDT)
X-Received: by 2002:a05:690e:108a:10b0:671:548e:f17a with SMTP id
 956f58d0204a3-671548f09fbmr575131d50.6.1789430517076; Mon, 14 Sep 2026
 17:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909050919.3344699-1-chris.chiu@canonical.com>
In-Reply-To: <20260909050919.3344699-1-chris.chiu@canonical.com>
From: Chris Chiu <chris.chiu@canonical.com>
Date: Tue, 15 Sep 2026 08:00:00 +0800
X-Gm-Features: AcwNN1XVh1ezSC4ybotZKbIiPQmqAdnlb_DFgEiPNeX7teBjdDq_YCIHyZaRa4Q
Message-ID: <CABTNMG0+rpiqAckYqizUQHU_9rfdt21drC8Y5t1SmOonwYGSBQ@mail.gmail.com>
Subject: Re: [PATCH] selftests/powerpc: Fix exec_prot test failure on Hash MMU
To: maddy@linux.ibm.com, shuah@kernel.org
Cc: sshegde@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 1:09=E2=80=AFPM Chris Chiu <chris.chiu@canonical.com=
> wrote:
>
> Hash MMU maps execute-only pages as readable at the PTE level, so reading
> from a PROT_EXEC-only mapping does not fault there. The exec_prot test
> currently treats that as a failure, while the rest of the permission
> checks are still valid.
>
> Use the existing using_hash_mmu() helper and skip only the read-on-
> execute-only subtest on Hash MMU. Keep the rest of the test unchanged so
> the fix stays local to the unsupported execute-only-read expectation.
>
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
> ---
>  .../testing/selftests/powerpc/mm/exec_prot.c  | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/mm/exec_prot.c b/tools/testi=
ng/selftests/powerpc/mm/exec_prot.c
> index db75b2225de1..bd44f49d8449 100644
> --- a/tools/testing/selftests/powerpc/mm/exec_prot.c
> +++ b/tools/testing/selftests/powerpc/mm/exec_prot.c
> @@ -108,11 +108,14 @@ static int check_exec_fault(int rights)
>  static int test(void)
>  {
>         struct sigaction segv_act, trap_act;
> +       bool hash_mmu;
>         int i;
>
>         /* Skip the test if the CPU doesn't support Radix */
>         SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_3_00));
>
> +       FAIL_IF(using_hash_mmu(&hash_mmu));
> +
>         /* Check if pkeys are supported */
>         pkeys_supported =3D pkeys_unsupported() =3D=3D 0;
>
> @@ -167,13 +170,17 @@ static int test(void)
>          * Read an instruction word from the address when the page
>          * is execute only. This should generate an access fault.
>          */
> -       fault_code =3D -1;
> -       remaining_faults =3D 1;
> -       printf("Testing read on --x, should fault...");
> -       FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) !=3D 0);
> -       i =3D *fault_addr;
> -       FAIL_IF(remaining_faults !=3D 0 || !is_fault_expected(fault_code)=
);
> -       printf("ok!\n");
> +       if (!hash_mmu) {
> +               fault_code =3D -1;
> +               remaining_faults =3D 1;
> +               printf("Testing read on --x, should fault...");
> +               FAIL_IF(mprotect(insns, pgsize, PROT_EXEC) !=3D 0);
> +               i =3D *fault_addr;
> +               FAIL_IF(remaining_faults !=3D 0 || !is_fault_expected(fau=
lt_code));
> +               printf("ok!\n");
> +       } else {
> +               printf("Testing read on --x, skipped on Hash MMU\n");
> +       }
>
>         /*
>          * Write an instruction word to the address when the page
> --
> 2.43.0
>

Gentle ping.
