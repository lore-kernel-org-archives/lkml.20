Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823072;
	b=GmSNX0tn2gapZB7wx565U5zpTgNvK26+69bnuIpLFCT8CW2sMbWr8W6P6o5j/yEwFprX
	 959Rs4v3LTi6AKXONc+YPe9gv7j7lbJRnBKwZ/QRUwUtzpZQ3ckJ5xGBGh2LjvgCWsGWW
	 7Ts7dg3TFGrn/68Jz9VGE2xuHpXk0xfn6t4+9u5qQnDkk7F6QBjmJWaLliCtcuwXWLj+a
	 mJTCXfz24JNUbicnsrdvbScC3MZE+B9dE3lSPJzH73tsgommUPfL2zE9doqxFvaqNgCL9
	 c0Lcow9iwnLOvnVw3BOck75MyxbA55ABDGvotSCJchXFOh3W7tHXW3tUNlhxWb5n/lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
	b=1tSavA5sCO7ULHCwg0eOc0DDdj8vJTD0sbLopcTWVVYzLsWlkjg5NVUmJeiUYZ+1knLx
	 uTWS7s4+5iYaBz7VpMSuyFFooTiqpZNHml+68cEaZee/VhiTqoyMImH97nnmNLGvkyFKH
	 aG85HAFnrCiC43sTgnT9PACQnRC+jcbFTDFz6vGXxmZLdMR8mU5zMNqme/8yjZQyLKKfA
	 OVx1+/53wUDyiB7p3T811f8dl8f+nbq8wWDMC2gNVBrsPt1v82dR8c/PMb/qv0ephgn1o
	 4Sw9rsri3CwTXaCm5YzZ85JTaZHGjXm8lwp7u/DQQFEqs0sfqWPs2m24svEXGf9gkqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SSUp2oWT;
	arc=none smtp.remote-ip=74.125.228.134
Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4E7606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:57:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F4E7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SSUp2oWT
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c50515c3ba6so191039966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794823069; x=1795427869; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
        b=SSUp2oWTZSry057Ydg93HqrTUD99Iiou03eTgBVn7fLueSQ7RevvpaJkCBUofQ4Lmj
         QRuzczAx457CvcqLBKTSKSUXNMydVc81Xu/eIKKDN6Ny9hGh4+szs2lvsuZmNqA20IlG
         iYyP3IxRzh9JI1nDuVvnLAO/FvHFTRwBTyI1n1T5pEzFIsOWYtSMPyWXBaW0hvzUmFEC
         nrCHsOVwLD6YGjs10b7ZM3FhbLGGsYLCmu+JJvM8dDoMNiNWwmy75JSeFpBOob2JwgBa
         jS8XlCbIIFAbSPVzpuZUX69h5W79oSs9gMy5AyTRGj5yneznI5OcfeZRB1UxLJr1BMVg
         dn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794823069; x=1795427869;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWv3RsE66Q/ysLjuk87PE8PT3esdU32Mz6gnhtaxttw=;
        b=Xzzs1GnMNVaJlz+N9XggodRlJZgZsj+hFrae10rluv8Mh/YqgVILJEmpy66bXiahlg
         1S8aNEK/H4nzvY126Zbpenb5JRounm2HS3aym5jS4xRstWnWbTAEQ8sjKVSOVw0Hq4xw
         ZFdIUGNOnx/qcOmblgOS/o8cGTiYa38nT7az/OeGbdj5RG0mL2xuwZz7ycBFmHgXRzIk
         X4f4RXUJJDmoepxREN/drQsu0w/A0Z6G0K6xiPEuBLoMX7oV+PLSbmPhlt2Myq5YCu1H
         TyC9AddegPiIxtqQhuL3zGtG/8s6LQWIcTOrH6QhwEtrX8ujs8gaJ1jJ9OMT/+q2RXXZ
         t3mw==
X-Gm-Message-State: APuU4Z+0N7tJszqxK5sPeMks9AQOPws+x1mRqsRTiLyJtxanX88MeeS7
	Blf03tDPvbGCd46PkBzGlSVKSou8p1UXifgj1osHWFpGja5Duz0UmaW9FDVB5C8KQjc=
X-Gm-Gg: AYBFou0CzsfStGqKOxhB6m8kCLNobigEd6/7ta1YwEgrcGacAbFV4y7d/vtc02zxWSh
	PV2HnGhlKX+7tXxxW78tNrz3aqHu4oqla3G8sEEEIFfd0IPmkel4JRcShv5gs5Jc1gHT2BzdyUr
	fswqlmZTk47hIKZ6q4cQckwr3wMTzzJpo/PmfbhtfPDWCeKP8rd8QIUoXQ6gYn89cbhYhGxNOzx
	yUGF4c8p9tchnd136h+mp3WLqZOsBR6v0pHMnpXc+ga2EcopQlWnYbxLei+TxnLzHK+tCqq3wMx
	zJrndMK/8pxB8dylckBYuJyP83Pn830lTS9RxoUfWW7pLW7mHGQUyB031yUG7BF2vJlvVSMLyFA
	4skWkrjWL5CAY8//R1Uf/r4DLTZyWPfehv30flrrOYeZE0x+0mkyfarKIGEAfgDuiGSg6qWWo71
	0vnGiLAv7uDkJXUZaNMPbT1sB8sYm4n92fc4tdORmhbkGeN4cYss5KSD4Ozvi+604nLSSfHRziY
	HyRUvMsuAlxkDQGzSUeQYQcGvneQzm89JXW7GIBdJvsTC1DCCNALW5RQcPQycR3gXzWSllrQDCu
	gzy3tHgo+W91/Wx6lX/pnnJrzVLwh491rFyLbs2xo0ELL89iC1w4xem/CPU=
X-Received: by 2002:a17:907:2d0b:b0:c24:4128:c19f with SMTP id a640c23a62f3a-c5096327391mr838159866b.11.1794823069529;
        Mon, 16 Nov 2026 01:57:49 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm392751766b.4.2026.11.16.01.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:57:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 10:57:48 +0100
Message-Id: <DMWJOF3M99U0.3G5IY77AS4CWQ@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, "Robert Dolca" <robert.dolca@intel.com>,
 <netdev@vger.kernel.org>, <oe-linux-nfc@lists.linux.dev>, "Samuel Ortiz"
 <sameo@linux.intel.com>, "Kang Chen" <void0red@gmail.com>
Subject: Re: [PATCH] nfc: fdp: reject an oversized device-reported packet
 length
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <hexlabsecurity@proton.me>, "David Heidelberg" <david@ixit.cz>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260615-b4-disp-f42dce2d-v1-1-186ff3dcbf37@proton.me>
In-Reply-To: <20260615-b4-disp-f42dce2d-v1-1-186ff3dcbf37@proton.me>

On Mon Jun 15, 2026 at 10:04 AM CEST, Bryam Vargas via B4 Relay wrote:
> From: Bryam Vargas <hexlabsecurity@proton.me>
>
> fdp_nci_i2c_read() reads the length of the next packet from the device
> into phy->next_read_size and uses it as the i2c_master_recv() byte count
> into a fixed on-stack buffer:
>
> 	u8 tmp[FDP_NCI_I2C_MAX_PAYLOAD];		/* 261 bytes */
> 	...
> 	len =3D phy->next_read_size;
> 	r =3D i2c_master_recv(client, tmp, len);
>
> When a "length packet" arrives (tmp[0] =3D=3D 0 && tmp[1] =3D=3D 0), the =
next
> length is taken verbatim from two device-supplied bytes:
>
> 	phy->next_read_size =3D (tmp[2] << 8) + tmp[3] + 3;
>
> next_read_size is a u16, so this can be driven as high as 65535 - far
> larger than the 261-byte tmp[] buffer - and it is never bounded before
> the next iteration's i2c_master_recv(). A malfunctioning, malicious or
> counterfeit FDP NFC controller (or an attacker tampering with the I2C
> bus) that sends such a length packet makes i2c_master_recv() write up to
> about 64 KB into the 261-byte on-stack buffer: a stack out-of-bounds
> write that clobbers the stack canary, saved registers and the return
> address.
>
> Reject a next_read_size larger than the receive buffer the same way a
> corrupted packet is already handled - drop it and force resynchronization
> - so a device can never drive an over-length read.
>
> Fixes: a06347c04c13 ("NFC: Add Intel Fields Peak NFC solution driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
> ---
> I reproduced the out-of-bounds write with an in-kernel test that drives
> the fdp_nci_i2c_read() buffer geometry verbatim under KASAN
> (CONFIG_KASAN_STACK=3Dy), modelling i2c_master_recv() delivering
> next_read_size device bytes into the 261-byte tmp[] buffer:
>
>   next_read_size =3D 281, no bound:
>     BUG: KASAN: stack-out-of-bounds in i2c_master_recv...
>     Write of size 281 ... [48, 309) 'tmp'   (the 261-byte buffer)
>   with the device length bounded to <=3D FDP_NCI_I2C_MAX_PAYLOAD (what th=
is
>     patch enforces): no KASAN report.
>   a well-formed packet (length <=3D 261) is unaffected, no KASAN report.
>
> The full device range - next_read_size =3D 65535 (tmp[2] =3D 0xff,
> tmp[3] =3D 0xfc; the u16 field truncates the + 3), a 65535-byte write =3D
> 65274 bytes past the buffer, smashing the stack canary and the return
> address - reproduces the same way under userspace AddressSanitizer on
> both -m32 and -m64.
> ---
>  drivers/nfc/fdp/i2c.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/nfc/fdp/i2c.c b/drivers/nfc/fdp/i2c.c
> index c1896a1d978c..0392bb49bb4b 100644
> --- a/drivers/nfc/fdp/i2c.c
> +++ b/drivers/nfc/fdp/i2c.c
> @@ -166,6 +166,20 @@ static int fdp_nci_i2c_read(struct fdp_i2c_phy *phy,=
 struct sk_buff **skb)
>  		/* Packet that contains a length */
>  		if (tmp[0] =3D=3D 0 && tmp[1] =3D=3D 0) {
>  			phy->next_read_size =3D (tmp[2] << 8) + tmp[3] + 3;
> +
> +			/*
> +			 * next_read_size is taken from the device and is used
> +			 * as the i2c_master_recv() count on the next iteration.
> +			 * A value larger than the receive buffer would overflow
> +			 * tmp[]; treat it like a corrupted packet and force
> +			 * resynchronization.
> +			 */
> +			if (phy->next_read_size > FDP_NCI_I2C_MAX_PAYLOAD) {
> +				dev_dbg(&client->dev, "%s: corrupted packet\n",
> +					__func__);
> +				phy->next_read_size =3D FDP_NCI_I2C_MIN_PAYLOAD;
> +				goto flush;
> +			}

Hi Bryam,

Just sharing because I find it curious, this issue has already been
addressed 9 years ago (August 2017) in Google's Android kernel:
https://android-review.googlesource.com/c/kernel/common/+/461836

Would've been nice if they would have shared it back then...

Regards
Luca

>  		} else {
>  			phy->next_read_size =3D FDP_NCI_I2C_MIN_PAYLOAD;
> =20
>
> ---
> base-commit: 8e65320d91cdc3b241d4b94855c88459b91abf66
> change-id: 20260615-b4-disp-f42dce2d-055035ea37ba
>
> Best regards,


