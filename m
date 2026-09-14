Received: from mta0.migadu.com (out-4.mta0.migadu.com [91.218.175.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0A44064F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407734; cv=none; b=DZajrE3UfvqmKo1NOZfUM8rXAjbdlAHqo1pORU7741ojwXSG+HP6gqv6aXYyo/4Yhq77av0A4cP40CSFDbp0rp/gM5OrjAGFDRGnoFB19N5aEvyhqKlCQGAYc+jTqRtCn0CE0ZhVM1hZpxZqyjfmzX05Mc80W/OPT7VafiaceDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407734; c=relaxed/simple;
	bh=H3NkHegXyGUlyjvPCAtBxAqpQZBuP5a+mlCVvVxrsTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXiP5Ee3/9GM+EF2YIDmt2Lwafegyn/PyQ9cR72cTCZJa4osog+9Hoy1i70uHHKq9nGNH9B26S5uRW2+cRqgI58SLSQVGy7qfsDce04ctq1S1x9QYZYSO5/ffeYcthkVtRryDN3JqrJoXvi9gTqLEzw0l+KHlnHXB1NXREVXH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TrghEBui; arc=none smtp.client-ip=91.218.175.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TrghEBui"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=H3NkHegXyGUlyjvPCAtBxAqpQZBuP5a+mlCVvVxrsTg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789407729; v=1; x=1790012529;
 b=TrghEBuihfaJqQo0AlnL0NJAx/qX4JmmljCZamxC8OZkY+EeuSRdfLOYO5fYUl5oULWxon06
 Ys5fCSw+IKk6EkIdKDkaNJQZslfijcFs5gbWoTavtUdDJy8rqWGr2nmRtmuneZ0RfgCFw89v4Id
 xWgGlsrFpEZqFLAc2wEmKY/4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 46628cc54330cfde;
	Mon, 14 Sep 2026 17:42:08 +0000
X-Mizu-Trace-ID: 46628cc54330cfde
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so10830e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:42:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrb3ie7X0vVLudX330XdnN5adF2VTIxFCHdH4qoL8pjBEyMri347dTiaHL4T/C5x9I7SuwXnIjMUASw7I=@vger.kernel.org
X-Gm-Message-State: AFuF++knvlaNkuCJr/ig3k0wMG5eLvokUtbXhe6AIIGEieOHAi7QW+m+
	v53YYauftjGndIxNcoRP0zKLXdU5rvutC39ZBiQkeu3uejdNiC7mz56+AdlM1ajaHvOouhMsvmp
	A/Lg2HplKiBheiE1ZCtLN/7FT1QZZJ/NNl33tHH93
X-Received: by 2002:ac2:5b83:0:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b8b2d5efccmr7429e87.3.1789407727631; Mon, 14 Sep 2026 10:42:07
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830-host-direct-messages-v7-0-45f6e6db72c2@google.com> <20260830-host-direct-messages-v7-3-45f6e6db72c2@google.com>
In-Reply-To: <20260830-host-direct-messages-v7-3-45f6e6db72c2@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 18:41:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzqCTc_8Y3jmR2R4c=SfBCpJ0pDy+4MCO-UHLbaxNW8rQ@mail.gmail.com>
X-Gm-Features: AcwNN1WgO8h5j0RDDssCnFHMWznF85XnD9prWGY6qwmWeeRWnJoBTvrMxsiCagc
Message-ID: <CA+EHjTzqCTc_8Y3jmR2R4c=SfBCpJ0pDy+4MCO-UHLbaxNW8rQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
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

Hi Per,

On Mon, 31 Aug 2026 at 00:08, Per Larsen via B4 Relay
<devnull+perlarsen.google.com@kernel.org> wrote:
...
> -static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> +static void do_ffa_direct_msg(const u64 func_id,
> +                             struct arm_smccc_1_2_regs *res,
>                               struct kvm_cpu_context *ctxt)
>  {
>         DECLARE_REG(u64, endp, ctxt, 1);
> @@ -894,8 +896,12 @@ static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
>                 return;
>         }
>
> -       /* filter out framework messages and validate SBZ/MBZ bits */
> -       if (flags) {
> +       /*
> +        * filter out framework messages and validate SBZ/MBZ flag bits.
> +        * FFA_MSG_SEND_DIRECT_REQ2 implies flag-less partition message.
> +        */
> +       if ((func_id == FFA_MSG_SEND_DIRECT_REQ ||
> +            func_id == FFA_FN64_MSG_SEND_DIRECT_REQ) && flags) {
>                 ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
>                 return;

flags holds x2, which on the REQ2 path is the UUID's low half, so the
name reads as if REQ2 flags had been checked and found zero. Could it
be w2 instead?

Cheers,
/fuad


>         }
> @@ -961,15 +967,20 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
>         case FFA_PARTITION_INFO_GET:
>                 do_ffa_part_get(&res, host_ctxt);
>                 goto out_handled;
> +       case FFA_MSG_SEND_DIRECT_REQ2:
> +               if (!ffa_call_supported(func_id))
> +                       goto out_not_supported;
> +               fallthrough;
>         case FFA_MSG_SEND_DIRECT_REQ:
>         case FFA_FN64_MSG_SEND_DIRECT_REQ:
> -               do_ffa_direct_msg(&res, host_ctxt);
> +               do_ffa_direct_msg(func_id, &res, host_ctxt);
>                 goto out_handled;
>         }
>
>         if (ffa_call_supported(func_id))
>                 return false; /* Pass through */
>
> +out_not_supported:
>         ffa_to_smccc_error(&res, FFA_RET_NOT_SUPPORTED);
>  out_handled:
>         ffa_set_retval(host_ctxt, &res);
>
> --
> 2.55.0.897.gb25b4bd76c-goog
>
>
