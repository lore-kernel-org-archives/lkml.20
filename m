Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB03931326A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 00:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222056; cv=pass; b=MNXLfpTGL0BkKgdx4DXyrfTeK4YPT9yifqplmzG51feCVQvfEBxVoJPLcTQlH5UEyQH/xMUYulETlm+fS9431WRKwv3JRjUmy/nc/6DbVGer6ggeUdOp8W93E5tcsAanTl09qbtErTIXniu51EvbBqErzzRhB4B7m9Xv/dlndc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222056; c=relaxed/simple;
	bh=yKxhql/Y+4NXkktL9/Mk4ryjp/LtyC/+Dj6BrfX5aDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seL+N4KdPr0FQtsb0c9k1+L2iZDT0xNN//5VcJAOGvaKPyjbjRM/kE1sakE7+jp8FMWgGwfLaYbkCFKabjD+L1QG2huY3TSmrsX20kqhiX9ad5QlnBwdMB00tXbPWKytO+w359AoIJ0ANeLCOwE8WCPNggytDzihKRv3T7PcJew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJxlMvDo; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJxlMvDo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbe41618110so726097a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788222054; cv=none;
        d=google.com; s=arc-20260327;
        b=c3ob0plLf/diKNVzGoB0rC0MJ+thPk1zj+JaCFwSMU5xF60W+Tgm/SOWgbctjjxrSr
         NNPY6VDjEOg+MI9KbDyWvoxo8jt4aUEwx681ZmeQ8xKJo11ZWt/GMO7DvNyBmZR2n27I
         HB2+APBtv0XgeS+8OAHtv7dphsv5J9u/e+xTMa1qtugIp3qbyMLSbNbcreC9DeQbtDi2
         GNRD81zXRcr+e+NIhO8Cjt7EQt4k2hTtpX15fHhbfP47haqCuFNc4wlkq7onuZbgxH/z
         JrCKTJXbyowPGMMEWNNTccFFjbTfGRYinbqe46QiM91jbhnDM5X9moa+vnGD1OMI4rih
         /T8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        fh=cOjpz2KxZ7CimL+7EprrgRsGlmdzY5BQjzIE6H2Mq2A=;
        b=U0cVZrteESTjQOo8dOeKOFUlv3KI8KKdTkQXVOycvFHJjp79l7y5BAwMUhuc4XLzZj
         gfOvfQwenggBfT8F4JauPevAb/kPMYm4UPeedG99cPubunV4fKzRAmWXt1VRN8u6od92
         Yse6bhicZLyGgu+UI6BbC8ZAwf1ORAX02IxcO4EVPeFZRUHUKRmnmITDLELKPkrnLJ/n
         YLV4myrnEbxIZLerJLlh2xPK3exVKrZxrtv9aMOzvuxbqD1yURBr9U6I+KAm+Yxq7++n
         p5ncDTDrFdtobSNQJdF+213BiyHWaVwwSCaFWAo3LmSW5kL+cAXnNAL4ii0f5qfu4J8v
         8Zuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788222054; x=1788826854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        b=WJxlMvDoR9a311xxZZDeB8a4F/nzxsMuhSTJqXn/K8ec7KaVFeVvAtDjYrkKKuCnKE
         9SDRH6TuYry18qgXbTFw9gxRaNeepitz5lWsOmMamYKPSINW9ayIaj9e2w3/VijhTi1y
         Jx44GrSZ1o/TNhwcjQY8YfJ3sqoKbjGOuxCQ7phLYQiOPMfhr/Xp7omKdhuNB93saK0Z
         /9C0w4nIfCs9caEWru7yg0QKq4cWnPOLPKw+J6Wl3bCXMoGLjYNawDJ9Q4rlXvA32BS8
         wIyxqZX1slrL5+ydBsmfPbmvE9eYANwTZeMREMyNLR5BD6D930Y3vgoCmIDtTXbhJlha
         SPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788222054; x=1788826854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        b=TXSVFBKRsHX+//Lx4fxuZ+UcjazSiRRyh2DpN7kolZA2ZSqa2RwAXXdXPtPxr7/u8F
         Hv+a902esjkgf91u9ks4lMg9+GHSP5mn/H/3hWaIw9pV+manD+1gIrkGeiZQ9yPOqJUD
         7ZbiLuf0Nz/ezdMxwXgjZlmupvsL1ytD0JTvj0+DJD8kf3kfM0nnEJf1SXjEVbD5BqXT
         YlAnriZ3QnorgGH6gonhuHTVFsguUkSQejwZ1ND6iTBAT0pUgkcR5BIdabjzY3LhHeVc
         8k2tKXiAcPi3qzX8Oq+8B0PEasfDQf801HAaG6DyoqCv78SqaFZxq6Y0ZrS7sX7FEPmb
         RR0g==
X-Forwarded-Encrypted: i=1; AKwUvBx9WZew25gI/1TLD3f1Qgcxg/J11KOnY7w9qkggk4GqufRJHvQx+2FFYLd3IJd8XhvOgvO6RGrW1wI0WDg=@vger.kernel.org
X-Gm-Message-State: AFuF++l0Jpey2NaQC7YDEft0Ms63+GcF0Whgf+t9gnSUh+lLPyeURKAR
	J2TdtdR/WHN6+J6qMA/IBPqReoQX4ewbp0mhJKSj34dqCGDT8Ce3isRJ4G8J0egnSml0yQ8aG5R
	vrwRWbq/wAM8wvJf5WwfEA/vjsvvPPuw=
X-Gm-Gg: AYBFou0xEHbx5XVGEY18JpQfc4LipN2TRfDAUzPAtQoaYuMjsQ8WN3zF+JR+g0UihIj
	/hlyCc/SodaBAFUsoJsostY/HB02oc6LyD1oQPL1nINTflClN3vvQuDEmLSClFYGCRwIt1BhMfx
	9+aGDpVyCMWbGlB3RrKVXvfgJ+h5DviLR27FVKTb6RNgORCYEAtV2jFKJy6YaYEb50lieZWtIFo
	om93NCXA1Ds1ZlD3JhEg3vJLep0sKia5+BKBvN99lbBfaQXXYDjLzbHB0xspt3ZeREkNZk0u/5y
	jayYUo2Te03BJ/+vkvPWiawivzurgfI3s5GG2uDB7IxfxT22DMUoVeeXY/9FNzgsslUuQ7SGzgX
	AgPcGMU82zns3S+t+XUNf+Vh7wtEa0NJEMmVHaVfYDJVqt7bsScM6/fUtUfRC
X-Received: by 2002:a17:903:3093:b0:2d8:d29b:c1e5 with SMTP id
 d9443c01a7336-2d8d29bcb42mr138133325ad.0.1788222053929; Mon, 31 Aug 2026
 17:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com> <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
In-Reply-To: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 02:20:41 +0200
X-Gm-Features: AcwNN1X5pai5UixP38pMLxKtm7ztEWzDX6RG0f92oKoJw41G7WeDrbSgeZIxUGM
Message-ID: <CANiq72mwh1XJO=9gDgxhtpdkRZ+S568MZE8LShQ0yDiddOc=NA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] rust: samples: add missing newlines in rust_print_main
To: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:52=E2=80=AFAM Mehmet Koseoglu
<mehmet.mkoseoglu@gmail.com> wrote:
>
> Calls to `pr_info!` in `arc_print` are missing trailing newlines, which
> causes consecutive messages to not be properly line-terminated.
>
> Add the missing `\n` to all four formatting strings.
>
> Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc print=
ing")
> Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.=
0")
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>

Applied (this one) to `rust-fixes` -- thanks!

    [ Reworded to fix the description of the missing-newline behavior.
- Miguel ]

Cheers,
Miguel
