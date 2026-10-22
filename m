Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671431;
	b=RdwfMyKDKTaKxG1QbzKiovoaMA2Quw+ogg9L8G1H0+n7Q0kL82vC/Oq+iy931UQXQNzx
	 CYJoc3lcLLhZhhAv5ixTkmXd18KNZtHMUoQZF7HGl211YlrrjjBriBUJX6l8tdEZObgTn
	 IZTxbQtF0AiOoRCRoT+ctQFm4uoqCEZnwkpukMu1CFtYr+R/OSxaQIoopkAOKmzxRLGYH
	 r69Pb4q0vh/Agr3NqWZgQ8VBD1K3AFyf+5reolSo4rFmZClI0TLd09upeRhg9Tx9xWJjA
	 in+RAHmmWmw1s1dX0pdMxcJPeX1sM6SonkIaTbgRAXKqBKj44a4L7u5IUUXtF+hnh7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671431;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BM/ZpeI1cIgMEfNhy1yMJnOZfY9k/2QzMV/m5coXrmg=;
	b=N/HpuGU1PzzJInPN8fPkvaSdVqzU6kL0ciXxYQu5WI3KG9YnNySRPcB8Liajr5I8sNVu
	 ugjm/pcmzeYZRdFROEsBCeR81nJtZwu0F7LcowOyZgwLY4Ve0ould7U/HC801RTCQQg9Q
	 DQiqkyJtkrp//9rX/UikuZ53Us5H2fTA+Le+sha5VqYl09soW7T18VK4a9pjJlpGksT5W
	 UR1bOBzwfIN5SYNjtLeXFbQ17jaAtLRDYqfYJoBXsGCIoSqTQ+qvVJAKzhe5vPPKXk0iE
	 l5+l3sH3IyIV7BbFXfEV7uV9yDuBQmN5Nt5D23JwqFVntp/g8BSLp52mBax8tblyJkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euPlE8oP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00864606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euPlE8oP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9031F000C6
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792671430;
	bh=BM/ZpeI1cIgMEfNhy1yMJnOZfY9k/2QzMV/m5coXrmg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=euPlE8oPE6dTOzdJQS9SKTCUKW9chsyTWweUILjZNMB3iGMTNe42rNgSwDsBNGT6c
	 2972Rw5Ov7n+J6C5e0a24SesRwT1/aUtQCJLsUyCN/OFbtPnTbazxfjU8dHNWw7QRV
	 I1DuNqBN3TwRK3/AYqcdj8ZolBoDVotIE1j17UZs8wJwrKgdtBcl81EEf0GkY1L5ad
	 WVlryArRXzBHSWJs6sxxRTGRpTzmYGbVa/vYYFarVuAH9VJFmwDAl6cCaTt88FLjFb
	 lr0Uyr0N1wmuD4Ix7b0y5Kxz2jiuZdjs3Kt792nkiSr7ZSqMNCa5nn3purozm+Lfw9
	 NXaPZAz0b+DFA==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c450ab1483cso293709866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzMT+WIoRzoXfUz3le3I+iIcJcunXIxpACjl6E3pgHiPKmvAc3jGiD8+SAlVlhxhy3iLHI9mX/OhlDinRM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8gfni/QvbP5ZyKq+PBkmbSyll/ppMADgonF+yNkSkSSi+Kzpb
	0ye3MbutJE0ZlPrgNnyLZW+mmn9r8ZSxvrSJfCzLgOQGRyRzxgEIO9Z5jqrR40hcE9ut+hCzPtg
	RRzTbWjk5Nn11R0mAuZvT41zKiEp7hEE=
X-Received: by 2002:a17:907:72c2:b0:c2e:7fe7:288e with SMTP id
 a640c23a62f3a-c4679792b95mr489548666b.32.1792671429259; Thu, 22 Oct 2026
 05:17:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <BYAPR01MB383076AC412E19C48CFBEAE980662@BYAPR01MB3830.prod.exchangelabs.com>
In-Reply-To: <BYAPR01MB383076AC412E19C48CFBEAE980662@BYAPR01MB3830.prod.exchangelabs.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Thu, 22 Oct 2026 21:16:56 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9yxvb6r+mtxbx2HSCzEFvxJqLaixtvfA6WuKPYThN9kw@mail.gmail.com>
X-Gm-Features: AclHuK8-Jh6mfAJkkpUjpVvOnI_Kzhn0tlBTf-KoHXsLwzjyKYtHPrQLRqJ-MO8
Message-ID: <CAKYAXd9yxvb6r+mtxbx2HSCzEFvxJqLaixtvfA6WuKPYThN9kw@mail.gmail.com>
Subject: Re: ZDI-CAN-33774: New Vulnerability Report
To: "zdi-disclosures@trendmicro.com" <zdi-disclosures@trendmicro.com>
Cc: "security@kernel.org" <security@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Tom Talpey <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>, 
	"open list:KERNEL SMB3 SERVER (KSMBD" <linux-cifs@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 6:36=E2=80=AFAM zdi-disclosures@trendmicro.com
<zdi-disclosures@trendmicro.com> wrote:
>
> ZDI-CAN-33774: Linux Kernel KSMBD Protocol Dispatch Race Condition Remote=
 Code Execution Vulnerability
>
> -- CVSS -----------------------------------------
>
> 9.0: AV:N/AC:H/PR:N/UI:N/S:C/C:H/I:H/A:H
>
> -- ABSTRACT -------------------------------------
>
> Trend Micro's Zero Day Initiative has identified a vulnerability affectin=
g the following products:
> Linux - Kernel KSMBD
>
> -- VULNERABILITY DETAILS ------------------------
> * Version Tested:7.3-rc3
> * Platform Tested:debian trixie
>
> ---
>
> ### Analysis
>
> conn->ops is selected per-PDU at enqueue time but dereferenced at dequeue=
 time.
> It can lead to a 40-byte SMB1 buffer is parsed as a 64-byte SMB2 header w=
ithout length check and leak OOB read memory back to attacker.
> There is also a path to OOB write, smb2_set_info -> parse_sec_desc.
> The trigger requires race and guest share.
This issue has already been fixed. See:

https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/smb.git/commit/?=
id=3D68f410faedaf6ee74d81e574733c50ebcc1bd8ed

Thanks.
