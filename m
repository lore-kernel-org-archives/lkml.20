Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC47F2D7DC8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924922; cv=pass; b=msfcRvhRFNmzvBdit6C5JBdSJVAbU8kOWM0IpZF4FweMWB8cIfkIFCOoM3nLDSR0J/kcwrZrqIjbBx37chy8s70UAvcTHnqjNKDxeQXUVJtCm9yiOV7Y+nHlb0cMXgZHcxFmU+H6AIhiaAUlm5CajeDw98joYeugmafBuc3pwUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924922; c=relaxed/simple;
	bh=U5cQARyaWZkHef4krbtaBB6amM6mVxw3dWFsEzGJgW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oQ0a/TNsn2KTgCur9PWYZjkIhkkYbue2K9X7TeQK9kQnBsmhxFYPDeQQAy/qwlA/u7GbOWpHHpjju7Vr1fU73aplFPn/Cdf6Ttz2UQqFo6+uBVs8CuAzDjuSEUXtlghSm4deHMprGIKmsruox/CFI7/hdbuaodNjyyBMKAJZd70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlFiO0iT; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlFiO0iT"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b482f7b79so391354eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924919; cv=none;
        d=google.com; s=arc-20260327;
        b=XQY3L5gh3U1+NpF7WrDyUbQdEwsWyxFUbmbZ837BXkHsGQYE2f4+cSitQCJWK/AHam
         WBxkmQkL+bqFRm5jnAND6A6RGr0GjkJlicS6A4EBs86levBz/JdArqeuMiwJ8NvLIjNx
         JDzmMc1gmWYz1N3/UES9hm4Fhnh+w8e3hhhFOa5wCPhMMeWq6hJ2BchJD/W2x8I0ketl
         SmqmWpKOQ4qfDXy3x45LFDZCXYp8LK07kKF/SPlGRrxxLVYnCgn0pldraz0Am5eLplV9
         NcMDaXesXKETjnNAc44smcTDO/Spupr+7NI3Am07T9lJZFFUNBEhtQzvKFbp4nDqMqgm
         C2/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5cQARyaWZkHef4krbtaBB6amM6mVxw3dWFsEzGJgW4=;
        fh=xclhTo0C+LnLvorD1F94UekgFmBu1VMK/VfI30uouNA=;
        b=ZGR6KkHxEoALl4PDhRzxAVaLXeCCTccwGgC816YVADUsxZvVXwYJoczvYSwms1ON5l
         qnu2qE7DYtY5Di0EaPwRFggtmkAue7MQ2AV9pM8mx6WHLldEwmmbJD0p1zyfmCmuhQAW
         1YyPXoPrp8xcJWp4jhZQZY9eHzayu+F7IUBu6ygqxRt3AUgywIhaujxk/PphIWTlsErO
         f6WGbkQGdvUEuUJ9PnGp9BczuCghrRrFuDHBL0akURZ1r5mpV/ajp17Q3CJPDpRDHT+n
         hMoetbtjyNuAKsI4m0uR1zry+uoI8jl9UXFNc2w8JyVK8YYO0wqfg+giSe0FsnWH+R1f
         u99g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790924919; x=1791529719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5cQARyaWZkHef4krbtaBB6amM6mVxw3dWFsEzGJgW4=;
        b=YlFiO0iTofvOzy4ALaoFpFuKIZhVZZapKUrYo2f78KRnuCiISVS482eRh0PMsfs97X
         HvaWDFDulw6wrG8zFtolK4Y9k4PAT++d3cYtgBvAF634Bf9pFI/zNX3E+1FHNH3uBZvt
         6MhDP4DYrOR3Ct9F04wpyLhagYb9ldRhVkZLLMZ+9pJiYdlxb4svi5cp7DKS1Os/bukd
         UZtxtDfhzWs9xKxaiY8uTJmULKl/HzUOx6gz6znz3rr78bpKfvA4oMuS0E3eTPWv/iDQ
         OdGtCsstKkbVBktt5Fs0R5MDh7TwKMqiwBY2oeJjYLtvY2/CN/AtLPmnW18+s6tgo6+c
         SCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924919; x=1791529719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5cQARyaWZkHef4krbtaBB6amM6mVxw3dWFsEzGJgW4=;
        b=LGpmbyoNJsB30c2vm0RkNzuqdlrecme9zJ6CMlyLvnmNvOgDfVtMw8FGlj5+oPH+5d
         WX0ThHowbXBzTT7/zN//xsiuGcPacJT1Qzz+a0hII5ML4tTZbq9/iaW8NSuGbtUjohkY
         jWv05dMjz7YCFMw/7InLZzrrCWZEYRoBl1Pvn+ZC7cvc5Xfa2kEvOTQ1b/o7WJafOCT3
         OFOqJ5B9SF0Z/D0IlsH9oh/lVECdVNsjXmGeB0OmgqRgKuhZrW8RyNmqKSPwC1P+LKTW
         l2yimLfZO25/GCAkAtzd/kBy7HrMcZU8lSt+xXjo+5XqzzBcABoeA+AKqCcQWI4W03kK
         UdLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQIIA1OGgi7AKhimoW0gPFtr49T+eCFPVBhHSeOdt6Gg9oZNmhpLFnKMlHYNS5VLU4gWGeehxVRFOwB0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSGrLuFx4Kp2PNe/oc3efCO5GJ25fAUmbVcD1oBqMoy8FzdhwI
	X+lwav/nw+RMdG3UiyyAJsRaJC/7M4O4Z9QeeNvidtos2yw09h5DmYsiK4WbJbFOWscWpAMVr6L
	7LD9CPuPT3h0+pC+3MbZKHu5+v8KRFQg=
X-Gm-Gg: AYBFou3yA/DJ4OoOhN85AkWNOKZ8RXk5UZAodF9AGIokyLv7MNIid1dYwqVgnUBK15i
	2Zx/SaIDmmb9SQMiIBRD11vHVdjUq9YHJzYLGduRMVxs2NQhijljOSYICxHYD4iV1gXVqZkR6HU
	FBUB6uMp6Msbf7+SQXEZxvbj00i/YHsCD7NGL9HBcpZSOHWq1Shj2Ld6ewMrOSIErJrkYDxtWNv
	Y7iB6jLvkHU6StONeLNF83snojDaSowPNI1jgxMhzQwqzcsrqPvEiBd6jALvkNsxRnsP0O08Fxk
	Dj+iLb1zxMjIXrAUIeB+HuwMhVZazTifkXjrMYm1dnU/4KTi2ZuJDmXcyaaDUd6uzQGE7CGcjt5
	KgweOk1ifO8KY1nquB/V9IapVVACBmYb8CCQtk0oAxWcZa0JMakNJiyBl/LkQKszqcaYVNAlZu6
	FJf9s3A1M6d5tIt5i2rz5DxZ6ZNl4AvCseVWRxWNbP7SrNPIyS36k=
X-Received: by 2002:a05:7300:24c9:b0:343:fdea:9a0 with SMTP id
 5a478bee46e88-34f15028c8fmr3410119eec.2.1790924918693; Fri, 02 Oct 2026
 00:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910170542.92010-1-gary@kernel.org>
In-Reply-To: <20260910170542.92010-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 09:08:26 +0200
X-Gm-Features: AclHuK9UYZElY6zbzfH_vMUzN-_4vCGrMUQ8u1k44r0G3B-Ywr9v8m3eSYm-myw
Message-ID: <CANiq72kq1CKJR980mGJwE1GYZoXQ7Y7vcW8SQqmaFZAPWLSLzA@mail.gmail.com>
Subject: Re: [PATCH] rust: bitfield: remove unnecessary `#[allow]`
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:05=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> The `#[allow(non_camel_case_types)]` was there because register names can
> be commonly SCREAMING_CASE and thus not CamelCase. However, when a bitfie=
ld
> type is created by itself, this justification does not apply. Thus, remov=
e
> it.
>
> Users that want to use non-standard styles can add the `#[allow]`
> themselves. For example, the invocation of `bitfield!` inside `register!`
> macro carry this annotation.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
