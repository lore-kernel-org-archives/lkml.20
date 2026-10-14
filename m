Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114C3BFE4F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008702; cv=none; b=UBEVUceuNReTbg64TWRlB6nZGx8TG+p6/8ECMibJ/v1CRYqy55CRQVRy2hXz5TQNnhDxfL9fiTXf83x1OFP1Iq8AjBYYuBdiXGV1FXBBucfoM2WIHg2pcEJvJGsRXccfw3/T05Y4XimhdoIT+DtKFzmpqjcnxyG12W56HfzsaSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008702; c=relaxed/simple;
	bh=uRJbvKx1mO1KNPj0dr8/ZRsfrnvEKE4eq3oa6FafOy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WvS126EJCIgi65BsWiqnyv4GYSftwqkZJkHMH/G7ffw3ca/mtl0shQkg3JgcRxM+bm2h4R5vFDdVL2bvw+KQaHXhCNzJ4c+ZTTx/qQogc4YrNGn9NnAVlaFS6Z7bkBT1giBVybklIILGMaTNQ/SovM0a1r3kC9gIs1qU18do5TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYZRu7rY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYZRu7rY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 592E71F000C4;
	Wed, 14 Oct 2026 20:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008698;
	bh=/lFiw28wU7rQqGMBIrnquux9J7KE2fiYaouRWWZDj2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mYZRu7rYBGJgP7SdGsGDrFfU/nyj/N+w2W1v6ERvFTrAS/FrNb47HwzXibGV+xlkX
	 VZ5B/CIyfy72JMUx8AzjcUGjmvZe1MYcq0dyrUhnH9ihZ+Y1n91KXz1c1Jg6rFlEPq
	 icFE3v+Y8NjyiTDSi945HHx6y40sg6UjcnhTNbDdUaWHfP6+CYlTVH91C5pGO0UOW4
	 tMqNBXRzDVt0kWmY852Q0BT/CEL3ooevndQTkiCFKNckZe/A9gUlJIYPZRA1ZXuiGC
	 mJJ39yQ8WjflcH4v0OmrHFFjU60sc5FOWadvJ/M6p3pZGJ/iRiBnxZxyzXKiWQEFPm
	 QmjA5pFWQxHKA==
From: Kees Cook <kees@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Dennis Chen <dechen@redhat.com>
Cc: Kees Cook <kees@kernel.org>,
	x86@kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] lkdtm: Make UNSET_SMEP built-in-only and unexport native_write_cr4()
Date: Wed, 14 Oct 2026 13:11:35 -0700
Message-ID: <179200869545.3133508.11783463903727237796.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014175859.30863-1-dechen@redhat.com>
References: <20261014175859.30863-1-dechen@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 13:58:59 -0400, Dennis Chen wrote:
> native_write_cr4 should not be exported to modules. Commit 21953ee5013d
> ("x86/cpu: Export native_write_cr4() only when CONFIG_LKTDM=m")
> restricted the export somewhat, but native_write_cr4() is still exposed
> to all GPL-compatible modules when CONFIG_LKDTM=m.
> 
> UNSET_SMEP is the only module user of native_write_cr4(). Restrict
> the test to CONFIG_LKDTM=y and remove the export. When LKDTM is
> built as a module, report XFAIL for UNSET_SMEP.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] lkdtm: Make UNSET_SMEP built-in-only and unexport native_write_cr4()
      https://git.kernel.org/kees/c/e2cd253cb31b

Take care,

-- 
Kees Cook

