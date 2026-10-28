Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793196327;
	b=I3Iz0kWpfSbgvNaFrw9p1e/wTEQWQzgf93WHy6SD/ILas7jQL6nSG20O+MJryhTg390X
	 4zz3zqpLeqcEV4/fL1FE734Omsydr5FiNLQTaYEvV6lfoDSUj5dpFfKcQGNjrSdeTPqYD
	 +3yWrzAefiW7fM7/cjNDugf4WFK6fgO+f1/icQXy168mvBwJSYE4WEycrFxXSnW47C8i5
	 J0FADsV/q/nxKw9eOJskGBa1sCGEWKOtHLnUWy894zuezQ6fYVVq3u1+ywjCu6GLXD0ZV
	 EasZF91E6isDZI0ZGxWsjcwCy94Vd3JYLP7NLyodtAMNRHw0UtqNfcI/CfIIfSFZzvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793196327;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=N+ciVHFmq5RBve5HH1hHn1BPa0i2H0b/r0Sm1htfBLI=;
	b=D0Fpw2fovGMp+EopsLdcNv0kyzJFFISY2dqzB0zRUWKmqbDrou8TiFGtZOBZZiiM1j9s
	 sEjITkKT6n4EEBeJI5dzohrCr96vfAGriYcc27R6+08MRisvG/t7U0cwQQA3PwzGsmtGJ
	 weOe+OkEXBbCIigJ7zJiAgVqOzgzP5y+wsrbv0x/gMwVMcqIJL6WRU/UIOpjOTInY0EzI
	 7Be5eaUQMlFdLqDbPQRb6WsuvYb23tqYB1VWSPr4CFwjwC34SnZ/PDq35u9Clq9OrUgD3
	 14V2wdMI3ggT7xYlHDWUDpOQu0nQdK31qqVQV/DPPdqf8lqA/ijrhG5NN9fs8biuGSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Mwz871zN;
	arc=none smtp.remote-ip=79.135.106.31
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96309606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96309606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Mwz871zN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1793196324; x=1793455524;
	bh=N+ciVHFmq5RBve5HH1hHn1BPa0i2H0b/r0Sm1htfBLI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Mwz871zNkqog+TPiNC+Vpp3sQYIvainFrM9koF0Tq+bjd2FtPs0bZ5zx0lgs+hwmC
	 aCbaBgOYUBA4OwK3d0CNUEko4bXh6+yT1q5dPDydOeODs6ocdTyFci1kG1byTdNVL5
	 QS9ZKOlsFD8ghuHzQumLF5wr6WwhOAz7VaN++0fLa4l4M3/iaQu/SyE/EcNIe8KER2
	 WpSysYf+arWIENEeyBp0icjYv1LtfuxFkgOMzRxwCWYeXe9ZcHrO07g3qDJw8NhWMp
	 R5+HBF21GsryoUvadD3neHcUj0FHwNeMXWhmdmKGA7Sc9wNrntzOUI4hQMAupvog3l
	 jcVGw4HY+6X0g==
Date: Wed, 28 Oct 2026 14:05:19 +0000
To: linux-bluetooth@vger.kernel.org
From: cochcoder <cochcoder@proton.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci: Represent advertising report payloads as bytes
Message-ID: <Y6cAlirXtAS9pWAG1oay3YLbNw88cB8O4sDjEgoDnZrn3kKIWdDUo2MLkwWjYcmF4DWJ5s4WLSaXw5zc0sdDh5RT2dWo34mxaImxGQdetXM=@proton.me>
In-Reply-To: <20261014052244.416087-1-cochcoder@proton.me>
References: <20261014052244.416087-1-cochcoder@proton.me>
Feedback-ID: 97716137:user:proton
X-Pm-Message-ID: 28e9419bce9c3b50995513ba33ce49daed712d8f
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

Just checking in on this patch. Is there anything else I can do to help it =
move forward?



On Wednesday, October 14th, 2026 at 1:22 AM, Kyle Pepper <cochcoder@proton.=
me> wrote:

> Advertising records have variable-length data and cannot form a C
> array of flexible structures. Describe the report payloads as bytes
> to avoid Sparse warnings without changing their wire layout.
>=20
> Assisted-by: OpenCode:gpt-6.1-sol sparse
> Signed-off-by: Kyle Pepper <cochcoder@proton.me>
> ---
> Separate cleanup of warnings inherited from upstream, not a v2 of the
> UB500 shared-buffer RFC. The same two "array of flexible structures"
> warnings reproduce on that RFC's parent and exact submitted commit.
> The public bot report only contains the matching include-file note;
> its complete Sparse output was not available.
>=20
> Testing:
> - GCC W=3D1 C=3D2: hci_event.o and btusb_main.o, no diagnostics after cle=
anup.
> - Exact submitted UB500 commit plus this cleanup: same clean checks.
> - Strict GCC/Clang layout checks and LLVM/32-bit hci_event.o builds pass.
> - GCC hci_event .text section is byte-identical before/after cleanup.
> - A guest carrying the cleanup passes pairing and both HoG variants
>   on baseline BlueZ and each of four independent ASHA topics: 15/15.
>=20
> This does not change the UB500 quirk or certify an unseen complete
> remote Sparse report. No full architecture/configuration build matrix
> or physical hearing-aid regression test is claimed.
>=20
>  include/net/bluetooth/hci.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index 1641d879d..e873ffc15 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -2972,7 +2972,7 @@ struct hci_ev_le_advertising_info {
> =20
>  struct hci_ev_le_advertising_report {
>  =09__u8    num;
> -=09struct hci_ev_le_advertising_info info[];
> +=09__u8    data[];
>  } __packed;
> =20
>  #define HCI_EV_LE_CONN_UPDATE_COMPLETE=090x03
> @@ -3058,7 +3058,7 @@ struct hci_ev_le_ext_adv_info {
> =20
>  struct hci_ev_le_ext_adv_report {
>  =09__u8     num;
> -=09struct hci_ev_le_ext_adv_info info[];
> +=09__u8     data[];
>  } __packed;
> =20
>  #define HCI_EV_LE_PA_SYNC_ESTABLISHED=090x0e
>=20
> base-commit: 609a23989d637e2f90522a37c62e65c8c9b8b0ff
> 
