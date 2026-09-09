Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369114CCDED
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952851; cv=pass; b=fX74gk13opDzuzl4/KjGuZTNzzTr6/SwTVmPRnhTBm0a/m2cte/DrtWzRDwGxjNz3wtHorfVVNyq0wt8szWYgEc5/pWOke9BWVgIsWFtPh94uAzs/dJA+NibEJAJQ4caO+fE+O2xU/c9XgjxMg1us1/yMeyHg0UU7le04t2Co2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952851; c=relaxed/simple;
	bh=DGJNGDyqk/L8FuMkKQ9UZ8lh0gD+ZC6OA/bClDuW/zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VsBnE+i9TldtRpcQwAldm3sWHGDAr0rKhk+WdMYLjBubDcpVs1QIaLFLIJqbCV/1SdYnK6zV8RJpO6ZuP8naob7hJZV71abtDq8hkgcT6tf/QGVOHN8japk2u43HWl+iFbscCupVd8JgkDeZNJwISENjFJFU34EyBXc1NZM1eus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QkAL6QIS; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QkAL6QIS"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so5881e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788952846; cv=none;
        d=google.com; s=arc-20260327;
        b=N341PsvEbBbegNIYe95bBVev+1SCUb+HoAgYcc4KuNo0T6QJCs/UZ6rJ5657EM7kBF
         HscUnEc1hTYCRyGbgScbv3PAW8+5JtOUVQBpSWTkgViHAuTJmw8+wMgpL/Daa0IzdWyD
         bOMopfncyBLdkik9kcAJG+xhlIvobK8HRVUuM4gJgSQpLbg7kGQ0AJ3ryKXQky9BB1fd
         HgSoA4AbWd4sTCeTqlBnT2tbjlXMCHVVjl5hrrQ/ObbKMtHF0fQEE8HZD2MqxrihpR6K
         zYDaN4hBZT/ZvzrAiFREiTTVVaWXjt1eLPB3rqJC9AJevTkLkfb80NcXWlgUeVWvZDZi
         xBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        fh=dyOSVwuIHTfn/RwdbFRblMVz7iy3q9Qha57JB8+Bikc=;
        b=bHgcmFNb+aHmCaOzrM654oShIbl6AvKZVCp0xlsdKyFwkRHyX+koxwioF+HB1AjP2e
         M2L9s7DK5WLZDHxKJlj6kdwUKqZnZN+fDrAUlo8ychTJp+FSoBxv7bo7Z8/4x498o8zk
         ErtPsfqfx76upgv0XriMzTeBOulTwkBLZORPQi+9kGFONVfohwFGTh+7zridezHuvJdz
         uWu7jfcYkQs5+9Q/0NSl1RQJ+PVSk/Zf4H3taTHsEAwETIPq84H3J6QIt+3IifZHp+zh
         3odT75l8he+Hwx/JRQ5dF8OCIALsewkjARTPwTQxzpX6rP+f5WrxxSxRiCOWL08iMKke
         0uCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788952846; x=1789557646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        b=QkAL6QISn1bh3pjiycL1GsW/qqnPUqacyQ8OWDyNNxDVAKlYUulyikewz0sOsfWFpF
         mU7nyNB48lrWJXC0CGBhPw4Bu81utFNuY1RkyH3dJWSfXY9hjyal5xFdjdHQN6SQBGvk
         BhXchPSZPwI7wOE0rpTx1cUhShbR1U9xG7vxqKyAB10FruuGdkgjvbXcFdVNS3CPMKi/
         UKpq9g9lZcraCJ1vyxaA+6yCc6xUya/N/0qGGQ6GXFV25gYuGkoEtco2uL4PlmVa20Kj
         sMb0fX33vEk0Ecbry2QRhtC1zRcQPng6uL90l87DAeAMudopA+lsY3i6uYn5AKYLJ6sh
         VPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952846; x=1789557646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crDfVMRTURCJ2kMvoxcTffnKsS81n5x7VpWJfYEfCY0=;
        b=B3KXs0m9XRk8Fjo7DAW4OuVT0v4talNa5RdyV2rBEFxNbpF0UmbqdtOVsO8oqG8W4v
         4wRPSwDQZwdLXadh0vc+3NLZ2NKxlDcQDb4g7ML14xiqcH2nznOaEiV3p8uYZqx7jcKE
         qiKeFxFXzqwc2EkpoDXhe1JbKKCIGMFCUWLhTOydxu3e8wnEC+uo3EK3St2fmWtEtYGg
         w5BQpiHxjzgGglY/9Azv9yQOnvqVDDSLDguECLHq2tZlqt2qMbV6zJ6Zeam/E85f/E1j
         g7v3iRUfOhU480u/0Avr8+zwxPtJLSP8IRhAbQxDxur7d3VwL/TjG2jaW8WUevk2CPgJ
         bC4w==
X-Forwarded-Encrypted: i=1; AKwUvByHKtd/Qhhy1Hrn5KtVNeSdyOzDr0Mme81nPeyzDljm8MQ8LOEGBndDHQ4yPzyYAeGEMUGfys1w6Qfqm/k=@vger.kernel.org
X-Gm-Message-State: AFuF++mBFMMuNlSKX0ppIFFPGE0KYhwRCLgzo9OG6/AmeoxfcD2iszkH
	sxychqrkId3fUEnbiZ9Y1O1v1eJAH/vUuWdXJ4KdNwT8xSXznVk+xGHZCxu/m6TkDdad0Qur8th
	WLncTxXRQoHOFom905VZOJkb7W+RvQ3An9SO5Sp4q
X-Gm-Gg: AYBFou3pgW2dXwdhNT0mUdPrP8e9KEIePmUlOApkq5SW8En82K4e8VWdeYv7OUjHtVr
	W7rqZ54LpMJ04SmkH8lc5WrMMu5RKB4/ob7OzFq4gXChXJKBpCtRL7maypUSY4umM+6uAvwn9rz
	D2rquQtwdUxAzE11TxhVMZB1HCE/5SsHFBhK8FTjEoUQbPaz/3fzWUjy9GiMTxP6xGe5FKbuFzD
	+h8eFZeyyDc8NcyXqQf7Z7FPxz/r8aWC6LrZg+mZef4LMFaPokff8aeBg9luLmh1K72RmyBBThq
	WLTQDI6x9BM7NBEpLYESqrs33EzMhG+MsBBogjeTIi/RAEhmkKtPuHHyDxvKTMy2Rsby447uds3
	9CgOItwzDynw=
X-Received: by 2002:a05:6512:3f22:b0:5b5:e890:1953 with SMTP id
 2adb3069b0e04-5b764bcde12mr149151e87.12.1788952845618; Wed, 09 Sep 2026
 04:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-2-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-2-suzuki.poulose@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 9 Sep 2026 12:20:09 +0100
X-Gm-Features: AcwNN1UBL7PwhavrAXm1ihvLqEvgnaWmqxzjHA3KjiWz2CvXQREmUKFugkp-B-A
Message-ID: <CA+EHjTwSwGUGT=6GWaOyav7kBQey0+xpL0kJ03ABtp23ZgD6RA@mail.gmail.com>
Subject: Re: [PATCH v17 01/20] KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
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
Content-Transfer-Encoding: quoted-printable

On Tue, 8 Sept 2026 at 17:22, Suzuki K Poulose <suzuki.poulose@arm.com> wro=
te:
>
> Fix a potential build error (like below, when asm/kvm_emulate.h gets
> included after the kvm/arm_psci.h) by including the missing header file
> in kvm/arm_psci.h:
>
> ./include/kvm/arm_psci.h: In function =E2=80=98kvm_psci_version=E2=80=99:
> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>    =E2=80=98vcpu_has_feature=E2=80=99; did you mean =E2=80=98cpu_have_fea=
ture=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>    29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
>                  |             ^~~~~~~~~~~~~~~~
>                                |             cpu_have_feature
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
> ---
>  include/kvm/arm_psci.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
> index f86a006d67136..06c20612e9e7d 100644
> --- a/include/kvm/arm_psci.h
> +++ b/include/kvm/arm_psci.h
> @@ -10,6 +10,8 @@
>  #include <linux/kvm_host.h>
>  #include <uapi/linux/psci.h>
>
> +#include <asm/kvm_emulate.h>
> +
>  #define KVM_ARM_PSCI_0_1       PSCI_VERSION(0, 1)
>  #define KVM_ARM_PSCI_0_2       PSCI_VERSION(0, 2)
>  #define KVM_ARM_PSCI_1_0       PSCI_VERSION(1, 0)
> --
> 2.43.0
>
