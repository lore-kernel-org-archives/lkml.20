Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E6360ED0
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790558976; cv=none; b=X058N++D1WBGy2VyvFGc2XTKarM3wdRyXGFeaBSgXnCCAsLJYMi1yM+iOpdtRxk2VD1Qe+WHBPL60m3EFkHOKlQRMU9YwYaELU4ZTnginytCPfHh+k8DZo+JMER954uR/pWVvGhxWIcuPWd2B1+lX/YCX5AVJ6Z/GoNFvfOc8OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790558976; c=relaxed/simple;
	bh=6l5SM3odIjYsratn5+hyANF/3A4SjCbou9O2TWWTn/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VAwAIze/pvyLTXTxnCCvMJEui4DG6MFGm7LDcNqp793USGHHxklAkgic3tLMhhxZchSEK/FRn9rWqUy0oZtk+YP7DVOgfg3djAluwSQH06c3fT1v68TwgQSALSHZ+yn4MgMCzTEQKIwZ34lqLeFm69ZGRJH2wGl3Qs10AyrGRrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gZ+/TSO2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=S6WQSD1W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gZ+/TSO2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="S6WQSD1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790558974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gPTRGSRmIEuAgsqdZVsCgUbEv8K5pyxuaYYIDQSv9zo=;
	b=gZ+/TSO2s1s2Pu7kdVIYmVgExqkn0OxgXY3hBfV5xuR8t2A5qCYiuUcH1ZclvKtSptr4fW
	kt3O2GUluFXPUspF/tHHuqp4Vo2h2MMnd3MZee4nyO3YAgUVVGE6zpMRR8lbaCglCRZ53l
	QCt3/7DAqe9yJ5X3t0QZmkjEmNnxBUU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-_g3CACgTOeSW8loElfBiQw-1; Sun, 27 Sep 2026 21:29:32 -0400
X-MC-Unique: _g3CACgTOeSW8loElfBiQw-1
X-Mimecast-MFC-AGG-ID: _g3CACgTOeSW8loElfBiQw_1790558972
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2415879a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 18:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790558972; x=1791163772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPTRGSRmIEuAgsqdZVsCgUbEv8K5pyxuaYYIDQSv9zo=;
        b=S6WQSD1Wb38GSTPgjZegH5eSDMU8o089aJcqHDbLqQCcCXhSPaxtiq3J21PTmL964J
         u8Oz2RFl1A2aqF9CWKOo/X2NeKWcPFy+zCuEHNqIe77cNMTZNM3LMKKjJZStbxkUazPZ
         NWU8UntJIUWpy+h8VP4EEOvnxYDl3xGuPi2MCJLPYkG9nltAxr7zZmYSToBV6nRiuA78
         1iy8lNKamoGKVNRRv46iJoK5sDHsS0BodEiiQ+LG+E0Bg1A4x//jklXX+i+3j38muvJG
         5o409o6JxGUE1YLoPQDBiEMtOrkRjSa1H/Cb3WH2O2pSEA8A+rUVT6ZYhfXjom25Lqi1
         MlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790558972; x=1791163772;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPTRGSRmIEuAgsqdZVsCgUbEv8K5pyxuaYYIDQSv9zo=;
        b=2odbmKpbiWQymGIJJ0/+HnpY3vlXNBAB0iEztgAt0Wf74tZMpX2qF8Ve6GhZzx9Sh0
         yt7gKJMqP16EPPgEhIpRH7Q8DNIA+vl7x/J+N+14+TnQnvlqaghcJQ+Ej5SveQSrBWbC
         W5Rz6fivCKeVPXT9BZWqTriZUfSt6s+PxsQkGknDz9dn810PNsY2yInpH80PSh4v8dCC
         35p4PMGFgen0Bsr8WrUWmnW468iiVOiHJhKElzjNcI4U8ZmiRQd4h+ecMz2Dh7fb2HeC
         MZLDQWlRe+rFf7rbkXiUiaOvP51ij+VtpiswsxsLdL0iMUVRXIkFxYXSST4WNyy5Huir
         xBIA==
X-Forwarded-Encrypted: i=1; AKwUvBzIlJAhGOt2PyoRBBxStTaI7lvWyC76bgmrCcjk0VIISAAxCULKNOjP+R1TkU+gfRTEAG2gz1C+0h9tcZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1roWKKsZgT6p1a87Bbcuq40/94jDiHvwfsMC7qH/UjSeQ87/v
	7/HXtl9qUQygxwisPEv6ol/MMql8FRlJOnlc3kZ/mOCHtKSlfN+qXebHS/zvyzKUGoIi5kSE3jr
	sDPv2DHziwo8yJI60z7F1Thdo0pNB6leMm4T7fS3gP/4vGxX+tu3Wwv5gIqu5PXVmWA==
X-Gm-Gg: AYBFou257KD99rfhQ/OZOhnfl9xz8mEW50thDDrgatM8qnRqa9gGoeBn+2o16Rqz/Jn
	zrDIDi/82YjHPPPueH1CofbJ1WXnHOrViJydqen0KRK7m8M3GVYyo9nF38FmRUCz+mJXVOX+2ni
	xjIi3ViDD3HnPBHopRBu9gCRcgyYeu+mRLKIz/L1Tcjs+9HERjWM3D44cMAbJUSkiEAiHBEN0ih
	98IdyF9Fh312bJXYxcSwbRCTmTitwO5Vai5LTaEEk5dNNOuh/hEzWx46SC2KDWriuYOJYSgvXeK
	2eRhqC9DbrOhBFKeEXAkUxNi8qIJDtLfrfZJguMCFPN38THElxb1zlBKKnPLpR8BtHkbtSM5aHv
	BqphJASeYK3PV6Px7WW6ip5GdP9FOoIeh7oEUE+NCgA==
X-Received: by 2002:a17:90b:2ec4:b0:3a2:b59f:639b with SMTP id 98e67ed59e1d1-3a2b59f6deamr1580720a91.54.1790558971589;
        Sun, 27 Sep 2026 18:29:31 -0700 (PDT)
X-Received: by 2002:a17:90b:2ec4:b0:3a2:b59f:639b with SMTP id 98e67ed59e1d1-3a2b59f6deamr1580702a91.54.1790558971111;
        Sun, 27 Sep 2026 18:29:31 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913ddc55sm32916295ad.23.2026.09.27.18.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 18:29:30 -0700 (PDT)
Message-ID: <d1ad37f1-f87b-4812-a202-8b5e949fa1a8@redhat.com>
Date: Mon, 28 Sep 2026 11:29:23 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 19/20] KVM: arm64: CCA: Expose SVE VL register before
 VCPU finalization
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20260920212845.707-1-suzuki.poulose@arm.com>
 <20260920212845.707-20-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260920212845.707-20-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 7:28 AM, Suzuki K Poulose wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> Userspace must configure the SVE vector length before the Realm is created
> (as it is part of the parameter for Realm creation), but the Realm VCPUs
> cannot be finalized until after the Realm Descriptor has been created.
> 
> KVM_GET_REG_LIST currently rejects the unfinalized VCPUs, which prevents
> the userspace from discovering and configuring the VLs for  the Realm.
> 
> Allow KVM_GET_REG_LIST for unfinalized RECs and make the SVE register
> enumeration handle the unfinalized case explicitly. i.e., only expose
> KVM_REG_ARM64_SVE_VLS before SVE is finalized.
> 
> One adverse side effect of this change is that a KVM_GET_REG_LIST call that
> only probes for the array size will now succeed even if SVE is not
> finalized, but that seems harmless since the following KVM_GET_REG_LIST
> with the full array will fail.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v17:
>   - Rewrite the commit description to clearly describe the purpose
> ---
>   arch/arm64/kvm/arm.c   | 15 ++++++++++++++-
>   arch/arm64/kvm/guest.c | 10 +++++-----
>   2 files changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

