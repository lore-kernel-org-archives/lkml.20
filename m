Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD29477E38
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257015; cv=pass; b=t2bxMz9uhwqjmFVjMr5tJc71diPoRysdIrMClq+tisSfPvQR1HKuAiFoVR+sAHCH7ukCbpzByHE68pjYaROxYQ8N2lS8/Hr1TzVhq1/amGjGPT8adGnloDvPoa2VuHkfX7hfMCbfdWdTa71KXdxhOx1CZQqImeET3dVI0xKOJqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257015; c=relaxed/simple;
	bh=dtC2b9rE2+PvqyfvIQpFBFFgI4ZlT+seDQ76UBcyXhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1FeLG0ukfAtwQKbaDNKzj75K9mZqvEnqUldEjfCHuOArknWC1A3W8hfVxLzE5+JPlygcFtobeWOInaqq9RGATM9RxTpW1pZ9maCZAM48GU9rw1SE3sjwD3K6okfwVe+dwHesn9bx7YYX5U+b385DO+DdrOmr2/1cVm4peCEAbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2rRfVrQ; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2rRfVrQ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5862bc921so10386215ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 03:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788257012; cv=none;
        d=google.com; s=arc-20260327;
        b=MgCO3ukUGIgfLXD9hVCeJmD0o09+0bMF6gvR6IuvQvt8a/49OikPu2/bLTxpg/f08e
         bLgp1yuHnbBfJzIwBHYinsw5WCXUyzr2wxE+ZW0TlVQWHI0/+SwARvPJ9r6raO+NQiMF
         RYptnsjERawwdOFHFrnYRACoblsCEAeanp6uhlpEc5kMvv4ACy5oCpMAWBEpTubzBAAA
         +n6g+cEmhVXWIt+srQpoE6ZS8Vz14loT29dupmXm9pSuOqCz544SrhU7zdb6kTmFinbw
         F/Pjt5UETYabDqugt9uX0U5RiD4ZT58SD+tnxr0FnVcBk5zuEFTOt1rCqhRaWLWO/jD4
         4w+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        fh=XQfNEO0xQaLZ+uFMj4z+HTVzhRi/GDpuXz4A21VQg4g=;
        b=GjqmheWwxdkW/oJaSJNg8N9HYC3TFyNjav9OzE+yhR0nc3sfe7Tbef5LBeQQXitlCm
         QKxwURaeRkOMMbb7PIUgCdo5yOnzKyVNvu7+ZwyiCIAkMMfhVbqwOmAfb5kSMIUS1n1z
         PrCMxX/EvfbgekHxLWs26Yew/7WnOm20mQTd1MaLWq6XfF9A/QX3k3iRdpYJroGn4jLE
         rFwZ69RFNB0Jr2E8N4ngKVFNMnspcZ+/PUG9hb0ndfi2oF/kEqJ+LmIMvHk9hcEXCl+g
         kosbWoEmZCw1rFNIRcy7V+ne19AxeiXWg1rovVecDDLn3t1+GvhQAVNzxiVp49PYPau6
         +tAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788257012; x=1788861812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=m2rRfVrQUF+pl/kSam6VyJuJMlKFCpKV113UKvrgRdbCvB+LA8c1VZE60GMGuqVK0d
         Iynnc2jkGkjmV+FADIvZDGIfWpB1e2SqBZEG8A0/PyhgPZ7CUF7+rNci/JpNI/hH9xUX
         ItKTfLWTFEF3CZmK6D6Eb3GH1L2nz/f0j8MtgnYnwFlS9yOvj4Kfd4kDh+IDsJ9IQG9a
         iD4E76b+B1l0G2UyVgguZLJCQ5WwLFaMlhwHwhbBfdWXGKQrtiDudtCOIRET4udMU+Fz
         zIkZS8Vw9HuFOiDEgzzDYq3/UiIFvnq4clS3Yg8ljZgZBq3W4grGnoJZbsSpslzK4Yvg
         rPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257012; x=1788861812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=GVkvbKRyltbS77LupothSjWrYztXIxK4VGbBTmUCpyk8huVZmLzYxgnVnZeM0aOP3T
         ugvefswwMoL2KIcoLmm8sDyI44f0BjWZnj+BnawSTOlBZfOi83BtAWP3JOmKDi2aRijp
         CGd1sy02O0imlcXmx8QLHymwn4xQrRHHWjRn2+HCkLzREiqI1vUxxgERxQFfJ8mB7CpZ
         CoBhQkyfChuZVQcDuY/npmv8xGawdXeRjxnVo+QP5SGY0BEVZKuTGjK+tpuUNxkNlSvK
         9iwpsVbW9LtEi+/BV7p/EI1BgaWK8FbvJCMg/NR6pM5hHohDRU3vCmVcwoZknW/GXvtx
         FMyQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4s7IyNdvLrkqhN9u1c/pyV8iWaxAovUbdUZ1UE7BDPuw85F2wkPiegBTO02cBf2ss7LQoWOrjLFVZqtQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l7KL+gz2CDawtXc2iTzqSm32V+IyxXt2JJeZRD4N+TBkpNkJkU
	ZIi896b8LVRs1JRI/ibhDN3fLGRrUIAyGRopu9eMDdttjnDMc1Q60VhLHlXlG/Y9TDJZmH+1Rkg
	v/JSuL8zcJD+ALypSL0Ui7cbJBqZi6Ho=
X-Gm-Gg: AR+sD11CbltoIQ42BEI2P8DzHqUNbQtOX9//M1TTBIgqGijwgrxAw6/mc8xQLK7XlcZ
	DhVHeeF2lz9sed+ruhNQ2tj/mZ9LgnYiwck+M1lbF5nTLK3W66ZbaBW8aW1hdpHhoSmPdx9mp4b
	r6hJAwROBrUTKu1MssKBb1cURukLsK/AV/Rh3/zmYT08/JrrTV5v3bzUhIt94/q4SzyttZBP2c9
	v4sV+XN6rlrgSh3jWuLjL/wAFDH9EcJ5fbleG/Srbfmwjrd3duhlj+Gws6jP/gkEkrKaFPKmdT1
	NVhi1yATZOSQi/kpeaJgKY6Gt3kYMEdki9u43Me4iIs123pXi43gRyBww/KDWrzRo1U3x/ha3G8
	7dsWFCIoNO6Qc5ZMEKPFJdA7pDQeIlmDZBzNZo3uBcffWL5b9Gm8YgKiWI1xQ
X-Received: by 2002:a17:902:d2c7:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d74ce38075mr274123155ad.0.1788257012245; Tue, 01 Sep 2026
 03:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260831151605.638172-2-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 12:03:18 +0200
X-Gm-Features: AcwNN1VbNKqeV_yey9Jhr55AwO_DusZQ-wcQLGmrDCepzJ3Tk4JUYrXX-Z1lHAo
Message-ID: <CANiq72m0xHD1YTADnmQ-fqMPSNHrMGwfPBbT7V4crBgu7B_ecg@mail.gmail.com>
Subject: Re: [PATCH 0/4 v2] Docs: changes.rst: rework
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Pereira <danielmaraboo@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:17=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> ->[v2]
> Ditch the name change [PATCH 1/5 v1]
> Add Acked-by: Randy Dunlap to [PATCH 1/4 v2], [PATCH 2/4 v2]
> Add genisoimage, mtools and syslinux to list [PATCH 2/4 v2]
> Ditch footnotes in favor of a column [PATCH 4/4 v2]
>
> [v1]
>  https://lore.kernel.org/all/20260812120805.1631430-3-manuelebnerli@mailb=
ox.org/

In my usual go-through-the-ML exercise, I noticed that the subjects of
these emails look a bit strange: one is missing the version, the
version is at the end, and they seem to be out of order:

  https://lore.kernel.org/all/20260831151605.638172-2-manuelebnerli@mailbox=
.org/

I would suggest using `-vN` in `git-format-patch` or `b4` to handle
this instead.

In addition, if the changes on a given version are local to each
patch, you may add them per patch instead, after the `---` line, if
that makes it easier to track.

I hope that helps.

Cheers,
Miguel
