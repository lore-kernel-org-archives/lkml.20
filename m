Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A24D2BE03C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860555; cv=none; b=Jn8jYYr8pYt9/GVol70xQrjp7FLuj0Hs5uHOUgaDBZA3n9CpIYU+pFkfUomvnZ7Eh1qFL0K0mC+nFO8sjbxjxWOL/8uabUgHjrEF1l04629Uu0fVu6bd7y6NJ1UhCQcgKpjJwgSmEtKOgeXtkIS2e37M3bE1unTkRFkQ9uhggsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860555; c=relaxed/simple;
	bh=K1zoawtIHXn0RBbF60I1H1C9ybSRR5Nw0HEbVljdmi8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E32aBE1CkVVxJCEg8hcb7K9IuXXtyCNdwkT7+/rQqSwiw2/MQh8bHd2tDw5UegiPGks5eQAph2dWshDU9E1TXn8hVJIvwHkAY71mdmEu3P8qGPkXTZX7/YaNIN94UqtZKrFNmP9czj+vuGS2GcFZa3ULJHm/YXlYaQYQpwryiCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1xHDOyW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1xHDOyW"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a63c610b8dso5923832a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860553; x=1789465353; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pjj4FGVfbpefB5YMY5bf6wxg1EBuFtqC/RFD5ZXsYfI=;
        b=T1xHDOyWWYuYSUrvscdDqOu4fngP3CziUuehVN2rclbRfCYnTQHLMY9s6g6vI6iSpA
         RzUUXOTvN7NnvBWiNVBufHjoE5hCd56gJ08bLCm9NwmcbstDqS4KePRb7bhwskdnI+sO
         KG3wPsxqtGaJoSwpN1IU5tYdIciwmy58Vx8DJqVh9cF1FfuWSSAxpx33XgKHA2Jok01J
         Eahv/aSoaQjvuWmTzaD6MCnq9+UnAG13WpMqAKLgAkIQYrvxcDrAvVx+BdFXZ4kZdIcw
         7EdkdYywHF8SlyYUoggeD1mTuKXCjvdYw27agBU6jCWrMXlHBg6gcYrKw6nSfKY19W0R
         iODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860553; x=1789465353;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjj4FGVfbpefB5YMY5bf6wxg1EBuFtqC/RFD5ZXsYfI=;
        b=iye+8bKz5VVUwVXL/q7x5Zn/9CReD2gLU0Jj2oV0XzfSFui8ensx9NDnvWlyJ01v82
         dTmqrTNXFvHB/4srvWmaREmJ/LvNIBu5NAomm8LYgBLHvmSkL8nWB99+If+TPZKnY1FI
         GmwsSLy8IjEUq8OqpKkdfhGWheLkAnOavw5Rh9R84DspO/6Wv1y3W3MoPdkZ6AF0YhEt
         XRQlTkyfj0HbnRTwxVJU2+ZWU3EDiKRcmSBeVWwqJY79tR2owTl73rdmnELAxM3bdq9s
         AtojYMPvAkjhCvnx1Tg44go64hcN+53FXH0pvp9d2fgnRPQzFdjOklMiPWjrJ7K2ROhT
         HJGg==
X-Forwarded-Encrypted: i=1; AKwUvByfky1Q8vjRhMd/DbU+irBMbZJdnpKCaBsu+Xo71Je5okID/tSP56p9xiYuzFzI3H6Gc1GUbN37R3+3rDc=@vger.kernel.org
X-Gm-Message-State: AFuF++l0Q9WSb4KIdXg/VIA5Kw3xYGDrL2CGnM14GY+1LxOlpffUOoPT
	5vYufVrAbbaOQmaaTdvq5N+kg5ve2rALZwnC05G0LJaKCR+mqoMum5+o
X-Gm-Gg: AYBFou1V0ibGhc7/uIcuqKSdTz51RQXQ0C1kkyKylY0bjwvxkirNlt/Eg8RQLPmtJcQ
	WQWIRFXOlxCBJQsiBa+765+3mWRva/ljZU7L22z2tXTKsonp58xwkjBNsBsIdYRoowi0s6Yzcqs
	scuvFAh33tRPqkpgyTzFFLfXHmXs3vz9eM2LyBe//7xN1jwOqppXJcTV031k0Qep8t4T6ZUc8vU
	0PDir7hQ26YToO9IIUJuF2o14kKWFnLLmdF85Z5jhbxeAfMM5qFaxS2WnEW/JGPL8zFhfXiNPTn
	82cYtBqEnRyjye3DdQ61rLbiZnSeGoplUeCqc8/BUeuptrRdZtjYX2EXmraGT8jsmrWLGYlKUJi
	MOIxhA39UQD701S907Wv9g5HLZFaoUEvO4yT2Ux479K4fWDRdKrz7wddj6IQW++jTyliZD5T/Gn
	j9eRqiXDNlUMBlYtX8sWaCBrAWZPLkxjz4upVQaJYrbYV4hX8J8fO4wqXdWjq74w==
X-Received: by 2002:a17:907:c81a:b0:c25:c67d:53cc with SMTP id a640c23a62f3a-c260c8d5829mr1740810066b.8.1788860552436;
        Tue, 08 Sep 2026 02:42:32 -0700 (PDT)
Received: from [10.245.244.96] ([192.198.151.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5768c2sm574816666b.39.2026.09.08.02.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:42:31 -0700 (PDT)
Message-ID: <1f1877f904d0521100d2ca656fc9f0542c46a68b.camel@gmail.com>
Subject: Re: [PATCH v3 0/4] KVM: TDX: Validate directly configurable CPUID
 bits
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Binbin Wu <binbin.wu@linux.intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, dave.hansen@linux.intel.com, 
	andrew.cooper3@citrix.com, nik.borisov@suse.com, kas@kernel.org, 
	rick.p.edgecombe@intel.com, xiaoyao.li@intel.com, chao.gao@intel.com
Date: Tue, 08 Sep 2026 12:42:28 +0300
In-Reply-To: <20260827031837.2863609-1-binbin.wu@linux.intel.com>
References: <20260827031837.2863609-1-binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Binbin,

On Thu, 2026-08-27 at 11:18 +0800, Binbin Wu wrote:
>=20
> Specifically, this series builds a KVM-side allowlist of supported TDX
> directly configurable CPUID bits to:
>  - Filter KVM_TDX_CAPABILITIES
>    Replace the hardcoded denylist to only report configurable bits that
>    KVM explicitly supports.
>  - Validate KVM_TDX_INIT_VM
>    Reject any configurable bit that the TDX module allows but KVM does
>    not support, as well as CPUID entries with an unexpected subleaf.

Today's denylist only rejects TSX and WAITPKG. Everything else is allowed.

Obviously, the TDX module allows directly setting virtual CPUID values
only for a subset of CPUID leaves, not all of them. So "everything else"
above is that subset minus TSX and WAITPKG.

My question is: is there a feature in that "everything else" that
causes host state clobbering today?

In other words, does this patch only build the infrastructure for
addressing future clobbering issues, or does it also fix a specific
bug?

Thanks!
