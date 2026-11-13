Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794570444;
	b=rsZ5zEilJIUYwy6MoBcI0raW71vZC72K1vNKT5hvCXgykgUFUkLtosEvP3XJJ+dYk0bU
	 jU9RUwY43MJ1QT9srVLa8INeQkUzBiokIhqLGYZe45EUtNjr+7Ik/PpxPh1rFZeg5Gn9h
	 msWbggZKX2uGfyz9R2Clz8V5nr+8hXgtB7Odn94DdzvNCKPTtiVycDT1Jb2Qdv56x3mXv
	 SU877sX8YsotkqAxM65J3fCd3MoEfxn97b6aIns/DvunFB94scW7yCgecLLmW10XJK9o1
	 e8DBuTAXRDofvyAYbPGtyALoXR4ZHWoMTx+cI9X8492WEbTxW7nw6zBMBf7VFJ/eE0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570444;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
	b=4Sz/qJvKC07mBZ9fiwP0GI9gLk/JUWexRFORqWFp0+r0lfRVMAKd8cSQ3aSMAy63R7l9
	 AQH+7Fp4Imey+y3CgwPI1Tv9PTpRJVZYKlbIcwmf6xDX+up9aka8CshJljG5Wn+/Hi+wi
	 EmtYw9k44NG3cJsAiD2VXtsu6FDH9JcxDW6L2LsEGXe6dPjsGza5MGjKGIgRzTDLpDSaB
	 nByvoMFiWQGdgdYNjiu6sw1vBkCxQHMkfsrNHtSI/lbRE8XvVmDzhOFHFuqsdMao9/BmN
	 6x1Nkqbwxefoeq20Jw4Mq5EjjM72sB9NGCjy7QNwDurc35XfzkCqXLIWP1Odgj3lt4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=UUoakxNy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B717606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B717606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=UUoakxNy
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so12150915e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570442; cv=none;
        d=google.com; s=arc-20260327;
        b=XSQx4bV8tud+96eWizX6izqr5UbJfjsP09R2QMfSr8cBTfXl03ycivZT7JXVzFvRo5
         Q/p771gGgP4JvKkYrzcz+mjA+2Bv+orc3KwJkTPaTSI8pfBaeb6nA9Rc7xxAQXc7jH3d
         lNNN3+GsWipyhHso2oz6yw7G44nUPMQ3UB2j6zJs0qTv+iOcewzv0MslDXSeZHKT7cC5
         CcOnNC+R6Y8ZCWrQOzTbOYfK5Ogf7fN1UNizAL1O0eP0G/Chw7ELH6yMdzbPtdes8uZf
         j3OZZl4uFXsSgsFLpiBxo0DAwNG2/rJDQSNTU9dSoayUVQEI8ph0+mksyan/ZQLPRkqj
         KH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        fh=TkbzvIwJVbQdxVARSb6yXQfyUV6wgUBbdNhpJPV6bW4=;
        b=Mxhs49hptrh4xMdx2V9FJb0uFFLA7DVDq3+Ad3N2t4IhbqY2WebUyKH/iR35+WOX3y
         NmgNaKvmLS2laXN/B7XbJcbZ73mTwwfwkXNhBvMZOUt3zoXaWZD/4KRQN/MyV9844B2v
         KFj7nUFsZshwZqwqRHvOPusoiFeONOWBBfly0kzOhaEySdtsE4cKVIBFQ7Skx0g82f3K
         VUBDIIsOkimgqDEcDccRzf+Jb1YgmUkTBPU3jbHK8c2kzJLfQeShzx/OSfH4p1znArKC
         ufoJEDWOQChnRJkavMlTiUI+nnTAyL5DxNdh4Dkk1fgjvRzQ1W26wcxpleE7Wh29jjB0
         vjJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794570442; x=1795175242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        b=UUoakxNygbqaRMmeXi27vUG8S6ASnwGACxEHJzp5RIE3shYglUr3INivptTO7Becxs
         CWfKO6IuWe3SNiRUJpzfSrWM4+l2mO8MN/BbYOy0wKc+VvTk2chdnNkRuSaqwNRahNIa
         Epb0wPZgUDyevHTI+0DzZaTq6BucTXc8Rbx4YHZwafxVFdNuTGsvr7FIUTka9B/lpXSZ
         jjiYTttS7M+ArEAMAj4RfpgOMYl85NdHAys5QAayyX7gqIQbx2fGrrXA4q+/g6ACo+av
         e+kFvFB+aVlLeN01jHoS/kDu4b9AZ53dXLbLj2zSUA/eV5aHzI/F85y8kyrECXd89EBe
         c3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570442; x=1795175242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bKaGn+sVsulirD+PpfXt80s+OYQQHNZq3eHTFDXAqY=;
        b=yUWFRstYG3qit8ejBntcbxm8+Eqs/1shKhqS90o5PTxUe/w7i6kY8OvDlOxsLQ4ACG
         sMSh0S9u+DvVLP+S2pHN+bp1eT1BrfTLbYz8KdsVyw8W4+BH3mtacYqHQGaD4Z2Wdj1h
         h/wqotlI+0gHfThMk/v1Rlf+/G/DO2t7MKYn+oceUVPLyPx04T5u7cvqL71OZAMJh5Bo
         RSM3T6kj+8PpJFljO4cUx30ayZcNFXwNE52c78ZZ8hAyrIpP4RDWbh1UoiJLcj5l89Nq
         4Ovm4epA4hHd/VamrdRd+z+Jz3LruO+ANpjFFkj+rHwDnKJjpOJf3MqL495es4TDUA51
         emoQ==
X-Forwarded-Encrypted: i=1; AL+hErEvNIVuXrAob8xAPg9vItAsYExxQ73bW0gId5A26d/rKmhxw6H0NAZ8aEVCBvJ+DnT3pzT85u+6VENtehQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z98Ua//kC3HIsFe6/2LMYnhFjVfSxQNb2sIIHvW8VjUAs5/21+R
	ak8n4stsHb1xzj4lU4mkA1qsOpoAgHZLZUWVXpJ3L/KqUjn0JCUggPweqxEdiQ8kITiALAWYDw9
	xdbrtmU1vVGQXHE0k/seRYnqGMWJBGfq195BO0i2RtQ==
X-Gm-Gg: AYBFou1xZ+t3ZUrSmJv5J5UIOf9BHr1zRMbKrtKIYbXyihLjmfQtP4rmUiF3HOXUrAk
	tRqgCR+adh4xZ87kgXpgbZtF+KpS54yAyH/4yb5SLWZ6yl3oiVIJIJQp6MtpzRfGG68ylVMS5/i
	9pCMXb184J0+BRqDmqK+P6FBHirmAK7MkqCYgU77r8nrWQf6EThHo3hdL0lyWSQVi19AKpdV7Rb
	0pNizb9jlc4qCDG6MWDUCoZM9nzjLoeh08YaWemjdMze2vOGIwS6/KFWEIb3CXOESmUZ402yxSX
	4vxwO+r8Ibzi5kq+Nsiok8FwWA9AtecG2o7zgYUaL7JuJqAhuylMSfm7jvwGtJVtaC9Uu/Vasxx
	7x/jAPXI8IUzfT0kbx/O6g2usP9R5G3FWOzxPxBIBaZZesDQtvdZRWbMdZjx1/z+JDfFt+IHs26
	ycssGDmFrHozKd9QW8SWBi+Za96ZqryTj+Tx0vcmhU0JLDFTOHpbsyzcQ=
X-Received: by 2002:a05:6000:2006:b0:490:6e0f:a024 with SMTP id
 ffacd0b85a97d-49c70b051bbmr5548639f8f.13.1794570442359; Fri, 13 Nov 2026
 03:47:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027062602.323691-1-qingwei.hu@bytedance.com>
In-Reply-To: <20261027062602.323691-1-qingwei.hu@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:17:10 +0530
X-Gm-Features: AclHuK9uFGSNKoGCuQtKwYDOZuyVTnpTYaV59-nL9mz1TmdnUXZYOT-rcssss70
Message-ID: <CAAhSdy0bSJQ8mhWDu+zYW8dWowtcV-mDGHKyp4LSmvnbLWEimw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Validate PMU counter info using available counters
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 11:56=E2=80=AFAM Qingwei Hu <qingwei.hu@bytedance.c=
om> wrote:
>
> COUNTER_GET_INFO validates the counter index using the pmc[] storage
> capacity rather than the number of counters advertised by NUM_COUNTERS.
> When fewer counters are available, a guest can query an index outside
> the advertised range and receive success.
>
> Validate the index using kvm_pmu_num_counters(), matching the counter
> initialization and read paths.
>
> Fixes: 8f0153ecd3bf ("RISC-V: KVM: Add skeleton support for perf")
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch as a fix for Linux-7.4-rcX

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e095d1ff439f..ea788619091a 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -560,7 +560,7 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu=
, unsigned long cidx,
>  {
>         struct kvm_pmu *kvpmu =3D vcpu_to_pmu(vcpu);
>
> -       if (cidx >=3D RISCV_KVM_MAX_COUNTERS || cidx =3D=3D 1) {
> +       if (cidx >=3D kvm_pmu_num_counters(kvpmu) || cidx =3D=3D 1) {
>                 retdata->err_val =3D SBI_ERR_INVALID_PARAM;
>                 return 0;
>         }
> --
> 2.39.5
>
