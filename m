Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAA64611CC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054726; cv=pass; b=lNbjm+PvLe5btA9WsbieITmWraQzS5B1AQN76qBH0DObAL0y7WGU3CgmCJiojN5h5ToMZ5yNAsvzx5UIAjNAnpLU1YRCVlAwaBveBlvnaiI5h8Dwf7Hpdfs8+HYAHqjnDtfe1EaOwTXbge8zVg+ZEuH9MjXcJ5PIYgL4twukSUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054726; c=relaxed/simple;
	bh=URmlO+EoAEJicOWMjquP6tOAtrvwmlKFbsXG+rYPkI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZFAPPDWyKc2gqFxRxUV6SKqrgUwrPOULZiadrw3iqd7iytAiFjM25MQCM5dad8uZiFSEV4H8hn7axoVLSMWVc6wSDvujVBO8i4W8MaWRNL/jB+gqNJgQbQkA4S1FjhIph4KYEdG83AYJlr26qcWMxwW4aoJ9LX6PayM4d8Dovk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBVPHkwd; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBVPHkwd"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-86d43cdee51so92064257b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789054723; cv=none;
        d=google.com; s=arc-20260327;
        b=KWZLdnX5sDukoK/VxINqdaKKAxkpoQ3rRA77Nz204jvd7Qtm2zE75mIH2h8qJLlwje
         CJLFFfbNs6tnppAWe6tp3nwZF9AXauHVqbT4h98cXrk3BK9BsZteBZjQ+pDxWiFda+/F
         PCOyCXu9TWDuCAi96fE86TLIfmhBzCa3BHnTOf1nILrGAtaPohj7CHcbsjRQkUhUT4xT
         Zgk1vp5nacW/cDYJcjATzu5ufxrAOH+n8Kb0PyLurmZLGv5yUxawOJkDxulBMigiGWtd
         jZHNxpZ5JLViR8aTB6iT5AfGBJrA2DSGMZOYhXEkFZ3JxXgRXvBWO2N8sT6NibJ4C5mx
         TXHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBAKmcjb5ocMGP/6wzLbwk9f9eHsHJ1cNNNXholeTXY=;
        fh=3S4kSiShMEDPgxUM09BcCOsyB+Vkb1zAzJ+NtXDmV5A=;
        b=Qiz97ZHETU6F31T6EdF0czMhFk6HQ/VGnn7Fi3GJsdTzlxp5udGyqW2Dojx9xq+ezL
         EXbKVQVFW7xhTaXEO8InLCiP1s6wCKwkuyyCeKT+27RowY1hTVr7yn7Vu3rHnLOAFXrg
         MIoGV0FoTgOosIG5iugq6K8VmWdBlb6lF/lr6FqbXtNPwP00H5iAyIB4oTPoGreR+LX0
         CoUisGFyggMQPcS6rhsULe3HLLnqin6c2/THSeH7nFjBrlLq4IiSQ3AQF2s9AlYvqxcK
         SgLhX4giU/6F/RgZJCb8SEOcYl0mxnS7oK6D777aXH/IMBb2eyP94CHE42HDN3MXvlRB
         kH3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054723; x=1789659523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBAKmcjb5ocMGP/6wzLbwk9f9eHsHJ1cNNNXholeTXY=;
        b=bBVPHkwdcJmAuMPq2m1Y8uY5840rcsB6gaKvpAeHcAsrbz9UtgKGdQ6S+sB2Ua8Nlq
         S/VgTHZLwqrfzMsBUDgS3ZWk3GsJQJk2HAX6SDUJ28XyNxVztOqvOBjLGjxFeeKEH1CM
         inB4jHqLPceF8WdsNXslOelbzQZTQOU7Bbzp/6S+7iMpXgEG34zeDvrKLv9/eLmSslc5
         4wavyHId8nNRA1vBZiHIyKFUji+WFl5MSyTpkQkbgaA5pBg5wr7pTNCpwKF2lg52hBOH
         99jmt6loMbuoWS2MtLifvYMWC/xGJQ93RLhb2+A2RE6yZ6rjuRwio7UzAferi+m8ugZ3
         ZtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054723; x=1789659523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBAKmcjb5ocMGP/6wzLbwk9f9eHsHJ1cNNNXholeTXY=;
        b=KYcIIDV3QjVQx/sjmNUhz15nALE40tw3OOW7QePJwHoj36cs7fOc27CceBxQUtqjEf
         Af4uM+2vS4ubQFf1ettUkT/+KiuJo7YX5yXEm3tQLa5nbTWOKS1brY8E1cdoRMNevHMw
         C6eUWyKhr5A0csYh116PyiY+QiAFfdglDS1A5jIB1I7sPCl/hx70EZQ3uKM01mLNnk7x
         IBndaBDlTPvVBA5fp2xxY9rHIsSeTZeYog5YcvIROujfjWovVPREEKXU2CSgJrfFaYti
         1/N2FB3FrNWHXfGH/FKKeVfA90QKIhJQGeZTncHhQtzlhWev4SnRu0hnjGXgsTZJPXAu
         Jq+A==
X-Forwarded-Encrypted: i=1; AKwUvBwxcRfFuhZYCf3+4cmB/Vxht9k4KUUuZmE5oTotXTeJnpTkeUIwkoWZYwgNeF/s66yf3r845LnKGwThBnE=@vger.kernel.org
X-Gm-Message-State: AFuF++lhpiItQKXdX2gBDsQRDFPo2vO/3TiBE+yuvPos1a0DjS1fphj6
	id3ncJOSfw9AhOWweBm7A5fdl3r0Ll5P1zE85p3Z8VyNl10JduaCbSlkzGsDsim2/L/aLrgR0fJ
	qaTRUU05WiQdl+ICvfq4Xnl4SsDxIr8w=
X-Gm-Gg: AYBFou1HbelQ0/pOo/F/kOp7O4o1NEajsZhYSWkw8IzWfJVMtld13L2ZAJ2llRpc9IM
	Gb0jV2QzpcD9RGYQXUBNN4AUdUfT07vdGR8cB8QDmWV7JWapgCjhU/eb13xbjVrLbJO7EgIuNGb
	KFy7K7WXvBt5j6zJIQpWk2qlAx/9U6m4rCZtR3davfVAK5mVm2TnhwOGmjHJ18YpgRZfaYWVZXM
	3QvhAR5LHHnHvTKT9VMMCkGwAxXa0oiY2FG/NkIg0uILutdHkpYEutz+KB5ZxRhZ8doPM2Anej/
	0y/Nc8SdJixYl9805s51TjeGzhVwpjW3g0ZrYIKtmVdcCxVKFm06sbew6fK5Drh/bfIpqGnmnJm
	+uHFp+D/WYxpFBCOYLCPpPYLEuPe8nCWUVojB385uJg==
X-Received: by 2002:a05:690c:e0c5:10b0:81e:6a10:f90f with SMTP id
 00721157ae682-8712a228f92mr127550027b3.17.1789054723044; Thu, 10 Sep 2026
 08:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
In-Reply-To: <20260910-btusb_qcc2072-v4-0-e78f04b7675e@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 10 Sep 2026 11:38:31 -0400
X-Gm-Features: AcwNN1VPh33tL3sVlU_J_-VwtCGjA8358iRNI9Zj9P6chsWF1NydzrXIvNalAg8
Message-ID: <CABBYNZ+Xn2+9R7F_+9S9+SHeYm9pgtaSoS0=O2JA2bdtzfoang@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Bluetooth: btusb: Support Qualcomm multi-subsystem QCC2072
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Zijun Hu <zijun_hu@icloud.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Thu, Sep 10, 2026 at 10:35=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.co=
m> wrote:
>
> Hi Luiz,
>
> This revision addresses issues reported by Sashiko [1]. Fixes are listed
> in the changelog below; false positives are addressed as Q&A further down=
.
>
> [1] https://sashiko.dev/#/patchset/20260907-btusb_qcc2072-v3-0-1f65350b03=
b8%40oss.qualcomm.com
>
> Could you take a look at this new revision when you get a chance, and let
> me know if you have any further comments?
>
> False positives (no code change):
>
> Q: Can an empty vendor packet cause a NULL pointer dereference in
> btusb_qcom_send_frame()?
>
> A: No =E2=80=94 vendor packet's skb->len can't be 0 here. Both producers =
of
> a HCI_VENDOR_PKT skb already reject zero length before reaching
> hdev->send(): hci_sock_sendmsg's "len < 4" check for userspace writes,
> and hci_send_vendor_frame's own "!len" check for kernel-internal senders.
>
> This patch series supports Qualcomm multi-subsystem QCC2072. The first
> 3 commits are simple dependencies of the last one.
>
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
> Changes in v4:
> - Fix memdump timeout blocking btusb_qcom_reset()
> - Fix missing build information on driver rebind or resume
> - Link to v3: https://patch.msgid.link/20260907-btusb_qcc2072-v3-0-1f6535=
0b03b8@oss.qualcomm.com
>
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
>  drivers/bluetooth/{btusb.c =3D> btusb_main.c} |  127 +-
>  drivers/bluetooth/btusb_qcom.c              | 4542 +++++++++++++++++++++=
++++++
>  drivers/bluetooth/btusb_qcom.h              |   99 +
>  include/net/bluetooth/hci_core.h            |    5 +
>  include/net/bluetooth/hci_mon.h             |    2 +
>  net/bluetooth/hci_core.c                    |   45 +
>  net/bluetooth/hci_sock.c                    |    8 +
>  9 files changed, 4843 insertions(+), 2 deletions(-)
> ---
> base-commit: 755cf7adf8dd2d12627cb7de223d35b12228e2f5
> change-id: 20260824-btusb_qcc2072-abb918ab4220
>
> Best regards,
> --
> Zijun Hu <zijun.hu@oss.qualcomm.com>
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
>  drivers/bluetooth/{btusb.c =3D> btusb_main.c} |  127 +-
>  drivers/bluetooth/btusb_qcom.c              | 4542 +++++++++++++++++++++=
++++++
>  drivers/bluetooth/btusb_qcom.h              |   99 +
>  include/net/bluetooth/hci_core.h            |    5 +
>  include/net/bluetooth/hci_mon.h             |    2 +
>  net/bluetooth/hci_core.c                    |   45 +
>  net/bluetooth/hci_sock.c                    |    8 +
>  9 files changed, 4843 insertions(+), 2 deletions(-)
> ---
> base-commit: 1b737f2ef1686d0e5a7661eaeb097aad53ea7040
> change-id: 20260910-btusb_qcc2072-7ad665e4560a
>
> Best regards,
> --
> Zijun Hu <zijun.hu@oss.qualcomm.com>

There seem to be some new problem being flagged by Sashiko:

https://sashiko.dev/#/patchset/20260910-btusb_qcc2072-v4-0-e78f04b7675e%40o=
ss.qualcomm.com

If they are false positives, please add comments so they are not flagged ag=
ain.

--=20
Luiz Augusto von Dentz
