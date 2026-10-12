Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043384DD3D8
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833721; cv=pass; b=DuTAInHEjjn6RiRR2AwdKkbqMk60AcFIPo52NdRVw8S3C6UYBD0e4smPgE9V7ayVsPxvtlUWsIEQA9Dcl4faX7ehKzegqXKflniXEake6zoh+t3vUOuka617oxRKJVdIotbitRoty1fnOX0Jan/+Y/kIDWRRzcvdD/E4hqvt66U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833721; c=relaxed/simple;
	bh=Q2gByPfWahclPjbop9vviwP/KgBIaaxiAHSDaN+U72w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VuFAS+HSUlgriyeeJ1R6Z7NoQj5dl9Hmh5w+8RO+gO66MqtOe5JEhY6Bb1CsWQ6/iWff4/7UE3mpUfZTgJ7Yijuu3jrpimQIVb7iyVRuaH0CoY+jj5JNlkq/ta+wpEMZ2OjzaoNbQDfB3xPJ8cahnFZvM27r69uqeRhVIFmortg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GSqaeCKY; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSqaeCKY"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so16509a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791833718; cv=none;
        d=google.com; s=arc-20260327;
        b=UTiIvdIwOVUud7DUfjEtdo8rX3GtgdXV48QkKNznQsy4rCtoRlboCDpb4KsdwMGJEu
         9sYfKcrCNjnJ11J5x5nNuJkbjpFVaCZcTInTdGR2Gs4cfRrOCDwC6BxVymin/dj60FYN
         r13GkrOfdjcuiB0AJJJ/Pfn3QTGDrQDK1ic/g/u74OD8PUolzsZ8qx9nqs+tuiBnJROa
         6yT5z9XfC5Qs20iMZ/vC7BMIkoy6dqQtadaHKPJplJOJHvqy1F1j4Zc0M8cXtOOfLfyq
         CtYP9YcmYInqkKoFWfSjsEk7MWRuOHrEIOJr/nP1vJyB9UUxxWv83o25E1Azn6lERfCK
         bluQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q2gByPfWahclPjbop9vviwP/KgBIaaxiAHSDaN+U72w=;
        fh=Un6ccEZ+72Ihqks2Um2vv0FCb7aCdGfTobF7CtOFy1A=;
        b=m7jvz26wVFg9sj74XH1YxD4vm865JcOi0JQK9pLL8ZaynRIbGBkYY/2is7F8hKpMMj
         7dPL9ea/NoCUw2DatvdVNbVhiBEBG9Ps1oy+4u2IHv4265EY1R3n/7daMKemWSJhnTNt
         RKk7nJBCPANxy5w4wqDe0N4ZTaIn/oSpGtm0j4qlzxoBHLc9r73wZEWm6Sg4LhuGSdaI
         YpiwaJLAGi2sseszvKd+34+fe1N9FHTzrT1Sk8G7B6LcqRNg1n4sQaIBWdwYtRf1rGq4
         dxPTARWUeagsU5+G3bdbKywX+p3I0xqfsX2MbH/7XBkzLm8EbmzYyry8eEIiJNZ5IR3d
         brlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791833718; x=1792438518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q2gByPfWahclPjbop9vviwP/KgBIaaxiAHSDaN+U72w=;
        b=GSqaeCKY/9TzSRh7ATo2ktqIG+SB4FahBcEtVrFT2+NHoKSllhmAkPXk5zDI4MQom/
         stPtqQCA6tmvMH4QFoHU3ZhDZZH3h4A5r7WrPL4UOaE4TN4r2xq5Ri6bxaU61VV5r6+h
         xh8nqXJiYArog9fonAg00llrNgObiERpe/QLkrpiY6tqynZglHcPAFwvMe5TNfVNLrwH
         DIawgGZn5t6xCz2B+Unxv0W1qwMCH7BT//LcVprF10YImKkcNFcvf/Ax+llS8LyMP09z
         Meh+m9OtrcmPM4EilrILO+9YFo0N3yKvLvpZwac8PXzOKl+BO+KdRXVJ5LQo66ezp+NN
         DXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791833718; x=1792438518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q2gByPfWahclPjbop9vviwP/KgBIaaxiAHSDaN+U72w=;
        b=cxV1M+QH53YN7qp/Zzut6lQ86bE7ItTSBYiggr3GV8yIzSy8q2Agj+bCL/G8Fi64Jd
         hS0NiWLR9vo7MyHVw3MeOEBfnFrtEZSLz0YlQ8ptjLWkYmVnSkpBIVufJfKCB4nh+1OS
         WSiHiX7zUwdXBCZnHk5JU6U3QPyCUruuUnAmNHLxxIBRU133FjqyQE/UG6kgRicvrMPm
         L9/WFdz/MMGUvZzo/lSj7YzmANZyZJrZuOZvT6OWgjyPRJCVTZeClLoZg50e9ma9rIzx
         f3bUeLczd59+MsO2YPGoUnxQRsUrHZzmW+yrEveAHXoXYTxYq4bjNcGnW8WHOfpBarv3
         yU5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwFye4y5/R4ZhQoENHSIHtluzyyeqOhlLVweMB7PjLJ0UnbtTPn4hXCZSluZYtrtpP8xRROkxrjbeK8BeM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/fy4GU9pziNzyCyXWinUQ0OaVRoJ+zTGbpAgIdB9CZTYrP0W1
	+MzHymDRC2whUavWC3DhyiVmPQL63MlHJb4YWGI7TQKLeECwdJ6xG+H6PEYDvfKKVV2KWxUgDlG
	yBn6rfg+LVEuVBYWoSp50hcfwWEZB7WuM2yFk9FIm
X-Gm-Gg: AYBFou2HrOEaLU9hkpDGkEr+iOjsIEqZZrzzabsTXUSMg+6eQ/z1kUn2TRFpeYLQmWQ
	pbOJLu0EwPzzQks6Ef7sY6hwyEXDfdAmZ9kVTKnTrhdfh53T6PQGTPghlgZwRBdIg7JCfKoxgz5
	2QWQgS4lCS6zrGSyxgDqbsciGyUeSqvcMI9c6NXNhZhAkc2jrynzW06OT6i48J48vnl+g2/bkvO
	f1K5zQH3Q481OruegjVpicWksqTNGyKBMrFpEp/LiLTDJzPByCJ63o6XJTVB+RHj20nKF+I8lhO
	9Tmex3NYv7osQeBbe8EMfvP0bguqet65XoHZvfF54xd7HtAVU7pluGw=
X-Received: by 2002:a05:6402:4610:20b0:6a6:9d10:f52b with SMTP id
 4fb4d7f45d1cf-6b199a0b183mr87198a12.12.1791833717701; Mon, 12 Oct 2026
 12:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005192431.87317-1-hmushi@amazon.co.uk> <20261005192431.87317-3-hmushi@amazon.co.uk>
In-Reply-To: <20261005192431.87317-3-hmushi@amazon.co.uk>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 12 Oct 2026 12:35:04 -0700
X-Gm-Features: AclHuK-NdKkEgB-ivjRQq65tvY0OhAcQTfcWgQ3NHF0TSHe_XuBq-mhBC7CYfcM
Message-ID: <CALMp9eQ7U2j-GJn3Cmy6US5NUi-aBkjk98s-se+hJRMZ8VAL2g@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: x86: Extract __kvm_set_clock() from kvm_vm_ioctl_set_clock()
To: Mushahid Hussain <hmushi@amazon.co.uk>
Cc: kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, linux-hyperv@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com, mushi.shar@gmail.com, 
	Todd Frederick <tfred@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 12:25=E2=80=AFPM Mushahid Hussain <hmushi@amazon.co.=
uk> wrote:
>
> Move the body of KVM_SET_CLOCK into __kvm_set_clock() and leave the
> copy from userspace and the flags check in the ioctl handler. A
> following patch steps kvmclock from inside KVM and needs the worker.
>
> No functional change intended.
>
> Assisted-by: Claude:claude-fable-5.1
> Signed-off-by: Mushahid Hussain <hmushi@amazon.co.uk>
Reviewed-by: Jim Mattson <jmattson@google.com>
