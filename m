Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9544C35838A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345156; cv=pass; b=DwiO7I/E6m2T6ifAuMMTjnEl+kap2YpCdsE5HCEy/n6bsED+QbvgM9bOn+YGox4uc2s2ebKZfuz+0ityBAZnVNv0gAZvEuXwdUtXPEeMz5FeBHpn3LCc32eAbWPOMqzb01t3/if5KA/k31qvgOnlNZwASZ9ulYFlNxKOzVFMJgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345156; c=relaxed/simple;
	bh=eix+jDc1eLMOO495uTBf7ZGaaENlrIzMHe/FDtyYGyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQvWqAzU1e8w3vi3riciume1GTY6swk3mI3vuoo2b+NUvJU8lCUYKRiCzFClXJ/lYE2YT4cNvhg/u7S6IeY1CQqxjqQzj7QLC/BAHlSXjke6O44z2ILlO8cxdIt7Dq0fel5k6gJiWfQKknsDLrL7qFXe5wp83owTsdAHrXGikGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D/JTcWEx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cNOj3cFW; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D/JTcWEx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cNOj3cFW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790345153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kUPsp0+j6N99PN5TDquxRGX7XdHybJ0Jd9WQ5AMfVHg=;
	b=D/JTcWEx/3ISK1d6dO1HGtTJsifD4m2lbN+YkNJocP0B6pT7O6ZjjvWlw2RhWfCMFXrOVc
	vGX+wvwb+r1k42DMPSjwhtayOqFQmr6H+IkHWCzr7YvLcMk/jPHqyptG+zuf3f1Y0DW9TX
	rlfikwj0t7PFQ4oMJDOt6IOuX8WYJK8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-wVtYTk1zOBCjF6n-DsTYdg-1; Fri, 25 Sep 2026 10:05:52 -0400
X-MC-Unique: wVtYTk1zOBCjF6n-DsTYdg-1
X-Mimecast-MFC-AGG-ID: wVtYTk1zOBCjF6n-DsTYdg_1790345151
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843227cfcfso1430658f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790345151; cv=none;
        d=google.com; s=arc-20260327;
        b=qw/t6xPiIYQb1GV/lpxrbIiW/M/oxyhhbusLwvmqQQr5cTrdloPlAbR2/oJ99BVGOG
         hvorEsLzgqiyE0ihTDStsT60i8OMB0wF4xU7zibM218M5QHB5Gla9hHkKCf4evfKjba6
         7tN5VlA5pM8Gn2mF+8+yTnXMCbdctRdUioG2jJB9QjxIgChF2YYFiFp03dscZjIlFvLT
         UcCY8C8ecPT/fhF70JfXE0+MAnKEJWA+47bTpzq/v1HEi1YCo4pZ1D+U9pK3M5tH/vEF
         RXoOZJWTVyaltlwUdh6histaEsmrGhJrvRAt2zHBU29FOtjYVo1iNFiGkZWEajw9W4aP
         +3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kUPsp0+j6N99PN5TDquxRGX7XdHybJ0Jd9WQ5AMfVHg=;
        fh=wi+ebhek30znuh0Nukza+A/f2zpsgccMXaE6wmLwDK8=;
        b=Cwh/6tlWPmBn93MZG1ZWvAGtkse+6dr2cKfOIVcZkAKPcoOxt7Wh1dyH3fEtHI0Sle
         WgEcUtNBBcUIT8Lpjaln/o7Hdw4JV2k8RHrF588HEyGu+DmJUx4rHni/K/OpNwLaAc/G
         wkae3Y3KHp7zrHIMHjA0wLGJIf44kxtgjktg4WoCLZKVn5Phv3w2dGmiscK5Dk5KHUMD
         xzKFCRLXj7eS7zPQoO0+mWsue+5lAhTiiDn+XzZfEtLeEUcjOEMXAmu0J/lZcb6aaawC
         /dQXn0BtO0kJevz++2MwXi5F/nv9q48je/lRU99VgNZLVA1vcXauatiPjMzLoYOEni1C
         FTBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790345151; x=1790949951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kUPsp0+j6N99PN5TDquxRGX7XdHybJ0Jd9WQ5AMfVHg=;
        b=cNOj3cFW7z8kCoZMSS1YNjfup8F+zV2BS6a7bW83oGQw4wbNJe+NBF7tBOzbsNw3yA
         xZ5wpb9QSxcB7ksCMHfdBrZ037ZBdISmkvx+SwpnYqYw21zG9ULo3muz4FJ8k25cBsiT
         sJuwvhkpG4FHPU19ma+tJWo3cGKgbxUcU08vgB/shoYD/gvhGbyI2qZxwdXnUzZlVSBm
         Jhka7wVMeOCOY9bR4RGvFhwxROBiUbcshaiG2I0LfgYeBB6YqSzHOJdqYq6B1fCDj7xN
         0XlSX0I0YToY5QHG0TNcmYDGj2LlQ9PMfhrBmw0ROPOV80+JZX0I6u5WueSI9LJJ3LpT
         B3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345151; x=1790949951;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUPsp0+j6N99PN5TDquxRGX7XdHybJ0Jd9WQ5AMfVHg=;
        b=jiXMJJxGvAKBy/orAt8xd72niGMXN6817c21OaTbXJGTR+v9Qf/Zd8VQn2+13ngPWD
         WKwTw1UoHSxNJPe1v66Qqput8Jd6av+/3ORQR/siOxh6CoVbCnUUUIMbYNRX43SWZRGW
         KFN6Dl2+0UCpz5CLtc1ooFp8O6OkF23beXteVAEx/caQyieG3n4t1hYmtZpv7cdgsFES
         S9kd/Qh/YeSSUhPJAGa1sut2VaiL/mhJZJrqfiG3+ZmKYMJR9jg61lDK2cLSiBo1Huly
         B4ydwr3AEFnV7y2DuHoHeGBJANcvoTU36Y/N21Z9y5ASg9krVa9vbtw6TG7JRfHkW4Pp
         yuzg==
X-Forwarded-Encrypted: i=1; AKwUvBzdxYgCD/FIjlUupA08jE42q44y8aGGl1R4Ft9RBebEbjRq3vsOgs8Ay/i4iYm00A9UnLdpQieXaHxOrlQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lpNGpqejagkkY3pAck3IAEQIt2LbvARHMesBCHoI4C4C3aqdEm
	/JbPPr31Dj8dXPMPAAmqw61JPdkK+EHs73iSYAWpJhqv5B/PziN5WcQByElCmx0TrFkUvnjyOue
	u7yOhvJR/Nicvzk9HuBs1G70u8yFQS5pdt0B5LPXlQsILXE0jNiW06LZ9nKmY1DZ/F9/jaSRh7r
	jrqSW/WF63vzZFCz/UAQGnhNqEVFYNJkORwAAtCcxa
X-Gm-Gg: AYBFou3DMNLlC+i+1MHmwZ0IQttV0/EXhyJTDCNJLSM28XeFMgiXWDlk8IpmiBCAqL7
	sFKYgdBHV0qfXD74SQ0HSbM4akIUqV6pZjJ8mFQlY5lwYjZF5xSO9LxDVUxCsZlSonJgzV+oTn5
	wXqg/4yqUb55Ht8ndMEzkGZkjKPIPPEvAU3tmbIfFd0fFquSxkcekn6sIs1fkyJZ2g0BgT7NxYB
	VdyudVm20B7vfir6A==
X-Received: by 2002:a05:600c:248:b0:49c:e0e8:bd94 with SMTP id 5b1f17b1804b1-49fe66c84f8mr83073175e9.1.1790345151098;
        Fri, 25 Sep 2026 07:05:51 -0700 (PDT)
X-Received: by 2002:a05:600c:248:b0:49c:e0e8:bd94 with SMTP id
 5b1f17b1804b1-49fe66c84f8mr83072805e9.1.1790345150772; Fri, 25 Sep 2026
 07:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528063606.22324-1-nprabudo@redhat.com>
In-Reply-To: <20260528063606.22324-1-nprabudo@redhat.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Fri, 25 Sep 2026 10:05:39 -0400
X-Gm-Features: AclHuK8o7hlp5oYBe8-lcGVVwUb4JmFoQSrhFR-ASlwbAvyr7VWhPqeY2b11B6o
Message-ID: <CADRr4bfgL70JEHx9wYb3KTVfq=ui03fFPMWc1H=Bn05RAu5xyQ@mail.gmail.com>
Subject: Re: [PATCH v2] scsi: qedf: drop invalid skb_transport_header check to
 prevent panic
To: Nimal Prabudoss I <nprabudo@redhat.com>
Cc: James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, 
	linux-scsi@vger.kernel.org, jmeneghi@redhat.com, nilesh.javali@marvell.com, 
	Saurav Kashyap <skashyap@marvell.com>, aved Hasan <jhasan@marvell.com>, 
	GR-QLogic-Storage-Upstream@marvell.com, "Martin K. Petersen" <mkp@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:36=E2=80=AFAM Nimal Prabudoss I <nprabudo@redhat.=
com> wrote:
>
> During intensive FCOE Tier 1 CTC boot tests, the qedf driver triggers a
> warning assertion in include/linux/skbuff.h. This happens because the
> driver attempts to access an uninitialized transport header offset via
> skb_transport_header() under a CONFIG_DEBUG_NET environment.
>
> Remove the invalid helper call within qedf_recv_frame() to eliminate the
> warning assertion and prevent the subsequent system panic.
>
> Co-developed-by: Jesse T <jtaubepe@redhat.com>
> Signed-off-by: Nimal Prabudoss I <nprabudo@redhat.com>
> Signed-off-by: Jesse T <jtaubepe@redhat.com>

BUMP.
The order of signoffs acording to checkpatch should be
Co-developed-by: Jesse T <jtaubepe@redhat.com>
Signed-off-by: Jesse T <jtaubepe@redhat.com>
Signed-off-by: Nimal Prabudoss I <nprabudo@redhat.com>


Thanks,
Jesse Taube

> ---
>  drivers/scsi/qedf/qedf_main.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.=
c
> index da429b3a4283..f2bc0ac684e0 100644
> --- a/drivers/scsi/qedf/qedf_main.c
> +++ b/drivers/scsi/qedf/qedf_main.c
> @@ -2496,7 +2496,6 @@ static void qedf_recv_frame(struct qedf_ctx *qedf,
>
>         /* Pull the header */
>         hp =3D (struct fcoe_hdr *)skb->data;
> -       fh =3D (struct fc_frame_header *) skb_transport_header(skb);
>         skb_pull(skb, sizeof(struct fcoe_hdr));
>         fr_len =3D skb->len - sizeof(struct fcoe_crc_eof);
>
> --
> 2.54.0
>

