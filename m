Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5CD449980
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973936; cv=pass; b=Kcc4lt9oLr5g6Z0UaMMy7TQyGuoTX6omWuSUrwP2BzlBJZqDE5+hR2ykrsTAtJ3j2DODjFy9wMgXtY3khGt8XNOLbDHQadbGqFERmOzV6EQrU+tXXpjJtjB/sq93UOOQgh63m3TTR5ul8jH1Zhys21Nr+17pRSup48ZQtXr9Gd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973936; c=relaxed/simple;
	bh=zELhr+oZUDjleiCo8ANEHIHumDtDPnYDcPH0ibrH6/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKH971lfbYXae5gSJ5q0wd5VBYSdXfOnHYa7as8eLulpunvBkBJMXFg3aeS5h2B+b/Qvafy/kxjpAod2ZEGvh956VYqNcv5KB44RJbP8mGjVlGHYe7G+mUFxKYFlIEMEajl3aSyhujLRkiMuT1ymR425by/lh5IMI/em503k/nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHPDzCiB; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHPDzCiB"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so934c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790973931; cv=none;
        d=google.com; s=arc-20260327;
        b=kxQ/EsYDPbeGJQgLeoCRXiL+6Rp3BVrRYdDJaxTzIXS5GrgIQnFJNr3gRMdqV8q/er
         PyIcqOlxxIQkhTgpzQHT/tgIiB2JjaFDU47JKX/H/HkGD7WMzt+5S2mgT9Ux016OZd0b
         JImgk5X217ND6DQfk6huF5QrBPLwpxMluFQe1cZpcWf2J+4ZR2jHhzA902nFIeOkRBry
         0f8HIgN2WOmbLPWVcWe15mL4OGIds70Dhuge4XdLCfOpw6QKVKxi8s80uq8asmPi45N2
         c51CAe//eKSV/HmnAge5RvbrVp1k9+zrPf9HbAe2brZgbJuuOlyNHVE3W/VkGGqxF9KS
         zSMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zELhr+oZUDjleiCo8ANEHIHumDtDPnYDcPH0ibrH6/0=;
        fh=Z6jE3mR4k8rT2v7PU9/9v7bwX3p2dS1rmM+KIskuTyA=;
        b=NZoEGYzzDlcqdg53P8hW7VI8x7oIU2WaigX6RFkz//BsMWO/fhbB60jjx1xJdnRXj9
         HeZTjAQ9s7JHuRNv7VfDn3gY+TJWsOHGoAM52Ez3M6RYEuFxMXQlbFvEVT5Afv/80LeF
         2F7jgGKq4PfnLu6t332oixSkKrTl7Q9i29a0TgSzg5MtbHQBo2oHHA0gWrGyjR2qb1/+
         njPIa6XN/g/GHamsRqQLqM8kteaX7p4laDkHeE/JihEroEgx33cmJt3sVIYUdl8Mv3K+
         KG70GA0VLpGiN4/y4H+HmPk63ZJQ2LfBrdujtJ1R3Tyq3bB5HirnXDszrJ+qGKmZVwKH
         XACA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790973931; x=1791578731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zELhr+oZUDjleiCo8ANEHIHumDtDPnYDcPH0ibrH6/0=;
        b=ZHPDzCiBY3f/9obRoMghT8FlkrwhfaK9UHMT+XyuiDaXLD0TlFYCr2jZuiqk6mb1Lk
         huaGCJT+i6WNA0O+/zXgTpG95zbZ6tNCY/TnakYgJs+xdNh1487nWKVBfeRN27zOiPxc
         vArh7T3xZMbLaFXUUt5/1t75p+kx537M88N0ilIe3ocIcLA+CIPyf/M4TtIbgCHTfkk6
         nYGoxZlAt26RByalH+yhNtjAdEavm1aPw0k+YtmBLFSTPVs+erX/N1QfIxeUTt22Fq6c
         mPCEkCJ9biMlwz0g9H2UDsnfHG0if7//Vq8F1A2n+UcmoonN7aWOhHlKZQ+Ki+6IP7Tf
         8t/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973931; x=1791578731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zELhr+oZUDjleiCo8ANEHIHumDtDPnYDcPH0ibrH6/0=;
        b=vbvLexaiZ8e/SgiWyT2IwTsbTpntO6gQgyR02juRQbZsNagfVsOISm5R+mBvyA2eSL
         BQz/z95hVCxHFkZUrc7H+yrmS8B7RsWotyeghqaEQGZKR4Kr6jP6DlsC+zLIcENlAeKp
         rvZ0q2BmgR8na2l90oMHqHQDgABEyKBuaC8yvA+GMreHnWf2iC3sab6luPAb1Qvmn+Zg
         lT2hJd75lL2FsY+sO2XPOlcWjzC00a/wWOlQ9sy5KLmyAirs961GGKkm/1xo0j+6NVlS
         KxI8oEr6P8woDKjF01lRmQWQ5ijZp51fM5GfFY+62BmbDrrxm/JieUuPGGvnCxbml9iH
         rnMA==
X-Forwarded-Encrypted: i=1; AKwUvBzSeFbRvGNUpDTpxn51lhajAh05ajWjNmAtuia3ZiRl5OgpRBBi7Y5gpIS0paQRhQ6uWVpPQI2UXw9cZWs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIt2/A4ey7Qap3s6NotnY+/I9AF0FAXrgf7XAgopgSFRz6w9dQ4
	kDdIJd8JvZKqFgY+12EEMKWoaEkFUGHM9oovGDnhPB+x7AsqDhzJQONzo3mYMLAgboVd1T7RbZA
	r7YOTaQBkxbpT+gxTTMXK1FMCExkc5bcOoaJa
X-Gm-Gg: AYBFou01yMB64EwkKzrtmRCeY7ITXDBIWPubyK0ikpqm3SlBU+MDnUwfcbRiC3/h6Da
	bAgz9y82FdmgZisTJC42eIzoEYOSfYSRg62G5Bz9/mGHVnn1asgn5QyMFkiM2WakxkrPhmk4Y9k
	kmIDZfVnWkG0+HjpE9FSCB2tbis77SnfBluCXXlgU+1ANaRRfEWZ04rCc9lV5Oq3w+V8upoDXjM
	nzrH7/a0vEmdzFlulqA1vocx1J0h9LZQkgNCWT3qRP1cE/ZwI8pFA43Zy8apurxAc5f365QuI/H
	9ogi+IldKWAZlw7aoZMw4nRDcesm+Fr7l1DJIKgGIw35wTsSubAGmPwUrSxXFF/2T84CvMpW1Yc
	qGV8kyeQ49BIk9AxFhaNHr3eX7WwmsmPplKLYkEGmssueSOEr7j4IQDI4ujbycggcuwHeRonavi
	L+cq+XV6fbp0qC4f1xwi9KD47jsU43Blr7Cy/rB0sZNdbAc8IN9es=
X-Received: by 2002:a05:7300:4f1c:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34f1501d239mr5898632eec.1.1790973930826; Fri, 02 Oct 2026
 13:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com> <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
In-Reply-To: <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 22:45:17 +0200
X-Gm-Features: AclHuK-hB0_7YuVtXpqZQmgKgjJYoetZN0PNcDz-U1GV6LJ_paxcOVA0JW8kIpI
Message-ID: <CANiq72kHcnTxRhDWKrCZPp6Ah-8RKp494CR-6KZ_f+zFroENWw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] rust_binder: consolidate transaction failure prints
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> When a transaction fails, it currently hits multiple print statements
> meaning that a single failure can result in several lines in the kernel
> log. This is unnecessary, so consolidate them into one print used for
> all transaction failures.

Just in case: did you see what Sashiko found about `info.errno`?

Cheers,
Miguel
