Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE345C700
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173725; cv=pass; b=bK3PtTvVplO0dv07rOghY4FSHNgXF3vtY1rPHHwt9W6VMNVsl5HgAWi7++3M+bcS2ZbN3StryUiJhSK5F4L0HSHbZ9HHFwjj8FhYWM1ZBm3b+g9iNcjLmYvRlyZmthNM9wSZOSCKG/WRkmqWHFOKpUSAmY/64ttHU75bFx2UsRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173725; c=relaxed/simple;
	bh=EX7zg1mYiVF3ZQh3ik8noYWor8hxqHYaoJVNLnYkHgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ynx8tRwqyA+qdF7wkWhWkzrwvT5rZeShyUcbFZucesllfBzDsIjdx2monMJStfML/qpVSlWBRBlDKbxoQnA/K3maVgsOINh9Yn2uupGHaoTS/klLFEIZdLEZFtV7IddUTdSPXFnla1nszOYKl7INQiTd6slBJnwo+IK8lYnQwQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEqiQv4a; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEqiQv4a"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8871ada1a26so1645807b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792173722; cv=none;
        d=google.com; s=arc-20260327;
        b=cBOSaE+6Vfq0q7HyY2ZsVDZblKstWV1hlb8ytz0NvthwSTedeHD0Rrec2titdvdiU6
         RB/8qtpsTZnoL9ZsE7U/bH5rXg9h0bbVVkTGI3slgIIcvc+wgxbtiAhq0OXXx/B2YNC/
         dUuX845PuaPFdbH/iK7vyXwm4nFdU4zG8N2QUdZoKNbrkbC90/F3joS0l1uVLYDB+IkV
         Nkh/RzK0desoaBNVhDBjOm9HaQOQBWQj7awUMrKeGtCaog2hxnjYTd7naYnT3oI21Gxz
         mbQVVy2n405B8gz922dOeNbCYFGoikBLXF4lgZjvdeH6Y4ahiYYgq42TIO/B4SApDLLy
         zmAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J8qQe86RR8HXxapm056thr/pToC7ExVCLVe21t5Z5pE=;
        fh=em4A88g7YVDsIMo8SE0pWchw246uYfNFSC906LflVF0=;
        b=EYpppRmkjRfCMBdcJ9XLAIeuLzvz+yW7po3e181sdEQuhzfTqqGp8c5LsYrZnpPVon
         X7Sa+GDm3YBKhLoPWNwWMNRSTL4j4+fzYrOMtSep7pTVNtWoFwCTX6+VZ/2VlfVl89F6
         Mgjf0TPou9Ne9xnetJDfzqFeerOnc61ChPfgVSQGoUIz+adutkI9KLtjDCuT78V5F82N
         kgiLTSor45YiA/BXrvmSuqmujQshCG5b4iKcpUL8DTPwBQUf15lzES0Rg5ck4x2FhiE3
         FvQ+a9FI4AqSIqDq65T/isaoqxyCL0OJM4BFJ7rHkDQ9DlGs3UdmheQgtsuPTPaSarYl
         klpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792173722; x=1792778522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8qQe86RR8HXxapm056thr/pToC7ExVCLVe21t5Z5pE=;
        b=LEqiQv4acHpw1jyBuq1ElSHbCNSJHLkHiJJfkX+cOZbiaisrfGdk+RVc8b4/Fxxz3s
         Du9JLPQFqbCdifjOttxVryrbEJE/dlA5brkL81ipbKDslbuSjW66wtTzsJfOe973A3UX
         KJ5s7Eh/QMMbDtISVlV+2SaRnm6DJDFHOikAb1OflDM9YJzXG+HX74+eZuvbmq12B/Ye
         qwaLes/P0bMgQGwDrgBMp+jfuyKofBLDVMrxGUAgWaHgzld9c+cZU6RU+lklS6jucf2r
         4y+qDLzJIOqYBpmm5ZlbVeEpDAPQFgqnouXCiksnz3h5BIQKvzmgu94dA/pd8Alyyc2c
         jwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173722; x=1792778522;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8qQe86RR8HXxapm056thr/pToC7ExVCLVe21t5Z5pE=;
        b=dfcAywlzo10qEuJdVu/qykYW6jcGkuRxjPzUFlXOoxcez/HcwgA5RL2vC3jai98nFV
         4KnA5E49x6aX+7fBXaHwuvzl6+4eIoBvsN2BdAR+CpF+wpH4S9rlAhMXuz+hdyxQ+zJ/
         iSWNXXrwoN7yqpMMTbHP1HDMdJc3RWyVrtDLNtuyUkFwnwYBsBllcF8qQ1gH7xYZUwFt
         ovfTJH7v0U6esuA64LhDQJYOc1/4MsAmshxGgiqN17PY0Ps3lg5fjgR3n5QIig6oPRSh
         ZC40PAEh3qVXKBwUreJkfO7t/V3SHIGgovZm5PJ4GXEYKZ7DyCYkr0uR7eSfRtPsOhsO
         kgkA==
X-Forwarded-Encrypted: i=1; AKwUvBzoBQcipFuITMmoxgAs592wvsCiXj1HNFWiFy+OMV5u2PTWTPWqCcxfPip+kReaAYyDVV/A+ZPxyIGqyBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLr5Z9q1peQh8xQSidqQXK01umQwMGWWynKRMv16pglu/RGYe3
	gCacYOM1L43ZRRPwhpTBtkbk5pvsrWHKewvLadbZE69k8kO9F7KDPb3ktdXtZzVoI6xe97VeAfh
	0bNTnDQWLk7LhVIGa22g6WX8UAGGyihw=
X-Gm-Gg: AYBFou1dIDegppaEpHno+rBZTJnPPE7LlG6yPzOmuYOdxhC4Gu42z2gVexbnBBpWzVS
	rT58yQDqHUpNWA3mGL/HWns+xAHuxYqGrw3wJmHm8U+jx2J9PXfInsw66hHCzxvB4yb/mqIEqa7
	fvsy7cJVFNb7105OaAQTIM+iV/kQfGNSkykTsTRk2P7/NH/5e7RXmkbYkpSADgIZ2IJF/6TUtwm
	OEq/7GCHKXe3H0HnvmzY45TprejDPtq2eAamo+YMFmUmWXojL6zpW3YnLiyUHHRwZ3cPQn5Wbam
	XW5j/xGS35IFilIcT7VAHymI55TXANYRKZXEieD0mMeWA81qN2Rnv/iSFQDGzbR/uhR7J5j47gv
	S0uQWndrKS5N3M0If0CuHAayOZNvKXXAgl4e3Xo4=
X-Received: by 2002:a05:690c:1c:b0:89a:63bc:8d7 with SMTP id
 00721157ae682-8b0f21f88dcmr2510727b3.97.1792173721586; Fri, 16 Oct 2026
 11:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016170122.27119-1-cochcoder@proton.me>
In-Reply-To: <20261016170122.27119-1-cochcoder@proton.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Fri, 16 Oct 2026 14:01:49 -0400
X-Gm-Features: AclHuK9ZyyR23qPjum4PoTdtTN1qerXHkiUhOwDyLa83JFEN6lz1mPVQspfelRw
Message-ID: <CABBYNZ+fiAn9kNYUCVXRE1vjK_HggdVPzsA5rap5TZayqY11hg@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: request LE data length for affected MT7922 firmware
To: Kyle Pepper <cochcoder@proton.me>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	sean.wang@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Fri, Oct 16, 2026 at 1:01=E2=80=AFPM Kyle Pepper <cochcoder@proton.me> w=
rote:
>
> On an ASUS G614PR, the MT7922 USB controller 0489:e0f6 accepts maximum
> LE suggested default data lengths, but ASHA playback remains severely
> choppy until the host sends an explicit LE Set Data Length request.
>
> With the firmware image dated 2026-07-24 14:38:15, a request on the same
> Cochlear Nucleus 8 connection produces a Data Length Change event with
> TX 251 octets/2120 us. Delivery rises from 21.5 to 50 audio SDUs/s and
> the peak outstanding packet count falls from 32 to 3. Wi-Fi power save
> remains enabled. Playback also works with the automatic request in the
> local 7.2.9 kernel build.
>
> Keep the existing suggested-default initialization and add a driver-set
> quirk for the tested USB ID, chip and firmware image only. After a
> successful remote feature exchange, queue a request using the current
> host defaults if the central-role link and controller support DLE and
> the controller advertises LE Set Data Length.
>
> Hold a connection reference while queued and recheck its membership,
> state, role and capabilities before constructing the command. Release
> the reference on completion, cancellation or queue failure. Failure of
> this optional request must not reject connection setup. Other controller
> matches, PHY fallback and suggested defaults are unchanged.
>
> Assisted-by: OpenCode:gpt-6.1-sol
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> This is the first submission of this MediaTek-specific fix. It follows
> Luiz's suggestion, in review of a separate generic DLE RFC on October 13,
> to use a driver-set quirk if a controller needs explicit DLE. It is not
> a revision or resend of that generic request.
>
> Differences from the separate generic RFC:
> - Require the exact tested USB ID, chip and firmware image build.
> - Keep the existing suggested-default write unchanged.
> - Require a central-role link, local/peer DLE and command support.
> - Use current host defaults, not hard-coded transmit limits.
> - Keep referenced queued work, cancellation and locked revalidation.
>
> Tested on ASUS G614PR with MT7922 and a Cochlear Nucleus 8:
> - Manual same-connection request: 21.5 -> 50 SDUs/s, peak queue 32 -> 3.
> - Automatic request: local 7.2.9-arch1-2-asha-mediatek boots and playback
>   is reported working; the matching firmware and quirk log are present.
>   This local kernel/userspace stack has other ASHA patches. This is not
>   a vanilla upstream-kernel hardware test or a post-boot throughput trace=
.
> - Broader suspend/resume, battery, other-profile and native concurrency
>   coverage is not claimed. An earlier brief quality drop is not assigned
>   a cause or declared independently resolved.
>
> Validation on Bluetooth upstream base 185c11232d5f:
> - Four native Bluetooth objects compile with W=3D1 on an x86_64 diagnosti=
c
>   configuration (Rust disabled); this is not a full upstream kernel build=
.
> - 37 source-extracted ASan/UBSan controls pass, with unpatched baseline
>   and negative controls. These are not in-kernel concurrency tests.
> - Equivalent backports pass the same controls on pinned 7.2.y, 6.18.y
>   and 6.12.y snapshots. The 6.18.y and 6.12.y variants also compile the
>   four native objects with W=3D1. No older-kernel hardware boot is claime=
d.
>
> The firmware gate uses the selected image header. If setup reuses an
> already-resident image, this is not an independent read of that image's
> identity; the observed boot log matches the tested image. Please review
> this limitation before widening the match to other firmware or devices.
>
> Stable consideration: this fixes a real firmware interoperability issue,
> but the change exceeds the usual 100-line-with-context stable guideline.
> Please assess stable suitability after upstream review. No introducing
> kernel commit has been established, so no speculative Fixes tag is added.
> The 6.18.y backport uses the older connection-feature layout. The 6.12.y
> backport also uses scalar quirks and checks queued duplicates before
> taking a reference, since queue_once() there returns zero for duplicates.
> Backport application/API differences and checks are documented locally;
> no stable acceptance, older-kernel hardware test or public issue closure
> is claimed. Please do not queue an unreviewed backport directly.
>
>  drivers/bluetooth/btmtk.c        | 29 ++++++++++++++++
>  include/net/bluetooth/hci.h      |  6 ++++
>  include/net/bluetooth/hci_sync.h |  1 +
>  net/bluetooth/hci_event.c        |  8 +++++
>  net/bluetooth/hci_sync.c         | 58 ++++++++++++++++++++++++++++++++
>  5 files changed, 102 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 75483d823..cab5c4c36 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -47,6 +47,24 @@ struct btmtk_global_desc {
>         __le32 section_num;
>  } __packed;
>
> +static bool btmtk_needs_manual_dle(struct hci_dev *hdev, u32 dev_id,
> +                                  const struct btmtk_patch_header *hdr)
> +{
> +       static const u8 affected_build[16] =3D "20260724143815";
> +       struct btmtk_data *data;
> +
> +       if (hdev->bus !=3D HCI_USB || dev_id !=3D 0x7922)
> +               return false;
> +
> +       data =3D hci_get_priv(hdev);
> +       if (!data->udev)
> +               return false;
> +
> +       return le16_to_cpu(data->udev->descriptor.idVendor) =3D=3D 0x0489=
 &&
> +              le16_to_cpu(data->udev->descriptor.idProduct) =3D=3D 0xe0f=
6 &&
> +              !memcmp(hdr->datetime, affected_build, sizeof(affected_bui=
ld));
> +}
> +
>  struct btmtk_section_map {
>         __le32 sectype;
>         __le32 secoffset;
> @@ -219,6 +237,9 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, c=
onst char *fwname,
>         u32 section_num, dl_size, section_offset;
>         u8 cmd[64];
>
> +       /* Re-evaluate the firmware-specific workaround on every setup. *=
/
> +       hci_clear_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN);
> +
>         err =3D request_firmware(&fw, fwname, &hdev->dev);
>         if (err < 0) {
>                 bt_dev_err(hdev, "Failed to load firmware file (%d)", err=
);
> @@ -347,6 +368,14 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, =
const char *fwname,
>         /* Wait a few moments for firmware activation done */
>         usleep_range(100000, 120000);
>
> +       /* This firmware accepts maximum suggested defaults but needs an
> +        * explicit per-link request to negotiate a larger TX data length=
.
> +        */
> +       if (btmtk_needs_manual_dle(hdev, dev_id, hdr)) {
> +               hci_set_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN);
> +               bt_dev_info(hdev, "Using explicit LE data length requests=
");
> +       }
> +
>  err_release_fw:
>         release_firmware(fw);
>
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 1c992e875..513ca226d 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -340,6 +340,12 @@ enum {
>          */
>         HCI_QUIRK_BROKEN_LE_CODED,
>
> +       /* The controller needs an explicit LE Set Data Length request fo=
r
> +        * each central-role connection despite accepting suggested defau=
lts.
> +        * Set during the vendor setup callback for affected firmware onl=
y.
> +        */
> +       HCI_QUIRK_NEEDS_LE_SET_DATA_LEN,
> +
>         /*
>          * When this quirk is set, the HCI_OP_READ_ENC_KEY_SIZE command i=
s
>          * skipped during an HCI_EV_ENCRYPT_CHANGE event. This is require=
d
> diff --git a/include/net/bluetooth/hci_sync.h b/include/net/bluetooth/hci=
_sync.h
> index 59cb918d1..5a37d3e50 100644
> --- a/include/net/bluetooth/hci_sync.h
> +++ b/include/net/bluetooth/hci_sync.h
> @@ -194,3 +194,4 @@ int hci_le_read_remote_features(struct hci_conn *conn=
);
>
>  int hci_acl_change_pkt_type(struct hci_conn *conn, u16 pkt_type);
>  int hci_le_set_phy(struct hci_conn *conn, u8 tx_phys, u8 rx_phys);
> +int hci_le_set_data_len(struct hci_conn *conn);
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 56ad10ab9..d78f330e3 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -6875,6 +6875,14 @@ static void hci_le_remote_feat_complete_evt(struct=
 hci_dev *hdev, void *data,
>                                 conn->le_tx_def_phys &=3D ~HCI_LE_SET_PHY=
_CODED;
>                                 conn->le_rx_def_phys &=3D ~HCI_LE_SET_PHY=
_CODED;
>                         }
> +
> +                       if (hci_test_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_D=
ATA_LEN) &&
> +                           conn->role =3D=3D HCI_ROLE_MASTER &&
> +                           (hdev->commands[33] & BIT(6)) &&
> +                           (hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) =
&&
> +                           (conn->le_features[0] & HCI_LE_DATA_LEN_EXT) =
&&
> +                           hdev->le_def_tx_len > 27)
> +                               hci_le_set_data_len(conn);
>                 }
>
>                 if (conn->state =3D=3D BT_CONFIG) {
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 7ac26daba..f919249e9 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -8152,3 +8152,61 @@ int hci_le_set_phy(struct hci_conn *conn, u8 tx_ph=
ys, u8 rx_phys)
>
>         return (err =3D=3D -EEXIST) ? 0 : err;
>  }
> +
> +static void le_set_data_len_complete(struct hci_dev *hdev, void *data, i=
nt err)
> +{
> +       struct hci_conn *conn =3D data;
> +
> +       bt_dev_dbg(hdev, "err %d", err);
> +       if (err && err !=3D -ECANCELED && err !=3D -ENODEV)
> +               bt_dev_warn(hdev, "Failed to set LE data length (%d)", er=
r);
> +       hci_conn_put(conn);
> +}
> +
> +static int hci_le_set_data_len_sync(struct hci_dev *hdev, void *data)
> +{
> +       struct hci_conn *conn =3D data;
> +       struct hci_cp_le_set_data_len cp;
> +
> +       hci_dev_lock(hdev);
> +
> +       if (!hci_conn_valid(hdev, conn) || conn->type !=3D LE_LINK ||
> +           conn->role !=3D HCI_ROLE_MASTER ||
> +           (conn->state !=3D BT_CONNECTED && conn->state !=3D BT_CONFIG)=
) {
> +               hci_dev_unlock(hdev);
> +               return -ECANCELED;
> +       }
> +
> +       /* Use the current suggested defaults, including later host chang=
es. */
> +       if (!hci_test_quirk(hdev, HCI_QUIRK_NEEDS_LE_SET_DATA_LEN) ||
> +           !(hdev->commands[33] & BIT(6)) ||
> +           !(hdev->le_features[0] & HCI_LE_DATA_LEN_EXT) ||
> +           !(conn->le_features[0] & HCI_LE_DATA_LEN_EXT) ||
> +           hdev->le_def_tx_len <=3D 27) {
> +               hci_dev_unlock(hdev);
> +               return 0;
> +       }
> +
> +       cp.handle =3D cpu_to_le16(conn->handle);
> +       cp.tx_len =3D cpu_to_le16(hdev->le_def_tx_len);
> +       cp.tx_time =3D cpu_to_le16(hdev->le_def_tx_time);
> +
> +       hci_dev_unlock(hdev);
> +
> +       return __hci_cmd_sync_status(hdev, HCI_OP_LE_SET_DATA_LEN,
> +                                    sizeof(cp), &cp, HCI_CMD_TIMEOUT);
> +}
> +
> +int hci_le_set_data_len(struct hci_conn *conn)
> +{
> +       struct hci_dev *hdev =3D conn->hdev;
> +       int err;
> +
> +       err =3D hci_cmd_sync_queue_once(hdev, hci_le_set_data_len_sync,
> +                                     hci_conn_get(conn),
> +                                     le_set_data_len_complete);
> +       if (err)
> +               hci_conn_put(conn);
> +
> +       return (err =3D=3D -EEXIST) ? 0 : err;
> +}
>
> base-commit: 185c11232d5f586489bb3b74e6bcc7a6560ddd40

Perhaps before we go into the whole trouble of adding a quirk we
should check with MediaTek folks if there is a fix planned for this,
since this is actually a firmware bug. If there isn't one and a fix
would take time to be validated, I'd proceed with the quirk but I
don't think gating it on a specific build is a good idea; there might
be other firmware releases affected by this, unless MediaTek can
confirm this is exclusive to a single image in which case we should
treat it as a regression.

--=20
Luiz Augusto von Dentz
