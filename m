Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A9C5C613
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747593; cv=pass; b=i3w7huE18LLpBnLFzqHEoLLpeg+Otho+wRs7xa+gD1Jn7A8Upo+AMP0NN7t5zNeLSjyRdQVz9qUy+a7e8/G/46sKhz4SJ7I0R3Xw1HFw/ZqvidDsnEzN8F9AUpclGL6R/IR1iko1fRPJyi1rMuADsEWGs8MPOuPjXf0xm8HBFC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747593; c=relaxed/simple;
	bh=aeMQPGDhMdgy29yFO3MN6TO4X3dSzrxowNL0K1Onyzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YBd9X7TdzRpYQ1IvoS51VOoRq7XLUAdmSVJYgHpzU0za8n+niB/It5BoSISUuisxBkKJcmecKvuXFkDF8bMH+4hw6pBkoZuQAbnYFeEcu8JqKVNUIy1T9DgFsUfWvACIef01/SGylOza8Hm2P2z2b/pGqtAafZy54r3jMw1Qwlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmMuV1Cl; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmMuV1Cl"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66c744a00edso707571d50.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787747591; cv=none;
        d=google.com; s=arc-20260327;
        b=rbz+za8SXuniK8dtK9zMUNL09dTAFPHZpbR/JhqkmecUVHHue6QXW9Sm5cwYjqWQ15
         S07dD8oqvdxCCIhdB1ya1R1A5IdEKm60wDE3efBZ6GDutSeRjkfnABsEtZ6W3gK1wfw6
         ep9N54d9HEj4WN1GKZAVzHs5QSvtnhho9pxiZgl7aEXdKJfWsPx4MAXnZcTWTfrNDUce
         pbGBLV7L3FUvfpcJPD1cUkAX+IRVZLE4JNp+BzjUZ8CgM806xe5KxtBfrWCb2U5s5dmw
         oYdEbEf/1M25Ol3RES7s0MyhkzYr1hPRVtpjr0U+amkIVwdOXYi9n6xDcbzbM5Rs4tsD
         iQEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DKOILVdGquaNs2wK6kjEmJ1Ax7jMl9TFyWjDFeiTIjc=;
        fh=SkdM0XBbpi93oaci1sLjQ7rCRX7ktfX4MBAbAyCbkPQ=;
        b=QXS1cgZXsbbtloW6obum0Iw9R/88NCY/nglvzOkQSGcwE1KoH735RY/Kscs26SgsvV
         j8zxFJ0DJzC7qeNVZ4ATNW6adteQNUBMXLWtoZ6doPOZy3oTzfDjh1xcaXbum6umzWBB
         El6J2OoedST2SaekNPJeyMvi4dRF9r701CmG2xCCoovPko3Q7hcQv2hpSBA80355wOLf
         DGmow5iOr6VS4qC7nkwKaNaM57325OEAyPTNd2qMDjR6P5UDlK5RR67t91A3a5I1NO/f
         /8UN7e6fiVzOM5DyysYLhjy0QhkJljDZn1WBF7FQ/eTAgSceSAUk0gm/vUeE6JhmLPf/
         1oKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747591; x=1788352391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKOILVdGquaNs2wK6kjEmJ1Ax7jMl9TFyWjDFeiTIjc=;
        b=NmMuV1ClOy3zssBKmD5xiUXD/a7lbrICu5M2W8hk/0dGfFETFGO5dOzHp0myw+ujRP
         k6l/uuQzKd9CT+lBlq76zNN2QV5LejVdQlW6FrRcOIf2NPJXRsaIIAuqG9uVaLd5PFj8
         e3J7NQi/OLi/RiRA/3MOXx13Lew4p/zoPRgn1lsgP4eq0IwzKsNh+DkT/Pv5Vmz/yAx3
         XTbZV+M+tAsgi4IG3JtutWviMLmXCgqBpjRukAkq/hTM9Gj1tTJJdA276M1bdr9nWEeu
         IyLmyvL4JRfjPUeEz++bRHm44/ozeS1t/Q0wY1quo5KrlXAjNUj8zEnIbpLavE7ql0uI
         5nPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747591; x=1788352391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKOILVdGquaNs2wK6kjEmJ1Ax7jMl9TFyWjDFeiTIjc=;
        b=BRysWLAOT3iEqn0kcYHsANzRIY/2EKTQ/LsrOI3aLJD3BPB0dY+7v6Ha5Qqoa9nmvM
         Mb/iX2ulyCclXXRRe+IPrKHFZO6BZtkrY3iLE55gPCgCwy8uEgmKnwm0HM28zKM95G7r
         KdFSx1IiM4rggEnpbVBhroCYyJd0o2J/QnXw+Wt+ekr4ufgyFJB/WNoj9kxxY3Ko5kEs
         D2p3pPkMhiZakvNsi85XnxeHOIrCT2ZtOKrWX1i2bYuATeTWDagAMu0onUY5v9Ze5bo/
         ZlKlMqeL0INQMzxLfkzH5RFCWZg7oHOIyF7LFIaV7lD/TctlB0FVjfTDD13wiuISxUG+
         jGWg==
X-Forwarded-Encrypted: i=1; AHgh+RpsQ/96cSEo7STiu6RIBmdCvdtO30ooVJ90EAxIVQ4UXmyUMjnatRPZXAHFe9uz7ELHu9KNBEjhzwG5g+I=@vger.kernel.org
X-Gm-Message-State: AFuF++ka6yg1OVRZjuqowNYaHRdJPFOz6D2xM/IUdqgBiV+ZVVIhtjFY
	rXyeOglNO70dAO7kH+uk3oPsZkW7xn+mAGFVRpT8QbrUOMmdAA2PPz29Pq2KYdntogvezZSu0Ww
	Kf2E+2assKJRb01lSTvKYbUCVg7FcXVc=
X-Gm-Gg: AR+sD10x+3vF0EXGINApHwVHRkRU6aRrCFW6iz51h2Rff5MT/SQ0ugDqlhZaRJUm/d+
	0vCA0c1pLp1Qt7O0M4ZW/Ozwc0h5rqJrT+BDUJ4t+kBodBs6NbbEWjUVim/kizwK4d4pcCUN2Jw
	Be6NwFaucQSI77fEu/SfETPezxEL/Sk9UC+8SbjJJvoBkD6G5Xn5fH8HzEIalr91lAsR3Em8ewe
	naH22x7ga9OYhwTlktD9fEqp8L4nzkF2B7neafQi5ZNWtf0BpfFRE/nRF5Gr4KHtzIxcqvBXngH
	xbya3jMjn1NXAYunpj7AP7HKwBpQzw/kbulninZg92JYIWka00Oy8HLtgRPBPrt9TPu1rlf9tgX
	/qkmg/RJ3/Q98VVjqL6jg9xJ1UuKl3nIGhQ==
X-Received: by 2002:a05:690e:4147:b0:66d:24c4:3924 with SMTP id
 956f58d0204a3-66d2565d578mr1800548d50.10.1787747591106; Wed, 26 Aug 2026
 05:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824024620.23485-1-kartikey406@gmail.com> <20260826115927.343690-1-horms@kernel.org>
 <CANn89iKr74KHmdbzCmx70NmgFgX=Wd9nR4rYNxyVuenLRz2q7g@mail.gmail.com>
In-Reply-To: <CANn89iKr74KHmdbzCmx70NmgFgX=Wd9nR4rYNxyVuenLRz2q7g@mail.gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 26 Aug 2026 18:02:59 +0530
X-Gm-Features: AcwNN1VgkxDD_R-wslwMIguPhpiD-v2Rl5LwMJ_0qu0085U-wCBjXkmmksdzk9E
Message-ID: <CADhLXY6kzcSu3OypS-oKt2kcAPG1CCE8hq8=mPAe0_0bhMRwAg@mail.gmail.com>
Subject: Re: [PATCH] net: atm: fix shift-out-of-bounds in __vcc_connect()
To: Eric Dumazet <edumazet@google.com>
Cc: Simon Horman <horms@kernel.org>, 3chas3@gmail.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, linux-atm-general@lists.sourceforge.net, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+6665d3db5fef15914802@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 5:34=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Wed, Aug 26, 2026 at 1:59=E2=80=AFPM Simon Horman <horms@kernel.org> w=
rote:
> >
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > Full review at: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/202=
60824024620.23485-1-kartikey406@gmail.com?part=3D1
> > ---
> > net: atm: fix shift-out-of-bounds in __vcc_connect()
> >
> > __vcc_connect() used dev->ci_range.vpi_bits and vci_bits directly as sh=
ift
> > amounts, which is a negative shift when those fields still hold the
> > ATM_CI_MAX (-1) sentinel.  The patch skips the VPI/VCI range check
> > entirely when either field equals ATM_CI_MAX.
> >
> > Closes: https://syzkaller.appspot.com/bug?extid=3D6665d3db5fef15914802
>
> A simpler fix would be something like
>
>    usb: atm: usbatm: fix invalid ci_range initialization
>
>     syzbot reported a shift-out-of-bounds in __vcc_connect():
>
>      UBSAN: shift-out-of-bounds in net/atm/common.c:382:32
>      shift exponent -1 is negative
>      CPU: 0 UID: 0 PID: 5987 Comm: syz.0.18 Not tainted syzkaller #0
> PREEMPT(full)
>      Hardware name: Google Google Compute Engine/Google Compute
> Engine, BIOS Google 08/05/2026
>      Call Trace:
>       <TASK>
>       dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
>       ubsan_epilogue+0xa/0x30 lib/ubsan.c:233
>       __ubsan_handle_shift_out_of_bounds+0x36d/0x400 lib/ubsan.c:494
>       __vcc_connect+0x14b4/0x19c0 net/atm/common.c:382
>       vcc_connect+0x328/0x8f0 net/atm/common.c:498
>       pvc_bind+0x272/0x380 net/atm/pvc.c:52
>       __sys_bind+0x2e3/0x410 net/socket.c:1976
>       __x64_sys_bind+0x7a/0x90 net/socket.c:1979
>       ...
>
>     ATM device ci_range fields (vpi_bits and vci_bits) represent the numb=
er
>     of bits supported for VPI and VCI addressing on the device.
>     net/atm/common.c directly uses these fields as bit shift counts:
>       vpi >> dev->ci_range.vpi_bits
>       vci >> dev->ci_range.vci_bits
>       1 << vcc->dev->ci_range.vpi_bits
>       1 << vcc->dev->ci_range.vci_bits
>
>     usbatm_atm_init() sets ci_range.vpi_bits and ci_range.vci_bits to
>     ATM_CI_MAX (-1), which was defined in <uapi/linux/atmdev.h> as a sent=
inel
>     value for user-space ATM_SETCIRANGE requests, not as a valid bit coun=
t.
>     Shifting by -1 is undefined behavior and triggers UBSAN warnings.
>
>     ATM UNI cell headers allow up to 8 bits for VPI (0..255) and 16 bits
>     for VCI (0..65535).
>     Initialize vpi_bits to 8 and vci_bits to 16, as done by solos-pci.
>
>  ...
>
>
> diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
> index 9600e1ec099304e465dddb00c36817339f538b3b..7b0c791399eaac9ebe00541a2=
c41d715f465a24f
> 100644
> --- a/drivers/usb/atm/usbatm.c
> +++ b/drivers/usb/atm/usbatm.c
> @@ -917,8 +917,8 @@ static int usbatm_atm_init(struct usbatm_data *instan=
ce)
>
>         instance->atm_dev =3D atm_dev;
>
> -       atm_dev->ci_range.vpi_bits =3D ATM_CI_MAX;
> -       atm_dev->ci_range.vci_bits =3D ATM_CI_MAX;
> +       atm_dev->ci_range.vpi_bits =3D 8;
> +       atm_dev->ci_range.vci_bits =3D 16;
>         atm_dev->signal =3D ATM_PHY_SIG_UNKNOWN;
>
>         /* temp init ATM device, set to 128kbit */

 Initially, I was thinking the same way. Thanks for reviewing it. I
will send patch v2 shortly

Thanks

Deepanshu
