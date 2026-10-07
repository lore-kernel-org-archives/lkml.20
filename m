Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621A74C753A
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396946; cv=pass; b=lmbSMDwvXS6ppmMsTMIt5VFp07EydsA4zOLiMdx2YntDSTmUVhwj8yxR8oPt/FjoMjVCxK7YfIrRtTAlP+gW8CtQNmslcof9HZ1CgoEpJHU4qSkTwXQiynFJ95OSPy+m+43BgQDTMlB5JOkRIAWTbJINMBXQlKIA4YGSe14oIHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396946; c=relaxed/simple;
	bh=HXOuK+xL0BWK4TLZAWIgzPxXhBGvc9nRvP2r9s+vVa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HL+PSVlbOSjpFi9POl4mMEqoSXaNz3GZrB+7iciWIzDmaG53/UrPhT8sHTOpAKrXliCzK/kkO8y75T9n5E2cxOzs7s7n9Ccf6dxFmYII7b6JgE9BLULvNdnvZadDDO9+1v/fWhXzT0Y5po3EELmwCvPJyz9Y83Ga4wrFpqyxvTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va1Hzd1K; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va1Hzd1K"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ab38a051aaso22082877b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:15:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791396944; cv=none;
        d=google.com; s=arc-20260327;
        b=E/T1MPwavGVelhQa+TeHvY6ucpP6gI7Vg72TbApj+oH3J9hZGa5OAN5Zfpmph34zTo
         +05kNgeLeROokKwxN6SsRpyLkkZV6Dr87GRTy/7BMkzRcbN8Z6b6AtVm0jASju/p476G
         UkFMgSlxsyucTot8CitcmqAS8JqFOOHQSUP/isaG5ovNMtVAt5krXgD+Nd+v6O/4VX+R
         MvJDx+aOHR+4uSOTS9v1njc9WQnJ+ckWXOZwaRUEwY4x4tyzxov/AckifDpn5XdQQ0Ss
         v0PkwKU1N+LOPcGTLjZHMGmj1Mv33VugotPnr4BPIIEzw/5zHQ2S28k3Qvr8eQuDy1Az
         UUfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cWtpOZWiZqhow3a/lbN1hsCcK/jCLMcGug9hCcTMvHs=;
        fh=0KFVrG4KdW55FiGVL1pLxSjD69vbdfCOUSsKvCQ983I=;
        b=qFncpbk9uLPjXq35UzrZPzYzXC70wW4PNPUHxy8K+pLgT48/2ZZEwr8+h3dkbdDQgk
         N/+WdApIHX1ltJ4EVm28C0kkLmk9kEvkUp5LFE+GFQOccOiiu5KkfiBBBhbUAT1QUjXc
         6Fm3JxyCP+/o4XRQmDg8KOU4LHz+zpQ5V/O9A38QXcUuwNhtZNTftCuIOgzylBdw4c2I
         HW8ulxHkDDyJJIkpBRJueiG38MTdTY81VcVJHZ7ZmOKWC65XwcjuaEfgA6NYgm62qU6E
         Z2vw91w0pCC1bcmrkPWzi4ftY+QPzZy7NkWb7SxBpKiXLFVyk1T3uo5hCBZD7uSXD+sz
         foqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791396944; x=1792001744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cWtpOZWiZqhow3a/lbN1hsCcK/jCLMcGug9hCcTMvHs=;
        b=Va1Hzd1KlRgixMIQ1RJHtqPdOBXeAlWFkKR8a2czYHtMCp3rCLN2n4H01Oe5U5xYMf
         Ev6dGQpcmXx9h6HWl6IDfdXmEWp0UUFIHgUspbQiS6Yw4YcR5T7VdwL3nkmnkodPSZaj
         RlQ694qZO2EFDAUTGU9XE3UJwRKOMc6z5UvZiXBAbWTpSFM5sd/0/B5euKNDV0SR6cAb
         o6OCSxib0QK8wPpdmP10de+5q8j3WC9ejoz+S3JuyRrT4NQuud9kktUg8l4ioSPDxV53
         f0le7AVFPUj5lwc8IZm2+u6HxDUsdMM4RTrdY9MFDdJEihvvIaGowMNUGjaxbAv13Tdr
         k/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396944; x=1792001744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWtpOZWiZqhow3a/lbN1hsCcK/jCLMcGug9hCcTMvHs=;
        b=FdPFzezVL3eOS72JHhCEbENpPqWe9AcCADmgRSxe1d5faSey18f2BIdVgQ9Umbj28f
         N+Uzhp3ZJ7kntW3OVe9vpBzZfHuKLgUBI4vwFqJHETbA/V4e/u0tvnCHCeXY+d4KVAC9
         LHvEMjXjYqNSm4D1PC8k7SZZxQLx/L69SQdXUqXmWH0kOhUIT0DuNaV7A10YnEW2OBhZ
         vXX4KxA8wpiPPoQRvwI0jj/PgRkGEtQlzZ/jLTDEYWjv23Lhojo8YW2x6aTPpHrIeiyu
         EQozUygmwzcmU26ckUCP//C4Tul41BWs51FmSLIcMukalQ6wU+QRDTyFK1QX9j7Oyhbc
         lg3w==
X-Forwarded-Encrypted: i=1; AKwUvBxD5xL+/07zG1h9cFalUDAiNZsmfsECaai0PS52ftNEBKdcwHYpmP6Uz6lYSkdDelGKIXEFYltZ5Lp7HH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1gIlWRj4Kihj5dcvxbkycXVmpjR2rc0YBC00cEsdf3DZLxs3R
	jhURQRQRbb2busnPICvug/gO90kRbhClxuNxOIHDr5f1tJ3q7drDCSZo5ed4f1zs75OtU7Z1GA+
	w+GmFOnbEiWsdm1BXWyMpalU8+9GHCRw=
X-Gm-Gg: AYBFou0XV3D1ab/WYE6pmY6OoxVgN51ZRYnjGpMRvtSBqc3jmyBS3zAZ69GtbOlY6h5
	WbvlCgnltKPDGPDBnxoekeHodXXr6PMTdy3zaMDlygJ5onr3CaK0JgofhZjj1/hEEdnYr6eJvMv
	RxL8LKYyDWiPlvB9xcv89mya60BFVQXy0XmqFaGf4lm+ax61IgIgURPkx9+MBgnc5Zh0vmD2dNI
	p/uI5HZkt6Tnykkro2evR2XtWer8HobNz25gZlPPeke8IFWdSu5HdLGTODrKk1NUMvK1zxEm3Bo
	+XtQwYnIK1hAGVkGcCt68y1yf8pJB1UrazwUr7iSK7qxV2al3my6KCnBQSfTbVmSFSsuCrRrcTU
	R4vATmr1tPqDmJxQOJJ4cZVSMpxBnWZUSXwkXzXCfQw==
X-Received: by 2002:a05:690c:16:b0:878:cee5:9885 with SMTP id
 00721157ae682-8b05af5a83emr25390577b3.43.1791396944193; Wed, 07 Oct 2026
 11:15:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007154353.148223-1-enghitalo@gmail.com> <20261007154353.148223-4-enghitalo@gmail.com>
In-Reply-To: <20261007154353.148223-4-enghitalo@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 7 Oct 2026 14:15:32 -0400
X-Gm-Features: AclHuK98IKR7dBXThSE2gPVRegFNP1Ue1OG8heXz68xmZLc1_uVN9xVpkG2dslw
Message-ID: <CABBYNZKoSV1_cVJRrdonHT=gKtS6pgoWDM3R5nj5aR0D17SqRg@mail.gmail.com>
Subject: Re: [PATCH 3/3] Bluetooth: Don't leave abandoned SCO links up in the controller
To: Hitalo Souza <enghitalo@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hitalo,

On Wed, Oct 7, 2026 at 11:44=E2=80=AFAM Hitalo Souza <enghitalo@gmail.com> =
wrote:
>
> Since commit a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for
> aborting connections"), aborting a SCO/eSCO connection whose setup is
> pending, e.g. because its socket was closed, sends Create Connection
> Cancel and deletes the hci_conn. That command cannot cancel a
> synchronous connection, controllers just fail it (ACL Connection Already
> Exists or Unknown Connection Identifier), and the link may still
> complete afterwards. Unless another connection to the device takes it
> over, its completion event then finds no connection waiting for it and
> is ignored; if it comes while the abort is still queued, the connection
> refuses the handle as it is being aborted and is deleted all the same.
> Either way the link stays up in the controller, which rejects every
> later setup for the device until the ACL drops (with Unsupported LMP
> Parameter Value on a MediaTek MT7921). The same happens to a second
> link completing for a connection that is already up, e.g. its own setup
> after it took over the abandoned one.
>
> There is no command to cancel a pending SCO/eSCO setup, so don't send
> Create Connection Cancel for one, and disconnect a SCO/eSCO link that
> completes with no connection to take it.
>
> With the disable_esco parameter of sco.c, a SCO_LINK connection can get
> an eSCO link, which it does not take: its connect times out and the link
> stays up until the ACL drops. That is not changed here, and such a link
> is not disconnected while a SCO_LINK connection waits for its link.
>
> Link: https://github.com/bluez/bluez/issues/2562
> Fixes: a13f316e90fd ("Bluetooth: hci_conn: Consolidate code for aborting =
connections")
> Assisted-by: LLM
> Signed-off-by: Hitalo Souza <enghitalo@gmail.com>
> ---
>  net/bluetooth/hci_event.c | 61 +++++++++++++++++++++++++++++++++++----
>  net/bluetooth/hci_sync.c  |  8 +++++
>  2 files changed, 64 insertions(+), 5 deletions(-)
>
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index cbe53e19e..102a0a4d1 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -3217,6 +3217,27 @@ static int hci_read_enc_key_size(struct hci_dev *h=
dev, struct hci_conn *conn)
>         return hci_send_cmd(hdev, HCI_OP_READ_ENC_KEY_SIZE, sizeof(cp), &=
cp);
>  }
>
> +/* A SCO/eSCO link that completes with no connection to take it, e.g.
> + * because its setup was abandoned while pending, must be disconnected:
> + * otherwise it stays up in the controller, which then rejects every fur=
ther
> + * setup for the device.
> + */
> +static void hci_sco_disconnect_orphan(struct hci_dev *hdev, __le16 handl=
e)
> +{
> +       struct hci_cp_disconnect cp;
> +       u16 h =3D __le16_to_cpu(handle);
> +
> +       /* Never for an invalid handle or one that a connection uses */
> +       if (h > HCI_CONN_HANDLE_MAX || hci_conn_hash_lookup_handle(hdev, =
h))
> +               return;
> +
> +       bt_dev_dbg(hdev, "handle 0x%4.4x", h);
> +
> +       cp.handle =3D handle;
> +       cp.reason =3D HCI_ERROR_REMOTE_USER_TERM;
> +       hci_send_cmd(hdev, HCI_OP_DISCONNECT, sizeof(cp), &cp);
> +}
> +
>  static void hci_conn_complete_evt(struct hci_dev *hdev, void *data,
>                                   struct sk_buff *skb)
>  {
> @@ -3273,8 +3294,10 @@ static void hci_conn_complete_evt(struct hci_dev *=
hdev, void *data,
>
>                         conn =3D hci_conn_hash_lookup_ba(hdev, ESCO_LINK,
>                                                        &ev->bdaddr);
> -                       if (!conn)
> +                       if (!conn) {
> +                               hci_sco_disconnect_orphan(hdev, ev->handl=
e);
>                                 goto unlock;
> +                       }
>
>                         conn->type =3D SCO_LINK;
>                 }
> @@ -3293,8 +3316,12 @@ static void hci_conn_complete_evt(struct hci_dev *=
hdev, void *data,
>
>         if (!status) {
>                 status =3D hci_conn_set_handle(conn, __le16_to_cpu(ev->ha=
ndle));
> -               if (status)
> +               if (status) {
> +                       /* e.g. it is being aborted: the link is not take=
n */
> +                       if (ev->link_type =3D=3D SCO_LINK)
> +                               hci_sco_disconnect_orphan(hdev, ev->handl=
e);
>                         goto done;
> +               }
>
>                 if (conn->type =3D=3D ACL_LINK) {
>                         conn->state =3D BT_CONFIG;
> @@ -5178,8 +5205,18 @@ static void hci_sync_conn_complete_evt(struct hci_=
dev *hdev, void *data,
>
>         conn =3D hci_conn_hash_lookup_ba(hdev, ev->link_type, &ev->bdaddr=
);
>         if (!conn) {
> -               if (ev->link_type =3D=3D ESCO_LINK)
> -                       goto unlock;
> +               if (ev->link_type =3D=3D ESCO_LINK) {
> +                       /* A SCO_LINK connection still waiting for its li=
nk can
> +                        * get an eSCO one, see disable_esco in sco.c. It=
 does
> +                        * not take it, as before, and the link is left a=
lone.
> +                        */
> +                       conn =3D hci_conn_hash_lookup_ba(hdev, SCO_LINK,
> +                                                      &ev->bdaddr);
> +                       if (conn && HCI_CONN_HANDLE_UNSET(conn->handle))
> +                               goto unlock;
> +
> +                       goto orphan;
> +               }
>
>                 /* When the link type in the event indicates SCO connecti=
on
>                  * and lookup of the connection object fails, then check
> @@ -5192,7 +5229,7 @@ static void hci_sync_conn_complete_evt(struct hci_d=
ev *hdev, void *data,
>                  */
>                 conn =3D hci_conn_hash_lookup_ba(hdev, ESCO_LINK, &ev->bd=
addr);
>                 if (!conn)
> -                       goto unlock;
> +                       goto orphan;
>         }
>
>         /* The HCI_Synchronous_Connection_Complete event is only sent onc=
e per connection.
> @@ -5202,6 +5239,13 @@ static void hci_sync_conn_complete_evt(struct hci_=
dev *hdev, void *data,
>          * whether the connection is already set up.
>          */
>         if (!HCI_CONN_HANDLE_UNSET(conn->handle)) {
> +               /* Another link for a connection that is already up, e.g.=
 its
> +                * own setup completing after it took over an abandoned o=
ne,
> +                * has no connection waiting for it either.
> +                */
> +               if (__le16_to_cpu(ev->handle) !=3D conn->handle)
> +                       goto orphan;
> +
>                 bt_dev_err(hdev, "Ignoring HCI_Sync_Conn_Complete event f=
or existing connection");
>                 goto unlock;
>         }
> @@ -5210,6 +5254,8 @@ static void hci_sync_conn_complete_evt(struct hci_d=
ev *hdev, void *data,
>         case 0x00:
>                 status =3D hci_conn_set_handle(conn, __le16_to_cpu(ev->ha=
ndle));
>                 if (status) {
> +                       /* e.g. it is being aborted: the link is not take=
n */
> +                       hci_sco_disconnect_orphan(hdev, ev->handle);
>                         conn->state =3D BT_CLOSED;
>                         break;
>                 }
> @@ -5260,6 +5306,11 @@ static void hci_sync_conn_complete_evt(struct hci_=
dev *hdev, void *data,
>         hci_connect_cfm(conn, status);
>         if (status)
>                 hci_conn_del(conn);
> +       goto unlock;
> +
> +orphan:
> +       if (!status)
> +               hci_sco_disconnect_orphan(hdev, ev->handle);
>
>  unlock:
>         hci_dev_unlock(hdev);
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 9eca6757d..4e1c72fd2 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -5940,6 +5940,14 @@ static int hci_connect_cancel_sync(struct hci_dev =
*hdev, struct hci_conn *conn,
>                 return 0;
>         }
>
> +       if (conn->type =3D=3D SCO_LINK || conn->type =3D=3D ESCO_LINK) {
> +               /* There is no command to cancel a pending SCO/eSCO setup=
. If
> +                * the link completes anyway, it is disconnected then, un=
less
> +                * a new connection to the device takes it.
> +                */
> +               return 0;
> +       }
> +
>         if (hdev->hci_ver < BLUETOOTH_VER_1_2)
>                 return 0;
>
> --
> 2.55.0

Sashiko flagged quite a few problems:

https://sashiko.dev/#/patchset/20261007154353.148223-1-enghitalo%40gmail.co=
m

We need to check if the logic of hci_sco_disconnect_orphan couldn't be
made more generically, so in case the connection was aborted but we
received the connection complete that shall always result in
HCI_OP_DISCONNECT so the handle don't stay active in the controller.


--=20
Luiz Augusto von Dentz
