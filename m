Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192E43E5ED1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095981; cv=none; b=Aj0+EOdnuqQICb+8gsoLPDOY0NjVrfEfrAMufgNVvpFcra2xhWKpP4TyGl/DS2hl5GD7IgKszk06P2M44AEi6QencvDnY9agWeRax+jLSY3/idijeTpZ+eC+INnSkaK3oQLQGRXfaoOUvIKkqNxYX+32tsH/iPRIbDFWclEs3lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095981; c=relaxed/simple;
	bh=bHQSvgr4CXllnM+mcnLzKtWwBokvGdPsdBrClU0FxAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c+4JuckDt4GgIrSr7yOOpu/daEi4b5ILBdknoSt6N6AsfU8neOacw2igIp0qsdPVa8dpTV2Kq7WNP7WGsfSYsGUF3oaJpM5N1oitP+3/yn/jHJyoKxxpL1bRyyDBSw1GlrkPOmhlCpxooNT8Z+hpsmypzc4x0dNwjFwhA/O6mqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DDA3b52s; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DDA3b52s"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5c7afda4515so384771e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095979; x=1789700779;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=muaYfdzyTYzkyDBHsu/f+eNeDJ1dvOvN3k8QI62hLYM=;
        b=dUT6yNKSmkDoFkR3K1koIFLVMdGtjrG6uHvbq/Ri7yrZ8hHB4Tj6J4v3UbkpWARwyk
         h4uKgSssojxmw9FGbdSLeR3tjF3ZFKI0LtFjBkjNHvpbtIIdwWHQ2XlOE0ZFJA95nAzQ
         PvWlfyuo5EM50T+gT6fe5rESrk7iKntSZPqlMo6XL5F7z/8GL64GfdO02DWTPCjqY8hS
         QkpTqnRBC437DL+6aBmIcN4J/sc14CE4vl6B18XJRrBFIZMZlvEV8XS4wT2pgRhl3MRl
         Wwtz+4/PvmQAzAdOBG1EJ/lHjW0ImvYffPoh06WPOhcpZw24g1417Cp1LgK6Tr+xRztK
         v+jw==
X-Forwarded-Encrypted: i=1; AKwUvBxVXR+UQ85Bqn6jD9vxDNLVPhRBEZpTIrYAAo/vgIO/oaxrKJ5mEy7yY6Eq19P7I1PzIdbi9F8FGi/Xq3Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lTLhOz6FFlZs/VEZe36zkIbR7s2DIc1/jHw0U6gY5+UlmuZEQ4
	MTRKqZipfQYucChLZmQPaki5xlrxC0zVy4L3q35H3isjse3X3VYm1rQc1RgP/HYWhgWehRsCLAy
	oEUEv4teqFR/6rklXKQJLpPp7VsHle5KRVLAgNkhRiB89yTLBkd3hAhI7O8F5EVQhebFUmTl/kl
	Y6eXSKu5u2poWMd3NxZsy4c2pHIBiogDQd1e2yo5pzmubXwiBiAyvuE65DLM2UVV7iBzwJlUbZM
	aUquI9fykJB9qeONYitRG8FdioH7qAj
X-Gm-Gg: AYBFou3cC0V3031zehvkvTCXUP6r2tiTu+lrZJSUKLCz/kX7w2VKFPIzTYVUr0B6eZV
	9/0i7qr+nw1YF+qlyVRJef7t2h82bBbALjITD+whdVLc0bnOD+mFzxDLoBTLuMVwx4r7lM+GILU
	zz364r7MTS+lJaIKuuZnpnloZDcohWoJBy16YLklfEamJ/gMqVdybw+Q2IWU7wvIM2bIXShzNzA
	uWcWnGPiCLPz5FdPRTz9b2RaJJV7AX279JbsTn8y/wqjNuxWFs+2+REj0QNhgznGsMA9+hB27YL
	9V9W/F1gv87Y8w68eSe/9Jyt/qvP2OlvyB5A5wVq13+W3yJXVASW38UPAAoAuRv7Tvbbzn8XdLp
	FtieJGpajRmI3/2BWFVb8fI8H51CDb4rQeya4da+NvsDopwMpOeZM/MEc5at0vl+i685eHV+xp2
	nsx01VEPWVNwdkGCJRh/5GhBiNKxQB0D8FSkGL66582gu/DUvB
X-Received: by 2002:a05:6122:d8c:b0:5c7:a3a3:a4bd with SMTP id 71dfb90a1353d-5c84628c15amr3530767e0c.4.1789095978613;
        Thu, 10 Sep 2026 20:06:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5c846de7270sm486132e0c.0.2026.09.10.20.06.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2026 20:06:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a2639398cso590615b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789095977; x=1789700777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muaYfdzyTYzkyDBHsu/f+eNeDJ1dvOvN3k8QI62hLYM=;
        b=DDA3b52sdjBytbdXnG+9YsJ+4QGAuwY+3oZEUWFIhxR1KLASFiFRPAl7io96odAyAp
         7d2XRDBaoJZpy0F9TVSAdpCDSiaQfkWjFa+vZHntgyFaLgRPzYFWujmtoRHNCDyWQYfz
         z/N5Duc0c1wKvjWzjYXDkeaM2XHmEguEzZmrA=
X-Forwarded-Encrypted: i=1; AKwUvBwCpGfVS9F4V+y3eZBkPK7JfiI4ub171RZgbdRhHdbr2+L8dFz78In+4aXQH9La6vK4CsxVL8m+eRa8LBc=@vger.kernel.org
X-Received: by 2002:a05:6a00:28c3:b0:848:62ab:7b7 with SMTP id d2e1a72fcca58-86b3011a6efmr3462897b3a.16.1789095976871;
        Thu, 10 Sep 2026 20:06:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:28c3:b0:848:62ab:7b7 with SMTP id
 d2e1a72fcca58-86b3011a6efmr3462854b3a.16.1789095976463; Thu, 10 Sep 2026
 20:06:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911021557.2113-1-lirongqing@baidu.com>
In-Reply-To: <20260911021557.2113-1-lirongqing@baidu.com>
From: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>
Date: Fri, 11 Sep 2026 08:36:04 +0530
X-Gm-Features: AcwNN1WtQzrhW1nHluzacCV-vm6n4mJlk-aqBrDMpRxpHeG-wnWS52vxetk8q-w
Message-ID: <CAH-L+nPWk-fxwoNKjxW_ctyWL0hmkW+i4eE1wM+FS4-QmuNypg@mail.gmail.com>
Subject: Re: [PATCH v2] RDMA/uverbs: Make CQ handle mandatory for WQ creation
To: lirongqing <lirongqing@baidu.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Yishai Hadas <yishaih@mellanox.com>, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000030d2e8065b2c5e17"

--00000000000030d2e8065b2c5e17
Content-Type: multipart/alternative; boundary="0000000000002588de065b2c5edc"

--0000000000002588de065b2c5edc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 7:46=E2=80=AFAM lirongqing <lirongqing@baidu.com> w=
rote:

> From: Li RongQing <lirongqing@baidu.com>
>
> UVERBS_ATTR_CREATE_WQ_CQ_HANDLE is declared UA_OPTIONAL in the ioctl
> method definition, so the mandatory attribute bitmap does not enforce
> its presence.  When userspace omits it, uverbs_attr_get_obj() returns
> ERR_PTR(-ENOENT) and the handler stores that error pointer into
> wq_init_attr.cq without validation.
>
> The bogus cq pointer is then passed to the driver's create_wq callback.
> In the mlx5 case, create_rq() calls to_mcq(init_attr->cq) which applies
> container_of to the ERR_PTR value, producing a near-NULL pointer.  The
> subsequent access in get_rq_ts_format() triggers a kernel NULL pointer
> dereference:
>
>   BUG: kernel NULL pointer dereference, address: 0000000000000296
>   RIP: 0010:create_rq+0x32/0x550 [mlx5_ib]
>   Call Trace:
>    mlx5_ib_create_wq+0x14a/0x210 [mlx5_ib]
>    ib_uverbs_handler_UVERBS_METHOD_WQ_CREATE+0x1f0/0x320 [ib_uverbs]
>    ib_uverbs_run_method+0x296/0x320 [ib_uverbs]
>    ib_uverbs_cmd_verbs+0x1a0/0x260 [ib_uverbs]
>    ib_uverbs_ioctl+0xa8/0x120 [ib_uverbs]
>
> A WQ without a CQ was never valid; the legacy write path always required
> one via uobj_get_obj_read() in ib_uverbs_ex_create_wq().  Declare the
> attribute UA_MANDATORY so the uverbs framework rejects the ioctl early
> when the CQ handle is missing, before the handler ever runs.
>
> Fixes: ef3bc084a8ed ("IB/uverbs: Introduce create/destroy WQ commands ove=
r
> ioctl")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>


LGTM,
Reviewed-by: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>


--=20
Regards,
Kalesh AP

--0000000000002588de065b2c5edc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11,=
 2026 at 7:46=E2=80=AFAM lirongqing &lt;<a href=3D"mailto:lirongqing@baidu.=
com">lirongqing@baidu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Li RongQing &lt;<a href=3D"mailto:lirongqing=
@baidu.com" target=3D"_blank">lirongqing@baidu.com</a>&gt;<br>
<br>
UVERBS_ATTR_CREATE_WQ_CQ_HANDLE is declared UA_OPTIONAL in the ioctl<br>
method definition, so the mandatory attribute bitmap does not enforce<br>
its presence.=C2=A0 When userspace omits it, uverbs_attr_get_obj() returns<=
br>
ERR_PTR(-ENOENT) and the handler stores that error pointer into<br>
wq_init_attr.cq without validation.<br>
<br>
The bogus cq pointer is then passed to the driver&#39;s create_wq callback.=
<br>
In the mlx5 case, create_rq() calls to_mcq(init_attr-&gt;cq) which applies<=
br>
container_of to the ERR_PTR value, producing a near-NULL pointer.=C2=A0 The=
<br>
subsequent access in get_rq_ts_format() triggers a kernel NULL pointer<br>
dereference:<br>
<br>
=C2=A0 BUG: kernel NULL pointer dereference, address: 0000000000000296<br>
=C2=A0 RIP: 0010:create_rq+0x32/0x550 [mlx5_ib]<br>
=C2=A0 Call Trace:<br>
=C2=A0 =C2=A0mlx5_ib_create_wq+0x14a/0x210 [mlx5_ib]<br>
=C2=A0 =C2=A0ib_uverbs_handler_UVERBS_METHOD_WQ_CREATE+0x1f0/0x320 [ib_uver=
bs]<br>
=C2=A0 =C2=A0ib_uverbs_run_method+0x296/0x320 [ib_uverbs]<br>
=C2=A0 =C2=A0ib_uverbs_cmd_verbs+0x1a0/0x260 [ib_uverbs]<br>
=C2=A0 =C2=A0ib_uverbs_ioctl+0xa8/0x120 [ib_uverbs]<br>
<br>
A WQ without a CQ was never valid; the legacy write path always required<br=
>
one via uobj_get_obj_read() in ib_uverbs_ex_create_wq().=C2=A0 Declare the<=
br>
attribute UA_MANDATORY so the uverbs framework rejects the ioctl early<br>
when the CQ handle is missing, before the handler ever runs.<br>
<br>
Fixes: ef3bc084a8ed (&quot;IB/uverbs: Introduce create/destroy WQ commands =
over ioctl&quot;)<br>
Signed-off-by: Li RongQing &lt;<a href=3D"mailto:lirongqing@baidu.com" targ=
et=3D"_blank">lirongqing@baidu.com</a>&gt;</blockquote><div>=C2=A0</div><di=
v><span style=3D"background-color:transparent">LGTM,</span>=C2=A0</div><div=
>Reviewed-by: Kalesh AP &lt;<a href=3D"mailto:kalesh-anakkur.purayil@broadc=
om.com">kalesh-anakkur.purayil@broadcom.com</a>&gt;=C2=A0</div></div><div><=
br clear=3D"all"></div><div><br></div><span class=3D"gmail_signature_prefix=
">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
>Regards,<div>Kalesh AP</div></div></div></div>

--0000000000002588de065b2c5edc--

--00000000000030d2e8065b2c5e17
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGtzCCBJ+g
AwIBAgIMEvVs5DNhf00RSyR0MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNDI1N1oXDTI3MDYyMTEzNDI1N1owgfUxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEYMBYGA1UEBBMPQW5ha2t1ciBQdXJheWlsMQ8wDQYDVQQqEwZLYWxlc2gxFjAUBgNVBAoT
DUJST0FEQ09NIElOQy4xLDAqBgNVBAMMI2thbGVzaC1hbmFra3VyLnB1cmF5aWxAYnJvYWRjb20u
Y29tMTIwMAYJKoZIhvcNAQkBFiNrYWxlc2gtYW5ha2t1ci5wdXJheWlsQGJyb2FkY29tLmNvbTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOG5Nf+oQkB79NOTXl/T/Ixz4F6jXeF0+Qnn
3JsEcyfkKD4bFwFz3ruqhN2XmFFaK0T8gjJ3ZX5J7miihNKl0Jxo5asbWsM4wCQLdq3/+QwN/xAm
+ZAt/5BgDoPqdN61YPyPs8KNAQ8zHt8iZA0InZgmNkDcHhnOJ38cszc1S0eSlOqFa4W9TiQXDRYT
NFREznPoL3aCNNbDPWAkAc+0/X1XdV1kt4D9jrei4RoDevg15euOaij9X7stUsj+IMgzCt2Fyp7+
CeElPmNQ0YOba2ws52no4x/sT5R2k3DTPisRieErWuQNhePfW2fZFFXYv7N2LMgfMi9hiLi2Q3eO
1jMCAwEAAaOCAecwggHjMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcB
AQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQv
Z3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2ln
bi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAy
ASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNv
bS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29t
L2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwLgYDVR0RBCcwJYEja2FsZXNoLWFuYWtrdXIucHVyYXlp
bEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+v
LVAt26AjhRiwoJIwHQYDVR0OBBYEFJ/R8BNY0JEVQpirvzzFQFgflqtJMA0GCSqGSIb3DQEBCwUA
A4ICAQCLsxTSA9ERT90FGuX/UM2ZQboBpTPs7DwZPq12XIrkD58GkHWgWAYS2xL1yyvD7pEtN28N
8d4+o6IcPz7yPrfWUCCpAitaeSbu0QiZzIAZlFWNUaOXCgZmHam8Oc+Lp/+XJFrRLhNkzczcw3zT
cyViuRF/upsrQ3KY/kqimiQjR9BduvKiX/w/tMWDib1UhbVhXxuhuWMr8j8sja2/QR9fk670ViD9
amx7b5x595AulQfiDhcN0qxG4fr7L22Y/RYX8fCoBAGo0SF7IpxSukVsp6z5uZp5ggdNr2Cq88qk
if7GG/Oy1beosYD9I5S5dIRcP25oNbcJkbCb/GuvWegzGfxCCBuirb09mTSZRxaBmb1P6dANmPvh
PdqGqxfFrXagvwbO15DN46GarD9KiHa8QHyTtWghL3q+G6ZHlZUWnyS4YMacrx8Ngy0x7HR4dNdT
pqAqOOsOwDmQFBNRYomMdAaOXm6x6MFDnp51sIWVNGWK2u4le2VI6RJMzEqLzMZKL0vTW+HPqMaT
hWv2s5x6cJdLio1vP63rDxJS7vH++zMaY0Jcptrx6eAhzfcq+y/TkHJaZ4dWrtbof1yw3z5EpCvT
YDxV0XFQiCRLNKuZhkVvQ8dtmVhcpiT/mENrWKWOt0DwNEeC/3Fr1ruoyriggbnRmBQt1bC5uxfv
+CEHcDGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDBL1bOQzYX9NEUsk
dDANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQge3KFIeYhq2huaCZ7cR52j9SyIfXm
G7aejIQVDU8mTHYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYw
OTExMDMwNjE3WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAyM/9jgzLBEOMM5XUrA2lK4dsl3qyuRh8QKyvamNRuE11kF3ht7UYv8ildH6vpMt+
3HENO7yl0k5wNHTF3YykKZ8TGYniexwBf0QEA2NMt9XGpo61evxGVhNYPtVH4EhWlapf+YC3+auw
vM45oN5gPTiVdKr8lrDtfNdX6OdIknRLnLfqZ9EEg8OAoGSAsf5EEUHOojzQFmW87CdwLu7i/5nm
5YMhUFoR3gJsOkCW2U/hxYigZ105jYV6vgPIs3IyZJZkhabR7djApiYkX2H7tHKAMlFCi4ZHLTpK
aXalAmb/PN1BIXeqBCDZ4Lo4iPxRW2jUTcUt4lIq4lwEoSHhbg==
--00000000000030d2e8065b2c5e17--
