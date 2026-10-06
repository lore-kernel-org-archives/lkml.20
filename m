Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B16318EC7
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258599; cv=none; b=qiovLYiSWzVZPHiUrqbOIFBabFfqXndiZX+C+sulXuI+QAm9Ydxh55WEAavUSDockUg0hqwvyS3RF22rqFpJ1TKZyD6IvHQzVQd5IZ13mTwS6mdjEtjLdX+4qxAlAEsb7sw/TYorDbjc13Ke6PF22+ySTSgzuuo21Em5yha0BgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258599; c=relaxed/simple;
	bh=9NW5It6o5eoUftkY9ls5gsc+2gvCsipwEhZuTUOLJ2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ta3ABnH/epnlCOuEWNPlyNYxfsMyavo3Gvxt6Dt8fOTfLCCbtpoEziKjyHoYg7ldl9i6kDxJS0AaCGNRsq/48xaH1WaQ043ojPn13f0yn2+SxNAXinr1ii2xpb1kIQpDD7ehSy0pKljByplwbGPaoP2zrYC4X2Wb3TQsnmHFKt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XhnNjAWL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7dUK5yh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XhnNjAWL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7dUK5yh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791258595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ikmq0G2vWuzS8RQjLvE7O0ZgTT2QCtc6oU8WM5b+mQo=;
	b=XhnNjAWLVsgwxjJ7x2WM2t5njlqOGejaTBLuoCGNPVbnvPOxpNu86ufQXy6pRT5Wv3sUcf
	eQ4ykXxBNishJE47jijz2x/YFH5IvnxefEiiIg9ZBIkfQaneV8nL/skbfWhH9IGvVwsWyj
	xA8jtArtBJUuiT50kO+Azes1fgQObzg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-flF7Wj10NE6rsKryoYFR2Q-1; Mon, 05 Oct 2026 23:49:54 -0400
X-MC-Unique: flF7Wj10NE6rsKryoYFR2Q-1
X-Mimecast-MFC-AGG-ID: flF7Wj10NE6rsKryoYFR2Q_1791258593
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a82c7e8fcfso1157355a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791258593; x=1791863393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ikmq0G2vWuzS8RQjLvE7O0ZgTT2QCtc6oU8WM5b+mQo=;
        b=f7dUK5yhacwKsVqOojRTtDU9rJlde14D8YS1puw5ExeyN3/GBHqJFkTjsIqL37Fpvz
         N8xRzdLUFAAZaVGIRpu0L59bRT43E6sewFi2sDP2wJK32BAHkXn1MAMyPZaMa2umVtvl
         57IOZTxX7oBnfjwQ2ybZqHEXiQAcLugu1g4WV9X6rzPtc0KK7xhx6ODD6Hg3mE0jYy5z
         NCkF3JmfblFjcO4X106sR2waI84CO2DY+oqyH3WLE2xD27e7nbzZTbaDHomDWEmytj+P
         XcbbFGPIshlZB8YSpu+SNgRwvjnyyYpQrEdYUAKmEB8z70d876l8cUaDLY+1jcJMNDlx
         8M3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791258593; x=1791863393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ikmq0G2vWuzS8RQjLvE7O0ZgTT2QCtc6oU8WM5b+mQo=;
        b=EPtqW+Zl6iWsj74xsSqLN4Je+F6wR06s/RV+MbY5wi40FgrP3j1uKxlWdPRjfnXwZL
         PBpYiT7bjkekr2vd/UbfBXSBmbWJABnCWgcFspUsXCZQBo4H3pA6Y/8B/yl3rkLak6Ns
         /hHH5Za5g6B6Ze5vb/RREygB7BzkgkMoOKKlFHtBajAWP9QV8Ej5XSk1OPvFqhPK6hyf
         vW4yMaDovzSxrfjOuTzs6hmiyy2uVb1ZCvz9k1OX2wm1ek38TD/0frZs+5ynJMVkkvSW
         3hIDRl10du4Q0P9IYBMMluHnCiZt1hSSwFQ1J0ImWPBX+WwG2P1+CRCccso6i77m+zyb
         1BQA==
X-Forwarded-Encrypted: i=1; AKwUvBz/lu3Ybf68XO1+bgfxrlXnC/x4/E/sy2NmtBWLijHyDXU8xLVi321U/5DPXpUBEfjMFosLIGjA9gBHeKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiMwgJWAU7Y92JLxzBthjnI2NiytBu7vNYAROsalLLqc7W2O04
	RnZeFd7oeVSAyKG2NYruJrT4MA2rMwqxn4/W+sU1t6+g6qF9TBxoAz1cJ8rvhP4phenw5uyAsV0
	d84fwPYDPXM+P2m/V6aJAhfkEN/BzFl+VlEQCRk2qta6NtRU6PWT3ImnHWH0BNFU0yg==
X-Gm-Gg: AYBFou3VRc62EJ2hbgtyEkMxUFvN3t0YE6Ka/rIHi9LhOFkp45dKWJh2C3nR8Pj1Ibo
	BBNmM4IDp3Dl6VHr5RNJy2+mVa3VdE3fGz33oFSDbdnlGVLz++cxIfehdP8QNmTOzpTeVOPW/X/
	gA4R85Mw4LGYtMuaBjMp3kUNn+5FpomHWs1T8uMzAHxwezg/HbD2mk7KWy7YArWliiZw+4f5dEX
	TefQ2INrNkc/dBK65eG64F98z8ymCVYg3tJMGyb8B+TL9wKIEtp0dFLwa1qE74WboQX1ow8Zqva
	z8jzcggaMtChELtp2RcNK606ZQu5Bbzu9eCY0xOZIdlDvew2GavgLCXsh+kD3y25WQasmbgHxQf
	H0fkZOGLdzO4Q/59KDPJzGeZMoQXyluPYJBlTFdWfXg==
X-Received: by 2002:a17:90b:2e45:b0:3a8:1745:6c01 with SMTP id 98e67ed59e1d1-3a873697b75mr93402a91.35.1791258593284;
        Mon, 05 Oct 2026 20:49:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2e45:b0:3a8:1745:6c01 with SMTP id 98e67ed59e1d1-3a873697b75mr93373a91.35.1791258592828;
        Mon, 05 Oct 2026 20:49:52 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853889667sm2507543a91.1.2026.10.05.20.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:49:52 -0700 (PDT)
Message-ID: <2e83d025-2edb-43bb-a9fe-cdc09ac2320a@redhat.com>
Date: Tue, 6 Oct 2026 13:49:42 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 20/23] KVM: arm64: CCA: WARN on injected undef
 exceptions
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-21-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-21-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> The RMM doesn't allow injection of a undefined exception into a realm
> guest. Add a WARN to catch if this ever happens.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/kvm/inject_fault.c | 1 +
>   1 file changed, 1 insertion(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

