Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793063958;
	b=1tw5LRkN2LT0Wl2n/ivIjhFoJONZTkzB+ZC6P6zoeyR4mbLhkZGvWpB7mORRzTobUUQ3
	 6LgQhqvT8iMKEQGfvQ+dCxlANbOVvjNaDKFLaBP1Fm8Tykz8RS+CNLN2cHumv6IHo9/lo
	 gkF2MLsd7k46AkLVTD6UMOFJymEVOND/W1VL7Bw5Zeyy1e6KbfU+WWMYCmyHczV8UypQn
	 2zkH7NPFD9RjTUH9YQg3G/pvIgGRKCtswBqrDfXgdzP3UrX1e+YIIXzL3EBEOsUgta0D2
	 xP3C+u6hUhG+aKN48FNcWjrLVwj8y99h0a6vLIXetaCrsJGmmuMb+D0+h9NP6zVULhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793063958;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=V6ucdF8CVrL1H+b/a6ewy2PMRiq8ZA0KkSsjiF9N63U=;
	b=TOWaTdCpGx8KzbwMX24owMDyxKcRp5/uBRLO2oIc/YR+HKfVeCaNCfgVKUzLBFycJoGf
	 Zea9Ru4itKd7Jhju85XC/+t+GaPp7OsjXExwqQk2bFqcfYPsOBWlV0GELujMXyA6Y9iW3
	 O9UKO7vXNCo7K8Lq4HyyEs+0rqe2TQKrLicKZjdnkCmlVSSa4lt9od/6Bks6zbJI/3cz6
	 +bi24+i2ZSCZhZc6nYCQo4sX44j8iL31FN6HZuGTNlJ45y8MZlvv51nxiDo01o8ZfWRwh
	 XS+MROnDQa8gQ8Di+kXrs7Xjp7msM3sNAlBNOpf66kbSZYSAQAAHMp7XLqtcKW2hoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khbSiHL2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C63606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=khbSiHL2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CAD01F01829
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793063957;
	bh=V6ucdF8CVrL1H+b/a6ewy2PMRiq8ZA0KkSsjiF9N63U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=khbSiHL2itRIN80YPJKpp+/eCfuMc/mokXqb3jMicljhAZljQklxBUcxNipY8q4PG
	 6MAwtjZ4c6mNU0LHZNlb+e2dKvNLbZGimw63AmaCyZ1mbtZJBrwKPU/7uefuKI4qRH
	 nbKE3dGBPIty9DQoSP5VjTgFvRMls8yg65BC3Va6lXIkfYWHVHstwPeSlPLuQwllQG
	 zn5VMah3o0jFKkxUA9sABcrPHXW7cpV7x5Mb0X/4J0rolUiX9Yh1NwfTrbfTGxR/UH
	 Tbr7ijhGWlj3wNq3FHtknO3BBnv6ejhfcwpV0dUG13CY2rXIpeMG/GOvUgltH6tleM
	 V7MPN1QMvE6Hw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c40f29667e6so579694566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdjZaFncBhAVk+fQQ27O0eeR5oO9k89HgqsMecy6q4XqSpEPd0gulH2x1fxsIw8YYt/1r1IVQkLsobpJ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQbxbKhvBDaFjbRkK49b1PIZ54Xir1OGUsodo7oc5TnOoUjOg6
	05CM5h8wa2u46ExaREMmxtfSQbOGF1lWRzwDD16ZDWpRWwUi7l8vMm0oKd0YKeXhKplAngSth+C
	GdBHDKJyQL7JbxLeKMhLxDMHmcur51FY=
X-Received: by 2002:a17:906:d553:b0:c31:c767:ae0b with SMTP id
 a640c23a62f3a-c46bd906647mr905168766b.0.1793063956037; Mon, 26 Oct 2026
 18:19:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <SEYPR02MB69642EAEE79F3CF02F782597E6612@SEYPR02MB6964.apcprd02.prod.outlook.com>
 <SEYPR02MB69641633E70AC3FBF14BB14FE6612@SEYPR02MB6964.apcprd02.prod.outlook.com>
 <CAKYAXd9vAUH6J_Mbx3ZTzGT9U+unoOsdDL4j_Q8UsDypW3a82g@mail.gmail.com> <af546d6b-d1c0-45df-8f81-ad839e7e4d6d@gmail.com>
In-Reply-To: <af546d6b-d1c0-45df-8f81-ad839e7e4d6d@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 10:19:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-OpiRi2uQzK81rJpHis0VkS-gTaZpQWJ4TZH_RJFzL6g@mail.gmail.com>
X-Gm-Features: AclHuK9JxMtnlt53AqO7LF3FG6G1nnO1heXsQG0vFMGDEfz2ZPeUYa9Joj1Z150
Message-ID: <CAKYAXd-OpiRi2uQzK81rJpHis0VkS-gTaZpQWJ4TZH_RJFzL6g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ksmbd: fix named-pipe reply loss with small output buffers
To: Wang Zhaolong <wangzhaolong633@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 12:20=E2=80=AFAM Wang Zhaolong
<wangzhaolong633@gmail.com> wrote:
>
> Hi Namjae,
Hi Wang,
>
> >
> > if (rpc->pending)
> >     rsp->hdr.Status =3D STATUS_BUFFER_OVERFLOW;
> > Should we add this check ?
> >
> >> +       goto done;
> >>
> >> +empty:
> >> +       err =3D ksmbd_iov_pin_rsp(work, rsp,
> >> +                               offsetof(struct smb2_read_rsp, Buffer)=
);
> >> +       if (err)
> >> +               goto out_put;
> >> +done:
> >>         rsp->StructureSize =3D cpu_to_le16(17);
> >>         rsp->DataOffset =3D 80;
> >>         rsp->Reserved =3D 0;
> >> @@ -9349,7 +9375,6 @@ static noinline int smb2_read_pipe(struct ksmbd_=
work *work)
> >>         rsp->hdr.Status =3D smb2_pipe_error_status(err,
> >>                                                 STATUS_UNEXPECTED_IO_E=
RROR);
> >>         smb2_set_err_rsp(work);
> >> -       kvfree(rpc_resp);
> >>         return err;
> >>  }
> >>
> >> @@ -9947,7 +9972,7 @@ static noinline int smb2_write_pipe(struct ksmbd=
_work *work)
> >>         if (IS_ERR(rpc)) {
> >>                 err =3D PTR_ERR(rpc);
> >>                 rsp->hdr.Status =3D smb2_pipe_error_status(err,
> >> -                                                       STATUS_INVALID=
_HANDLE);
> >> +                                                        STATUS_INVALI=
D_HANDLE);
> >>                 smb2_set_err_rsp(work);
> >>                 return err;
> >>         }
> >> @@ -11440,20 +11465,25 @@ static int fsctl_pipe_transceive(struct ksmb=
d_work *work, u64 id,
> >>         struct ksmbd_rpc_command *rpc_resp;
> >>         struct ksmbd_session_rpc *rpc;
> >>         char *data_buf =3D (char *)req + le32_to_cpu(req->InputOffset)=
;
> >> -       unsigned int nbytes;
> >> -       int err;
> >> +       unsigned int nbytes =3D 0;
> >> +       int ret;
> >>
> >>         rpc =3D ksmbd_session_rpc_get(work, id);
> >>         if (IS_ERR(rpc)) {
> >> -               err =3D PTR_ERR(rpc);
> >> -               rsp->hdr.Status =3D smb2_pipe_error_status(err,
> >> -                                                       STATUS_INVALID=
_PARAMETER);
> >> +               ret =3D PTR_ERR(rpc);
> >> +               rsp->hdr.Status =3D smb2_pipe_error_status(ret,
> >> +                                                STATUS_INVALID_PARAME=
TER);
> >>                 smb2_set_err_rsp(work);
> >>                 return 0;
> >>         }
> >>
> >> -       rpc_resp =3D ksmbd_rpc_ioctl(work->sess, rpc, data_buf,
> >> -                                  le32_to_cpu(req->InputCount));
> >> +       /* Write new input without reading past an already buffered re=
ply. */
> >> +       if (rpc->pending)
> >> +               rpc_resp =3D ksmbd_rpc_write(work->sess, rpc, data_buf=
,
> >> +                                          le32_to_cpu(req->InputCount=
));
> >> +       else
> >> +               rpc_resp =3D ksmbd_rpc_ioctl(work->sess, rpc, data_buf=
,
> >> +                                          le32_to_cpu(req->InputCount=
));
> > This WRITE leaves KSMBD_DCERPC_RETURN_READY set in mountd. After the
> > cached reply is drained, the next TRANSCEIVE can return the previous
> > reply without processing its own input.
> >
> > Thanks.
>
>
> Thanks for catching this.
>
> I reproduced the sequence you described and confirmed the problem.
>
> For the READ path, your suggested STATUS_BUFFER_OVERFLOW check looks
> appropriate when a positive-length read leaves unread bytes from
> the same reply.
>
> For TRANSCEIVE, I think the correct fix needs some discussion.
> One possibility is to return STATUS_PIPE_BUSY when cached reply
> data remains, without issuing another IPC request or consuming the
> cached data. The client would need to drain that reply through READ
> before submitting another transaction. MS-FSCC =C2=A72.3.48[1] lists
> PIPE_BUSY for a pipe containing unread data.
>
> However, I would like to confirm that this is the intended behavior
> for this SMB2 path before preparing v4. Simply omitting the WRITE
> and returning cached data would still silently discard the input.
>
> Would rejecting the transaction with STATUS_PIPE_BUSY be appropriate
> here, or would you prefer a different approach?
I think the former is correct.

Thanks.
>
> [1] https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fscc=
/f48cecf1-98d8-48dc-926f-2f3a48f07cf6
>
> Thanks,
> Wang Zhaolong
>
