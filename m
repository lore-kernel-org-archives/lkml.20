Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836643328E6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 22:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788475936; cv=pass; b=aLuVd6U4gXbp9BnM8Q5P39ppXMo5Yks0z5VEXlflsB5XKF6PEhWSo+3/HN/rMcVPH+Kk1ATen7uouIyN0YD9s9eurS1QucQ7H3odaCf3SaQUP2Js8eI2HvQmRNQ/T56zSc1V9DP5NFvRFuhi24oe3yRYqY4J5wjyP3yFQd6qs4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788475936; c=relaxed/simple;
	bh=ZmPc4WmPQ4TognNj8aZb7s34rIht8sNcA+bzZjKGR8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c0V0avB9QJoVj5ksF6h3P7PNKoEhtAXD30pRiWPKazxIlXRk9aV9OysjOLU/wtuEPhL9JYbXPR0i2iSGZqczPqQnZkwmg65/tUlfrXGLt40HUnDujOPyFVkDTdb8MSLEyQUbrEYztwJ/P45WkBE2zj3C15n9NWlwprHeAbpz4UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVxKceZA; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVxKceZA"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso458435a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 15:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788475933; cv=none;
        d=google.com; s=arc-20260327;
        b=WZuigJnYML42fX+n5rdcniTcPFUz58jzfQMpPJuFR3P7WPGsCmA+gTBj6LoagNdSGF
         wycDCQ/iws0Q41d+SoD/+g1vg40aGhrfkP3jBc37Fg29Zfj3LCnXPh1XoeC8kN011fZM
         iMC9HJuFK+OupDo+cTYjCR2/b9UvrMfZtdIgYNG58YD4zKMUn9LXzROskuDnMKj74OWZ
         z9A7ZVxrdLB7Ls2GkEwNQ4xV8NKH6Hu6X8KVTz2JHCflIODNFSS3WFRtR5/wos0ctJv8
         5DoIAa828bMFJQinkaoJii627nzlQuVJI0+H3ilL5FLPiWSMEO8p937VgYVguZct2odP
         zp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZK+nTNHM1kbyPC6JIcQlCrk0smY2zHi+ooVTUMFMI98=;
        fh=FvP7+nFVGlCRynmfDKehOcpmeJ8I+fuDT0VgOpSNpDw=;
        b=hS16kEsKdiIFnMgF0GmACjDoN5xWuaLwmWkFHSnCDgw1qJEnY4Wh5QqQ7dkFh5Ot9b
         r0KjyNb/03dLRD1DQQbXbmwgKZyq62M1KvCBDMTqt/pAaAdEpXKr8cq/iiYgN/74kvkJ
         kYO4lv5NlMKghLVqFPFs1NS2yRzFQ40fgnjk0S4EIxFb7OU3yjAeYh2vMINTm5EmHWHU
         zPQwjIvPLLuSMZ5qHS4OZey8TKwbgTz+rh2UXwl+yWCqAdzCujUtL8r/j0S3u7D9mZMq
         chxQkSpPBoDmF03zxQfy4UNkzek4BkjMa3+eMjp8+K0TC+NEXTf6/uDOltoLumQ1z4EQ
         pXkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788475933; x=1789080733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZK+nTNHM1kbyPC6JIcQlCrk0smY2zHi+ooVTUMFMI98=;
        b=GVxKceZA2EhY7KqBOQRdsmedgtUa/GRLBldto00lhJP4fwLd16jqvyq83QYKNAOY7K
         ltWD0Yh2OVua6Z0MgoOMF9I46KMy6ylwj/zK71KqZaS0ULXKxBNtH/Y4Z+qq07wTT3NU
         Q+AdwD55UITJV5hnPq6pih7zZwldtBo5nDz8da0Y1jNNfBlNR3MvdKK/Siku1kfmiP97
         R7nScbUiYfN0K3Y5OFEcXQOQelpPSjS3AJQUWyrCbETPoDKZJF+zVO/2k//mNE5QA3Zd
         VYwEBLfy3XO7HWWcg/z541GMjAGw8q62KvJgZw8fGxLrWpsP+1qZhraph2VQtqgTIRcQ
         E8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788475933; x=1789080733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZK+nTNHM1kbyPC6JIcQlCrk0smY2zHi+ooVTUMFMI98=;
        b=qAHhPyXv8/pHSMkx7fmsr+ddgNjbLhr26FCutSxD+d4iSdiFeLy3s0FRklfPX5vEGk
         /20VpLDZz3T+DoskpFMQj2ec3BzK4nfqCsbmPEQqa3iHJ/bmmosE6s5KIBHpFTBvB7pt
         tHDSttz++N1OnZHQI05FtfeQK92PJQn52j/SR9qnBzaxEhSNRRddWUbFLYCi6a69Lill
         IzEHxl1asClPx4IWR9nnBm4yIefh9xYZvQqTXqyL7NFwIklwQyukWCnEsjw4PA8dfUMD
         /TN0nwMAuYpRbl4kVqb7TbaQ/Zcf59EGzlLZvw2P1WWsEgWh4K5aSFO/rHRcv/3g/FoS
         fCmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy62wI/3hwhtGJyPEaigW5I760r3AEtiZFgu47lUSIgVQJs/36+SiheX20iM7PMZdiMFjfCxmGrfVrUZYM=@vger.kernel.org
X-Gm-Message-State: AFuF++newhhpju09pYM485MB11tbi96JfezRyW5n6O6RjsAIQcN/p6Ul
	aiTLe1Y0DI6fuf5ND0cVA1Q7jr3T7y/Iy5Vip9nO4mc3iKgksPcZOn77byWaPwQwMXe9+6wiRXo
	HVlgwhKDeNMj39SxsCi8rldfnEskBWJw=
X-Gm-Gg: AYBFou0YarICefcoewHiurJpmgE+AdRQ/cvKopjLPEmz+hB9+HmrFxQwZxzJlStuvvg
	XXJpuSoLNHgjM0VIOCwVRUORTkrk/aQqMRq7NwFhImeYrGEwZF4HYLXX1DSiQTtWP7lcITHHOCy
	lfYLbmQrZGjj23LK4SxEyN0dp1Eq310Cx/9y9Qr58p2aT569NFwQxdGKyk0nTMVo2DwnuWI1lYe
	AtWfnDLCHfRSJRx1njgs5aL0gI0AZjkUDc5r4ooHkoYmqNkPUtEq2OnRh2GXM3i8+BoGaH1DFnM
	RxkeVfa4dq8igiUHfvaD9tITyj+mE2uv5a7v3e/ow6rCP2pJROGQQatKe6+K9K1vv40vecx8tpP
	ZjZnbY64/1zSTsJ5lgaEUMH1IOYECWzk=
X-Received: by 2002:a05:6402:210e:b0:6a7:ea53:f627 with SMTP id
 4fb4d7f45d1cf-6a7ea540c64mr80938a12.38.1788475932683; Thu, 03 Sep 2026
 15:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788277742.git.mattst88@gmail.com> <c3f15d6aa4553dca5c79a4c587c7df0da6cc95b2.1788277742.git.mattst88@gmail.com>
In-Reply-To: <c3f15d6aa4553dca5c79a4c587c7df0da6cc95b2.1788277742.git.mattst88@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 4 Sep 2026 00:52:01 +0200
X-Gm-Features: AcwNN1Uy2v-ASCgUPQE6KQyA6Cx3iDZPVRSJ4sK-RQ5SG8pj60gUcCoQ8GqaZRE
Message-ID: <CA+=Fv5Q_qZL5q4JEDJkteD_LGM0-f2wEtmBncnGANywJNiOcNA@mail.gmail.com>
Subject: Re: [PATCH 15/24] alpha: select ARCH_HAS_DEBUG_VM_PGTABLE
To: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org, richard.henderson@linaro.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Sep 1, 2026 at 5:51=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> CONFIG_DEBUG_VM_PGTABLE runs a boot-time self test over the page table
> helpers: the protection bit accessors, pte_modify(), the swap entry
> encoding including the exclusive marker, and, where the architecture
> supports them, the huge page helpers.  Alpha implements everything the
> test needs for a three-level page table without huge page support.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
> index d7e2859aaedb..87fe81bc4709 100644
> --- ./arch/alpha/Kconfig
> +++ ./arch/alpha/Kconfig
> @@ -4,6 +4,7 @@ config ALPHA
>         default y
>         select ARCH_32BIT_USTAT_F_TINODE
>         select ARCH_HAS_CURRENT_STACK_POINTER
> +       select ARCH_HAS_DEBUG_VM_PGTABLE
>         select ARCH_HAS_DMA_OPS if PCI
>         select ARCH_HAS_FAST_MULTIPLIER
>         select ARCH_HAS_GCOV_PROFILE_ALL
> --
> 2.54.0
>

I applied this manually on top of v7.3-rc1 plus Alpha GENERIC_ENTRY v5.
The Kconfig hunk needed a trivial context adjustment.

I built and booted it on a two-CPU UP2000 with
ARCH_HAS_DEBUG_VM_PGTABLE and DEBUG_VM_PGTABLE enabled. The boot-time
page-table helper validation ran without warnings.

This also appears to warrant changing Alpha from "TODO" to "ok" in
Documentation/features/debug/debug-vm-pgtable/arch-support.txt.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
