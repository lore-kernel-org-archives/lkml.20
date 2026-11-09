Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794250325;
	b=5IWXX1tgL8GNo6a39PDHkI+K7nmevyJ9alDCbPVFW3VvSFJJPKmmZD8LhM+b6az5+4E4
	 sybYZUTVz0SMX2A3mv2gBrkzoyzyACHo0RdxWhk95rrGV+gKjgwshBZ2vajSTwgIt66Ph
	 rHOu2q6I2eLjbB+ObpxwUVEOrIBdSwNNSQLyQ1lgWT++9ZIt9P0v/lPa1a9zLqDaH/89M
	 UtUl7tcVWA8cySEqlxkl8zl6SP6LBiGNDG+cSMgRcyzsn7hsNHKHDVMeWIqSHk48lHfpB
	 yov6hWJc5TGr0AGR3B5AFp+0/6nldPxDEPkK+7Q1kCkeHi8+L+7NH99fKSXDgxailIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7c8+phLoXYZrE8cOaqBv/1uGhkQ9Ws+f7SgvvClsdKQ=;
	b=Qc1b9ZkwFucER/OqJxUN2oH50FlBUYlOcYjfsHlqG1TSUJkjjvo/VDy5BvX2E20BYnhY
	 MFcaSrIVPVhDc1g/vw+MuhRt7xCg3dJ9G+Sgpn84V+oxLbAhtbI+CxtqCA6BqdiU9wpf9
	 OV8iWlvwiXOtw2Tabonzu+Sa7b1VDMmBxcQe5+tDmq4QdVtpNgHXJ9tL2LQz25aDez91g
	 PtWKs6Ly1CX03xGfZfNkUfAJIL0IL9MzEF8TbnUkSd+bFK0MDuKYvT+WvZiNymqSSB9x9
	 IaB/OU36X+GnAEnpKP4Lt6+/l6gxX9B+yp2330SPtiCTo7fvODnbIg7NPS1ALpQDFKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Eotg+s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9F2606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 18:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED9F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7Eotg+s
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8871ada1a26so11656847b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:52:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794250324; cv=none;
        d=google.com; s=arc-20260327;
        b=gLOW7kn7zNEQv+cPoT0Pbm7M7qxUHxTR5wDjNx5kr1yw4/JB00llhkld+WASQOkBjr
         NsM1XZmbehUwoFWZR11Bv8aYE1xR+W7x5YiVSXfbpaR2hebpnLvRr6VJlC+ZQv1USgki
         OEMFeMDmYVZChVO8I/cD0E0bvZ88FjJ3BWYktifcC2j320ILSL/LqEwOrnJRbHPvPOeS
         ORcvNCwHbghIyxf2EL+AKFUgmWgms1qC4jIdkQV6KLTFV74NcmBQ+euzUsh0PK+Op0XG
         KlNK2V6ncGwVJJLNyK14IsIvwIonekcjr6qIfElL1ETQMxtfR66/hbeMqebXBmL9u4j/
         Tyag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7c8+phLoXYZrE8cOaqBv/1uGhkQ9Ws+f7SgvvClsdKQ=;
        fh=0nfN6wfRYrGHCDqJmtH9LOn8kCraaEqQxPYFTBQFOHg=;
        b=fn6+y5TF4rum/g6n4aLTsYV3cQngrHAHNPK5y59tBfb1Wdtm86fdU79D6qUfm49D/V
         W/yqXE9w5It/DM2kcinTtGGtbLAzJNDA5Ydj69P+XSFIFSo3wT2X6RXXKH/2xFleosuB
         Y6fSQZjOzKQsN43K2I/esTyuAG6gZ+xZrteaPl5UPZCxMfWKG8CpAdW0hhHcLNqSH1uJ
         wEqXSfdcBtom3fABhscfKH2b1iEtQpW6yLKkweB6/EDdI4ubGEh7NGnc+w0O3jQ/FWer
         OqEphXjhqVIjENLWAVFpK92n8j+SQymn+djNz6m25tq5lbkiC8V5GxZKujUTACQUNe1+
         fvdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794250324; x=1794855124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7c8+phLoXYZrE8cOaqBv/1uGhkQ9Ws+f7SgvvClsdKQ=;
        b=C7Eotg+sf4TWoAopEpgpS9uzN2IrDEERuyYtuFObt766knNQ/oegNCrwIJ5CBNO3KG
         kCF4jJ6Y5dL3JiIsNcF+F7vkztB2TtmodNJg0nFvIi+IFpsqM7n7rdY5IajwAw7aeb5E
         PJjOCu+uAGVpIRJxH6ytMCUisjlxft+IXBoVv9KALg/Z1CNjwse2qS+NRrg1x7lMMqsa
         X3yQ3oA3THbji2+YIcrqAHBL4OcwFYvt2nrds1/ymFYei6A2Hw/MhURepewFBE0BwbXE
         NfaScjjSgMWIkjytlzrZUug5AxzAr7jlOUfihA+6zOYrJ97YaHkgbMdmrI+9rny51lmH
         78qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794250324; x=1794855124;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7c8+phLoXYZrE8cOaqBv/1uGhkQ9Ws+f7SgvvClsdKQ=;
        b=TZIebVu2jr+UYgKcURpcdO3uzvsmmToV6iqYpJ10IQQVt5LpY6dUDgn4FAnQajD/ZY
         23FlZiyEP2pNpKAc8Vr323NJQ7ZsEHRM6xhSBX69OboQhPo8SX9IIFBhj0CAlFqClBkh
         cLQerg1zvTZcs/d7vvG7egGxksANj/y12SW0hPJx6kRFNEEwGGeTCNyPNvxSPa5uuIH/
         tLQuns4C6tDKUHkyjLIFgow15T/j53e5kPyJsiH/MlLfkkmj0mxABq7f2alPcawOQMfb
         vdCnqiy2XCGdPwVywmj5HJ4mbE0uc5YIDglit2xDdecJBOFfvUFZ7n9SUGXfwj9ZFpOI
         OEWw==
X-Forwarded-Encrypted: i=1; AL+hErFCrN4tBWLKHSUhBhq3PG1DUFSlwsbRSH9pyI8pVaKUypNaal832cT50e0uxZu0rKUrZMBW0Ztls+rJHOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kKibtF1J0QsisuhAbvf/ceu753Ub3MzTjCOi9yZTcPGvwvv2X
	IZJrVwvScsHGrg9RSjB8vaAxJIpWTNUwRL0EEwHZlCunFOwzdY3lSUuz149TLNFS5a8tzDngZCM
	X76fWMqWQ9mgHBlekAhHhldv2VuU5G4w=
X-Gm-Gg: AYBFou3xfP5paix7/awHzRQNhgThKZlNDzEjuuziOE5C92MJVedG7c+VIbgijF3nEZ6
	63PmsNOdnwQEJAN/9rdSIiy1sdcXhe7n6BojNGWzxDU4XsUBiAcWwCsOx/8SBt9zZt58sahS/AO
	rCkBFtRtYNbxfxu1cvuw1semG/Ae8b3zFc0xZTkkHXkJaMq/AHxZ2OslV8yS7QgxeSHVEsDY2Pn
	xskXGn/B+m7iyRD7pwS5Mc6XO9L4VKNEMR7J1OsaWqf/6ZrpxRpP5ocATCWRKsfCXrV8HcBf1vB
	TlInveBtiCwBxWZEa0MLIpYyB/fxpkNd1Omd7CR4P6CxI20oouQqJ+YnHlmBPbDh1lL9N82bjUY
	fS3pLk7mUMVIb39oVZ1HBU+ioZxJ4xDel0ancD4yJjSa8gVqUM931BtnIRR4iR5WWsKEDQFFhIU
	OvlwRomezjYsaxWyRGdjT3vAI/NQg9p+WPJwxeWB2RGt94WlrCUTlMP0tO
X-Received: by 2002:a05:690c:a057:b0:8b3:150b:43dd with SMTP id
 00721157ae682-8b392b553camr1186047b3.77.1794250323766; Mon, 09 Nov 2026
 10:52:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-for-upstream-le-conn-params-rpa-v3-1-ad1225bb0b8f@podgorny.cz>
In-Reply-To: <20261109-for-upstream-le-conn-params-rpa-v3-1-ad1225bb0b8f@podgorny.cz>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 9 Nov 2026 13:51:52 -0500
X-Gm-Features: AclHuK-9cI713_BUVjsqlZUPAWvBuIdns_ZlMJT9KuYyfrTuAGPZ0iXdSfX85VM
Message-ID: <CABBYNZLFtpr8xFjnimRZ9VKOsEgUV-Gzf61bomK4u+SMEyqBxA@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: find an RPA peer's connection parameters by
 its identity
To: Radek Podgorny <radek@podgorny.cz>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Radek,

On Mon, Nov 9, 2026 at 1:28=E2=80=AFPM Radek Podgorny <radek@podgorny.cz> w=
rote:
>
> A bonded peer's connection parameters are stored under its identity
> address, but hci_conn_params_lookup() matches only the exact address it
> is given, so a caller holding the peer's RPA misses the entry.
>
> hci_le_create_conn_sync() is such a caller: hci_connect_le() puts the
> peer's cached RPA in conn->dst, and __hci_conn_add() no longer converts
> it back when the controller cannot translate an identity address. The
> connection is then created with the controller-wide defaults in hdev
> instead of the peer's interval, latency and supervision timeout.
>
> Resolve an RPA to its identity in hci_conn_params_lookup(), so every
> caller finds the same entry whichever of the peer's addresses it holds.
> The identity is looked up instead of the RPA, not after it: Pair Device
> creates an entry under the RPA the peer had before bonding, and that
> entry stays behind with default parameters. Matching it first would hand
> it out for as long as the peer keeps that RPA. Such an entry is no
> longer reachable by its RPA once the IRK is known; it is cleared with
> the other disabled entries the next time all connection parameters are
> loaded. The IRK can be freed by SMP without hdev->lock, so its identity
> is copied out under rcu_read_lock().
>
> hci_conn_params_add() and hci_conn_params_del() go through the same
> lookup, so given a resolvable RPA they now act on the identity entry.
> hci_conn_params_add() also stores a new entry under the identity, or a
> later lookup by the identity or by a rotated RPA would miss it.
>
> The returned entry can therefore hold a different address type than
> the one the caller passed. load_conn_param() and load_conn_subrate()
> look up the connection by the entry's address with the caller's type;
> use the entry's type with it.
>
> A connect made to the peer's RPA, through hci_connect_le_scan() from
> Pair Device, an L2CAP socket or a CIS, now marks the identity entry for
> the explicit connect. When the peer advertises, check_pending_le_conn()
> calls hci_connect_le() with the resolved identity, but the scanning
> connection is still under the RPA, so the lookup by identity misses it
> and a second hci_conn is created. Look the scanning connection up by
> the peer's IRK instead, which also finds it after the peer has moved to
> a new RPA. Do so whether the host or the controller resolved the
> advertisement, and whether or not an RPA is cached for the peer: both
> lead to check_pending_le_conn() with the identity. The RPA dialled is
> copied out of the IRK under rcu_read_lock() for the same reason as
> above.
>
> Fixes: 4914c4998961 ("Bluetooth: put the peer's on-air address on air whe=
n we cannot resolve")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Radek Podgorny <radek@podgorny.cz>
> ---
> v3 addresses the issues Sashiko raised on v2:
> https://sashiko.dev/#/patchset/20261104120138.1165715-1-radek%40podgorny.=
cz
>
> Tested on v7.3.1 (the flags test needs &c->flags there) with a
> Raspberry Pi CYW43455 central and a peer on a resolvable private
> address whose parameters are loaded under its identity: 7 of 7
> connects, one Create Connection each to the RPA, each carrying the
> identity's parameters. Not exercised: an RPA rotation between
> attempts, and the controller-resolved and no-cached-RPA cases of the
> scanning-connection lookup, which this controller and peer cannot reach.
>
> Per Documentation/process/generated-content.rst: the patch and this
> message were done with the Claude coding assistant (model as in the
> Assisted-by trailer). The prompts asked it to fix the issues Sashiko
> raised on v2, then to review the result following Sashiko's published
> review prompts and fix what that turned up. The author directed the work
> and reviewed the result.
> ---
> Changes in v3:
> - Look up the identity instead of the RPA, not after it, so an entry
>   left under the peer's pre-bonding RPA cannot shadow it
> - Copy the identity out of the IRK under rcu_read_lock(), since SMP can
>   free the IRK without hdev->lock
> - hci_conn_params_add() stores a new entry under the identity
> - load_conn_param() and load_conn_subrate(): look up the connection with
>   the entry's address type
> - hci_connect_le(): find the scanning connection of a connect made to
>   the peer's RPA by its IRK, so it is not duplicated once the identity
>   entry is pending, even after the peer has moved to a new RPA, and
>   also when the controller resolved the advertisement or no RPA is
>   cached for the peer. Kept in this patch, since on its own it would
>   leave a reference imbalance until the lookup is fixed
> - Rebased on bluetooth-next
> - Link to v2: https://patch.msgid.link/20261104120138.1165715-1-radek@pod=
gorny.cz
>
> Changes in v2:
> - Resolve the RPA inside hci_conn_params_lookup() rather than at the
>   hci_le_create_conn_sync() call site, as Luiz suggested, so no other
>   caller can miss the entry
> - Rebased on bluetooth-next
> - Link to v1: https://patch.msgid.link/20261101-for-upstream-le-conn-para=
ms-rpa-v1-1-988629a09bc9@podgorny.cz
> ---
>  net/bluetooth/hci_conn.c | 60 ++++++++++++++++++++++++++++++++++++++++--=
------
>  net/bluetooth/hci_core.c | 32 ++++++++++++++++++++++++++
>  net/bluetooth/mgmt.c     |  4 ++--
>  3 files changed, 84 insertions(+), 12 deletions(-)
>
> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
> index eebd73988bf6..fddfeca9b02a 100644
> --- a/net/bluetooth/hci_conn.c
> +++ b/net/bluetooth/hci_conn.c
> @@ -1502,12 +1502,42 @@ u8 hci_conn_set_handle(struct hci_conn *conn, u16=
 handle)
>         return 0;
>  }
>
> +/* A connect made to one of the peer's RPAs leaves its scanning object u=
nder
> + * that RPA when the controller cannot resolve it, and the peer may have
> + * moved to a new RPA since. Match it by the peer's IRK instead of by ad=
dress.
> + *
> + * This function requires the caller holds hdev->lock.
> + */
> +static struct hci_conn *le_scanning_conn_by_irk(struct hci_dev *hdev,
> +                                               const u8 irk_val[16])
> +{
> +       struct hci_conn_hash *h =3D &hdev->conn_hash;
> +       struct hci_conn *c;
> +
> +       rcu_read_lock();
> +       list_for_each_entry_rcu(c, &h->list, list) {
> +               if (c->type !=3D LE_LINK ||
> +                   !test_bit(HCI_CONN_SCANNING, c->flags) ||
> +                   !hci_bdaddr_is_rpa(&c->dst, c->dst_type))
> +                       continue;
> +
> +               if (smp_irk_matches(hdev, irk_val, &c->dst)) {
> +                       rcu_read_unlock();
> +                       return c;
> +               }
> +       }
> +       rcu_read_unlock();
> +
> +       return NULL;
> +}
> +
>  struct hci_conn *hci_connect_le(struct hci_dev *hdev, bdaddr_t *dst,
>                                 u8 dst_type, bool dst_resolved, u8 sec_le=
vel,
>                                 u16 conn_timeout, u8 role, u8 phy, u8 sec=
_phy)
>  {
>         struct hci_conn *conn;
>         struct smp_irk *irk;
> +       bdaddr_t rpa;
>         int err;
>
>         /* Let's make sure that le is enabled.*/
> @@ -1533,25 +1563,35 @@ struct hci_conn *hci_connect_le(struct hci_dev *h=
dev, bdaddr_t *dst,
>         if (conn && !test_bit(HCI_CONN_SCANNING, conn->flags))
>                 return ERR_PTR(-EBUSY);
>
> -       /* Check if the destination address has been resolved by the cont=
roller
> -        * since if it did then the identity address shall be used.
> -        */
> -       if (!dst_resolved) {
> -               /* When given an identity address with existing identity
> -                * resolving key, the connection needs to be established
> -                * to a resolvable random address.
> +       rcu_read_lock();
> +       irk =3D hci_find_irk_by_addr(hdev, dst, dst_type);
> +       if (irk) {
> +               /* A connect made to one of the peer's RPAs is still scan=
ning
> +                * under that RPA, whatever address the peer is seen on n=
ow.
> +                */
> +               if (!conn)
> +                       conn =3D le_scanning_conn_by_irk(hdev, irk->val);
> +
> +               /* Check if the destination address has been resolved by =
the
> +                * controller since if it did then the identity address s=
hall
> +                * be used.
> +                *
> +                * Otherwise, when given an identity address with existin=
g
> +                * identity resolving key, the connection needs to be
> +                * established to a resolvable random address.
>                  *
>                  * Storing the resolvable random address is required here
>                  * to handle connection failures. The address will later
>                  * be resolved back into the original identity address
>                  * from the connect request.
>                  */
> -               irk =3D hci_find_irk_by_addr(hdev, dst, dst_type);
> -               if (irk && bacmp(&irk->rpa, BDADDR_ANY)) {
> -                       dst =3D &irk->rpa;
> +               if (!dst_resolved && bacmp(&irk->rpa, BDADDR_ANY)) {
> +                       bacpy(&rpa, &irk->rpa);
> +                       dst =3D &rpa;
>                         dst_type =3D ADDR_LE_DEV_RANDOM;
>                 }
>         }
> +       rcu_read_unlock();
>
>         if (conn) {
>                 /* dst may just have been swapped for the peer's RPA abov=
e, and
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index bfc5bdebc71a..c9f4f4038e0a 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -2285,11 +2285,37 @@ int hci_bdaddr_list_del_with_irk(struct list_head=
 *list, bdaddr_t *bdaddr,
>         return 0;
>  }
>
> +/* A peer's connection parameters are kept under its identity address, s=
o
> + * point *addr and *addr_type at the identity behind an RPA we can resol=
ve.
> + * SMP can free the IRK without hdev->lock, so the identity is copied to
> + * @id_addr before leaving the RCU read-side section.
> + */
> +static void conn_params_resolve(struct hci_dev *hdev, bdaddr_t **addr,
> +                               u8 *addr_type, bdaddr_t *id_addr)
> +{
> +       struct smp_irk *irk;
> +
> +       if (!hci_bdaddr_is_rpa(*addr, *addr_type))
> +               return;
> +
> +       rcu_read_lock();
> +       irk =3D hci_find_irk_by_rpa(hdev, *addr);
> +       if (irk) {
> +               bacpy(id_addr, &irk->bdaddr);
> +               *addr =3D id_addr;
> +               *addr_type =3D irk->addr_type;
> +       }
> +       rcu_read_unlock();
> +}
> +
>  /* This function requires the caller holds hdev->lock */
>  struct hci_conn_params *hci_conn_params_lookup(struct hci_dev *hdev,
>                                                bdaddr_t *addr, u8 addr_ty=
pe)
>  {
>         struct hci_conn_params *params;
> +       bdaddr_t id_addr;
> +
> +       conn_params_resolve(hdev, &addr, &addr_type, &id_addr);
>
>         list_for_each_entry(params, &hdev->le_conn_params, list) {
>                 if (bacmp(&params->addr, addr) =3D=3D 0 &&
> @@ -2345,6 +2371,12 @@ struct hci_conn_params *hci_conn_params_add(struct=
 hci_dev *hdev,
>                                             bdaddr_t *addr, u8 addr_type)
>  {
>         struct hci_conn_params *params;
> +       bdaddr_t id_addr;
> +
> +       /* Store a new entry under the identity too, or lookups by the
> +        * identity or a later RPA would miss it.
> +        */
> +       conn_params_resolve(hdev, &addr, &addr_type, &id_addr);

Not following the comments on this one, why would we want a duplicate
entry for the same device? The comment say it is a new entry, but we
would lookup so both an RPA or identity shall now result in the same
hci_conn_params entry, so something is off here and we shouldn't
really need to do conn_params_resolve before lookup because lookup
itself does it anyway.

>         params =3D hci_conn_params_lookup(hdev, addr, addr_type);
>         if (params)
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 260ef2a45719..3bf62fa2e7c2 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -8265,7 +8265,7 @@ static int load_conn_param(struct sock *sk, struct =
hci_dev *hdev, void *data,
>                          * a connection update.
>                          */
>                         conn =3D hci_conn_hash_lookup_le(hdev, &hci_param=
->addr,
> -                                                      addr_type);
> +                                                      hci_param->addr_ty=
pe);
>                         if (conn && conn->role =3D=3D HCI_ROLE_MASTER &&
>                             (conn->le_conn_min_interval !=3D min ||
>                              conn->le_conn_max_interval !=3D max ||
> @@ -8380,7 +8380,7 @@ static int load_conn_subrate(struct sock *sk, struc=
t hci_dev *hdev, void *data,
>
>                         conn =3D hci_conn_hash_lookup_le(hdev,
>                                                        &hci_param->addr,
> -                                                      addr_type);
> +                                                      hci_param->addr_ty=
pe);
>                         if (conn && conn->state =3D=3D BT_CONNECTED &&
>                             (conn->le_rate_interval < min ||
>                              conn->le_rate_interval > max ||
>
> ---
> base-commit: 4c684359d8e17be11c7fdace223dd1801bd0f1b1
> change-id: 20261101-for-upstream-le-conn-params-rpa-f2334fb5dda7
>
> --
> Radek Podgorny <radek@podgorny.cz>
>


--=20
Luiz Augusto von Dentz
