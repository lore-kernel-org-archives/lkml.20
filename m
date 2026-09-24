Received: from mta0.migadu.com (out-228.mta0.migadu.com [91.218.175.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6C64718FA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245716; cv=none; b=VMvAvomH/MYf7IxWYxLypQqW0kQ7bOCMRaPPj+kAjhe4hRk+hDpHx7kdHfXEJABubtMZEAmtnrQZyxKCMp5NRCLyvUjx8pFFMTHOUiI9E9QBGCuz/a9+oUgyFZx+fpq5zxbCGiUBCdewsF7Eh5KpGx35CG2rQC/kRI+Pc/lknac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245716; c=relaxed/simple;
	bh=l8wslZqsYjoUhW8BVyXUXs6u/mOGOCtbqiMACO0PwU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/Smb1QKr0pIAzNvwJ25AHg+l55IZnQ/uRx9tpXF1vUAspJhFLUcPnIxiac+F3pbmZw6gm/29uZz/XgGHDn+lAyEzOTpTDIfm4vaVnQ84/IcGIJkbISEuo5/OxMZfnuaYw99pIZm1j7czgIDYMkORRHfG+qE+EoHN+Hprg6+rXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ra9GLdGL; arc=none smtp.client-ip=91.218.175.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ra9GLdGL"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=l8wslZqsYjoUhW8BVyXUXs6u/mOGOCtbqiMACO0PwU0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790245712; v=1; x=1790850512;
 b=Ra9GLdGLkfuNW1+4BsHIMLLiqsAp93C9cBrkXQxZMwLT+J02okDGxNwfWYOqbtP6wsfCkIpp
 vLk8/nlWuVJBJwcVq7kau15YB9M7abwiq9zZKmlp1uNaDnlXaPeVNp+RY6M6tumIA62rr84vdEy
 Bb1VnUPuk45myzbOflalPwqM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id caeba6e59557e796;
	Thu, 24 Sep 2026 10:28:32 +0000
X-Mizu-Trace-ID: caeba6e59557e796
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b778bdb5b8so5178e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:28:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxx1eHvFWaltE3lXUQN9xiQFwAXvsgrny2XBRu6SwsH+FOvejjeqZdsliFz6F5Ykw9qykJdKw4p3tglUW4=@vger.kernel.org
X-Gm-Message-State: AFuF++nIe3m/7W4TzlO7SnV31QSOxHlBXIb6h3knfGjyPYYoYeQKaRkO
	crzvW0tsY0ZHlZHLdpi1ph6K9zTszomyfeWRaBfvoF0um3uDpp12KivRNM793ATE8P8G7A8YE06
	idC/qiUmaR7QBdPmwaNGKmR3px0I2TtmNwrzX0S5Y
X-Received: by 2002:a05:6512:2249:b0:5b8:c95d:529c with SMTP id
 2adb3069b0e04-5b8dd6d373cmr194835e87.0.1790245707622; Thu, 24 Sep 2026
 03:28:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911104715.307500-1-fuad.tabba@linux.dev> <868q5579ol.wl-maz@kernel.org>
 <CA+EHjTw0U0d91Cv4NYEJvUuT=JabwZeeYwpZ2P1xyVeOVX46Ew@mail.gmail.com> <arT5r6Tqg9PnSYLz@willie-the-truck>
In-Reply-To: <arT5r6Tqg9PnSYLz@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 11:27:51 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwKd=0kY1vxmZZ3Wk3iDcVnrdz9fPXekzr=y7eRwUYKaQ@mail.gmail.com>
X-Gm-Features: AclHuK9f1UKfVBh-sHVCnHRjsiBkOb4-h4MYma9pM03DKGJaXn8h00-d7nViPT4
Message-ID: <CA+EHjTwKd=0kY1vxmZZ3Wk3iDcVnrdz9fPXekzr=y7eRwUYKaQ@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>, 
	Ben Horgan <ben.horgan@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Thu, 24 Sept 2026 at 11:21, Will Deacon <will@kernel.org> wrote:
[...]
> > I'll probe MPAMIDR_EL1.HAS_HCR once in cpu_hyp_init_context(), next to
> > HAS_MPAM, and test the flag in both trap functions instead.
> >
> > I'll hold off on v4 until Will has had a chance to comment as well.
>
> I'm planning to generalise the logic you added recently in
> gmid_el1_accessible() so that __cpuinfo_store_cpu() stores the values
> in 'struct cpuinfo_arm64' with the overrides already applied. I don't
> think that directly impacts this patch, but it should make the general
> shape of things easier to reason about. I also need it for the parallel
> hotplug work.

In that case, I'll respin this as Marc suggested.

> If you fancy helping with that, please let me know.

Sure! Just let me know how I could help.

Cheers,
/fuad

> Will
