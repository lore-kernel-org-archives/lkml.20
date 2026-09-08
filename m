Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D07056B851
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894107; cv=pass; b=YozFdOYWFZDS+Rz9xfPGM6z2dSlcb493/JDejCjFxo2vNyLIRT6RByMuGftkR/OFepZSwFnAA003BGbUq0YA3vjHvmvVzJ4heZfl0c0LiYwxOuO3pP75D0UKfxgaUgfn7oMIlCOZPgwRGEI/RkXm7+zPthhYKqvj32Ndn521hq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894107; c=relaxed/simple;
	bh=QhYlL6j553P0EUMnVDTNvdPvx8/iDvuOHmYwBLPXEvo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/q3tCsP5LC5fjrIwr39vrjmzAokMYPN/A3ARpNY1JLhM5d6qgwsYsa7deC0sjyPFeiL7gUvXDFv7jBqlSt77i+LUIcg2NzHy34CquZfznSQRclChOGvDyphExHDQBMb+w+/6/mtCpkRzOhBkcavzwHZUb8IZCNdJRP10J6QjCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HgQIpA1L; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HgQIpA1L"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66fa10f35caso4558342d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 12:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894104; cv=none;
        d=google.com; s=arc-20260327;
        b=KyR8bBLzyad/UgTSdxu71CMn2tHnearzwHWhitcQFJLlBVqezAonnTt3qsGnkMXniU
         PiP6Ecei6su9drjMVk50V5Xh1Qh9U8QCCici4w5yO0PrbZKLwZTf+D0HUDeZ5JZ/Yn4o
         QuH1jH9TRB51J/u7NdmwmsaKqnbI2cOlLf1a4vwDD6i1jk6bijQWS7zo8arLA2WBWimu
         Y4lRU9fkHWbmpAF+jd06bLihgVLfqOxU4VSRaq9qL0y3l12b5Lo6gJJxEyI8Us+A33WN
         EJ9b3MWwVGmQ4rfHerogQh71sFD7pdr/Z7G32ihk6YW9s5+tv2WKBuhEBYBMpvqx4lbR
         uoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        fh=wdaFEAU8EPL2yIUOljKoi5iIYettM/8fru0orGIf99Y=;
        b=Ochvw9lrblIAr/bD2V81eblzWxoJ+mpSIjW7jVU9Ykuit1r0iJsZf1ZT6wIOq0iCyE
         E6eEedlj6AuF7o7hmEsbpnradU0wHws+Lle2LE2YkfGRIN0dQz/e9+Ih1f4+chz/A3/P
         tN1hz0PFkNTTrzHY72vS3/HksbY3yn1rMEfs8PIp7YD4Ynz4N8hvMR1boc/ohR57b8kS
         8azjNes2mpcjJ8owmq5Kb8iNImstp6W0f8BSzxuDzvW51vYGuHisj6VXPDs8WkcaJoKf
         AwFLUAFWU6JthP75LBNVzgiNBp0n0LZwtLMXsQfo7jRB4HvKqwdUSVIfl4zECviFJaWl
         CimA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894104; x=1789498904; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        b=HgQIpA1LJzj61BW2e60/ni93YanjoXQ3hCyxY+fox8cVBPp1N+NasshIJqqZA9m8VO
         yLV3mHy5u8s3WSd5n+bRAlaXLxJ/R9NA+ROHssYAFZ9dmxmwHexjh2fVAfq3KwmrExT+
         I5EJjiReXdX/g1aNuPQZ3GBRQ7xzly6pVPloRJWpKNkI9AJXkrkQJUC87C4Pd9CaK8DD
         g6X5NMeEop7evDpymWJ3X7ULUQcCSpDsXkzmov7WY2br9c+6BJL5zR7Sd65lc9m7ZT9v
         mopBNiSQLYFzWP+tQSTxrwJIyJamJDq2LFjam+XJiW8ewFEPcjsVCYEcBVyMfuc5BueC
         LDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894104; x=1789498904;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gj+VTCLaPatIDzN3Ce73g2FVjGbSlVQNZ2BBXiEP5gY=;
        b=k5D/lmY0vTiP9mkzZo8VrFokR4zo2I9elv5VK1xZhXW/b8kAPXZsEMdnFsv7QKxE+l
         Qj13UCROG9KQAyBDnTaXZU46M/M5G8j70iFhfOWNrA8JwXDI7A8Zh6ISOoDW8a/aWNb8
         ctqORvIVTjRBvVFhZ7+tKyRESdaAtkqOipHycF1kDD1x6wD3suxDhTW9Dz83MnadxZNv
         35yGwP8s9O3qJ0SScyVWezAjY6HBugRp8PAJvgu7+WQLMZOVrzVVyafHbUiRxyXrJUQ3
         m3oHauoyWpNKuH+O3joPUY1JAk/P2IvdIS1PFqzbqtslVVelM7eC8v2eWvAn6/8RJg8H
         ujEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJMjZuwEFIB7tXlI+oPuLha8wxeZWcIJmq0s4yxXrr1pVkyX9GGtFfCERqFDzZHcuZKe1nXlpzZl3gy+g=@vger.kernel.org
X-Gm-Message-State: AFuF++majML96HVtwmBbaOtj2Cc7sscG59Whl8WV+NJsPPzRA+py/adF
	+7B0KPDfmE8Z6SXXwJAMV+MjGgWQoExS0FMXkEjJWYrALroA8rF7XKi1su9Gigw6Eb25EdEvbic
	4s+tcHDpnM9uYnqQDeL9Q1PtPjSQIT9NHuSwAjsdh
X-Gm-Gg: AYBFou1pQpYe3Zpm5f74C4LoahB+m1nGX/8UIf5ptu1xAhO0qrLWDfsOHAjOlvcqOrR
	iNtsKvteSnCZFmOUOJQEEneQ3LnV1dEe5Uue5vvvRqj+oOyb15sfDq9nj8fbqidh36cC/dSTGNe
	pi4o/ebC/alG4uJD89hKJeeJ7cGe0A74l0fVRT4lU56J7UwuA5wmG8qinsgpdL0/CWPIMVKL7PK
	gYui7eG+TKEZI9zXex3x0EfE2AqPJrxnAC/1IyyUqjmxkq8dF5A0wVOjdN9JCGg0Kw8gPBPX0aO
	8mouXgHKsB2T1p2EJSj8uxTbAMa/mcR+zVDPwVvv30tuEwETVhGncCtQYtDPB1dIwlQKoq38ohw
	AsjF8zvxS6jX/H+CDuFHnHDj6wo7w1tY=
X-Received: by 2002:a53:ac99:0:b0:66e:3e9a:9e30 with SMTP id
 956f58d0204a3-66fb5a0f620mr9359683d50.24.1788894103467; Tue, 08 Sep 2026
 12:01:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:01:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:01:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260722-tdx-selftests-v14-6-15ad654a50db@google.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com> <20260722-tdx-selftests-v14-6-15ad654a50db@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:01:42 -0700
X-Gm-Features: AcwNN1WPZ2uU8GfQmCXhnm2Xzg5FSQlgtEqA3NyC-GefYugQL38hpysVtSVZrlQ
Message-ID: <CAEvNRgGifoMQNRFMzmuGpChUD3YE6iUZbfsHAxaFEeTGfNfeEg@mail.gmail.com>
Subject: Re: [PATCH v14 06/22] tools: include: Add kbuild.h for assembly
 structure offsets
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> Add the Kbuild macros needed to enable the filechk_offsets mechanism to
> generate C header files containing structure member offset information.
>
> Tools depending on assembly code that operate on structures have to
> hardcode the offsets of structure members. The Kbuild infrastructure
> can instead generate C header files with these offsets automatically,
> allowing them to be included in assembly code as symbolic constants.
>
> For example, the TDX guest boot code requires access to parameters
> passed in the C structure (struct td_boot_parameters). This header
> provides the macros needed to extract these offsets from C code and
> expose them to assembly, ensuring the two remain synchronized.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> ---
>  tools/include/linux/kbuild.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/include/linux/kbuild.h b/tools/include/linux/kbuild.h
> new file mode 100644
> index 000000000000..957fd55cd159
> --- /dev/null
> +++ b/tools/include/linux/kbuild.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __TOOLS_LINUX_KBUILD_H
> +#define __TOOLS_LINUX_KBUILD_H
> +
> +#define DEFINE(sym, val) \
> +	asm volatile("\n.ascii \"->" #sym " %0 " #val "\"" : : "i" (val))
> +
> +#define OFFSET(sym, str, mem) \
> +	DEFINE(sym, __builtin_offsetof(struct str, mem))
> +
> +#endif /* __TOOLS_LINUX_KBUILD_H */
>
> --
> 2.55.0.229.g6434b31f56-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
