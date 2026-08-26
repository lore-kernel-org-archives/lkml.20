Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400E3F7A94
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745852; cv=pass; b=R4j8Kdn4WVOAJsbH4lwGgAbM5btb0+kbIHEPXWOPX2sH0Yfkfa2dk8VrdXLbP79SUXMaLPQ+rdxSZN+P4RUNsKw9e+Gbj2qIBIBKLVrJm0j6kQnlPl9eIKjR5Q2bXH0f6lVntEhpCFCU7iiqJRZiKerOQ5aV+Ib2uoMYsvcOXEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745852; c=relaxed/simple;
	bh=g8fXetp79t4fnV4qXsoKx7uhaXURFpvOU26/CCLUaH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XyGEwrfmEWMvFxH82zCk0+xCbrwqW3D1NjkZCs12AfxjQDvhUxgHc7/uT7PjNOk3UbvqWxU4UIbgPIrbaaPakT5pL9J+uNAowpG45FvUjB9tTgeRSfIUCkh38nf0zyBsIkTRa5LjjlXaQAkjrz26Q3JC1/OPFFAsIDTmSteM2X4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NxV+PgTr; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NxV+PgTr"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52f1a320162so995921cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787745848; cv=none;
        d=google.com; s=arc-20260327;
        b=erNlvGibCvseG5PMFe4ccK3THvaDFJA3WElzFfZB21NEABzZDZaNevTNTOJgotFEYP
         LCRiKBkc+sblQHMtV62GB3NFn9lNo4/JUUOXgdGJr2gFUZ1+nCXcmLQzizr3+ZcX0a16
         8E1jJPOCWD/hfgFUMf5gYqySmEY+AxAw6uC1iX1dX4I+jfF4Q9XXNXl8ZrnUC7N0m/wW
         hIlDjGWDBHwo+gWX64MD7fMgcejHz2NPJM1sSmdDsTe8FfD83kSJQ4mXrozi6dcKi/g6
         FcLjgGJbkHIX03PY8OkUiYWOMfO6E2iyiypHp6BlLLFFzvIjETdd0g+f33wm8Fr48eys
         r8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U4Ml/4zqqR/5ynL7idVVkN6ePtxJ3l/mCBkMjrk+5rA=;
        fh=y5VbcffRCJym5qaRr7tLqXIzgypTIWL2l7N5cQzFM9o=;
        b=AqlCLBCvawtOCpS+VwlWJYoTZfMjt5uKSGvBazR/xk82akdg47Tz9HP7V75nq9d1SG
         hTpFOGLFjLUWq75O+JxC4SfrAnneCAkUsqllRHkpb/Bl2ip55sPCp0u3pslvBYDLAQLg
         GQFu62M97RkvhymBDbljnEhcKx2jeKC4a9hrmkQq7cXK5/TReRwSsO+BfOpIRprmQPo4
         fFWUrICj5yYc5avqvWPhwLLnj7LTqdiJpy+EckMqp553n4tSwKDTT3Btgc8+DUq9BSuG
         eellyoOSxHCIg56uYyZ9BhQwbkKcA9wz4HAowzEn6+PjLWGh3RLHbxjVtIwieHt5I2nV
         w2kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787745848; x=1788350648; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4Ml/4zqqR/5ynL7idVVkN6ePtxJ3l/mCBkMjrk+5rA=;
        b=NxV+PgTr4uh+OLqXSxG3hzExU0HKKfbXJHSusn4x9XiphqHFej0a+o/7r7e8kxW0U7
         JUvwx0zKLTKujOpZy2oZ2CKoGibwyftDM1bAR/1/ZEboRATo92XM73c98NzRcfT4z6Vq
         EmpO+JBCY9XpDuPlSXCtqANROqrz1vSNoMgRQBydA8zmmlk6bkUHnIQ2xU+XI4hqjk1Z
         WSFurDjBVIebFeti6zpQT5R7hUOtvKtOUeRKfPjxjnVWHXwvk6LdJ+oto95IRApu9Etv
         jPx5ZPOR5ECl5wP9CO4bebdAcz8+du746H5AZ4tSelCNFKgveg3ZHbPZlF6k9v+hOyl8
         cIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745848; x=1788350648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4Ml/4zqqR/5ynL7idVVkN6ePtxJ3l/mCBkMjrk+5rA=;
        b=A+ev4e5UaBT75HUIGDqqWd5cljPs8BCc44Sl93JHF1SF7JgqFL70B7PvcjZdQ1i91P
         JVLnqmLXBWe15g7XNmZaTWVeJYVWpqam0eZFTHyKBMFMFlBSW4SNfy3vY58tJ/aQ4ZVS
         /2cWTIUvyEZAIbWVJS3H3yQiki1nya+KDazfHgeOmNQe8xWueDuHvxIsGxMWZzPwXC49
         rMSCATDIYH8mJMxa5hH522jukCjQF0y/c4MdlhwvD+QyBIj1UIrwuF+fEZXLjP9AfCv4
         LYo6DS2M1m844/mO6Ywm6FdqZbrsnJ/3dXk8Yjh4giildh/j4XUxHGTcWr5+LkZ3mYW4
         IaWg==
X-Forwarded-Encrypted: i=1; AHgh+RpURYm86dBHKKa06v1SE9LOSlKDlPhIu3QkQZyqpDJ6bzspC7jfYSPCXprUihN33Wf4JTMDO7xzWx8GmlA=@vger.kernel.org
X-Gm-Message-State: AFuF++k7TtiNnDRaCnXqhLobTdKgV0VoTjOH7nRSg8cf63RlsOG4vgeP
	S/NlsNV13MjbVHaIGAiv4blAgQBrgDSkqJCYCubQ6eEzKjZCRdJMBpwa7i3+mo7CwT4ynfMdT26
	NF7RKMhw4CXF2h2Q0dZujP+JXvnV1MN597GisM56o
X-Gm-Gg: AR+sD10bO0YQPGF43EFEaqIVi8S6LqseIMhKKBY9MfhIAkOEY8KBSBA5J2QTIrpvHzL
	7g08tqtMrDyAo18EvOroN6ExuGegHmTbRRP6kvxo3LX/ul0N6xbScfSF+yCHBgw2clQLIsesjl6
	W2h/gx8x/nr/nzae7szZy5SbMRU5L4euw3yaJa7iXRe31abiOFA1i26PzbSk/mWIXsY37S4QTaW
	r+BOb+9XaPZaxCL/t1iF0tLLpl7Twt7ldkJgokoZ6nBpCMOCjfFNAJRP88UgaYZ8vZ2UmeF5CJ/
	tzZZS92I/n9uhriuy2W1sYO5RfTEGt46S2IuuL8Mj845F+6ED2E07tFuue/GnR30AxokDNNzMH+
	8k2yJVpX+ulOWw4oBINC7chIQDuZXfkUxSwwfmK7rfeleKCAvYHna5gNAlLt4
X-Received: by 2002:ac8:5cce:0:b0:52e:1e8:220c with SMTP id
 d75a77b69052e-52e423233damr63458161cf.24.1787745847393; Wed, 26 Aug 2026
 05:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824024620.23485-1-kartikey406@gmail.com> <20260826115927.343690-1-horms@kernel.org>
In-Reply-To: <20260826115927.343690-1-horms@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 26 Aug 2026 14:03:55 +0200
X-Gm-Features: AcwNN1X1NWLfviWvaIZ02Nce-Jxqq2P_zMbYHwbvhyxjoUZX5Ya6rksSLZPWcPA
Message-ID: <CANn89iKr74KHmdbzCmx70NmgFgX=Wd9nR4rYNxyVuenLRz2q7g@mail.gmail.com>
Subject: Re: [PATCH] net: atm: fix shift-out-of-bounds in __vcc_connect()
To: Simon Horman <horms@kernel.org>
Cc: kartikey406@gmail.com, 3chas3@gmail.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, linux-atm-general@lists.sourceforge.net, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+6665d3db5fef15914802@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:59=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260=
824024620.23485-1-kartikey406@gmail.com?part=3D1
> ---
> net: atm: fix shift-out-of-bounds in __vcc_connect()
>
> __vcc_connect() used dev->ci_range.vpi_bits and vci_bits directly as shif=
t
> amounts, which is a negative shift when those fields still hold the
> ATM_CI_MAX (-1) sentinel.  The patch skips the VPI/VCI range check
> entirely when either field equals ATM_CI_MAX.
>
> Closes: https://syzkaller.appspot.com/bug?extid=3D6665d3db5fef15914802

A simpler fix would be something like

   usb: atm: usbatm: fix invalid ci_range initialization

    syzbot reported a shift-out-of-bounds in __vcc_connect():

     UBSAN: shift-out-of-bounds in net/atm/common.c:382:32
     shift exponent -1 is negative
     CPU: 0 UID: 0 PID: 5987 Comm: syz.0.18 Not tainted syzkaller #0
PREEMPT(full)
     Hardware name: Google Google Compute Engine/Google Compute
Engine, BIOS Google 08/05/2026
     Call Trace:
      <TASK>
      dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
      ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
      __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
      __vcc_connect+0x14b4/0x19c0 net/atm/common.c:382
      vcc_connect+0x328/0x8f0 net/atm/common.c:498
      pvc_bind+0x272/0x380 net/atm/pvc.c:52
      __sys_bind+0x2e3/0x410 net/socket.c:1976
      __x64_sys_bind+0x7a/0x90 net/socket.c:1979
      ...

    ATM device ci_range fields (vpi_bits and vci_bits) represent the number
    of bits supported for VPI and VCI addressing on the device.
    net/atm/common.c directly uses these fields as bit shift counts:
      vpi >> dev->ci_range.vpi_bits
      vci >> dev->ci_range.vci_bits
      1 << vcc->dev->ci_range.vpi_bits
      1 << vcc->dev->ci_range.vci_bits

    usbatm_atm_init() sets ci_range.vpi_bits and ci_range.vci_bits to
    ATM_CI_MAX (-1), which was defined in <uapi/linux/atmdev.h> as a sentin=
el
    value for user-space ATM_SETCIRANGE requests, not as a valid bit count.
    Shifting by -1 is undefined behavior and triggers UBSAN warnings.

    ATM UNI cell headers allow up to 8 bits for VPI (0..255) and 16 bits
    for VCI (0..65535).
    Initialize vpi_bits to 8 and vci_bits to 16, as done by solos-pci.

 ...


diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 9600e1ec099304e465dddb00c36817339f538b3b..7b0c791399eaac9ebe00541a2c4=
1d715f465a24f
100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -917,8 +917,8 @@ static int usbatm_atm_init(struct usbatm_data *instance=
)

        instance->atm_dev =3D atm_dev;

-       atm_dev->ci_range.vpi_bits =3D ATM_CI_MAX;
-       atm_dev->ci_range.vci_bits =3D ATM_CI_MAX;
+       atm_dev->ci_range.vpi_bits =3D 8;
+       atm_dev->ci_range.vci_bits =3D 16;
        atm_dev->signal =3D ATM_PHY_SIG_UNKNOWN;

        /* temp init ATM device, set to 128kbit */
