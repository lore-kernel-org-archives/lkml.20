Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64D30F52B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952930; cv=none; b=r4LMmr7QWDppRwl/pNrTKzINEjZU56WClQhN4TAgelvDlvIVw9Nn45L/mQKJYCXRMXdYdhxU6MkBsLeXPhY3xGO+/CbyOHhn5+KtGBBGMou5fuf22qWteN/i5ObT7NUjDc5pohHpUnx+3Bqizs8u5JQkh5gCA33ORp4eO07jP28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952930; c=relaxed/simple;
	bh=vL/NAW4pI59cTO2nOfUaBkDeGt8grGQZ57Ks3hj6950=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FjfBT+8rHsJjf4vQgc5ZJmDyivZFCT4LKoyuyt5otcd3MX6wp9dkkULRMvolJwOelk4En5qfy7IAECXYdfgwCFA/BziJmAm6BCudGn8YhP0t6YOqMZPSioO5P6irYyqvaMjZ4UaqqrDERT3SZt/AnBsSBoNpvheHHuVnaDdwK5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=Tx9x/W0E; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="Tx9x/W0E"
DKIM-Signature: a=rsa-sha256; b=Tx9x/W0Ef/V8PJllx8oSJRi1Thykxg/0uSCj159+UMQP8FJSGPpWJyxHoZcgwpgnVnFzb67WWxy74iXguH+fd3m0ynIP7myDimbUFWuexpUZCKWeXHk/pMPmSEA+I5/5Fsrhs/+/GULMGru45HqZt8nwKRn6C7s0l+sutVvPxM5kHMYV22lfpVZ2I5z/uQnrPz2Oede0AaFCibImnZgPaodfrgMjtc6w+6Y2YMIEk0oAYNhpQC9ihtxnf/DvKd7+1lwVaxtNH716pkXNXIL12oumdsUbPM1KvDdDTbVzhneNPNad53VpMzGIrXPPPh3XD+9pNB42f4WN+AkUFPcuiw==; s=purelymail1; d=purelymail.com; v=1; bh=vL/NAW4pI59cTO2nOfUaBkDeGt8grGQZ57Ks3hj6950=; h=Feedback-ID:Received:Received:From:To:Subject:Date;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1831802679;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 02 Oct 2026 14:55:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1xCefE-00000009Cqd-0WvU;
	Fri, 02 Oct 2026 16:55:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Peter Korsgaard
 <jacmet@sunsite.dk>,  Arnd Bergmann <arnd@arndb.de>,
  linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: c67x00: fix uninitialized data access
In-Reply-To: <20261002124558.3495203-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Fri, 2 Oct 2026 14:45:46 +0200")
References: <20261002124558.3495203-1-arnd@kernel.org>
Date: Fri, 02 Oct 2026 16:55:08 +0200
Message-ID: <871pa8rw37.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

>>>>> "Arnd" == Arnd Bergmann <arnd@kernel.org> writes:

 > From: Arnd Bergmann <arnd@arndb.de>
 > Randconfig builds for s390 using gcc-10.5 revealed that the
 > c67x00_ll_husb_init_host_port() writes bogus data into the
 > registers:

 > drivers/usb/c67x00/c67x00-ll-hpi.c: In function 'c67x00_ll_husb_init_host_port':
 > drivers/usb/c67x00/c67x00-ll-hpi.c:288:3: error: '*(u16 *)((char *)&data+-452)' is used uninitialized in this function [-Werror=uninitialized]
 >   288 |   hpi_write_word(dev, COMM_R(i), data->regs[i]);
 >       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 > I have not seen this error before, but the compiler is clearly correct
 > and the bug has been in the driver since it was added in 2008.
 > This particular build has CONFIG_INIT_STACK_NONE=y and CONFIG_UBSAN=y,
 > but I don't think that alone is sufficient to find the bug.

 > Change this to write zeroes instead, which may still not be what
 > is intended but at least avoids the undefined behavior and the
 > warning about it.

Sorry, I don't have access to the documentation anymore :/


 > Fixes: e9b29ffc519b ("USB: add Cypress c67x00 OTG controller HCD driver")
 > Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Peter Korsgaard <peter@korsgaard.com>

I wonder if we have any users anymore? I have myself not have access to
any platforms with this cypress controller for the last 10+ years or so,
so maybe the driver should just be dropped?


> ---
 >  drivers/usb/c67x00/c67x00-ll-hpi.c | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/drivers/usb/c67x00/c67x00-ll-hpi.c b/drivers/usb/c67x00/c67x00-ll-hpi.c
 > index 7a214a3a6cc7..3825552dc024 100644
 > --- a/drivers/usb/c67x00/c67x00-ll-hpi.c
 > +++ b/drivers/usb/c67x00/c67x00-ll-hpi.c
 > @@ -306,7 +306,7 @@ void c67x00_ll_set_husb_eot(struct c67x00_device *dev, u16 value)
 >  static inline void c67x00_ll_husb_sie_init(struct c67x00_sie *sie)
 >  {
 >  	struct c67x00_device *dev = sie->dev;
 > -	struct c67x00_lcp_int_data data;
 > +	struct c67x00_lcp_int_data data = {};
 >  	int rc;
 
 >  	rc = c67x00_comm_exec_int(dev, HUSB_SIE_INIT_INT(sie->sie_num), &data);
 > -- 

 > 2.53.0


-- 
Bye, Peter Korsgaard
