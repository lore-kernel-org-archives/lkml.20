Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750790;
	b=05SggQne6+fMWcccNCAkoBd3eE2a4Zp3AA6Pd9hnnIGfDQ71YF28zSPkQaR+E1mwKXdm
	 6paPNsx6zbkLR0o+DPJVweXK6ENunf+hotz9x0szKCabBhfeLiYCNaxjXuhs57JTQWOb4
	 /xt8BuAryNh4Njl3PJPtJZNquPXrb0zx4t9iQWBVcTtZx54iZ56+yV+qnVP1KjXrnQbg+
	 KCwz8Od/+X8OqcttcoJBFqAO7W2Q9W+PESRUEBJi9jOWPbKqtPIXiG6PfgFqj/wTNx2BK
	 vC/4ru514A8N20oc/fXXvuqez8ar1YjtSD0VKJ5Y+07gFaewfdTFStU2Tly8SeD6ofQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750790;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fmKXw7Sp/MNvZTSb4xcRBsLRBVw5OzncMgLzcyPSN0Y=;
	b=OVtZTdeeII+Mk893QrmYifeUu6h+muE+jAUk/QqsVTTx3Xisjqzmq42b7Md629SMcf8O
	 2HGbyytRaCnmDpClG7Tm5l6udR99c1KJMylRnjkk3GpbCb0bEgWpV1aicOylKL0V1hMw0
	 SpjBIyjrFTthw5jS9aXkDQRYWNn+cmkYsSUCUjMVW2r8Fh8QI3D3vEteeMR0CNbTSp4uG
	 ck0rZaoa2I4isGAAB19Ti8TZX0ZC3YBKLUtCl3hDt8opgu62BGDNClzppb71gQUU1nK+v
	 SH5QrRjYS3usjYeFl2xMBhZmMUF9qH5y1c46VOPc8V4Ph1/awSMgYFWQbaZNU/4bKzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Umse5wP1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61835606A33A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Umse5wP1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F8C1F000C6
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794750790;
	bh=fmKXw7Sp/MNvZTSb4xcRBsLRBVw5OzncMgLzcyPSN0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Umse5wP1+g5ZjdU/edSukKLDYhwuE+VrhK1TQzLQD/zvn7110aHBYDqcDuvTQ1dmA
	 R6ayqisUdEbD8ztajANSM8AzqaPQ+vawzwQcwQhQU22gzy6JX5TExK8TTCk5EXMqpF
	 Zxj8/GORSs9l9AETbEDWsqd7gaqHuyBoXnuGilYMwZNltaBdCtXs+dqITvWGl1xBWd
	 efyBGNm3ms7nyA0v3yE2cK/GIUIt7fc/sRSgMIn7tFDmShJimQVc1kVMHFflhGee2R
	 J/ONdotLkCbp+hTHlSwd0iB739tyD1V9q1dW8Eogaz/A3duOIpDjLUblOfMhwME3Jp
	 u3iKdGZtJoC1Q==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50cc7540b7so63415566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:53:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHoYj9cjC6FxrzoR6fgjEw7Y2aNWs0LDWv9NhFetwyRAXsOuje72923QqWA3jUdlKsRPT6j54Spav8KJiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uc/doI5R7n4tkM8HjbwC2p5BRDlU6q3HG+fXmFH4MH61TZiRV
	LKKVoqtj8K2o0sXUHNCsogp7Bn9KEs2MgUZ/KWT0TaYcfqnxkXxRbx2ITufx5Vz7xOSaZo5Slna
	9/J6+G3AuHyQFKDwUZehY8NaKkYXaNTM=
X-Received: by 2002:a17:907:94c5:b0:c50:576f:b3a8 with SMTP id
 a640c23a62f3a-c50963d9089mr835079466b.48.1794750788588; Sun, 15 Nov 2026
 05:53:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115131047.2338285-1-icb@fastmail.org>
In-Reply-To: <20261115131047.2338285-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sun, 15 Nov 2026 22:52:55 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_c8GCg58jTKw3shF+aFmR8KaDx8Ve4wQUHMjoZ6PT4wg@mail.gmail.com>
X-Gm-Features: AclHuK98yWzx6FWaTeowYxcy45zR74kQejiLyKPT7sgUKp8qn5-gwUVdz8a4ndE
Message-ID: <CAKYAXd_c8GCg58jTKw3shF+aFmR8KaDx8Ve4wQUHMjoZ6PT4wg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: fix smb2_cancel() use-after-free during request decompression
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:10=E2=80=AFPM Ian Bridges <icb@fastmail.org> wro=
te:
>
> smb2_cancel() finds the request to cancel by reading the SMB2 header in
> the request_buf of each queued struct ksmbd_work. A queued request may
> still be in preprocessing. smb3_decrypt_req() decrypts it in place, and
> ksmbd_decompress_work_request() frees request_buf and replaces it with
> the decompressed buffer. Neither runs under conn->request_lock. A
> concurrent CANCEL can therefore compare a transform header as if it were
> an SMB2 header, or read freed memory.
>
>   BUG: KASAN: slab-use-after-free in smb2_cancel+0x73b/0x840 [ksmbd]
>   Call Trace:
>    smb2_cancel+0x73b/0x840 [ksmbd]
>    handle_ksmbd_work+0xa90/0x2110 [ksmbd]
>   Freed by task 53136:
>    ksmbd_decompress_work_request+0x10d/0x180 [ksmbd]
>
> Record the MessageId and Command of each request in its struct
> ksmbd_work, under conn->request_lock. A plain SMB2 request gets them
> when it is queued, because its request_buf does not change. An encrypted
> request gets them once it is decrypted and decompressed. smb2_cancel()
> matches on these fields and skips a request that does not have them yet.
> It no longer reads the request_buf of another request.
>
> Fixes: 6639b6928ba2 ("ksmbd: handle encrypted compressed requests")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
