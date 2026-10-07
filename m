Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E99238236E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355588; cv=none; b=RJN7fah9JJXOblgnB1p8tj3e3fZyMnZ0ZyaJDhGAPg+/nHs7bdT77HrKNxegkdxix33cKeOrSRl+5bSQxikgrdSNzCRpGFhbPHCXBR4WjbFSDfqw1h7favSZYr8wauWMlwhSsr9/TYTRmRFgyi2QSLsuvAb1OJa9MAe6lY3FCdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355588; c=relaxed/simple;
	bh=U3Wf62xC5r7GPaaJsND27Q/x6Q226FUTfzXzF0+A+bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jvh4YXGbTBXByuJ6fEJ8yB+Ez3LOLh5KrpNGXoyjy68+pyhuk3U2hBiwWwcH6FP0J9zNyt7Ep2Rq4VDxoS4Fo7cCMMY9PPlsruaSC2LWws5J/VppYpFuxP7GjGJ6jeucggh32yvxNRJqivopBqn3ZL0jtp+Re+Wvci6UPY2ahns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YVq07FRZ; arc=none smtp.client-ip=95.215.58.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YVq07FRZ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U3Wf62xC5r7GPaaJsND27Q/x6Q226FUTfzXzF0+A+bo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355583; v=1; x=1791960383;
 b=YVq07FRZ4Szq6vctGkk2jNAyG8zq1X9C6URD2iK7jy5g+shElvxpVeGOrdecVNo7R491ybGi
 Kune0CwT/4lkJjlHnQJYlqjSiPA0mqyRiYx+Q8WsfCYtiO5cfAsmodGv8gz2PUfMU9A3ui6+KVe
 5ROBHLwSCOaOFmBud6FG0BoU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a8dd8ecf57e12d8b;
	Wed, 07 Oct 2026 03:25:47 +0000
X-Mizu-Trace-ID: a8dd8ecf57e12d8b
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so4660e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 20:25:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwYPoj21+btQMYgorcAXdIs7xX1B3ylm40uXtUs/ubcU3k23qmGWRrvNbTBrwoWdtNjtfkOzPMyoGzUf9E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR+biPJd4+2XPDw0w7jslyvgfKLBk05WBMe+arCR0hujfG0BDm
	LwDuDW2eWY44wOFGvDWWlBnv8jI+2v/hEFTNUTGcehqWsslzTurtzi5BJWsZbYLjpIIrAeldqZi
	D+D+aMTx7guLjJKgeBI1gCn0fb3Q+sk7xZBu5JgnL
X-Received: by 2002:a05:6512:ba4:b0:5bb:661:7db4 with SMTP id
 2adb3069b0e04-5bcca011cc1mr293031e87.0.1791343542819; Tue, 06 Oct 2026
 20:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924165329.1684155-1-fuad.tabba@linux.dev> <05714056-53b7-46ce-86eb-fdb7d2afe1fa@arm.com>
In-Reply-To: <05714056-53b7-46ce-86eb-fdb7d2afe1fa@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:25:06 +0200
X-Gmail-Original-Message-ID: <CA+EHjTzde+d7UFowKCeBnpD+8mFPcuUn1m2gLsDm9ViEgPfsQg@mail.gmail.com>
X-Gm-Features: AclHuK9K0Yw9pVF-s7nnkYWE_sJH6hYt2igpYcN7bP3h2C7iBW5sGaqUNJ48r1k
Message-ID: <CA+EHjTzde+d7UFowKCeBnpD+8mFPcuUn1m2gLsDm9ViEgPfsQg@mail.gmail.com>
Subject: Re: [PATCH v4] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Ben Horgan <ben.horgan@arm.com>, Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, Xi Ruoyao <xry111@xry111.site>, 
	Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Gavin Shan <gshan@redhat.com>, 
	Yuan Yao <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ben,

On Fri, 25 Sep 2026 10:22:00 +0100, Ben Horgan <ben.horgan@arm.com> wrote:
[...]
> IIUC, this patch also covers the mismatched system case where EL3 f/w may set MPAMEN for cpus that
> support MPAM but system_supports_mpam() returns false.

Yes. HAS_MPAM is set per CPU from that CPU's own ID registers, so the
traps depend on neither system_supports_mpam() nor MPAMEN.

Oliver, gentle ping on this one too :)

Thanks,
/fuad
