Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E03009F2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256236; cv=none; b=cT9+x+kjQpLrzrVZfCWtk9wxAxbcB695AmsFmVZzrh8SMe5PIhJYlbp3EfLDYSyKLCTtVn6Xcjdxjpdc83ywHVP16lLeoEqxdynNDUyyYVKDV3WIWQ6ghV7DDX1eIC1DJD30VM0o7v+KLKn/V/AD6jMy4mpEe1TLIJ9SH38xnl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256236; c=relaxed/simple;
	bh=76WpONBN9qNsewPTXdIKmJj1yYZGsKR8SJ9xH6J+4Rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GEn3jym0BFieJtH9NMUnX8fP4r6W8+T++OqXN+QHHqizQmhSvcGc0gppMSLRLb7A5UP6BTbZPwXvZvBJ+MocxHbseAH/RAaNUm0LGE/EDd/hx7Qi6Xa6rw+PMBuqACN8IWFM6Xmfah5VgNKTyLUAIztoMZPXhBsGJyX478C4BJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ij7sOhlJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bLSaoDpa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ij7sOhlJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bLSaoDpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLjBEqzF3bLvG463L+dBKbw7TfCoymi8l+jbKvUBXR4=;
	b=Ij7sOhlJxZbOeQ4c52K85/KW7+CnqBH/oHTIHMIdHqA+sVHz4UDvLykL4RPy1RcHsDmIJk
	lFFvIUM4doxuxSAVKrdmjOS8psBc0y/hF3kM8M7OKOp8PEg0B+3ORWRTlOaK+LfHza0i2a
	8/xCoUEw0J1BABU6celACK5OjRt9Bhk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-UEGgwwcZPx6ZMPChn1BwCA-1; Mon, 05 Oct 2026 23:10:32 -0400
X-MC-Unique: UEGgwwcZPx6ZMPChn1BwCA-1
X-Mimecast-MFC-AGG-ID: UEGgwwcZPx6ZMPChn1BwCA_1791256225
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so644598a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791256225; x=1791861025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLjBEqzF3bLvG463L+dBKbw7TfCoymi8l+jbKvUBXR4=;
        b=bLSaoDpa5y1s+n0JlgAI3NDISV8H6Nsdd68V9Q85uYnc/sc8THX2eewHeK0DbMyfju
         wA3MPXUv8fcnbbITWG+Q1zKOw229qXezZRdo2cT3nZcghfj87ThpThnKQq+bJkrX/sdU
         pd1Ncx9b/5s4L1gQnAajiaKpYKozFwl3kRFVdymNhmZI/MUZ+69YVyLg93JcBqWXvk3T
         q5PBhkMNqACBtaNCUbY6DXkwARpJK0w2RRRGDaZ9aKxd4M/ldleO12/IaYxgyb6cD6po
         WaDaLnlxXjbRRRvy8Jz9INxRHrH1fZTudNlLZnlA2BbqY9bA+SDNJJSrZI8BO3OTBl4/
         SsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256225; x=1791861025;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLjBEqzF3bLvG463L+dBKbw7TfCoymi8l+jbKvUBXR4=;
        b=uSuUOGp2XggHjbq2LB61myR8WXrx2a+ytnjNScyLrCKXE/VLJfqZvemXtwh5FfBsJH
         t7B1z+yNcRoSPwbb8bVaAS9JkU7fSycFLFLrDymDjnfdjViq//2bxKbS0azT9WMUyAyM
         69oTT4BlegvSOnHo35uVYpdHdIFkY+KXRESvQW8/DYtWMS/5O8nNCxGBV/0vhRBjuqL7
         m33EMtoOzbQtROqpo5hQLc7EP6pyXuXabCCgarkcQI/aRD8GF/3dYWOSqSPAaQc5qw+X
         A0hHsEtO7nVe5qITjsXE5lf5rEelIJCK+kKQZzlYW4pIo2wNFZFkBJyxEfmxgvZGp/Ve
         i3iA==
X-Forwarded-Encrypted: i=1; AKwUvBxYwl4CDuicv48SS6+avXbCT34T5nmlZSs1kr4b+aYkWdxCt61tQ82vK6MJaDnDYPC7u95E8Pjo0+tjqlc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhEpyS8q5NvcAsGmBCfZHQcL49gmQ7b2QkjeX9M7El4Q3cXdFg
	F5AMoPObtR+uwYsmC4J2s2O0qGhs0+Ne3qFIpzaQXh9vey18L2FAxaqzsl8J2LiIUiR+yJ6cbc8
	ukn73QtcHZzBSGbVBn/JdRPvuD3JyCmr+rRqkT4RgKqe4wmE9B725cy1GFSJQjSjsMg==
X-Gm-Gg: AYBFou0IkTlJyRQQGJwGUYIlcQV9NY42nEelWW3QFdvGa70dFgV1HLS8RG6cZRww4UU
	y/eRQbBxOcVNZ3R4C/IsJ5DujlsMCjfGIdwhsrY9MJEaGeEUVgrtLMTnQvb1xOKctbA31mAsNUp
	5UM0zIR5zwedK9cdmDSnIA7cKSH19yt5/iqVMvslukyI9X5NqBwKdM4NdfQmEPUDAfPXKTRYvVt
	YRMfMtQBDMMk45FYLiXKpit7w0u0wa0NZ8Uu0FG2IFxWg7Wq2daH51h9Hx17wOmi5cCW91c7wF6
	MfGLyyOmLAS/CdqMVJrpNGqcEjWpUhNOMCeir7t0fZfbI+cWc4Y3OJhH8NHSdIr/utXzzR6XhEk
	kQ1mkkew4VNYs1mTWtrgg3r6FxAhYJ2GwDhZytoM/jw==
X-Received: by 2002:a17:90a:d64b:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3a87368d0admr19234a91.19.1791256224569;
        Mon, 05 Oct 2026 20:10:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d64b:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3a87368d0admr19217a91.19.1791256224127;
        Mon, 05 Oct 2026 20:10:24 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543b0c1fsm3110944a91.14.2026.10.05.20.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:10:23 -0700 (PDT)
Message-ID: <9f9575f0-be48-4dd0-ba1f-98d8dd39f10c@redhat.com>
Date: Tue, 6 Oct 2026 13:10:13 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 14/23] KVM: arm64: Mandate VGIC v3 for pKVM VMs and
 Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 Fuad Tabba <fuad.tabba@linux.dev>
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-15-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-15-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> pKVM does not trust the host. Realm VMs follow a similar trust model, with
> the Realm Management Monitor owning the protected state instead of the
> host. Add a helper to identify VMs that run under a host-distrusting
> hypervisor.
> 
> Use this for blocking ioremap of vgic-v2 into stage2 and prevent creation
> of VGIC other than v3.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   arch/arm64/include/asm/kvm_host.h | 4 ++++
>   arch/arm64/kvm/mmu.c              | 2 +-
>   arch/arm64/kvm/vgic/vgic-init.c   | 2 ++
>   3 files changed, 7 insertions(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

