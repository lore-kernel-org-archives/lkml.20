Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA664480DC0
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372296; cv=pass; b=GXEMSOKn65TbVsr9mrFNwamMq7BnFYJ0W1G6bu1Bp3UOZdlvsrvsQsU613HJ7POiXoJfQazEoMD5Q6Pv2EUA5inGpa0wBrjnYHadrdyi3xePv7YAYz2E7xwBHATh093R6JT+YH3STndKdfrzQDWnvLVvZfn7yLBxa0aL4UzTcNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372296; c=relaxed/simple;
	bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jp7B35Jz1SrLAJ06/+LbOenVzYdDDv1eeLX9p6jc0zQmrZOlGnj0ImypJCKcS4LPttXUOlHP7y+8e16bwAeJ/UhSOiiuK7R3MvJCF7LH6Cxckw2RRgQ+OTt0BNIno0lrYjzlTZ1OwylT5B4fAvu+Fzwpc0YgImII3S2wnDVDP6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=viYNep54; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="viYNep54"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so8052e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:24:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791372276; cv=none;
        d=google.com; s=arc-20260327;
        b=RzQCC1N3+Ub0qPYn8x1SlUqMZ6EKUcZGtfwsmaLk1TeHqr6KX+YfZ7T9xZmE7M+N1U
         O2rQDY4FeshSb8rnzs5Q1FySmxVNta6fOjwApGDhNbbWlFstVwWZL3uz3T7F6pqDmpAs
         VZwOVcAZaYO31Z0HQsfxb2Xdy6nszBox7zxpqvVaVP4W+BzOIioi4RtV2AZlg5dwC4XD
         pPEGofvX3W4/rDAG2TZiWYgYM1Zfx3SNbdcBrAP9Dw5T73hP29Y+Mme6T1oiO6NbRjKw
         2ZjxHvjs1pKrPxwdtz5xrlXv5waT0b4H3kKkdExMTphcn80Ar9xhIHHtvDwXuTb8DC3k
         /8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        fh=bIp9YApcBURWGbSurGW2GJDgJY3jwK+GBgQN0FmiIVQ=;
        b=pzqoM8TFJgeN0btuQ/G/0FbpMW/XMNTj25k6pxkE6Gj2NL8DWTE18UyTK6a4gjRMh9
         LRudN9EzoVMcpgI7lXoWCw12vzzEWLkQ0ZtJb+d3hEh53fonJKHVj7zXMJZiDLRCcgQE
         9gFgRYQt5E0byAlgxzk5QBG4/9ZzB/xxjuGJmQkCibadpcf+8JlFhkC46RYj8MYJhRMz
         ihyzwKnTmTUP2/+mLXHlNrBfET4dbO2E13gEApARwryXDP+O9wrY6OdrIX7Q+74W/CrV
         mSpfRVcv4/e+Vns8QYVlyFGPSERm5+D53cfIJpJhmyoUQQhuuekKnVPbw3YMTO3sWsTo
         sLag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791372276; x=1791977076; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        b=viYNep54Y8bhDRmTRxuG0pzXcRCEzzH+gJi32PD7gChGRsdph9djpcd+wFH9oospc1
         KOEbdGl9HYM7qTx1RQeGR5vzkhPzA2bewQwQcZGdanTd10BbQ/aywpjlizdyikCquzCt
         nbrJ7SQwpJm/s1ADdIzthIekFFSAOl25/auq2j6rp6omXhja4cEMGTaIXtw7iB/oGXGa
         7OZa26+o1M+XLuvu7uwX8jwge1+O2KRKNkZ+wr0JQOdj7g0c1tMz3WDS7a1nsSGTAxEu
         /T2LdVJmo1J2qRrhIEU1YXPsDGTEOSDhLXwnC2NENW8Q/Heae2EZyWq51hSM3O2lhQZd
         Oe/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791372276; x=1791977076;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e6PnbIvoXOZFv6pPRVmqWiNMYIregQMXJAxqLvuHzdE=;
        b=xQkYOcn5oNVXnOJJgk986v80P4xyB+ZGkPh/AWS6a31H6x4dU4dJr0AZD2LJ+ikIRk
         a34lY6z6A8hrtBOmaUKIXBCPpdwuIGjKwU25I645/EFrHnxhxMcgDSns/yLJ43eRJMEI
         7X1BeM7oa70V45P9QRCOdiBw0cgK8YIfBCKmSsSt4YbSC00iH1MnpajxsUuXWgETbufo
         xIMyShCsVulWW8pQyN/T0ySyneTScqQ63OKST4KmX4z//mYyl57bLAEEjpKlLvTgfd2G
         6wcFo/THBZZpORRenQlKpjPfdJDBiC6eyJcDzU08rrIe1XMFz3enVdsRmYHWilZToeLr
         Po5w==
X-Forwarded-Encrypted: i=1; AKwUvByH2btd/dDhM/qxj3mIu2dxBwaCgJVr9cMNuyRsK1D5pHqAi+b8gWX7DHW50ZYufwn7cNfF5D74syl0fLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjlP4PUwshCxji9zV/Wm45C6fCIEb7vD5fHWoa2vc91Tvs/4E5
	L8js8/TKHtP3yxystwrAXPnyW7g5ikXmQ5kK/E6ZE3HC0J8+FTAevopQRab6ZNXXBederXhRdlz
	9HoSJaKr5D7BaVlGSqPPG8MWiBjrp3LRXybYbaYJF
X-Gm-Gg: AYBFou1ZZJ52jQVLEpEXZVlfvKAe6UzOmhhNVuRpfcDFOvI/nB/yRm8xhb+GTbxx91K
	gFz7aihJQuKrCGSm+pceSkHZhyhuE9gzsjLh0X8c9yBUI8sGkyjKVITPGacJ8ITmZ70BFg7kqLK
	w5EvpMPnJ+oFZ7HkGfluFYquzxNxK9p0lGKlKlfMc5zx51GuDBl9JQKNMRWsmz5OKpnlkhxkWpT
	SuIxxA1YsdAcv996kFdOTYwL9n6sWoyYJzpfPLEFaqZbE3k3e3m4th8GbxuPgyW2NskqBZThQYx
	u6foRc09CY7dTknqc9jy/fSe4lIaLWMdHEE+z5Ok96CdfeKfFa0itA==
X-Received: by 2002:a05:6512:3f0d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcca857470mr320723e87.8.1791372275119; Wed, 07 Oct 2026
 04:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-10-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-10-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:23:58 +0200
X-Gm-Features: AclHuK-AkPhTBNuRx-Nil52s88bZX1XXziZHk8i7cIYK8SeGo6JUTxyL14CKqt4
Message-ID: <CA+EHjTwHBasTofGE5YQj0WfyN3v-uHykPxRL57AWJGhAO5Pojg@mail.gmail.com>
Subject: Re: [PATCH v23 09/14] KVM: arm64: Consolidate stage2 unmap range into kvm_stage2_unmap_range
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com, sudeep.holla@arm.com, 
	jonathan.cameron@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2026 at 09:36, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> In preparation for adding VM specific backends for stage2 operations,
> nuke __unmap_stage2_range() and fold the logic into
> kvm_stage2_unmap_range(). Also, make kvm_unmap_gfn_range(), the only other
> user of the __unmap_stage2_range() call the kvm_stage2_unmap_range(). Also,
> while at it fix the comment to make it clear that mmu_lock must always be
> held while unmapping. The code already mandates that and the two call paths
> do have the write mmu_lock held.
>
> Later we would replace the logic in kvm_stage2_unmap_range() with VM
> specific backends.
>
> No functional changes intended.
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
