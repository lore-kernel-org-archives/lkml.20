Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A104949E5FB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371997; cv=pass; b=ng/bD6xAr+f0cUHvb3zn/h0ksxYrcSSgNvY1ASzOB6xN196sfVrVcL8YBrVXKajOGqZezo2plZWorJYowvzqMsFIUAzaNqwo0/V5AGEYcOxBjXRFnlYeRWd7LJNWb9MntIKQJbX4fltiiepfMPe/3HT00H9DtaYjDW280akzDCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371997; c=relaxed/simple;
	bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1jYD+DkbPipJHzGaAMRM8FOo3c+VNfbzXFoWibouMR0C83mw1DB78HW3o70xkzTr4kNJLiNKTsUJ+eeRflbxv/hDvJjKMebxMgv5Pj5RWwTz+ykmQuCqy49jF/C56G6P/S/uOX0iwU+NmzI94fNsX3oa3NXvZGdpumewFgYhMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DpRgn0V1; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DpRgn0V1"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5707e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371958; cv=none;
        d=google.com; s=arc-20260327;
        b=VioeY+lqrpU7mmXNdHkmQAtPXa/ajeW9Hb3woMVU12hAX6k80zRf0Y7SlKTaim2Klz
         4B61WXMJCsN/x8R3FomAs4Vyv3p/c5pjZSEGyfEZCUtip5FfbJfizZNimnvXMBcbbUil
         IlAIJ/TyHk59WJmroimLelCBExO+TVYwwfPr/5CJilPoLsoioS7epnYjupNjbFrbK5gA
         OcuLhqRAv98zr71rhJztsfes0tscD3kqVTQ+67FTdIXjsfiPmONwAhaSktJZY40nEPkr
         jB6k8icwIVUju9qhwxuTjIC3+P913Oj91tRiwBzlCue/E+Der8lStEOqBThKsbYmm0u4
         TDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        fh=ViTlX1BpqT9GHUri2kU1VqwlQIr253vQHVLtInZdr1E=;
        b=JowNKYlzXFXddHAblMyBk7q9kCz773SPJLH64KiLIj4ky5jd+/PWz46i5DnOoSKCQv
         lS3StQ80P4c/koqMVVm+bCrhz+HipIfcBaj7VxCDBs30q8goWdyYlg0/m3kUrLBQeqIl
         rZagyDvda/AgUYDCCsQieOJpQIsM6Ydgk7NXzKnCC8jrLn1oTOrH1ty4YSIXejMIxYV4
         MbvRDZEN5f6aa92TLIfG4QMGw+lBwROEEBsovqapWcxBkB5EmTeWTb8199yZO/VM5sXv
         v359A0Ado0RDQ+DuIJaCVwai0+Tx4RuG6ywwCwyLnY35GN3H2JRIIT3AZCwh+mR/AWRY
         gzww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371958; x=1791976758; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        b=DpRgn0V1s1FthXMIz63iv3oOwv/6JhUbfeL8pkj4U+ztGpS4Eq1GtUBwS445fkl4ek
         G9kssNPnw0vBzfj/Y1bO96Q97IeoZssfSHT6MCODvpFz2YR+qg9+DTC5XDrIdtw8Moig
         16bF9Qj+yUFMdhnY5nhjAEt3JylLeRtNLPUxeKFcl5/1EItudhyEu8f/A2LdZ5a/McGZ
         I3jJZprD8adogvSWJjg46niXLj6F44XsCpzARqNQ3o2LjdAmosI1z9OxGBWuNfDpMSMw
         X5rYdK67h82CvVIg3WlqA4JF86kLeFfvNmX9+s+z1jt7Q0hQXct2+SWzCcJfW5+K7YEm
         TgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371958; x=1791976758;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VTU69CrXg+oUNUa21qt+heVePxURpvvJ4P7YR2kHJSA=;
        b=OptbPOyQGKpjyx85TD2CwYJzcm+cjqVNFYAKc9R0CUvi/EoinkNo+zEHsdyPdna3OY
         cw0fcbcNmrzyXIYFIKudwchCxLGh18prDl8tj+U39+79Qhm5bDDVUGFBX0JV8CZI8pb5
         OMR48MeFiOJiARR/Q/RgsH0FB5NRBBE32EV3OL9GMYjFceV2Qm8Twirqb6KTylCP3G/z
         l2ZDuCtDOffGTy8PHjZIfX1ABYY21IUPU1gnSgoUkeIJ09y3dRaamwYW0BKTZZEWung8
         2WKUy2NK9FnWDG2yPFc480EopY1PWTTECILGrXkoTSI4qWeVHiW/EtvCC4MG3wY+1iFv
         Mrew==
X-Forwarded-Encrypted: i=1; AKwUvBylCXKQtQbZmOo8fHlHHmjyrkYfChgBBL4Bsae7EkVEuG8Fp1reeREH0OHd4rOZ3KETcR71CoMNG8N6KEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN9d4oIxllT+Jh1zsZ0FP0IvEs5eSL2Dy+jyPZCFFuOzGxg47H
	/fYyI+qm7Q4ILObVjy2HtxuzTjC5F5RCxEJRKlkOAf/YYz3WB9vt4WMzlUt69Wdqpl7zTmswR1u
	Ko3ACRNz5+fYUCYuWTqg/SPcTwhGib2vHRR/8Rdq0
X-Gm-Gg: AYBFou2rjTxU4GnhauNQdwsJg7jD0rTLJ5ElFVf7wDP0a0bVzNWUYJh9QbUxiEjt2Jl
	G9KfntV5HWC9X1tNzqjyXFoa+nkZiWTl56T16Td0D4pl8eAn65EW6HlKqe+6Hj0tchD8dY/RIJU
	GwzYPxnX3D12XOEctVSveaU1MnDoHYCgYW3yeu53LVZPPaU4L2HDjk9fN997qyzxoK7rdqdAJ4D
	LL00qwuKl6kN+STrI7ItAMtnb9JF/rj9VYdAlUwy/UQeS42Cr3pDLloBEBd5OXc2lFwLqgZX6Op
	JjjwPTTZbnEMcaE+f8XIuiqsgOHbUqFgeUhLsi+HXfa8/4X4/l6Juw==
X-Received: by 2002:a05:6512:1385:b0:5b8:e262:d32e with SMTP id
 2adb3069b0e04-5bcca7ec141mr318055e87.1.1791371957703; Wed, 07 Oct 2026
 04:19:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-9-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-9-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:18:40 +0200
X-Gm-Features: AclHuK9FLvM3LbOukRQncRzEinU8YnpJHc3NQvReH44DvOmDcByJyESZjTaqDmQ
Message-ID: <CA+EHjTzV29F+MoKAKum1rUS8ZBd2j2w28yQWfHL4ymfJnVzG=A@mail.gmail.com>
Subject: Re: [PATCH v23 08/14] KVM: arm64: Add vcpu load/put call backs for flavors
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Add VM flavor specific handlers for VCPU load/put, in an effort to make it
> easier to follow the code. pauth traps were removed from VMs running PKVM
> as it is a no-op for them.
>
> Based on a patch by Marc Zyngier
>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
