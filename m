Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781373FF1AC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274320; cv=pass; b=azOeqa484uJdV8/bWS28k080k3rMY/2vhRwqSqThEggXApwGZnIfO5JvzZ9AeKo5gVC50EqMci5NoD8r1jO+E3s8Yq+7eBUdab3/uGjMlqkPbSQdUfmiTgr0w5pH6MaYH5OuJ6Z23nB6Gg8Ynpv23lKiIz7PHqa4Q/9HqhQ1YdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274320; c=relaxed/simple;
	bh=NIxKP6TZ2tnFViW03A80ROCVjYwpvgXFgLDGX0G5DlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3Dti+a27+mpuBCLR18G5m8c2FhNRGaIDNFCSUYWkGlZh5nC1pAsEDVosgXjsNTLnrxGISX8ifr7or+IsfWFt9lNsgHF2K29TTUarwTAq38e7HQssQSi2vtFKq8lNh2Lz9eVmVE5cbam6mPBvNhAMg+MaCSWpYlt5q5oDyZ0UPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFC4uFwB; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFC4uFwB"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66e5e33a9d0so1460884d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:51:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788274317; cv=none;
        d=google.com; s=arc-20260327;
        b=KfF4zmDYH3JR33d5K0chNq5kYsoIY0VHLkHftgWr+oQK9iBMKLObsvUwy19rVw5ZYU
         9wUdSpJuhuyE2+zC7Ybe3TyX+G9rOMrU8BbJnuZbk/i5Kp8oCurf3TfbZ8Wsai+cx190
         tTjtwu5Ml09Ht3GpoDbipwzuNbb/9SeNLVaLjuq0kq+JxF3ogE6bB4TuOv97NmOXf5X6
         fem2TV5CGPhD7bU3rA5WPTBoYziFCBagW1DK+FKzunyEUSbncC3LPCc0tbMyeOrd0vW0
         RCLQQU8cfvfQuxMYB+3FVxc85hpzHHQzRjVjv8nx1IuZUnLGYAI9YJI/ZogRPx7qtiVm
         uGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zEecowGV0URQUsGJB/9dYqORlnjv4pnsG8QOqOs5tM=;
        fh=miOJ5HAh+Mw7gbZycjl/nXXe7WUfjoxjtI9iw3aD7hI=;
        b=WpBsekMIBEyRG2Moo+9lxG2HabypEN+SVWfdiKjXauhpNceIbmB3PQQTaf0fcjVwJx
         8yDZdTYCC6snPefnBSmUiwUmsUwnSLHgo4gzx6Y+8V6o685yeLBPZPGq5PKmZGPm00GH
         onKQa+lVaDkaHHbKacfU5U4YSVPTEo0efWfKBcavUeOyx0NAa4SfuiU0CLlLOnxcrWVx
         dO5xBw1+gn7ZPnB/tBPVIS/cHerRbmqgz1eXDaT75sPZi7l34yddPmSfKHuUPnrzPLd5
         YTQAeLep0BvzaloZ7R4vSPzvegvnNIxBcLWNJ0B7Ac9My9tGglfKeNFQeCTwEAoolFqT
         3AGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788274317; x=1788879117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zEecowGV0URQUsGJB/9dYqORlnjv4pnsG8QOqOs5tM=;
        b=TFC4uFwBZ8vt70wQxkNT1YRMIM+4KNpQ11GJH7r6MK+9n2bt0NQkqnSJqoSbyWfiv7
         2RBg7DmAzdfsZkDAPrHfPy10970vUvRc6HjDnUdPWbNVZu7I1txhaEY5VcRsNSGTmCoO
         qP6OXZ04RzMZUhCkxyAthZ9nFjFdMundMP+84XWpBjUWTtdxfNOm3/l+jF59tjXu6tAW
         fIfTObJopb3BLPb1GXOdufm8e3CDdHuxnSi8hKSNPEMgzC/O4AsTFg25jsrPDQFBTD7m
         uCUKjcfRXAkNotWQ90tr32liskDn6cptUSDfadASdWZkPLLod9Ua0Zt8cpE4MDb6rwCe
         5g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274317; x=1788879117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zEecowGV0URQUsGJB/9dYqORlnjv4pnsG8QOqOs5tM=;
        b=U/KOPNKxaf3f6rZEAoDQDY7CpuXFyhebrtVNTG5IjuVDv4vUdU9Hs99M4vuOtaoqud
         e5ahRigzzp461X0QN7lAvsLYFr0mtexCVS775V5k0rKr2zOTHDNwWU1u6dDnpfVcKK/S
         jqMyLt+KPyK4Cj+LBZnbdsbvHQ4lepUfhmQrroTH2aTINIwbyEqh5yHsbtX1rEyV3s5t
         +YnybqWtOOKCTNpTcMLJH+ryqubB4iySRiZSHDkU7wzxeUzS+4GMMvNmIHf7RWrvAJHI
         8ahjkN2rPvXa2Nr2gQ8DkGKnJR0l+cziEIMYE0kFIo1cHhFmkEY598KP2PLAuIKhZ0rS
         X4+A==
X-Forwarded-Encrypted: i=1; AKwUvBwbpC7W2lvPDDOcEKlE3lnyV0v/OFF0clNPJq4/PgBce5ZF6OtlI74VOl5Tbl69OfYwxY7szbNGKt0mwm8=@vger.kernel.org
X-Gm-Message-State: AFuF++nIQVOxLCTJY1W6C5gG66G8XhfD+i8TJvcI2zjHmKn9xIroxLEK
	dZWz0UnlHT3NbjyMZyw/FHm2y/F7pWM2wtW0nsO12qQa0lAVgaKJYq3iwvdtYD7YNbhwa5Dsq/F
	RSycsQWBQvCSmEu4zHBkWog2MF/g3d7ni2HE99AU=
X-Gm-Gg: AYBFou3eTEBNzZBk2Z/RTCd2H9jl3mZuIdedKUxCtGgAqy1GHf9kkB+5MeYQokyEG4y
	ONuvYlMJS/zYp9DWyBoGNqWH3S9bp+6ZrAv/zR3zMfc7EVDTpeli8KIq3jwNLJLKOcCG3KypB72
	hS9x3TMQktZq6nzSnKc66x+7x3dt8K3uFKopiVB/ihRVAHH1HYSaMWc3yXPcQ2tWMBcKD7wJZOg
	jwheUzS3DOH7qwg+ukF0bNTccDz5Og7KdzJk4BUL8DjH98KKe95jU6A+BmvxctVSdsDIXYQ78cH
	us+hLTURL8RwVkqnik/HZ5bGWulVa5ANGKqgSwP6oI3yUZfQXnkpU7Hbuz9DSUk2Ws1j0ifCIp4
	bfUnY1fFpv38NcXpkduP/3QlIZDUd
X-Received: by 2002:a05:690c:c3c4:b0:81d:c233:aea0 with SMTP id
 00721157ae682-85d6a2e184fmr110198737b3.18.1788274317111; Tue, 01 Sep 2026
 07:51:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831090232.1726063-1-valentin.kindschi@fiveco.ch>
In-Reply-To: <20260831090232.1726063-1-valentin.kindschi@fiveco.ch>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 1 Sep 2026 10:51:44 -0400
X-Gm-Features: AcwNN1WJq7njKzkqAQuAxRsZa-_LfUiBoeox2YdRn2bi-oxKnMKFo1GT_Jvq8ys
Message-ID: <CABBYNZKp=a8+YQDj_b=jcmA1tVxW8HJG8yvsCFQHuDghZPmFzw@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: hci_sync: pause advertising for the scan
 address update
To: Valentin Kindschi <valentin.kindschi@fiveco.ch>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	johan.hedberg@gmail.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Valentin,

On Mon, Aug 31, 2026 at 5:03=E2=80=AFAM Valentin Kindschi
<valentin.kindschi@fiveco.ch> wrote:
>
> hci_active_scan_sync() calls hci_update_random_address_sync() with
> require_privacy set on every active scan start, which generates a
> non-resolvable private address and programs it with LE Set Random
> Address.
>
> BLUETOOTH CORE SPECIFICATION Vol 4, Part E, 7.8.4 states the controller
> shall return Command Disallowed (0x0C) for LE Set Random Address while
> legacy advertising or scanning is enabled.
>
> Advertising is only stopped beforehand when LL privacy is in use.
> hci_pause_addr_resolution(), called just above, returns early when
> !use_ll_privacy(hdev), so its hci_pause_advertising_sync() never runs.
> On a device that advertises while active scanning - a peripheral that is
> also a central - every scan start therefore issues a
> command the host can already know will be rejected:
>
>   Bluetooth: hci0: Opcode 0x2005 failed: -16
>
> The address write is not retried either: hci_set_random_addr_sync()
> defers only when hdev->random_addr is already set, and it never becomes
> set because the write keeps failing, so HCI_RPA_EXPIRED is not used here.
>
> Observed on a BCM43455 with Privacy=3Doff, one advertising instance and
> continuous active discovery, at the scan restart period (~10 s):
>
>   < LE Set Random Address  Address: 02:16:91:90:F1:D4 (Non-Resolvable)
>   > Command Complete       LE Set Random Address, Command Disallowed
>   < LE Set Random Address  Address: 26:90:57:96:9A:3E (Non-Resolvable)
>   > Command Complete       LE Set Random Address, Command Disallowed
>   < LE Set Random Address  Address: 16:32:01:BC:B5:CE (Non-Resolvable)
>   > Command Complete       LE Set Random Address, Command Disallowed
>
> Pause advertising for the address update regardless of privacy, and
> resume it on every exit path. Previously the resume was guarded by
> use_ll_privacy() and only reached on the error path, which matched the
> pause being privacy-only.
>
> One caveat this widens: when HCI_ADVERTISING is set,
> hci_pause_advertising_sync() also clears HCI_DISCOVERABLE and zeroes
> discov_timeout, and hci_resume_advertising_sync() restores only
> HCI_ADVERTISING. That side effect previously happened only with LL
> privacy; it is now reachable on every active scan start, so a device made
> discoverable through mgmt while repeatedly running active discovery would
> lose discoverability. Restoring it belongs in the pause/resume pair rathe=
r
> than here, but it is worth flagging.

Sashiko flagged this, so I think we need to fix it; otherwise, the
controller will not be considered discoverable upon resume:

https://sashiko.dev/#/patchset/20260831090232.1726063-1-valentin.kindschi%4=
0fiveco.ch

> With the patch, the same scan restart on the same hardware:
>
>   < LE Set Advertising Enable                            Success
>   < LE Set Random Address                                Success
>   < LE Set Scan Parameters                               Success
>   < LE Set Scan Enable                                   Success
>   < LE Set Advertising Parameters                        Success
>   < LE Set Advertising Enable                            Success
>
> Over 35425 records / ~4 min of btmon with continuous active discovery and
> advertising enabled there were no Command Disallowed responses of any
> kind, against one per scan restart before. A central could still connect
> to the device, confirming advertising is restored after the pause.
>
> A second capture on the same device, 221 s with an out-of-range peer
> causing two cancelled outgoing connections, shows the same result under a
> different mix of traffic: 2 LE Set Random Address, both Success, and no
> Command Disallowed of any opcode.
>
> Tooling disclosure (Documentation/process/generated-content.rst): an AI
> coding assistant was used to investigate this and to draft the change;
> the patch text and code are its output, reviewed by me. Inputs were btmon
> captures and kernel logs from the affected device, with the request to
> identify what re-issues LE Set Random Address every ~10 s and to fix it.
> Three earlier explanations it proposed were discarded after being checked
> against the captures: bluetoothd restarting service discovery; RPA
> rotation (excluded, Privacy=3Doff); and the static-address branch of
> hci_update_random_address_sync() (excluded, both random_address and
> static_address read 00:00:00:00:00:00). The cause was only established
> after decoding the command payloads, which showed a freshly generated
> non-resolvable address per attempt. Testing is as described above, on the
> device, using btmon and a second device to confirm connectability.
>
> Fixes: abfeea476c68 ("Bluetooth: hci_sync: Convert MGMT_OP_START_DISCOVER=
Y")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5 btmon
> Signed-off-by: Valentin Kindschi <valentin.kindschi@fiveco.ch>
> ---
> Changes in v3:
> - Resend, no code change; v2 had no reply. Rechecked that it still applie=
s
>   to bluetooth-next.
> - Added the second capture described above, taken with the two patches fr=
om
>   the "endless adv params retry" series applied, since in bluetooth-next,
>   confirming the fix holds with cancelled outgoing connections in the mix=
.
>
> Changes in v2:
> - Rebased onto bluetooth-next: mainline renamed use_ll_privacy() to
>   ll_privacy_capable(). No functional change.
>  net/bluetooth/hci_sync.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -6244,6 +6244,14 @@ static int hci_active_scan_sync(struct hci_dev *hd=
ev, uint16_t interval)
>         if (err)
>                 goto failed;
>
> +       /* LE Set Random Address is disallowed while advertising is enabl=
ed, so
> +        * pause it for the address update. hci_pause_addr_resolution() a=
bove
> +        * only does this when LL privacy is in use.
> +        */
> +       err =3D hci_pause_advertising_sync(hdev);
> +       if (err)
> +               goto failed;
> +
>         /* All active scans will be done with either a resolvable private
>          * address (when privacy feature has been enabled) or non-resolva=
ble
>          * private address.
> @@ -6272,13 +6280,18 @@ static int hci_active_scan_sync(struct hci_dev *h=
dev, uint16_t interval)
>         err =3D hci_start_scan_sync(hdev, LE_SCAN_ACTIVE, interval,
>                                   hdev->le_scan_window_discovery,
>                                   own_addr_type, filter_policy, filter_du=
p);
> -       if (!err)
> +       if (!err) {
> +               /* Advertising was paused for the address update above. *=
/
> +               hci_resume_advertising_sync(hdev);
>                 return err;
> +       }
>
>  failed:
> -       /* Resume advertising if it was paused */
> -       if (ll_privacy_capable(hdev))
> -               hci_resume_advertising_sync(hdev);
> +       /* Resume advertising if it was paused. hci_resume_advertising_sy=
nc()
> +        * is a no-op when hdev->advertising_paused is not set, so this c=
overs
> +        * both the privacy and the address-update pause.
> +        */
> +       hci_resume_advertising_sync(hdev);
>
>         /* Resume passive scanning */
>         hci_update_passive_scan_sync(hdev);
> --
> 2.34.1
>


--=20
Luiz Augusto von Dentz
