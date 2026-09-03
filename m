Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28D63DD866
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788416252; cv=none; b=ZWGCkByEIID11MYRf9NTZ6rQxkSyuM6vZ/vtdtJwxlf8AGNnCPQgpJ8muWJnnXy7kJVbkmHI3UZKpfFkRgA3kOJbkQET9+cWKetnYxWEEGAsug7lqnNGwydb+/2sshm98TOGBkXRmj12IqMiDtONGcgROMlU5gyDehDNDeZdcqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788416252; c=relaxed/simple;
	bh=5fEpVgp9E7FDiWUah58fsA7bdrIxanTxTOaQkc2H9Js=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=dTsErNUkpv6fEgYugKqMqcqptFFEC9M+Q940lL5lMYBvmUxo3OfdchNPES6Tg+KQGOjypM5HExwj34nuKeu/1PT/8IoQGVP3fows+g6iDfOA8TZO5YDL/42xhs84yx+LQpwGfQBL86r8AwgfGM5OAsoraCo5xTbV8TYddOyma3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qHudFzUG; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qHudFzUG"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-855d2bfae95so757252b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788416249; x=1789021049; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBqEdXDuBCy8uZJKHbshNmmYy9yfjB6hUG6xMylUjFw=;
        b=qHudFzUGi8oRrtJ+tfnlAGtGA4kLyRrVrpkEbldIWRWuXkoGMmUKGo96cksz5iijhC
         iWHvvF+8SZHHAAGaWghfFuTqfCTQdLQwylS5pl758CeEPQQ+S6OfWnVJlgngvXxWoeHY
         nb+0pRJc6yyd5YxZ++1PAUQRN6lWp+2Wonzw2YgIgFw12toSG00UPZfpuD8MkMGKzkHT
         GGyVq6ZCOPVl/28yCNvZUCzwBf57gbR8j6QVc0WuJAOKy4KPJ9E+uPRQP7CEDBBaRKrv
         CvgNbse25W3ELMuo2VqvUitDXoKEL5e4QVY15dnw1lNNsXeFK+2toAO/7M2dmUkhUSjD
         M3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788416249; x=1789021049;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBqEdXDuBCy8uZJKHbshNmmYy9yfjB6hUG6xMylUjFw=;
        b=qaNIGJ06z4r1nhWRu0+teu7nXFwrHwjeB7FT8Qg5Dqbc090YJEBJe263uETU+QwLE5
         PH1uBuAJ/sbz9B1GinhiH2n13o7pEBZnvI4BKA/k6zZ9rYCuWMFtvgV+3gbgNnR+ecbl
         zfPwaKJipTSZEVAzEdplwY5lW6Kva+Hv674gIw1ymdYlscbT8nyPi+as+UdQP7SQzpBT
         4J2MxC3CtUvb13BfnhXTZUmvwO9Mc42i38bZ7Vr7myLDbxk89Qe6YzVL9RNHJjgVR+G+
         pQhHjPWy//2LrmscSq9q3DLeuGQlFUsD2NXyAOUsfQKYRa/exWh9xh70WAkE/UN3VGg7
         a4qA==
X-Forwarded-Encrypted: i=1; AKwUvBxuEN6bouA3le4hx4nrMxZgzYTyhneFwJz+OTb8OsEgTW6QkcfSCJAXciD0oJeS3eny2pc2P+WbyYHO2P8=@vger.kernel.org
X-Gm-Message-State: AFuF++nmhQfwRYO8rk2jLO/Q7w1PLwLAnTMw/SqkdypOOHmDhGW7E/Ns
	melfV7ecpUMa3wNJ6ivXSro9gTot2RpUjWumK/1QKpkf2Ad48q1tsFTF
X-Gm-Gg: AYBFou3/A3Jdy2iUV99zdsjOMENPRqb9+RbveBel4nw4v/atxz6Rp9y0yLyXEDNRAZq
	XPOQYY1+gaLMTxVh8fzj+obWOel4N+sVrnY87J5gMBv915A8SOxwDRrhLQVFEAGACHRI/QEZyOI
	Kf/ziCBFSZvscb+Tu3z7NHybrZ7ejhRPDTYfZIz5nM05lR0IrqeFBEaTLolNzEeQIji0fDt5PpX
	mR7anphUj17Mpy6hhcHLhVEyLXWdaHmmVAWFFoRewo5Qkl/yAumRHtSTVdmc+TNEbcXsyZZlybF
	9ldzH4x3JNbg61eKGzQCp1fUxoC8iDqnJb/biVs8Xi/E+ZLUnknBJW6E4tKxXbQFGAWbb07LEM8
	LI/1emmMGp3ApqTrYyVsryUk14W0uQvOT8cm240u/Q2JoaeQQtWGfV5I474BWvmWHTIwIql3MDy
	MLyc8MZ3MrsbE6Nf6LZ7br/tSEDPYJfJB76PRWdogMsF7dI/zWbm3p1ViQrxIJR95p5/pTHYoA5
	vntoF0/C98Fvss=
X-Received: by 2002:a05:6a21:7008:b0:3d1:66eb:511c with SMTP id adf61e73a8af0-3da215a7315mr3588262637.13.1788416248458;
        Wed, 02 Sep 2026 23:17:28 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319976a4asm2874285c88.13.2026.09.02.23.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:17:27 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: seanjc@google.com, pbonzini@redhat.com, shuah@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: selftests: Actually compare sregs and events in
 sync_regs_test
In-Reply-To: <20260902122209.865E61F00A3E@smtp.kernel.org>
References: <20260902120235.18486-1-hemanth.selam@gmail.com>
 <20260902120235.18486-2-hemanth.selam@gmail.com>
 <20260902122209.865E61F00A3E@smtp.kernel.org>
Date: Thu, 03 Sep 2026 11:47:23 +0530
Message-ID: <178841624362.1403938.933078415206124828@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, Sep 02, 2026 at 12:22:09PM +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> This is a pre-existing issue, but does this new assertion trigger test
> failures due to how __get_sregs() handles the interrupt_bitmap?

No.  Neither of the two tests that reach compare_sregs(),
req_and_verify_all_valid and set_and_verify_various, ever injects an
interrupt: the guest just loops on an IN from a port, and nothing in the
test writes interrupt_bitmap.  KVM allocates the kvm_run page with
__GFP_ZERO, so the sync region's copy starts out zero and stays zero,
and the KVM_GET_SREGS side is filled from a kzalloc()'d buffer.  Both
sides are all zeros at every point where the memcmp() runs, which I
confirmed by printing them, and the series passes 10/10 on an AMD host.

> This function sets the bit corresponding to the currently injected interrupt
> but never clears the prior contents of the array.

That part is right, and it is observable from userspace.  Planting a bit
in the sync region and running the vCPU with KVM_SYNC_X86_SREGS in
kvm_valid_regs but nothing in kvm_dirty_regs:

  run->s.regs.sregs.interrupt_bitmap[0] = 1ULL << 0x30;

leaves KVM_GET_SREGS reporting 0x0 while the sync region still reads
0x1000000000000 after the exit.  KVM refreshed sregs there and left the
caller's bit in place.

> Could this lead to spurious interrupt injections or corrupted state during
> live migration for any VMM using the KVM_SYNC_X86_SREGS API?

Handing that same stale bit back with KVM_SYNC_X86_SREGS set in
kvm_dirty_regs does inject it: __set_sregs()'s find_first_bit() picks up
vector 0x30, kvm_queue_interrupt() queues it, and the guest dies on an
unhandled 0x30.  So a VMM that read-modify-writes the sync region can
resubmit a vector KVM itself put there on an earlier exit, since nothing
clears the field once a bit is set.

I could not demonstrate KVM planting the bit itself here, as selftest VMs
have an in-kernel irqchip and KVM_INTERRUPT returns -ENXIO; that half
rests on __get_sregs() only ever doing set_bit().

Whether KVM should zero interrupt_bitmap before it ORs in the injected
vector, or clear it in store_regs(), is an ABI question rather than
something this test change should decide, and I am happy to send a patch
if that is the direction.  I would keep the memcmp() either way: it is
precisely the check that would catch a stale bit turning up in the sync
region.

Thanks,
Hemanth
