Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E902463B74
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353319; cv=none; b=dU4nNE59GGn7Qudh0PYd6BeMZiobzvvTWVbnZwG2E8CAWKNSWF3kL3alYIRWjr5+nhUejljLy20hbNlFDyccRpeZk3d394nscFXZFQhsbCS0msRHUXAqTbMtv7GtV87Z/8F8DNyR1rtZjTkCezHFRYK+MP3VaYlTmVMa1DdU5YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353319; c=relaxed/simple;
	bh=BmpaVXqB4LM+Rf5r99/BNRSHxyeiPfZNM3L7O/qYlZg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dO0EEAmJwpQ2CuLWOc5o1RWWFlbVnI2pw+c2v6WIm6XPk+kr9MAksqqxx+TVleiNzDf0vfQeVDmqTEhqJrxsOPaw52m8cSZfJ8qPko4MDi0+sW879YPvhjahwcX4Ftv2wFNgQF98CwHcfKgT73YbZiRMo8nn5vVufmJIjyClp04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHKQ6fuP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHKQ6fuP"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c255acff671so142354966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353316; x=1788958116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xcrw8Slwvqfw6cD/yOIjKivNvmSVLpGL6BhglwyY1n4=;
        b=IHKQ6fuPoY22UNfMtg46yJrF3/7gGqrEKKTnev2A5dMf+R6YDQ4gG0lot+6I4FSCne
         cfZlDfWIvd+CnGKNpFdIcuUJnS51dXFpJXIzKkOudOd4tNuTO7OZr96KV+y8WJo4PpTf
         BlciikAwmVD8F5cGoIPr7LUP7GjM+vlkJyJDxfUk7CcG4REBiyWcFsCo/jS2wXSPbzjw
         4hBmjAmWCjGpuJV9djHj4W+fdD63vNIvz2vwZbLGWv5kHaVHY3RVDnRs+NtCpL/dUyiX
         EWnusv72ZkZ3B1wETeu2XGGxyqUZUOLc5SHEbsY7bhRJLjq6sM4schb1hQFvTIkoJsik
         pgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353316; x=1788958116;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Xcrw8Slwvqfw6cD/yOIjKivNvmSVLpGL6BhglwyY1n4=;
        b=pFswtKn/5xbCrgruAGRVrp6mt9x4iWsYQGaxjYCH5aIFxBpNXPuCKqwshQoLtZtyFm
         AI/KlJx+g1LfpzlkquNxrZSTmv/OmDhkgepuWrxMvOUN5noPd29M2lOCJlr+u+HwSb0I
         YH7Qrv1kG85d/uoY/jgtmGrHG0UATgyen8DEN56fkziNj1c+rz400roJGxLq0mHASHvd
         8hkmnn5rJpaqbH5dVIuQXRlJeCguI570t4sRZJqFW97bvUM+PtEsX4qGOu3qAeDnQaNP
         8MR6lY/BMnoTBo33jXioyejFGkHJmWL8PVnezLBkxBUR4gf6njqefiS9Yw3l03Jf8JIK
         rc/g==
X-Forwarded-Encrypted: i=1; AKwUvBxN9g38tFOm0zvJQXQJ22nPzAK4F+DDN7+7jX6bP3XYo3h5saBmpKH8eRr6Ixl/gpgxUJcEG5kBWbCvzQA=@vger.kernel.org
X-Gm-Message-State: AFuF++kVubhmtvePLz/OkyohUb0w6Pghid2kXysijZPBz3IxlDjVVNC8
	vmFd6b5Pek3dT2nmJU7JQvk+Avj2e8faEAODoRpRmldBWw+iw5d1ziyG
X-Gm-Gg: AYBFou3/HloRF1l3C6vZLqGc/YHkeEES0jx2hw7oWrg5plhmbwSeOlPwfNGNzYPEpj9
	dlZgwcNRWqiNI7j3r7ot3Y+4Mgs0O5+Uacz7VMY+ZyMQRXBCae0yRAGrUTS9oKFo25fYwL0k+F8
	M26wlzfPD93S/T03PWa9BUFLw9/ZjSRIn6z++MWTteQaMbYNhdCMaxju/3oKqHHkLE9nY7uSoxj
	INWs7cL2/UqPqlTGj+50bx9OsAzwZkhjZBwJi66ibUWh59CsyT/9Z4cow9pc3e4mbKVYViyhnCU
	lWVAzvT833KWLQvgkCAdquTGQVMahWytPqgkItFxGtCqjZocE53+0YT0UgFtaQoGekxFemF3Ff2
	73eBOGqpBkCGNcn6LsLYZ7d/jfrNCjE9xisO4NvfxnBm/irZ6fBszyxCLnZE3odXFFyKUZXsffV
	Ic5g2tdlMWZFcVW5xm0faCL0cV6HKPVCXStoiqiv+JjUvzBepZaOvOE3W2OL2U+u1d
X-Received: by 2002:a17:907:6d25:b0:c1c:4e36:eec6 with SMTP id a640c23a62f3a-c25d54f1adfmr272346666b.18.1788353316213;
        Wed, 02 Sep 2026 05:48:36 -0700 (PDT)
Received: from [10.45.18.37] ([15.248.3.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d03fbb75sm126078766b.49.2026.09.02.05.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:48:35 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <3ba65a4d-1c68-4518-acbb-893485a5dc2c@xen.org>
Date: Wed, 2 Sep 2026 13:48:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] KVM: x86/xen: Convert evtchn_ports from IDR to
 XArray
To: David Woodhouse <dwmw2@infradead.org>, seanjc@google.com,
 pbonzini@redhat.com
Cc: joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 ankur.a.arora@oracle.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 syzbot+208f7f3e5f59c11aeb90@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, suryasaimadhu369@gmail.com, lkp@intel.com,
 nicoyip.dev@gmail.com, frn1furkan10@gmail.com, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, imv4bel@gmail.com
References: <20260831213632.81023-1-dwmw2@infradead.org>
 <20260831213632.81023-14-dwmw2@infradead.org>
Content-Language: en-US
In-Reply-To: <20260831213632.81023-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2026 22:26, David Woodhouse wrote:
> From: Furkan Caliskan <frn1furkan10@gmail.com>
> 
> IDR is deprecated in favor of XArray: see
> Documentation/core-api/idr.rst. Convert evtchn_ports accordingly.
> 
> kvm_xen_eventfd_assign()'s single-slot idr_alloc() becomes
> xa_insert(), since it was really an insert-at-index, not an
> allocation: -EBUSY replaces -ENOSPC, still mapped to -EEXIST.
> 
> kvm_xen_hcall_evtchn_send() drops its explicit rcu_read_lock(),
> since xa_load() takes its own RCU read-side section internally.
> evtchnfd's lifetime is still guaranteed by kvm->srcu.
> 
> xen_lock is left in place: it protects state beyond the map itself.
> 
> Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   arch/x86/include/asm/kvm_host.h |  3 ++-
>   arch/x86/kvm/xen.c              | 34 ++++++++++++++++-----------------
>   2 files changed, 18 insertions(+), 19 deletions(-)
> 
Reviewed-by: Paul Durrant <paul@xen.org>
