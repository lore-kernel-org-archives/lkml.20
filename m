Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5558A47ACCA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394262; cv=pass; b=PT+8JMBvd3oLkJoK10UhgMbf7SsnNxvZx3s0aiZMsDTPopxeSG3MtYOTL99f+fmq7FQI+6X91nE3wG9Ykdj3rUH1FXMG8MW59QO1gAxjehedbXjCDxrrG8yP5eA5zVeGQqoSfcyQ4b1HdeNrDG+8jxKKWVkOfoFQd1s6SmjpXrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394262; c=relaxed/simple;
	bh=lJVGF2MrIGJ6/Msnkutl7Ct5nsmA8aoi6v75pv+4DMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk3nNyU+NheQW57fXRDfB03r+XV+tBA1WbZMqkucFus0daho25i8krrFFkqA1wQO4XGwjKPBFbEmxm4khf8LO02gnRk3vPb02cXW9gFwGBt1zFO2z6HQIpLfai/+jGcgFdcFCd+H1yz5S+JPOQOlf4o3768L3kbVJgT+ve8lybQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GR5DFjcL; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GR5DFjcL"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab19125so1798013d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789394259; cv=none;
        d=google.com; s=arc-20260327;
        b=fd3zcCFDinXjCZcvFqSSjnTIl4lkrzRya3I+SEBQyNCXlHoF01vcVPtE2X/znj7zjS
         o1Ci2ApPPY63SEXDVmhUoHQsqA3DtVcbir4I6euMwejF51/dxkg5MVc4aA93osPvUcYO
         I0cEVpPdu+5nAFqT1Yp2geIp1lU3GxOJTmZ9KixPWx3W5u3yjiXETJR8skKclqL03spe
         B9X9zPCibtS7icCBPNk3PToeBKKTC8gBcqCIu2fo19UtssS+T4dqRe3SOmiIMartr9Dj
         CKM8eDFOoJBk0NSA9Mx11NxOnMEwIkpoE0pcX287nI4swYFQIZ8T4j5XCryTg0s8kzYm
         gDTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ngouuzk5nO0PMiFaSO3Ww6fwWjCxaG/P3WaLVlqRSMY=;
        fh=TDJELKGRBeKvENy2m8KxSbUiWmy071OJXyxC/u/4jUY=;
        b=h1EQX53iSgtlnUEXMFYrE1kUHrD62t3IIqecExaslsifOjbm2tcDvBquqLHa8Aoupk
         oFi+tUSfR9mRuiUmEehphXZv4RwmcQng2C66rhJzBKuK5VwqdD4+m7hYUyxARaGmc07l
         P5ZDqDVabXfGbeh99NS+SFO0vFHSHeVvyQeFUKf6A3oQV0VWI7PkFtKBoud3mbcYDJnj
         FA//cat912IJJObTeG1ySHzUCQSbwVjATKfd//SP172KEAMxtd47eNW8hzgI9T/9fNDm
         MnKVWkZdLr923jG6P6lavezFoI4QLeMcpLp9D4zC7khPnMePLee1ShTSpSxDKDnITz9t
         hHZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394259; x=1789999059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ngouuzk5nO0PMiFaSO3Ww6fwWjCxaG/P3WaLVlqRSMY=;
        b=GR5DFjcLwn+Z2Y3Yx4nSLtFkwK5akafc1wS5yfDLCq9YHk8Ze5AUVZGy34hMfoKrhy
         exjw0Fpu2LIkEDHEfcSQZVir79wjexW5HexNaJiHqDYyD8hcW+zO/0/9gwUr430v10zZ
         3i+G/8b3Zt8WF31PYUPrS4LLcg6u5uKVBkGQriB9FqIeRE9Lnp69YiqGMvOLgkXRzGwg
         sFxutF9ku2F1iHAA8aCowTI8ExVCYGGuVYulhvNBF4/Dg+mamia6vnPeVHwd89b5X3A3
         C/EiHdBBrq4FBpr3r9O82xY8XMDs5dGItC0fNPxWVbou9EBsuBHFcH6rv34FjUs+aKwT
         Tudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394259; x=1789999059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ngouuzk5nO0PMiFaSO3Ww6fwWjCxaG/P3WaLVlqRSMY=;
        b=avNKOiKyvPgNZh8Km6CnqcQw7ZGTw3SDoiAjZly++npU2/hARqux02G7ujvFlYHaXy
         InvfVI3U+xee9AeGIK/XhqNYoc8Kxcpeny1RsezqX9BQUHTFJSggIbyVEj4RA3+9Xr5X
         5VZK2G/SiClwJ+GJq4NHtgqQoxwhA6wEY/S6eyYIzHZaWHecYNdA7t97qJS3/bk5nBlk
         AX+0Rj5PCzuIIfwW7ybk7NXym5lnMlABcxD0zT864eTbtWuoi+13n03lwKBumYkrOCyX
         hIZcKS9Uhk6Jci0azIOiuWJ5Gp+shWBRbWV892G0xc08eElZayXPkJwN7HXh+JkVhi3Y
         8WsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp6dWiDFmhpfBUWLDpmGvwmJM1mY2atu4nH507OYKjZ9JGDnYUFUhv/oi4Y366MISXLLEZ/HyqhTQ6rj0=@vger.kernel.org
X-Gm-Message-State: AFuF++ktN10euIeL+3VGpl2QH6CcyTyh19qjC7K5FlEyV7b86HVmYQpp
	4u5XReaKpYTOl9WQfSkQj+VUk2HY5cGjVCbU9MaIlfY6cpg+ySciFhT3T2AF77PxXTOwd7LEps9
	f9wQWSOnvI/xIdjyHklVa4L8ZTSTOTxA=
X-Gm-Gg: AYBFou0pNy04zuKdvhU1bf6fux4liEcikldkbS3VC3JoA6aBwLVz4mLpNVBjVIIs8uo
	xXOlesKZe3cCT017ndUmWqzrSsPpcV6/F8nksRQIi0KfvyEu19UhkE//3Tze133av+1gTvdW5NU
	x4A1eXEILltynpVA89FjgXmf+EkVI/3jGt3lUWTs2hFB1EDOtPlgREGDtPDCDwSf4fWO6cou33h
	LQ8Bt+GOtetDaUTN78NOV5tbRRphYb2rx4ULOYMUufLPbkHK81vnQhySmqL6wHA8yGH/ICgpIqH
	R7yuUyRoceZI1PrtywooImuudWFgCtD5pHnv6jaMk1QBg9yNCFdgh8aTpHTk0nIsYN70t7XKwSw
	AGkpR9A0ZPmsZxcxV9QEmnjWDmN1qz+HcXgP1bzD3dvrEdOTNC/nr
X-Received: by 2002:a05:690e:1183:b0:671:61a:eafc with SMTP id
 956f58d0204a3-6714dfc990amr984009d50.2.1789394259157; Mon, 14 Sep 2026
 06:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com> <20260913-misc_fix-v1-1-558c1e4028b9@oss.qualcomm.com>
In-Reply-To: <20260913-misc_fix-v1-1-558c1e4028b9@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 14 Sep 2026 09:57:28 -0400
X-Gm-Features: AcwNN1UlvJrqDr-FHzd6LRUOZnDSIpfdPmPIufIaHT4FMUT4Dsw_TxMkpXL_CEM
Message-ID: <CABBYNZ+ZUXkSO6ybT03vRCE_1Mwzm1hkbHqrndm2qL0mTLh0dg@mail.gmail.com>
Subject: Re: [PATCH 1/4] Bluetooth: coredump: Fix skb leak in
 hci_devcd_append() stub
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Manish Mandlik <mmandlik@google.com>, 
	Zijun Hu <zijun_hu@icloud.com>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Sun, Sep 13, 2026 at 11:43=E2=80=AFPM Zijun Hu <zijun.hu@oss.qualcomm.co=
m> wrote:
>
> For hci_devcd_append(hdev, skb):
> it consumes the skb when CONFIG_DEV_COREDUMP=3Dy, but its stub does not f=
ree
> the skb. this inconsistency causes skb leak when CONFIG_DEV_COREDUMP=3Dn.
>
> NXP btuart device driver encounters this leak:
>
> btnxpuart.c:
> nxp_process_fw_dump(hdev, skb)
> {
>         ...
>         // the skb_clone() is leaked.
>         err =3D hci_devcd_append(hdev, skb_clone(skb, GFP_ATOMIC));
>         if (err < 0)
>                 goto free_skb;
>         ...
> free_skb:
>         kfree_skb(skb);         /* frees the original, not the clone */
>         return 0;
> }
>
> Fix by freeing the skb in the stub to keep consistent behavior.
>
> Fixes: 9695ef876fd1 ("Bluetooth: Add support for hci devcoredump")
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  include/net/bluetooth/coredump.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/net/bluetooth/coredump.h b/include/net/bluetooth/cor=
edump.h
> index acc1849f66c0..07940a1d5dd4 100644
> --- a/include/net/bluetooth/coredump.h
> +++ b/include/net/bluetooth/coredump.h
> @@ -103,16 +103,17 @@ static inline int hci_devcd_register(struct hci_dev=
 *hdev, coredump_t coredump,
>
>  static inline int hci_devcd_init(struct hci_dev *hdev, u32 dump_size)
>  {
>         return -EOPNOTSUPP;
>  }
>
>  static inline int hci_devcd_append(struct hci_dev *hdev, struct sk_buff =
*skb)
>  {
> +       kfree_skb(skb);

I don't think freeing it here is a good idea; in fact I think the bug
must be fixed in the caller so it properly frees all clones, etc,
actually it may need to check if hci_devcd_init fails and stops
cloning and calling hci_devcd_append as a result.

>         return -EOPNOTSUPP;
>  }
>
>  static inline int hci_devcd_append_pattern(struct hci_dev *hdev,
>                                            u8 pattern, u32 len)
>  {
>         return -EOPNOTSUPP;
>  }
>
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz
