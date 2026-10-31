Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793470153;
	b=ypzhYzqx2pPSxGljm/pr+a8EdN0Nyeu0H7kgeBlayguVFOMgWvYsZ34QcWv0GHgC7IIY
	 I2UTcjExL+eGuWJWnW6yLfjFhD8MLreOey7YxeVFDh9ZliRcNMJyDoHOayvX1P7W1fNv2
	 paEXuDLjtN66b3ZIe/rvQliMLEpengNEfWNVuuJYJdvR3duvdeblefxG9mYZAoz4QYHts
	 r5Dh12eOQylyM8ivSpTf2EYI+jwNoIPsjjv5NWgoJBpHqLpgD9V6Dj3Bl1iqrDFAKZNXg
	 iRNjxg3sY+7OVUYINk4FgLws6z9VbH9PfWCDHAeRKcLujnEF6KVWs4UE4Y2m01VflZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470153;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AUe5JpIsNFTT2q3rT6/vsifX67OR+N/z1f7PoBQuEq8=;
	b=r/5B0XZD+gypXS3SyJ9alWS7revfBi8zbj3sK7A/WDbqLfzNYeFZE+geVvFhWeiG3Drv
	 0Uo2+ERxd9m6KqyV5SDUqYj3W+NIblu58sn+Fn6VBwRA67sxiFRjrxdZvwVnBONizxay1
	 ui8TtqaP2HrXhH805z9buZk2jwCEyCsZYPoSRM0GPMCtEFgpCcLdbafX8+UMAF0geucGd
	 2qWCmITlJbxxagRdm7DxpqU2Yzn/GiyrClGC1kAXlVXbcYIyYhNZVORaNK8rRydF/7ONm
	 La3+ITTVZSqhkmuXcCWD7LfOkyZp/OGRVoRXQmee/w6IcUPdPJ8XW52lBl3wbP2T9MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=zTJHfdCU;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B3606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2B3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=zTJHfdCU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793470148; x=1793729348;
	bh=AUe5JpIsNFTT2q3rT6/vsifX67OR+N/z1f7PoBQuEq8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=zTJHfdCUmWCWFNoiJPKcyigRtImaNuSOf/47D7s2fB+l+v3ipJP6Qvkv55AEAc0w1
	 aShZjE9/ttixu6OEV0ctpahMsFdqJqcI8W8wRwVenn5vgJa3xhpxXwoAei6/ZYJEYj
	 wYs0KC/0qXPrTVweqqfm1pvEVnG6rnuzb7qLgloeyUpjZWAAsAtWR2yjFkiHqTqaEm
	 zPePTgyfSK8zxo3OkbIhRm91kNHLe9F+JuO9ecouYstR+4ImqIFBQfd+PPY78wyJMt
	 6eqgBP67Z9i8V4tofV/t/wP8H1vXL2+ubwXFfGFxoBEV2UwaW71+EUK7hxJZs9PEGl
	 Q26hUBv+w7HQA==
Date: Sat, 31 Oct 2026 18:09:05 +0000
To: linux-bluetooth@vger.kernel.org
From: cochcoder <cochcoder@proton.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] Bluetooth: l2cap: prefer compatible local LE intervals
Message-ID: <U9F5oixolIn7sCsWRgoLg4RRPF59JWawz5PnydZ-lfzBksYIqgF1pe4J3wszH5KR1mxSkWjl4_wCtranBGh8iU3IXsRMslguQ2ie0DC4GQ4=@proton.me>
In-Reply-To: <20261015181041.42873-1-cochcoder@proton.me>
References: <20261013033118.501182-1-cochcoder@proton.me> <20261015043336.47734-1-cochcoder@proton.me> <20261015181041.42873-1-cochcoder@proton.me>
Feedback-ID: 97716137:user:proton
X-Pm-Message-ID: 3e5337eab550938f67c7ea029ca03bc2299a0b10
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Following up on this patch, is there anything else needed to move it forwar=
d?

Thanks,
Kyle


On Thursday, October 15th, 2026 at 2:11 PM, Kyle Pepper <cochcoder@proton.m=
e> wrote:

> Use a valid intersection of a peer interval range and local preferences
> when they overlap. Otherwise retain the peer request instead of treating
> an initial preference as a hard supported bound.
>=20
> Validate the original wire request first. Only narrow its interval range;
> leave latency, timeout and disjoint-range acceptance unchanged.
>=20
> Assisted-by: OpenCode:gpt-6.1-sol
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> Changes since v2:
> - Wrap test notes to avoid the GitLint B1 failure in series 1186108.
> - Refresh onto bluetooth-next ff8b09806b7b; no source delta from v2.
>=20
> Changes from v1 retained:
> - Treat local ranges as preferences, not supported bounds.
> - Prefer a valid intersection; otherwise keep the valid peer request.
> - Never repair an invalid original request by clipping.
> - Preserve latency, supervision timeout and disjoint-range acceptance.
>=20
> Prior native controls check the accepted L2CAP response and HCI range:
> overlap, fast HID fallback, slow idle fallback and exact match. Baseline
> passes 3/4; strict bounds pass 2/4 (reject HID/idle); v2 passes 4/4.
> The prior reference-guest full L2CAP suite passes 115/115, without skips
> or captured KASAN/lockdep alerts. These are prior runs, not fresh v3 VMs.
>=20
> The independent BlueZ test companion was sent as:
> https://lore.kernel.org/r/20261015044221.55631-1-cochcoder@proton.me
> Its overlap case intentionally fails without this kernel change.
> Completed-interval startup/stream gating remains separate profile work.
>=20
> The saved v2 CI report lists all jobs except GitLint passing, including
> the native L2CAP tester. This is not a remote CI result for v3.
> The combined Arch trial is reported working on hardware, not isolated
> testing of bluetooth-next or exhaustive device/negative-path coverage.
>=20
>  net/bluetooth/l2cap_core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> index 4dd56e007..afde04a19 100644
> --- a/net/bluetooth/l2cap_core.c
> +++ b/net/bluetooth/l2cap_core.c
> @@ -5031,6 +5031,19 @@ static inline int l2cap_conn_param_update_req(stru=
ct l2cap_conn *conn,
>  =09memset(&rsp, 0, sizeof(rsp));
> =20
>  =09err =3D hci_check_conn_params(min, max, latency, to_multiplier);
> +=09if (!err) {
> +=09=09u16 pref_min =3D max_t(u16, min, hcon->le_conn_min_interval);
> +=09=09u16 pref_max =3D min_t(u16, max, hcon->le_conn_max_interval);
> +
> +=09=09/* Local preferences must not reject a valid peer request. */
> +=09=09if (pref_min <=3D pref_max &&
> +=09=09    !hci_check_conn_params(pref_min, pref_max, latency,
> +=09=09=09=09=09  to_multiplier)) {
> +=09=09=09min =3D pref_min;
> +=09=09=09max =3D pref_max;
> +=09=09}
> +=09}
> +
>  =09if (err)
>  =09=09rsp.result =3D cpu_to_le16(L2CAP_CONN_PARAM_REJECTED);
>  =09else
>=20
> base-commit: ff8b09806b7b18884ad8d3a2b3d702da534a4e21
> 
