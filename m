Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F301922FD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791256738; cv=none; b=tv3Eyns6f/bKq6KvgmWXBabJk9fPr5jBfs1e43f1kCdJpSSMrdbvhmMXZbPgWqu4IpZshRm3n17ADw2xIbIABT0+Wrcz3OMTP+inCMxji+URoa5cg/U8Oq8RFLlSRKXcKo1lIdPBaUggvrOdmGYFI9omUBJ21efqgd24qMAlQ3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791256738; c=relaxed/simple;
	bh=ZVbjw66CG6A5xcmMat7LXv1MIDZBEKIeNvSdl57psXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrTKrFf4DOvSDNyhJ8pyqYj83mEZKQR7Gv5eBLzsLwY4dN3RPZvxz8JBCVNE+9EcMNOIspGUvOkpP7kj1xBpuI3k3OmdyxoLwYgJzc01hfs73/qWbC6fOt9pcFjgQV3Eun8oyEk7q6O0pbE3qN6/rnYxSQAfwSd1ft6Lp4QBccs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hm9nEvHL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iK3DiUqa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hm9nEvHL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iK3DiUqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jMiWdjITXmdV/ikrHHf6jmvGBH/AsJXpXasV0+qQL8=;
	b=hm9nEvHLnYSPXfDzpndbnS+8qfFq0JSqamB/V1S6aXkuZUPwsSAJ8D3D2Ss8qWkUJXjo6Y
	Qm0DN0vUy1gaHBugdWe4fsSUDPCojs2rt/Eza5jMdpniM/wXgfFUZd5Ukghs66MsHFnnMH
	1GqxKcH0IAt3bz79LLZngKHckQwULl0=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-xTdlQDwoMOGkn-yx5lCXkg-1; Mon, 05 Oct 2026 23:18:54 -0400
X-MC-Unique: xTdlQDwoMOGkn-yx5lCXkg-1
X-Mimecast-MFC-AGG-ID: xTdlQDwoMOGkn-yx5lCXkg_1791256733
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so22604615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 20:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791256733; x=1791861533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1jMiWdjITXmdV/ikrHHf6jmvGBH/AsJXpXasV0+qQL8=;
        b=iK3DiUqa7EduMNDcY7MnEQJ4CO4nNm6Z8p/97TcD6Rcv6LKu9qXiP6TS8+2vd3Ps2o
         19hDAOhV0Z3Rp8t+zGDo6uQf39safJbqG5wtPPf+VYiq2hsOrw0WigNpjVkQyvyfrAgh
         4tQnfqXDxVkiVqC8nP2STn0t93NnXPeR2r+AdqMoMNyBNdebKCStRzPdoMpbJU0TQODE
         nXXFaFU15V13OqLuaskRWZa9i1xGzCwXE16AKolUWbT5iA7IAtbEFWkB+CMmrMGBxqF7
         +Q9osP6zCMCFxrWZt/fsauoSs8MvDgffSwgxr20KEJ4fWX2i0ZpHMxA6Xx8MUKVuAo+y
         G9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256733; x=1791861533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jMiWdjITXmdV/ikrHHf6jmvGBH/AsJXpXasV0+qQL8=;
        b=JvXFL4ZE6z1ozSkKmCun1ff0tFWvJxy+ulDxK/vlpuXWvGPYU6f8iZvXnJe/v7K/QJ
         33RNuV9UP+q34uxFQeLM7Ny5g0/vFERUYKKhxKITbjaA025KRaJc22U66NGH5yYUtUqi
         K8p+AF9TMW7U0JakBPXGy9slu687phkQa3zyYewAVPatIJ5fG48GnrZshlRaowI6WHHB
         xpQTZhp0W+cznrG9U3xdGYw7g9eQ/v8D/qroA8Spdt2JbdJrplIAbEv3wCzqrealllz7
         UUVGJe6Cnatsq0iBOgZaocDr8uZ6uB80cPNlOewr2xFW2+XFlsaamCV8DMrhozwnT/O5
         4Tig==
X-Forwarded-Encrypted: i=1; AKwUvBx3wuQq6uFmY8l9q9d8YPflOXYtqpSN6nX4cpHi20hgo3E3r9d8AdLupfODK9nLf8IZyXD6R8A5iwjiqNY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8LgJCciX91AtkadHR+CUcSZAG4jH3Kz18TuIvAFnyb3LtNzid
	Bcps2avkB7aTBenMEBq6vMARj+4KGGaWK0FovI4lGivqo5WQz5hVlj143OmGbB09gJidyEvQ7zC
	RLPLFvuWAT7XAogMdtnEw3uFbYj4f4LPrD13JZEWQA9Utw0kya8GYEr+3C2CLXoKkFA==
X-Gm-Gg: AYBFou3ynhGErGkbG3qWB9YBYRvi/yDGUm7+d99QkfrWmZB7CB9Li90kwPKar3mZavQ
	5djm8BUThh1/PdzWY76FxyCT2lLSi3T/J6gB7SGxx3D5uMeFqc1jSh7ouBZuudNkqH1e9AgP1uy
	h7fIcQ//65Z56QCW7qFXd/2AlXYoZSnmFSXtY/EtUvcTMayONy3FbziFTPya72waQ5TvFfui1jw
	oJ0qaAy3cR8xUbvEdk9qbWgBj//wJ4tgTteBPhF9mySTh74D5HWskCCiDIduuFbMrfcJ/yrZCwB
	iWX3HYQSGZon8LVwNkNjtW8IpKSmbhE0CkGuwmsvvx3soJpk74h9xhZFyY5cx+nqOHu+egE2BPD
	HbxV++uTltfkY58GRHDw203MekklYJ8GzLxkD+gy+0A==
X-Received: by 2002:a17:902:c952:b0:2e2:dc54:3148 with SMTP id d9443c01a7336-2e5dcdbe031mr1348525ad.66.1791256733327;
        Mon, 05 Oct 2026 20:18:53 -0700 (PDT)
X-Received: by 2002:a17:902:c952:b0:2e2:dc54:3148 with SMTP id d9443c01a7336-2e5dcdbe031mr1348145ad.66.1791256732898;
        Mon, 05 Oct 2026 20:18:52 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecf461sm15865645ad.53.2026.10.05.20.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:18:51 -0700 (PDT)
Message-ID: <e556089c-18bf-44c2-8b94-3c558b0398db@redhat.com>
Date: Tue, 6 Oct 2026 13:18:42 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 17/23] KVM: arm64: CCA: Add bare minimal S2 operations
 for Realm
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
 <20261005090754.2140522-18-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-18-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add bare minimal MMU operation hooks for Realms. The mem_abort handling
> is chosen as the default KVM variant. However this cannot be reached for
> Realms yet and we would need real RMI command support to make it fully
> functional. Similarly, unmapping stage2 requires RMI command support.
> Until then reuse follow protected pKVM hook and ignore unmapping.
> This will be addressed in the later series.
> 
> RMM takes care of the TLB flushing as required, when the Stage2 is
> modified. So host doesn't need to do anything explicitly. RMM doesn't
> support access flags for the stage2, even for the shared IPA.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Reuse no_age_gfn for Realms. Also use no_stage2_unmap_range for
>     now, until we get proper RMI backed driver.
> ---
>   arch/arm64/kvm/mmu.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

