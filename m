Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793772535;
	b=uqriegj+sggyt18Cw8QmkvmukLXzXLPb5XQs7nTs/PoH5WCueXSzKEUFKPMnQXwaKT9p
	 CMjPlhRkz71Sj6X7NT1GFmXz03KOIZPazIk0mhr7CWZqyKbnwYemEpReUOms1tqktEnG/
	 M7A7sl2QVpgB2BI0ins3U9eE6xKOJ3dt27AlgSXzhmSMGJJADYEr6BLPcP2+hkcmaw0zM
	 vDtPZBNShaglv12u6xcUQ9jLxKw0Uk3y4elEuRf6fWlSIi6QAGmcmaEQNY+RbebWZ+dZD
	 w/09Kz+P8XGbWt6ygtqvvROyuV4/oR7+1LjiehfkreUmtsDjK4gMnjwOWI7gnQHPpHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JA5vMLT9szW5mLfY0eUYovR/EI3W6f4OqW0QDEaEjO0=;
	b=M0kXK76CSMPculjnZKsLNi+/ltnOoMkZWtpK1dWAI236T/CfUIiEWiaSgPhmUJdyGMAX
	 XFErGsdvn8qh7jXXJMnU5b1Dih3qwisHQnaqthneOqiOd1DR+eTTKeMAUiDk92c/orTLm
	 OKMCLfhWMIPluERSL7KzCJYquw33D8jVt39qaQpWQlUYcdSp20ITGtgGUl+kxq9Tk2ZUq
	 zZz0upzg1hmP0KH2dB4gksEPJv3G4EjgAc28bHK2lsH80uMIF5TBRRnPUTFkUsPykpkO+
	 mlWUXNhpXDOVapkz6t7sOlO2DnmtH7lhRtPm52vk2OMPWItWw9SCg2u9cm5rwGtvopA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLmgJ8sw;
	arc=fail smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D1606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364D1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jLmgJ8sw
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so329576a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 22:08:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793772533; cv=none;
        d=google.com; s=arc-20260327;
        b=cfWq8w5wWX87fkwTvDJogKMUZgAN6DEu8kOOus8cQpLf/MURjNPZlDRVzFPHVsbvis
         sBtl2jBT8v6Nw9yroPA3BrMlR2Q9Uqg/+NFy2txvnXBbBJJ2SehKA197ZsmaxLlati9v
         igm+fJrV3kfKBHu8VXqNsv3DKKJSaEseAiQEycZ4VrFl64zZldPV+Kp38kU4P4n38Qb1
         yd04sFaiCUpv8w+W2JiN0xX40r8lR9YOfxmFvYe2SSJGyiYqU6kNmSnx+7pM53igHE9S
         2k7Z18h5BR1EXgUM3mPIYzcw0SIsWC7Qvo3pnMSa8jMcBF26zNJsum/HZZhyunQL9y5N
         U2Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JA5vMLT9szW5mLfY0eUYovR/EI3W6f4OqW0QDEaEjO0=;
        fh=ymujMb6xGZp7woKDpRdgOLy4oR0V5e4+v6YFlncapqI=;
        b=oBWC5SV6M3pJBq4yo2NTjliXp1jK223OEzEG+79ZnPOfdLY8EN9j1ioi2j0k4e8sIz
         IKdFHqsu8GBF53mt8Bcy/RCOBpGmkosHujT24mJfYUCYsj+lWKnz1o+mAZ7YTvDgijD6
         1e1aecuL+fVdW/zDWvqdfgeywRaS1DGqIOMkeOXhOKPud4BoOimpOXosjLAnlp2FCnF9
         KO4oKSsi2iIJGN1yckuzEhpSu+cFig7KRhDefaepyJzeixLx5nb7tX/cvrenKV/8HKrE
         AUaGQCdlG8cibxYI6kY8Td6VhvK/xD6yfFHg3wK6xh4Hj9XNnBMqstlqE6drpzoq5NMu
         i6Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772533; x=1794377333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JA5vMLT9szW5mLfY0eUYovR/EI3W6f4OqW0QDEaEjO0=;
        b=jLmgJ8swYkdf0IbRypo70hgc+XnzvV95AGf9zO24fj6Q0uAZt8QCX41OrrIl7c6A2Z
         noHBrpPEAOSTyghP0T/2Kjbj/BmvQoLjlltBRDKVoVhgdNNSlF+VhqVgl1nJUDF5og4P
         aiJb0wB1a5mhTv2aa/gMtoBpbaOf/F/X73AFZlMRhjPlu2T1SzzxTCoI+yy2ULhbYENe
         jo+/FZgh22tcl7RgXsGlsKiwDNuS09GVzknyMkzhxAdWeUtJ/q9ALzF7K1AKSTEppjmZ
         c9gGmrx2HDo2yxaHW1ULR6pUgL1y2x14xx0JoexDA604AurzkrJbR6d4r+Gb2yD7ASyP
         tDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772533; x=1794377333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JA5vMLT9szW5mLfY0eUYovR/EI3W6f4OqW0QDEaEjO0=;
        b=xXIdKt7dKVoZuCAj0Phu+l2KmkOg/sd4Qrz6Ko4kE+kepL1cUvtJru6cb+2ryTrt95
         bJLa2lZANo4A0yeNaqAbvGUzBKG3NizOlGJl3nqYFUvpBdnnveXQ1ua4Nz/dRk6nOhIL
         yMZnOu4E8DNxeJceSKoz556HsAsTKP8H/LJS+/PAGI97a/kt6XkZQGowHDtC4corA9eP
         2nujztkdMg6HU4DQ1pBKluuOZeLUrKny0PQ5ZlaPVwA2V+xXFAquBiHvn7+e/8Intfss
         P8leO9O8WakKkmSX3Az+Apt7+772dPwm3MYJKDMwe/F/WWi0mByg4VqzHbIy4Bxuum7o
         Of4A==
X-Forwarded-Encrypted: i=1; AKwUvBxVsuoNkXYXzeufBrOGUWxzHkyBLSp3PXZsrMqinNnlhuxwIq9Xsl1soF8IoMfS1EIxZGvbUZJZmemQoTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/b3SC7BsrfQkCJC+92UWQ0apRAFxTCK+D6fNSzc8sR0lT5ngfb
	2fsblyMqzqu4oaFzkMLx/aouiAXjGUUQpDhvPegWI9H2XghKzyhq2UszzmdH5ZrXmtHzEo8AGUj
	Q1pQhnZ1FU/qtV9jvbgSI9HFOG5OBqS8=
X-Gm-Gg: AYBFou0+ao2qsYML7ySfLiMtUKxKY4+eLV8hKKQP0NESl9ttrHtyxe5y03xAUwQzyih
	TQygYrIItDtFxqhvJPgrn17jpNr8n3d/XKPoKKAcZIi4uA6GRi54Te3qrXBa9zOE9BGRftk6bD6
	JRl7ijrb+SlEgMOUx7v0EaTztg0zSNAhLYh16USu94Ru5jOgemCLVNb/e0CEn42puLXz6ookQIl
	FFLVu100VmjMlS4KcFYqh09sb6SUwwRHZ63H53w+RO/fdbvy2i83zNhTtidAxDJJUI9g9xEHdlb
	Wlcx+CiEhPWHZ2MX7NsbDf3Hp4mrjiBvAPcvf/BeGzCQhdAKs5orb3wIngSp1AP8wMEhlrj9Ntl
	qO3kEYO5Ef94HCSEHP5DEEwzH1k6OkuWUr0TvI1OD8KIO/t/tliF6jHVR7SvMIwfRqPC1VgV287
	uPx7FEmSK9G+ulmw==
X-Received: by 2002:aa7:c259:0:b0:6b4:2638:8ef7 with SMTP id
 4fb4d7f45d1cf-6b4d468226emr8448814a12.23.1793772533397; Tue, 03 Nov 2026
 22:08:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <20260928011123.450800-11-alistair.francis@wdc.com> <DM4NT7TFX4X9.1GFI128LI5ZQ4@nvidia.com>
 <CAKmqyKNEup=x+bwmPD_8x0s4ssPkqFnQtSGqJ_82z9oDP=A6cA@mail.gmail.com>
 <DM58HRC3DHSS.1YC0E53ZXANT4@nvidia.com> <CAKmqyKPwirjmeBQvXgheY8Lh-M-RRq5pdbv=5mB4duhw9aCbGA@mail.gmail.com>
 <CANiq72n=eqh6W+iNWPdM+rrc+HujtZVRtVg=JB03OMS8rc5hiQ@mail.gmail.com> <DMHAUFW5V16R.20XEO2QDXIGGG@nvidia.com>
In-Reply-To: <DMHAUFW5V16R.20XEO2QDXIGGG@nvidia.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 Nov 2026 16:08:26 +1000
X-Gm-Features: AclHuK8yY3BZ4pKP3zSAvQ1_8YS2crIm1mKvYKw4mutZUrcwZsReUT8BFmZzmzw
Message-ID: <CAKmqyKOLSAFZNNhLH7hTVuTRs0Mb17jsbrjsesDWaN7CoN5dNQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] lib: rspdm: Initial commit of Rust SPDM
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, lukas@wunner.de, linux-cxl@vger.kernel.org, 
	akpm@linux-foundation.org, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jic23@kernel.org, bhelgaas@google.com, alistair@alistair23.me, 
	djbw@kernel.org, linux-pci@vger.kernel.org, wilfred.mallawa@wdc.com, 
	gregkh@linuxfoundation.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, gary@garyguo.net, ojeda@kernel.org, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:52=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Oct 27, 2026 at 10:19 PM JST, Miguel Ojeda wrote:
> > On Tue, Oct 27, 2026 at 5:19=E2=80=AFAM Alistair Francis <alistair23@gm=
ail.com> wrote:
> >>
> >> That was kind of the goal with `SpdmState`. The issue is all of the
> >> drivers calling this (PCIe, NVMe, SATA and SCSI) are C drivers and
> >> won't be Rust for the foreseeable future. So there aren't any Rust
> >> users.
> >>
> >> I have improved things a lot with v5, let me know if you still want a
> >> Rust API. It just feels a bit silly to add one that will probably
> >> never be used.
> >
> > I mean, it is true that we don't want dead code, but in general we
> > would also want more Rust callers in the future -- so I guess it
> > depends on that "probably" you mention, i.e. how likely it is. So
> > could you please elaborate? i.e. why is it that you don't expect
> > future Rust callers? Would the NVMe Rust driver want to use this
> > eventually if merged? (Cc'ing Andreas)

You guys might have a better understanding them me.

For SPDM to work over a transport that transport needs a DMTF spec. So
right now SPDM will only work over PCIe, MCTP, NVMe/SCSI/ATA or TCP.

From my (limited) understanding of the kernel's MCTP subsystem, SPDM
isn't going to happen in the kernel. I don't think there is a need for
TCP support either.

So that just leaves us with PCIe and the storage bindings. Both PCIe
and the storage transports have old well established C support in the
kernel. So those would need a Rust implementation to use the Rust API
for SPDM.

The NVMe Rust driver could use this! But that would have to be
accepted upstream first. From my outside view I thought that was still
a ways off.

>
> Yeah the "probably never be used" part sounds a bit strong to me, unless
> there is a reason I missed for why no Rust driver would ever want to use
> SPDM.

The "probably never be used" comes from having a Rust
re-implementation of PCIe or a storage driver.

>
> Regardless of that, I think it still makes sense to have a layered API
> design where the (necessarily unsafe) C API builds on top of a safe Rust
> API that enforces the invariants and other rules you want to uphold.
> That makes the invariants that C callers need to uphold manually clear,
> and avoids having C-isms in the Rust code (like we had with the crypto
> APIs calls in v4). Not to mention my favorite: it makes things easier to
> review. :)

Ok, I'll add a Rust API then

Alistair
