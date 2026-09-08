Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8261A58038F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886341; cv=pass; b=f2/WoZn4E8KH0/Gysm3gSpo/NEBdLZardxAviCM0P7uS9vRzXU2C+WezrJmgXcITJmAk0yOYB9MUU1FnLJAbD4xeoq4IF5e2KG5x20oo3KZpEfkSAPyXJnxj0mAgPmhaGFnHQs0DBtNeoWMGrgjqkzxhuBmuA6MdcfyD4h4pfk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886341; c=relaxed/simple;
	bh=RFLo/c30RnwMfBUuWCBomvpXL9tpZs91lqk0qum8yAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PLhBWgBq/eRze7zoPFF5mb7q3WhV1BveeV/bLEpRii7WL82cXiRiAaVgozwHGsxaMmIpfVzXkq5S6XuXyZmnIvG5vUQZgpShJITqqDPAtiRl48lUb0v81t1JTIB5WpjTf3TCKAfhxRkw175j6s6VOG11mAGLnk15eSUgoS+a9e4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lr0dRsjo; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr0dRsjo"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-86162c086f8so47830867b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788886338; cv=none;
        d=google.com; s=arc-20260327;
        b=eEEdKLXvFn/1TaQW7aWKaQA7EeCsiDX+jGiJTPT2aqiCgDsNENvFEDvmPUmGb4BTsX
         uJWyS713V084vGn9BgfHw13tWzR5NcNbVD13x7G/gUxXfe2orEmZ17b4d+t8mV0ojImR
         X9DBoaRpZ8k4Ycxh6qqLXYnilOdK8c0IsG0BOHrZ6IuU9hbq45lUI4LivlZIdYzjXfIC
         aMOo8w9rIs04eJN8KpR160yrtEEqMa1vKebiwK8mEultKc1o5wadHLEDk5Zmxv8KTcX0
         2Wq+exxWlY1GPMeNs6sitrsQK/Hr/38caGikrcmovdK3U/Mj7wsjELUX8NRutFhZjill
         ml3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=STWPWl7tcjtucuQHNVQpu/hRSscdkOJCyxMFTbnlkQs=;
        fh=YIxZXFjI5VSH0CGCVi3RiV4JOrrQpH7AUV8wx06aF0w=;
        b=F7KtlmVxqfJKyMU5MsYuZigX3nnQal5S07vpmy0FkNvR0sNCQbyvanX4iXXinb9TcE
         jQMcjWn+jNthdama9BelzV89oTge4TxoNjBeXFZSSpK5r06x0kyOzZ6lqDQII+6oMgb+
         pFoaSN/EJ9zbtHAceLt31TdljcvAOTSmGnucrhsL48u3XMBWnCNq1zEeujq7acrMiSOT
         QJEnaOO3TYFhqR+Jy57wMBvcOC26FJJOMueEZiQm3sM2dFliwEF7aF3wV7D3xfRfYEnY
         Gw5X7wI2AmSMqUZNttUQUukyWBTn87DGAXUD5/sxGlWiJEUfbOcdsB0QsyjdtkfQQuGi
         JBKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788886338; x=1789491138; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=STWPWl7tcjtucuQHNVQpu/hRSscdkOJCyxMFTbnlkQs=;
        b=lr0dRsjok4EVXmHAbHapvgP9Lu20Ndp4QMk5nHdIdJmJEUQOqZImnrp2lAC9iL6y5h
         NON+VytyJR59tqi+iVpQdofdwpC7Fye/nl2aTBJOIpBW5miRyHwW745Ts78a1GRMFyjY
         ShnTnJOZBFB9MKPumi7S11Ysb7EUbiWxszbtkwL+NfWoOdcHID/Dw3gadVNpoJrDiMuF
         bQ4HscJU4KBYJ3FReNkxn9vaHkOzn4X6c3FQ/9iOMKOsqTNgHb/a3KhUJblKHYKdQCCS
         J1swVHjf/Din3MptBTwytTRNhR74zeZeM78g14YxX5UvYhYGESrvhKo41G6hCetusUsl
         jTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886338; x=1789491138;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STWPWl7tcjtucuQHNVQpu/hRSscdkOJCyxMFTbnlkQs=;
        b=ayz4/udlxUU6Jrgn6uc37pWb/XxRKfi7cW+gYzZXD0TB7Bfb1ZGwya6Krvv0snuxus
         MCRpyqTfjUn6jEJYNTg2TlXZcjYoiE+HqLDbSfK8O2F0yzdj48K9fXGF2m0mfA5Qb8Oj
         zT2/xet3efgz/4iIxyuFlkymz+ikfX3SfimDkWEJnTk7NK2oNOGxs9LXPTUqpa0USxaH
         BlyzAFzwU9U39hisiMOwJLkNUScebxEPwwXESwEC7lL/0hQVww1IAy6qr7asyBG4aD5D
         yy53a0zrjGwv10CqRKwI6RMOwWJm7danxiUgZRCS9/kNZ28x0pdZMzHwlobRLQ2LVI5a
         1P0Q==
X-Forwarded-Encrypted: i=1; AKwUvByLo/NMJzOCqfBzM3DjwaNqt7v6cPqQDND+g7Asv9pwr5BAjD2OYcrhasKJx8+KhkTiI4hVGcLEDxgz9vM=@vger.kernel.org
X-Gm-Message-State: AFuF++licx0MhEVSnGAUXbG2CTET+nW8Z8fNJ7nApdPHj0eWyRuAlhyB
	xhqfE1O5fnJTLHyksGqDhKl6vwxpmm+lB9TUnuHA1NPBzvPV2qvuNs35gohphLpy0tSCxnBJNBL
	/cAsDB/KvtZCFC88CG6A5mIVeKDCP5t33GGyJKP9Y8w==
X-Gm-Gg: AYBFou2TOZXt0U2BrNgI/OlRGsiIJz1NB6unSQYq0H3gpfBEVnQsWsaI1PsUjN8QAax
	0WLohpDbghwDtnU0v+JMHzKSFaQArEmQtQjKKra4tEGXhT66kD87uU+37j0v7PlIXu/qzOwUEaT
	ZCuBxMjzxvrVjsut7MXll46DfHrLq/MfwQPmdGLL9A1FNUjjbK9zKYfNYcyWTOakYmm15fCzRax
	aNyGGQAUJ4FOTDeg+62yl+ik9Gh93NFd6z2wDdNUEGgiZZNu7j2SSp5xHYxNbebazPCjLApPoq1
	lsYLYRhbgPQn+wd9TrkSH9zPU2MgqhXdBHYgElUqKqdPCnV0fYjJzdgHpLQuMiVFOHJAs7ksA3+
	t0rprYU3WOPX4tolATO+6J5viFbcROKI=
X-Received: by 2002:a05:690c:e297:20b0:870:ed34:2880 with SMTP id
 00721157ae682-870ed3429e6mr76477807b3.13.1788886338275; Tue, 08 Sep 2026
 09:52:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-btusb_qcc2072-v3-0-1f65350b03b8@oss.qualcomm.com>
In-Reply-To: <20260907-btusb_qcc2072-v3-0-1f65350b03b8@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 8 Sep 2026 12:52:06 -0400
X-Gm-Features: AcwNN1VOCIt3sE0BX0rlzhyvMWwTxZtmr-A9s8oAuCxpg6Qw_iufvQTIhDARuvU
Message-ID: <CABBYNZJdJ9Tcv0Yvi2WRvOgKXc5ghLubMArHuPFdArd6UweskQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Bluetooth: btusb: Support Qualcomm multi-subsystem QCC2072
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Zijun Hu <zijun_hu@icloud.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Mon, Sep 7, 2026 at 4:45=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.com>=
 wrote:
>
> Hi Luiz,
>
> This revision addresses issues reported by Sashiko. Fixes are listed in
> the changelog below; false positives are addressed as Q&A further down.
>
> Could you take a look at this new revision when you get a chance, and let
> me know if you have any further comments?
>
> False positives (no code change):
>
> Q: Does this explicit padding with null bytes break userspace crash dump
> analysis for btqcom_submit_memdump()?
>
> A: No =E2=80=94 this header is internal and appended as dump data. Its fi=
xed
> 512-byte size is enough to delimit it from the dump data, so it doesn't
> need the text end marking like the external file header.
>
> Q: Does mixing goto statements with guard() declarations in
> qperi_try_wakeup() violate the scope-based cleanup guidelines?
>
> A: No =E2=80=94 all the gotos happen after guard(spinlock)() is taken, at
> function scope. Since every goto stays inside that same scope, it
> doesn't violate cleanup.h's guidance.
>
> Q: Could this cause a kernel panic if a zero-length packet is received
> for btqcom_recv_vendor_pkt()?
>
> A: No =E2=80=94 not reachable from a socket write, recv_vendor_pkt() only=
 runs
> on the RX side. And skb->len can't be 0 anyway: btusb_upward_frame()
> pushes 1 byte onto the skb right before tagging it HCI_VENDOR_PKT.
>
> Q: Can this lead to a null pointer dereference on the transmit path
> for btusb_qcom_send_frame()?
>
> A: No =E2=80=94 skb->len can't be 0 here. Both producers of a HCI_VENDOR_=
PKT
> skb already reject zero length before reaching hdev->send():
> hci_sock_sendmsg's "len < 4" check for userspace writes, and
> hci_send_vendor_frame's own "!len" check for kernel-internal senders.
>
> This patch series supports Qualcomm multi-subsystem QCC2072. The first
> 3 commits are simple dependencies of the last one.
>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
> Changes in v3:
> - Remove socket option BT_RECV_VENDOR_PKT
> - Fix heap overflow in hci_send_vendor_frame()
> - Fix a stray NUL byte in the memdump file header
> - Fix PM reference leak in btusb_do_reset_work()
> - Don't mix goto with scoped_guard() in __qperi_tx_sync_evt()
> - Don't mix goto with scoped_guard() in qperi_handle_evt()
> - Prepare btusb_qcom for bulk serialization mode support.
> - Link to v2: https://patch.msgid.link/20260830-btusb_qcc2072-v2-0-5c0e0c=
9dd98b@oss.qualcomm.com
>
> ---
> Zijun Hu (4):
>       Bluetooth: btusb: Add recv_intr() hook to btusb_data
>       Bluetooth: Add generic support for vendor packets
>       Bluetooth: btusb: Build the driver from multiple source files
>       Bluetooth: btusb: Add support for Qualcomm multi-subsystem QCC2072
>
>  drivers/bluetooth/Kconfig                   |   14 +
>  drivers/bluetooth/Makefile                  |    3 +
>  drivers/bluetooth/{btusb.c =3D> btusb_main.c} |  126 +-
>  drivers/bluetooth/btusb_qcom.c              | 4514 +++++++++++++++++++++=
++++++
>  drivers/bluetooth/btusb_qcom.h              |   99 +
>  include/net/bluetooth/hci_core.h            |    5 +
>  include/net/bluetooth/hci_mon.h             |    2 +
>  net/bluetooth/hci_core.c                    |   45 +
>  net/bluetooth/hci_sock.c                    |    8 +
>  9 files changed, 4814 insertions(+), 2 deletions(-)
> ---
> base-commit: 755cf7adf8dd2d12627cb7de223d35b12228e2f5
> change-id: 20260824-btusb_qcc2072-abb918ab4220
>
> Best regards,
> --
> Zijun Hu <zijun.hu@oss.qualcomm.com>

Sashiko flagged a few more issues:

https://sashiko.dev/#/patchset/20260907-btusb_qcc2072-v3-0-1f65350b03b8%40o=
ss.qualcomm.com

--=20
Luiz Augusto von Dentz
