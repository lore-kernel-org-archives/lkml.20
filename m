Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094034;
	b=Hl4PHjZY04f+VaauH9XQA5i68skvsMvp6hnGVjlSCTd4B92w7HX0QVb01B1ofRVhg+O3
	 2KhBP8GDDAcTHIy45omn56sCHcq0iRxGLtiSnbVFKm1al+yFR1Wu0tkWlkeax1xe27RGh
	 bdWK8M4B3nmXWVb3/8uluteH2EOoyAMxMMLM1Ujj+0ODPJ8Q+5uGbNbfJ3Z8DoXQT46YN
	 w5w6fXYW3Tu4y7ysjH4LDgRBMHZdN4X7+7AvLugwJgzSfu5Mqj1SaTOjCvzcyV8QN+o/y
	 UGr0V4TIk4gv5Us9n9v+eoiXT8hf6JnsX4A6ejdnv9Lv4ZmdV7Ha3NGoUHz1wJMpuzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094034;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AwwVpBlwk0B2WYWEPl63hg7D2sr2Ed2jay0+sOVyrzk=;
	b=Knzd/tVFzJhkMzotroDoLZs8WGwFLM0AqOfYabHrGp2MNvy694iOWC2yheK13anbIPdQ
	 gJn7+vRPeP+Sj3GeBaiF/V55FTGmSrxeAvBvMUS39bGjovSKa0+Ij4QEmoM+/amFSS+hh
	 qx8N03agvAw5mLa0lb6L/10AI5duilPMTf70j+U/fvxQE3pq1b7TyKKt5o9OC4rx1bDoO
	 rGI/F3cxi63JE3np20MriV8UCsn0N2xVbDAR6AMA9b1OqBWvMGxW4XSEInBpT30HU4e3N
	 bFJ//BaMapBDvIj0lpJo7Hs4/WaQQ2wopVoayDrb/2CIxTTZaTGMKahTM38qJWQOg5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnLZ+HlZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF479606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MnLZ+HlZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5855B1F031E3
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793094033;
	bh=AwwVpBlwk0B2WYWEPl63hg7D2sr2Ed2jay0+sOVyrzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MnLZ+HlZdnrijH2GipqXtsRnIzcngIkxSw4oy61b7aHMxac5lu5aj/b0J5I84bvmq
	 2f/7zz4PBMk0zIfkkqwwCWj+djwb/BGrDIuE6HJi4VcpdIktd3bOCL+E0t+jHP1uqH
	 se4jbcLHYaq674xBrttR2h9HGEigqfdzdQjgT2hgPOTneNL/lNOr6fszi0o+mb8gAW
	 fjjgmZfvAse4DNgbI7/izK9iWhlHYG/GXTxXlRiRTW+AVcBZh1kqvOquDyu82eP5gd
	 024vKT4KAuHMDhPNE9hjNcyHLwN0akk3xNtrAefDoQlmlfckQKJvojiB/DNs2lAkZ+
	 nrRtFHcarSVOQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0f59a5fdaso33708907b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:40:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByUbk2Vd3QBW4wcBflq+yoIbRJSvlgWtXalXbg4XBB+/XRfWu2KR4Y9Kc2Yf3oeKeahivn7cPnin0XPz6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBbylfCoS5QN8Yajo8SrB+td7RpWxf821uCgP3VtWLb7AYh81B
	r3m5TNM3IYQGk5VPV2ptYSvh8XSjegUKbU2GSloYIwc2dl/VZbuHDhGQcuzJu+LT3Mkc4aCRRYK
	M2ceg+BdNFjzyDZkWDhilK0UmJUOANoQ=
X-Received: by 2002:a53:e789:0:b0:679:9063:c4d4 with SMTP id
 956f58d0204a3-67a4547cb1cmr5401448d50.87.1793094032662; Tue, 27 Oct 2026
 02:40:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027012947.107852-1-icb@fastmail.org>
In-Reply-To: <20261027012947.107852-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 18:40:19 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8SKUW8R+j=QX8NT39N-N579EAH2jUKbvyv+JAqZ6Ngww@mail.gmail.com>
X-Gm-Features: AclHuK_0fClf3kAebxF3_Z6HJ6ZLrsCwNxZLbu-reUZMs_XB-g75Kyb4lAkVgaM
Message-ID: <CAKYAXd8SKUW8R+j=QX8NT39N-N579EAH2jUKbvyv+JAqZ6Ngww@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: fix SMB2 CREATE response buffer overflow in
 compound requests
To: Ian Bridges <icb@fastmail.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, Gael Blivet <gael.blivet@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 10:30=E2=80=AFAM Ian Bridges <icb@fastmail.org> wro=
te:
>
> A CREATE response that carries an AAPL create context can reach
> create_rsp_size (572 bytes for SMB 3.1.1). Commit 713c31a3a225
> ("ksmbd: fix SMB2 CREATE response buffer overflow") makes
> smb2_allocate_rsp_buf() reserve that much, but only for the first
> command of a compound. A CREATE later in the compound is guarded by
> is_chained_smb2_message() instead, which reserves only
> MAX_CIFS_SMALL_BUFFER_SIZE (448 bytes) for the next response. smb2_open()
> then appends the create contexts without checking the space left.
>
> That check also uses the unpadded length of the response so far.
> init_chained_smb2_rsp() pads the previous response to 8 bytes before the
> next command runs, so the next response can start up to 7 bytes later
> than the check assumes.
>
> When a CREATE follows a command that fills the response buffer, such as
> QUERY_DIRECTORY, it writes its create contexts past the end of the
> buffer. The AAPL context is written last.
>
>   BUG: KASAN: slab-out-of-bounds in create_aapl_rsp_buf+0x31/0x6e0 [ksmbd=
]
>   Call Trace:
>    create_aapl_rsp_buf+0x31/0x6e0 [ksmbd]
>    smb2_open+0x4fa8/0xd900 [ksmbd]
>    handle_ksmbd_work+0x88c/0x1cb0 [ksmbd]
>
> When the next command is a CREATE, reserve create_rsp_size, as
> smb2_allocate_rsp_buf() does for a single CREATE, and check the reserve
> against the 8-byte aligned offset where the next response starts.
>
> Fixes: 8f1b796ff113 ("ksmbd: add AAPL kAAPL_SERVER_QUERY create context s=
upport")
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
