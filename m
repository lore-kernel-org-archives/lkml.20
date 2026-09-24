Received: from mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399B34AC17E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790272157; cv=none; b=fIkaWvZntoU+C5AYlq29cvZaoRsWwNZG7IYLI1xBR8Mkb+PStr+IU/I7voyeFB7NtohFwCwnCXTcZVAsUbjhzAArHQomwU4Mm9GTEaGrz9LDrfjER7cVzbmtTk4ePIPf5Y/A6OqfDq16FIQzsJiugIvxUtiWpREfCtzUH6Z/3V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790272157; c=relaxed/simple;
	bh=VhHsaKDyj6btt2rJ0mEf5ooJRJ5wjzeYOU6EzYm9i7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptMlj/7vHH5c+jKpZNJwXDzuw5nt+Gwd5cr+bNaI+e/3enYJfDxf3vSHUob+Q8vDVLlfMdtps0fcd1U9cxg/wQT3+B6jkcvi+yrUoyfSpth2tjObw353rM3rveOv76F5RBtP0xNmGX88twtv9KmyBxs1Sw46hrQey7csLdwgjKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ik0m52ZK; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ik0m52ZK"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VhHsaKDyj6btt2rJ0mEf5ooJRJ5wjzeYOU6EzYm9i7w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790272153; v=1; x=1790876953;
 b=ik0m52ZKQsEmdf2g7hvtflFk7rxWRxnOqgQJ1B6nrH19fhLsrkAlWYtw5j1FAVbP9OjEhCEq
 ECcNNSZTA1JhkFRkGijhniYw1qKo2rLS+hkA5qxPkGqJTzV1X+flGsmaBF9NCgwBVXsFWdqtfHe
 0zg5QsJ/TR3JITbQVJZuMs4E=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e6dba17593bb729;
	Thu, 24 Sep 2026 17:49:13 +0000
X-Mizu-Trace-ID: 7e6dba17593bb729
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b8c42da963so948e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:49:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBymucJdKd2N/37CBFf6V2QIWPvrWB+ZbxQvLKh0V1cqFVwj9YP9y5/Mjgq9jPmocmVrvowKJ+wtqOWiHk8=@vger.kernel.org
X-Gm-Message-State: AFuF++lXPIhUI7Fzyu/t1VNq1MekWmx6c7WkxVsxGr83DTwOnZvlej+U
	k1ORTUIXh94qtw55rU/xSbx78Ja+AaPrTIfVmkNR70/QpMW1Lyr0OYZhgRaCv1CNvtV8Q5Pn+07
	HjfGNF79Drh2vYvFXw2sMW7yP8O5Z0jJbctOqNiJq
X-Received: by 2002:a05:6512:23a9:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b8e5793dcbmr8212e87.9.1790272147649; Thu, 24 Sep 2026 10:49:07
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924161514.1112730-1-fuad.tabba@linux.dev>
 <20260924161514.1112730-4-fuad.tabba@linux.dev> <86pky24kxz.wl-maz@kernel.org>
In-Reply-To: <86pky24kxz.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 18:48:31 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxR4+VMm99w3fL27SCTi2r3GUPF5F5zp9tqqss6dCL0hg@mail.gmail.com>
X-Gm-Features: AclHuK8ICoSXw_nkuEqpc9E_Pai04k86x8jUnxS_KW-AQa1FK-xcq-uTx9S5r8k
Message-ID: <CA+EHjTxR4+VMm99w3fL27SCTi2r3GUPF5F5zp9tqqss6dCL0hg@mail.gmail.com>
Subject: Re: [PATCH 3/3] irqchip/gic-v3: Don't register a redistributor that
 was never counted
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, James Morse <james.morse@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sep 2026 18:29:28 +0100, Marc Zyngier <maz@kernel.org> wrote:

[...]

> Shouldn't this also update the broken_rdist bitmap?

Yes, it should. Without it gic_check_rdist() returns 0 and cpuhp
brings the CPU up. Sashiko raised the same [1], and I was in the
middle of replying with this:

        /* Not counted by gic_acpi_match_gicc(), so there is no slot for it */
        if (!gicc->gicr_base_address) {
                int cpu = get_cpu_for_acpi_id(gicc->uid);

                pr_warn(FW_BUG "GICC entry with ACPI UID %u has no
GICR base address, CPU kept offline\n",
                        gicc->uid);
                if (cpu >= 0)
                        cpumask_set_cpu(cpu, &broken_rdists);
                return 0;
        }

I'll fold it into a v2.

Cheers,
/fuad

[1] https://sashiko.dev/#/patchset/20260924161514.1112730-1-fuad.tabba%40linux.dev
