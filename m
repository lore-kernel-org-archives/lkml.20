Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025112;
	b=1FmxTzzmSmiSn+71Gd+W62MzJ1svepElsAiDroLIPfdLZUcY3F/IQeSqKC7ZN2yXB/wc
	 TZ8M1LrCtLgDBC9paDb6wqRxagZTUZ3JKDJopx4Zp/GGV+5nPtTuNSe/UDc3CaLKUYroo
	 jCu+c2Dve1SbddFmawUEHZOOVpQ/epcza5viLEPjpMvEy/olScxOEq1w9AjqhTabHXDLl
	 13d2lf9bs0YHZhHQNyJZfqQ82UNnXeprGjQq/oBQ4IVRsRmyJCQWU1P1/bnVcTWbJk557
	 yPl+8mNqLduEUJp28/tOfcmgb/WEvx5J/f6fLK8oo07oZXMV1YHGcg/po0vYaM0MyEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025112;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ZiX297agFJcw9x+1w1o4OJlEKr6G9EH8r3TllI028Gc=;
	b=P/7ujJzrePU6bohnQ/gx0D6zJd7XGS8DXcdwVFbqEaaW1Bp7AYjCtDpv0hfg3YtFe1ts
	 zhiNxFZqEC1Kkehc1Qg+m5Eh44duEqzdxw7X+T9MvHssOgiv40Nmc9OEws/6iDDwvNckI
	 GeFDuoRBqKmE0+WH0B0VBCon9g4DYMIcyR+6f9PlxGLvuQdDmMund5YY3xxTS6G0X7GkT
	 CeHVeUo0shRrLGrom5KesdJzeKZx1cbBwJGeBzFWSXUOxMAW4MpV1lhn5NO1CzoWt5O5u
	 kmsA1oOVSBW0nkccjKiTIq5yxLgtwKT9SNEax03rEMQP+dLI2Pv2uBssCOZGxZknS7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyxdnlZe;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="bdu/0UZY";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38706606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38706606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iyxdnlZe;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=bdu/0UZY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793025111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZiX297agFJcw9x+1w1o4OJlEKr6G9EH8r3TllI028Gc=;
	b=iyxdnlZeYs8KkIC+TtIQP4IGlk2NtbiuanD/6FRy7dZAQ8oeudKhoiLjwxwnKlgQxNskri
	o47i+jm1kGaSC8mTbUMnJVuWO9w82bXMrcPXMyHhuIcn7RDmybyMHjlvolxpkHnv/9bAM4
	su2flYSfWcNth4oxVaY3kOmMRVKbhQw=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-heWgRkskNIOM8K3lZFQslA-1; Mon, 26 Oct 2026 10:31:41 -0400
X-MC-Unique: heWgRkskNIOM8K3lZFQslA-1
X-Mimecast-MFC-AGG-ID: heWgRkskNIOM8K3lZFQslA_1793025101
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so8979325eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793025100; x=1793629900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZiX297agFJcw9x+1w1o4OJlEKr6G9EH8r3TllI028Gc=;
        b=bdu/0UZYC6QFO4U4jYHw1bj0OzvbAERisxt2DrkA80dKv1/8Q9bnkXq2+tFqVdSPKh
         uinkULns8zUiKTiFPP+mcq7DVda0kpG7jDHvyE3XZzb00fWFBHhccI8DHw/BMMvlJRON
         yNVFcY9iwF6wxrR3Xyp8f24XRtGE1t9fQVW2O9HnnsE12bC2fBERvMF2tBKplVdUZ+mA
         7CMOfRLBTiBJjqjiuIXWNR4Dt1SlZvPbgW9uUG5HDeR2FI8K61LSmytyVrvcvxh1HWF/
         SDvxtkz9bGxuI3id4fZ3E6+Vlax9vFSR4NMqO7OQ+/5sch4syjm1bQbNjIohZGay25sE
         JZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025100; x=1793629900;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZiX297agFJcw9x+1w1o4OJlEKr6G9EH8r3TllI028Gc=;
        b=XAjA/q/4MViu3LeRws8tkK8BeLwOnhqmGaMudNeulJgK1un55Xs1+rYTpKAOFLyjpb
         eKahGroleFhhw/8WVSYeCkSTdMxhxzrf84mHFVWDadOwDSBqzauBfgwpHD9Xk7Cg8zjS
         fsGbMVI7es2kbWSap2ck+g3Z9Qri6f7hxaXanSK5He0DPshZNMPzhalF4peNUroeyIDN
         F4wzd/mgqwYB4ubaCpxMHDjKzLkHVxx+ktHY7UxWFfD5ZLEa4+F2KcFy4bt0VCg9c/15
         CxGpxe8bJegC/3aMkwOCcjlYrtrNoGmffv6nqhTyI76nPL5DKY5/tZxh7iKJovpo3S4A
         Q1+w==
X-Gm-Message-State: AFq9FYJ3ZHKOvBcB2hwF3u50PNn4DXwyPPh6BvpnLX2tL4tQV9LtABv3
	ZyLr/XgVN93BAY2WREdyo+OiV03xI77j+aYJqCKwt3OorZInwIPTwLHAoPVb+cy8IbC/ZO7qrQ6
	pzrbM3Y+f26Ni0AI9X4BgofJ0crJEvj42g9WZZGFgUwAtn6tPM5spqx1mewhiq1pgKA==
X-Gm-Gg: AYBFou0DRQOEhaLIQp4Ia9xckTC8+klfG+Cu3Wv5+YW0WCk+gqeZrubVQu1MZLLo92E
	dG6ixLr1J1QUFlqli2uKKYH15hGUH62zDnxYgdnW9oepOC3J8b8pELpDJskHV/nIUpDipqXMV8/
	5uEFvyYTvbphtIys+i2nFZkiXgzyUtno0k0KNzttIgGYE+cKxs4vfpClDntgfTXUYNTXY7CDlXc
	xLbkI+v8YZNlJ0EP1mC20RrB7EaR1UyfaCpGVoeAHBYAV4Fx0kSYMtLNMlu5CbyvidOOuTQL05Y
	VVRRmUko/sOYApVor644gVP4/FV5AQZefgXOA84w94rgpzNmzLkT4x01jdvzid+7aQ==
X-Received: by 2002:a05:7300:d086:b0:34b:b410:9352 with SMTP id 5a478bee46e88-369e8319cadmr10005459eec.1.1793025100197;
        Mon, 26 Oct 2026 07:31:40 -0700 (PDT)
X-Received: by 2002:a05:7300:d086:b0:34b:b410:9352 with SMTP id 5a478bee46e88-369e8319cadmr10005425eec.1.1793025099273;
        Mon, 26 Oct 2026 07:31:39 -0700 (PDT)
Received: from fedora ([49.47.195.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm48542277eec.23.2026.10.26.07.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:31:38 -0700 (PDT)
Date: Mon, 26 Oct 2026 20:01:32 +0530
From: Arun Menon <armenon@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 6/6] tpm_crb: Implement command and response chunking
 logic
Message-ID: <at9kRNac6oe_txwZ@fedora>
References: <20261025201859.221991-1-armenon@redhat.com>
 <20261025201859.221991-7-armenon@redhat.com>
 <at57uzLtUZ4z97LL@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at57uzLtUZ4z97LL@kernel.org>

Hi Jarkko,
Thank you for the detailed feedback.

On Sun, Oct 25, 2026 at 11:59:23PM +0200, Jarkko Sakkinen wrote:
> On Mon, Oct 26, 2026 at 01:48:58AM +0530, Arun Menon wrote:
> > From: Arun Menon <armenon@redhat.com>
> > 
> > With the introduction of support for Post Quantum Cryptography
> > algorithms in TPM, the commands and responses will grow in size.
> > Some TPMs have a physical hardware memory window (MMIO) that is
> > smaller than the commands we need to send.
> 
> That is too loose scope, and its truth value will be degrading as time
> moves forward.
> 
> Here's what I think about the topic and would look up:
> 
> 1. TCG has defined this in a spec. I would point out the spec and
>    section(s), and optionally also date when it was published (like
>    "09/2025" or "Spring of 2024", nothing more granular than this).

Sure, I will add the spec detail, citing the TPM PC Client PTP (Platform
TPM Profile) with section number and date.

> 2. PQC will be probably a thing across the whole chip industry.
>    This is why we need to support it not because of some random
>    buffer shenanigans, right?
> 3. "Some TPMs" is inaccurate statement in a wrong way. I would be
>    inaccurate too but how I would simplify the topic  would come
>    from an utilitirian angle.

yes, I understand. Any CRB TPM that gets the updated PQC-sized payloads
will hit the same MMIO-window limit.

> 
>    Regardless what future holds i.e., I would represent the set
>    of PQC enabled TPMs and the set of chunking enabled TPMs as they
>    were the same set. This type of self-deception is what engineering
>    really is all about, overall ;-)

yes, its a PQC transition generally. I will mention that.

> 
> Those are my verbose remarks or how I model this situation, which
> would synthesize into maybe 2-4 not that long sentences.
> 
> > Therefore this commit
> > implements the core logic of sending/receiving data in chunks.
> 
> I would remove this sentence because it has no utilitirian use and
> does not make anyone smarter, other than you get the feeling that
> "I should probably pretend that I know what the chunks are".

yes, will remove this line.

> 
> Add a short paragrap tell us what the heck they are reference to
> section is great but putting the concept in nutshell without having
> to immediately peak at it would be great.
> 
> > 
> > Instead of sending the whole command at once, the driver now sends it in
> > small chunks. After each chunk, it signals the TPM using a nextChunk
> 
> This is a bit loose form of expression and I'm not fan of qualitative
> size definitions.
> 
> Example: "Send the command split into chunks."
> 
> That's really all information content of the first sentence.
> 
> > signal, and waits for the TPM to consume the data. Once the final piece
> > is delivered, the driver signals the TPM to begin execution by toggling
> > the start invoke bit. We use the same logic in reverse to read large
> > responses from the TPM.
> 
> This is abstracting and encapsulating the meat of the code change.
> 
> Remarks:
> 
> - The list of the added constants.
yes, will add them
> - Speak how the CRB registers are used.
yes.
> - Stuff is heavily moved around but I don't see anything that would
>   help me to understand the reorg part. This is important because
>   that gives better map to navigate and check if this patch
>   could be split (I don't know yet).

I will split the 6th patch in to 2. The preparation patch will put the
existing crb_send()/crb_recv() into
tpm_crb_send_no_chunks()/tpm_crb_recv_no_chunks().

Also, I will forward declare tpm_crb_start() (required by 
tpm_crb_recv_chunks()) so that the diff is clean.

> - Go through each location where use the word "signal". It's used
>   like a solution encapsulator.

I will explain the use of registers briefly. The registers were
introduced in a former patch.

> 
> When asked this much details and stuff I personally can recommend
> more imperative writing style (see the examples). It has friction
> because you can move sentence forward only when you get.
> 
> > 
> > This allows the driver to handle large payloads even when the hardware
> > interface has limited memory. This kernel-side support corresponds to
> > the backend implementation in QEMU [1]. QEMU reassembles the chunks
> > before passing them to the TPM emulator.
> > 
> > [1] https://lore.kernel.org/qemu-devel/20260506075813.120781-1-armenon@redhat.com/
> > 
> > Signed-off-by: Arun Menon <armenon@redhat.com>
> > ---
> >  drivers/char/tpm/tpm_crb.c | 215 +++++++++++++++++++++++++++++--------
> >  1 file changed, 173 insertions(+), 42 deletions(-)
> > 
> > diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
> > index 31f530744e90..8b2aaa109fc4 100644
> > --- a/drivers/char/tpm/tpm_crb.c
> > +++ b/drivers/char/tpm/tpm_crb.c
> > @@ -105,11 +105,13 @@ struct crb_priv {
> >  	u8 __iomem *cmd;
> >  	u8 __iomem *rsp;
> >  	u32 cmd_size;
> > +	u32 rsp_size;
> >  	u32 smc_func_id;
> >  	u32 __iomem *pluton_start_addr;
> >  	u32 __iomem *pluton_reply_addr;
> >  	u8 ffa_flags;
> >  	u8 ffa_attributes;
> > +	u32 intf_id;
> >  };
> >  
> >  struct tpm2_crb_smc {
> > @@ -369,38 +371,6 @@ static u8 crb_status(struct tpm_chip *chip)
> >  	return sts;
> >  }
> >  
> > -static int crb_recv(struct tpm_chip *chip, u8 *buf, size_t count)
> > -{
> > -	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
> > -	unsigned int expected;
> > -
> > -	/* A sanity check that the upper layer wants to get at least the header
> > -	 * as that is the minimum size for any TPM response.
> > -	 */
> > -	if (count < TPM_HEADER_SIZE)
> > -		return -EIO;
> > -
> > -	/* If this bit is set, according to the spec, the TPM is in
> > -	 * unrecoverable condition.
> > -	 */
> > -	if (ioread32(&priv->regs_t->ctrl_sts) & CRB_CTRL_STS_ERROR)
> > -		return -EIO;
> > -
> > -	/* Read the first 8 bytes in order to get the length of the response.
> > -	 * We read exactly a quad word in order to make sure that the remaining
> > -	 * reads will be aligned.
> > -	 */
> > -	memcpy_fromio(buf, priv->rsp, 8);
> > -
> > -	expected = be32_to_cpup((__be32 *)&buf[2]);
> > -	if (expected > count || expected < TPM_HEADER_SIZE)
> > -		return -EIO;
> > -
> > -	memcpy_fromio(&buf[8], &priv->rsp[8], expected - 8);
> > -
> > -	return expected;
> > -}
> > -
> >  static int crb_do_acpi_start(struct tpm_chip *chip)
> >  {
> >  	union acpi_object *obj;
> > @@ -472,17 +442,71 @@ static int tpm_crb_start(struct tpm_chip *chip, u32 start_cmd)
> >  	return rc;
> >  }
> >  
> > +static int tpm_crb_send_no_chunks(struct tpm_chip *chip, u8 *buf, size_t len)
> > +{
> > +	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
> > +	int rc;
> > +
> > +	memcpy_toio(priv->cmd, buf, len);
> > +
> > +	/* Make sure that cmd is populated before issuing start. */
> > +	wmb();
> > +
> > +	rc = tpm_crb_start(chip, CRB_START_INVOKE);
> > +	if (rc)
> > +		return rc;
> > +
> > +	return crb_try_pluton_doorbell(priv, false);
> > +}
> > +
> > +static int tpm_crb_send_chunks(struct tpm_chip *chip, u8 *buf, size_t len)
> > +{
> > +	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
> > +	size_t offset = 0;
> > +	size_t chunk_size;
> > +	int rc;
> > +
> > +	while (offset < len) {
> > +		chunk_size = min_t(size_t, len - offset, priv->cmd_size);
> > +
> > +		if (chunk_size == 0)
> > +			break;
> > +
> > +		memcpy_toio(priv->cmd, buf + offset, chunk_size);
> > +		offset += chunk_size;
> > +
> > +		/* Make sure that cmd is populated before issuing start. */
> > +		wmb();
> > +		if (offset < len) {
> > +			rc = tpm_crb_start(chip, CRB_START_NEXT_CHUNK);
> > +			if (rc)
> > +				return rc;
> > +			if (!crb_wait_for_reg_32(&priv->regs_t->ctrl_start,
> > +									 CRB_START_NEXT_CHUNK, 0,
> > +									 TPM2_TIMEOUT_C)) {
> 
> I'd split these calls into two lines:
> 
> 	expired = !crb_wait_for_reg_32( ... );
> 	if (expired) {
> 
> 
> 

yes will do it.

> > +				dev_err(&chip->dev,
> > +						"Timeout waiting for backend to consume chunk\n");
> > +				return -ETIME;
> > +			}
> > +		} else {
> > +			rc = tpm_crb_start(chip, CRB_START_INVOKE);
> > +			if (rc)
> > +				return rc;
> > +		}
> > +	}
> > +
> > +	return crb_try_pluton_doorbell(priv, false);
> > +}
> >  static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
> >  {
> >  	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
> > -	int rc = 0;
> >  
> >  	/* Zero the cancel register so that the next command will not get
> >  	 * canceled.
> >  	 */
> >  	iowrite32(0, &priv->regs_t->ctrl_cancel);
> >  
> > -	if (len > priv->cmd_size) {
> > +	if (len > priv->cmd_size && !(priv->intf_id & CRB_INTF_CAP_CRB_CHUNK)) {
> >  		dev_err(&chip->dev, "invalid command count value %zd %d\n",
> >  			len, priv->cmd_size);
> >  		return -E2BIG;
> > @@ -492,16 +516,115 @@ static int crb_send(struct tpm_chip *chip, u8 *buf, size_t bufsiz, size_t len)
> >  	if (priv->sm == ACPI_TPM2_COMMAND_BUFFER_WITH_PLUTON)
> >  		__crb_cmd_ready(&chip->dev, priv, chip->locality);
> >  
> > -	memcpy_toio(priv->cmd, buf, len);
> > +	if (len <= priv->cmd_size)
> > +		return tpm_crb_send_no_chunks(chip, buf, len);
> >  
> > -	/* Make sure that cmd is populated before issuing start. */
> > -	wmb();
> > +	return tpm_crb_send_chunks(chip, buf, len);
> > +}
> >  
> > -	rc = tpm_crb_start(chip, CRB_START_INVOKE);
> > -	if (rc)
> > -		return rc;
> > +static int tpm_crb_recv_no_chunks(struct tpm_chip *chip, u8 *buf, size_t count)
> > +{
> > +	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
> > +	unsigned int expected;
> >  
> > -	return crb_try_pluton_doorbell(priv, false);
> > +	/* Read the first 8 bytes in order to get the length of the response.
> > +	 * We read exactly a quad word in order to make sure that the remaining
> > +	 * reads will be aligned.
> > +	 */
> 
> When moving code not heavy mods should be done but we can fix this
> cosmetic glitch from the block comments at least.
> 
> > +	memcpy_fromio(buf, priv->rsp, 8);
> > +
> > +	expected = be32_to_cpup((__be32 *)&buf[2]);
> > +	if (expected > count || expected < TPM_HEADER_SIZE)
> > +		return -EIO;
> > +
> > +	memcpy_fromio(&buf[8], &priv->rsp[8], expected - 8);
> > +
> > +	return expected;
> > +}
> > +
> > +static int tpm_crb_recv_chunks(struct tpm_chip *chip, u8 *buf, size_t count,
> > +							   unsigned int expected)
> > +{
> > +	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
> > +	size_t offset = 0;
> > +	size_t chunk_size;
> > +	size_t first_read;
> > +	int rc;
> > +
> > +	if (expected > count)
> > +		return -EIO;
> > +	/*
> > +	 * Set chunk_size by comparing the size of the buffer that the upper
> > +	 * layer has allocated (count) to the hardware tpm limit (priv->rsp_size).
> > +	 * This is to prevent buffer overflow while writing to buf.
> > +	 */
> > +	chunk_size = min_t(size_t, count, priv->rsp_size);
> > +	if (chunk_size < 8)
> > +		return -EIO;
> > +
> > +	memcpy_fromio(buf, priv->rsp, 8);
> > +
> > +	/*
> > +	 * Compare the actual size of the response we found in
> > +	 * the header to the chunk size
> > +	 */
> > +	first_read = min_t(size_t, expected, chunk_size);
> > +
> > +	memcpy_fromio(&buf[8], &priv->rsp[8], first_read - 8);
> > +	offset = first_read;
> > +
> > +	while (offset < expected) {
> > +		rc = tpm_crb_start(chip, CRB_START_NEXT_CHUNK);
> > +		if (rc)
> > +			return rc;
> > +
> > +		if (!crb_wait_for_reg_32(&priv->regs_t->ctrl_start,
> > +								 CRB_START_NEXT_CHUNK, 0,
> > +								 TPM2_TIMEOUT_C)) {
> > +			dev_err(&chip->dev, "Timeout waiting for backend response\n");
> > +			return -ETIME;
> > +		}
> > +
> > +		chunk_size = min_t(size_t, expected - offset, priv->rsp_size);
> > +		memcpy_fromio(buf + offset, priv->rsp, chunk_size);
> > +		offset += chunk_size;
> > +	}
> > +
> > +	return expected;
> > +}
> > +
> > +static int crb_recv(struct tpm_chip *chip, u8 *buf, size_t count)
> > +{
> > +	struct crb_priv *priv = dev_get_drvdata(&chip->dev);
> > +	unsigned int expected;
> > +
> > +	/* A sanity check that the upper layer wants to get at least the header
> > +	 * as that is the minimum size for any TPM response.
> > +	 */
> > +	if (count < TPM_HEADER_SIZE)
> > +		return -EIO;
> > +
> > +	/* If this bit is set, according to the spec, the TPM is in
> > +	 * unrecoverable condition.
> > +	 */
> > +	if (ioread32(&priv->regs_t->ctrl_sts) & CRB_CTRL_STS_ERROR)
> > +		return -EIO;
> > +
> > +	/*
> > +	 * Peek at the first 8 bytes to determine the response size
> > +	 */
> > +	expected = be32_to_cpup((__be32 *)&priv->rsp[2]);
> > +
> > +	if (expected <= priv->rsp_size)
> > +		return tpm_crb_recv_no_chunks(chip, buf, count);
> > +
> > +	if (!(priv->intf_id & CRB_INTF_CAP_CRB_CHUNK)) {
> > +		dev_err(&chip->dev,
> > +			    "Response larger than MMIO and chunking not supported\n");
> > +		return -EIO;
> > +	}
> > +
> > +	return tpm_crb_recv_chunks(chip, buf, count, expected);
> >  }
> >  
> >  static void crb_cancel(struct tpm_chip *chip)
> > @@ -728,6 +851,12 @@ static int crb_map_io(struct device *dev, struct crb_priv *priv,
> >  		goto out;
> >  	}
> >  
> > +	if (priv->regs_h)
> > +		priv->intf_id = ioread32((u32 __iomem *)&priv->regs_h->intf_id);
> > +
> > +	if (priv->intf_id & CRB_INTF_CAP_CRB_CHUNK)
> > +		dev_info(dev, "CRB Chunking is supported by backend\n");
> > +
> >  	memcpy_fromio(&__rsp_pa, &priv->regs_t->ctrl_rsp_pa, 8);
> >  	rsp_pa = le64_to_cpu(__rsp_pa);
> >  	rsp_size = ioread32(&priv->regs_t->ctrl_rsp_size);
> > @@ -765,8 +894,10 @@ static int crb_map_io(struct device *dev, struct crb_priv *priv,
> >  	priv->rsp = priv->cmd;
> >  
> >  out:
> > -	if (!ret)
> > +	if (!ret) {
> >  		priv->cmd_size = cmd_size;
> > +		priv->rsp_size = rsp_size;
> > +	}
> >  
> >  	__crb_go_idle(dev, priv, 0);
> >  
> > -- 
> > 2.54.0
> > 
> 
> Let's take this easy as it can land earliest v7.5. It would be hard
> to miss that deadline so polishing all the details is the best way
> to go.

I agree. Thanks again.

> 
> Br, Jarkko
> 

Regards,
Arun Menon

