Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278D73C1D49
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608413; cv=pass; b=kYQqpbm1LfYMGbYwTePsSKFeiy1RWgZDPeXnQOy764CLA/cdop6CnUy63w7ckqgMyBGX3S7cx0AF9Zbnwmljabt0/EhHn6Aqt2tVkpJqzpi9yowAqF6cVvuIvroVqBiV9rq0TB4C2bYPm2aEVEQuEqiwxv3PykovdMVwRoaehNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608413; c=relaxed/simple;
	bh=1UsJqo9C87Ciifs8F862r7yWC4hNlSFZD3IfkEi3ziA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TJKEvJni6Jp1+UAIUAVmNHb/s/X6enSVLikw7h4HZqSwpdXrkwnVsf9AmUekOlNbnqT2svz8rQhOsS43JGK55aGjPTlJEPVJAs5RIyYrova5FX4WYyi7VboyriliMaoIOz7XqSPsth27IOMStNkCMqkS/ILZwTks0qiV5/YGikc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeotkfTl; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeotkfTl"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-67109935888so2828267d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790608411; cv=none;
        d=google.com; s=arc-20260327;
        b=TlA1SlAqXfpXthgqPC9DjavtBzN7obmli4aqga4Z7+GVAZK9Bx4+65v3iX6y4Cjp3l
         1gbhdolzsSLp5dxKUsrQYEJGeag4SfCXy+QDFIIvPhGL9d7lRy4FGAjNmm0QTotwhA/s
         trtlRYDdLM6bA+9lzFMZ7A9doQKAVpas7mSCszs+u+mb/WYk7Rbg320Ig5bbrMKoGuRI
         UiMUII+TTGGmr07H/SCfYTM/gDt3s7sPL3S325mTbBL+8JwEglpEglPRnDVY5CsrxCqG
         hwbmX2UfVG4dZr8RvIscc5ve84eQZUYUxfjYn0CfCGtu1njvl5rKa8rJx1l8rGkhcE0S
         z3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgUXEmGtPFvWKX2JKdvC/mkJTyYTTkYxMp8CVVXkLmk=;
        fh=GJLC0SV1lGku/wTdr7xGoitxrASUVhcgdEG4PIfMhfY=;
        b=C8wTerC8827TKptd8+RdCGdXKXuxXxky+d+PxUarZQ7gkvcH8PzInq6MIcXmp5mkKK
         7QUNg2hFxeuWhpAxDq9ilwHFUlU0GUwbNS+Iczm0uvvaNlUCuA0wbUB3HECvatTStQGd
         C6N7fPXfkhvzFIf3j4QTiK2JkSsngdhX9137sjDNVw9t/LsQ93Uay0L8dGsGeI/WWjHY
         mmZgr8zH2um9NNgv1r9zeFciLkpyfhsUV/1uQpcYq6AkK2ObjnINyGujqfq0riFkzIfU
         cIrdnyQBbyo1DbWUPFY7WJgqaiu1SYoBG7pYDMb4E+qDqnq0ENEublekBs+Ci0743dA8
         AIIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790608411; x=1791213211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgUXEmGtPFvWKX2JKdvC/mkJTyYTTkYxMp8CVVXkLmk=;
        b=DeotkfTlhslfCsR1xAKQEOPhDbopxe6kKvccbZFP+65hMkTpoGVcAzJUIPICEqfMqH
         DgyckGnkfjgFmC/PtvkGcFe+d6ewMrHbvm52K4TZmkmXn7ZQmUBFtAGoAhxtrNcTSoAq
         jv/5VBUejvSKa5lkvI1Bz41FfBlobL1AC9hNiNVjmKIX2/7S9gzS28BJ6YXoY0ZwW1vu
         vvwtqiVOOpj3NEKgRRWAZU5+09iWHKkef6ajg6PDgoTuRMw43uVxmWeTp/KhO+ZXeLpv
         6vAudcJkhnVwQGRx2cqhjKikpjNcxx2coH88234dmusTO49sBTiIFDg2JZfCJRDQicEV
         FTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790608411; x=1791213211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgUXEmGtPFvWKX2JKdvC/mkJTyYTTkYxMp8CVVXkLmk=;
        b=qDbxMK3lnCJM390ubk8FIN2OZ0PK1OS8Shb0aLkyvbVbQlTdpwllJm9wADxS2u2B21
         yrdPsWgGy/+Dg8+hlcWpX7QQKQMdR9DglnFxXI+Pmz9MD4VFYGVuU7wtBqsN9kRQblMn
         VOiaRYnCZyj7OzDUCb1w8YYcpFs2My+DgRvRrdOox+uhJAVFqf6Z8VH5F0P3MWKG4mkc
         +6B+h8yeEmfH0Ma2GhmMkJ3Cd045oWLQ9Y/BSMUND7SpwZmJYIyjyVxz6jNUWzmvfa5D
         1tly4fkSmP5BoiWJsbPJvOxzzN8+9mXrflLgETwulK1Qbdy/3sLbNSwmFgyC2DH8R8RK
         6b6A==
X-Forwarded-Encrypted: i=1; AKwUvBwDd12xHy9yvLmb3iT8B3ggv8GBG6niKKH1veIW6S1yp7cTqpjZPUeI0iBFExyADgycL2jWoXF/L2IVXEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkagYlqaIjt0FYyEwepzzxK6zduPvFw+mnIU5WnRy69YEjOa+r
	YSvoaPV1SvoJk5sQNwq2/7XbU1ofSg/HyKDSNCQXPVvf3gCl7jDgX9r9wTr1e0FaGwekV6HtSzX
	l/vkLoR6pJ60NVOtpjPIEbLI9CEi1qmM5g27f1Q2Y/g==
X-Gm-Gg: AYBFou1Bn4SnWlcE9zvMHMkdtyibRSiLAmU/A0dXyhyoSW5v0E8Yw5cxcPKMcz+xu45
	enbkx+UWJpFTU8nguCIYxewHmtA+gLmvQJ4tg5h3nhXZA385DNaqgL8YGppkqBMS/W8mE5P4cHB
	BWM0djCDTXhEY1iXs83s9pOK7kIM06D5LL1GWac2K9oRjL/rCND7ySTudoFIoCaapjzYrOTuhqF
	HUvzLcGySQ8PjT2lGDHjtI3cUBkbKVlvVC/wTEld8JMhTkU9x/NbFbPSkTIr21yfHkNUvkIoCXY
	nPbiCXSQA7RGR3Wvtrm9WOtl2uGyT1WwYyN5o1rMeuSnlLbenViX6l4AZA2JFxBGvNLCLKeeVyK
	mYbHDtmw4snHLSXvpmsPF7SxFyac26U6QqKXEy3OhSxA=
X-Received: by 2002:a53:ac93:0:b0:674:12cb:7404 with SMTP id
 956f58d0204a3-67412cb7f06mr4542205d50.45.1790608410903; Mon, 28 Sep 2026
 08:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <arOMTa0L7QhM5RyA@sirena.co.uk> <96944c10-2a31-4e54-923f-97a608663221@sirena.org.uk>
In-Reply-To: <96944c10-2a31-4e54-923f-97a608663221@sirena.org.uk>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 28 Sep 2026 11:13:19 -0400
X-Gm-Features: AclHuK8O5HRte62z02ls5-oGhm4JsX3VKeU_qkndC4W_2k_Z4YobrGAMwqMbHWE
Message-ID: <CABBYNZL_vs+_MudyOBDK+pBJtOYcEEE6snUhU_btwAuW0RTjDQ@mail.gmail.com>
Subject: Re: Missing signoff in the bluetooth tree
To: Mark Brown <broonie@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Weird, this should have been fixed in the last back merge, going in
the list of commits in bluetooth-next
https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.gi=
t/log/
they show as:

commit c9c15d4d8956df8c564f7c210e4dc5b9b820d97a (gitolite-bluetooth/master)
Author: Sai Teja Aluvala <aluvala.sai.teja@intel.com>
Date:   Tue Sep 22 18:33:11 2026 +0530

    Bluetooth: btintel: validate DDC record lengths

    Parse DDC record lengths in unsigned storage so 0xFF does not wrap.
    Reject records smaller than the mandatory three-byte header, records
    exceeding U8_MAX, and records exceeding remaining firmware bytes before
    issuing Intel_Write_DDC.

    This issue was reported by Claude Mythos.

    Fixes: 145f2368c5fd ("Bluetooth: btintel: Add Device Configuration supp=
ort")
    Signed-off-by: Sai Teja Aluvala <aluvala.sai.teja@intel.com>
    Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

commit d1ac915fb4184faad1b62148be50f317de7c24b5
Author: Sang-Hoon Choi <csh0052@gmail.com>
Date:   Tue Sep 22 03:49:28 2026 +0900

    Bluetooth: hci_core: free the HCI ID if naming fails

    hci_register_dev() allocates an ID before calling dev_set_name().
    If naming fails, it returns without releasing that ID. The device has
    not been registered and hdev->id has not been assigned, so the normal
    unregister path cannot release it.

    Free the allocated ID before returning the naming error.

    Fixes: dcda165706b9 ("Bluetooth: hci_core: Fix build warnings")
    Reported-by: Changyul Lee <lcy8047@gmail.com>
    Assisted-by: LLM
    Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
    Reported-by: Changyul Lee <lcy8047@gmail.com>
    Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

commit 74847177eca5638827ab74cdf77f0b10fc40ca6c
Author: Linmao Li <lilinmao@kylinos.cn>
Date:   Tue Sep 22 10:01:41 2026 +0800

    Bluetooth: hci_core: Fix inquiry cache timestamps on 64-bit systems

    On 64-bit systems, outgoing BR/EDR connections always fall back to page
    scan repetition mode R2 with no clock offset once the system has been
    up for more than five minutes, even when inquiry found the peer only
    seconds earlier. This lengthens paging and can increase the risk of a
    Page Timeout.

    The inquiry cache stores jiffies in __u32 timestamps, but its age
    helpers subtract them from unsigned long jiffies. INITIAL_JIFFIES casts
    -300 * HZ through unsigned int, so jiffies crosses 2^32 five minutes
    after boot on 64-bit systems. Assigning it to __u32 then drops the uppe=
r
    32 bits. In one trace, a 7.6-second-old entry (HZ=3D1000) was reported =
as
    2^32 + 7620 ticks old and rejected by hci_acl_create_conn_sync().
    hci_inquiry() is affected by the same truncation when checking the whol=
e
    cache. 32-bit systems are unaffected because unsigned long is 32 bits
    wide there.

    Use unsigned long for both timestamps so they have the same width as
    jiffies on 32-bit and 64-bit systems, and update the debugfs format
    specifier accordingly.

    Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
    Cc: stable@vger.kernel.org
    Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
    Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

commit f771f96557a4d953a7e4d045870547271e36e819
Author: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
Date:   Tue Sep 22 12:10:22 2026 +0530

    Bluetooth: btintel_pcie: reject oversized TX packets in send_frame()

    btintel_pcie_send_frame() eventually copies skb->data into a fixed
    BTINTEL_PCIE_BUFFER_SIZE (4096) DMA buffer via memcpy() in
    btintel_pcie_prepare_tx(), with a 4-byte PCIe type header prepended.
    A user-space process with HCI_CHANNEL_USER access can inject an
    oversized packet and overflow the buffer.

    Reject packets larger than
    BTINTEL_PCIE_BUFFER_SIZE - BTINTEL_PCIE_HCI_TYPE_LEN on entry.

    Fixes: 6e65a09f9275 ("Bluetooth: btintel_pcie: Add *setup*
function to download firmware")
    Cc: stable@vger.kernel.org
    Signed-off-by: Chandrashekar Devegowda <chandrashekar.devegowda@intel.c=
om>
    Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

commit 7dbeb6935ac331b0cba6c41cabd8e9d02d5f64ea
Author: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
Date:   Tue Sep 22 12:10:21 2026 +0530

    Bluetooth: btintel_pcie: fix plen overflow in btintel_pcie_recv_frame()

    plen is u16 and computed as HDR_SIZE + dlen. For ACL/ISO frames dlen
    is a 16-bit field, so a value >=3D 0xFFFC wraps the sum, bypassing the
    "skb->len < plen" check and letting skb_trim() truncate the packet.

    Widen plen to u32 so the addition cannot wrap.

    Fixes: c2b636b3f788 ("Bluetooth: btintel_pcie: Add support for
PCIe transport")
    Cc: stable@vger.kernel.org
    Signed-off-by: Chandrashekar Devegowda <chandrashekar.devegowda@intel.c=
om>
    Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

commit 40eb4b18ad167b63644c27fa67a7400ba050379a
Author: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
Date:   Tue Sep 22 12:10:20 2026 +0530

    Bluetooth: btintel: fix buffer over-read in btintel_hw_error()

    The "Exception info %s" print uses skb->data + 1, but the 12-byte
    payload is not guaranteed to be NUL-terminated and can be read past
    its end.

    Bound the print with "%.*s" and skb->len - 1.

    Fixes: 973bb97e5aee ("Bluetooth: btintel: Add generic function for
handling hardware errors")
    Cc: stable@vger.kernel.org
    Signed-off-by: Chandrashekar Devegowda <chandrashekar.devegowda@intel.c=
om>
    Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

On Mon, Sep 28, 2026 at 10:37=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Wed, Sep 23, 2026 at 10:22:37AM +0200, Mark Brown wrote:
> > Commits
> >
> >   4712bd9a14cbd ("Bluetooth: btintel: validate DDC record lengths")
> >   7348abd83a3b2 ("Bluetooth: hci_core: free the HCI ID if naming fails"=
)
> >   ea983244b99a3 ("Bluetooth: hci_core: Fix inquiry cache timestamps on =
64-bit systems")
> >   2b036342b623c ("Bluetooth: btintel_pcie: reject oversized TX packets =
in send_frame()")
> >   6d21e89e69775 ("Bluetooth: btintel_pcie: fix plen overflow in btintel=
_pcie_recv_frame()")
> >   4145a13c1a044 ("Bluetooth: btintel: fix buffer over-read in btintel_h=
w_error()")
> >
> > are missing a Signed-off-by from their committers
>
> This issue is still present today.



--=20
Luiz Augusto von Dentz
