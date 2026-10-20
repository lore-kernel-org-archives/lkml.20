Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792465031;
	b=O36CLSW3sP2yED26Xi+CzEyO4PV6VH8h4TiHRWu2Q8tsmI94pnknH4duDOnWtvOsXQEI
	 4xCxmno4zGqowP9Sc00jUgCJREBgMytZvK3YEy+DtrSUK68UwzOe8hQY3msnDDwoSjKYs
	 jNWfHZ+snP8VxNq4ciCTQRNH/kw1m2WusBE+QF0sWbJium/8fb0bJB/DlyVMMrNfBbVdL
	 mM4oKZhpjWA6/J3Pd5Ahp+zl135zQ3IpQ0YrqhMUzfzPHzSkY7PnVx7jRRASd/r0M3MYF
	 QB0e/TpB1Aw2WCye61C8yYZboQJ4dQ2Qhm1cu+TXH0QXwJr/nPmnHY3cqlhOSIsFP8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792465031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CsKRQWMb9f1R7UT3c8SQO2ZrHywocd6wp/QGBNy9ddU=;
	b=4NX6WRnFrmb+tXTJgyZnz1IAF5tR94p151h3oVimEBf6uOqsGef57+B5ZIVvOKV8GwGg
	 NFtSrLE/g5Cm1dKTAfn8pqqVs/TR3D150iDO1VoW69sbIGiauluMVdO6O+cxVSR5ohC93
	 qgpy/398IL08NYVzjqiWtSRUv7QnQLHbpribfSrbvIXrbXJ63PEVN6v+CcG6Wo8m2C4Cf
	 nblYoHBWHg3Yw5XQKnSb7EOyLWpbGEFrnNLDgcRelWaBWuTLOoGpezynpv8/8vvasXYOz
	 56c17GCsQv6xjWiFyijrKA0ZMiv0xYTEf6xyBCFUELtS75pC0gXYTz9mczUluinUqXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jkq5Ubtp;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6C606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB6C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jkq5Ubtp
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1702366a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792465030; x=1793069830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsKRQWMb9f1R7UT3c8SQO2ZrHywocd6wp/QGBNy9ddU=;
        b=Jkq5Ubtp8j1rq0Et/mhOr3tJtEIdGGqd2J93YdgBzbTjYZ37QkNgqrusfDyC1NFFxm
         FdWaDtlv/5PLVJEpQcQs396cO5i/k9ndBLlbHNiw+8+y3zZbskD30jig0Lro6n3WCozI
         f1PtmiJfLhTI97jnPaGKsE9QumOkoKZnfLY7S7skvpeGufGwcAh8sC0y15S0ggP7xcBH
         uEEnnAUcttsYrhe1v0khz+ayl1QZZREgWvy0ogYnRg+uL832jImPzM8YuUYTbdsSjMne
         dBO0B66sIYMrRc8FqYiy8UqnlI2ht0gUcI0FlPlyVCy/Dc8ykcL2EPXzmUWD9Wqbpwgy
         Kw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792465030; x=1793069830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CsKRQWMb9f1R7UT3c8SQO2ZrHywocd6wp/QGBNy9ddU=;
        b=d04pJsJZDAiYNAfVjHR2Pyw5NLTpHJpsOVhRm6goxNO7JSdIs9ZAt08wcCdQ34pbCS
         Cgge8RGmSst96hIfUnQ/TnkWLuCa2CufqDctu3SAQZlVbfxBbAMlr6JjFXF97dChU4iZ
         WiugA4UYAuWW2ZBksXLYeeh9j5ruN8P7eUbEJEUIUmEXBLEFVXfqKqfz7qSZ6V4Kwl7i
         DYI5D4zIYOLso0ehHsjRi/DU8xmS7QW8PqH32DQtUHXNkipTyGPnaqLLYY3MxDSngla2
         H2kzwq1IxZ+vD8auSYpuAz5R7sYbhKHfK9v4ggOVmhilKsZ35I0J3mrTB7nbvfHAUNLL
         Yp2Q==
X-Gm-Message-State: AFq9FYJdgcLQ09e/hjbuovrSG8pfQOTob4OSwP+Jf7IAx2p5/ICaVOzI
	nSh4QqWfULdsfnqspyQNq7XWMeNK6D6hw7nofH+euefPxSNTm0A2+af6tvnfA3ms
X-Gm-Gg: AYBFou3LX9XNN5FX16h5I0LxSYJ73cTX1BaGauJfzDP9SfL/FY4M6khW2xtuz3PAofK
	PkOO8Dfq7vB+w2NEeO7di0tHnlbsxUQ8RbFZzoAt+JArflE8hEU2MDd1FjH/pV551uWwQ+VTRfm
	une3YqXasR/ioZ9NWNxYgVAgvKWnB4sqmswBFV0LrbsUJNdheFdn45dFUzegOGOTyzIWO0JMWPr
	Fcq0Q19CiMmyPXzGvi1cBpu0XpRt+kUjvxDcuhww5pl+a5PE4uz2MDmQ/i3qooYMpGwmVQUUUYq
	MbF+oXIS8eEvaCprInLj2dXjcbEqGc1XtKkFoJKB6OQxMxVal9QqbU2VI/VT+MIgBNzuWiN0i8/
	NmzkWBWb12wIzUWVXDg7ZkZauDRpY/WIe6mhf0rpUabMMiYBErr+tAVl5Ny23tSnq8M1LkLU95y
	wlsJVeKdzlnkFIGa87mD0bzyLZ4eKNO74iQylPZPJAMcml6H5Yl8huxQ2rvEyeu1eWd8gtSHN2z
	p8=
X-Received: by 2002:a17:90b:44:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3aceefc61f5mr8258808a91.14.1792465029791;
        Mon, 19 Oct 2026 19:57:09 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad64273f6csm1479185a91.15.2026.10.19.19.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 19:57:08 -0700 (PDT)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Do not access MPAMF_ESR on MSCs that do not have it
Date: Tue, 20 Oct 2026 10:57:04 +0800
Message-Id: <20261020025704.1516317-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4bf21ff8-7e4b-4afe-b3e9-9ee85fcd1c84@arm.com>
References: <4bf21ff8-7e4b-4afe-b3e9-9ee85fcd1c84@arm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ben,

You are right, thanks for the pointers to the spec.

Our MSC is an MPAM v1.0 implementation without MPAMF_ESR, and the RTL
responds to accesses of unimplemented registers with a bus error
instead of RAZ/WI - which is what motivated the patch. Reading
MPAMF_ESR from the CPU therefore raises an external abort rather than
reading as zero.

Per RLNXX this implementation is not compliant, so the fix belongs in
hardware: the MSC design team will change accesses to unimplemented
registers to be RAZ/WI, as the specification requires.

With that in place the existing driver code is safe, so I am
withdrawing this patch.

Thanks,
Ping
