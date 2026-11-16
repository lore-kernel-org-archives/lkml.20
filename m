Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828981;
	b=E2bKWPc6GRdSYF0h5ARaXR5J6YuQZt36gldoBuzbtm2XHCYf0Q/sIGeQN/smKD7NyGfu
	 7oGWV9KTjXNSJtDP5HXS4JnsW4VZ6o94wgPkJHY/CcZRKXTOoejQAe26wheWMA8rWmDeN
	 KPePehlDi217sXLXhh/JRuw5PEBCo0XWmlOX2REmy1YNGkmJNBSQPTRxJPrJANcq+tf8W
	 4KQlYxqllPyYo66wF4dJxfcQM3DftD9ZsgbuKDImsUqzJFv7bG3//Bj4wSusLYGp4sZQ+
	 QXj7xc+yGnF4erdHsqR8BdsKoaLy8v2Lp5XoTllsS4hCs06qWtDZy+3zNusyNkM4CIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828981;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ftA2JByeFr1zVyGnVBan/rtISppxPrWqNY+56v5QRJc=;
	b=2RIb/5Zq1oqVl0gsx6A+hoTpvvot0XDPrVpftRSd7qktgGI8rcN4fQFZNtc0pcjhdfbf
	 ApP+hmWbLwtC32ivKLFYdrxx+w7UxX0Wq3KNUOj1JMspBKhW6czsAZch00AuWdXQClBEr
	 O8UPTG8MVr3MLLTD4BoKtVsQgfvMVajbT7uLc898IWBqZXuxzyFeVE6e/0aYCUWTG7mtM
	 e9UD8k7J6hudBC94ubWtAJJ2G6lCc7qSSzG/8l7wxYjGuG7PWOne9IlAvEl5Sehnxi8P/
	 Kn7WGCsB3wo3YOH4b2PIyk7+QEb/EY+aXLcrBgbR9bi2RANA5u12NuM3jWuRaHscwbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9EcVBpp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130BD606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L9EcVBpp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70AF1F000C7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794828980;
	bh=ftA2JByeFr1zVyGnVBan/rtISppxPrWqNY+56v5QRJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L9EcVBppBBPQg1aXp/BJuxPl3i8yvFGvEMrlC0smxoPm3tSheKH9d3YvHrskMf6Fe
	 SEe3jf83/uskhIZCxMFx3OunHTOoU4aKF60kI6Ur3gOFLo6YCbU5u46Rg4xCpXVr19
	 C+zm55RCWv2GjnBZMNbSgCWvNSVtw+6/NFEVqxneVl+Giz7NecLBH5loGsRd13eDkV
	 jA2kfqW50p5OrqWG6gYIe25XHpa/x0V2R24F7PxbfoDP730+Ra5BLZLtbJCEYI1V+b
	 f0x7MPW/LKYo8q0gXFZaoejLguM9362BovUB0qeKh1bMNB+2Mtfy+bK5u0ikNzEChF
	 ZoKKHJRbXVouw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67db763cec7so765095d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:36:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGbB01cRyRw9neNHTaT1hKiZIHH0RY+S7TnU2rH49moLn8qNcjqXFHQlQ3/H0MqJ99lyR5A1ltfS95tfEM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lspDBjWErz4qYSVE1gvE7wWuOywtlvz4Ss2nHQmkQrv/vfXGA
	yA9C505RBImRzjBCPkooav+0dGzWRt7tAXIx6nw9E4Aw1YhAjJZ2LuvSE0qCwfLHdv9nTbF6nVF
	+xN8KfuTSYRIFB9y4H2y/BEClTqo6qGo=
X-Received: by 2002:a05:690e:1383:b0:67d:b7ed:26f8 with SMTP id
 956f58d0204a3-67db7ed32c2mr1205204d50.36.1794828980027; Mon, 16 Nov 2026
 03:36:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115155308.415734-1-koray.fra@gmail.com> <20261115155308.415734-2-koray.fra@gmail.com>
 <20261116021448.2485495-1-icb@fastmail.org>
In-Reply-To: <20261116021448.2485495-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 16 Nov 2026 20:36:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9OPEuHith1jxfLVgM5tPkBwhqoSCoAPP+8a2bRf1+H2Q@mail.gmail.com>
X-Gm-Features: AclHuK9Oe1gt6dpIFRw0z1dP8OWylUMkNp7cQRJP7XjUyQxRUzC9P_JwGdC5ByQ
Message-ID: <CAKYAXd9OPEuHith1jxfLVgM5tPkBwhqoSCoAPP+8a2bRf1+H2Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ksmbd: decode version 3 fields in ndr_decode_dos_attr()
To: Ian Bridges <icb@fastmail.org>
Cc: koray.fra@gmail.com, senozhatsky@chromium.org, tom@talpey.com, 
	chenxiaosong@chenxiaosong.com, hyc.lee@gmail.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:14=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> Hi,
>
> On Sun, Nov 15, 2026 at 04:53:08PM +0100, koraynilay wrote:
> > When decoding a version 3 user.DOSATTRIB xattr, ndr_decode_dos_attr()
> > discards ea_size, size, alloc_size, and change_time into NULL. When the
> > xattr is subsequently rewritten, ndr_encode_dos_attr() writes zeros for
> > these fields, clobbering their existing values on disk.
>
> I tested this on top of 1/2. A version 3 xattr keeps its flags and its
> size fields when ksmbd rewrites it. Without the series the rewrite
> cleared the creation time flag and zeroed the sizes. smbtorture gives
> the same results as without the series, and KASAN reports nothing.
>
> Reviewed-by: Ian Bridges <icb@fastmail.org>
> Tested-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
