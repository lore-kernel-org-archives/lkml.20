Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698217;
	b=yisv0aI1IecAadtG2ZYu4q+tqD2Y/1Xt3hAjZNlN3E1ne007y4celBKv6O0SdOL2kheW
	 WUHnbP+d1xU8TjOKDTe+Og/dnNdIQGmi/+we1Pn3LgqWqIzBNa+RbcQF+FXWRszURv55+
	 9Rcm/gW7vNz/9aB3GRlMxtG83v3o2OxtZvNq6NPMNEQ/ifydWYXoZGawVPI7WfLj4ZWEr
	 sYYnB81I+D8YNgNb5Ak8GRHv+ze7bPaUPcEZAdA/Q2HOmd37q9GvOfwMYaVbkinz1X4tw
	 V3NbGmzI+8W8F9JM67XHwayVEU3j2XkeWG/kuiO0ZYa4F2igSzc1YPTJHAa1N/NM2PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698217;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O+D9wSq308n2FS0S7iJCZiW2QM9DTaXSzWFy3LTJf8k=;
	b=fMmKIfgO9uTOD6c/A4HNPlkH28Zpsv+b4jcuQ28qp31cjmYscMHCsc0X72SY6dMM5LRt
	 Zcb+hu/TxUC6BIGPbj+FITNAV3TJQpW7X/lP8tKgk48O0nLNnY+mQEiGSGNfxqPJynHB+
	 SJ6L7DA62BX4eOdSkZgukP+zUtYw8+W0u3i2Gvl2HRKp8V0zHt0U8gAxM9wRXfMCqXIgH
	 pWSZJVFTtk/XQlhl8MZgs9ktQfjI+G4eIkXCq6qg7EVr5TY6xRM5tKHQF4M8oikesV9Qy
	 866P0Xxb6KzG5wXyP0u/5qIEn7A7nX7msMz9NVMSFx8Ceo+ZPQoD7o1tJK1HFqmtKPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCOLMC5V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF506606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCOLMC5V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852BA1F00A1A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698216;
	bh=O+D9wSq308n2FS0S7iJCZiW2QM9DTaXSzWFy3LTJf8k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OCOLMC5Ve2epvLxOzbFZRZArgmqBMSxKdQFl9LqIs+xrTVVWKRr2CgOnXAbRSNzxf
	 vghGoQ2RMU79tOV8kI9JLga7yIiYQQndrGSoZFBSKKzuzZhCgCo93JqiHLy71dLxuI
	 32bKvl4Iiefm9yK7e6oruL6lQyx9PQETUHAqUTFjPQ2AUmCHt0+qRBspyeOn55wsyw
	 WnRk0biJ0d6/QaEohdB5FIkUPc4jVt2ilFx9bFDxtgFX4qClOWieE+E8E7VEbRruzi
	 aVn0seYkEiFXaW/iT6zSB7iNh5WUAiPXh5FCo0Ccy00YWQzVGwEhkRlq1tC2hqO9mg
	 K0GFBj2AW93JA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c3fd91337baso668722466b.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:30:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByFqOqRPDtz37d0U1nR4dIy7PH9Wj34FwLjsE03n1mwU48dH5AJGhcvmRnbwzs/PV6S+kGz8vwoPqh7/Bs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAcVQmYODQSj5Z7xJIzpge0EE0K1m9G7NTetK9qtIxDL1EbsrO
	qVXQIlJMm7GqqAAAXovF4w0FTNa16Vu82mJlGlNS1C1kwPMhvcsj5BZhBRxmW4XUKMQVsNPnOvM
	bbcj6HG1Y5CyawMushexRtqwEtZP+93U=
X-Received: by 2002:a17:907:969e:b0:c41:8e21:4d5a with SMTP id
 a640c23a62f3a-c4ca793c08emr997030966b.5.1793698215014; Tue, 03 Nov 2026
 01:30:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179367391951.8187.2063761250230294066@stu.pku.edu.cn>
In-Reply-To: <179367391951.8187.2063761250230294066@stu.pku.edu.cn>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 3 Nov 2026 18:30:02 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-Y+oNxpN+-KqhhgM3xW7jCoG-kCxpuHCuOev26_vCeXg@mail.gmail.com>
X-Gm-Features: AclHuK8_HWjHOWSuf3qmE7IqJsMyYCJVY7j14jnzmNKlDbk8nPC2JkHwb7JZ4W8
Message-ID: <CAKYAXd-Y+oNxpN+-KqhhgM3xW7jCoG-kCxpuHCuOev26_vCeXg@mail.gmail.com>
Subject: Re: [PATCH v2] ksmbd: require NUL-terminated EA names
To: Yifan Zhang <yfzhang23@stu.pku.edu.cn>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, linux-cifs@vger.kernel.org, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	Steve French <stfrench@microsoft.com>, Ronnie Sahlberg <lsahlber@redhat.com>, 
	Hyunchul Lee <hyc.lee@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:45=E2=80=AFAM Yifan Zhang <yfzhang23@stu.pku.edu.=
cn> wrote:
>
> smb2_set_ea() verifies that the byte reserved for the declared EA-name
> terminator lies inside the request, but it does not verify that the byte =
is
> zero. With SMB debug logging enabled, the name is passed to %s and the
> diagnostic reads beyond the request allocation.
>
> KASAN reports:
>
>   BUG: KASAN: slab-out-of-bounds in string
>   Read of size 1
>   string
>   vsnprintf
>   _printk
>   smb2_set_ea
>   smb2_set_info
>
> Reject an EA entry whose declared terminator byte is nonzero. Return
> -EBADMSG for the malformed buffer, and map that error to
> STATUS_EA_LIST_INCONSISTENT for both SET_INFO and CREATE.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Signed-off-by: Yifan Zhang <yfzhang23@stu.pku.edu.cn>
Applied it to #ksmbd-for-next.
Thanks!
