Received: from mta0.migadu.com (out-242.mta0.migadu.com [91.218.175.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8209A489FAE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403597; cv=none; b=e2IMcte4tXIHHYR6l/K5ebwmwDtB1yMEQ3gmjEAqfCdXKjxMLZFC/7uP5lL5HwfWyqcvhEYiHybZZxD2oG+zQgF+M5Xzv+t8CreWGTmUezH9OdRbrrytex/NW1pXDrn0prp98yNiWgkUAocq7VampBIo5R87rFeziQvUTs6hHf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403597; c=relaxed/simple;
	bh=W5+NjNc2Yvil7nhmREpSKhaOG865kOQghRODVtnSokk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CN9Y8JP+J3ze0jQJM7WptTuLefOonI5dibDj/GGQKduNYBgrjvBDGjhPKYPLf0zPU09HhoMF18rdw37lEmCycvskj6SGPUy7st4f2x4nOaMDxttHhTQPNhn9BuqBSdGc4frJFHeULbuZQq1/Mycy9ON3oz4BpU6c2GHfsZybM5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ruf4cirM; arc=none smtp.client-ip=91.218.175.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ruf4cirM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=W5+NjNc2Yvil7nhmREpSKhaOG865kOQghRODVtnSokk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789403593; v=1; x=1790008393;
 b=ruf4cirMhfrpIUPaA4863REr632ynvxVUqNUGn/qcWO47Ji7fRKpjt+cPZFmaTiBLCv9XHI0
 9bce9WVGRXLLYKM7zM/pnTJrXLj5pLtxXaJz/fRSHTMf1oxRfyRB+tFfena+nDq2876wc+sQHQS
 jpH/FIeNJt/b7xpjj4vpdPo8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e3c99df1de7f9083;
	Mon, 14 Sep 2026 16:33:13 +0000
X-Mizu-Trace-ID: e3c99df1de7f9083
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so10015e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:33:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzeIHOJ+wkoml8PrcIDdm+r7Oc0bK+A4Di+VsWiekv1YmoFKAcKXxKu1dkfSRiCq/WTB1YrasOyMQVoqiI=@vger.kernel.org
X-Gm-Message-State: AFuF++m4EUW6DnFsbTWsCmmd/zJrGk+QZeNRt4DfdcoezVcGhrrauo3l
	LYFrBsnr22+LT/psFdNSxEeH/iflJUGp9B0JVOyoLzu36BQCKvcSJplnII2vaH4m4aJBomDEK6A
	fDtN2C3kUuq6Z8ynVWXCI5EZNsWC933PEkdTIluzt
X-Received: by 2002:a05:6512:b2a:b0:5b1:4fd9:ac with SMTP id
 2adb3069b0e04-5b8af7a5112mr81906e87.3.1789403588069; Mon, 14 Sep 2026
 09:33:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com> <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-2-45f6e6db72c2@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 17:32:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwCrh3SXggD4p9BD0A4tUe0Xc9bPREw94uAwrEizgygeA@mail.gmail.com>
X-Gm-Features: AcwNN1U-PrGVaJ7CGsoLsa0purDu4_JoU58bTFRJLLpJ0ZCVxT7qQm_pkVz-m_s
Message-ID: <CA+EHjTwCrh3SXggD4p9BD0A4tUe0Xc9bPREw94uAwrEizgygeA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Sebastien Ene <sebastianene@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Per, Seb,

On Mon, 31 Aug 2026 at 00:08, Per Larsen via B4 Relay
<devnull+perlarsen.google.com@kernel.org> wrote:
[...]
> Allow direct messages to be forwarded from the host. The host should
> not be sending framework messages so they are filtered out.

The patch also rejects a sender ID that isn't HOST_FFA_ID, which the
message doesn't mention. Could you add a line for it?

[...]

> + if (upper_32_bits(endp) ||
> +    FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) != HOST_FFA_ID) {

Rejecting a non-zero high half of x1 makes sense to me, since EL2
checks bits 31:16 and then forwards the whole register to EL3, and
handle_host_smc() already does the same for x0. x3 to x17 reach EL3 as
the host wrote them though. Was the intent to stop at the registers
this function reads?

[...]

> + struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];

This relies on struct arm_smccc_1_2_regs fitting in the 31 entries of
regs[], which holds today at 18. Could it take a BUILD_BUG_ON, like
do_ffa_mem_xfer() has for its fids?

Cheers,
/fuad
