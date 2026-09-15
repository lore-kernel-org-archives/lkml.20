Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0099D36DA04
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481577; cv=pass; b=TRBBfisq0uMgniDS6i2om1HayaFOJ8yzXIO+qpiLaw8n5zIqBwCEHkzarHHjtI8NErz1/1S+RSEkTnmg2Gn7mkXsGTElpEvb7gg8r5wYhisE6sBR1oWxJagCTxKBZLufR3WsVba+Qs60p9IggNCI/HNnvMDsaE3JIqYuwj0llZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481577; c=relaxed/simple;
	bh=GOIj/wh8TpMzTX5lAHQylDSLT6REWsoLA66TfJssIhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aR3HKainGk9Kro1Lo2oG9j4DLvBUrFHnplXe1u1fLFUhOVAeY935SMXH2EAMfDAYZGvj2tfxMa2KZos9ZNnVTmh9RqRkU8hcesWKqp90hbvsb55GcdO/XsWU89Mi835sy6QRO5i4xP+8wv//T+M+ajxdN7Q0PhK5G2FwpHgpeD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBMVMD/b; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBMVMD/b"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab22370so358361d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789481575; cv=none;
        d=google.com; s=arc-20260327;
        b=YroYCAQ8QopxX/PsPoQIX1WKpbyzYGk9KLBKt66kiAZh32TT5UQKTGZlxco/8W85Me
         DIAV+CoENUPE6JmDPHNVDgrLiYNDqGZm3KIbGGH8zR5nmaJhzG9apJIEneiJg1qP7KpN
         lyiFo+kpalJpBK7eo21fCDaB64HTDVXyXj+6x8kWMqGjbquKcgb+L2YQJKGy9/LawPce
         GsprEMnrrixX0cI6FJDgWnNcpnPzTVMS/FDeFkgWS2fp1YjNu7bVwA9w75AzLqz3btlA
         6Gr6ZzenAG0tCv7A66nntWFMgowtyQEVfILJkRbiv4J+VzPbYulUo0SIGgVc8/BumNhP
         9YDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1NYnDGtx4S3hUcN9F7tPg8j9ZhqHNHLvb5FEYUCdHzQ=;
        fh=Szt52cQ6hcRJo+/xmzetl+a5LAOgImu6h7VUoXl0KMg=;
        b=Fkg1pb2fFRi/kwQiKWpQEJoytfRVqDgUo3CQdQYZ0pLIcJlz3Fpp7SVFXmHR+13g9P
         u40nZfh1wtsrv8bT7OitUgsrgLTg+R82eTQKav91P+NjFq33BnQNdVPD+01nE5nA6dAB
         AaWn+EQY58oibtDqP4qLZyqvAvKx4AHMJmaDkNGOER9QiJUGZzqOHf5hxpqlTy7rCih4
         IdjJHis/W46NXCmGXDXwRUSROghysjoEurZIzSVSiJTeoQW3VIoT92EgDqb/Us+8+Nq/
         N1+U8t91IgI6q+0IzJWB5gGJKGmwwhReYNdvgiiDJgt1Hr9sHej91s7L1ZiRYA9gQ2q2
         +RPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481575; x=1790086375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1NYnDGtx4S3hUcN9F7tPg8j9ZhqHNHLvb5FEYUCdHzQ=;
        b=gBMVMD/b90KDsg8N9ReLfQCx0nDTs4pkhe0acKIyCzfzujZGt4TVJ5AJnG948sKeyG
         Y5MzPBl3CvSqEJMuTp/Ragb4zCerGiMEnBTVcyQjQrfvMnAKvUiwqwfuvSY/keHLETh2
         W+sGxw3tIYqMFvqCSPH0IqX02/UoRYnVjE+nO8RbCntLs4yQalxPaNwgg5O0nTkFKPdj
         TqzSjc+9rNSmFzXelsxJLGa8+MwwR8yEj2IUUJ8lqurNE6QSJD/SHGLmWkPCsVPE1BN2
         rbHGhaJFVbE5LfsmX+F46tjtfnx7OxZS47k4+DCloEdjiRaJ2b95MqzDlki77L8ekh5+
         hcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481575; x=1790086375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1NYnDGtx4S3hUcN9F7tPg8j9ZhqHNHLvb5FEYUCdHzQ=;
        b=lBkvQjvb/Ae/vO6jYlXdIRpWjjCHhQj2RhdXoFaUKhfJP1xYT8P8asuVCB9L6k2LPP
         9tl135ouYCMtBY5iJjaxqnH2KwInu4xzaKR3Tw37Or9hwiLRQNAbaAGmedbo9GXF/Bxi
         InnYVFD2koVBCN1dTpGfQpdwROaGD6ishLLuCe7UqTsi1fLhvpMNJ2XhXFw1hSycmKhQ
         n/TP8xNzRcS1C7wi2TKYPySkK/6gijJLchpcKBDFsbKGw/HcjYwt3cHEXTY2hnbvYR0t
         Zqp5e6jLqcSWasuR45sE3fu1MpvAbtNoU7uLAaoX1acZV3cMVnpFl03+SxoAR441F6Au
         KqtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdFb+Dwd/k9NyRHq71DgsG12xJcvil9nmOeJTIQR2cGRHhO+JoWiiNddFD20wP6WUV1OPoK6g86snSXY0=@vger.kernel.org
X-Gm-Message-State: AFuF++ny7ApsvzDgYxFkaY6Uch6CkP6/CyzTz6sUube62kV7lo0rjuk9
	2avTcrWRzlGo0cJZmvUqzqgsgruvbwGXurtjtJEfS3a+kN/nmhvoTtzMF9R1ygmJ5ZVi/TBMyOz
	5u2z5+Y4kf+LFyFBhBZPiyr1ScxTs968=
X-Gm-Gg: AYBFou1DXkO+E9EPeBOGkLTE057fbYEb3ZV/O3MteZLrYb4nyxxK+1j1YBMZva8NLYK
	Y5QlZR9+ucZTV8EEotIIuifq3YCzqHJeY9kan25EBM1YWhCK7qAEBN7UBBF45TorzGcMBsnJ/Sz
	XNf6COVMNMfkLbiJXU9OvauFG2BG/6rertlRW7e31Mzwty/IyZG/bJJf8RK0EK898YflK3MS8Ml
	bWWFmOeqTJubpMfHWQvrg/D/8hij1kRi4zQ92bfItNA8iYMxA+jKrH8R8ICcn7N4jB8E+AiV2yb
	/5I1ZBamgl7ze/zKT4e481ogcBJhm08iB21fbZVMydxRsvEGJg75mbBDViGIPAGJ6TdHV0ll1+L
	xIAVTUE33GKgX2qXMWsfDxxclKyeO60aXVC/QW8hdbA==
X-Received: by 2002:a05:690e:4594:20b0:66b:163f:57c3 with SMTP id
 956f58d0204a3-6715cb260c5mr368015d50.42.1789481574586; Tue, 15 Sep 2026
 07:12:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-misc_fix-v2-0-6178d838c946@oss.qualcomm.com> <20260914-misc_fix-v2-2-6178d838c946@oss.qualcomm.com>
In-Reply-To: <20260914-misc_fix-v2-2-6178d838c946@oss.qualcomm.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 15 Sep 2026 10:12:42 -0400
X-Gm-Features: AcwNN1WOQ6YdQ_AZPzyODQbHVSLQS9HgiYHVZizdb_BYFTX2VeFJBY8ma8WFpkY
Message-ID: <CABBYNZLMbWgi=tizwOsNwAUjJA0AzpMa6XNrQWkJBGL+PwOWeQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Bluetooth: btnxpuart: Fix skb leak in nxp_process_fw_dump()
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Amitkumar Karwar <amitkumar.karwar@nxp.com>, Neeraj Kale <neeraj.sanjaykale@nxp.com>, 
	Marcel Holtmann <marcel@holtmann.org>, Zijun Hu <zijun_hu@icloud.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Tue, Sep 15, 2026 at 1:41=E2=80=AFAM Zijun Hu <zijun.hu@oss.qualcomm.com=
> wrote:
>
> When CONFIG_DEV_COREDUMP=3Dn, hci_devcd_append() returns -EOPNOTSUPP
> without freeing its skb argument. This leaks the cloned skb and also
> prevents nxp_set_ind_reset() from being called to perform recovery.
>
> Fix by guarding hci_devcd_append(hdev, skb_clone(skb, GFP_ATOMIC)) with
> CONFIG_DEV_COREDUMP.
>
> Fixes: 998e447f443f ("Bluetooth: btnxpuart: Add support for HCI coredump =
feature")
> Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/btnxpuart.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.=
c
> index 69e897444112..a0b64fdcbcc1 100644
> --- a/drivers/bluetooth/btnxpuart.c
> +++ b/drivers/bluetooth/btnxpuart.c
> @@ -1383,19 +1383,21 @@ static int nxp_process_fw_dump(struct hci_dev *hd=
ev, struct sk_buff *skb)
>                 err =3D hci_devcd_init(hdev, NXP_FW_DUMP_SIZE);
>                 if (err < 0)
>                         goto free_skb;
>
>                 schedule_delayed_work(&hdev->dump.dump_timeout,
>                                       msecs_to_jiffies(20000));
>         }
>
> +#ifdef CONFIG_DEV_COREDUMP
>         err =3D hci_devcd_append(hdev, skb_clone(skb, GFP_ATOMIC));
>         if (err < 0)
>                 goto free_skb;
> +#endif

I guess IS_ENABLED is preferable here so the code is still compiled in
leaving it up to the compiler to remove it in case it is considered
dead code.

>
>         if (buf_len =3D=3D 0) {
>                 bt_dev_warn(hdev, "=3D=3D=3D=3D FW dump complete =3D=3D=
=3D");
>                 hci_devcd_complete(hdev);
>                 nxp_set_ind_reset(hdev, NULL);
>         }
>
>  free_skb:
>
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz
