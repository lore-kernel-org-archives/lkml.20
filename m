Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FD53AB288
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791292373; cv=none; b=NZLaZRAs6f+e46cAidbcOTbH8VavFjBDd9q4DcU8hiD93koLIB9YoUGSjm0BCEAcoEb/Q7in6UNsR97TiH30GuRfadeyw31rdkzTV8xMWPry5V8KG2VG1ukynh+QbvoBaPVnmXab35PENbgoBcw2ezHBoVQeKnRBskanxCsv1ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791292373; c=relaxed/simple;
	bh=843kLH3/yocor68fXyEXcidqAx3GXtqnd20UQZArqzw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O7RKQ6JUnzKdW9nU7qtp8Fk5ZoQojx5nS7kqiZnpvkx6JL7OyD4Y8pZLgXKEVuh2HTSBzMzPYFQ4X1DQ83qWq/pT0AMlZjDKSKEnGuqtwUwGOSdMaZbjhkbOvyVBW1vy0X0CAyO4L0IYjhstozJ6PpCAnp82H7NF4J7YzOQm34A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KqK6UsZZ; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KqK6UsZZ"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so2986047a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791292371; x=1791897171; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26NSOuBm63PkzAzx+PKXKyXgL6+gizpi+djw/qIZoVs=;
        b=KqK6UsZZpeK3/wl6tTrfoQAztomHjfVcVmqB02SinD8k/7Ph3Z2cWXyFr6FHheXteX
         MIgUpQ7Ski4gmXQfeiOr5EthTE/rAR7v1WfGJo5oxDMHOtuBtx7iXtbRwibrJAfGQ1kL
         49qG/xgKTJy/B+FK1V0AhFaGERCHrmwf9t68XyuT/JYveAuoTnA5Zw7YbEsO9qXF07zy
         AZ/5D3JXGBS98lj/4BOM8rBSNBezav6jPgLDCHSeia0xklBwgZtGLWWho1VyLmduJlIK
         w1Acv/NGyR4JJJYK7QYcWkIalqqj/Ol5jf1z/NkJjNJx6rDa8E+mzvmtWpreFT1Yy9Sk
         Q31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791292371; x=1791897171;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26NSOuBm63PkzAzx+PKXKyXgL6+gizpi+djw/qIZoVs=;
        b=GyCjrFiGYA+NQoBAKsWPxHqwW7gb6jdxa/ytO6CSLcjq6wkroFOYMlUrxUqjk77yCl
         kwC8UKZUbygADPfPP1UMo1mx7elWcIxtp5mzHzmUdtlo8Ao5OuqMiroCBtyrWSIrVLEH
         RGLw64veC83iJCGr3VVjPrAGkgNzgsExl6uCGBn8YCwsxBA14DZ6K/MttfFkWPqoo2dD
         L6Uq+n8emodkh1L20cK5vuEbdsX8MuTLzg4M4msgdqFueEo7XzIrRYclhzmG/bkZbiq4
         9Jq4X0rqojieDSH+5I2eu47OOBlJ9ZwSn8vPu2R+DdF+0A6ma1EvUpKCnvwqLAgSbQrq
         MsRw==
X-Gm-Message-State: AFq9FYJ1gW0PydZrU+WQs2j6kfE/IUb0twfjuE8yL4ie1R4id/pS9qtw
	GlvKgXHgid1MNRZHPSG9Wv7geTSJLjwCmzIcRPkgraCTkI/30KvdXQETHwxJ7SBxf/riNm+HJui
	hX9EWBA==
X-Received: from pgbcv14.prod.google.com ([2002:a05:6a02:420e:b0:cca:9486:8b0b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a8f:b0:3a0:9640:803a
 with SMTP id 98e67ed59e1d1-3a872ae690dmr1095191a91.5.1791292371055; Tue, 06
 Oct 2026 06:12:51 -0700 (PDT)
Date: Tue, 6 Oct 2026 06:12:39 -0700
In-Reply-To: <CH3PR11MB08137159D0CC079C8BFA13F6E7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CH3PR11MB08137159D0CC079C8BFA13F6E7F1952@CH3PR11MB081371.namprd11.prod.outlook.com>
Message-ID: <asTzx4qJ0QbPfbdy@google.com>
Subject: Re: [RFC/DISCUSSION] x86/tsc: Handling legacy PIT fallback
 calibration on modern platforms
From: Sean Christopherson <seanjc@google.com>
To: Matthias Hahn <matthias.hahn@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "peterz@infradead.org" <peterz@infradead.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 06, 2026, Matthias Hahn wrote:
> (sorry, resending as plain text)
> 
> Hi everyone,
> 
> We have recently observed an issue regarding TSC calibration fallback on
> modern client/server platforms (specifically Raptor Lake and newer) when
> running inside restricted virtualized environments.

Can you give this Linux-as-a-guest TSC cleanup series a spin?  Among other things,
it addresses the problem of a constant, stable TSC being marked unstable because
the thing being used to calibrate the TSC is itself unstable.

https://lore.kernel.org/all/20260806233609.212337-1-seanjc@google.com
