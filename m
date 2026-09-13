Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC83B6C1D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328502; cv=pass; b=HutWNRd28Q7a5sov2aVIT5SGtQjCXG4BkbL5ZkjyjvgNXSZojzwZ0DcCGbiyrMbKmH9XiplYTDBzqRfJ+F6BELpWfh51+JZTQgKXtEx0F9r35yjmir8Ih0WXZahpwOK7hJUaHldyIlqcw4IHbjBSbNvCiOAzrDRJyLrW967OdJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328502; c=relaxed/simple;
	bh=o9YibIUfRxMjjHC8/Y22RaQ2wOjqg0OE/+77r3xl3ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taSBdBB0IMWZNRcplccwA8JUos+7LbefOHqR29mj8A/G+0wE+BbwJO8WNGGDruKZ7AoUUtGzJ7/Y3YnbDn4mxPG9HV3yfIHdPAzzKCP7DOsmuW/PA4ooYQmjMty8Bc0xPb24RU/IL5g0bjiFrfHsFFBcDiJvWVljs42sB5IDo3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=I8sFL6Q+; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="I8sFL6Q+"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so15975485ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789328500; cv=none;
        d=google.com; s=arc-20260327;
        b=YlaQ68zga97ZEEu5TiC0ZUC9horpbjONg9hqwNjZ/OudVO+PT5gssPp+b8kx9m2Z0q
         cMHKjUKaGrsVbgzHTFDjHA7V4kbpJM2ZVOd5RiZFRAXdOK2MllvuLBxhBjVvy9/+cl/q
         6mIKiM9ROGXiv5NX4YzzzAmroU5zDFRFUP3/BWei8RM2RFFW+mp9NLcU3aOVFQFgfDy6
         QWhrKlGmBXZUrBWRwxRifm03OBQFHja77UTbVRRaEqD+1z4JD37afANksflWaUdkgZdI
         Egphiy5S/KeBzG+hK6y1hRuEU8BjvBAHLjXecsPjeqocgE0/k0ye0hKwsnQ1EnCsuoyW
         3F4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2oFQ8qNlHBe3RYmZfeSmFS5X2SDU60h3feX9FkdQ3Ds=;
        fh=xKw32pTGVAE5yP/p8rkV/eTiqxwa+cavjeZKwJzVD04=;
        b=n8xv6t3Y+ykhwMKRrOcUBZjc+fHYwKrfRVr47eXEWALsIP+nKfZWXSG+ptNxymmEPV
         FAXOGSp/0nubrwoSf/uS5PJfeApJjytZN5sdSd7xH1HogcFSoz08MOvvfFy2F50PNwT1
         Y9Ia8bpDTAKjs/H5OpyjHj2BStCa/BiX9Q1w63cY7vL301sQbreO+trAP4V0OwQ4Vsl1
         5JNyXN4z8Kr+WMoQWDpzTRk7uvxTkOgU9ZT3r53OReJV1vQqafscFv46AZSLioxvjtUx
         9QjcJlvImZHJR/LbEtyrKjMXVC/EptLvll4a+frbf9gVsy2ksNM6BIimjPHGvQvKLsCZ
         O3oQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1789328500; x=1789933300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2oFQ8qNlHBe3RYmZfeSmFS5X2SDU60h3feX9FkdQ3Ds=;
        b=I8sFL6Q+DM54DS1jqLpHl8LRDH2BH3wEv2VVMVdWWX4l+pUbhvP+mXRK1LwfswtI5I
         LD7tXObHzqTooDWMioIjKrFTteqZd3F4ORV5tAOdJGwYq3OlCV8oCQWcc7SSUdXldKCq
         cqVIjuwPKnq61r2HBBrk+adoCp9DvIE0IgEBeWV1Z0ts8JRcIPrwfdWqRBPNS2unhtBm
         2NE6/mJLRJc4noJZ1zBUITBSFVMcarub7AnSWNG+1y6VkPibRKC5m5oHY2WosF58Xjtq
         7M2wPsAyaGi0jOjGYFpCj0hyCwbNtFFsTXCM2olkmAaF3EN5yIXsPR85Bq7Tv8+fDeK/
         I7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789328500; x=1789933300;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oFQ8qNlHBe3RYmZfeSmFS5X2SDU60h3feX9FkdQ3Ds=;
        b=lbk29yeT6q6qePsV40cne8ANECslo+hXbAb0ezp7la3jVjkjn4tbo8OYk557W7sw42
         94JUPJ4jg1DwcWXqBmpwRl5CQKKpCBfOF9ygXUIz8kKJ3xTQzhKIxgSdv8qvqy2puxnT
         TKIDtwOZq7gFIWNjV/48LECswDtyc04Q6ifXxI56p4Ai5gPjLk5448TKW1ZyVa0xIWoi
         jnfZxEfpyWp6Yfgs5DmMQEEsdpeMWdH3JAIaXhHo7W15Ra9+AB/wv2l4UHX+8ElCoeSW
         KdJR1gascpbuNnpcu4BIkveBVwgMt+f3cqlVo2k3aD/cTbnmio9Fq+3AHBBWATbdFC/j
         MqRw==
X-Forwarded-Encrypted: i=1; AKwUvBwEpJ1WfbMCJyErs25qjfzaeFnfsTpkZ5P5c6X4Hb60Qv4LukI1gQydrf5Ap14K2qdg1ORUlBNtgERnPl0=@vger.kernel.org
X-Gm-Message-State: AFuF++nPUUQWH7ly0MG23S0zzGhqLXmeGnLd7p6K3WJ9F7BxchJHbVqB
	LpgTLk4pwq55Y2EE2849DUKiqSTBlk/wVBx5dO7p37B+pt5rf/BPufvDsaqbcpvco71rAPvXSTj
	rqucB/coly5F/eAtYuViTnowBpFLuRG/rWDEgxyaE
X-Gm-Gg: AYBFou0LVataSEcjah7NcD+oPnQHDzw4/18kGO0amX0OUotSrS11ptJEifowJQ7hId2
	an2r1FOgskYyzY/rLccMJA4LrCkSZkBXyRljVzV+inEv0nQEIAx8Y04DfX1lXJ0E4hbu7AwU7Ns
	EDz1UPBEJR9PUQh0YUc0KKNXBAHXaM80a4x5SYECyNrTBeRz6HP+Uw/wyh3kSACh3IaAggkgoMf
	hH5Y05S9AEwyGqwItbuV/Sv5ztfyFkLGCcXyZX0KToWAErxuvT/W5f13T1ZRjs+hKSJ2s1hoafk
	l/NKU3cja+E9RVhUgqBjamp3nk5WQkqOLnzCuBF0IavS7G90ofEtsbYNT4sfy1vOpx2ro5XZGl0
	ZT30Rn6VGPhm7pCTpuQu5lg==
X-Received: by 2002:a17:902:f691:b0:2dd:4168:7bd3 with SMTP id
 d9443c01a7336-2dd41687cc9mr192016495ad.12.1789328500077; Sun, 13 Sep 2026
 12:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909193719.518517-1-utilityemal77@gmail.com>
 <20260909193719.518517-5-utilityemal77@gmail.com> <CAHC9VhQHZ+ngFdzKqmnzBh341CGEg-jexu+QYU8=1qXK=u-x-Q@mail.gmail.com>
 <aqHUw6k0Mf83CGFT@zenbox> <CAHC9VhTM7emi9vxs+5Za8Hrc_e9dg7fZx+Z6BGUc4VQ1qhEAUA@mail.gmail.com>
 <DLD0VQ3D8CYC.3V5ZT8HDMY4IH@gmail.com> <aqTZdCz6JaoK16Fp@zenbox> <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com>
In-Reply-To: <DLDL7KK3FZKU.17ADLLWJVXB5F@gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 13 Sep 2026 15:41:27 -0400
X-Gm-Features: AcwNN1VcrFQxF6bGTrpFFvwHMnFPs9vUMnDUrZbPiYQYi52EcDs3N2117Jy3gRM
Message-ID: <CAHC9VhS0JckwfomqLTUJkZZkDSgeRXYOjMmPQYErgYynQYqMKQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 04/15] lsm: Add the bpf_lsm_policy_release
 kfunc and policy object destructor
To: Justin Suess <utilityemal77@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, kpsingh@kernel.org, matt@bobrowski.net, mic@digikod.net, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, kees@kernel.org, 
	casey@schaufler-ca.com, gnoack@google.com, jack@suse.cz, song@kernel.org, 
	yonghong.song@linux.dev, martin.lau@linux.dev, eddyz87@gmail.com, 
	memxor@gmail.com, jolsa@kernel.org, m@maowtm.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 3:33=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
> On Fri Sep 11, 2026 at 10:26 PM PDT, Justin Suess wrote:
> >
> > If fs/, mm/, drivers/, net/, are permitted to have kfuncs, then why not
> > security/? kfuncs.rst doesn't seem to forbid this.
>
> because fs, mm, net see the value in bpf. bpf helps these subsytems
> to focus on their core technologies and moves policy decisions out of
> kernel and into bpf.
> while lsm people treat bpf as arch-enemy.

It's amusing to read this when just this week we merged a patchset
into the LSM tree for the benefit of those writing BPF LSMs.  If you
look at the discussion around patch 2/2 you will even see a reasonable
exchange between Matt Bobrowski, a BPF LSM maintainer, and me about
the patch.  Alexei is obviously welcome to his own opinion, but I
would encourage those reading this thread to look beyond his comments.

https://lore.kernel.org/linux-security-module/20260904-lsm-mount-idmaps-v3-=
0-920a1963675d@amutable.com/

> kfuncs are not stable. we keep refactoring them.
> while lsm folks treat anything within *lsm* and *security* as stable apis=
.

Most everyone involved in LSM development knows that statement is
simply incorrect.  A quick glance at the git log, our process
guidelines on modifying LSM hooks (look in the MAINTAINERS file for a
pointer), or even just the patch I referenced above should provide
quick confirmation.

--=20
paul-moore.com
