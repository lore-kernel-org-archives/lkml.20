Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D227366048
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272336; cv=none; b=HOEKjeLUk7/VMM+nOiSlnyV/ojjiN6Dd3Fk9+WK9AhvPCHYHkIEw7gpRgRaFhG/2v3fS2wqIQt2kP+5ZTAYA7UWqUJlJWKUApjlucM6wtjy2/9FQtDCpTp+WtoEDCwDrS18/19f1CpquMzkVhUM/Zli7a4G7THwcpmuGsyWSdc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272336; c=relaxed/simple;
	bh=woJiB8K0LeShA9aB8DmGEak5D/ZNM5PjGjBLk3ZtCLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TCO7SdWCQCvn8Ih8bDnCBgVp+XeNwB1/FWIIVMVaotsiB6aUi43/g37uqO+yhXi0uto4UsjtJWJKWrh8+PIiHdh4lLqaoNn5hbPv6X5tUtEhSC/hbTZvalGRnqRkylB49yHgLweAt4gNglbEcL4TCs96Gnu9ZG97f93oVXCUmKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJp7rvKu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJp7rvKu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so48191405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788272333; x=1788877133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woJiB8K0LeShA9aB8DmGEak5D/ZNM5PjGjBLk3ZtCLo=;
        b=tJp7rvKuNXudQnAen7LkRkbc6pu3WQiwbx+1IEE1DWHF85S2jAM/54ZDCnMKotfvRZ
         VST47cq+FRJ/5/SkKo75iIfq6sioR1ijPRTtjjY1ueM2Wpalh0SBVYEgjxt8RJr4v8U1
         xDX34UNmz9wjGVPSTf6hYpHTN4EmlYoNS75MfADFEItIL+CrUeTon/XObJfQ4H5+NyfJ
         g91JWC9JOwPMnGi8HUVyFRWNb+VfoqFRP9QYAARt9pvJ+S8cyFTG8AzLs647wFflmDci
         JMXRj36kU6ZQttyNXzbciTCKHPb1433cn/pZTokyZMPSG4p4jjce+l+CvAPsv+89fT7k
         tCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272333; x=1788877133;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woJiB8K0LeShA9aB8DmGEak5D/ZNM5PjGjBLk3ZtCLo=;
        b=agYr3B3Qf5y7y9oltr0xsnCtwKcCUxGTgoee6OtxvC+U/D0Noi9I+WO2bQubyXNqah
         QyrXVUzRNxlkW97YTpmh+EloZCK6OYWkPHyfzyWokiqFJdFSbU0hctYETZk6kQbcfLkZ
         L2mWeQ25Jq0HNAh3Fo8xDivPP/2B8O0Jh4nOdbmUMcUEcOs1MSiJJgrVuvoTDKi381fj
         +cD5JPnuteL6rQfoBomZtNnLt4wpwve3f9B39wGWn/yW78T9PGhjgEGOuXoMlKOeyw8y
         zrAbTzRj77WeAoC8nhKKcTDoWKX0Lurdc6ega8Kr97I9cOpcy6j+7NWQGQq3tF/4mPcF
         dT0A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3o+WL6teRI3jInqpsQkJqXSWroamyLwmj/tm4cKImMJzuOh93+Emp3GGe/10m7VnirOL53KugIwAjcrY=@vger.kernel.org
X-Gm-Message-State: AFuF++lfLsza2/xVuRRH6ISTnzk6TFJdRv49WI7/WVV+8jqKN3lPXEKh
	MIk2jQYKnza5zVoI8jAouAAVZysnuwN2uJrbxgIF618uHOFHJWOflMJO0w1GofVP
X-Gm-Gg: AR+sD101EehYw6wUA1mKBGj1PnSCoTzxMJRh8GcZdqsEs2+W+9D159mMJTn00RDKVyg
	Awg8UPzQL2PcUdYsq3X7oX5JGAkg1imljktD0GstYNWrBt9yR118QQVLZiTOcVDUBvgPSESRoDE
	ZWyVlTxbgsaWI99ylPZfQRlZ53ozO5o/OB344WnyiRsLMVqFIExkJ6exwQ8mFplwI3jQf/GMJAb
	jnVY0TRJTqe8yKZ0l/Y0vR1nznZ15pINgOs5U3Ix23O9Lhz9VamY4yk6S6EkKWFDJkuI1ypA5+2
	NqJaaHt5K8jc3ahsUbA4XCZX8sUKpMhtcK1j/pAj3lsz3SZqVr19u/8GDa7QepJglXdqz60EZIq
	h2ZLZMtBBE7rAzvJjeDr+sj0gSPkd5TExXSHMOEao8I03i37M9gOYMRrvq4mlWV0BgM+HgLtT2i
	N4SRzy+0yZLcZvBnfiwuC6IlxIkKxRIqGhwZ0QBJOUgmsnHvlQpaNU9Mp6Jxg=
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr600777375e9.10.1788272333267;
        Tue, 01 Sep 2026 07:18:53 -0700 (PDT)
Received: from fedora ([2a02:ff0:220:b213:dfd1:35e6:957c:b8c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d781bcsm4831531f8f.26.2026.09.01.07.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:18:52 -0700 (PDT)
From: =?UTF-8?q?Ertu=C4=9Frul=20Top=C3=A7u?= <ertugtopcu0@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ertu=C4=9Frul=20Top=C3=A7u?= <ertugtopcu0@gmail.com>
Subject: Re: [PATCH v3] platform/x86: Add Goodix fingerprint EC mailbox transport
Date: Tue,  1 Sep 2026 17:12:25 +0300
Message-ID: <20260901141225.282753-1-ertugtopcu0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816194955.468107-1-ertugtopcu0@gmail.com>
References: <20260727205837.91413-1-ertugtopcu0@gmail.com> <20260803074454.49474-1-ertugtopcu0@gmail.com> <20260816194955.468107-1-ertugtopcu0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this patch. v3 fixes the i386 build failure reported by
the kernel test robot and has been verified with the reported i386 W=1
configuration. The driver has also been tested on the target hardware.

I would appreciate any review or feedback when convenient.

Thanks,
Ertuğrul
