Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59054749EF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789686486; cv=none; b=WMFsN90qNyAypq3wfLxp2Ssp0ud1S1w3gLjOqK9Tbi+0vvrNMM0HlvE/qOK8K5GqvKSRx4jSd0NR6BH5ujJn8ps+0epgi4ZUunGK9djj20Mjm3oZTRw1lTbkz7PqhL8ujn2d1+Wc6VYJcFHII9LZocHxzzOC5gItbGCopNWTr4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789686486; c=relaxed/simple;
	bh=Qyk7IaW5D9rtnfADN57JI/cA1ywHq81PbOJcwVPWGSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+wNzu8eN46y6H+Uq0vIuKcL7QOroPipb3lfiwZQbgkV88EtOabxMez98FVBDw3xxmZqYLFMxqNFXfuJB56Q97yV8izhUp2a1Q03BuFVUeq/wkL9olKD5kNpwhb6XHa27H2bt6tgACu8juhZtvcLcXNlgn4e8WyrB15NHzIJW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LMwQq6gH; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LMwQq6gH"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-871807d6148so63596b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789686477; x=1790291277;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KkBkFvNjZkmBQ+ciR5KjrTSHBNZ+IYK3WHfHxYYYMK8=;
        b=qRwGvQRJ34EgpD6pt11P9u7Mst/GRTAvuBxfXNwIIFb2N0m0W4QuJcepN0UmNq1QTz
         9qjOPZlJxKhSwQW6Xm0wE0TXE1I9Jfjygq6e2cn2eUWnDAY7ZO9b4e2vryolE2AqBDMF
         RssiVLf3qC7Z9B+KiizKE3FRNjdT6aIBaRtjaPg2Wq699EGWjAcqHqX9fMGh5SgmQuTo
         hglavrN18FYRtCGPWu0l5lkYrTJB8ydWbGSCxoLo/zqqUi2VbCGIrWXXbCbV20ZQe3kZ
         t3yURGEaCoIYpW3CR7ePJYknFvDl/Xu/H8fRj4k+JXmSHPB/9k/TE9lxj2Gv/99k95Ag
         Eo/w==
X-Forwarded-Encrypted: i=1; AKwUvBxqSrhk1j44f977Waickd/3eXjlCqXSfwaCY1S6uks52X37cUJwFjFgf7KvcapUwjTsKE/VPVm7GM1IXNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nQLgWA7F1mXB3lzlZX2IhMFDeJHlHznDuI8sMvQcLPuHG50DfV
	yLPpd62J28dhqV2Zl5SvZ4t3Ih9AR8PVBDidzxgSdpxYopic3MOjHTrgAJIIamHNxktFVgGMVnN
	F+21Rl418T1olf43a2GawsSE3MbXfsgiA5BHkXxtKN03uFcFZfoQnuqEmUCbXizkRv5TgYRH4dM
	bFSX5vj7gNOLAOw+Xdz0QJ/0hqBHqdaNdUcY6xqQTQ4zClfuJtxJOQ+OKFoGNwVucr24ajGXHtw
	dXNpmtv+ZCWkCDxotnccHwn
X-Gm-Gg: AYBFou2iMFbpwTVLe8QogiuNwcDKX4dViVwxPN622BKpaZNYTzH2ITCR3jyRHhFvwHg
	fEA54DfWppq+fU/iv0XfHjauLzxQns5MtWqpYbEqjY+8QIorEyt3Q0FHMpwt3ji6jSnhXgcHi2k
	8PJYFHrR15MUKU7dnyZJ7EpYbnSAZdQjJpEEZhn/b6acHd1Rpg7Bc0Gy7/3tTbEhkawl0bcfvM5
	aYD2e0ApJA9QANpPjyVjaivsk0wvQGSq1OeTqnWWWdxXXeIJHpCORfTYdr0DkYzurTy/1S5EesE
	esvbacFWL8H/OgyluZlQg3fYaiYdLMUtajRdhFPI416e3+r48TXfGa6wPXuRFic5v6CGxUTYeyM
	9wi9xotETXnRmQUNhccIV5eroY0PaXMQcQjN8S8tQgJaUQUMNgX6buHIC1OkxFBFuJaWxVmniuo
	014+CPPR2znmZ7OE0VIrOGoFGotGaMvoMIZzd+tq3G
X-Received: by 2002:a05:6a00:2d8d:b0:869:c368:3675 with SMTP id d2e1a72fcca58-874dddfa51dmr943523b3a.17.1789686476991;
        Thu, 17 Sep 2026 16:07:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-87201535558sm2160934b3a.7.2026.09.17.16.07.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Sep 2026 16:07:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc2229450b4so65199a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789686475; x=1790291275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkBkFvNjZkmBQ+ciR5KjrTSHBNZ+IYK3WHfHxYYYMK8=;
        b=LMwQq6gHC980CO7El8uqg36zPDsHHths7iVx7tb+okf6U1MYkqmeaIVKpbDTwf2oiZ
         cRN2Hv4BkRwsnXx4ziNSm8NPo1HwayxmQ0ZksPbzhgzR0gJ48FlSOMYrchFh7hNiww42
         b//Ud1J5ALBxuMHMYMpk3kOmSAaxBxXMGlzE8=
X-Forwarded-Encrypted: i=1; AKwUvBybcBnlDp8gBWsgau8i3fMNXLZU+6wMlIl+wBpZCln9c7XdtZWkmemY7A7tdk54rjrPpv0idbrUHXA/pb4=@vger.kernel.org
X-Received: by 2002:a17:90b:1e04:b0:39e:4c80:f680 with SMTP id 98e67ed59e1d1-39e54f3dba9mr1123027a91.31.1789686474921;
        Thu, 17 Sep 2026 16:07:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:39e:4c80:f680 with SMTP id 98e67ed59e1d1-39e54f3dba9mr1122991a91.31.1789686474393;
        Thu, 17 Sep 2026 16:07:54 -0700 (PDT)
Received: from [10.211.247.235] ([216.221.25.44])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm21060020eec.1.2026.09.17.16.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 16:07:54 -0700 (PDT)
Message-ID: <58026818-7737-4560-be64-5cf22f2d8d69@broadcom.com>
Date: Thu, 17 Sep 2026 16:07:56 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/4] x86/vmware: Preserve panic diagnostics in
 vmware.log
To: Zack Rusin <zack.rusin@broadcom.com>, Borislav Petkov <bp@alien8.de>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
 Petr Mladek <pmladek@suse.com>, Joel Granados <joel.granados@kernel.org>,
 Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, virtualization@lists.linux.dev,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 John Ogness <john.ogness@linutronix.de>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>,
 Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
 kexec@lists.infradead.org, linux-doc@vger.kernel.org
References: <cover.1788414671.git.zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <cover.1788414671.git.zack.rusin@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/8/26 11:07 AM, Zack Rusin wrote:
> A virtual machine may have neither guest-local persistent storage nor
> working userspace after a panic. The host's vmware.log remains available
> after the VM terminates, and a production encrypted guest is the only
> component able to export readable panic text. Hyper-V already provides
> this class of host-persistent panic reporting.
> 
> Add a panic-only VMware logger that copies the newest 4 KiB of the kernel
> log and sends it with bounded low-bandwidth RPC work. Ordinary guests
> enable text transfer by default; encrypted guests require an administrator
> to opt in through kernel.vmware_record_panic_msg. A separate late dumper
> reports the structured crash event after built-in dumpers and suppresses
> the event while a crash kernel is loaded, because a configured VMware host
> may terminate the VM before the reporting hypercall returns.
> 
> Patch 4 makes panic diagnostics run before kdump by default on VMware
> guests. This follows existing platform uses of
> crash_kexec_post_notifiers, with Hyper-V as the closest guest-reporting
> precedent. Unlike Hyper-V, VMware exposes no capability bit for this
> behavior. An explicit crash_kexec_post_notifiers=0 still wins, and patch 4
> can be dropped without affecting patches 1 through 3.
> 
> This replaces patches 2 and 3 of Alexey's v2 posting:
> https://lore.kernel.org/all/20260309235250.2611115-1-alexey.makhalov@broadcom.com/
> 
> The intended merge path is tip's x86/vmware branch. Boris please review the
> VMware transport and policy. Petr and John, please review the panic-only
> dumper use and registration ordering. Joel and Kees, please review the
> sysctl. Baoquan and the KEXEC/KDUMP team, please review the 
> loaded-crash-kernel guard and the default in patch 4.
> 
> Zack Rusin (4):
>   x86/vmware: Add a bounded panic log sender
>   x86/vmware: Add the vmware_record_panic_msg sysctl
>   x86/vmware: Report guest crashes after kmsg dumpers
>   x86/vmware: Run panic diagnostics before kdump by default
> 
>  Documentation/admin-guide/sysctl/kernel.rst |  14 ++
>  arch/x86/include/asm/vmware.h               |   2 +
>  arch/x86/kernel/cpu/vmware.c                | 245 ++++++++++++++++++++
>  3 files changed, 261 insertions(+)
> 
> 
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935


LGTM for the series

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
