Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B513559C83
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184039; cv=pass; b=KBad3MyYrNI6dSGaEciFtwvrtp6kJD1144KEasPF+vdKJ8xO1KyAug3vpy1xVvEB2J2oDBZCoJXGNSCNTV3M2AKJNxDbZkCNUkSHhe1KqULB+KRV1TimInC3rhWoismOVYMDQw1kR5FO0vt21Ohg8zLcdqz3VwTo9sx6C3CgnuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184039; c=relaxed/simple;
	bh=sJI2mOCc7tznZH1xeE6WUqxrzQLAatMXruEgFfzLUks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPFYDrtjs80vpnz/H6poAteaPF9T+xJH1GNebLdq/gxuKIixsiU5m8Z2vPvbV1IlWVBdeNYsbCxn+jcQgkFLke+NyXF3R+ouHV6a9lb6j9wPEy9KbzakjVg7NrrFXSMjJdxWpyNJedbBFBKWf75dcHkOWAPG+jr5pNVHQfQN3BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRp5bbzk; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRp5bbzk"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-46aef6e48fbso189691fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:47:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788184034; cv=none;
        d=google.com; s=arc-20260327;
        b=X7stRy3qyXXw03BZR+ODi3F9C1YcAhELVYmu8c5DWD53wWO6lRAca1fskPHh48JGqX
         UvouZUNiRBaJuaUAbDYkukll+OkHME3Ugmb162jcZJ3UQ/3F7QJJ7lzPeNzTKd7vUFfT
         aTd6QhRzzF/6djfA/LvXqf9xSggVD9Dcc5/XWOp4TBCK+Z9Kj5vL4rDoHJ4eMY+pmD/P
         o3M5P7tMssOpjZOnn1ZcKfKslj6CNzZ6wB3ZLmjmBVvuGwgxG2bUWotG0yMMYBzzYim+
         lLV754OLgqFqddkYZv4ahFnlHf1W14poNd7fiwrkj4oMkS8qcZM8mdCTIEkv+3yn+2oN
         ZOfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXdZhCAXl/YPLluX+b217oaIUS3C82lBDYKPatd622s=;
        fh=RQAa9SHU7mBTdemrWLhiLlUeMkHs+/1JM8zRls9Brog=;
        b=A94Mist9SGQ6Y8GberqNi/abKbLSeuluFMOFDROQgTjshfldl6nWXZ/P7QzKBHA58W
         RR3nZpSrhz/9IbrdK9sZlSRALZmMGxAbETFgTeW4GrLVBOIa/Wfk1MgzfxR9jI16uTh2
         7keMl8yDhee8kCAcTB3c7znxR3axhVmgHb3YgeP6M8oeuVpFfVbzl4jZkfbNbvutX+tB
         89E6TZThbJlyWtsw1tPr1oP5LchVcdAQdN4WXkuV56npdp2WsrhMxaQxb/QhAOCM4Jqm
         rp/LQjEJdDtCPHXF/50vdgQs+btWQR7b7+YGUxPh1HMbbKMX0X4oCW1ACUk/9xJZG53G
         pyVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184034; x=1788788834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXdZhCAXl/YPLluX+b217oaIUS3C82lBDYKPatd622s=;
        b=lRp5bbzkRDRp1K+S8y1GX09DnnKFU7PE1Gbf6wVUdRHBAavcLK4s2XmKkW5zbMKSUK
         k6b2AzuuUC9a7Z1nvd3ZtIdvJdHipXL1J/VlYPmBCx1NiiALUOaF5dPz/a496trHg7fP
         chBjZyGRuV3NAxUkFIASlQW2GilvxdaVd+N9cTSaGr6H6Xp85ws7MyjeWL/sI3eB5VXc
         /7EcPZd2gmttVD7+Li51Rynu7ka0bZ/3j2Q+422slcn6kD7sSyGPEzjjpp25mnyuTqt8
         L2eMwDUbUrNAhy9+xgz5EAq0+G462Ra1/xGYwnCNWRb/7Ds9favOJtVkBQJYNin17pzh
         IH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184034; x=1788788834;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXdZhCAXl/YPLluX+b217oaIUS3C82lBDYKPatd622s=;
        b=IL8oRT247ZFANELTfY7dLxon4J42tfbXFL0i381/GEpQjZZ2hKz4LfOVv408i2s/yQ
         RFJ6TJSDnYiFMSa55fKGZXO3Edlh0TyZwrpAkB5iSW5rkheJjo4dISGPmLKfVGoVoR+u
         QUtGKs7GwzpwhAk6A4J0ilMqnTIzmuWnqaA7kt5hgFasc5zmIqcfISWM8LvsvlVE32Fz
         NJU7dFWLPm7hBC57jOtkrWNLJiVy8ti/4TIXJOHBL0heEVppKhOLELO1LISRr6dvAip+
         KfO6tPIUh9POsHXrZcjc/9gzzvWnBHtiVsCSeH24aejVWbSWxFEITqYQTgE1b71tCpbO
         90/w==
X-Forwarded-Encrypted: i=1; AHgh+RrFp96ieaPfrdfMdqu8rr5JU/+EKoh8IdeV4ObAr42XeEW8NbGVqwSir50wVeYPQ+rGLkzKcaEAbNkQylA=@vger.kernel.org
X-Gm-Message-State: AFuF++lOZ+D3GutcSw1k4QmI3MRvcyeTRo8Hs7H1KRlwmZYPCzJ4tt52
	ESNU5/SXJDHdi+Qvtymf7nWCpw1hvfAO7Mu9kHC7/e2BywhNfFeUnF+ex2mV1yQ5llOW9tXP2kk
	LJSm7JoqAo9WjppGptAvPwH7z08ePPEg=
X-Gm-Gg: AR+sD13n5BINl9PQo1iAl1BE3PnmZ3+WrG/iCNVMMpFgmpa81WFDrle6ESAsE+OtLxI
	AIu1ATndP0tIYgc95bIzQL2GCRIY3XDIc+BG8yOCPFeHDyeTOxIQbIBp3nqLXacuC2rexwZwOLw
	P6CEYEIkmrRP1bqtH4VPCXIkYVxRqH+Z6a/xqURuyeXIJKG+wF+Ogz4cOiTeWfWlJeHHqdGXgY9
	uwxHYE4ph6O2Bc/RWkbSZ2Q0Au59qwUaCYgceeFyAsZIKmjOCqO3MP+QOFAwOIgsb++TQobivi9
	Ae1v1Btvmea9DRxwdFibgkYsOhntDPA71GXinaYI0hazHw==
X-Received: by 2002:a05:6870:9d94:b0:46a:9a34:c571 with SMTP id
 586e51a60fabf-46af57f1aa7mr1054584fac.19.1788184033715; Mon, 31 Aug 2026
 06:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829213256.51527-1-kmehltretter@gmail.com> <20260829213256.51527-2-kmehltretter@gmail.com>
In-Reply-To: <20260829213256.51527-2-kmehltretter@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Mon, 31 Aug 2026 09:47:02 -0400
X-Gm-Features: AcwNN1XH17mTpK2KblerbVrKlCve1RclfFZ2A5wUG-rwX01P42n-jv3618nmM4k
Message-ID: <CAEjxPJ656tz7PZuVfKU5W6tBU01-Y2+EoD3wLQBanDnj2CbXng@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] selinux: preserve user SID across nested backing files
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: selinux@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Baokun Li <libaokun@linux.alibaba.com>, linux-fsdevel@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2026 at 5:33=E2=80=AFPM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:
>
> SELinux saves the user file SID in a backing-file security blob so it
> remains available after mmap() replaces vma->vm_file with a backing file.
>
> For nested backing files (overlayfs over overlayfs, or FUSE passthrough
> backed by overlayfs), user_file may itself be a backing file.  Its
> fsec->sid is the SID of the mounter that opened it, rather than the user
> that opened the top-level file.  mprotect() then checks fd { use } agains=
t
> the mounter SID.  This can incorrectly deny access without a domain
> transition, or check the wrong target SID after one.
>
> Copy the saved user SID when user_file is a backing file.  Keep using the
> regular file SID for the first backing layer.
>
> With two nested overlayfs mounts and SELinux enforcing,
> mprotect(PROT_READ) returns EACCES with an fd { use } denial against the
> mounter SID.  With this change, mprotect() succeeds.
>
> Tested on arm64 QEMU with a small BusyBox initramfs and a purpose-built
> SELinux policy.  The original test was also repeated with Fedora Cloud
> Base 44 userspace and gave the same result.
>
> Fixes: 82544d36b172 ("selinux: fix overlayfs mmap() and mprotect() access=
 checks")
> Cc: <stable@vger.kernel.org>
> Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
