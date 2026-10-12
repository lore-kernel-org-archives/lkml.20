Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BC047DD6A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814605; cv=none; b=KRzfnzG6cDs+ifQZe9VgZvVz/9XqNiSD4/IBXSid8eX2JFX8Pflh9uNCS6RPzy9/RjVp3zskCw3Ed0ZfA8BnBgx8FWjohe4F0FGBu/EKV+LamBNEYp69alCtmTu+LRFzRqhTlGfzWeO00ewOunPDp/RE9OCTDTnyCLnSz63OdEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814605; c=relaxed/simple;
	bh=shmolJxvI3RFleQ+crYUcs8/qC3TjBJhcdJjT+VCboI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMi3kQeL1jIF1VOiDCwBj9xs3yjdzKNqmUqSFCo8GAuFAdnTTG/S61ZdWNTGWHzy4waXj95S+ViWHLl/7VsUMH92FdC2MxSCCFD8SaBM8lRkqU6rCqpzMorVSv0PQF4dzW4rpZ6ok3DNBClci6MtN+/BR8707+i3ADBaQ4+JxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DtHDBal2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oHKd88Xf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DtHDBal2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oHKd88Xf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791814602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ae0YyaBMRBi9QvMtuCD5/ZgDBRqhVmjNOSyXkR59Fsc=;
	b=DtHDBal2TcbY3x48zZQ2fODPURa6Snyw3VCVVF5mc+QLbmkew6d1r0dEdZpve0vD2Y3XNZ
	Q3ZTDz0dsj+FadMGvX5vtjb89t7wb/c8TiUGZPpbalu+KZY1lfGSWXPNmlKKgR4OWicFb9
	ZyTyB4a9IrF58+mVftpzvvtvBlW9Ass=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-th5W4GSoOyWqsOSDgpnVWg-1; Mon, 12 Oct 2026 14:16:35 +0000
X-MC-Unique: th5W4GSoOyWqsOSDgpnVWg-1
X-Mimecast-MFC-AGG-ID: th5W4GSoOyWqsOSDgpnVWg_1791814593
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso23775935e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791814593; x=1792419393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ae0YyaBMRBi9QvMtuCD5/ZgDBRqhVmjNOSyXkR59Fsc=;
        b=oHKd88XfEsFMdU8xqoTQL3gKLdZ1RHWqf/TOGwdH4PB1lVb56Rta5eD4Ne0/yRxey+
         e3Wnkwt2ly7NZfMSBR7kFEi6EXAeiiAbzxijQBN58unWZTtReS/PUeilOtijAcnzDL8n
         jR2Cw6Vw4dh64wjAyZhYciJW73fDK+oSyxeBdffiTDa4kuZRenzd9cEQFsjFRlr683Bc
         r2FTTw7n+gQ9GB8sLyyoMglOFjM+tgMpAAxswXhP37GUY7mkexkPVGnT/sYTecqqb6VQ
         W5AIoxAqQJWT2iRiR3NaYScAZo+6XigllSV+E+ZKMdnYdWSxcL00kAsYSOJUliYE8Ieh
         wnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814593; x=1792419393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ae0YyaBMRBi9QvMtuCD5/ZgDBRqhVmjNOSyXkR59Fsc=;
        b=ElzZsgmL2pXD0KnkQjKOvRT8aVbdRsEEoq0v6ABvERgsskmXJAXUKXb1V9EdzKw/ee
         90tszzg8LH+ol6e2BvNAH3HO/nqvkfIrhAj48ZDZmE7Et8r/IfNu732jCJOYkYa7FXN8
         5XrQc7OHATLLE5VllYRtmSmMnFhg+aI1B1AAttx0rGKeKrxSVQzfLYN8ncWa9XeulpbD
         SzyIhdMxrLM5Q3xa97KAjvDw7DxkxWvCkwc0VVTNsRJiOmyveRk8Zl8PoZcsW5Xg8Etb
         OIhejQswvgseJ/NmOTn3DM0CFsQAh/+1OugRKEeuiq9XSy/80lX6BpCcE6DMsH4CYfQ2
         joHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJYLbt3/RUhdFbKpMHekUW29DL6jyHWVJtMkH3GtbnG100MGELOPLPlxotaohYCkT5yNgAS4SQuoiSx3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtMx2SRFm3FssTzsI8wuzizIfHpPY3IdSLooxNIDMYRW4FOpd5
	svyEb3FRiP67zz3zN9mgh0cCjGAKtxeRWWVwyJEkzeshkPx2VPaAdIkdc4v0wdQHZuFMyXY8FDW
	nVB9uM08ZNmFLK58UwomKx3VyPAvDTb3MpDYe5IE6ZANsS8kNReTuh75aj2wZqmVYcA==
X-Gm-Gg: AYBFou1dmbfPssuj2niE+MljkSWuZn8LJxkC51CvqJvC5+UnbTTVCLMHFUylmNeL7TR
	ZdkqiMdkB6+2aTqqaeCt9AvJVBle40eWb08DzMGLfl5+xkCEvlxjreS1NaMO9cmiZ2sRfhdFqnm
	bI1Zko4D7Q261xVOK1ozyws27eoHAjf1/OCKIrMQkLWjfQX+2yja3/43sgmNeDgqDNc0G4aosyW
	rNi7v8Yc2KMi30IqrcY40fYW1umxmwQXp5HOvNlxPBooZmqbXipRXYkanXLhAWYX8hIJWqxDl4K
	M5elv++h7QJ0U3Yo9mj0C6pX2njdc4yF0gIF0WUfQHhxzo9bA5hIOXwtAzCanxa5N8/4gY6kAPB
	j/BM=
X-Received: by 2002:a05:600c:620e:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a18e4b2aebmr194094755e9.16.1791814593116;
        Mon, 12 Oct 2026 07:16:33 -0700 (PDT)
X-Received: by 2002:a05:600c:620e:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4a18e4b2aebmr194094035e9.16.1791814592552;
        Mon, 12 Oct 2026 07:16:32 -0700 (PDT)
Received: from sgarzare-redhat ([94.32.38.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dcd7dd3sm186331845e9.2.2026.10.12.07.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:16:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:16:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-integrity@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Stuart Yoder <stuart.yoder@arm.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Chu Guangqing <chuguangqing@inspur.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tpm_crb: Remove dead code from crb_map_res()
Message-ID: <aszqTFP9fTZg_gXa@sgarzare-redhat>
References: <20261010235500.2915629-1-jarkko@kernel.org>
 <asy0K_6VkuAn9rTB@sgarzare-redhat>
 <aszhPcubTH8HKxh2@kernel.org>
 <aszmcDeBBIJ5zvPw@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aszmcDeBBIJ5zvPw@kernel.org>

On Mon, Oct 12, 2026 at 04:53:52PM +0300, Jarkko Sakkinen wrote:
>On Mon, Oct 12, 2026 at 04:31:45PM +0300, Jarkko Sakkinen wrote:
>> On Mon, Oct 12, 2026 at 12:23:05PM +0200, Stefano Garzarella wrote:
>> > On Sun, Oct 11, 2026 at 02:54:57AM +0300, Jarkko Sakkinen wrote:
>> > > In all the pre-existing call sites both @iomem and @iobase_ptr are either
>> >
>> > Do you mean @iores ?
>> >
>> > > both NULL or have a valid address.
>> > >
>> > > Add an invariant for the expeced conditions and remove a dead basic block.
>> > > The second block is dead given that if @iomem turns out not to be NULL,
>> > > neither can't be @iobase_ptr.
>> > >
>> > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>> > > ---
>> > > v2:
>> > > - Updated the commit message in order to clarify things better.
>> > > - Updated the invariant in order to address checkpatch.pl --strict
>> > >   errors.
>> > >  drivers/char/tpm/tpm_crb.c | 9 +++------
>> > >  1 file changed, 3 insertions(+), 6 deletions(-)
>> > >
>> > > diff --git a/drivers/char/tpm/tpm_crb.c b/drivers/char/tpm/tpm_crb.c
>> > > index ceb4100ba400..833226966fa2 100644
>> > > --- a/drivers/char/tpm/tpm_crb.c
>> > > +++ b/drivers/char/tpm/tpm_crb.c
>> > > @@ -570,15 +570,12 @@ static void __iomem *crb_map_res(struct device *dev, struct resource *iores,
>> > >  	if (start != new_res.start)
>> > >  		return IOMEM_ERR_PTR(-EINVAL);
>> > >
>> > > +	if (!iores != !iobase_ptr)
>> > > +		return IOMEM_ERR_PTR(-EINVAL);
>> > > +
>> > >  	if (!iores)
>> > >  		return devm_ioremap_resource(dev, &new_res);
>> > >
>> > > -	if (!*iobase_ptr) {
>> >
>> > Sorry to insist, but in the commit description we talk about @iobase_ptr
>> > can't be null, and I agree, but here we were checking the value of the
>> > pointer, so IMO this code was not dead.
>> >
>> > But again, I know nothing on this code. So, if you think it's correct go
>> > head, I'm surely missing something.
>>
>> Ugh, you're actually right, and this is not, and should not have sent
>> this. And it is for lazy init.

Yeah, a lazy init makes sense.

>>
>> I need to sanity check my test environment because I thought I was
>> testing this with swtpm emulated tpm_crb but tests passed, and this
>> should not work.
>>
>> Sorry and thanks :-)

You're welcome!

>>
>> Just wanted to make it explicit that I was making somehting extremely
>> stupid.

Don't beat yourself up, it happens to all of us! Thanks for taking the 
time to check and clarify!

>
>Probably too much multitasking lately with all these bugs.
>
>Lessons learned is that from now on I keep my own contributions
>and reviewing in separate sessions. Things have gotten much
>busier than they used to be so need to adapt and learn how
>to have focus on all actitivies :-)

Yeah, it's something that's happening here too, and it's a real pain to 
deal with! :-(

Thanks,
Stefano

