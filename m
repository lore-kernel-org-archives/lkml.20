Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1B382299
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788372323; cv=none; b=UxDzuNq4u1jF/pgXApimEIdGUuc0o4MA2IzqjLvgj0chu4Y9rQczZzrqPekpPf8sLnrJhcrSL69+SIb4ufcOW03Vw6w+ulxApTRGSBewTNY8vkH/m/uReWOe5XSmYG/MdAJUb3B8m6SH3MfARbJyduuyp9WelDpY8qjrcuvjlKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788372323; c=relaxed/simple;
	bh=YdqSsfXweYukjRzVRqCbG8U6cCS12JCA8Eln1yuWlpg=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=BEz7eN7EGYnvfsePdkOF41VM3QIeWFlyJ8ZZmjDmzO3ExLzYDDQ/F8GJcwUCywkPpDjUhdHH9ufsPCTj+hecPbzvHuAI0jVlMPduDXGNmCb/6sEuK6oDvrXfxlD9OxMK72tPR7nl6+i5+JuoUuWTm3p7Xdzde1kCExmHRI+hQHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EFewYcgP; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EFewYcgP"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc439aa0078so380164a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788372321; x=1788977121; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=EFewYcgPPKMrXwy+JpwFCkRTgN1J7Tx8uVsRVn11KOJPbbnJIK7cr2M6wsr6J82/52
         7bZScRF1UOA5jQph0guc40e1+iMnfgQgaq4VGuD+GOwa2NRtW9SE/jh+HfKbfrMuMI7+
         QJ6Q5gxV4xQzfm7i6ITU0EtkNBE+UZkYKxQjakeNeUychkLBLKcdDt4VlL1NsVWeVq5n
         va8nxFwVUBTGJUBJbbJnBET/5oRK2+tbR0j9WAumzd52BDSnPrNpheMmDfnpD0ecQpIE
         JZocO3ZIrnM7HIrVi8K7OwW8D3gCaDF2J/ln8+v/t0M69/OEdQAop9aXsd6hyOksXyFX
         geyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372321; x=1788977121;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=CbBibxkYY7QC2ejZf3GBeW/w5tMU+v66N+oFgP44qSooda8+Kbn8r11f9pUOFqgLac
         6/3RXbNVrVy72n2cVeorMRpRRMYbKgMiG84uUo+9lmEFjk9RSgN6hpdVO8fLbMe8QqsQ
         lMuXk7Ay9HzPpwY0HTNkZBVxdMpMy9q5SLqjX0VjxVfpjx/zyOS0NX+peFd9aVRbTyb1
         aY1wwCyQlgV3W3C5Gb3AMvXCjP3hv/H9cmhlKTzc6Eu08muFsEbq9R5tkBoeapBUvyQl
         gRt4ufdeV7QQeXCGG/R81mnfwvZa0tkhHH5eNaUJx/VrxYxTNv0NK8SVJPnjHmJBhv3l
         ggFw==
X-Forwarded-Encrypted: i=1; AKwUvBy1/6KJpUHXc3LySs0+XiWajnw21mvvEOroxnPSfZdz5hSH2Sn7uZpLMTKndN4UJWJpHFlETr2T3d5CNxk=@vger.kernel.org
X-Gm-Message-State: AFuF++kqknUwU+UXicKvp3oKsTr8+H67bp/v4nS6tzjhcxsfjCyNbs6t
	kM1SHxT1oq3TN1VhHhdCg4kJGIkv+GPdjg/OiLb6odLnJk9AyXlkBYbW
X-Gm-Gg: AYBFou03XiMc+I54JYZLM0vdxfXuKZMxbORHGBn1kDaUeOlc36pRDuQ8JPBcMpRxan5
	fa3PjV/HZ0hTHLpW6toxWeUFFVGy6PYt6f0JsJHAOB4ifeE5kckqKkVG3kZy6bDNDatGWPm757N
	i392uQacLH6sVVmPJPSmTAtpTmZrb0d/jVoqfCiRbkkmgHE1WE/gAIiZ4jc+dAwOyay6TPp33tR
	A5DzlbsUhavCaJBz7+9CzMwVRo3EU3NIHe8NxYPBDMGsjVt8p3L3HG3noT1wYo1mk5Q+Q++GPx/
	u6vvY09UmZ39jrH2wXHHT4r9NJnjL3CTb/B3T4HwhKRhHMkLcHoZ9U1m2jEQiWCDzXmojiPjpwr
	3/X6KCcoG3x0vb4b4/ymFOYCFbZcZtZFMvDsOy1fssXuIVD26lzLAlaWyly6WPgkWzUbsYYgoMz
	Vu3LpkIRuNo16ytCF2dRSUDN87dIC9oZtkcRycZ5rFfXNDElCzgIy/11M2N4k5aVzB5d8GPE9xG
	ZVgUuZhhN1g6uELJFdMthVzniFJgXVamPd1+KlAAMg7
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr9138561a91.18.1788372321290;
        Wed, 02 Sep 2026 11:05:21 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm9808273eec.18.2026.09.02.11.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:05:20 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
In-Reply-To: <aphioo_KTboUCtZd@google.com>
Date: Wed, 02 Sep 2026 23:29:06 +0530
Message-ID: <h5k7ttzp.ritesh.list@gmail.com>
References: <20260826230511.972824-1-seanjc@google.com> <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local> <aphioo_KTboUCtZd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Sep 02, 2026, Gautam Menghani wrote:
>> 
>> + linuxppc-dev
>
> Ah, shoot, I *just* posted v2.  I'll add linuxppc-dev to that cover letter.
>
> https://lore.kernel.org/all/20260902164123.2546762-1-seanjc@google.com

Thanks Sean for sharing these changes.

Thought of sharing an interim update:
I have rebased PPC KVM selftests support on top of this series and the
initial tests ran fine. I am currently looking info few findings though
- but will soon rebase those changes on top of your v2, review that &
update the results.


-ritesh

