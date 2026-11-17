Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794925935;
	b=Vyh2N7W5NTixkA4cwy1Lfc/YEaJjP6AlmWj/bltD/seYAw5TgnkMAEPjlSjjlE6dlPw2
	 0e3pK85XkMkOLa6PgMHtnRnQ8xYd4AAjuB7feE+bwm4K6u7MKwRJHI8bYNJaWqlMimez4
	 nES504mBA3vJ91ONr6DBSbBWFRH3ECtDWGVhr/Ujmabh94yDUUpnu9xG1lJujUGE7GI7S
	 Y7IiqpMN3Rz/UXKpQpXV3rfd3elPJ1QiUXbwXV5kBCFTWc5I9lB7PH1sclIaIoEGeKBtB
	 nrcFb8aS0Sjl7nnT/9rwh6lAQFgwHm4JkYVQMTCC5QoplspkK7F2YcO0sAO7ZcR4s9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
	b=ydKT5L1e2dV/Y74VbZUwX0sWyVb2E3DaGLIEI4Oy8gjcDxj8uqhIM0sXJxwtaHa3WJNQ
	 NxWxLGO/kYFUhGmCB0bLXZEXnzlcTCsrpfxmoikuT4tp51OrSGOrLH+DWolTTRLHX/N4i
	 jPpv8Asp+vJxeukBphXUQ9ak+ySNQnixirJUzYIZlzb8QH6AmkqWmh6yHQ5Ry1kiVtB5w
	 naXnAzqm/hI6avuuuswXrLQNCsbL/yz5XNFX3kSgoyuVPVnE7xzQ0gCdGKH1WmCEHMBG+
	 WNd/957sumeu3KVFfYu/e5cgkLu+3Nc/K9ORpYebKcWa0wV2aPIkAPaspWfjwO7+C1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KoCmeohz;
	arc=fail smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC690606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC690606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KoCmeohz
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso7446e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925933; cv=none;
        d=google.com; s=arc-20260327;
        b=GIdkyyXFMvyUDLtsjvITHWXgwWHrRTFIS5xD5IJmwEb3Yzn7ETp0RN36fgzPnJ5dTz
         Vxcq3yoyWcT3K544JtfYv7IAky2LxR//Jc2vLQ1eTrhoSBCugiKMekATcmBRFUynAuck
         KrLWpsXfllaZMgngLJD+CSfPaYkS8+g7SYareM3PjXkf1ybkFPCSMcTbN9yDTPbjJi8I
         bARxLqGo8xtoDJKKeJjwvij1PC+R2/3bcowHvrSdg1j2UKLJGmop6rrPYPaozu6XKSdl
         A0HXfLvj9gILl14vpL7CQXaAjWBsq3DVHjRgUE/9CCkn2XmbdP3aoOj1cO54mSu6fmPE
         otKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        fh=grKD7QCWGM5cEX32XY14CQqGKN7Py3YYWniDV7XbIL0=;
        b=Opal6Zjx0fBtAIgzFWXTQEapb3uSbJQubDiNyNLxiZMMZsijvwkVs2GPk3oKJhxq4u
         ijatTxHkxrhS6NaaLDJu6ui7vueGsY0212Z6pDdbygRYfYv389O0uB7ZCwgKCUlw5nw2
         K80SCf8rPm6J5q7FoJUs2K/urNpf10tt2IO0dHkfLCrr/WfAZzXK1CjIRMGRJkkV09Uc
         nW4aeJ4JlcqLsOSn6Xf+tRKpeJ1q4DnrjnV8k4Qx02EwvGYujAe2ib6nLeEqOb0xZ0t2
         ESf8r7Ja/7UR8c3eRWHRbNMBTeFG39txu4uq5VXaBysxJMXIHgJOLn3pQQbOlxCe+aRT
         9WvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794925933; x=1795530733; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        b=KoCmeohzvnR6QJRU9ePv2eAxWxwroupksthuVkMbtXcG7IVcOO2DL9t6NbR7jlcB6O
         GaxWgc6P2aFothBBRecXJkRAlg9LCKJ3HzjhAlIJ2Qa88MRzB6jKdzCXkbiQ7SAuGVCQ
         mybIPu617O101kLqtWC5VPzKK0HoAKquhFc/Qv2M7PFlHQUL6Hf9RHhaKS8tr3eRMS+A
         xey2QTUwSQzZrv7VB70CCctZw3tyKOH9wtMEZeq+RWiPlbRZvn6YbO+shgWgOmeH5sSo
         TAS1ICNHqC96dkbpSeJ8BQ4zvPe6DU3umNkVzJafDk0U35gAuVFw4yU5oQw4aSiAzr1g
         5LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925933; x=1795530733;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D3nGp/c9ERuihiWyblYj7YcY7eqF7eIZSBxt1bWzptA=;
        b=fr8CPDL1QuIWzSLXu5HUvZk5HMMB9TSRcObxOCHX+xb2YDQNuJLT0ueZby1zlCdd0s
         BcEzxbjXTDoWDa4qtBr4zO++xzcVG70fMfLQTeG1cLiFGvytfibHHw4lhhynxX5N7ueI
         jXRstAtW+nfRP0pIIah8Tbq0rkYKTCnziCY5eeGRc67Ebq+9tpzWGyD0kcbeUVjQLi2v
         JLTbKXe7ZLRw9pvuYh++E2NzBq+COIwD+W7ASrsIdWKpxlDda/H3mCC1rVD3D81gPq2c
         treNmLiWDluSlzif6bV/+6ro/PGiHqYqQNWN4IFIEKYVbU2q3Z5kq0fLsxH2GSYNoWZj
         ytrg==
X-Forwarded-Encrypted: i=1; AL+hErF4uSWYZfD3IUidw0MaCKizebkjt3IZ+eHLjameydN0bTNWottBnd7u1fCk+PjGikl6cPEl1n5cwngKcis=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s9WN+xPMLPhDfT6NSUpH7tm5M2nXcHomtNBHIVWghoIHZ/FjJ
	b9LWgC3sqZlNWCLhUtmmaV8xEtMYZ+qQT5vWNNWOC5f0JwJINFvYtCnyzoG4VsHAVO7sp5RgIgB
	f/C79DDP9WpDciUDN2ExYK56juaRDMWFRXCqcyNFUo0FB7LmyE6vGkc5Y
X-Gm-Gg: AYBFou3Sf3ASYfj3ia3QXoburzGsJI0G5hvG6lxEzIo6HYFM7VeNdWZIE/2rOdHgFIb
	Fxu8W/BEigrbThCGdjeyKg9gf91FMDlEnH8QyHaSO2usiLBVDImM6c7EjLADGs45dMSo9GED3SA
	sPCiesT3jFzZH0eM+60+zDzAvBIgt65X80j7PDocNABwvQAA/9mL6OO9vA5xfEDL1/wPLLJl9OC
	iuY+Wvilk35M9npgRQHq+DPyfwOS/tb/XJdIa9CQLo8QjmjZAgNpmLSUukaQEDa41qrGZ4oc0PH
	27Ox7rn9mf7td1S+zx+Tmboemglc9VhXpDlgALlPqw9ZUG1/LlKhXd5BvQMfyC3ZY4pTWk8abYG
	9Rn6iHLWPVwGuRAHtl8ZXKWAMM410LF+8GPUU6bE2whxnrEzC/u6VfFP2hB2vZPgc3E62NFD23T
	+aOmKIp6WMRiPVgGMKjRhRfqc=
X-Received: by 2002:a05:6512:1111:b0:5c1:4f9f:1ae6 with SMTP id
 2adb3069b0e04-5c1a217f086mr135560e87.15.1794925932245; Tue, 17 Nov 2026
 06:32:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-8-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-8-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:31:35 +0000
X-Gm-Features: AclHuK8jwarv0Qdp1aWUBJu9cvVLVN2wG1yO28RoPz1SpZjEhJ3_zh_LKO1lzYo
Message-ID: <CA+EHjTwqYUBvhjF8dxqVA1mF_Qe1r2UZdwkZ+Zirgmm2um=skg@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] KVM: Allow architectures to reject memslot
 changes before invalidation
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Hi Suzuki,

On Mon, 16 Nov 2026 16:43:53 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> Architectures may need to reject deletion of a memory slot without
> changing the guest's memory mappings. Currently, KVM invalidates the slot
> and calls kvm_arch_flush_shadow_memslot() before
> kvm_arch_prepare_memory_region() can reject the request. On arm64, this
> unmaps the slot from stage-2. Restoring the old memslot on failure does not
> restore those mappings, so even a rejected deletion has side effects.
[...]
> Move arm64's protected VM checks into the new hook so that unsupported
> deletions and moves are rejected before stage-2 unmapping. Keep resource
> preparation after invalidation, since invalidation drops slots_arch_lock
> and allows concurrent updates to architecture-specific memslot metadata.

For pVMs the invalidation doesn't touch stage-2
(protected_pkvm_vm_s2_ops uses no_stage2_unmap_range()), so the reason
for the hook is the Realm case in the next patch. Can you change the
message to say that?

Cheers,
/fuad
