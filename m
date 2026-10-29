Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793302911;
	b=cdOUTIsXBowx819Ow4rJZQPv2NPwhmu9Rh6mCX8pVmEj/LNLFBGg6wwulEPkdmGYC+W2
	 55/Ig7KrqEK+UwPaEJ22Wc0h/MpLcHy9NvkY1UYvf7uFqf/FaKMo9dAvj0tcD9FSWmQT1
	 eI8NRsICBzikrzQkXGQv+tyFI5xx6Kzk/x0FAUP+TUEfBhkXJQ+fEdmPm2CA9nVHkMTuL
	 JGIIaVqpJtfkVix+zxJYXoxB4gylkpFoGpUGp+gcRG49YApYmjGoQCeQHz25DiNuzRaRU
	 nPTkQpgg3vITJ2EISiMNUDVgNbgln0KFjsaD9E6zm0vqNi0EllPGZgEB45nPsmSsvhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793302911;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Content-Type:Content-Transfer-Encoding:From:
	 Mime-Version:Subject:Date:Message-Id:References:Cc:In-Reply-To:To:
	 X-Mailer;
	bh=XRi8pcTf4rfC4VLA5r1QxQ3Of7atJjfiNOnycg20qTU=;
	b=aM+Va2w17urgdtXnhsTTz3rqjL8cKDG22XgNK4ffu5z1zK5GUjrk2uY5u/qCwRkp7Z3h
	 +AHS8QRugaIVDfZku4G0z3Q6XxiswIXZofPunfz0Wq+KrgJUPU/c0EtKWKjQHs5hHCW9u
	 2vKtqsramFK3Zf2fX0aJNk61F2vuvbABcaEB6KL/TIovvJ9Wg7+3Cqi6kQsle34mURqJF
	 SKghlDUEIf7F9ugXJGBt8kX6NDCHkpmhS51XmRLYICJTkKsM+/Inb5kQKe7O6Aw0/Cx+T
	 Eck37rCVayrDwHUuS8r+hCYK9VFVsL9ZLOKJbvjdLwcvyrkRWU9ZzvYOhBej+LlXIHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=epaaUSOf;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89AF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=epaaUSOf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=XRi8pcTf4rfC4VLA5r1QxQ3Of7atJjfiNOnycg20qTU=;
  b=epaaUSOfb0zSZpemikoEL1jRlpVBGP2WHyK3QRbuv05yjQrd3VFSqACS
   rnKiAcEjy2mjwRFOBRA7C7SArzo4npYsQsbxNsEi+7bBJ1GZrq241apHU
   U2yhBvyALYzabx7EE4rrB4wphL57AQw36HheQY7y+lN/R8TJ7yFdL4+p7
   A=;
X-CSE-ConnectionGUID: URfV2/lBQt+woBOfA5N9bA==
X-CSE-MsgGUID: PKaJ28FpQM2EwgDc7biwzQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,185,1787004000"; 
   d="scan'208";a="161239336"
Received: from 37-167-22-2.coucou-networks.fr (HELO smtpclient.apple) ([37.168.22.2])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 20:41:24 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] staging: greybus: audio_manager: Add newline to sysfs output
Date: Thu, 29 Oct 2026 15:40:58 -0400
Message-Id: <3B73BF88-AA02-4965-8FAC-82881C192E69@inria.fr>
References: <20261029181948.13121-1-mariasheikh812@gmail.com>
Cc: outreachy@lists.linux.dev, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
 johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Maria Sheikh <mariasheikh812@gmail.com>
In-Reply-To: <20261029181948.13121-1-mariasheikh812@gmail.com>
To: Maria Sheikh <mariasheikh812@gmail.com>
X-Mailer: iPhone Mail (23E261)

Please read the recent mailing list archives. A similar patch was already re=
jected.

> On 29 Oct 2026, at 14:25, Maria Sheikh <mariasheikh812@gmail.com> wrote:
>=20
> =EF=BB=BFFix checkpatch warning:
>=20
> WARNING: return sysfs_emit(. . .) formats should include a terminating
> newline.
>=20
> Add "\n" to the sysfs_emit() format strings of the name, vid, pid,
> intf_id, ip_devices and op_devices attributes.
>=20
> Signed-off-by: Maria Sheikh <mariasheikh812@gmail.com>
> ---
> drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
> 1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/stag=
ing/greybus/audio_manager_module.c
> index dc90cc2d2308..5737f2a32f5a 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj=
)
> static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *m=
odule,
>                     struct gb_audio_manager_module_attribute *attr, char *=
buf)
> {
> -    return sysfs_emit(buf, "%s", module->desc.name);
> +    return sysfs_emit(buf, "%s\n", module->desc.name);
> }
>=20
> static struct gb_audio_manager_module_attribute gb_audio_module_name_attri=
bute =3D
> @@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio=
_module_name_attribute =3D
> static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *mo=
dule,
>                    struct gb_audio_manager_module_attribute *attr, char *b=
uf)
> {
> -    return sysfs_emit(buf, "%d", module->desc.vid);
> +    return sysfs_emit(buf, "%d\n", module->desc.vid);
> }
>=20
> static struct gb_audio_manager_module_attribute gb_audio_module_vid_attrib=
ute =3D
> @@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio=
_module_vid_attribute =3D
> static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *mo=
dule,
>                    struct gb_audio_manager_module_attribute *attr, char *b=
uf)
> {
> -    return sysfs_emit(buf, "%d", module->desc.pid);
> +    return sysfs_emit(buf, "%d\n", module->desc.pid);
> }
>=20
> static struct gb_audio_manager_module_attribute gb_audio_module_pid_attrib=
ute =3D
> @@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_=
audio_manager_module *modu
>                        struct gb_audio_manager_module_attribute *attr,
>                        char *buf)
> {
> -    return sysfs_emit(buf, "%d", module->desc.intf_id);
> +    return sysfs_emit(buf, "%d\n", module->desc.intf_id);
> }
>=20
> static struct gb_audio_manager_module_attribute
> @@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct g=
b_audio_manager_module *m
>                           struct gb_audio_manager_module_attribute *attr,
>                           char *buf)
> {
> -    return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
> +    return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
> }
>=20
> static struct gb_audio_manager_module_attribute
> @@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct g=
b_audio_manager_module *m
>                           struct gb_audio_manager_module_attribute *attr,
>                           char *buf)
> {
> -    return sysfs_emit(buf, "0x%X", module->desc.op_devices);
> +    return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
> }
>=20
> static struct gb_audio_manager_module_attribute
> --
> 2.53.0
>=20
>=20

