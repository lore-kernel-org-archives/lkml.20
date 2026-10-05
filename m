Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E572DE709
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183077; cv=none; b=NkdhjNQk5FTfYgPsmyU2Tyc28gL35AKQuIoReWCopfHe0mK0fccOYB2Lg0ieTM0jNHRc1mJ8760UNhydRm9iIRvR9TAqW4h/vOa3WF/rNNakfTbMZHscfiom4wjAIjqrhSIL0+mNpHGyXSxegSu22Bby1nnxVq7ebpufwc9yHzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183077; c=relaxed/simple;
	bh=qgzTFOoEzW3gwbyDTHClAPmV1HeD0YUA+X2g0RQjNXA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ZLFNRvVJnNujEgb6XabIn5rptcHNDPnhS87ZhPy2PTxAP+w0xw54V4rlGGEGLwMydUH5JJUePF9LMg4T+rXzHGflUeA+mp1nVgFhfwropQC4kOeT3pNrGFlx3VelDAUxma5WY/IN5u8ssz9zaVU8UQW02cLLwiVLp0TXFQ7YHdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/B6MxzS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/B6MxzS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a1681949b8so7665635e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791183074; x=1791787874; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Us2MeKJcaSkyObvQ9jb3ziISLTiqzBIrwa8axOA0bQE=;
        b=d/B6MxzSdlCMXVuDYEv7iWQBrLDXmT7OwzudOWN6PdVtn482G5NoJkyq271FRoVmJx
         yITUClefzSb3uN3TmxktWMNhstBJHAm03yV7dPxmQoFeHR75khtKY1k1+9gufGQqGFn6
         At3176sKZV3cPDUKNZMP54kKXTFADckQJ2ckU309G1XM4GGSKetQ9CC0nLySQvxkIkLr
         rzGcbDLHYiw2ajxSgdROEj+FPEXMxSrLZm3RVY5tkFd4na0uDvUXBfBATRepzHPMunfv
         PADSmYM3Txu9dK78hd6s+qDMb7Yu+t4ISZMJB1147acfr6bks4+yW2TD1irRRVDeepok
         5UJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183074; x=1791787874;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Us2MeKJcaSkyObvQ9jb3ziISLTiqzBIrwa8axOA0bQE=;
        b=EMq80wBX5yRVkFx7l94mOxr05iDtqoEH2DloKjYpAOp3bDHmRaMer/miRe/yEKExZt
         eTqDOrXnk7wxgPsmZ36YL2Rpeyr14Iv/ewm63OuWTySd6b34zoA+YSt4le9tC/dNpZl6
         ueQGoMjU7sw+cQ2bp8c2ferO3ZtFxOq5R2Krh+rdKWFB2Ayp9j+lncv3mhODXxNcMJ0d
         Ny0J1CjuKczUmHcc2dG1LQEioi+VVgsaY7yqh8lLSD3yLEoCW1DfVogTRb2W4RDf4lYJ
         WIQa/xtf541JPAWmwXMHk8zS8uRywMypF14DDPbmwqf3uY5iUajCl1qTZS9jzdBBnV1O
         p4vg==
X-Forwarded-Encrypted: i=1; AKwUvBwvfCYu19t4BCTRRiG4R1aDkBfmqv36MJVbMUMZ1FrCBDXSSxmHhTyDWpmUpHJW83VeYmjsJ9gr7wHDFMc=@vger.kernel.org
X-Gm-Message-State: AFuF++lDLKRH638RFsYbzToAIEA/3yippZaIoBB2b91DPxjdKXAcvcbj
	MQA0KPxL7TwlfK758ZAD+yyIXuLPNAzwM0+xGle+pKeVVMcxyVSvsU9Z
X-Gm-Gg: AYBFou1lP1801fjU8IUT1xPNd0ydHBDCQcpyJ07v05455m5LeMXMhn/SE0nkGHqcSe4
	PQsDgUR89ZmLr8T6YGxx1s4e5nPnCl+6Z0P3e0sWrzoMNtFng275OT/9HkBikDxn6i35uJTmgQN
	ciJ2cX2mPWmHojJ7HYk/XsT5QfEcRUDm9PamYyJOcS6vNC8rWd1C6rmIjxf06ytcavL5EqLoLAs
	j45XFhWOaEuDA9K8W7sFXP96ULNToloA3w1THxtgzgv/hoVeoxrXHmro74bMOKeMQKc9Qyhip5g
	As7Pcw0lkM9y2iCoNHWk0Uw0lHixlIRk+X+UxbeXgH7CpAUpt7NXZPttT3vEcx6t8QBBAfbE0M5
	UhF2BVfQxC1JxKHCeJL+yyEPmzTTb1FUHRCZEZtDOljVf0l+NKhuZeyClyNrRd3CdBc6aSmA941
	5F5+ERQFWGSbtTWbbzYsBi/T117psbWOVMJZpJKEf7XFQR8vgvddKVXfOgI7EBJMKVaCxUzqiEj
	iy29sY9mz5i5y+mBGVHVhzEsSIPtVwepFnk7FYS9N4oSi0hdjwlYA==
X-Received: by 2002:a05:600c:46d0:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a02769ac69mr173907965e9.34.1791183073853;
        Sun, 04 Oct 2026 23:51:13 -0700 (PDT)
Received: from smtpclient.apple ([141.226.89.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027741586sm315563065e9.14.2026.10.04.23.51.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 23:51:12 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2 0/5] x86/mm: Allow preemption while waiting for kernel
 TLB flushes
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <cover.1791179421.git.zhouchuyi@bytedance.com>
Date: Mon, 5 Oct 2026 09:50:57 +0300
Cc: tglx@kernel.org,
 mingo@redhat.com,
 luto@kernel.org,
 peterz@infradead.org,
 paulmck@kernel.org,
 muchun.song@linux.dev,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 pbonzini@redhat.com,
 bigeasy@linutronix.de,
 clrkwllms@kernel.org,
 rostedt@goodmis.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3520FAB5-83C3-4116-BF19-87D66048D993@gmail.com>
References: <cover.1791179421.git.zhouchuyi@bytedance.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
X-Mailer: Apple Mail (2.3901.100.1.1.12)


> On 5 Oct 2026, at 8:57, Chuyi Zhou <zhouchuyi@bytedance.com> wrote:
> 
> Changes in v2:
>  - Patch 2: Reuse flush_tlb_all() for kernel ranges promoted to a full
>    flush and remove kernel_tlb_flush_all() (Sebastian).
>  - Patch 4: Drop the explicit TLB_FLUSH_ALL check on the end argument.
>    Callers pass actual address ranges and can use flush_tlb_all() for
>    unconditional full flushes (Sebastian).

Chuyi,

It all looks nice and clean, but I am not sure the end result is that
great. I think that instead of consolidating different TLB flush paths,
you break them further apart. Then you try to copy the logic from
userspace TLB flushed into the kernel code (TLB flush counting and such).

I think that perhaps a better path would be to further consolidate the
two instead of separating them. There is functionality that is missing
from kernel-space TLB flushes, and might be needed in the future.

For instance, you can see userspace TLB-flushing has a mechanism to
prevent TLB shootdown storm using TLB generations; and you see it
supports TLB-flushing stride. Now, the shootdown storm might be less
of an issue (for now?) but stride support is something you may want
eventually to support range flush with stride for stuff like [1].

Nadav


[1] https://lore.kernel.org/all/20261005052302.43042-1-lance.yang@linux.dev/
