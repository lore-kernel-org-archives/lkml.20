Received: from mta0.migadu.com (out-2.mta0.migadu.com [91.218.175.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7943A5445
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789413769; cv=none; b=gs6TCYPS8Q2ICg/hYFGUozJ2u/WWEFhf/ghofpjkByNEU5H5ot0x2yz2tynyhyy0QM6fBkVB1O4uSL33sCDpOYOYa90aQZRQjyTvE0AR751tjJDPz+DGHwzIYh6IztJIJZCVjWfRpjJgwUskr60lj+3njqKQoxgIlU/dOJDTj1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789413769; c=relaxed/simple;
	bh=eDFirMPJbX9WM/Op3OEh05AcBJvqZLOwI3SXpiBzFp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ev/6KCvxwHrahqB/BCTz29jogQkDTG5v4bTcOG5uPVaxHgkwulcjb59kHgE/47VMz2DxCYzx5b3MLDLFBjqCA1IMt4xyNckCrORjlzK9ZMu+1y7qF3ZC/Dnkd0cL5tXLOdTotUf66Kh6sVisTy67oObMiI/AZfSEv54Cwa3r3QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BSwOj9Jp; arc=none smtp.client-ip=91.218.175.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BSwOj9Jp"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=eDFirMPJbX9WM/Op3OEh05AcBJvqZLOwI3SXpiBzFp8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789413766; v=1; x=1790018566;
 b=BSwOj9JpLCh2gywBGirXJUkrYj8dOcqK3ta70fBQDe+av3mSgEsmJmtfby5702WOHEDLWnyP
 TLPjxKbQ3oWE1b66dW2uWflUpKKXRaQ052NPnhSgeOcF5HiWlUPCOeIXcov1uflKvm0F0simBe0
 tz2jJzlNYnRv0iiJ48aGbB6A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ecc8bebd26b43c31;
	Mon, 14 Sep 2026 19:22:46 +0000
X-Mizu-Trace-ID: ecc8bebd26b43c31
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so11299e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:22:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBbKSp0nxW1P6zadYxdbwCs0we+ORNKo9bpFEX2vJxo+yeB30HMXEpaCU+do2+wzkcR4XvpLQvUJBF3KU=@vger.kernel.org
X-Gm-Message-State: AFuF++lldX3uSLNmvc8JFmdvYgEduGrbVW8t4hcIeaxhq0Tbfg5ciSOj
	gWIT1PAvmaUVqCYLzvfnv8Piu3G61ACApEPmqzz5THiBn16hW4GxeAj81+7S9BUCB0MX/SZWGe0
	czAIl89Z94OG8A4Z0kEQkmsGJM3kxwOeV/ZnooGkz
X-Received: by 2002:ac2:5b83:0:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b8b2d5efccmr26320e87.3.1789413761083; Mon, 14 Sep 2026
 12:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 20:22:04 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw-iodDGuw85xkHuP-bd9PF11CKksrefDx2bYJye0Johg@mail.gmail.com>
X-Gm-Features: AcwNN1XDCubtx9v-awCWFHNEeN2PLorMsfdS1rYt3jcM-E22UzhLX6sxMNkQT5I
Message-ID: <CA+EHjTw-iodDGuw85xkHuP-bd9PF11CKksrefDx2bYJye0Johg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] KVM: arm64: Support FF-A direct messaging interfaces
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Sebastien Ene <sebastianene@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Per,

On Mon, 31 Aug 2026 at 00:08, Per Larsen via B4 Relay
<devnull+perlarsen.google.com@kernel.org> wrote:
>
> Block host-initiated FF-A direct responses.
> Support FFA_MSG_SEND_DIRECT_REQ unconditionally.
> Support FFA_MSG_SEND_DIRECT_REQ2 if hypervisor negotiated version 1.2+.
>
> Framework messages (FF-A control plane) are filtered out. For
> FFA_MSG_SEND_DIRECT_REQ, we look at flags in w2. Messages using the REQ2
> interface are always partition messages.
>
> The third patch was part of a previous patch set [0] but was dropped
> since the use case was unclear. A clear use case has now appeared: use
> TPM device with CRB over FF-A when kernel boots with pkvm [1].

tpm_crb_ffa already uses sync_send_receive2() for partitions that
support REQ2, and on a pKVM host that returns -EOPNOTSUPP today: the
FF-A driver sets msg_direct_req2_supp when either FFA_FEATURES(REQ2)
or FFA_FEATURES(RESP2) succeeds, and before patch 3 the hypervisor
answers NOT_SUPPORTED to both. Patch 3 lets the REQ2 query through to
firmware, which is enough for the OR. Worth citing that in the cover
instead of [1]?

> Tested by booting Android under QEMU.

Which firmware was that, and what did it negotiate for FFA_VERSION?
The proxy doesn't initialise unless firmware answers that call, so I'd
like to know whether a REQ2 in particular round-tripped.

>
> Best Regards,
> Per
>
> [0]: https://lore.kernel.org/all/20250730-virtio-msg-ffa-v9-0-7f1b55c8d149@google.com/
> [1]: https://lore.kernel.org/all/20251027191729.1704744-1-yeoreum.yun@arm.com/
>
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
> Changes in v7:
> - New patch 1/3: block FFA_FN64_MSG_SEND_DIRECT_RESP. Only the 32-bit
>   variant was denied, so the host could send unvalidated 64-bit direct
>   responses to EL3, including a forged sender endpoint ID
> - Use hyp_smccc_1_2_smc() so the call is bracketed by hyp_exit/hyp_enter;
>   the pass-through path already traced these calls
> - Declare endp/flags as u64 and reject a non-zero x1[63:32]: these are
>   w1/w2, but the raw 64-bit registers are forwarded to EL3
> - Pass the canonicalised func_id to do_ffa_direct_msg() rather than
>   re-reading x0, which still carries ARM_SMCCC_CALL_HINTS
> - Link to v6: https://lore.kernel.org/r/20260501-host-direct-messages-v6-0-3f4af727ed85@google.com
>
> Changes in v6:
> - 1/2: validate that bits 31:16 of w1 is HOST_FFA_ID.
> - Link to v5: https://lore.kernel.org/r/20260121-host-direct-messages-v5-0-2c1614c94e80@google.com
>
> Changes in v5:
> - 1/2: do_ffa_direct_msg: validate that sender is HOST_FFA_ID.
> - Link to v4: https://lore.kernel.org/r/20260109-host-direct-messages-v4-0-95da4221d186@google.com
>
> Changes in v4:
> - 1/2: do_ffa_direct_msg: check that flag in w2 is zero; drop unused vm_handle parameter.
> - 2/2: ffa_call_supported: simplify logic by reordering cases.
> -      do_ffa_direct_msg: switch polarity of check and update comment.
> - Link to v3: https://lore.kernel.org/r/20251119-host-direct-messages-v3-0-c74d04944b26@google.com
>
> Changes in v3:
> - Filter out framework messages as suggested by Will Deacon. Update cover letter accordingly.
> - Update trailers: Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> - Link to v2: https://lore.kernel.org/r/20251030-host-direct-messages-v2-0-9f27cef36730@google.com
>
> Changes in v2:
> - 1/2: Drop support for FFA_ID_GET interface in host handler.
> - Link to v1: https://lore.kernel.org/r/20251030-host-direct-messages-v1-0-463e57871c8f@google.com
>
> ---
> Per Larsen (2):
>       KVM: arm64: Block host-initiated FF-A direct responses
>       KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in host handler
>
> Sebastian Ene (1):
>       KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in host handler
>
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 44 +++++++++++++++++++++++++++++++++++++++++--
>  include/linux/arm_ffa.h       |  2 ++
>  2 files changed, 44 insertions(+), 2 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20251029-host-direct-messages-5201d7f55abd
>
> Best regards,
> --
> Per Larsen <perlarsen@google.com>
>
>
