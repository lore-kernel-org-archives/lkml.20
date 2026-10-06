Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C28A322A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 00:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791244961; cv=none; b=FtcKYqcGfs91zy8JLpw9lKFHJNd+6GMJQD0ILbCKipc+pRmdo8iiZIeNRDBfHTKn2K6zcQ87+8LSlnNgXrTOT7hV41L6XAjo0z9vHm1RFVSUW4gpd4d+sqYCcWo+kGZBQvr/kit8wIxmr8C6Btet10E4BDIFtdY8CHi9z/5bls8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791244961; c=relaxed/simple;
	bh=bbI1GlrUdF/ahNCG52V/oWZizEAOPQOpaRP4fBVF3RY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYHxTQ4eg7MmzN4lx4WyFVB6xnVwkIzohnReFfVzb7gcx1QJAN7nziXPWQ6FuzfO70QB2t36EKmEVIjWp+eZhR2G3yihBg2E8L3bBRvdyktOkkVO++I9BNnFb5XIFoV1uyC6Hl/ROqZnfleuq9UuvRr6TcrV+6Z0iq5UjCUGwYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A5kDqcbu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JFvC5/d5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A5kDqcbu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JFvC5/d5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791244959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDFj6k/aDmm3juPYr/fQM/Yto+7HWelNY9uNTEiKbGU=;
	b=A5kDqcbusbjPFv3CRK+fSmbb4j4powSr9Mi0QUNTLBW1Rm+rCiJfebLL11kAw9BfyKeQzq
	uJAiebUa/YFXo/RyU3bdFIG2LR1Yz1egCTWJAn8d8GkD7jMzZ57a4EZr0T6sH360ZbM3n0
	Rmw1HSOns994T6ymlBDjtCuNDUZnLJY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-DsOHkV0DPn2ycnrtycvnzQ-1; Mon, 05 Oct 2026 20:02:37 -0400
X-MC-Unique: DsOHkV0DPn2ycnrtycvnzQ-1
X-Mimecast-MFC-AGG-ID: DsOHkV0DPn2ycnrtycvnzQ_1791244956
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so2187478a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 17:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791244956; x=1791849756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDFj6k/aDmm3juPYr/fQM/Yto+7HWelNY9uNTEiKbGU=;
        b=JFvC5/d50uYgRP4OB2RLRgKHHclOaYtV5rXo5T1saZcmGkmOBYSwK/ZyR0XWfmQaZn
         ida31QpAIpm18qe/0LKRpfLt0jK4GNp6C8XcsTznVb7gl/daF/q/+qeIraPR1V8DkVuP
         o/KlcVNB6AjoshtLg0w+ff6Wq1hi1STtJSvH7E/AL9n5IIe5B2ZEWRd2m7Y/IV5+UpDW
         0gqOSbbvuX15TCgoC20Ud+2Lo9CztkbVAsXaFTIA+kyi5lh2YeNewYNZws45YzuJlfyR
         FCEEQHWCUXb3XzNOCJnImYI0tfmN4cKaDz51ikVDvXus/Y/jybY34KeTK1VWReAGjfv+
         ZXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791244956; x=1791849756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PDFj6k/aDmm3juPYr/fQM/Yto+7HWelNY9uNTEiKbGU=;
        b=MLxJuba5Is4kyPwSsl0iUL1/N1cUma2IHWiytCeOseX6gG/TXqWpXF4UCsne1pazmt
         xw+oZxDsJ2MttQMbhLGrwYD+xg1aRilPKq34P3DCxpprTf9winrLfLw1rJdQr2eqVMYN
         ZGNEGCwt8ICsOGSmuijTh+cozql/xEFtVfarGplAcarNAMim+91Lviqr4GxtQADZ+CpU
         fXKdwlR0qUOquoyGKGsdJsrrG0t5rgbHF9vUgQHjprO4+EL13mlyn2XAqpyzXB876u5Z
         h0jaxOKdG1RzYhoahml6W8CDJIXb4TbG5/fWK7pG+V9nZ47e8+/cta7mqthquwPTayzz
         5rNg==
X-Forwarded-Encrypted: i=1; AKwUvBw7QzBohCyYU6iVdxFfNtMwn1WpfTGlbFX0a+zODcsxcFvSwiFbgdJ5rDNMPuaU0TGhYos+Hgmh2PCBSR8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLCqwUeJWEG5oLOBuROUdS+ipn0+8fjMvz1b+P1rCPYwO7gm+R
	rfV/ABUo8AD40wxJ+NYB6NAXMKy152mzn3Uva78BMD/wl0twELm7l+x8yUpzhP4P8V/th4v+BRi
	SL1oWwQIm87j+0tqaHFNeTZO54QMbhW47By1vC/cjlr1hZorfI7qCQcSRsmxAzhwfQw==
X-Gm-Gg: AYBFou3+FkrWF2kOhXIm3uytxljP7n7lArlrzoXRYLcOJhukT9yowyiTNQekT/V9PG+
	POLhgX3cigzs4/VNrys+bI3OcH6Nr+7+3hSXeElyPtuRFWGXUbwbRvJ+GcjB2Zf91P+ADXo31e3
	+l3b/vVlpR2sUbhxPP4vJ7V1L94FB4lwNV+I0umvl/vcWTIQAhJErCYfCPSrxvgGMF67qYDq0xU
	/MGdNox1qUACZGBUYcNQOiE2n+JyXZpEqQELBmCUrSzcX5eCqnnH9HXbY2DMKHWl4bQ+yz+PLjS
	9sKmud1167MWjNoNKfDGw1IHov1kqZ0UIZDah6zy7b8UEv80uHn7qzG/RydLbdnp5tDkonh+EXL
	tkdashxl48kIezdmVys6AZTDzH5YcMCU8qcdxqlObEQ==
X-Received: by 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr5001518a91.59.1791244955779;
        Mon, 05 Oct 2026 17:02:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c05:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3a6ce963ad0mr5001495a91.59.1791244955239;
        Mon, 05 Oct 2026 17:02:35 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85436fb54sm1801682a91.10.2026.10.05.17.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 17:02:34 -0700 (PDT)
Message-ID: <0fa5d03c-9e6c-4d81-a0de-e7aafc34918f@redhat.com>
Date: Tue, 6 Oct 2026 10:02:25 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 01/23] KVM: arm64: protected VM: Handle user writes to
 CNTVCT_EL0/CNTPCT_EL0
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
 <20261005090754.2140522-2-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-2-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Protected VMs doesn't allow setting offsets for virtual and physical
> counters, as the offset is always fixed to 0. The VM ioctl is filtered
> out based on the cap. However we don't prevent the userspace from trying
> to write to the CNTVCT/CNTPCT registers. This would lead to KVM triggering
> a WARN() in timer_set_offset() as the vm_offset pointer is set to NULL.
> 
> Fix this by always "fixing" the timer offsets to 0 and marking that the
> timer offset is set in the kvm->arch.flags at KVM init time for protected
> VMs. This prevents the access to the VM specific vm_offset at low cost.
> A userspace writing to the CNT*CT_EL0 would observe success, without
> any real effect. This is cleaner over spilling "*_is_protected()"
> checks and "matches" what we really do in practise. i.e., always run
> with "fixed counter offset of 0".
> 
> Reported by Sashiko
> 
> Link: https://lore.kernel.org/all/20260908164641.416911F00A3A@smtp.kernel.org
> Fixes: f7d05ee84a6a ("KVM: arm64: Prevent host from managing timer offsets for protected VMs")
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v19:
>    - Fix typos in commit description and explain why we choose the approach.
>    - Improve comment in the code
>   Changes since v18:
>    - Retain NULL vm_offset for protected VMs to avoid host tampering with the
>      offset.
>    - Moved the flag setting into kvm_timer_init_vm(), where it should have been
>      in the first place
> ---
>   arch/arm64/kvm/arch_timer.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

