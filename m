Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794873007;
	b=FhKgWb9g2PuNUbY4c41ebUtH8W8UMP13GiV3Zf4HapbyzEXEp7JlQdn4EIeKWnV798Hw
	 bESTmSikkDrmKC6XUG8NgPYtMS4JXS2PWbjgZ9vQjAerJfioBH4l/4+LWsxjxUiXGQQz7
	 NozokuenGiTwT0dy76XV2x0uEDOhpLCI+hW8/yfifB08TkXbwO9WmTRi0UzbM53j5+jYF
	 w8Pj2xBgT71MY67lHosAnFFZK0lGnHBv7OkzL7YGT8gigVcTz+gggeKflcNpvhOQkQyde
	 I20LzyLotX3vOa3HYBFrn7vjaDsfF0/vhv+0Olq32ZKYKunjXCQbhgqvIwlRdbs/eAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7FRS3DAvrAxtXcplP2lI1BU1rJaQlAKpU++3t87iHlU=;
	b=bVkSbZHWqyU9xAOlbsbkP3mXphSd3sRh9G+VaCknfrhqaKznOllJ8Q8XOtwaqQmCaFb0
	 aqo3/QNWKat+hVxnXrIaopRdTHopvGmu52MAeVXOCxOJgQ9CHdYRwypuuRFdFe7BMl/7k
	 3LjW0SbprPFBMnRribtEPwi06GDk36vmapN9Vax6RN67hYCOhzoPiBMtewlIEfL5MrlKh
	 n4lkmnLSDeB4/F7qF0Kuwd0kYsXAJ/SVLVk1Rz+VekR+7rJ8uQX7xla95mKn+SmPjmaNQ
	 SRXxK+LrZzckYPc9sQ1FdR262S/04RFFIFGJCgEGp00O6zh9dU//lkuIpRa8gDznhSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqvemtLw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2217606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2217606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqvemtLw
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b81214ab40so1104649a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794873005; cv=none;
        d=google.com; s=arc-20260327;
        b=RAcKoqseDhUjUEPQaW3ww7wGsn2IsloP9WpjXdNFBatMiLJEK/hs/G7DGWSfREbwjk
         g6n1sN95+b8vd+0YxSl09LeVAoGGO2Yf3KQP8iSR8kC5qlvlHhK9sfImhq4g40Uvar3R
         b1Ygr8JAbMQoI6STdmwxSzLbQtkNQQg9rrJqa6WiHIIAe0r6qCJzb0TaEP5RXJEMtnXg
         55w+XYxgM43M8cJTuecc9aMK71YnWcboHH0PW/HK0KeztpYcpd+7gpnX/AvzZXwQ4edp
         4EbQLB4chG8yKxnU6yTtIQHretQu6nCHaiDSxIfvWjpH0dII9fLifYw2lJg7RTYqwE7I
         dQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7FRS3DAvrAxtXcplP2lI1BU1rJaQlAKpU++3t87iHlU=;
        fh=RPdHWF39XnhwI0cauM6n8IsoBsaQTy70h8YPAxxB1NA=;
        b=LvwUXOaseTpybrhzLQOHYYx7dxl1ZIjJgVhED9/cNHfFCzcLSgIyNPlJWhdGKEb3Lc
         +tq0skmpMvD2HoNSxu6kHsFxLxlGf8UVFusMX0Yjl5eRrEpg+HHgMFer5cl2HfXIxCqe
         WWw3KVXvRE2TuN0304gp2FaCea1+Fi3nt3Wis9Y3QgiLTFyKsg58axzXhbBMV3eMtSVK
         W0ui0fbf01pjijy5pLGjkEkLQOg6b66iNpFY2xltiy1OtUsFMg5g1GFytuCRhe5/zxZA
         1X478YPLDQGb14LnQI3V8ElOJFJgTn4E1VaIIIShOQUKVoEt0s2qJPjUXNeHWs/FWLbH
         GEFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873005; x=1795477805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7FRS3DAvrAxtXcplP2lI1BU1rJaQlAKpU++3t87iHlU=;
        b=pqvemtLw2O71X7r23B62BRqkqr+ryl8tzqCUbYwgOY8P9YRUtcY5noeVc0Q4rLsNBQ
         zijkKIPLCDKO8bwiCim25UesGTSY9PgIFy7BY5BexbxUgvRf4JviUfuZfwg9GXzqBt2K
         12vOGr/NdO1pwsLaG3ylr9O5p99suJ0iugumHnc1JuF8pJLItmDdUyWamNXb2XRMEg/z
         4dCCrKpaSZ2JqSVMkI3zctHREdE479RxMTlpS7La3NKrdpxrC18LucQoJEAcVlEHQgTx
         qHYkh9qIJQYZ+wruOEwWz6f+6CEzqCq6PifkKVZ2SbtA0cgN0/sgUvGuZ9HBEZgOK3Yj
         GyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873005; x=1795477805;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FRS3DAvrAxtXcplP2lI1BU1rJaQlAKpU++3t87iHlU=;
        b=cVivgXR4oOjOsqjENdAOm/+LY7RJleaxHhVN69RQTeQGKANLLSaO3tT586H36VRF2D
         pisHEO5qz2OSyeV4UTa5N/wgZkD7X/qx92AQl30qFbmbLHn89tZnwkRw8A85Zrqak1fT
         6/Q+8NsVvkR1vaCNIuZOJuB9X9uy/eMrWPf57kAteO1Ey+P4VrmuP1GklO8NMBVxx5Au
         1ss9xmbDho9rCjpX/DIJZIWG9lQovVfS/hBecVtnyjDZw0Q/FCLnUJQvhqHeZrs3jokt
         5pSjOpUBMzCIUrip/d6JQRDWAwx2tmhQAzfMOacPekrluCQ790Zyt5ze4m9bbCnSzx+d
         L/MQ==
X-Forwarded-Encrypted: i=1; AL+hErHIFxigezXgxEa2Y28cH6l9t4bqGUh6rKSkq5ciDutwT3DoHw75SEys17PR7lp4QPro/8lo4aNv1ipaep0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SMsMZ+l22PDuHiH/mzqcnfHkYf1KkzoEQuYublK1Nx/Jv+2IE
	YpUiZfsUk2s2AdvKOD/xFWPaMp99+pnP07wiIHjPj8qSWQET4358Wmh8Zk7ffR4mmc9EKDejH/A
	mBDDcwa3Ylr3QBEQGUGRcaSwNJO0Lr1g=
X-Gm-Gg: AYBFou2r9SBvWltV2kAAtQAvn0d9Kd0J9gv/yKH80s8PW3YEq/g3VFFUM9CauaZVdta
	omufUSHspiGfLDv6kKDlp4r6K6IIUd+mgRoO5MI0ZTo0TNCE6dfKY0roVjY+S02F7rjqxqoqAn4
	mOQkbzdsXMs/Yl35SfCGVBZCk3eQzwK6taUUvGxoMpYRMye7Y5BZ0eCo73IGuJfZI/40lebg602
	bGtSA5d84OZd1Pp+gCOMglfSuP72BTO9OeZECuxyXFYu5yTmP/7I72dRtsBOp1UxcEcEO4Wrteh
	Qj8Vb+oKOOAjAiCQnYPXgNX9Fx+rQv3LRtxcKRffsUngsSLaj5L/s/eGo47iSb2RwncM+MjKpgj
	mJwykpQS7SU2+Oxwr8kSUSNAOONZdXQSmYKA/wLxH4c10PJzY6DsbERD/YTDvMILEG2H1MVmH
X-Received: by 2002:a17:907:d88:b0:c36:777f:824c with SMTP id
 a640c23a62f3a-c50f320cef8mr84585466b.4.1794873005174; Mon, 16 Nov 2026
 15:50:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPZV9qUk3-eKOGEjVc7f0QzZcjb3L5QwUceAEUV0nuCdo90eGw@mail.gmail.com>
 <20261114235828.GF3706007@nvidia.com> <CAPZV9qUvgKjoBXGjYXJzwnCmqzSfu781ZSG8zW6Fn4PokUN2uQ@mail.gmail.com>
 <CAPZV9qUMZcwVF=CUK4LY4G6Qoqd5ykCXE5ocX8VCy_f1c6+aBw@mail.gmail.com> <20261116074022.29d96bd7@shazbot.org>
In-Reply-To: <20261116074022.29d96bd7@shazbot.org>
From: Gustavo Andrade <gustavogyn@gmail.com>
Date: Mon, 16 Nov 2026 20:49:48 -0300
X-Gm-Features: AclHuK--I7eLB9wssYrjidNqtZcmf5db4-ZbJTD49xw-7f4cTL26Jgoahe2N3Nc
Message-ID: <CAPZV9qWp8rWLkdzdQ0hJ3nsN0CQXj=7epsV9UnG-x_7PvYgMXw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] vfio/pci: Wait for GB202 firmware after reset
To: Alex Williamson <alex@shazbot.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>, kvm@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

I completely agree with you. I wasn't aware that QEMU was the proper
place for this, but I've made the change there and it is working
without any issues.

Thank you very much, Alex and Jason, for pointing me in the right direction=
.

Cheers,
Gustavo Andrade

On Mon, Nov 16, 2026 at 12:40=E2=80=AFPM Alex Williamson <alex@shazbot.org>=
 wrote:
>
> On Sat, 14 Nov 2026 22:47:34 -0300
> Gustavo Andrade <gustavogyn@gmail.com> wrote:
>
> > Hi Jason,
> >
> > Thanks for the feedback. I submitted this as an RFC because, while the
> > workaround solved the issue for me, it seemed unusual that only my
> > card required it, since I haven't seen recent reports of this issue.
> >
> > How would you suggest I proceed? I am currently running the latest
> > VBIOS available for my card (Palit RTX 5090 GameRock, version
> > 98.02.2E.80.10), which is also the most recent version listed in the
> > TechPowerUp database.
>
> I imagine a better shape for a quirk is a resetfn in QEMU.
>
> The fact that nova knows about this issue and has code to handle it
> suggests to me that it's only the guest initial boot and reboot, where
> the VBIOS is run before the FSP is initialized, that's causing the
> problem. We don't want to pollute every vfio-pci reset with this
> wait-for-device action (if we did, a reset_done callback would be a
> better solution) and I also don't think we want to implement a
> kernel PCI-core device specific reset.  Either of those would make the
> device behave differently in a VM, or modify the current bare metal
> behavior that's clearly expected by drivers like nova.
>
> A resetfn in QEMU can be device specific, wait for FSP to initialize,
> and not affect runtime resets where it would be the driver's
> responsibility to wait for FSP, as nova already does.  For example
> something similar to vfio_radeon_reset(), but calling the
> VFIO_DEVICE_RESET ioctl and then stalling for the FSP initialization
> to complete.  Thanks,
>
> Alex
