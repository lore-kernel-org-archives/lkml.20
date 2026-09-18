Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028DC4AA56F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789732265; cv=pass; b=QzSTB23HZ9KqAbS3xkX2P2rdR9XxC60+LPPMWBRmXm/D5tsssRRs35R3QK154hIineQNvMFxa6KFrmg8AbS50Aas3SgL8Aq5BvDTKIsklzrqb6YBgUj15kGmTwSzTsDtPwmbOrYZHBRhxrt7lYXPOPYk3TDjCaGxpGo1pjN9R9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789732265; c=relaxed/simple;
	bh=HR32eDowvoU7s9fv7SYXh2McaBai5hrd98uYm+h1guU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbD7UHuFbk3QJsi0LGAfxqc/cqk9EF2NcE7iYI2sWcgja14pc9lvs79CQSFwo0/d0Fjaee8QVEvuLWdUVl8ZFLKadRrd34HjJPcMbiX6fRfUnNj2hxtKmmZPGTNhfwJqyFBkMQOZXyPuDCFouzlhRcw39fKaNOsLCVXCzNA2xc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPHw0cBN; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPHw0cBN"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso916091a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789732262; cv=none;
        d=google.com; s=arc-20260327;
        b=rTCwLxT6pIoNLxSX3E+oszFCSUs2EwW3ndHzD0FaY0NL5WZsDNbVzcMPXDxS0eTKIG
         C4PgTbdQF+1ECIcYXkIHmxor8avFvQlRyYGg5dyZGXIaUdizBoHQD+ErVnbNINQikSnp
         hLePg18b3h3GtNwACYExbX3SsonVDU2Q1tgDIIElhi+njVTSqvPHUmmUyHW+bPZ4J5E2
         eL03PNoyurGcvYUJhS+X2FJbiKeToBHRGJpnJ7dsOWP4Vs+Hmy6G+vuI67jA4V8m1NxD
         03aR74Au0WWthl8Y9ptCTsXQqMz6fHFAz+jLuFXeJerBlfZybm9jahwdxjX5JyuJ2LSo
         gWiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HR32eDowvoU7s9fv7SYXh2McaBai5hrd98uYm+h1guU=;
        fh=iu4IrOo/r3eIUTlrICMGBw6G9DVZaDNjesHyRw6xHeo=;
        b=reSAbulqMI/VYE6l6Dek99erRww2lkpLVM3NU4lTONcNSewwIJ4W4OAUTvLXoTnjLw
         x0kysRBgrwlc605hAHE0V04B1c2r1QEJU74ZSrbu2mF4JoAdJAhPbjsoxTxsixQsuLMb
         poNSU9rDj6F6jgCALORyZX8ItnZFSxHXYml9wZEPh3qnNtjWfPg2oxUt/pDy/e9SerLk
         AwMZKIUOELlHpXBkNdHse9re9njx9WMVktAcbW6PhXHpWDJtFWH83tn5PkjVWLjRu57f
         h9cpS0gSaZAdwO5NSKufKsC3p4k9hFqDqSidToo6UULRgrTArJd1kLHjr08BCLOpZ/ON
         9cuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789732262; x=1790337062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR32eDowvoU7s9fv7SYXh2McaBai5hrd98uYm+h1guU=;
        b=UPHw0cBN+lLJEOyDVkaWSFgDp4QlM6/Xhzz5NbrszzzQAhLrruBlcSpX9xXkUloCWi
         SI0Grf0dzlWYXM0gVdI9tFYSssblbqqCfR5CU8HMco/OyBk7JOpo1o7Fa7eVatqczojj
         4sOHBdq0vFpaZZ4jPwwy45A/y/abY8K9DwDsXoACDjmiPi7LHDlJHL2drPLriFkiKTSB
         y698XMkoKxCCMuoGYtcU0OSPVjr6dp+cXskXuCK0A621dKlSyXnwpqMhqPz47HOkClac
         /RIHVwo5Qq7NizN7b/Gs1oEVAhhvthkLqwrSd5PzyRW6yrukR8sw9Trqx34OgqEGFmRV
         4Uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789732262; x=1790337062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR32eDowvoU7s9fv7SYXh2McaBai5hrd98uYm+h1guU=;
        b=ZuKtak7xAmC9xT27uRTWbeL1uXJTAs875KAUGGJxP7nyUDhv3UXUyIDkp5OZnBkgq9
         T1jtenSqEn/USL/a+HomThZS1emlTZ43y3ah36p3qUNWWqymG/+rWjp0EHvOGn+S16Mb
         JQuZdTBXtMqy7SJR4vMoIGrzGcLeMpJVvKvor5e+N1BqtLvGT9W08LsNNbB3h3kXrbku
         YIdeCV5C/FwML9qYwAiIblm5IZuS/JYyg3MMnllA9flRaWjviwkIZrsW9gv46LjBMBaZ
         7LeNssWJot+55p/t5YNWYnsj8L+pbaaCsVjsSf++fNWmpiuKX2StyepTyzhqcLsRc9gO
         oHuA==
X-Forwarded-Encrypted: i=1; AKwUvBwDFFx3djPc4EwdzAjNfP+Cs1nTS6us2+vWUkN1b6mM/tRq3SnhqdTAFNZ7FHvc5L3mYXGXVRFXY3/DRrM=@vger.kernel.org
X-Gm-Message-State: AFuF++nCcCZoSOxlUwJ0cf7kssEi7gProv99cj1rM5RBl4vUBe5Pyia1
	cA/dHm623GdlSCb+rj025GKSGuoUUSQjjICHiVou/hso4xWnsHwkNrWsc6zCKvQnDomr06cah4e
	Fee/OfkoIVtwLRTz/LjnvI6J1G44s8FA=
X-Gm-Gg: AYBFou0DJUeruQkQCAKvHpZ2wybbn6ovz2D0wWb09D7s8ET/aDNdWAANdT7XywMZFEb
	85FoNRMhzQLC/PDPVZFxaGw5YoydSzqTToFwOSb883P4DQ6qU91CBF3rP1MougFfmTdXnMCkN7d
	peJG/wzbJDq0CY5nShe2yYHyqEmbjrfXCxQ+ur77r1uySTB5ugUjeXdUsq/gsvl4fneeR4L73ld
	bo2JTS2PaDRyJp5qC1ZZNBF4C/fIJZvMOzGrYkKA6pQnNzm745S6L/mHagWXWqC6UBHCqXQ3BDc
	1OdBQILJ7e95mGlosLz76hvXGSZElE/KZnohyb6QVxOeVsoKUfE/l481z3Q=
X-Received: by 2002:a17:907:970d:b0:c24:4128:c19f with SMTP id
 a640c23a62f3a-c2a15699fdcmr247289066b.11.1789732261931; Fri, 18 Sep 2026
 04:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918040214.85580-1-ndaugoing@gmail.com> <20260918040214.85580-2-ndaugoing@gmail.com>
 <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
In-Reply-To: <CA+EHjTx8zzvgqj99TKWfRD58X-M8v+hs9358_r_1zZonFNEsgw@mail.gmail.com>
From: Yuchao Zhang <ndaugoing@gmail.com>
Date: Fri, 18 Sep 2026 19:50:50 +0800
X-Gm-Features: AcwNN1Wto2_O0uy6UTTB6in3F4ALPKeKnrIKn4mv5wL6jmnw_dTYJHrXeQ1oo0Y
Message-ID: <CAC2BP3K-fvW2s2j2ys+kPMuxrzeMw9yc6MrAk7U7CqCpb2WePQ@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: vgic: Do not remove in-flight LPIs from AP
 list on disable
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fuad,

Thanks a lot for pointing me to that thread! I was not aware of
Hyunwoo's earlier report and the discussion with Oliver and Marc.

I'll read through the thread and their rationale on the ap_list_lock
approach. I'm happy to defer to Hyunwoo's effort to avoid duplicate
work.

Thanks again for the pointer!

Best regards,
Yuchao

Fuad Tabba <fuad.tabba@linux.dev> =E4=BA=8E2026=E5=B9=B49=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=94 15:22=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Yuchao,
>
> On Fri, 18 Sep 2026 12:02:14 +0800, Yuchao Zhang <ndaugoing@gmail.com> wr=
ote:
>
> [...]
>
> > Note: this closes the primary race (the last_lr_irq node itself is no
> > longer unlinkable while in-flight), but the fold traversal can still
> > race with a remote flush unlinking a subsequent non-LR node in the
> > ap_list tail. Fully closing that window needs the fold side to take
> > references before dropping locks (in the spirit of the prune-side fix
> > in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
> > interrupt affinity change and LPI disabling")) and is left as a
> > follow-up.
>
> This is the same race Hyunwoo reported back in June [1]. You might
> want to have a look at that thread first: Oliver and Marc's view there
> was that the fix is to take the ap_list_lock in
> vgic_v3_fold_lr_state() [2][3], and Hyunwoo posted a draft of that
> [4].
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/r/aiHrGM1f8czcUby4@v4bel
> [2] https://lore.kernel.org/r/aiJi5a3JJ-TbWL-s@kernel.org
> [3] https://lore.kernel.org/r/87a4t99z9n.wl-maz@kernel.org
> [4] https://lore.kernel.org/r/aiXvwGD1hS6vwLEd@v4bel
