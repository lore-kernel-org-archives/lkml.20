Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43154A4845
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360813; cv=pass; b=UXeUATCsWv/SGGT1NTmpsxgnTvpsM/DoVrFgctFBmSBu6eX3Fp5b1nlPI9EO5Hk6X1Lx+3xAJcixL7nBcmYNvpGe/M/Zp6ym5MNqrQNsEjUAXxSwAWMYWe7IBPvxEGr9YXnQ2WdR6vB+n3Fu4pgtAX/3UafOfgn5Xl3RMd11nSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360813; c=relaxed/simple;
	bh=LE7CbjR5pflUmJQsDyeScHoohLPNlix0SavkfVNasZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLq+EynUHyRDaMmaRlndY7olRn6PJnoxqazJGGK9zphv7M9frod4nwhV1nih0JkGB3SRYtbJrTe42fYvcdfaWkcpWZswbWeMhtQ+Kn6JLTm5lclyLpcqoQymig3rdaFwJyVCiGhDUtdgLAgO5BGEksA3ybkIa7ibQz3oOPNInvo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC4f04G+; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC4f04G+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so6890075e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788360810; cv=none;
        d=google.com; s=arc-20260327;
        b=ddvL0XXz+StfD3qxf5xv81zaJ+o5E4wAzxRlxE5uuKN2CC2b9Zmf0ZQ0eug3r9ky4+
         wDJwAtIfVwX7DetleKgdtwILTQuQmTelkW879oEUoy56fS8gAllmTsYm7yXyidlNI1gl
         +pNmuIQHMD+4ST+M3bbJQO9VZ6V5w4/WiVybK5kxl8EkM3+pVaGT9PTlvvrcfRtK/OGN
         mOnedJEKXqmsLBYICA0cn1PLTkV0MR55VrknQC1WF0ynOBfRnhjAiSaLddfiQAzn/qLe
         t2tjjvBkJhPJbFwS7M6aBqQJp3bf3nX3AiV/OmVAlCAs4xL7EJJJQ1qbK33O4R93ys4x
         /9FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cz1/Y0DZddHarQG1HOQ6HanJnePLmDeFZMT4+NnMnkw=;
        fh=PfR99usUxvYWTnH/a+kOZbbQDzTdSog7uy0fvOrlLTQ=;
        b=YxyB/2HkSAenunC9cr5APOS4w8uQqojBfWpGRUrxvs+JihNYKeBQ1419x7uEmFoFsm
         YN7w1dFIlQJS5HPlCtzytMBl+OTR639KMPlEYztcQmxKsPthhE8O2GQKXsNU+NuIZxxA
         5/2/aDLkO2jNX5ZM3DuGQg5UrqErXa4thajfs4PbZBU/eDXKjapmwP3x1cDwYKZCZIUk
         kxNvvNdqgmgJpfP2trXjOPBcLsznbUnrz4qdyaLaPxWIlkFg/iqpQU8GCD3fOxKonZeU
         W76rNyYgYgW3G4kDZ7v+RAu4cmCo3UwexwTJ3BdSCVgCrtWA2nckvunHrmavSADCHUU1
         hEgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360810; x=1788965610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cz1/Y0DZddHarQG1HOQ6HanJnePLmDeFZMT4+NnMnkw=;
        b=mC4f04G+qSgtW4AxmpcRFTfvp7fL3RCRFSIDcfMz7dciNmSM9CP0z7oLMknotlJTII
         rIl4LPreq3kg+G738wCSGJCm64rRZjf9l2C2oVDwyxN9cpwbZl9kzaRe4B/94fp8gB1k
         h181NE++b9i8LJ/IxqotBPr+5ypiHNoacM55gn+bGkkYl3ffe3xFuk4nc7OkDmVZnuPF
         VpMWLt6ZZsEE6d3hVRrrHWnL4t4GmrphrKDp+diucYvHDTv6SjEbvi5bp47QCCVUdIYl
         yZgzG2AWI91rLXpwhFICZNxmQgz3cGNlJodIVGVILp1Y6T2BQ4Z/xF2dNoxe0/c/pSnz
         OwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360810; x=1788965610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cz1/Y0DZddHarQG1HOQ6HanJnePLmDeFZMT4+NnMnkw=;
        b=oT+nP7wC+xX98eVNLEV1biCeabi96c67mg4vKcS926NFCzB8efEVco/9db9N3dm9JH
         +XYoSLAohWgx48CF5I2zsVcTorOw15upj5j7sUskB+i/fYGpq1VXfegetq1EJ08C6bJw
         OYyC6XaiJEcjxtf0tCdG6ceP2Cx/yRtmkW2cthmUNI+py7ievQu+vRY6EegT7t6O64xD
         Ws/UBvyJoFF5AH+28eBVxMzH9vKjAJPI8s3srzcjHeWtnQiEHn9lo11zQ/b9/owGZoXF
         KSctL0Tj/A/MJp5Pk49FmBw11NLRkLDvjnRXvpizmW9lO7gPuT2Du3BIlWG0uh2+VlT4
         AhVg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+P+6PthR5TKivE4n2f8nYcCHYskc/KheiZDGRDVUne0tSIrQpmrqyhXPwRR5pb6UxEbKt/YlMQj06YxU=@vger.kernel.org
X-Gm-Message-State: AFuF++m2aOjchHTYcIoZY7EcB+nh/plh+QYzKGou7JcTwkb7HH2kYcaL
	ZQcJhILnmzukPLvUc/Cev7AAaibbIoa4JntqKJDPIMsMVbCRtqBt6QVFstxqVWOfai1kr908JPr
	bcL7JbQp0r6YtGTnNTdnnLJspq0mZ3jg=
X-Gm-Gg: AR+sD10POjbSqQKV6qIjT1LVSKb/qtld/VXC1fWX6g6LttQKkdmA8L6+5D1wyzfauM/
	C+HkVh9fUQU8gnAwpDXqQ05HZdzNc6lBSHiYE1bXv7HKsxj6XR89xMPzEkWd9NNbRRB5HR4Jtw3
	wT4vv3FQrRdhsaCksNLst0skPMrTedQZEGxvhnURIsp7i9hWuwdKPzXX9Zj6ezoKkSxxBPgG46b
	2mxhSFvLc6fJ1oosEa+IL+N/gQF1HDDcB2dzM6IBYFVqgLJs0Hmd/wLt8dpH1q3BKFOfm/KCJ3X
	+o/LAyhfYEOHMonjjl9wuALyqyCC9uF29uoH9OoR7kBOzRKCyFr5UArYVI2cCF6/GL1SFczahRz
	awORDTrpwLxoU
X-Received: by 2002:a05:600c:8b86:b0:49c:d27e:8f7c with SMTP id
 5b1f17b1804b1-49ce5843b42mr98947975e9.12.1788360809577; Wed, 02 Sep 2026
 07:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn> <20260827094509.1016740-2-hebaoquan@kylinos.cn>
In-Reply-To: <20260827094509.1016740-2-hebaoquan@kylinos.cn>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 2 Sep 2026 10:53:17 -0400
X-Gm-Features: AcwNN1W9lD2KQqogdRdP50s00M41nMSGQxjnOM7hJApnRWk36-ObH5j8nvh2NWY
Message-ID: <CAKEwX=MqTYpZAwBDOOzdkuo7NP0JFRjFdQaedtrjk_HCNmTSXA@mail.gmail.com>
Subject: Re: [PATCH 01/16] mm: zswap: return -ENOENT when the swap device is gone
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 5:45=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> w=
rote:
>
> zswap_writeback_entry() returns -EEXIST when get_swap_device() finds no
> device.  -EEXIST is the shrinker's "page already in swap cache" signal,
> which makes zswap_shrinker_scan() stop shrinking entirely.  A NULL
> get_swap_device() instead means the device is being swapped off, so the
> entry is simply stale.
>
> Return -ENOENT so the shrinker skips the stale entry and keeps scanning.
> Independent of xswap; affects all swap devices.
>
> Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>

I think this should be submitted independently of this patch series!
It's a small, self-contained fix for an existing issue, no?

Acked-by: Nhat Pham <nphamcs@gmail.com>
