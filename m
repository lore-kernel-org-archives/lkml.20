Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0034B04BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649846; cv=pass; b=k4vxJslhR1OK9xf1r8U9o7A755J6A1MCzLxD+Fru3OZIOkX1sIVUsEUDBwWdlue8QQFBPeSPjtgHzI74zBXea+Zdem9WLCOtUUmr8L+CJMazFlDIlNZqKMTDSprfFalzt66HAkzu4i87fUtvNYTNd5+PKNtRSh3My3TBOOqgr+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649846; c=relaxed/simple;
	bh=yjGleyBftL4mc4+T7OaOkxuKfXAcAseCzpwWbCEkYR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHP4xPObtpu///SDzcJU1xfqpM7eONIVqQ08yFW6ceOmsOWfvJ/j5tG1P7VhCUUgWsfh9XenF0s2Oj1NCiRsAsJIkkGYBXq/AKhIPmyhAmHx+xUS2sMrAWjldNWfVaU+8WHCJ7bAxZOTtIzOjUC9V5Z9QUomN5P+s+3xOfqbLkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qrwO6V5i; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qrwO6V5i"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b7658501ccso1657e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789649840; cv=none;
        d=google.com; s=arc-20260327;
        b=aG76nKYbTqJYmKYEXvWr6JH2Cr28cYulFnaBGHPPFeC8Y4z1iF2cePd1DX7faMepLb
         Px26HSobmv4uil1dOlksFyWf3UCxCUTXg8z1IES4c1k2X7MmyJnrnECWIx2XGNOJO0jC
         E3HhZVd6Pa7tDqh38ID9MRR20aGDHxdOHYNFOUymFb56c8V36GQJmcA81Okn2OBCYSUa
         qEe7BHaT7k9kEbXOJkY9TOg1nUSN3ezyKAYRKN0kDmTz6+lStwn7mz5ajT6ZJIL85IXH
         +OpuKeP0LAsG8vIENHvYyhDdqYRMgLAMTgqhMh/6d8QCl9oE3i6DMio/jHoCpw2sV3zp
         YiaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        fh=Q+B/4OlQjUX+eWcTo6XVF8iJo5IpVuv3I7cShboIpxc=;
        b=BsTm3UP358DlxZ8p/2daQBBQr4kKS9OqnRXtDYyqNO6OQLkAK0ux2ppEaAhbS++bds
         eMZAckdR27B3OXVwovKRzDmSmYZCCxQy/oZq0FYLLOyRek+Zu4Bxw8IlikdKvuDzuL5e
         7TFklBloOIfA5l2HOOYqXV0VTCShpjkoXggeMStmm9MHlZU4atYDeryS5n9HKfFC2LbC
         hKPz6qIpXzdCVq23sJyOJWRv73OjBlJX/jUbMQdIqwXbh1Qwdu4b1x53UJX64dTJHj67
         FDje9J2Zoc+61T4/m4kqux+/g+3GnJaA3/7f9IA61Khusa7p8eQteZQXktlSbWkE424o
         5+Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789649840; x=1790254640; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        b=qrwO6V5i+FcCrr5WEE+v8JMCeu3t7EO2A6l+G3mMxjKjAkV/enOF48qwJ2xTuFMvVp
         FDeI78Fk44nAFgo/X5CP2pD2Tx52cekGiNOqzTq0RMm98zvGlY1chcMDNw2gHOEXOgkt
         GACpXMy99WT5+lNcTgRJR1oLL1O+8z7BAMo7zBa00Ugc7OM9NRIrGYbaXberlmFzQRPs
         Tem+ZcAMz7sQW4bp6i800niR35r+pQGe2Bb3HqH9XVbME628Rs9c0TYCnRaLp0PgqtQ1
         iHWv6kFrYKGsmRSvzEQaq5Lupwd7WbxrEM19cGRUMETW4NoqfNGQg6HjFjTUUhK9Etj3
         Q24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789649840; x=1790254640;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wCB7kYcnG02MJOJXUn6C/taoVXipNbSEcZ1HCYhjZfo=;
        b=BwHmOQtYwrqI6ul9MUCx1PvEogQQSdmhT5oGbgEeVPuG7watMex8mM8+5QUbRoW5Lq
         H2Oq9Ta6hkxAFWomA30ssTHIaHFHCadByhTYKruHLNGezfjmZe6lcLF9ON1RCNmtHo3T
         s3yn82Mh8/tJEGwdX7prtDUKcQUfVb8cRTnuMdmrKSxzrDV9fR4nX7pSNqb0XYC025Ea
         2H+x4KJvc7BOxlexabvnGnqlMhhcd7GmC3izmnnrS9vej5p2YDpKttCUH+/TSIgat+/K
         TMexLPMlxG2ZiZr9M3kIBOlpP1m1SnJJKFdju7A8qUhqVe8sltqRXiZagGcXEzX2aMW7
         q1DQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFqniQdJ+bLGYfYXzH6ks72Qg0SuqDYtik57qEV+ofJ0DMZUqKR/PPi/6lLyqFjot3hCACbZOlgQJdyb8=@vger.kernel.org
X-Gm-Message-State: AFuF++nKGe0lWwl/4JDEgqLbjmFk9avHAZS8WRo9bW/+R3hFBhN/AKl0
	fDswgFKNOiG0IKyCDlLRbHq26UqWTy9pta7hyaYex1GhkxldX/lcjD6TidU2RQeGn/cfH8/leKq
	bKt9Vxt+KSQ7OGfkcFrkmWEw/2EFzRzu06iw6s9Fh
X-Gm-Gg: AYBFou0BZ3qnKluuXGrIVL4pfyoHMBNahDI2B3vzDRrVIBDhZ7uUK6n2G0rP2KGrzuC
	IbgSz5TJ4TMhoS3nMpEyUkuTTlnu4mDUwI/A0zqP09HgpPjWoEPsJEitSotRlg+sggLporaJodE
	wIgBxaNhv72lq+3P41tiP64J9N4VdVS3DUBojLsMDmvS1AdQwd/oscp1AW0pd/d6MRFPxDFv7ci
	JiDKrspC06aB1Q1kXjRd87FvI9zpA7sX2Eg+BpyOsP2dz/ep46NlBzCMnSjolQV3BiHroodKQ1G
	9G5o4Uo2CqhXjSVx+w7TLORYzpCR60fEC6mMOlpNzpDcSnMMF9V+ATd1pDEf7ssGgGmvjCGrln2
	JVVN2pKu41lhcdg==
X-Received: by 2002:a05:6512:b97:b0:5b1:571f:715f with SMTP id
 2adb3069b0e04-5b8bff16793mr25923e87.3.1789649839151; Thu, 17 Sep 2026
 05:57:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915160141.3543048-1-suzuki.poulose@arm.com> <20260915160141.3543048-19-suzuki.poulose@arm.com>
In-Reply-To: <20260915160141.3543048-19-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 17 Sep 2026 13:57:00 +0100
X-Gm-Features: AcwNN1X3rwZaClpg5QtpbmDuAi81nkVt-NA4XEMnqdzMUr4WqSiJJDooQvLcWZ4
Message-ID: <CA+EHjTzKjjEuAuoOuzGG0uKyVZE-r+CEreca2H2kEQYuRPpgUw@mail.gmail.com>
Subject: Re: [PATCH v18 18/23] KVM: arm64: CCA: Mandate VGIC_V3 for Realms
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Tue, 15 Sep 2026 17:01:36 +0100, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
[...]
> @@ -84,6 +84,9 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>                  !kvm_vgic_global_state.can_emulate_gicv2)
>                  return -ENODEV;
>
> +        /* Realms only support VGIC_V3 */
> +        if (kvm_vm_is_realm(kvm) && type != KVM_DEV_TYPE_ARM_VGIC_V3)
> +                return -ENODEV;

Could this be kvm_vm_hyp_is_distrusting(kvm) (with patch 13's compare
as >=) rather than a Realm-only check? A GICv2 isn't possible under
pKVM either, but there the v2 mapping is only rejected later, in
kvm_vgic_map_resources() at the first run; this would give both the
same -ENODEV at KVM_CREATE_DEVICE.

Cheers,
/fuad
