Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793967403;
	b=LDUZ2lJCiX5CbqP+C9Gm+I2MaDfTHKnjEm4h2i3XnWlrzxg6nFVVCrNjH0vH6lnCn9SG
	 BKXvkMet8c4aDCJa1ixpSRvuJF4E/SGiEEeQ+o2stucA7FrKPRPdjsXixvflz6dNoACy0
	 8lZkztvbOZvAjuiHRRuvL88tPUVqnyZbhHjB6XKmE/zidvEJtHeKaB52bzcmP3TL7gs3W
	 hNjK/sXpdkEuNop9MWe5kLGPhqiakS+NF44nJOULKnfkNdugQPtUE29HeVOzy5PQn/8yh
	 NdOCQSoDXpjF2rWkKZSb6N0Df5D4OO7IimvV4dxR7WZsykDjKo6UU1obGbnK2pUcXHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793967403;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=uPV41jSVh75rYc+JIJbUNHJbDDtf2LfeuBMNekJNoXI=;
	b=DJzQzYRpW2jJ+CwFNTduJHUrgonFGjC5Bn9pZwVtTddc8E+Tk1PgfbQAB/Zu25PhHjQ1
	 v5TLRg6j/uP2ihWpNF1VqW7IzN7EfbQjGF6cSVw0AGv8GG6CKeAnMNJUTDL7gk2xqsFW/
	 cOBDoS4JW5rqZPMr6jOeXd7Vlo7whXd8Gf8lPQCaBGh8Q9P5Vr9GwcCYAxZY5wcskp9v6
	 fxg/fgGNzTgxyv/Z+t9xPDIJEddEC5uPRFUnkqUVOmQGfG6kgz3MaZRG2ikaNxIQatpYC
	 yqGTr/yBnbYbFPHwyFrtOFDhBhHah74Cd0Ty6eQ60uTIJWLwyEG3bFR+HcHrBpIXLMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=aOiYjqch;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D4606A326;
	Fri,  6 Nov 2026 12:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 342D4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=aOiYjqch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793967363;
	bh=uPV41jSVh75rYc+JIJbUNHJbDDtf2LfeuBMNekJNoXI=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=aOiYjqchXoq+x7L4YmfMKFJdirrnFkXFaqMf2R0VSCuZzqYlLTNqZ4fqrVZ90uV0t
	 qV2m1u4e3x87MINI53+v5h2FY/SE0PzxNVk1BoxiEEk784AFusOt2+KJV06V6NfmLr
	 OKRG1CGrWNOkceXTzhhXZ0TMtWrSq95iL+oexfgM=
X-QQ-mid: zesmtpgz5t1793967357t99f51f88
X-QQ-Originating-IP: 5CM8gtx0OpiyIrvv908inz6iqEmJ5kK3cBL1mHMnBbk=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 06 Nov 2026 20:15:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2384512835884255270
EX-QQ-RecipientCnt: 16
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1b3755cfd99b64d0a0dda969f37ac993ccdcbb4bdd501bc08f16b6da9e66;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 06 Nov 2026 12:15:54 +0000
Message-Id: <DMO4CP89Q1AA.17HKYA50DLY8L@linux.spacemit.com>
Cc: <srini@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <dlan@kernel.org>,
 <troy.mitchell@linux.spacemit.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <p.zabel@pengutronix.de>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Jiayu Du"
 <duge1256@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Jiayu Du" <duge1256@gmail.com>
In-Reply-To: <20261106060525.346873-3-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NhOYPyditAFRQ5uYznxRKF8muA5nO+NaNcSH2Lhnac2NP9UG2XU0YBE7
	NSNa1+V5moxihLAFuACLYPZMTmpTrJtV25ZxbhJtE2nn5Tw1kneqTBBmD42OfK9JbpJeZvZ
	ESH9srt4i/zwtfgUQUERIuHzjHv6NO9wi7RYayeRNFYn4PGWvyRsudajNbSsRatHPoF8dN/
	Wn/3rbjJOHrpQS7BNCWNwPw2v1ZGfK2dP+jxIFxHWe0FMzpGgtkBtewBVDiSWuk1vmf//KS
	LtCxRhxfuQLT4AiBmtlb5bZyZ8/srxmqthG0pxwhmme2ZaES2ZNKnXgRzTnhhDOcCsGCib+
	wSaaOm/xfTRGjbhxoxWr28dZXUJIMmQK6+6HkMVO96OvoeHLRhlf2buLSpzMCeEMAcJlpkL
	wCCvQckU+2wWsi1uiFgUxzS46CTU2u7ctzE/CdJCyK/HFulq2tqxIYUfA1GZJG2fMFZW+st
	vptgWr5H5swm9TTCB3n+O7OjQolt6g670D/MU4xhbaq1l+fGTfdy7uADKO3FinWqKRoQxhx
	eeXaQ7Le6QAXloxWrP6eKVPtDEncmU6+7C4T7hjnK0EfBSV0ioLkFvqGs++J2qfui0LHUQE
	0HoDXKpZ6eujIs2PXbagVp20SLUCk1OGj0XmxahHndmUFQYa7K+SDrQ4K4VFrUgQdbnste5
	JAtM/Pn/7+3gMYRvC+lrBS63MIgBzN99F3eSCq3hLupML3kjdpLl1KA02IY0dj+2iSYK4mN
	Y52Q00skO2k2vFopzP1cr66dP4+Fdx/nzsgwCmfQSXX1anQziDzcOlqSTnr8UdXGlO7K44q
	F1IHau+ULbz4xQhpKjQ2mBb0aW4phraf6ODvHsZCG3FDf9jctl44sjqH1LedEKc/CON22QD
	azJB2a68rjhAQ25XMavtQAt5wR27w5RID8DgIPCYSIuVqHVl5E30/wCb4WUTxFw9AjmN/IY
	wZ5bfvgTb0YPCAZqfPypOiBtzkCIoZG5NGCUTVEpFY8f+7ACXXjs8NSHihe1RbXJ9CKQvvf
	PX4V1NoCMkHKLdmjf5aoIHXqI7jS/g0wP6y9PbPSazfu9vFwk3U6eEUPN8iXzcnsxi0d+HW
	hoEcGgT6R9kpGlhczNFJ34RVuOggf5J4TqsljIqCqcE
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--1b3755cfd99b64d0a0dda969f37ac993ccdcbb4bdd501bc08f16b6da9e66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri, 6 Nov 2026 14:05:24 +0800, Jiayu Du wrote:
> Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3
> eFuse controller. These banks contain temperature calibration
> parameters and other configuration data.
The rest of the window holds the root key and the SSK, which is why
only these two banks are exposed. Please say so here and in a comment
above k3_efuse_keepouts.

> Snapshot the shadow registers with aligned 32-bit reads and expose the
> data in little-endian order at controller-relative offsets. Serve
> reads from the snapshot and use keepouts for the remaining register
> ranges. Keep the AES_WTM clock enabled and its shared reset deasserted
> while the provider is registered.
Why keep the clock on? Reads are served from the snapshot and nothing
touches the hardware after probe.

Tested on CoM260:
- clock on only around the snapshot: probe and unbind/bind work, the
  clock stays off (AES_CLK_RES_CTRL 0x00c30050), same bank 0/7 data.
- this patch: unbind gates the clock and asserts the reset
  (0x00c30070 -> 0x00c30040), rebind reads the same data.
- this patch: 3s of WTM_RST or of clock gating leaves the shadow
  values and FUSE_READY unchanged.

[...]
>
> +	depends on COMMON_CLK && RESET_CONTROLLER
Not needed, both APIs have stubs.

[...]
>
> +#define K3_EFUSE_REG_SIZE		0x400
> +#define K3_EFUSE_BANK_SIZE		0x20
> +#define K3_EFUSE_BANK0_OFFSET	0x104
> +#define K3_EFUSE_BANK7_OFFSET	0x190
Nit: the last two are not aligned with the others.

[...]
>
> +	if (resource_size(res) !=3D K3_EFUSE_REG_SIZE ||
> +	    res->start % sizeof(u32))
No need to validate DT here. Drop it and use
devm_platform_ioremap_resource().

[...]
>
> +	reset =3D devm_reset_control_get_shared_deasserted(dev, NULL);
This asserts the reset on unbind, rmmod and probe failure. The fuse
data survives, but WTM_RST resets the whole GEU (FUSE_SCLK_DIV_CNTR
went back to its boot value). The driver does not need the block after
the snapshot, so use devm_reset_control_get_shared() and only
deassert it.

[...]
>
> +		for (i =3D 0; i < K3_EFUSE_BANK_SIZE; i +=3D sizeof(u32)) {
[...]
> +			put_unaligned_le32(val, efuse->data[bank] + i);
Please poll FUSE_READY (GEU_FUSE_STATUS bit 1, offset 0x184) before
taking the snapshot, and fail the probe if it never sets.

--=20
Troy Mitchell

--1b3755cfd99b64d0a0dda969f37ac993ccdcbb4bdd501bc08f16b6da9e66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCau3E+iEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8/6QEAllu4wjVxKXH3
uf4Pn1BZKUjMfwLjUg+BimDFWivcETIA/007JxYadXwHPjWz8USoQQ1YsrDbubN+
o3RBNq5Q4U0D
=nbMm
-----END PGP SIGNATURE-----

--1b3755cfd99b64d0a0dda969f37ac993ccdcbb4bdd501bc08f16b6da9e66--
