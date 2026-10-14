Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913DE50C280
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984207; cv=pass; b=EYPFNWUe5EnqCFv3jbLHh5YjGduD5F9zvEmmoWmNutaGBUtYA9tphACnc5bDZh0W3gdb0YcAs0vpa/1N52QK6dvdLXAWa3jL1rTmyVfpnIFh0/8bDu+Q0/DwXn5T8b9ghSeGrmZCCqS5QJBs7cXezNLRZnjkdpj60EUfUyqVm/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984207; c=relaxed/simple;
	bh=9N5l3xgliyI7DgwvETpVVXBnUo7bo+QHYse1Sw6uPvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoF0UI3iFtaqvw98aKWTkEvfStfTK4XsLY58Gi/EKpXmI9+tirjYJbB18ILG6sIWvI6fua2lnNuW6Djp00LEeQADtL4yrPGLbCluN7FqTWI44Py2kUyEWzSQ4OQrKPeZmdsXdMDMGmP43ePlvA+gyZD+JE7c7kPevy5gAOgfYVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DJddgj/S; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DJddgj/S"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso38919a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791984204; cv=none;
        d=google.com; s=arc-20260327;
        b=bLnLby61+ckNMtyVsGuAbxptqY7gR/lTnAhpI/ftNnNvtaG/y+9DdICYbO4cDt8Th3
         E/nPVbGfBFy++SaASu8lOseQKKXkqes9MgOfJJ/dVANvv1bc4Qx7qI/OwLwKAJSL7yRo
         ZdtEGHxwbD7zMJaqFrwy8imYOl6zVMgxm3TYw+umBuxd5SQMkwd8JzhXGVZhmuOfm2oA
         hJkGQ96NT+LrBKTq0OH6B5WIURrRfoLlCUKxVA8pyBepBvygxmlLqUo30uOXWOcF84PX
         shOC98tMI8n5w0pgOgr+tJWZEe2QVQ6v6USUcpuivEzyfv4gDNyp8dqSXwr1ellOBe6d
         IXRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9N5l3xgliyI7DgwvETpVVXBnUo7bo+QHYse1Sw6uPvM=;
        fh=swmZHBQmxH2ipDFD5MqXA4XBcPQOEtcGg9+2AMhJczQ=;
        b=r1sOR9/1PTpRC6drH3/Jk8tZ9rWJBVbDfODrNoU5gDz/EDri12hZc9oEwz4Lhmpq9+
         VvABIO+ko/0FioUA+pmmSIfKRIaneFxB35VjMVI18f6I+FSKpmPEF22srgB9Rc/06H/p
         K2A7W73J/e/Lr212MJyJgKBN5CZsb3sldsnjTsX48M6KEvxVLqX+SlN32ngaTh4viTBW
         /qg0iDI7jBIE7Qbdxazx3wwKIKZQDgfeNS1WNFugxPqXFwK/VxJ0d+bCTVjacRVxirR2
         UJQdc+GT6OZ5rkM9QrCw6YAAdQO6NCCwH+oUqCjnuGRhn267FXo9ccLXwp4OnYrIOLQL
         EBWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791984204; x=1792589004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9N5l3xgliyI7DgwvETpVVXBnUo7bo+QHYse1Sw6uPvM=;
        b=DJddgj/SQOx1k6Gh07ID22QLRGPzmjViCjicIhnelsO7J6s7cl1WKeI0EE/Fs8XwFr
         XIDve0/4Lg25OFfw/JSpLJUANTEOQwJ2n0/5LpkHWiTpJfSPLYPYAdUo8oJvwd1WbvR+
         ctk2JcErybtP2vS+/6T7Vj4Xx+kq4xUABU4zgRR/IJdHb4Tj70kgq8FHa7ZN21U/w7Sd
         VJ01rlLDcHtwrPWAvsbarq7Re3sdnjqk4Xa1U8zBuiqViIJogqcSFmLhOlGXR9QrGRWT
         1H666XMba1SzADWNu8IDGBBH/QM/eo/BfcUoWNgHmxpHh8Rd+S5Z2c6iLJR74xGELl8X
         Gj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984204; x=1792589004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9N5l3xgliyI7DgwvETpVVXBnUo7bo+QHYse1Sw6uPvM=;
        b=tBYEKvEDcaZWfFXAQg3oyu1UtU6jKZ6KxPgRnnpbVrA65y3zmBCClL7N412Upcarf+
         JzzrkIsEzO81id3Wevs3pF8hKfPBCAxe5OmNXGrwR4eXcarj2wRQtDLIt0ypLV1jBg0p
         v3oqgFDRUtrCBXmYDENwCJT1cRY6BMN35DgAeFdUPjVEZfKtrbDKVqEd8PHawGcjBlYm
         4e7iDDC+qk/7PnBnR639gCwVvIJSVYADfGw0NuOnaq5q3dQmId4oyrNXNV8g2ORj7gsm
         6GQYh8TlJ0M9F+OHj1YUxbZ8dHkYBMkXvCQd6/iijSCG5pRp6JwqlsO27VCOdG1pPdOI
         zXMA==
X-Forwarded-Encrypted: i=1; AKwUvBy4ncvocA4NrzpcnT/Nb6b/XiSNpPWZbzYFFctegZaF5zbjCwgKOlKYPwe8JgvYbnH1eBzMSypXMUqpqjk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlx5hBvlYDyA3rOO00UmDBIdO8KF2MxtcgnFUDyw63z5Osy8iN
	jz8NeCOmNQ2Z09060RiA/1EQs0P/Sup9QfojZzoBExuWceRAlZ4u56gF/CMaThmn8jwz+FKdCc1
	AJEROq2F8ZZ964dJABx2N75V/hIh49bTWIrSSowaV
X-Gm-Gg: AYBFou3geT3YwhTwFYtwBgTIe4Wrr6Lh6UGpZCtLEI2FcYNzKjWIqTbnVcf7ILSqzNL
	SZ+xtjGbRTrzCMTW0idW+9X1LFYLgzCkFrdZ4RM1Uvh0+cUzPmY/My6dfK16U7VUzGR5zppAwR9
	2J8JU8SG5HAwSej467HTumz3VkF0a5uzkZ9iH6HsRu1CF5tePJOas6JnbV9yZ/KIkXKB5Xa3B4R
	fYxDYERm6CfhSQ1ZSvKTMhZEUHb60APeOy8bVcT4G20C3V0OCI9G2cLh2vb2q3B4VzjI6JxkbXN
	HRBM/i/kki8vm7xgnXyRHyIYpbAuItS8ic6FGSNzT2ykUSpkwWWIYAo=
X-Received: by 2002:a05:6402:22c5:b0:6b1:c3f3:225 with SMTP id
 4fb4d7f45d1cf-6b209504430mr47922a12.0.1791984203271; Wed, 14 Oct 2026
 06:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-1-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 06:23:09 -0700
X-Gm-Features: AclHuK-RlhwGNQ8xFg32XTm3ZB8N_AkFk2N2sMtMgCS1te4fUNZ89xFZDJbQgpQ
Message-ID: <CALMp9eSuH1xe7PQ_WtE9DjqWjnKanFD_AFiiR9rEYkSV+sj45w@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] KVM: nSVM: Optimize nSVM TLB flushes
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> This series optimizes TLB flushes for nested SVM by using and maintaining
> a separate ASID for L2 for each vCPU (similar to VMX's handling of VPIDs)=
,
> rather than sharing the same ASID and flushing everything on every nested
> transition.
>
> The series also drops the dynamic ASID allocation scheme and uses a
> static ASID per vCPU (or two if using nested), bringing it closer to how
> VMX handles VPIDs. Modern CPUs (Rome, Milan, Genoa, Turin) advertise 32K
> ASIDs, so there is no need for dynamic allocation.

I'm not convinced that this is the right direction. It's almost always
better to do things locally when possible. Why not keep the per-CPU
generational allocation, but allocate two ASIDs per vCPU=E2=80=94one for ea=
ch
VMCB? This would eliminate the need for a fallback ASID and remove any
possible concerns about contention for a global bitmap. Moreover, it
would be much simpler to implement.
