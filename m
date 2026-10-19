Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453646;
	b=bf//2BfEgcLeMhWFQxNtu5269+eH/nBXHyai+ofc1/y1FlHj9jJMFFNl4u6aSWuyKBt/
	 QSmFkWa9B/CS+++Ea2hU2kg0B2C3hVxiyl2A/RoD6MAX7LYhnlO9rk1eqA7aQg55saUVh
	 PgUy7j42sisWRPgDQQ0M/q4tG53A/oT/t5nGd5Iq+PomCHH/NrCAKO1DVt7SGFfLYmxs1
	 Eunq9Pm7WJdDhp8BA/8asfA3MUFqeOgPj7z3tfAEnJSgVLKgKAGtxnMNx/55EfkGC1LaC
	 36nte+6xuVvsF+60+VzO7UEYhLY0VdBxt45h7WWqk2bGCQlCfQ6CT3Lu6y4IbqhsAtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453646;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ayk/TP6+FwpClVfOv7ABNagIX/45Pt9+vmGRM76bB+k=;
	b=MeojqG+vzz/fVzhaS0vAB5j2LUAhlVQQ4J41U/CP3ubeD6UZNgFofsmWmd1NrmkHvhaF
	 94iLp3cjmoKPGGUt4mGkTqPY35io1NpI1F8MSlxUBUxaWAUPRRfjy7MuGfEofRMNvDLVT
	 FcLCEDlkaLb1MIHAFtagj6h4qP5bJYuQos6Qu+UcWpwebuphbVMNvCiGH7Dtuk4YiG1XN
	 VinzsfYRHgKquedRDjj+8Ge7r4umhjMd7qjygRKLdkWiK8KpcUm6++MSJPr8rNj18bm6v
	 A8J+T1s2DQCLapvKTrsmeFpLNLEMAYaGP15+RBILyqnw3B1h3OIHkxOrTRBRCV588DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTNYa8Ti;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C63606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lTNYa8Ti
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648BC1F000CA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792453645;
	bh=ayk/TP6+FwpClVfOv7ABNagIX/45Pt9+vmGRM76bB+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lTNYa8TiqWqS7cc71qp6XI2toE+xwh6XRtmeGc/XOFByhJel0Ngi3EanqKHN1bjSR
	 bBQP6qjbm06DU4CHWw4sBhXGvypa+zYhOTCdkiFLVK7pIvRjS4EKeuIT0MEQOplxiP
	 78Z/nEGvXZ9dbjNXuexaiQyUcIxXCW/wsvSU9slB+DVylYnzROOBs/6vhIXwWtUDvK
	 apCEqd55xnifpPUu3WxtFKxulZfrCtQyT9rx54o0uAURGCiHU9yHyTPbr0j8sNlPKw
	 RwqE04AAc+1omlLeEstTXbtv3sSmPgvaXI9nUd9L87rbdwfQq08QzptxhFDD0SfzCl
	 xQMta6EoXNnAQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c2e8c710847so332860966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:47:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxDYQRbqeX2DIYJ2FSel4zzeqXYMCDzt0b3jXRRs368OknnZYrGBIVffOL1iSAX1egcSZamafnRC+88BSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdiW9p3AWgQWf3MVK7cZnLue1zLHHKie7i3IPMkjSd2FCsZxiA
	87IHOgq03uSMdQfH45qRUE2HQsqZMxL/U+RoARV+TyZ1WH/zFwhoEeuy9a0GlbNOzn31zDooPmG
	vacn4qwh+Vt7KEhkHIdiSXzCi7qDoxy8=
X-Received: by 2002:a17:907:d006:b0:c31:8c7c:391b with SMTP id
 a640c23a62f3a-c419df3e670mr622856266b.13.1792453643953; Mon, 19 Oct 2026
 16:47:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKYAXd-Z_H2O3W=_KrUifR44yisJJhR=-bQQp1mML7vHgfcdDw@mail.gmail.com>
 <20261019191116.31291-1-mike.michalo@gmail.com>
In-Reply-To: <20261019191116.31291-1-mike.michalo@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 20 Oct 2026 08:47:11 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_JBrVjn9QK3cGN77biwivVKjdTyFvok5stALZ+rgXKbw@mail.gmail.com>
X-Gm-Features: AclHuK_j-ePbUAjPU9uHRRuq9fCSZmxHntO8HQwepZSmLVvhwnN11OB-xY_hF5M
Message-ID: <CAKYAXd_JBrVjn9QK3cGN77biwivVKjdTyFvok5stALZ+rgXKbw@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: accept share config responses from ksmbd-tools
 before 3.5.3
To: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Cc: farhad.alemi@berkeley.edu, smfrench@gmail.com, senozhatsky@chromium.org, 
	tom@talpey.com, chenxiaosong@chenxiaosong.com, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:11=E2=80=AFAM Michail Andreas Michalopoulos
<mike.michalo@gmail.com> wrote:
>
> ksmbd-tools releases before 3.5.2 do not have the payload_sz field in
> struct ksmbd_share_config_response; the field occupies the last word of
> their reserved[] area, so the kernel always sees payload_sz =3D=3D 0 from
> them.  ipc_validate_msg() and share_config_request() used to treat
> payload_sz =3D=3D 0 as "legacy userspace" and skip the payload size check=
s.
>
> That case was removed by
> commit f25e93768fcc ("ksmbd: prevent out-of-bounds reads in share config =
responses").
> With payload_sz =3D=3D 0:
>
>  - the IPC$ (pipe) response fails the final message size comparison:
>    these tools always send a one-byte payload, so msg_sz is
>    sizeof(*resp) + 1, but the expected size is now computed as
>    sizeof(*resp) + 0;
>  - every other share fails "payload_sz <=3D veto_list_sz".
>
> In addition, ksmbd-tools before 3.5.3 copy a global "veto files" setting
> into the IPC$ response, so with such a configuration IPC$ also fails the
> now unconditional "veto_list_sz > payload_sz" check, even though pipe
> shares never use a veto list.
>
> ksmbd_ipc_share_config_request() then returns NULL and every tree
> connect fails with STATUS_BAD_NETWORK_NAME, so ksmbd cannot serve any
> share when used with these ksmbd-tools releases, for example the 3.5.1
> package shipped by Ubuntu 24.04.  Login still works, which makes the
> failure look like a configuration problem:
>
>   CIFS: VFS: BAD_NETWORK_NAME: \\127.0.0.1\IPC$
>   CIFS: VFS: \\127.0.0.1 failed to connect to IPC (rc=3D-2)
>
> When payload_sz is zero, derive it from the size of the message actually
> received and store it back in the response, so that the checks in
> ipc_validate_msg() and the path and veto list parsing in
> share_config_request() all use the same bound.  The response is the
> kernel's own copy made by handle_response(), and msg_sz has already been
> checked to be at least sizeof(*resp), so this cannot underflow.  All
> checks added by that commit then apply unchanged, bounded by the bytes
> that really arrived, and newer ksmbd-tools that fill in payload_sz are
> unaffected.  Also skip the veto list size check for pipe shares:
> share_config_request() reads neither the path nor the veto list for
> them.
>
> Tested in QEMU with ksmbd-tools 3.5.1 and 3.5.7 and the in-kernel SMB
> client over loopback, with and without a global "veto files" setting.
>
> Fixes: f25e93768fcc ("ksmbd: prevent out-of-bounds reads in share config =
responses")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
Applied it to #ksmbd-for-next.
Thanks!
