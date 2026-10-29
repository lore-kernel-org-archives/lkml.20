Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261218;
	b=QAOH46FEperslNp5SjFC8i+0D7IF/441HB9CcyUQ2uo3xU3g7CotEQFOnlonWMPTXMyv
	 Fb5GIgJavhHDDBYxE+A01KpxnuIAEjFIptkDMHevRE+5MXlSx4+GrbagNQYxjQoppFCh2
	 UG6wYgf610WBTv0tF4+eeN4c8UDWYIGROieqSz5pIl4Jid7Z8a/zLkOlixVul2soQ2lNa
	 4D0FmaZEhnAcOsJgrB7QNdyQvUQGEjX82bSDAr0Clu9bbuP/sVvp2ZRWCtEru1IrjV8hL
	 UESsOYDpzNR+JCUHHoMvPaI0dyh0MNUtGdeEyDW816wXXuLyYXp8VMWhLEmldymefyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261218;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DQA0c4GgJttnHROpDsPWPzxDnzeW3nyxJjlegQaZKTI=;
	b=ZoYS00uL+U+x0J4CZYXfpKDfUDS5dE94BQdDbySTXutHcGw5PLXyvSy8UQ3dSPDwZUtT
	 uefPecYqb2Uwwd8bHQmvwuC9vUc9nZkGMVlVYIv/1UuIlV55t8xP9ZUTAN5AhEpzQ14Tv
	 3Mv0kGuZdsEvs9I2KS187CC1+ZX8yjx22a+SbdNXMkSDk/dg22LyNcoOZHn2Nmma0xH40
	 y2LNsEvgCQ9kKq1g58KRXWuP3WRfxpjadOL5+EpO3N8Ze1tmfMheh/iDPwiK5EB05Dy2V
	 6xHdB7wGl7ctIVJcTRryJDWOEnIozRBvfvdwrMvNhfNlOVknRvKXfwc43WM45n9gWGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hdr9NJoS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E79B606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hdr9NJoS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F160A1F031E2
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793261218;
	bh=DQA0c4GgJttnHROpDsPWPzxDnzeW3nyxJjlegQaZKTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Hdr9NJoSv2t9ZG4XHK/Fxxr5tMaogQlBni2Rc7+NmY23Xuqwjw4qDP/eRXoAqVK3W
	 1O4IKKhsNx5I9ouU59W73R+vrhtRAOe+cVDq88nBTT7hgMZDHvU45KzqH9SMCn8mDk
	 VxlvrJeh8y+vtHH5A3aUCyMzEDihI0dbfzzFPJ1PkaYhMCkLmAmJy7rl4EuZ211tSL
	 eLg0eJbLJvw+JmRvJ35gEI4g2gdobRXFPBcd/qyBKC3jxTL5XnVI9uHeRKLhwhkBlr
	 Uj4nrhD8SZ0DsAztJYC6dqZtEPiGWST7NmzS/jA0HNVVbsQfpGGtHELXWL6o3YG0v1
	 lBhnIX+AZ4xVw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c169ae1cb26so68865566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:06:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/TVEKv9ke6FsXkQE1FRzYggl2gPfVMnx1dab8BgounoDp7JEJ6vS6X3Plk1JwR3E7bbFPohDfHmCqNNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWQxYCGZAOjyh1OjZ2+Z/URzyV4iIEpxDRd0E8Bd8U0C412lCh
	AqncRSedi6qmgEibBUhsv/WIoOw7lqKOpkkqKm9R6fczjz7eZa09SKCkbqgINPrXDnxJLmcVC+d
	oIGFG4QGf1gfRg3YTxVdJiRlqWZTz7ZQ=
X-Received: by 2002:a17:906:ef0b:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c49d122c185mr148746666b.18.1793261216577; Thu, 29 Oct 2026
 01:06:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028152413.183380-1-icb@fastmail.org>
In-Reply-To: <20261028152413.183380-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 29 Oct 2026 17:06:44 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8Tnd-ZRn8rGQDW31X6Pb3E_zq-jk6YgBxW2NaT+z_qJA@mail.gmail.com>
X-Gm-Features: AclHuK_c4LwhWe3o8v5GJHI7id17o2L5wn3mprz_dMLI_MMQNi1Z_QYTtcbBjwY
Message-ID: <CAKYAXd8Tnd-ZRn8rGQDW31X6Pb3E_zq-jk6YgBxW2NaT+z_qJA@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: require DELETE access for delete-on-close opens
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, Hyunchul Lee <hyc.lee@gmail.com>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:24=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> smb2_open() accepts FILE_DELETE_ON_CLOSE on an existing file without
> DELETE in DesiredAccess. When the request asks only for
> FILE_READ_ATTRIBUTES or READ_CONTROL, it also skips inode_permission()
> and the parent directory MAY_WRITE | MAY_EXEC check that delete-on-close
> is meant to get. The file is then marked for deletion by a caller who
> could not delete it.
>
> The unlink happens later, in __ksmbd_inode_close(), when the last handle
> on the inode is closed, and it runs with the credentials of that handle.
> If the caller closes last, the unlink fails. If another user who can
> write the parent directory, such as the file's owner, still has the file
> open, the file is deleted when that user closes it. Until then new opens
> of the file fail with STATUS_DELETE_PENDING. So a user with only search
> permission on a directory can delete a file in it, or block opens of it,
> while the owner has it open.
>
> A MAXIMUM_ALLOWED open that also requests DELETE has the same problem.
> The requested access is replaced with the maximal access, which does not
> include DELETE when the caller cannot write the parent directory, and the
> later permission checks are skipped as already done.
>
> MS-FSA 2.1.5.1 requires an open with FILE_DELETE_ON_CLOSE and without
> DELETE in DesiredAccess to fail with STATUS_INVALID_PARAMETER, and Samba
> does the same. Add that check to the CreateOptions validation, using
> the generic-mapped DesiredAccess so that GENERIC_ALL still qualifies.
> This also refuses MAXIMUM_ALLOWED with FILE_DELETE_ON_CLOSE but no
> explicit DELETE, as MS-FSA and Samba do. When MAXIMUM_ALLOWED is
> requested with DELETE but the maximal access does not include DELETE,
> fail with STATUS_ACCESS_DENIED. With DELETE requested, delete-on-close
> opens go through the existing parent directory check.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
