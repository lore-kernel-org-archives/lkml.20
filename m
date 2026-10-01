Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F442E1F0E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790830120; cv=pass; b=UpwhDApPgb8uzZuP/LebGclJksK4VBPZ0N6p1XUIMM0yhwkBSpq16RTaOiaLxLk0QfHztTAK0FuPjytFdrEND0dIODXW9k24OjFt1VUs6O0z9WAxxJe86xaZMt5V2+dBU++dwEo4k1L+0N27n9od49iSoRqRy+dvistw96H88s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790830120; c=relaxed/simple;
	bh=3ABacmlhv8U64sW7//9fPqLoIWrV59ydnWI6VCca9rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rul0i1IBcEU0XWoWErYLUjZJ1b6cdjPql79S/kBt0Nz1muA6huDNQz4ozP2glDtk+vkpGgNMKkbTrvUI/LPEhpw9zi8G9/1JmipdU6bDhyeSB83fe4u1hzwBvzY0Gjlwqt9TsCvzaxIBVd4ZmsN2Nr+ab+TWXvtiedJisShRIbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRuPtsE4; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRuPtsE4"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a58fef219fso11620971fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:48:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790830117; cv=none;
        d=google.com; s=arc-20260327;
        b=kCv9xc0z2Gcey/Vn7eY5HffZKMelxrm6cijcnS5/uhvAGL4Pg6Mdfk+UYHcFZnQO4w
         Go7I5Rnm9earPAMcw4a5GnvFHWaR6Dg/Tpp6nxRLtsqCi6a2EhEekjJRYhIWBEljKsgH
         JqNSHudCP2UoHTPgKbsfn8wz46pYt+q8VF89ja3VbJqOaQOj6hoeCrTGEcTokZlKuuk+
         tOzA5XRr3maW9bgbBtT2pQEC4vYy8zAs1697bnP9tNn7P9KM8ch4mqEVSbDvunCGy1CP
         CunPMlp1MDEdPkEqxbKt+VAJgkUoMBRHMlfjLm6btga6N+w2CkjPbkV3cR5o6ELl6/tT
         uqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ABacmlhv8U64sW7//9fPqLoIWrV59ydnWI6VCca9rE=;
        fh=yc6lgJftc+bR+LITxuS+yaGrjUg5BV4M3IuW3JIdo+w=;
        b=aaWT9IuIlYpGhp/I/sWjTcXEPgnWnjMiDhW54VuV8VkqLZNTT6UMQO6UXl5pKC/nHi
         Ji49spmm++oy01PsurR66xRUCWqYaG/BBdfH/uAQ/ElGqpWXJX04FqV4yxuMUklBl1Xl
         BSMH16VK5NoafjZc4z6Z2qitRlVn1fivCIKbaj7UATaCbnNXK+QKh1R1CRY3rDO6x5A+
         XfgXA87JU1XtoOU8c7JiIAxYVXOpYsZJ0B9M/dYL0z/mMItZhLYKBhBRRMaFPhJB8gPe
         dvfIIhnzue3EQI98c14tjxWgC2timWpdLev4oIFCFsx8dRmr1++Q02dGF1VX9ZvNrYTm
         3UeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790830117; x=1791434917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ABacmlhv8U64sW7//9fPqLoIWrV59ydnWI6VCca9rE=;
        b=kRuPtsE4mt3DT1iGdk7pd4/iWlsiK7s1CBj3JSCaczr8IjNuWACdhhR1/cv8CIafZG
         VfIZ3tUNcaXakUN/lqVbDh0va53OxLdEHIDY3eXkq2IXOM+ny+tOlOyGk3IGhn6kXMIt
         ZkCNdrl7hwNXa6Jy8JQEmKVmaNgz2wWr+hDXPyCUNK9mvnLKhK9De0NX8q68qToAfKD3
         mrt3RH7Jyy6H0PPwZ3V3ucBiBdubnTq+JEZE7l1cz/+kM399vmhgX1LLBf/8TMOPv7Fa
         Wc1SPXl9IgA741w6gUjNJ0FPh9lIkxeuZg8tsjYMV9GGNeFMaYzQZJpnWA8qoM25s/Sz
         WksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790830117; x=1791434917;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ABacmlhv8U64sW7//9fPqLoIWrV59ydnWI6VCca9rE=;
        b=nHt2A4KsqoyTqhbTWwIWHp0qXGYKBHqZFT7triNzQQK/351pz8nYBWQY4GYGYPpD35
         QSJ8NcT1rmyVzHURhXz0FfIhgG4F7Jfv3psxG/D0lD44PRWsp8WVV7pUFVBflxZEe5P3
         znFKWw1WPXzPFt6Dw1s9VdR1NG0ldufPgG4vX0BYOwaDFTlrysW/zzIN1Zjoveczi4zB
         CJ8H/1YtmJyoH7Z0CcElfmFjZJzxIud5LsaGDieq5wmhkIRl6Q4iWKXxkLn0xGbl3Lj1
         DqLLAHdVTe7S6LvB2wCr+YnxGaWDFWOo6FGacOT/f/z88w4ipzhmh8aUFhBIy4JaKziH
         tBHw==
X-Forwarded-Encrypted: i=1; AKwUvBxsSaw60gW1058wv0YWLdoM4f08DKL1yQYDP5YFwdmGzUKTl7b5vEHTtWYXCDSYJMxyKY7mflenxr/Y0NI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO6EWZSpu30KfwgRko/Sn8zJ/7UZ/Pa6lCsUK38BMITDPnO1+T
	t6n+ts+C6TbcrQPlWsmgMhLGW3ngXW+4NeIOMacvxFLrggeYxPu19HS6BWb1w58JkkbJAG+QGXw
	7ye0NTiQC18BxeL5UdF8GbnEWOkJdA0o=
X-Gm-Gg: AYBFou1DltVwy+E8+OPnsi4SIJbTWFPfDWTxK5JQDDAcSZc2ZwIrvsToMyrR6ZvH6bL
	gySeEtJcULciZrd7+7JbOqJtsygtn61M69TSgJu+UeWzFKJ9vgqQH/OXScmntJ+N2++5senLKtR
	QQ/4N6LrTIUv2QZUSkt2ZyD0zAAKVIMsuGfJ4Y2dcTyuRIIy7vZn5PDLfyWeLhScj7C6LKdr5+5
	/3aVPEknZukOfExqjEtzZTMi3cbMZ97SlQwdeYvx3EUva/ht+n7WwieqPHuh9SWfKGUlQbL65vy
	FOsT39SF2C6TkHYeiU/JWySGImHjt8ZY4L7uQpwgXa4Dmt4NrrdPHw==
X-Received: by 2002:a2e:8806:0:b0:3a7:6590:7eda with SMTP id
 38308e7fff4ca-3a7833a2488mr2717631fa.14.1790830116633; Wed, 30 Sep 2026
 21:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930155920.1684465-1-oss.patchbox@gmail.com> <20260930195908-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260930195908-mutt-send-email-mst@kernel.org>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Thu, 1 Oct 2026 00:48:25 -0400
X-Gm-Features: AclHuK8nX9Hl6iAsCD15Gr_6NKLb1XER29fZC1Iq7_Rz_t2zgcFj4klPKJNXK7k
Message-ID: <CAGG=RgDH1fCe3uiFkVY=v=cgcdGc_E0nyGk-v72mR4mefCY=Ng@mail.gmail.com>
Subject: Re: [PATCH RFC v1] vdpa/ifcvf: Time out and report device reset failure
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Zhu Lingshan <lingshan.zhu@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

On Wed, 30 Sept 2026 at 20:01, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> No one handles reset errors. You can not timeout this.

Agreed, returning early lets callers free memory the device may still
DMA into.

For a device that is present but never completes the reset, would it
be acceptable to fence it instead: pci_clear_master() after a bounded wait,
and pci_set_master() only once a later reset completes? .reset would
then always return with the device quiet, so caller can keep ignoring
the result.

> Use standard is present APIs not "all ones" hacks.

Will do, v2 will use the present APIs.

Thanks,
Yuho
