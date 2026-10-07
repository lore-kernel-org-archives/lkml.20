Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F44B45FFAA
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371286; cv=pass; b=p7GGHUax4rNIk9gH1nWdrutYrAlVSHOJhc5Ap3ZZ0At2R7Lo0N5oTZD0Zu1CuORTALYPhpJWL4BjWzYohmyGxTKVbRGT2/0VhQTqUHZWu9lPpwCidlYw/BcKO4+8boFTt97a+lRjs+Yx6/pcuv+ur99bkkMe5EC+1pdSzQNgh58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371286; c=relaxed/simple;
	bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zd0JPAOax4MwDW1eFdyuQHyhM31fgirS6LkWT5KFtyQ84XnJylXl0nOOtJJ5Jv8cofvsep37W8q6wLRZopwBpZcTSdaWr4vOdQpcekYb0ot5lG0gPFVXTcLygIvS7TZ7hf2lyb7jc4lt8Y91NtZy5Yl38dJGIfpkRRksnjWhnkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKNUYZrS; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKNUYZrS"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba40832934so5763e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791371259; cv=none;
        d=google.com; s=arc-20260327;
        b=f51OmuZDXRA9OXqaD/IuQtP8asNaGVRDYHCisYUD3dHiS1en/JXlz1ZZ1wdQfgiDLH
         1Abc7xF/BjnSH2TiQapA6mycmGX6wMFl48pdRmVs2CYwpmO4PNFqYTEhC86yL865Lcoz
         gZatFHnT0Us1gjHlUmLbx9gmva3LHnOiIpm3BGSXnd1KGhrq8m6HNljhGzXJ1pcR6oVK
         koqXjT/SskIN/PdAyTz4T7QK2vBmC+1XJ7lQxatruYd+cig+kC/MtvFHRr9Z1w2MpaLg
         YZOiygpnxmnx1t3bFIGWAaeYnKHjnv/K4xSdWfkHfHYLDxKAWtFTebnSpzHvPP3bFwSi
         YMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        fh=SP5zk07nn3QCU/d82sLlBmEcsB6mHWeWbIYDzxiGwVk=;
        b=LBfH8p3d4bLUFljSXxZ/Cm27f1V//JzZlkQpcLCiYJ/p0IyvY2qGrUMm/ycJs4XWYA
         W3rGUBZc43IVILLHVDDxQRljbzxQUS2G3EBUNgA0dGN8vTzVP4J5MPJCpIBTh1Q7dvKa
         /FsMPQ1GYfcBRx8VhEBduFXHcSN8ZsJAxkJc8Xs7+7zkuPzJgMtToQuy0HBXsspbcOFp
         Eu2ex0aMx2j01moF31S4JgqgAlgwXDr6km1Qf05mZEP6FEdqsKyl/YjlO5xpUp/lZzCu
         YlR5617B3uq5IltkQw1qDbezBV5+uLZaNXrpSseT9uxAqsuGduZzIvvW+lnVWKdHRT9y
         x+3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791371259; x=1791976059; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        b=VKNUYZrSB75c5LLenbrV7FhHAZNT2cDeAHIYOkHFR+dUV/Qn4gwjrgwLQ1qBnYROF8
         krdtkgOwoSFFGzpYzotuCrzgjh9mDwqz4ghA6HgBdBaMGNcCFi2uYASdXwmRfwtwBX3h
         288cLJ8ZLu7GMo7ei2iPtJVNGzrCF5P8Vf2fv4kbQ0kXipl3Py/1yJ7ZeIYWUtCFzCH4
         h4X87JtOqjf+jNnfXTpT1tMVl1OEUQl/oQ75LlZ7Lm+2QYNe8JYO15IlO8PR3BP18dio
         WP1yGoWU0lxJU9m2fJCdoFBvd2BJOayBYsuR/62nCsWhVPMW4WMNlilrvBZVSZg6HTWv
         QAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371259; x=1791976059;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n6pA0UCaHovGcyxtuarmqmXJupW57jUc87NPA1SduJA=;
        b=GbaAh9FmnYU76W2j7h1mpc7jyQ1X/IyNXCFxQUjIT30Ko2XQMsLDu39WBYvDToU4be
         7MTep3MPHP7krkZ34/EgDx4w46Cmu0k+aL9l/qmwATk2/kj7ZX2jIcO54LTKKDntSync
         pJNnFOxahrlpmJPdMbBhb3jW/4Zxa7BTtJrSYaDToj6aEgEaFkRP3rkoNKOuAn0Zxs5L
         2M/ng9W2nEGzln9XY+fMeCdB5uk9aPPTEKbkhFGQDliv7eCWIuhYirm09CMgg1ib8Q7D
         /7/hHHHF9KBHbRHJkRud6WZbig0CNDsC/UfJCHHDtxYj3BWo+eONvYYu6c9jzHeuyQHK
         VeYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEPCM3eOe4gVczqX8tLCULAmN7CF1OGQGWj1OwkkAUTqlFe4k+9pxl7Hxzl6pr+xlCjb15mEHZASNWqRo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9scOV2jV/uJn5O0xd/cZ8h4Lblcw4MYwlScjvx2iH1tq6vsZU
	7pelRT+PNv+tWhAUcQBXS0KlZIuCJ1xZiPnuBjbATd+DxCY1YOaHxMaRy4bUEJzp7DgpIe/qSga
	Pd180wIV+KArKuzmljfv5vkIMz2Q0sK6GJNEisC5P
X-Gm-Gg: AYBFou31HVRyem5hwUXIDI2/c7Mnb3QBiiFZbPtO9ZSrkd35PVsThHQwhOGJuqV3CYU
	rQpASpjPaKrUyVLIhtNpnrEwABkwjvLLOTaHqQ1tZsna5RHZZ47q4ysJDa7GthmTW3tyUZe6tvd
	Bo9OaHx93tJmfKKcPRKogiFpkTfbcFloXlW2hsGkXbXQwDDQlGfJe1rFHerEZygHeTZe0Ta2rKY
	j1fLEulMTQaRE8oFdavk8EkwAUlyrL39F1LcF2UnPG7pAbc8GdHfALKjMQTn3kzlsgESSTwI/MZ
	2MaK48df0dz16pX/49coCoHCKRqfsY2Ni5m7f3DO4D4RobJNAoDEtoM=
X-Received: by 2002:a05:6512:1189:b0:5ba:3534:fb8f with SMTP id
 2adb3069b0e04-5bcca674bb8mr331538e87.15.1791371258668; Wed, 07 Oct 2026
 04:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007073537.2454351-1-suzuki.poulose@arm.com> <20261007073537.2454351-7-suzuki.poulose@arm.com>
In-Reply-To: <20261007073537.2454351-7-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 7 Oct 2026 13:07:01 +0200
X-Gm-Features: AclHuK_51tZ4nsMn3i-NEL4Otzbz7dcWMCHjhG-tWBC19X6nKIZVcoWjuDrLVic
Message-ID: <CA+EHjTw=9e4xv8SmUggCgHBM+uQ2v7dWSOf9PeBufMUofYPMwQ@mail.gmail.com>
Subject: Re: [PATCH v23 06/14] KVM: arm64: Don't call vcpu_set_pauth_traps for
 pKVM host
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
> vcpu_set_pauth_traps() bails out and does nothing for pKVM hosts.
> Clean this up by moving the is_protected_kvm_enabled() check to the
> caller, in preparation for adding VM specific vcpu load/put callbacks.
>
> While at it, do an early return if the vcpu doesn't have ptrauth.
>
> No functional changes
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
