Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8C03D7D69
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394763; cv=pass; b=hmB7Mz8URigyXQN5+kTPKLv0f2t89ej1nNi56x7mZEqW01WPYeQ1WLZAWv63LzbfLD3VdmYq1uW3OzRYmHu466Wc2vKg/JKK/XYfM8CuDwmz+kBcMtO9VI6di7eriybD392yYTZkDGfcL0PJr7rdq0tfevpHSL/NCkVXzyC+FTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394763; c=relaxed/simple;
	bh=Hmk0hio/+v9Sq6QCGLY1Vj7O+t7pbTMdbPT8rsUVCRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SC4oSlYBMBZx1sN/Cqp6nx7PsX1GOR0XVZcvbUBeE5zxr3J8XJobUumAlOzbw0u+t/nmWXXSewZZIEQHxPT9QHdt9eoTjBHx/zaca89YtrVxkwqIDGyUS13g/cqdmbNmE1KeuIhhsCSx5vR/NaRigRW+lub77/gR+JUhPytR2nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QBN05uFD; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QBN05uFD"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8871ada1a26so17606627b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789394757; cv=none;
        d=google.com; s=arc-20260327;
        b=KLy72WPjw3iHf6vpnGykNKG+Ne01I4nmkPbIsR1+2bK8gxvSAEQmWHDMDHOH3sriNy
         AU+6aau7MSFQ64OjT7Z9DImR3HuAkct1jhr5szO1Nksm1+xAtrxhl2WuWtZybdmAFCd3
         JfJzFy4SVJegwdXAhKjn4TZLnE3+oHi6elAKQqfleDPafoYxzMZxKTc6WDxHxkhofk2q
         aE9zJpp/kbCaS1H5OiQnbYuCnKaSlW8iQxIi3pxkRsPWsTCry5OdcZBBe0FfgPPY99Jg
         W7zpKrG7hwzFCnNLZGJLzA4KkVtPpnmw6qorLZN9etg6q5es/1CukXGXkuymYU148UmC
         QIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ptvwdsSJglQVzgKp+FYr9aouOwiPCbztkA+vkBu9aAw=;
        fh=C83fktjAX2aABYF7K0R8jf8nF6/sDrcEhLq4HsvCxL8=;
        b=PkqLxGa5y9Oj3fqqnP5C0mZGYa975SFTjdFV/Peqa468DprO+gW2KFxbDwTysH1etf
         KVeEkPRYgqU/eDTUXYTTyl0hDb6kqQXzw286glA1rC4+Yjsp7wxExEFsSsmX22fr8ONW
         dnpsJjNOBTeq4jLwA8injWKS7SoF5fyZlRWbfRvST2NMBUemtFC4L69q6LbvfSvqaapv
         XDY7GVi5ozfvqhCAgf78QU8bGMAsW8PRn57b/C1veVsi/GhvrOySS/PzMzAoa22KoxFa
         7p9SF07Izc082UN3Oad3leWDKbH1xAoyOW/tiGR0+P0izeOfOmshzIsRIjz2jmQ1oFVC
         zkxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394757; x=1789999557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ptvwdsSJglQVzgKp+FYr9aouOwiPCbztkA+vkBu9aAw=;
        b=QBN05uFDIn0aCXfDOptPcLLBREyrx1YM8BeLmtx9FnuD6FALkqnRsq4PXGINSdxHjI
         6bTCpo885oWOdoMhKOaTEUTjv1oE8vEkYYUBhwKP1mOBlxguF9ARmNcX4RXMPqlccrlH
         QyLtdLFV8pTtrLaFZ6WOLTrtsR7NBYO2ZRjnaqqruDEuXd1X1SUlBLLeUlF22XQUkqSd
         OUuZ3Wf3mu32Q0Rh1XRf7q17XRAXXOkehD52UZLBaTQKcKkFYLnSTkcFHvntOSadmpWh
         sWpdx9fURPsumyV104BF/Ce1uH+/OJVIdvKZQbrw/RJKBQsTxhbqukJScCBu7ElgRaSh
         xiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394757; x=1789999557;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptvwdsSJglQVzgKp+FYr9aouOwiPCbztkA+vkBu9aAw=;
        b=qs1V6Jhrugbgfz3ZKScG3fia6qcD3VnZlu/YVnprYY55jRR01HPoE7lZ0BSJBr+c4P
         4EF2Q/33ygZ0OAPozEdKR7ESWANBtdwt+Z6M6BDxUFWtAoCyShiPJlByMkGGtqJYjG6Y
         jpQnIHnUnB3csRVZQOI7rTF/0EBX0CVHA+DhUBvAsrK+GtgBr4+me42oelh1U8JAlgNN
         QxKih+QWV390H7WFwg8NQKskkwvK8au2bb9+/c83ZBwKClBX4vWcOItBG34ueCjy6q+0
         aN4k4IfarCFK71sGzvKKdx+wsVSVNwoNffZNOhORKpSi+l+zN4LE6Lk3R3kApG+7WZzQ
         Hg8g==
X-Forwarded-Encrypted: i=1; AKwUvByrTbXe0LITTLACD0LnzAXCY7ffDcZLPKFjmmoJRBV/YBRD1/3yecUf5Uxf/EQRa0oprHK42jiECgcjHy4=@vger.kernel.org
X-Gm-Message-State: AFuF++mJMrpnaEWv1XLQutLzAIqc9DWy3lwSFz2kcq+EkBj7OcCNqWBE
	hsClU5UewTD22a0KA68nI6Lc7n5sbo+M1LupIVtif3sOEuzA3z25x414jBwpU9uAL1bmFU6wuYu
	F8V2QzeJqnCpeJyBKwFCaq9wfSu4UVgc=
X-Gm-Gg: AYBFou2bXnNAXLd+Xdk/Dp1cEvcspLRXAT/1PYRokjDF55EqQU2/rAFfvO5uCO9M0c3
	iP9KzVtByna9exBrTmVv1KHh/TtIJFM7oBseHjyJdHOr4hBC2vgqyTnSPtkwUVCGVsKn+28EA+z
	mbLkFLShNNlSIJ+laYAlao01NHezRR3G9ahNsj3ms2VDzbmwSBW2PoXdwv0WnX9/pbZ/aZO5y9i
	SBIuJiutXDv0eKsFzImpigzcy4BOCAv8JEwYWeBasegM+vl3jEBK0gGFK9rb0lzIovbpg5xJpt8
	bnekPI2rVqQU7c/KKQTMaxxb7NKK499AA1uF2jhPQFXmIxzGh8aZOEgVQT/kB4aPtS10dNc/RBz
	4B2yZu2gB57U4fu5J5Cu3xVDmuHmE8m/H4nI72wzjMg==
X-Received: by 2002:a05:690e:d8a:b0:671:1880:17ba with SMTP id
 956f58d0204a3-6714e1a228dmr572822d50.90.1789394756676; Mon, 14 Sep 2026
 07:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913-misc_fix-v1-0-558c1e4028b9@oss.qualcomm.com> <20260913-misc_fix-v1-2-558c1e4028b9@oss.qualcomm.com>
In-Reply-To: <20260913-misc_fix-v1-2-558c1e4028b9@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 14 Sep 2026 10:05:45 -0400
X-Gm-Features: AcwNN1X4x2Jn_HQuWP1CvY-sUU6PZRXZ8e3BCnElDU8YY8MEUBdC6jcAj5uupHA
Message-ID: <CABBYNZJpwkbFB8E4uHu4AcHjtR8R0CKnhj0Zesf1umoLyiqecQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] Bluetooth: coredump: Fix btmon heap-buffer-overflow
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
> The collected coredump data can exceed btmon's maximum packet size of
> 1490 bytes, But hci_devcd_dump() forwards the entire coredump data as an
> HCI_DIAG_PKT without checking its size, causing below issue in btmon.
>
> Why ?
>
> For a monitor packet, its payload length @len in header may exceed
> BTSNOOP_MAX_PACKET_SIZE, btmon uses it to access payload in @buf.
> so cause heap-buffer-overflow.
>
> Kernel:
> include/net/bluetooth/hci_mon.h
> struct hci_mon_hdr {
>         __le16  opcode;
>         __le16  index;
>         __le16  len;
> } __packed;
>
> BlueZ:
> src/shared/btsnoop.h
> monitor/control.c
> struct control_data {
>         uint16_t channel;
>         int fd;
>         unsigned char buf[BTSNOOP_MAX_PACKET_SIZE];
>         uint16_t offset;
> };
>
> Issue:
> ERROR: AddressSanitizer: heap-buffer-overflow on address 0x51b00000065c a=
t pc 0x7f50b987a029 bp 0x7ffde88dc8d0 sp 0x7ffde88dc088
> READ of size 17916 at 0x51b00000065c thread T0
>     #0 0x7f50b987a028 in write ../../../../src/libsanitizer/sanitizer_com=
mon/sanitizer_common_interceptors.inc:1096
>     #1 0x5b4f3443ae3a in btsnoop_write ../src/shared/btsnoop.c:289
>     #2 0x5b4f3429cbf0 in data_callback ../monitor/control.c:969
>     #3 0x5b4f3444fa9d in mainloop_run ../src/shared/mainloop.c:104
>     #4 0x5b4f34451da6 in mainloop_run_with_signal ../src/shared/mainloop-=
notify.c:196
>     #5 0x5b4f342953fc in main ../monitor/main.c:303
>     #6 0x7f50b8c2a1c9 in __libc_start_call_main ../sysdeps/nptl/libc_star=
t_call_main.h:58
>     #7 0x7f50b8c2a28a in __libc_start_main_impl ../csu/libc-start.c:360
>     #8 0x5b4f34295ed4 in _start (/usr/bin/btmon+0x29fed4) (BuildId: b41ca=
afb24db693946c283eaea48112186863d2d)

This probably needs to be fixed in btmon if it attempts to read past
the buffer size. Also, since it now supports vendor packets that may
not be limited by HCI packet size, perhaps we should allocate based on
the channel MTU which probably needs per-vendor configuration to allow
collecting its vendor packets.

> Fix by forwarding the collected dump data as an HCI_DIAG_PKT only when
> its size <=3D 1490.
>
> Fixes: b257e02ecc46 ("HCI: coredump: Log devcd dumps into the monitor")
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  net/bluetooth/coredump.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/net/bluetooth/coredump.c b/net/bluetooth/coredump.c
> index 71fc8dab4004..61b45ba58a65 100644
> --- a/net/bluetooth/coredump.c
> +++ b/net/bluetooth/coredump.c
> @@ -250,36 +250,43 @@ static void hci_devcd_handle_pkt_pattern(struct hci=
_dev *hdev,
>         }
>
>         pattern =3D skb_pull_data(skb, sizeof(*pattern));
>
>         if (!hci_devcd_memset(hdev, pattern->pattern, pattern->len))
>                 bt_dev_dbg(hdev, "Failed to set pattern");
>  }
>
> +/* Align with BlueZ's BTSNOOP_MAX_PACKET_SIZE. */
> +#define HCI_DEVCD_DIAG_MAX_SIZE (1486 + 4)
> +
>  static void hci_devcd_dump(struct hci_dev *hdev)
>  {
>         struct sk_buff *skb;
>         u32 size;
>
>         bt_dev_dbg(hdev, "state %s", hci_devcd_state_name(hdev->dump.stat=
e));
>
>         size =3D hdev->dump.tail - hdev->dump.head;
>
> -       /* Send a copy to monitor as a diagnostic packet */
> -       skb =3D bt_skb_alloc(size, GFP_ATOMIC);
> -       if (skb) {
> -               skb_put_data(skb, hdev->dump.head, size);
> -               hci_recv_diag(hdev, skb);
> +       if (size <=3D HCI_DEVCD_DIAG_MAX_SIZE) {
> +               /* Send a copy to monitor as a diagnostic packet */
> +               skb =3D bt_skb_alloc(size, GFP_ATOMIC);
> +               if (skb) {
> +                       skb_put_data(skb, hdev->dump.head, size);
> +                       hci_recv_diag(hdev, skb);
> +               }
>         }
>
>         /* Emit a devcoredump with the available data */
>         dev_coredumpv(&hdev->dev, hdev->dump.head, size, GFP_KERNEL);
>  }
>
> +#undef HCI_DEVCD_DIAG_MAX_SIZE
> +
>  static void hci_devcd_handle_pkt_complete(struct hci_dev *hdev,
>                                           struct sk_buff *skb)
>  {
>         u32 dump_size;
>
>         if (hdev->dump.state !=3D HCI_DEVCOREDUMP_ACTIVE) {
>                 DBG_UNEXPECTED_STATE();
>                 return;
>
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz
