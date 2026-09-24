Received: from mail-qv2-f31.google.com (mail-qv2-f31.google.com [74.125.230.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F538910F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266599; cv=none; b=eplDmr+2hp59ZG/z7M4fYPgN//oi5hB82il5wjnzKjURH8CuX96eqeOP5Uia21mDPoCQKdNJZKbhGCf68fIkGRy6dUlss6uRG93/pgfsQ+jR0P0BlWdD7EfF2d2tc3aJ0fHLTz6gmrC1en3DhcZ71tllBA98yoJaH875LELSFFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266599; c=relaxed/simple;
	bh=h/Mc3DnI7LfNjyhU40x6a5ht0e04GIAO8atGjdR5AhQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=lhEFYiTYo1KC2y8uuYBv9nlhnjCrNRJtc9NbtdWbonj+ldB/VYlveVC5WIbmHY//4Ar17IL+zzDKFYle0WfhlZzg4M6DNm/6c4V7VSDLIu/Gx4JIqg+lDYLvzv1aRkLFBGsGIaNM4ErEGuXO79i9SsxYc7Wf+VvGJcJGa+Y7AKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bd7bNVQr; arc=none smtp.client-ip=74.125.230.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bd7bNVQr"
Received: by mail-qv2-f31.google.com with SMTP id 6a1803df08f44-91219376dd6so375546d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266596; x=1790871396; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iWigTBtLpsox0Nup25UwaB9x5Gbdt7pmJDm6fm3JuRo=;
        b=Bd7bNVQrUljey69LHHMhjm45cc4J8s0wvR5fachiR19160Wn12fKLlscKRLQ/wUWRe
         Z1MySFB8ivJ0C2C/NubyrfY78EVXQI0OUOPj3dh5qxdjSyQ7AoYan6NOVQLxeLe2256O
         Zmm9IEeW6sAXd5ci8PNgC2G7nc80BREASm30TYENmbrC6MSSdo0b25aPzUb+uM5kECa6
         x7tgviAX2qUdJs4pBeHkXcS3KA1oZUZT+xd+8se8y0paUqgf4QMbz8lyVe9mPq01jY5X
         nQpxp/H6nWXWuln+xmElr75CaK40zPpuDGIdMR4GxxeUQH3phIREWemiankVoK08Jt8l
         LvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266596; x=1790871396;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWigTBtLpsox0Nup25UwaB9x5Gbdt7pmJDm6fm3JuRo=;
        b=aoJE6LB/PmaALJnTU9gXhuuft3XIPAEY055wCsf3RCv+gYN2ZolWCNhjFbuhfu2lOo
         QeuNkod8gCXUMd8xCbdyqfnV3vbH8iTBVU1ce+ZXZbqtWK7UGT1VADqWGT2lC91DpHsx
         FMdjBjzyoG0BMUoUxc4Eabm5acdnbj6iT/ezTUta0gm/TjVN9nvbl7v6UiDEi2YcCqFf
         ha6v1EVWGlW7bEmTceq1Hyvw5gCrUgyH5pYv0YetHEx7uAA1SnCA6EaAy9pE/+ihqklY
         7rRB3V6fbsz5pXYIwu+5dc7+b/B/txqF4EJqPTy4NQkeRB/TElEaneKJzaZkZHDaGlfN
         iUSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGYQz/yEvJxzSkkpTPgpqpfjpEaGZF7hlwY5rO+sbXSQSIYVc0wzERl5tbzOiZQLzgx3y0TV9AqvlEo54=@vger.kernel.org
X-Gm-Message-State: AFuF++k6kerCa2AfzKoNRYr+uSicguRgfQ6iMpHvHcNCb94iwoDB4CdE
	bSCzcEQpWnDV7bFxOQlj3ve8ylxcGmIa6ePLmz09S3PSaiYe4Z80Vpt2
X-Gm-Gg: AYBFou3p6OZyC9pYC3RGlcfyuMdwFRL+WbMwDMuwzfq9RY3/vcUBeUZyj4xcBdsMKdr
	j/2zldkkMJqoN8qOCIP/5WLc/zo91+n5LF/kwkTQ5LZbh5dfjek4OwUFLo8QAsVYQONgyWgUMQ4
	JTOyJECv4pxQ8obRNJh90ke3EDXp5megxNKXZXrgYJutETvQ1BKEq0b/GkbtFoXqF5EVAGHr8bv
	qaAmEwczPqG2eNcDAoAwJhFbAsvmrN8szfwEKrcPVu7t6l+vEiEpg6Du4GG3sIWIob3Mrj2R3oP
	LAIqdFBT3+1t+205o15rDBfwd0TWldn4j3xFkP3RwTwvH72SsdMW4cy9WucXrbioKrM/VrtgIdx
	bnlrl4DDOuL9vpcj+wfzEyJXn5qnQPa4IHjQa+4C3zpf+s12UOnGf2XFgOqsncOiAm8tjTqm483
	5jfw1IE70DPt4sls2A9kg/w2Md8uC1kTZ76SiNl/LQZ8A3Ogui2EzpUWnDPHFRgh/uvCKGXo6Wg
	epTbeCXWKughQ==
X-Received: by 2002:ad4:5c42:0:b0:912:35a6:3bc5 with SMTP id 6a1803df08f44-91421db4eccmr31821946d6.22.1790266595510;
        Thu, 24 Sep 2026 09:16:35 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e25aa56sm19523796d6.23.2026.09.24.09.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 12:16:33 -0400
Message-Id: <DLNOJJD5HT78.FEHRVJW7476B@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <alexanderduyck@fb.com>, <kuba@kernel.org>, <kernel-team@meta.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <hawk@kernel.org>, <john.fastabend@gmail.com>, <sdf@fomichev.me>,
 <dimitri.daskalakis1@gmail.com>, <mohsin.bashr@gmail.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next 2/8] eth: mpnic: add register init for the
 device
From: "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260922-linux-mpnic-v1-2-236844f53072@gmail.com>
 <179021553292.2160803.15849497453510759239@kernel.org>
In-Reply-To: <179021553292.2160803.15849497453510759239@kernel.org>

On Wed Sep 23, 2026 at 10:05 PM EDT, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] pci: missing pci_resource_len() check in mpnic_probe() allows
>   OOB MMIO access
> - [Medium] The 1 MiB Tx buffer is split between MAC and BMC differently
>   in TXB and in TQS.
>
> --
>
> eth: mpnic: add register init for the device
>
> This commit adds one-time CSR initialization to mpnic_probe() through a
> new mpnic_dev_init(). It programs the TXB, RXB, TQS, descriptor SRAM,
> AXI and relaxed ordering settings, starts the on-chip SRAM
> initializations and polls until they complete.
>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_init.c b/drivers/net/=
ethernet/meta/mpnic/mpnic_init.c
>> new file mode 100644
>> index 0000000000000..f8ebb19766731
>> --- /dev/null
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_init.c
>> @@ -0,0 +1,553 @@
>
> [ ... ]
>
>> +/* A total of 1 MiB worth of Tx credits is available, in units of 128 B=
.
>> + * The BMC gets a guaranteed share of them whether or not the host is
>> + * routing anything its way, everything else goes to MAC TC0.
>> + */
>> +#define MPNIC_TXB_BMC_PVT_CRDT_INIT_VAL		800
>> +#define MPNIC_TXB_P0_MAC_PVT_CRDT_INIT_VAL	\
>> +	(SZ_1M / 128 - 2 * MPNIC_TXB_BMC_PVT_CRDT_INIT_VAL)
>
> [ ... ]
>
>> +/* The 1 MiB Tx buffer is partitioned between the MAC and the BMC in un=
its
>> + * of 1 KiB. The BMC portion is fixed at 100 KB.
>> + */
>> +#define MPNIC_TQS_GLBL_TXB_CRDT_BMC	100
>> +#define MPNIC_TQS_GLBL_TXB_CRDT_MAC	(SZ_1M / SZ_1K - \
>> +					 MPNIC_TQS_GLBL_TXB_CRDT_BMC)
>
> [ ... ]
>
>> +static void mpnic_txb_init(struct mpnic_dev *mpd)
>> +{
>> +	int i;
>> +
>> +	mpnic_wr64(mpd, MPNIC_TXB_BMC, MPNIC_TXB_BMC_PVT_CRDT_INIT_VAL);
>> +
>> +	/* Zero the private credits of every traffic class, then hand the
>> +	 * unreserved ones to MAC TC0.
>> +	 */
>> +	for (i =3D 0; i < MPNIC_TXB_P0_CNT; i++)
>> +		mpnic_wr64(mpd, MPNIC_TXB_P0(i), 0);
>> +	mpnic_wr64(mpd, MPNIC_TXB_P0(MPNIC_TXB_TC_IDX_MAC_0),
>> +		   MPNIC_TXB_P0_MAC_PVT_CRDT_INIT_VAL);
>> +	mpnic_wr64(mpd, MPNIC_TXB_P0(MPNIC_TXB_TC_IDX_BMC),
>> +		   MPNIC_TXB_BMC_PVT_CRDT_INIT_VAL);
>
> [ ... ]
>
>> +static void mpnic_tqs_init(struct mpnic_dev *mpd)
>> +{
>
> [ ... ]
>
>> +	/* Only port 0 is used. A single traffic class is in use as well, so
>> +	 * give all of the Tx buffer credits to TC0.
>> +	 */
>> +	mpnic_wr64(mpd, MPNIC_TQS_GLBL_P0_0,
>> +		   FIELD_PREP(MPNIC_TQS_GLBL_P0_0_TXB_MAX_CRDTS_0,
>> +			      MPNIC_TQS_GLBL_TXB_CRDT_MAC));
>> +	mpnic_wr64(mpd, MPNIC_TQS_GLBL_P0_1, 0);
>> +	mpnic_wr64(mpd, MPNIC_TQS_GLBL_BMC,
>> +		   FIELD_PREP(MPNIC_TQS_GLBL_BMC_TXB_MAX_CRDTS,
>> +			      MPNIC_TQS_GLBL_TXB_CRDT_BMC));
>
> [Severity: Medium]
> Do TXB and TQS split the 1 MiB Tx buffer the same way?
>
> On the TXB side, mpnic_txb_init() writes MPNIC_TXB_BMC_PVT_CRDT_INIT_VAL
> (800 x 128 B =3D 100 KiB) to both MPNIC_TXB_BMC and
> MPNIC_TXB_P0(MPNIC_TXB_TC_IDX_BMC). MAC TC0 then gets:
>
>   SZ_1M / 128 - 2 * 800 =3D 6592 credits =3D 824 KiB
>
> On the TQS side, mpnic_tqs_init() programs
> MPNIC_TQS_GLBL_P0_0_TXB_MAX_CRDTS_0 with:
>
>   SZ_1M / SZ_1K - 100 =3D 924 (1 KiB units) =3D 924 KiB
>
> That lets the scheduler use 100 KiB more for TC0 than TXB reserved as
> TC0 private credit.
>
> Suppose TXB_MAX_CRDTS limits how much data the scheduler can have
> outstanding in the TC0 TXB pool. Could a Tx burst that fills TC0 then
> overrun the pool once the Tx datapath is running?
>
> If the BMC only needs a single 100 KiB share, as the TQS comment says,
> does the "2 *" in MPNIC_TXB_P0_MAC_PVT_CRDT_INIT_VAL leave 100 KiB of Tx
> buffer unused?
>
> The TXB comment says "everything else goes to MAC TC0", but the code
> subtracts the BMC share twice, so the two don't match either.
>
> [ ... ]

Will fix in v2.

>
>> diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_pci.c b/drivers/net/e=
thernet/meta/mpnic/mpnic_pci.c
>> --- a/drivers/net/ethernet/meta/mpnic/mpnic_pci.c
>> +++ b/drivers/net/ethernet/meta/mpnic/mpnic_pci.c
>> @@ -108,6 +112,10 @@ static int mpnic_probe(struct pci_dev *pdev, const =
struct pci_device_id *ent)
>>  	pci_set_master(pdev);
>>  	pci_save_state(pdev);
>> =20
>> +	err =3D mpnic_dev_init(mpd);
>> +	if (err)
>> +		goto err_free_mpd;
>> +
>>  	return 0;
>> =20
>>  err_free_mpd:
>>
>
> [Severity: High]
> mpnic_dev_init() reaches much further into BAR 0 than anything the
> driver touched before. Before this patch, the furthest access was
> MPNIC_BDQ_SPARE in mpnic_rd64(). Now the TXB, RXB, RPC, ROF, TOF and
> PEMO_WRAPPER blocks are all programmed.
>
> The highest one is MPNIC_OB_ATTR_RDE_P in mpnic_ro_init(). It is
> 0x9a001a in u32 units, so the writeq() lands at byte offset 0x2680068.
> BAR 0 therefore has to be at least ~38.5 MiB for this sequence to stay
> inside the mapping.
>
> mpnic_probe() maps BAR 0 with pcim_iomap_region(), which accepts
> whatever length the device advertised. Nothing checks
> pci_resource_len(pdev, 0) against the register file the driver is
> about to use. mpnic_wr64() and mpnic_rd64() only test that uc_addr0
> is non-NULL, then add the register index unconditionally.
>
> Suppose a device presents a BAR 0 smaller than that. It could be a
> misconfigured board, or something spoofing this ID behind
> Thunderbolt/USB4. Won't the first out-of-range writeq() in
> mpnic_dev_init() fault on an unmapped address during probe, or
> scribble over whatever happens to be mapped after the BAR?
>
> Could mpnic_probe() reject the device with -ENODEV before calling
> mpnic_dev_init() when pci_resource_len(pdev, 0) is too small? Does the
> hardware have a documented BAR 0 size that could serve as the bound?
> That seems better than deriving one from the highest CSR currently
> defined in mpnic_csr.h, which will keep moving as more blocks are
> added.

I don't believe this is necessary. It doesn't seem that common in
pci based network drivers. In our case, the bar size is static. It will
always be 64MiB for this pci device id.

pw-bot: cr
