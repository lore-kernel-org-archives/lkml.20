Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3943AAF61
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156000; cv=none; b=qJxarCnjaETo5lJ6JkMxXs24kAzYAlbP9Ijy8zGj4TOiNEFus0sT8PyxC7y/ThsqnnTevoVLNm13ucOEQw44ynYJP8h1R8s+fhP6smARjxe4pdbUeNpVELrwviB4l1Yq2wh2rR3jphn54A0Kp6EYZk6SVkyrP/396kEVAzAFpnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156000; c=relaxed/simple;
	bh=bGtlLNHZeXwTDuqeOaNrwGY3uLSH0iJMGMCr95unclU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGAbdUk27/45rBSzfIky105Wxi2IRjabfqpdSFo86f+2pCUZdaco75RAdzksXQxW3GSMlcYWikkyKhem4QmXBCeAhSahq+RG2rKPs1FW6SNISpqmf/Z4aFc90hpZd42MvAT/CWXnLhE4jxn+1BAzQ4PgFFQLd2ba9yAQRnriRc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3xj7/IF; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3xj7/IF"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482e4998d28so2092151f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788155997; x=1788760797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfxbA2i+f23qwNxWpVJUWwp2eUr44EFO/Ti3rWFq6J8=;
        b=n3xj7/IF9PB8BcIKcHffoy+jJQvVaSGxxM1DmK91/CAoTAt2IWkPAyONtCyDsjjWvY
         6nvN8ngjhfaVpicCW7t7LzfyZr7w5MMarWIWb+D7PCDu0ey4klLCqI3NGwzEOpc8fdDf
         JgqI/NvF9CAoxossx1sjDnTn0LDVILaLpMG+x/IrsJ6n57QM8rE+heCtmPqWXl+2YpeM
         zzKdvhWobHPE7lb0LY5Eayb9IbSvepg/RhVywfGf5Rhgy1IJhvPy5ZpN0Y9KnwEDzknh
         lQ3wNLH6N9fWNeQHPZz/l/cH45yEMJewD5+RdLUuB50bmqUibmJWLpJHoSI/cQhXKTcf
         KySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155997; x=1788760797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfxbA2i+f23qwNxWpVJUWwp2eUr44EFO/Ti3rWFq6J8=;
        b=EvHH4bYvFD21BxttXCXSvcu9FSA3+BBWfYdyiYNvBzt5e7VfsuuYEuY/mllHC7DexL
         L9BgQ56ZJesDwPy5VUJ9zvuxM7l9VmJ8je+q5cV1mLU/6Df1CbUHn8U1NEZb1bd74nV0
         X3bz3i6dXRz5hIgbqdBFhq3tM1PBTWeUNcceME9+d4eDRMXhfNDJpn0vjODnuCVz0S0M
         /9JHfKaaqEfzyTZBF1yS8/ofm913RCpj2hiJq1ZUksthPf7AD006Dr05nBMK6GFZtjyD
         G+7972wt7/1v8xmGXNB0+YkOYu3/n4gwf8y1qoOWhRlJYUYoEZ+8H9SzEovdw5uOk4Pr
         gtPg==
X-Forwarded-Encrypted: i=1; AKwUvBxSOvNsXH7RMfela3BiyDiJCc3AWPrzPmDEvyMOpzU0TUg++wzIyS6ZP0IYnYJCx1AZt6YN9UimU4t9HAc=@vger.kernel.org
X-Gm-Message-State: AFuF++k7Ft5b5wi8qcdIiY3X9BXlA0ayElnl1OJ+/ypbksfAgvW/gQbs
	wk9vopn9DxFbVs0090AFU2RY6mFAtYrIn3QzeBxkTbyZqxs8nmjYTh6P
X-Gm-Gg: AYBFou03PQ43ASZZb9ZeMqs2FtgfiD5oOv9+F6Vviufmtyk9xnece0MW5KCXvNfcERt
	htFsxSHDxrc30+baS87NagVMnDCK8svzsM1h+WU8Cu9Usy3b2zX6RPBydKfRHuHBuAchB4rjfNC
	teob4gOUvvxtwqZefMPIcflGDIKuURalz89T7P0USMqobt+3o+G654cBUJF3tMLHyWidBjLsKK5
	1BWstxveH7h+nowcZG88GMYT9EzcA4bUC8of6Nr8MpzTUDUKjokomDouOdt4DZsmneJpJvzN/S6
	jbmmI/A24nlaBlr1pj9PSdACLxaQVK9wcNAOyveX+ZrVSqAohK6e8trkqSHot/5a1ErEa/0nIka
	BaoBADpA34M2g6jl7+Fkb+SqBYJZpWhXoxRLCwZgc+wohI7Q4EhUrBYIjIYN9heklSi57idkiZN
	xczX9HaqgHWvvXNdPf8rMZyPI+yWV1vUgvSAHtgaMyKJJJIDbcJJMGNTAMi+gTyVEBdw==
X-Received: by 2002:a5d:5f8d:0:b0:482:ee81:f0ca with SMTP id ffacd0b85a97d-482f79c94eemr36614562f8f.12.1788155996487;
        Sun, 30 Aug 2026 22:59:56 -0700 (PDT)
Received: from [192.168.1.109] ([88.230.40.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843ce8b015sm3251163f8f.13.2026.08.30.22.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 22:59:55 -0700 (PDT)
Message-ID: <85c66385-7a28-4779-96d4-6b34f53b5994@gmail.com>
Date: Mon, 31 Aug 2026 08:59:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: x86/xen: Convert evtchn_ports from IDR to XArray
To: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Cc: kvm@vger.kernel.org, x86@kernel.org, seanjc@google.com,
 pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <20260706081311.13633-1-frn1furkan10@gmail.com>
 <efe39d24a2621ce23f9d53471b3b587feaaa8526.camel@infradead.org>
Content-Language: en-US
From: =?UTF-8?B?RnVya2FuIMOHYWzEscWfa2Fu?= <frn1furkan10@gmail.com>
In-Reply-To: <efe39d24a2621ce23f9d53471b3b587feaaa8526.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/7/26 12:16, David Woodhouse wrote:
> On Mon, 2026-07-06 at 11:13 +0300, Furkan Caliskan wrote:
>> IDR is deprecated in favor of XArray: see
>> Documentation/core-api/idr.rst. Convert evtchn_ports accordingly.
>>
>> kvm_xen_eventfd_assign()'s single-slot idr_alloc() becomes
>> xa_insert(), since it was really an insert-at-index, not an
>> allocation: -EBUSY replaces -ENOSPC, still mapped to -EEXIST.
>>
>> kvm_xen_hcall_evtchn_send() drops its explicit rcu_read_lock(),
>> since xa_load() takes its own RCU read-side section internally.
>> evtchnfd's lifetime is still guaranteed by kvm->srcu.
>>
>> xen_lock is left in place: it protects state beyond the map itself.
>>
>> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> 
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> Thanks.

Ping?
